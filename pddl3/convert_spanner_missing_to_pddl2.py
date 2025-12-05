#!/usr/bin/env python3
"""
将 spanner 中缺失的 125 个 PDDL3 问题转换为 PDDL2（删除安全约束），
然后放入 all_problems 目录并求解。
"""

import os
import re
import time
import subprocess
from pathlib import Path


def remove_pddl3_constraints(problem_text: str) -> str:
    """从 PDDL3 问题中删除 (:constraints ...) 块，转换为 PDDL2"""
    lines = problem_text.split('\n')
    result_lines = []
    in_constraints = False
    depth = 0
    
    for line in lines:
        # 检查是否进入 constraints 块
        if not in_constraints and '(:constraints' in line:
            in_constraints = True
            depth = 0
            # 计算这一行的括号深度
            depth += line.count('(') - line.count(')')
            # 如果这一行就结束了，跳过
            if depth <= 0:
                in_constraints = False
            continue
        
        if in_constraints:
            # 更新深度
            depth += line.count('(') - line.count(')')
            # 如果深度归零，说明 constraints 块结束
            if depth <= 0:
                in_constraints = False
            continue
        
        # 不在 constraints 块中，保留这一行
        result_lines.append(line)
    
    return '\n'.join(result_lines)


def solve_problem(problem_file, domain_file="domain.pddl", timeout=30):
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
    
    # 使用optic求解
    optic_path = os.path.expanduser("~/optic/release/optic/optic-clp")
    cmd = f"{optic_path} -v0 -N {domain_file} {problem_file} > {solution_file}"
    
    start_time = time.time()
    process = subprocess.Popen(cmd, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    
    while True:
        if process.poll() is not None:
            result = process.returncode
            break
        
        if time.time() - start_time >= timeout:
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
            return True
    
    if result == 0:
        return True
    else:
        try:
            if os.path.exists(solution_file):
                os.remove(solution_file)
        except Exception:
            pass
        return False


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3")
    scenario = "spanner"
    
    # 读取缺失问题列表
    missing_list_file = base_dir / f"{scenario}_pddl3_training_missing_in_all_problems.txt"
    if not missing_list_file.exists():
        print(f"错误: 找不到缺失问题列表文件: {missing_list_file}")
        return
    
    missing_problems = []
    with missing_list_file.open('r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            if line and not line.startswith('#'):
                missing_problems.append(line)
    
    print(f"找到 {len(missing_problems)} 个缺失的问题")
    
    # 路径设置
    pddl3_training_dir = base_dir / scenario / "all_problems3" / "training"
    all_problems_dir = base_dir / scenario / "all_problems"
    domain_file = base_dir / scenario / "domain.pddl"
    
    if not pddl3_training_dir.exists():
        print(f"错误: all_problems3/training 目录不存在")
        return
    
    if not all_problems_dir.exists():
        print(f"错误: all_problems 目录不存在")
        return
    
    if not domain_file.exists():
        print(f"错误: domain.pddl 不存在")
        return
    
    print(f"\n开始转换和求解...")
    print()
    
    # 切换到场景目录
    original_dir = os.getcwd()
    os.chdir(base_dir / scenario)
    
    converted = 0
    solved = 0
    failed_convert = 0
    failed_solve = 0
    
    try:
        for i, problem_name in enumerate(missing_problems, 1):
            print(f"[{i}/{len(missing_problems)}] {problem_name}")
            
            # 读取 PDDL3 问题
            pddl3_file = pddl3_training_dir / problem_name
            if not pddl3_file.exists():
                print(f"  ✗ PDDL3 文件不存在")
                failed_convert += 1
                continue
            
            with pddl3_file.open('r', encoding='utf-8') as f:
                pddl3_content = f.read()
            
            # 删除约束，转换为 PDDL2
            pddl2_content = remove_pddl3_constraints(pddl3_content)
            
            # 保存到 all_problems 目录
            pddl2_file = all_problems_dir / problem_name
            with pddl2_file.open('w', encoding='utf-8') as f:
                f.write(pddl2_content)
            
            converted += 1
            print(f"  ✓ 已转换为 PDDL2 并保存")
            
            # 求解
            prob_path = os.path.relpath(pddl2_file, os.getcwd())
            if solve_problem(prob_path, "domain.pddl", timeout=30):
                solved += 1
                print(f"  ✓ 求解成功")
            else:
                failed_solve += 1
                print(f"  ✗ 求解失败")
    
    finally:
        os.chdir(original_dir)
    
    print()
    print("=" * 80)
    print("处理完成")
    print("=" * 80)
    print(f"转换成功: {converted}/{len(missing_problems)}")
    print(f"求解成功: {solved}/{converted}")
    print(f"转换失败: {failed_convert}")
    print(f"求解失败: {failed_solve}")


if __name__ == "__main__":
    main()

