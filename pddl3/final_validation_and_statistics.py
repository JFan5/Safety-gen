#!/usr/bin/env python3
"""
最终验证和统计四个场景的数据集：
1. 验证 sft_500_new 和 all_problems3/testing 的解决方案有效性
2. 统计 sft_500_new 和 sft_500 的问题重合度
3. 统计 all_problems3/testing 和 testing_problem50 的问题数目和数据分布
"""

import json
import re
import subprocess
import os
from collections import defaultdict
from pathlib import Path
from typing import Dict, List, Tuple, Optional
from datetime import datetime


def parse_blocksworld(filename: str) -> Optional[Dict]:
    """解析 blocksworld 文件名"""
    m = re.match(r"bw_ops(\d+)_n(\d+)_seed\d+\.pddl$", filename)
    if not m:
        return None
    return {"ops": int(m.group(1)), "n": int(m.group(2))}


def parse_ferry(filename: str) -> Optional[Dict]:
    """解析 ferry 文件名"""
    m = re.match(r"ferry-l(\d+)-c(\d+)-s\d+\.pddl$", filename)
    if not m:
        return None
    return {"l": int(m.group(1)), "c": int(m.group(2))}


def parse_spanner(filename: str) -> Optional[Dict]:
    """解析 spanner 文件名"""
    m = re.match(r"spanner-s(\d+)-n(\d+)-l(\d+)-s\d+\.pddl$", filename)
    if not m:
        return None
    return {"s": int(m.group(1)), "n": int(m.group(2)), "l": int(m.group(3))}


def parse_grippers(filename: str) -> Optional[Dict]:
    """解析 grippers 文件名"""
    m = re.match(r"grippers-n(\d+)-r(\d+)-o(\d+)-s\d+\.pddl$", filename)
    if not m:
        return None
    return {"n": int(m.group(1)), "r": int(m.group(2)), "o": int(m.group(3))}


def get_difficulty_key(scenario: str, params: Dict) -> Tuple:
    """根据场景和参数生成难度键"""
    if scenario == 'blocksworld':
        return (params.get('ops'), params.get('n'))
    elif scenario == 'ferry':
        return (params.get('l'), params.get('c'))
    elif scenario == 'spanner':
        return (params.get('s'), params.get('n'), params.get('l'))
    elif scenario == 'grippers':
        return (params.get('n'), params.get('r'), params.get('o'))
    return tuple(sorted(params.items()))


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


def validate_dataset_solutions(scenario: str, dataset_dir: Path, domain_file: Path) -> Dict:
    """验证数据集中的所有解决方案"""
    if not dataset_dir.exists():
        return {"exists": False}
    
    problems_with_solutions = []
    for pddl_file in dataset_dir.glob("*.pddl"):
        soln_file = pddl_file.with_suffix(".soln")
        if soln_file.exists():
            problems_with_solutions.append((pddl_file, soln_file))
    
    total = len(problems_with_solutions)
    if total == 0:
        return {"exists": True, "total": 0, "valid": 0, "invalid": 0, "missing_solutions": True}
    
    # 切换到场景目录
    original_dir = os.getcwd()
    os.chdir(dataset_dir.parent)
    
    valid_count = 0
    invalid_count = 0
    invalid_files = []
    
    try:
        domain_rel = os.path.relpath(domain_file, os.getcwd())
        
        for i, (pddl_file, soln_file) in enumerate(problems_with_solutions, 1):
            prob_rel = os.path.relpath(pddl_file, os.getcwd())
            soln_rel = os.path.relpath(soln_file, os.getcwd())
            
            if i % 100 == 0 or i == total:
                print(f"    验证进度: {i}/{total} ({i/total*100:.1f}%)")
            
            is_valid, message = validate_solution(domain_rel, prob_rel, soln_rel, timeout_sec=30)
            
            if is_valid:
                valid_count += 1
            else:
                invalid_count += 1
                invalid_files.append({
                    "problem": pddl_file.name,
                    "error": message[:200]
                })
                if invalid_count <= 5:
                    print(f"    ✗ {pddl_file.name}: {message[:100]}")
    finally:
        os.chdir(original_dir)
    
    return {
        "exists": True,
        "total": total,
        "valid": valid_count,
        "invalid": invalid_count,
        "valid_percentage": valid_count / total * 100 if total > 0 else 0,
        "invalid_files": invalid_files[:10]  # 只保留前10个
    }


