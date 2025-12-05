#!/usr/bin/env python3
"""
修复无效的 solution 文件，重新求解并格式化。
"""

import os
import subprocess
import time
from pathlib import Path


def solve_and_format(problem_file, domain_file="domain3.pddl", timeout=30):
    """使用optic求解并格式化解文件"""
    base_name = os.path.splitext(problem_file)[0]
    solution_file = f"{base_name}.soln"
    
    print(f"求解: {os.path.basename(problem_file)}")
    
    # 使用optic求解
    optic_path = os.path.expanduser("~/optic/release/optic/optic-clp")
    cmd = f"{optic_path} -v0 -N {domain_file} {problem_file} > {solution_file}.tmp"
    
    start_time = time.time()
    process = subprocess.Popen(cmd, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    
    while True:
        if process.poll() is not None:
            result = process.returncode
            break
        
        if time.time() - start_time >= timeout:
            print(f"  ✗ 超时")
            process.terminate()
            try:
                process.wait(timeout=2)
            except subprocess.TimeoutExpired:
                process.kill()
            try:
                if os.path.exists(f"{solution_file}.tmp"):
                    os.remove(f"{solution_file}.tmp")
            except Exception:
                pass
            return False
        
        time.sleep(0.1)
    
    # 格式化解文件
    if result == 0 and os.path.exists(f"{solution_file}.tmp"):
        with open(f"{solution_file}.tmp", 'r') as f:
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
            os.remove(f"{solution_file}.tmp")
            print(f"  ✓ 成功生成 {len(plan_actions)} 个动作")
            return True
    
    if result == 0:
        print(f"  ✓ 成功")
        if os.path.exists(f"{solution_file}.tmp"):
            os.rename(f"{solution_file}.tmp", solution_file)
        return True
    else:
        print(f"  ✗ 求解失败")
        try:
            if os.path.exists(f"{solution_file}.tmp"):
                os.remove(f"{solution_file}.tmp")
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
    base_dir = Path("/home/jfan5/Safety-gen/pddl3/blocksworld")
    problem_file = base_dir / "all_problems3/training/bw_ops3_n5_seed400347.pddl"
    solution_file = base_dir / "all_problems3/training/bw_ops3_n5_seed400347.soln"
    domain_file = base_dir / "domain3.pddl"
    
    if not problem_file.exists():
        print(f"错误: 问题文件不存在")
        return
    
    if not domain_file.exists():
        print(f"错误: domain3.pddl 不存在")
        return
    
    # 切换到场景目录
    original_dir = os.getcwd()
    os.chdir(base_dir)
    
    try:
        prob_path = os.path.relpath(problem_file, os.getcwd())
        
        # 重新求解
        if solve_and_format(prob_path, "domain3.pddl", timeout=60):
            # 验证
            soln_path = os.path.relpath(solution_file, os.getcwd())
            is_valid, message = validate_solution("domain3.pddl", prob_path, soln_path, timeout_sec=30)
            
            if is_valid:
                print(f"\n✅ Solution 修复成功并验证通过")
            else:
                print(f"\n⚠️ Solution 已重新生成，但验证失败: {message}")
        else:
            print(f"\n✗ 无法求解该问题")
    finally:
        os.chdir(original_dir)


if __name__ == "__main__":
    main()

