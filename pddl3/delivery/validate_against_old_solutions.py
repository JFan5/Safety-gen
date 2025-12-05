#!/usr/bin/env python3
"""
验证 all_problems3 中的问题是否能被 all_problems 中的 solution 求解。
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
    base_dir = Path("/home/jfan5/Safety-gen/pddl3/delivery")
    all_problems3_dir = base_dir / "all_problems3"
    all_problems_dir = base_dir / "all_problems"
    domain3_file = base_dir / "domain3.pddl"
    
    if not all_problems3_dir.exists():
        print(f"错误: all_problems3 目录不存在")
        return
    
    if not all_problems_dir.exists():
        print(f"错误: all_problems 目录不存在")
        return
    
    print("=" * 80)
    print("验证 all_problems3 中的问题是否能被 all_problems 中的 solution 求解")
    print("=" * 80)
    print()
    
    # 找出 all_problems3 中所有有解决方案的问题
    problems3_with_solutions = []
    for pddl_file in all_problems3_dir.glob("*.pddl"):
        soln_file = pddl_file.with_suffix(".soln")
        if soln_file.exists():
            problems3_with_solutions.append(pddl_file)
    
    print(f"all_problems3 中有解决方案的问题数: {len(problems3_with_solutions)}")
    
    # 验证每个问题是否能被旧解求解
    results = []
    valid_count = 0
    invalid_count = 0
    
    original_dir = Path.cwd()
    os.chdir(base_dir)
    
    try:
        domain_rel = "domain3.pddl"
        
        for i, pddl_file in enumerate(problems3_with_solutions, 1):
            problem_name = pddl_file.name
            problem_base = problem_name.replace(".pddl", "")
            
            # 检查 all_problems 中是否有对应的 solution
            old_soln_file = all_problems_dir / f"{problem_base}.soln"
            
            if not old_soln_file.exists():
                # 没有旧解，记录为 invalid（不能被旧解求解）
                status = "invalid"
                invalid_count += 1
                message = "No old solution found"
            else:
                # 有旧解，验证是否能求解 PDDL3 问题
                prob_rel = f"all_problems3/{problem_name}"
                soln_rel = f"all_problems/{old_soln_file.name}"
                
                is_valid, msg = validate_solution(domain_rel, prob_rel, soln_rel, timeout_sec=30)
                
                if is_valid:
                    status = "valid"
                    valid_count += 1
                    message = "Plan valid"
                else:
                    status = "invalid"
                    invalid_count += 1
                    message = msg[:200]
            
            results.append({
                "problem_path": str(pddl_file),
                "problem_name": problem_name,
                "status": status,
                "message": message
            })
            
            if i % 200 == 0 or i == len(problems3_with_solutions):
                print(f"  进度: {i}/{len(problems3_with_solutions)} ({i/len(problems3_with_solutions)*100:.1f}%)")
    finally:
        os.chdir(original_dir)
    
    # 保存结果
    output_file = base_dir / "delivery_training_old_vs_new.json"
    summary = {
        "timestamp": datetime.now().isoformat(),
        "total_problems": len(problems3_with_solutions),
        "valid": valid_count,
        "invalid": invalid_count,
        "results": results
    }
    
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(summary, f, indent=2, ensure_ascii=False)
    
    print(f"\n{'='*80}")
    print("汇总结果")
    print(f"{'='*80}\n")
    print(f"总问题数: {len(problems3_with_solutions)}")
    print(f"能被旧解求解: {valid_count} ({valid_count/len(problems3_with_solutions)*100:.2f}%)")
    print(f"不能被旧解求解: {invalid_count} ({invalid_count/len(problems3_with_solutions)*100:.2f}%)")
    print(f"\n详细结果已保存到: {output_file}")


if __name__ == "__main__":
    import os
    main()

