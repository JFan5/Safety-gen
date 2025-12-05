#!/usr/bin/env python3
"""
为所有场景的 all_problems 目录中无解的问题生成解。
"""

import os
import sys
import time
import subprocess
from pathlib import Path


def solve_problem(problem_file, domain_file="domain.pddl", timeout=30):
    """
    使用optic求解单个问题
    """
    # 生成解决方案文件名
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
    
    # 使用optic求解
    optic_path = os.path.expanduser("~/optic/release/optic/optic-clp")
    cmd = f"{optic_path} -v0 -N {domain_file} {problem_file} > {solution_file}"
    
    # 使用非阻塞方式执行命令，实现真正的超时控制
    start_time = time.time()
    
    # 启动进程
    process = subprocess.Popen(cmd, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    
    # 监控进程
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
    
    # 如果成功，格式化解文件
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


def solve_missing_solutions(scenario: str, base_dir: Path, timeout: int = 30):
    """为指定场景的无解问题生成解"""
    print(f"\n{'='*80}")
    print(f"场景: {scenario}")
    print(f"{'='*80}")
    
    all_problems_dir = base_dir / scenario / "all_problems"
    domain_file = base_dir / scenario / "domain.pddl"
    
    if not all_problems_dir.exists():
        print(f"  错误: all_problems 目录不存在")
        return
    
    if not domain_file.exists():
        print(f"  错误: domain.pddl 不存在")
        return
    
    # 获取所有问题文件
    problem_files = sorted(all_problems_dir.glob("*.pddl"))
    
    # 找出无解的问题
    problems_without_solution = []
    for prob_file in problem_files:
        soln_file = prob_file.with_suffix(".soln")
        if not soln_file.exists():
            problems_without_solution.append(prob_file)
    
    total_missing = len(problems_without_solution)
    print(f"  总问题数: {len(problem_files)}")
    print(f"  无解问题数: {total_missing}")
    
    if total_missing == 0:
        print(f"  ✅ 所有问题都有解")
        return
    
    print(f"  开始求解 {total_missing} 个无解问题...")
    print()
    
    # 切换到场景目录
    original_dir = os.getcwd()
    os.chdir(base_dir / scenario)
    
    successful = 0
    failed = 0
    
    try:
        for i, prob_file in enumerate(problems_without_solution, 1):
            print(f"  [{i}/{total_missing}] ", end="")
            prob_path = os.path.relpath(prob_file, os.getcwd())
            
            if solve_problem(prob_path, "domain.pddl", timeout):
                successful += 1
            else:
                failed += 1
    finally:
        os.chdir(original_dir)
    
    print()
    print(f"  求解完成:")
    print(f"    成功: {successful}")
    print(f"    失败: {failed}")
    if total_missing > 0:
        print(f"    成功率: {successful/total_missing*100:.1f}%")


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3")
    scenarios = ['blocksworld', 'ferry', 'spanner', 'grippers']
    timeout = 30  # 30秒超时
    
    for scenario in scenarios:
        solve_missing_solutions(scenario, base_dir, timeout)
    
    # 最终验证
    print(f"\n{'='*80}")
    print("最终验证")
    print(f"{'='*80}")
    
    for scenario in scenarios:
        all_problems_dir = base_dir / scenario / "all_problems"
        if not all_problems_dir.exists():
            continue
        
        problem_files = sorted(all_problems_dir.glob("*.pddl"))
        problems_with_solution = sum(1 for p in problem_files if p.with_suffix(".soln").exists())
        problems_without_solution = len(problem_files) - problems_with_solution
        
        print(f"[{scenario}] 总问题数: {len(problem_files)}, "
              f"有解: {problems_with_solution}, "
              f"无解: {problems_without_solution}")
        
        if problems_without_solution == 0:
            print(f"  ✅ 所有问题都有解")
        else:
            print(f"  ⚠️ 仍有 {problems_without_solution} 个问题无解")


if __name__ == "__main__":
    main()

