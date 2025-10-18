#!/usr/bin/env python3
"""
验证sft_model_pddl_mistral_7b_pddl_mix_planning_results文件夹下的解决方案
使用Validate验证器检查每个.soln文件的有效性
"""
import os
import subprocess
import json
from pathlib import Path
from typing import Dict, Tuple, Optional, List
from datetime import datetime

def find_domain_file(
    problem_file: str,
    scenario: str,
    domain_override: Optional[str] = None,
) -> Optional[str]:
    """根据问题文件找到对应的domain文件，支持可选覆盖路径"""
    problem_path = Path(problem_file)
    problem_dir = problem_path.parent

    domain_candidates: List[Path] = []

    if domain_override:
        expanded = domain_override.format(scenario=scenario, problem=problem_path.stem)
        override_path = Path(expanded)
        if override_path.is_file():
            domain_candidates.append(override_path)
        elif override_path.is_dir():
            for name in ("domain.pddl", "domain3.pddl"):
                candidate = override_path / name
                if candidate.exists():
                    domain_candidates.append(candidate)
            # 兜底尝试目录下的第一个 domain*.pddl
            if not domain_candidates:
                matches = sorted(override_path.glob("domain*.pddl"))
                domain_candidates.extend(matches)

    # 先在问题同目录及父目录寻找
    for name in ("domain.pddl", "domain3.pddl"):
        domain_candidates.append(problem_dir / name)
        domain_candidates.append(problem_dir.parent / name)

    # 场景默认路径
    domain_candidates.append(Path(f"{scenario}/domain.pddl"))
    domain_candidates.append(Path(f"{scenario}/domain3.pddl"))

    for domain_file in domain_candidates:
        if domain_file and domain_file.exists():
            return str(domain_file)

    return None

def validate_solution(domain_file: str, problem_file: str, solution_file: str) -> Tuple[bool, str, str, str]:
    """使用VAL验证器验证解决方案"""
    try:
        # 运行VAL验证器
        cmd = f"Validate -v {domain_file} {problem_file} {solution_file}"
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=30)
        
        # 检查验证结果
        if result.returncode == 0:
            # 检查输出中是否包含成功信息
            output = result.stdout.lower()
            if "plan valid" in output or "successful plans" in output or 'plan executed successfully' in output:
                return True, "Plan valid", result.stdout, result.stderr
            else:
                return False, f"Validation failed: {result.stdout}", result.stdout, result.stderr
        else:
            return False, f"Validation error: {result.stderr}", result.stdout, result.stderr
    
    except subprocess.TimeoutExpired:
        return False, "Validation timeout", "", "Validation timeout after 30 seconds"
    except Exception as e:
        return False, f"Validation exception: {str(e)}", "", str(e)

