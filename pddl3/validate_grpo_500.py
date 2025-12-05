#!/usr/bin/env python3
"""
验证每个场景的 grpo_500 数据集：
1. 问题是否都有 solution
2. solution 是否都 valid
3. 问题是否和 sft_500_new 有重合
"""

import json
import subprocess
import os
from pathlib import Path
from typing import Dict, Tuple
from datetime import datetime


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


def validate_grpo_500_dataset(scenario: str, grpo_dir: Path, domain_file: Path) -> Dict:
    """验证 grpo_500 数据集"""
    if not grpo_dir.exists():
        return {"exists": False}
    
    # 统计所有问题
    all_problems = list(grpo_dir.glob("*.pddl"))
    total_problems = len(all_problems)
    
    # 统计有解决方案的问题
    problems_with_solutions = []
    problems_without_solutions = []
    
    for pddl_file in all_problems:
        soln_file = pddl_file.with_suffix(".soln")
        if soln_file.exists():
            problems_with_solutions.append((pddl_file, soln_file))
        else:
            problems_without_solutions.append(pddl_file.name)
    
    problems_with_soln_count = len(problems_with_solutions)
    problems_without_soln_count = len(problems_without_solutions)
    
    # 验证解决方案有效性
    original_dir = os.getcwd()
    os.chdir(grpo_dir.parent)
    
    valid_count = 0
    invalid_count = 0
    invalid_files = []
    
    try:
        domain_rel = os.path.relpath(domain_file, os.getcwd())
        
        for i, (pddl_file, soln_file) in enumerate(problems_with_solutions, 1):
            prob_rel = os.path.relpath(pddl_file, os.getcwd())
            soln_rel = os.path.relpath(soln_file, os.getcwd())
            
            if i % 100 == 0 or i == problems_with_soln_count:
                print(f"    验证进度: {i}/{problems_with_soln_count} ({i/problems_with_soln_count*100:.1f}%)")
            
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
        "total_problems": total_problems,
        "problems_with_solutions": problems_with_soln_count,
        "problems_without_solutions": problems_without_soln_count,
        "valid_solutions": valid_count,
        "invalid_solutions": invalid_count,
        "valid_percentage": valid_count / problems_with_soln_count * 100 if problems_with_soln_count > 0 else 0,
        "missing_solutions_list": problems_without_solutions[:10],  # 只保留前10个
        "invalid_files": invalid_files[:10]  # 只保留前10个
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
    overlap_percentage_set1 = (overlap_count / len(set1) * 100) if len(set1) > 0 else 0
    overlap_percentage_set2 = (overlap_count / len(set2) * 100) if len(set2) > 0 else 0
    
    return {
        "set1_count": len(set1),
        "set2_count": len(set2),
        "intersection_count": overlap_count,
        "overlap_percentage_set1": overlap_percentage_set1,
        "overlap_percentage_set2": overlap_percentage_set2,
        "union_count": len(union)
    }


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3")
    scenarios = ['blocksworld', 'ferry', 'spanner', 'grippers']
    
    all_results = {}
    
    print("=" * 80)
    print("验证 grpo_500 数据集")
    print("=" * 80)
    print()
    
    for scenario in scenarios:
        print(f"\n{'='*80}")
        print(f"处理场景: {scenario}")
        print(f"{'='*80}\n")
        
        scenario_dir = base_dir / scenario
        domain_file = scenario_dir / "domain3.pddl"
        grpo_dir = scenario_dir / "grpo_500"
        sft_500_new_dir = scenario_dir / "sft_500_new"
        
        result = {
            "scenario": scenario,
            "timestamp": datetime.now().isoformat()
        }
        
        # 1. 验证 grpo_500 数据集
        print(f"1. 验证 grpo_500 数据集...")
        grpo_validation = validate_grpo_500_dataset(scenario, grpo_dir, domain_file)
        result["grpo_500_validation"] = grpo_validation
        
        if grpo_validation.get("exists"):
            print(f"   总问题数: {grpo_validation['total_problems']}")
            print(f"   有解决方案的问题数: {grpo_validation['problems_with_solutions']}")
            print(f"   无解决方案的问题数: {grpo_validation['problems_without_solutions']}")
            
            if grpo_validation['problems_without_solutions'] > 0:
                print(f"   ⚠️  缺失解决方案的问题（前5个）:")
                for name in grpo_validation['missing_solutions_list'][:5]:
                    print(f"     - {name}")
            
            print(f"   有效解决方案: {grpo_validation['valid_solutions']} ({grpo_validation['valid_percentage']:.2f}%)")
            print(f"   无效解决方案: {grpo_validation['invalid_solutions']}")
        else:
            print(f"   ⚠️  grpo_500 目录不存在")
        
        # 2. 统计 grpo_500 与 sft_500_new 的重合度
        print(f"\n2. 统计 grpo_500 与 sft_500_new 的重合度...")
        grpo_names = get_problem_names(grpo_dir)
        sft_500_new_names = get_problem_names(sft_500_new_dir)
        
        overlap = calculate_overlap(grpo_names, sft_500_new_names)
        result["overlap_with_sft_500_new"] = overlap
        
        print(f"   grpo_500: {overlap['set1_count']} 个问题")
        print(f"   sft_500_new: {overlap['set2_count']} 个问题")
        print(f"   重合问题数: {overlap['intersection_count']} 个")
        print(f"   重合率（相对于grpo_500）: {overlap['overlap_percentage_set1']:.2f}%")
        print(f"   重合率（相对于sft_500_new）: {overlap['overlap_percentage_set2']:.2f}%")
        
        all_results[scenario] = result
    
    # 保存详细结果到 JSON
    json_file = base_dir / "grpo_500_validation_statistics.json"
    with json_file.open('w', encoding='utf-8') as f:
        json.dump(all_results, f, indent=2, ensure_ascii=False)
    
    print(f"\n{'='*80}")
    print("汇总报告")
    print(f"{'='*80}\n")
    
    print("| 场景 | 总问题数 | 有解决方案 | 无解决方案 | 有效解决方案 | 无效解决方案 | 与sft_500_new重合数 | 重合率(grpo) | 重合率(sft) |")
    print("|------|----------|------------|------------|--------------|--------------|-------------------|--------------|-------------|")
    
    for scenario in scenarios:
        r = all_results[scenario]
        grpo_val = r.get("grpo_500_validation", {})
        overlap = r.get("overlap_with_sft_500_new", {})
        
        total = grpo_val.get("total_problems", 0)
        with_soln = grpo_val.get("problems_with_solutions", 0)
        without_soln = grpo_val.get("problems_without_solutions", 0)
        valid = grpo_val.get("valid_solutions", 0)
        invalid = grpo_val.get("invalid_solutions", 0)
        overlap_count = overlap.get("intersection_count", 0)
        overlap_pct_grpo = overlap.get("overlap_percentage_set1", 0)
        overlap_pct_sft = overlap.get("overlap_percentage_set2", 0)
        
        print(f"| {scenario} | {total} | {with_soln} | {without_soln} | {valid} | {invalid} | "
              f"{overlap_count} | {overlap_pct_grpo:.1f}% | {overlap_pct_sft:.1f}% |")
    
    print(f"\n详细结果已保存到: {json_file}")
    
    # 检查是否有问题
    print(f"\n{'='*80}")
    print("问题检查")
    print(f"{'='*80}\n")
    
    has_issues = False
    for scenario in scenarios:
        r = all_results[scenario]
        grpo_val = r.get("grpo_500_validation", {})
        
        if not grpo_val.get("exists"):
            print(f"⚠️  {scenario}: grpo_500 目录不存在")
            has_issues = True
        elif grpo_val.get("problems_without_solutions", 0) > 0:
            print(f"⚠️  {scenario}: {grpo_val['problems_without_solutions']} 个问题没有解决方案")
            has_issues = True
        elif grpo_val.get("invalid_solutions", 0) > 0:
            print(f"⚠️  {scenario}: {grpo_val['invalid_solutions']} 个解决方案无效")
            has_issues = True
    
    if not has_issues:
        print("✅ 所有场景的 grpo_500 数据集都正常：所有问题都有解决方案，且解决方案都有效")
    
    return all_results


if __name__ == "__main__":
    main()

