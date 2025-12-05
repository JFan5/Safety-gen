#!/usr/bin/env python3
"""
清理和验证 grid 项目的问题：
1. 删除没有 solution 的 problem
2. 验证 solution 的有效性
3. 删除 validate 不成功的 problem
"""

import subprocess
import os
from pathlib import Path
from typing import Tuple
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


def clean_and_validate_directory(directory: Path, domain_file: Path, dataset_name: str):
    """清理和验证指定目录中的问题"""
    if not directory.exists():
        print(f"  ⚠️ 目录不存在: {directory}")
        return None
    
    print(f"\n{'='*80}")
    print(f"处理 {dataset_name}: {directory}")
    print(f"{'='*80}\n")
    
    # 找出所有问题文件
    all_problems = list(directory.glob("*.pddl"))
    total_problems = len(all_problems)
    
    print(f"  总问题数: {total_problems}")
    
    # 第一步：找出没有解决方案的问题
    problems_without_solutions = []
    problems_with_solutions = []
    
    for pddl_file in all_problems:
        soln_file = pddl_file.with_suffix(".soln")
        if soln_file.exists():
            problems_with_solutions.append((pddl_file, soln_file))
        else:
            problems_without_solutions.append(pddl_file)
    
    print(f"  有解决方案的问题数: {len(problems_with_solutions)}")
    print(f"  无解决方案的问题数: {len(problems_without_solutions)}")
    
    # 删除没有解决方案的问题
    deleted_no_solution = 0
    if problems_without_solutions:
        print(f"\n  删除 {len(problems_without_solutions)} 个没有解决方案的问题...")
        for pddl_file in problems_without_solutions:
            try:
                pddl_file.unlink()
                deleted_no_solution += 1
            except Exception as e:
                print(f"    ✗ 删除失败 {pddl_file.name}: {e}")
    
    # 第二步：验证解决方案的有效性
    print(f"\n  验证 {len(problems_with_solutions)} 个问题的解决方案...")
    
    original_dir = os.getcwd()
    os.chdir(directory.parent)
    
    valid_solutions = []
    invalid_solutions = []
    
    try:
        domain_rel = os.path.relpath(domain_file, os.getcwd())
        
        for i, (pddl_file, soln_file) in enumerate(problems_with_solutions, 1):
            prob_rel = os.path.relpath(pddl_file, os.getcwd())
            soln_rel = os.path.relpath(soln_file, os.getcwd())
            
            if i % 500 == 0 or i == len(problems_with_solutions):
                print(f"    验证进度: {i}/{len(problems_with_solutions)} ({i/len(problems_with_solutions)*100:.1f}%)")
            
            is_valid, message = validate_solution(domain_rel, prob_rel, soln_rel, timeout_sec=30)
            
            if is_valid:
                valid_solutions.append((pddl_file, soln_file))
            else:
                invalid_solutions.append((pddl_file, soln_file, message))
                if len(invalid_solutions) <= 5:
                    print(f"    ✗ {pddl_file.name}: {message[:100]}")
    finally:
        os.chdir(original_dir)
    
    print(f"\n  有效解决方案: {len(valid_solutions)}")
    print(f"  无效解决方案: {len(invalid_solutions)}")
    
    # 删除无效解决方案的问题和解决方案文件
    deleted_invalid = 0
    if invalid_solutions:
        print(f"\n  删除 {len(invalid_solutions)} 个无效解决方案的问题...")
        for pddl_file, soln_file, message in invalid_solutions:
            try:
                pddl_file.unlink()
                soln_file.unlink()
                deleted_invalid += 1
            except Exception as e:
                print(f"    ✗ 删除失败 {pddl_file.name}: {e}")
    
    # 统计结果
    final_count = len(valid_solutions)
    
    result = {
        "dataset": dataset_name,
        "directory": str(directory),
        "initial_total": total_problems,
        "problems_with_solutions": len(problems_with_solutions),
        "problems_without_solutions": len(problems_without_solutions),
        "deleted_no_solution": deleted_no_solution,
        "valid_solutions": len(valid_solutions),
        "invalid_solutions": len(invalid_solutions),
        "deleted_invalid": deleted_invalid,
        "final_count": final_count
    }
    
    print(f"\n  最终保留的问题数: {final_count}")
    print(f"  删除的问题数: {deleted_no_solution + deleted_invalid}")
    
    return result


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3/grid")
    
    # 检查 domain 文件
    domain3_file = base_dir / "domain3.pddl"
    domain_file = base_dir / "domain.pddl"
    
    if not domain3_file.exists():
        print(f"错误: domain3.pddl 不存在: {domain3_file}")
        return
    
    if not domain_file.exists():
        print(f"错误: domain.pddl 不存在: {domain_file}")
        return
    
    print("=" * 80)
    print("清理和验证 grid 项目的问题")
    print("=" * 80)
    print(f"\n时间: {datetime.now().isoformat()}")
    
    results = []
    
    # 处理 all_problems3
    all_problems3_dir = base_dir / "all_problems3"
    result3 = clean_and_validate_directory(all_problems3_dir, domain3_file, "all_problems3")
    if result3:
        results.append(result3)
    
    # 处理 all_problems
    all_problems_dir = base_dir / "all_problems"
    result = clean_and_validate_directory(all_problems_dir, domain_file, "all_problems")
    if result:
        results.append(result)
    
    # 汇总报告
    print(f"\n{'='*80}")
    print("汇总报告")
    print(f"{'='*80}\n")
    
    print("| 数据集 | 初始总数 | 有解决方案 | 无解决方案 | 删除(无解) | 有效解 | 无效解 | 删除(无效) | 最终保留 |")
    print("|--------|----------|------------|------------|------------|--------|--------|------------|----------|")
    
    for r in results:
        print(f"| {r['dataset']} | {r['initial_total']} | {r['problems_with_solutions']} | "
              f"{r['problems_without_solutions']} | {r['deleted_no_solution']} | "
              f"{r['valid_solutions']} | {r['invalid_solutions']} | {r['deleted_invalid']} | "
              f"{r['final_count']} |")
    
    print(f"\n{'='*80}")
    print("完成")
    print(f"{'='*80}\n")
    
    # 最终统计
    total_deleted = sum(r['deleted_no_solution'] + r['deleted_invalid'] for r in results)
    total_final = sum(r['final_count'] for r in results)
    
    print(f"总计删除: {total_deleted} 个问题")
    print(f"总计保留: {total_final} 个问题")
    
    if total_deleted == 0:
        print("\n✅ 所有问题都有有效的解决方案！")
    else:
        print(f"\n⚠️  删除了 {total_deleted} 个问题（无解决方案或解决方案无效）")


if __name__ == "__main__":
    main()