def validate_all_solutions(
    results_dir: str = "sft_model_pddl_mistral_7b_pddl_mix_planning_results",
    output_file: Optional[str] = None,
    domain_file: Optional[str] = None,
    problems_dir: Optional[str] = None,
) -> Dict:
    """验证所有解决方案文件"""
    results_path = Path(results_dir)
    
    if not results_path.exists():
        print(f"结果目录不存在: {results_dir}")
        return {}
    
    print(f"开始验证解决方案: {results_dir}")
    print("=" * 60)
    
    # 收集所有.soln文件
    solution_files = list(results_path.glob("**/*.soln"))
    
    if not solution_files:
        print("未找到任何.soln文件")
        return {}
    
    print(f"找到 {len(solution_files)} 个解决方案文件")
    
    # 验证结果
    validation_results = []
    valid_count = 0
    total_count = len(solution_files)
    
    # 按场景分组统计
    scenario_stats = {}
    
    for i, solution_file in enumerate(solution_files, 1):
        print(f"\n--- 验证 {i}/{total_count} ---")
        print(f"解决方案: {solution_file.name}")
        
        # 从文件名解析场景和问题名
        # 格式: scenario_problem.soln
        filename = solution_file.stem  # 去掉.soln扩展名
        if '_' in filename:
            parts = filename.split('_')
            scenario = parts[0]
            problem_name = '_'.join(parts[1:])  # 处理问题名中可能包含下划线的情况
        else:
            print(f"  警告: 无法解析文件名格式: {filename}")
            scenario = "unknown"
            problem_name = filename
        
        print(f"  场景: {scenario}")
        print(f"  问题: {problem_name}")
        
        # 查找对应的problem文件
        problem_file = None
        problem_candidates: List[Path] = []

        if problems_dir:
            formatted = problems_dir.format(scenario=scenario, problem=problem_name)
            base_path = Path(formatted)
            if base_path.is_dir():
                problem_candidates.append(base_path / f"{problem_name}.pddl")
            else:
                problem_candidates.append(base_path)

        default_candidate = Path(f"{scenario}/testing_problems3/{problem_name}.pddl")
        problem_candidates.append(default_candidate)

        for candidate in problem_candidates:
            if candidate.exists():
                problem_file = str(candidate)
                break
        
        if not problem_file:
            print(f"  ✗ 未找到对应的问题文件: {problem_name}.pddl")
            result = {
                'solution_file': str(solution_file),
                'scenario': scenario,
                'problem_name': problem_name,
                'problem_file': None,
                'domain_file': None,
                'is_valid': False,
                'validation_message': "Problem file not found",
                'validation_stdout': "",
                'validation_stderr': ""
            }
            validation_results.append(result)
            continue
        
        print(f"  问题文件: {problem_file}")
        
        # 查找domain文件
        resolved_domain = find_domain_file(problem_file, scenario, domain_override=domain_file)
        if not resolved_domain:
            print(f"  ✗ 未找到domain文件")
            result = {
                'solution_file': str(solution_file),
                'scenario': scenario,
                'problem_name': problem_name,
                'problem_file': problem_file,
                'domain_file': None,
                'is_valid': False,
                'validation_message': "Domain file not found",
                'validation_stdout': "",
                'validation_stderr': ""
            }
            validation_results.append(result)
            continue
        
        print(f"  Domain文件: {resolved_domain}")
        
        # 验证解决方案
        is_valid, message, stdout, stderr = validate_solution(resolved_domain, problem_file, str(solution_file))
        
        result = {
            'solution_file': str(solution_file),
            'scenario': scenario,
            'problem_name': problem_name,
            'problem_file': problem_file,
            'domain_file': resolved_domain,
            'is_valid': is_valid,
            'validation_message': message,
            'validation_stdout': stdout,
            'validation_stderr': stderr
        }
        validation_results.append(result)
        
        # 更新统计
        if is_valid:
            valid_count += 1
            print(f"  ✓ 验证通过")
        else:
            print(f"  ✗ 验证失败: {message}")
        
        # 更新场景统计
        if scenario not in scenario_stats:
            scenario_stats[scenario] = {'total': 0, 'valid': 0}
        scenario_stats[scenario]['total'] += 1
        if is_valid:
            scenario_stats[scenario]['valid'] += 1
    
    # 计算成功率
    success_rate = (valid_count / total_count) * 100 if total_count > 0 else 0
    
    # 汇总结果
    summary = {
        'results_directory': str(results_path),
        'total_solutions': total_count,
        'valid_solutions': valid_count,
        'success_rate': success_rate,
        'scenario_stats': scenario_stats,
        'validation_time': datetime.now().isoformat(),
        'results': validation_results
    }
    
    # 保存结果
    output_filename = output_file or f"validation_results_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
    with open(output_filename, 'w', encoding='utf-8') as f:
        json.dump(summary, f, indent=2, ensure_ascii=False)
    
    # 打印总结
    print(f"\n" + "=" * 60)
    print(f"验证完成")
    print(f"=" * 60)
    print(f"总解决方案数: {total_count}")
    print(f"有效解决方案数: {valid_count}")
    print(f"成功率: {success_rate:.1f}%")
    print(f"结果已保存到: {output_filename}")
    
    print(f"\n按场景统计:")
    for scenario, stats in scenario_stats.items():
        scenario_success_rate = (stats['valid'] / stats['total']) * 100 if stats['total'] > 0 else 0
        print(f"  {scenario}: {stats['valid']}/{stats['total']} ({scenario_success_rate:.1f}%)")
    
    return summary

def main():
    """主函数"""
    import argparse
    
    parser = argparse.ArgumentParser(description="验证PDDL解决方案文件")
    parser.add_argument("--results-dir", default="sft_model_pddl_mistral_7b_pddl_mix_planning_results",
                       help="结果目录路径")
    parser.add_argument("--output-file", default=None,
                       help="指定输出JSON文件名称")
    parser.add_argument("--domain-file", default=None,
                       help="指定domain文件路径（支持{scenario}占位符）")
    parser.add_argument("--problems-dir", default=None,
                       help="指定problem目录或文件路径（支持{scenario}、{problem}占位符）")
    
    args = parser.parse_args()
    
    validate_all_solutions(
        results_dir=args.results_dir,
        output_file=args.output_file,
        domain_file=args.domain_file,
        problems_dir=args.problems_dir,
    )

if __name__ == "__main__":
    main()
