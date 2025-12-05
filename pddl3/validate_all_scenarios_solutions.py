#!/usr/bin/env python3
"""
验证所有场景的 all_problems3 下的所有 solution 是否有效。
"""

import os
import subprocess
import json
from pathlib import Path
from datetime import datetime
from typing import Tuple, Dict


def validate_solution(domain_file: str, problem_file: str, solution_file: str, timeout_sec: int = 30) -> Tuple[bool, str]:
    """使用 Validate 验证 solution 是否有效"""
    try:
        cmd = f"Validate -v {domain_file} {problem_file} {solution_file}"
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=timeout_sec)
        
        if result.returncode == 0:
            output = result.stdout.lower()
            if "plan valid" in output or "plan successfully executed" in output:
                return True, "Plan valid"
            return False, (result.stdout if result.stdout else "Validation failed")
        return False, (result.stderr if result.stderr else "Validation error")
    except subprocess.TimeoutExpired:
        return False, "Validation timeout"
    except Exception as e:
        return False, f"Validation exception: {e}"


def validate_scenario(scenario: str):
    """验证单个场景的所有 solution"""
    base_dir = Path("/home/jfan5/Safety-gen/pddl3") / scenario
    all_problems3 = base_dir / "all_problems3"
    domain3_file = base_dir / "domain3.pddl"
    
    if not all_problems3.exists():
        print(f"  ⚠️ all_problems3 目录不存在")
        return None
    
    if not domain3_file.exists():
        print(f"  ⚠️ domain3.pddl 不存在")
        return None
    
    # 找出所有有 solution 的 pddl 文件
    problems_with_solutions = []
    for pddl_file in all_problems3.rglob("*.pddl"):
        soln_file = pddl_file.with_suffix(".soln")
        if soln_file.exists():
            problems_with_solutions.append((pddl_file, soln_file))
    
    total = len(problems_with_solutions)
    if total == 0:
        print(f"  ⚠️ 没有找到任何有 solution 的问题")
        return None
    
    print(f"  总文件数: {total}")
    
    # 切换到场景目录
    original_dir = os.getcwd()
    os.chdir(base_dir)
    
    valid_count = 0
    invalid_count = 0
    invalid_files = []
    
    try:
        for i, (pddl_file, soln_file) in enumerate(problems_with_solutions, 1):
            # 使用相对路径
            prob_path = os.path.relpath(pddl_file, os.getcwd())
            soln_path = os.path.relpath(soln_file, os.getcwd())
            domain_path = "domain3.pddl"
            
            if i % 500 == 0 or i == total:
                print(f"    验证进度: {i}/{total} ({i/total*100:.1f}%)")
            
            is_valid, message = validate_solution(domain_path, prob_path, soln_path, timeout_sec=30)
            
            if is_valid:
                valid_count += 1
            else:
                invalid_count += 1
                rel_path = pddl_file.relative_to(all_problems3)
                invalid_files.append({
                    "problem": str(rel_path),
                    "error": message[:200]  # 限制错误消息长度
                })
                if invalid_count <= 5:  # 只打印前5个错误
                    print(f"    ✗ {rel_path}: {message[:100]}")
    finally:
        os.chdir(original_dir)
    
    # 按目录分类统计
    root_valid = 0
    root_invalid = 0
    training_valid = 0
    training_invalid = 0
    testing_valid = 0
    testing_invalid = 0
    
    for item in invalid_files:
        if item["problem"].startswith("training/"):
            training_invalid += 1
        elif item["problem"].startswith("testing/"):
            testing_invalid += 1
        else:
            root_invalid += 1
    
    root_total = len([p for p, _ in problems_with_solutions if not str(p.relative_to(all_problems3)).startswith(("training/", "testing/"))])
    training_total = len([p for p, _ in problems_with_solutions if str(p.relative_to(all_problems3)).startswith("training/")])
    testing_total = len([p for p, _ in problems_with_solutions if str(p.relative_to(all_problems3)).startswith("testing/")])
    
    root_valid = root_total - root_invalid
    training_valid = training_total - training_invalid
    testing_valid = testing_total - testing_invalid
    
    result = {
        "scenario": scenario,
        "total": total,
        "valid": valid_count,
        "invalid": invalid_count,
        "valid_percentage": valid_count / total * 100 if total > 0 else 0,
        "by_directory": {
            "root": {
                "total": root_total,
                "valid": root_valid,
                "invalid": root_invalid
            },
            "training": {
                "total": training_total,
                "valid": training_valid,
                "invalid": training_invalid
            },
            "testing": {
                "total": testing_total,
                "valid": testing_valid,
                "invalid": testing_invalid
            }
        },
        "invalid_files": invalid_files
    }
    
    return result


def main():
    scenarios = ["blocksworld", "ferry", "spanner", "grippers"]
    
    print("=" * 80)
    print("验证所有场景的 all_problems3 下的所有 solution")
    print("=" * 80)
    print()
    
    all_results = []
    
    for scenario in scenarios:
        print(f"验证 {scenario}...")
        result = validate_scenario(scenario)
        if result:
            all_results.append(result)
            print(f"  ✅ 有效: {result['valid']}/{result['total']} ({result['valid_percentage']:.2f}%)")
            print(f"  ⚠️ 无效: {result['invalid']}/{result['total']} ({result['invalid']/result['total']*100:.2f}%)")
        print()
    
    # 保存汇总报告
    report_file = Path("/home/jfan5/Safety-gen/pddl3/validation_report_all_scenarios.json")
    summary = {
        "timestamp": datetime.now().isoformat(),
        "scenarios": all_results,
        "summary": {
            "total_problems": sum(r["total"] for r in all_results),
            "total_valid": sum(r["valid"] for r in all_results),
            "total_invalid": sum(r["invalid"] for r in all_results),
            "overall_valid_percentage": sum(r["valid"] for r in all_results) / sum(r["total"] for r in all_results) * 100 if all_results else 0
        }
    }
    
    with open(report_file, 'w', encoding='utf-8') as f:
        json.dump(summary, f, indent=2, ensure_ascii=False)
    
    print("=" * 80)
    print("汇总结果")
    print("=" * 80)
    print(f"总问题数: {summary['summary']['total_problems']}")
    print(f"总有效数: {summary['summary']['total_valid']} ({summary['summary']['overall_valid_percentage']:.2f}%)")
    print(f"总无效数: {summary['summary']['total_invalid']}")
    print()
    print(f"详细报告已保存到: {report_file}")
    
    if summary['summary']['total_invalid'] == 0:
        print()
        print("✅ 所有场景的所有 solution 都有效！")
    else:
        print()
        print(f"⚠️ 有 {summary['summary']['total_invalid']} 个 solution 无效")


if __name__ == "__main__":
    main()