def get_problem_distribution(scenario: str, dataset_dir: Path, parser_func) -> Dict:
    """获取数据集的难度分布"""
    if not dataset_dir.exists():
        return {}
    
    distribution = defaultdict(int)
    total = 0
    
    for pddl_file in dataset_dir.glob("*.pddl"):
        params = parser_func(pddl_file.name)
        if params:
            config_key = get_difficulty_key(scenario, params)
            distribution[config_key] += 1
            total += 1
    
    # 转换为字符串键以便JSON序列化
    dist_str = {str(k): v for k, v in sorted(distribution.items())}
    
    return {
        "total": total,
        "distribution": dist_str
    }


def get_problem_names(dataset_dir: Path) -> set:
    """获取数据集中的所有问题文件名"""
    if not dataset_dir.exists():
        return set()
    
    return {p.name for p in dataset_dir.glob("*.pddl")}


def calculate_overlap(set1: set, set2: set) -> Dict:
    """计算两个问题集合的重合度"""
    intersection = set1 & set2
    union = set1 | set2
    
    overlap_count = len(intersection)
    overlap_percentage = (overlap_count / len(set1) * 100) if len(set1) > 0 else 0
    
    return {
        "set1_count": len(set1),
        "set2_count": len(set2),
        "intersection_count": overlap_count,
        "overlap_percentage": overlap_percentage,
        "union_count": len(union)
    }


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3")
    scenarios = ['blocksworld', 'ferry', 'spanner', 'grippers']
    
    parsers = {
        'blocksworld': parse_blocksworld,
        'ferry': parse_ferry,
        'spanner': parse_spanner,
        'grippers': parse_grippers,
    }
    
    all_results = {}
    
    print("=" * 80)
    print("最终验证和统计")
    print("=" * 80)
    print()
    
    for scenario in scenarios:
        print(f"\n{'='*80}")
        print(f"处理场景: {scenario}")
        print(f"{'='*80}\n")
        
        scenario_dir = base_dir / scenario
        domain_file = scenario_dir / "domain3.pddl"
        
        parser_func = parsers[scenario]
        
        result = {
            "scenario": scenario,
            "timestamp": datetime.now().isoformat()
        }
        
        # 1. 验证 sft_500_new 的解决方案
        print(f"1. 验证 sft_500_new 的解决方案...")
        sft_500_new_dir = scenario_dir / "sft_500_new"
        sft_500_new_validation = validate_dataset_solutions(scenario, sft_500_new_dir, domain_file)
        result["sft_500_new_validation"] = sft_500_new_validation
        
        if sft_500_new_validation.get("exists"):
            print(f"   总计: {sft_500_new_validation['total']}")
            print(f"   有效: {sft_500_new_validation['valid']} ({sft_500_new_validation['valid_percentage']:.2f}%)")
            print(f"   无效: {sft_500_new_validation['invalid']}")
        
        # 2. 验证 all_problems3/testing 的解决方案
        print(f"\n2. 验证 all_problems3/testing 的解决方案...")
        testing_dir = scenario_dir / "all_problems3" / "testing"
        testing_validation = validate_dataset_solutions(scenario, testing_dir, domain_file)
        result["testing_validation"] = testing_validation
        
        if testing_validation.get("exists"):
            print(f"   总计: {testing_validation['total']}")
            print(f"   有效: {testing_validation['valid']} ({testing_validation['valid_percentage']:.2f}%)")
            print(f"   无效: {testing_validation['invalid']}")
        
        # 3. 统计 sft_500_new 和 sft_500 的重合度
        print(f"\n3. 统计 sft_500_new 和 sft_500 的重合度...")
        sft_500_dir = scenario_dir / "sft_500"
        sft_500_new_names = get_problem_names(sft_500_new_dir)
        sft_500_names = get_problem_names(sft_500_dir)
        
        overlap = calculate_overlap(sft_500_new_names, sft_500_names)
        result["sft_overlap"] = overlap
        
        print(f"   sft_500_new: {overlap['set1_count']} 个问题")
        print(f"   sft_500: {overlap['set2_count']} 个问题")
        print(f"   重合: {overlap['intersection_count']} 个问题 ({overlap['overlap_percentage']:.2f}%)")
        
        # 4. 统计 all_problems3/testing 的问题数目和分布
        print(f"\n4. 统计 all_problems3/testing 的问题数目和分布...")
        testing_distribution = get_problem_distribution(scenario, testing_dir, parser_func)
        result["testing_distribution"] = testing_distribution
        
        print(f"   总问题数: {testing_distribution.get('total', 0)}")
        print(f"   分布:")
        for config, count in testing_distribution.get('distribution', {}).items():
            print(f"     {config}: {count}")
        
        # 5. 统计 testing_problem50 的问题数目和分布
        print(f"\n5. 统计 testing_problem50 的问题数目和分布...")
        testing_problem50_dir = scenario_dir / "testing_problem50"
        testing_problem50_distribution = get_problem_distribution(scenario, testing_problem50_dir, parser_func)
        result["testing_problem50_distribution"] = testing_problem50_distribution
        
        print(f"   总问题数: {testing_problem50_distribution.get('total', 0)}")
        print(f"   分布:")
        for config, count in testing_problem50_distribution.get('distribution', {}).items():
            print(f"     {config}: {count}")
        
        # 6. 统计 sft_500_new 的分布
        print(f"\n6. 统计 sft_500_new 的分布...")
        sft_500_new_distribution = get_problem_distribution(scenario, sft_500_new_dir, parser_func)
        result["sft_500_new_distribution"] = sft_500_new_distribution
        
        print(f"   总问题数: {sft_500_new_distribution.get('total', 0)}")
        print(f"   分布:")
        for config, count in sft_500_new_distribution.get('distribution', {}).items():
            print(f"     {config}: {count}")
        
        all_results[scenario] = result
    
    # 保存详细结果到 JSON
    json_file = base_dir / "final_validation_statistics.json"
    with json_file.open('w', encoding='utf-8') as f:
        json.dump(all_results, f, indent=2, ensure_ascii=False)
    
    print(f"\n{'='*80}")
    print("汇总报告")
    print(f"{'='*80}\n")
    
    print("| 场景 | sft_500_new | all_problems3/testing | sft_500_new/sft_500重合度 | testing_problem50 |")
    print("|------|-------------|----------------------|-------------------------|-------------------|")
    print("|      | 总数 | 有效 | 总数 | 有效 | 重合数 | 重合率 | 总数 |")
    print("|------|------|------|------|------|--------|--------|------|")
    
    for scenario in scenarios:
        r = all_results[scenario]
        sft_new = r.get("sft_500_new_validation", {})
        testing = r.get("testing_validation", {})
        overlap = r.get("sft_overlap", {})
        test50 = r.get("testing_problem50_distribution", {})
        
        sft_new_total = sft_new.get("total", 0)
        sft_new_valid = sft_new.get("valid", 0)
        testing_total = testing.get("total", 0)
        testing_valid = testing.get("valid", 0)
        overlap_count = overlap.get("intersection_count", 0)
        overlap_pct = overlap.get("overlap_percentage", 0)
        test50_total = test50.get("total", 0)
        
        print(f"| {scenario} | {sft_new_total} | {sft_new_valid} | {testing_total} | {testing_valid} | "
              f"{overlap_count} | {overlap_pct:.1f}% | {test50_total} |")
    
    print(f"\n详细结果已保存到: {json_file}")
    
    return all_results


if __name__ == "__main__":
    main()

