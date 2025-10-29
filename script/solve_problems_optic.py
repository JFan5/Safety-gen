#!/usr/bin/env python3
import os
import glob
import time
import subprocess
import signal

def solve_problem(problem_file, domain_file="domain.pddl", timeout=5):
    """
    使用optic求解单个问题
    """
    # 生成解决方案文件名
    base_name = os.path.splitext(problem_file)[0]
    solution_file = f"{base_name}.soln"
    
    # 检查是否已经存在解决方案
    if os.path.exists(solution_file):
        # 检查文件是否包含有效的计划
        try:
            with open(solution_file, 'r') as f:
                content = f.read().strip()
            # 如果文件不为空且包含动作（以(开头的行），则认为已有有效解决方案
            if content and any(line.strip().startswith('(') for line in content.split('\n') if line.strip()):
                scenario_name = os.path.basename(os.getcwd())
                print(f"⏭️  [{scenario_name}] 跳过: {problem_file} (已经解决方案，跳过)")
                return True
        except:
            pass
    
    scenario_name = os.path.basename(os.getcwd())
    print(f"[{scenario_name}] 求解: {problem_file}")
    
    # 使用指定的optic路径求解问题，使用-v0和-N减少输出
    optic_path = os.path.expanduser("~/optic/release/optic/optic-clp")
    cmd = f"{optic_path} -v0 -N {domain_file} {problem_file} > {solution_file}"
    
    # 检查是否有写入权限
    try:
        # 测试写入权限
        with open(solution_file, 'w') as f:
            f.write("test")
        os.remove(solution_file)  # 删除测试文件
    except PermissionError:
        print(f"✗ [{scenario_name}] 权限错误: 无法写入 {solution_file}")
        return False
    except Exception as e:
        print(f"✗ [{scenario_name}] 文件错误: {e}")
        return False
    
    # 使用非阻塞方式执行命令，实现真正的超时控制
    start_time = time.time()
    
    # 启动进程
    process = subprocess.Popen(cmd, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    
    # 监控进程
    while True:
        # 检查进程是否结束
        if process.poll() is not None:
            result = process.returncode
            break
        
        # 检查是否超时
        if time.time() - start_time >= timeout:
            scenario_name = os.path.basename(os.getcwd())
            print(f"✗ [{scenario_name}] 超时，跳过且不保存: {os.path.abspath(problem_file)}")
            # 终止进程
            process.terminate()
            try:
                process.wait(timeout=2)  # 等待2秒让进程正常结束
            except subprocess.TimeoutExpired:
                process.kill()  # 强制杀死进程
            # 超时则删除可能已创建的解文件
            try:
                if os.path.exists(solution_file):
                    os.remove(solution_file)
            except Exception:
                pass
            return False
        
        # 短暂休眠，避免过度占用CPU
        time.sleep(0.1)
    
    # 如果成功，只保留计划部分并格式化为Validate可接受的格式
    if result == 0 and os.path.exists(solution_file):
        with open(solution_file, 'r') as f:
            content = f.read()
        
        # 查找plan开始的位置 - 寻找时间戳格式的行
        lines = content.split('\n')
        plan_actions = []
        in_plan_section = False
        
        for line in lines:
            line = line.strip()
            
            # 识别plan开始：时间戳格式的行，如 "0.000: (action) [0.001]"
            if line and not line.startswith(';') and ':' in line and '(' in line and ')' in line and '[' in line:
                # 检查是否是时间戳格式
                parts = line.split(':')
                if len(parts) == 2 and parts[0].replace('.', '').isdigit():
                    in_plan_section = True
                    # 提取动作部分
                    action_part = parts[1].strip()
                    start = action_part.find('(')
                    end = action_part.find(')')
                    if start != -1 and end != -1:
                        action = action_part[start+1:end]
                        plan_actions.append(action)
            
            # 如果已经在plan部分，继续收集动作直到遇到非动作行
            elif in_plan_section and line and not line.startswith(';'):
                # 检查是否还是动作行
                if '(' in line and ')' in line:
                    start = line.find('(')
                    end = line.find(')')
                    if start != -1 and end != -1:
                        action = line[start+1:end]
                        plan_actions.append(action)
                else:
                    # 遇到非动作行，结束plan部分
                    break
        
        # 写入标准格式的计划
        if plan_actions:
            with open(solution_file, 'w') as f:
                for action in plan_actions:
                    f.write(f"({action})\n")
    
    if result == 0:
        print(f"✓ [{scenario_name}] 成功求解并保存到: {solution_file}")
        return True
    else:
        print(f"✗ [{scenario_name}] 求解失败: {os.path.abspath(problem_file)}")
        # 删除失败的解决方案文件
        try:
            if os.path.exists(solution_file):
                os.remove(solution_file)
        except Exception:
            pass
        return False

def solve_all_problems(problems_dir="problems", domain_file="domain.pddl", timeout=5):
    """
    求解problems文件夹下的所有问题
    """
    # 检查domain文件是否存在
    if not os.path.exists(domain_file):
        print(f"错误: 领域文件 {domain_file} 不存在")
        return
    
    # 检查problems文件夹是否存在
    if not os.path.exists(problems_dir):
        print(f"错误: 问题文件夹 {problems_dir} 不存在")
        return
    
    # 获取所有PDDL问题文件
    problem_files = glob.glob(os.path.join(problems_dir, "*.pddl"))
    
    if not problem_files:
        print(f"在 {problems_dir} 文件夹中没有找到PDDL问题文件")
        return
    
    # 获取当前scenario名称
    scenario_name = os.path.basename(os.getcwd())
    
    print(f"🎯 Scenario: {scenario_name}")
    print(f"📁 找到 {len(problem_files)} 个问题文件")
    print(f"⏱️  超时: {timeout} 秒")
    print(f"🚀 开始求解... (按Ctrl+C中断)")
    print("-" * 50)
    
    start_time = time.time()
    successful = 0
    failed = 0
    failed_problems = []  # 记录失败的问题
    
    try:
        for i, problem_file in enumerate(problem_files, 1):
            print(f"[{i}/{len(problem_files)}] ", end="")
            
            if solve_problem(problem_file, domain_file, timeout):
                successful += 1
            else:
                failed += 1
                failed_problems.append(problem_file)
    
    except KeyboardInterrupt:
        print("\n\n用户中断程序")
        print("-" * 50)
    
    end_time = time.time()
    total_time = end_time - start_time
    
    print("-" * 50)
    print(f"求解完成!")
    print(f"总时间: {total_time:.2f} 秒")
    print(f"成功: {successful} 个")
    print(f"失败: {failed} 个")
    if successful + failed > 0:
        print(f"成功率: {successful/(successful+failed)*100:.1f}%")
    
    # 显示失败的问题列表
    if failed_problems:
        print(f"\n❌ 求解失败的问题 ({len(failed_problems)}个):")
        for i, problem in enumerate(failed_problems, 1):
            abs_path = os.path.abspath(problem)
            print(f"  {i:2d}. {abs_path}")
        print("-" * 50)

if __name__ == "__main__":
    import sys
    
    # 可以通过命令行参数指定文件夹、领域文件以及超时时间（秒）
    problems_dir = sys.argv[1] if len(sys.argv) > 1 else "problems"
    domain_file = sys.argv[2] if len(sys.argv) > 2 else "domain.pddl"
    
    # 第三个参数为timeout（秒），可为整数或浮点数
    default_timeout = 5
    if len(sys.argv) > 3:
        try:
            timeout_arg = float(sys.argv[3])
            timeout_value = timeout_arg if timeout_arg > 0 else default_timeout
        except Exception:
            timeout_value = default_timeout
    else:
        timeout_value = default_timeout
    
    solve_all_problems(problems_dir, domain_file, timeout_value)
