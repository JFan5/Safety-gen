#!/usr/bin/env python3
"""
验证 blocksworld 的 all_problems3 下所有 solution 是否有效。
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


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3/blocksworld")
    all_problems3 = base_dir / "all_problems3"
    domain3_file = base_dir / "domain3.pddl"
    
    if not all_problems3.exists():
        print(f"错误: all_problems3 目录不存在")
        return
    
    if not domain3_file.exists():
        print(f"错误: domain3.pddl 不存在")
        return
    
    # 找出所有有 solution 的 pddl 文件
    problems_with_solutions = []
    for pddl_file in all_problems3.rglob("*.pddl"):
        soln_file = pddl_file.with_suffix(".soln")
        if soln_file.exists():
            problems_with_solutions.append((pddl_file, soln_file))
    
    total = len(problems_with_solutions)
    print("=" * 80)
    print("验证 all_problems3 下的所有 solution")
    print("=" * 80)
    print(f"总文件数: {total}")
    print()
    
    # 切换到场景目录以便使用相对路径
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
            
            if i % 100 == 0 or i == total:
                print(f"验证进度: {i}/{total} ({i/total*100:.1f}%)")
            
            is_valid, message = validate_solution(domain_path, prob_path, soln_path, timeout_sec=30)
            
            if is_valid:
                valid_count += 1
            else:
                invalid_count += 1
                rel_path = pddl_file.relative_to(all_problems3)
                invalid_files.append({
                    "problem": str(rel_path),
                    "error": message
                })
                if invalid_count <= 10:  # 只打印前10个错误
                    print(f"  ✗ {rel_path}: {message[:100]}")
    finally:
        os.chdir(original_dir)
    
    print()
    print("=" * 80)
    print("验证结果")
    print("=" * 80)
    print(f"总文件数: {total}")
    print(f"有效: {valid_count} ({valid_count/total*100:.2f}%)")
    print(f"无效: {invalid_count} ({invalid_count/total*100:.2f}%)")
    
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
    
    print()
    print("按目录分类:")
    print(f"  根目录: {root_valid}/{root_total} 有效 ({root_valid/root_total*100:.2f}%)")
    print(f"  training: {training_valid}/{training_total} 有效 ({training_valid/training_total*100:.2f}%)")
    print(f"  testing: {testing_valid}/{testing_total} 有效 ({testing_valid/testing_total*100:.2f}%)")
    
    # 保存详细报告
    report_file = base_dir / "validation_report_all_problems3.json"
    report = {
        "timestamp": datetime.now().isoformat(),
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
    
    with open(report_file, 'w', encoding='utf-8') as f:
        json.dump(report, f, indent=2, ensure_ascii=False)
    
    print()
    print(f"详细报告已保存到: {report_file}")
    
    if invalid_count == 0:
        print()
        print("✅ 所有 solution 都有效！")
    else:
        print()
        print(f"⚠️ 有 {invalid_count} 个 solution 无效")


if __name__ == "__main__":
    main()

