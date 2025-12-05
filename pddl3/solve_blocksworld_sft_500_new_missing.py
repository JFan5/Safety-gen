#!/usr/bin/env python3
"""
为 blocksworld 的 sft_500_new 中没有解的问题生成解，然后验证。
"""

import os
import time
import subprocess
from pathlib import Path


def solve_problem(problem_file, domain_file="domain3.pddl", timeout=30):
    """使用optic求解单个问题"""
    base_name = os.path.splitext(problem_file)[0]
    solution_file = f"{base_name}.soln"
    
    # 检查是否已经存在解决方案
    if os.path.exists(solution_file):
        try:
            with open(solution_file, 'r') as f:
                content = f.read().strip()
            if content and any(line.strip().startswith('(') for line in content.split('\n') if line.strip()):
                return True
        except:
            pass
    
    print(f"  求解: {os.path.basename(problem_file)}")
    
    # 使用optic求解（注意：sft_500_new 中的问题是 PDDL3 问题，应该用 domain3.pddl）
    optic_path = os.path.expanduser("~/optic/release/optic/optic-clp")
    cmd = f"{optic_path} -v0 -N {domain_file} {problem_file} > {solution_file}"
    
    start_time = time.time()
    process = subprocess.Popen(cmd, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    
    while True:
        if process.poll() is not None:
            result = process.returncode
            break
        
        if time.time() - start_time >= timeout:
            print(f"    ✗ 超时")
            process.terminate()
            try:
                process.wait(timeout=2)
            except subprocess.TimeoutExpired:
                process.kill()
            try:
                if os.path.exists(solution_file):
                    os.remove(solution_file)
            except Exception:
                pass
            return False
        
        time.sleep(0.1)
    
    # 格式化解文件
    if result == 0 and os.path.exists(solution_file):
        with open(solution_file, 'r') as f:
            content = f.read()
        
        lines = content.split('\n')
        plan_actions = []
        in_plan_section = False
        
        for line in lines:
            line = line.strip()
            
            if line and not line.startswith(';') and ':' in line and '(' in line and ')' in line and '[' in line:
                parts = line.split(':')
                if len(parts) == 2 and parts[0].replace('.', '').isdigit():
                    in_plan_section = True
                    action_part = parts[1].strip()
                    start = action_part.find('(')
                    end = action_part.find(')')
                    if start != -1 and end != -1:
                        action = action_part[start+1:end]
                        plan_actions.append(action)
            
            elif in_plan_section and line and not line.startswith(';'):
                if '(' in line and ')' in line:
                    start = line.find('(')
                    end = line.find(')')
                    if start != -1 and end != -1:
                        action = line[start+1:end]
                        plan_actions.append(action)
                else:
                    break
        
        if plan_actions:
            with open(solution_file, 'w') as f:
                for action in plan_actions:
                    f.write(f"({action})\n")
            print(f"    ✓ 成功")
            return True
    
    if result == 0:
        print(f"    ✓ 成功")
        return True
    else:
        print(f"    ✗ 求解失败")
        try:
            if os.path.exists(solution_file):
                os.remove(solution_file)
        except Exception:
            pass
        return False


def validate_solution(domain_file: str, problem_file: str, solution_file: str, timeout_sec: int = 30):
    """验证解是否正确"""
    try:
        cmd = f"Validate -v {domain_file} {problem_file} {solution_file}"
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=timeout_sec)
        
        if result.returncode == 0:
            output = result.stdout.lower()
            if "plan valid" in output or "plan successfully executed" in output:
                return True, "Plan valid"
        return False, (result.stderr if result.stderr else "Validation failed")
    except subprocess.TimeoutExpired:
        return False, "Validation timeout"
    except Exception as e:
        return False, f"Validation exception: {e}"


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3")
    scenario = "blocksworld"
    
    sft_dir = base_dir / scenario / "sft_500_new"
    domain3_file = base_dir / scenario / "domain3.pddl"
    
    if not sft_dir.exists():
        print(f"错误: sft_500_new 目录不存在")
        return
    
    if not domain3_file.exists():
        print(f"错误: domain3.pddl 不存在")
        return
    
    # 找出没有解的问题
    problems = sorted(sft_dir.glob("*.pddl"))
    problems_without_solution = []
    
    for prob_file in problems:
        soln_file = prob_file.with_suffix(".soln")
        if not soln_file.exists():
            problems_without_solution.append(prob_file)
    
    total_missing = len(problems_without_solution)
    print(f"找到 {total_missing} 个没有解的问题")
    
    if total_missing == 0:
        print("✅ 所有问题都有解")
        return
    
    print(f"开始求解 {total_missing} 个问题...")
    print()
    
    # 切换到场景目录
    original_dir = os.getcwd()
    os.chdir(base_dir / scenario)
    
    successful = 0
    failed = 0
    
    try:
        for i, prob_file in enumerate(problems_without_solution, 1):
            print(f"[{i}/{total_missing}] ", end="")
            prob_path = os.path.relpath(prob_file, os.getcwd())
            
            if solve_problem(prob_path, "domain3.pddl", timeout=30):
                successful += 1
            else:
                failed += 1
    finally:
        os.chdir(original_dir)
    
    print()
    print(f"求解完成:")
    print(f"  成功: {successful}")
    print(f"  失败: {failed}")
    if total_missing > 0:
        print(f"  成功率: {successful/total_missing*100:.1f}%")
    
    # 验证所有解
    print()
    print("=" * 80)
    print("验证所有解")
    print("=" * 80)
    
    valid_count = 0
    invalid_count = 0
    
    for prob_file in problems:
        soln_file = prob_file.with_suffix(".soln")
        if not soln_file.exists():
            continue
        
        ok, msg = validate_solution(
            str(domain3_file),
            str(prob_file),
            str(soln_file),
            timeout_sec=30
        )
        
        if ok:
            valid_count += 1
        else:
            invalid_count += 1
    
    print(f"总问题数: {len(problems)}")
    print(f"有解的问题数: {len(problems) - len(problems_without_solution) + successful}")
    print(f"验证通过: {valid_count}")
    print(f"验证失败: {invalid_count}")
    
    if valid_count == len(problems):
        print("\n✅ 所有问题都有有效解！")
    else:
        print(f"\n⚠️ 有 {invalid_count} 个解验证失败")


if __name__ == "__main__":
    main()

