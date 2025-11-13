#!/usr/bin/env python3
"""
脚本功能：
1. 从 blocksworld/all_problems3/training 中挑选500条数据
2. 要求这些数据不与 pddl3_dataset.json 中的 problem_file 重复
3. 确保所有问题都有对应的 .soln 文件（有解）
4. 只复制 .pddl 和 .soln 文件到 blocksworld/dpo_training 目录
5. 使用验证脚本验证所有问题都有解和可解
"""

import json
import os
import shutil
from pathlib import Path
import random
import subprocess

# 配置路径
base_dir = Path("/home/ubuntu/Safety-gen")
dpo_training_dir = base_dir / "blocksworld" / "dpo_training"
pddl3_dataset_path = base_dir / "data" / "sft" / "blocksworld-variant-500" / "pddl3_dataset.json"
training_dir = base_dir / "blocksworld" / "all_problems3" / "training"
testing_dir = base_dir / "blocksworld" / "all_problems3" / "testing"
all_problems_dir = base_dir / "blocksworld" / "all_problems"
domain_file = base_dir / "blocksworld" / "domain3.pddl"

def validate_solution(domain_file: str, problem_file: str, solution_file: str, timeout_sec: int = 10):
    """使用 Validate 验证 solution 是否有效"""
    try:
        cmd = f"Validate -v {domain_file} {problem_file} {solution_file}"
        result = subprocess.run(
            cmd,
            shell=True,
            capture_output=True,
            text=True,
            timeout=timeout_sec
        )
        
        if result.returncode == 0:
            output = result.stdout.lower()
            is_valid = "plan valid" in output or "plan successfully executed" in output
            return is_valid
        return False
    except (subprocess.TimeoutExpired, Exception):
        return False

print("=" * 60)
print("步骤1: 读取 pddl3_dataset.json，提取已存在的 problem_file")
print("=" * 60)

# 读取 pddl3_dataset.json，提取所有 problem_file 值
with open(pddl3_dataset_path, 'r') as f:
    dataset = json.load(f)

existing_problem_files = set()
for item in dataset:
    problem_file = item.get('problem_file', '')
    if problem_file:
        # 提取文件名（只提取文件名部分，不包括路径前缀）
        filename = os.path.basename(problem_file)
        existing_problem_files.add(filename)

print(f"找到 {len(existing_problem_files)} 个已存在的 problem 文件")
print(f"示例: {list(existing_problem_files)[:3]}")

print("\n" + "=" * 60)
print("步骤2: 扫描 training 目录，找到所有 .pddl 文件及其对应的 .soln 文件")
print("=" * 60)

# 获取所有 .pddl 文件
all_pddl_files = list(training_dir.glob("*.pddl"))
print(f"找到 {len(all_pddl_files)} 个 .pddl 文件")

print("\n" + "=" * 60)
print("步骤2.1: 检查 all_problems 和 testing 目录，筛选可用文件")
print("=" * 60)

# 获取 testing 目录中的所有文件名
testing_files = set()
if testing_dir.exists():
    testing_pddl_files = list(testing_dir.glob("*.pddl"))
    testing_files = {f.name for f in testing_pddl_files}
    print(f"找到 {len(testing_files)} 个 testing 目录中的文件")
else:
    print("testing 目录不存在，跳过 testing 检查")

# 筛选出不重复且有解的文件，并检查all_problems下的solution不能求解
available_files = []
skipped_by_all_problems = 0
skipped_by_testing = 0

for i, pddl_file in enumerate(all_pddl_files, 1):
    filename = pddl_file.name
    
    # 检查是否已存在于 pddl3_dataset.json 中
    if filename in existing_problem_files:
        continue
    
    # 检查是否存在于 testing 目录中
    if filename in testing_files:
        skipped_by_testing += 1
        continue
    
    # 检查是否有对应的 .soln 文件
    soln_file = pddl_file.with_suffix('.soln')
    if not soln_file.exists():
        continue
    
    # 检查 all_problems 目录下是否存在同名的 problem 和 solution
    all_problems_pddl = all_problems_dir / filename
    all_problems_soln = all_problems_dir / soln_file.name
    
    if all_problems_pddl.exists() and all_problems_soln.exists():
        # 验证 all_problems 下的 solution 是否能求解 training 下的 problem
        # 注意：这里用 training 的 problem 和 all_problems 的 solution 来验证
        if validate_solution(str(domain_file), str(pddl_file), str(all_problems_soln)):
            skipped_by_all_problems += 1
            continue  # 如果 all_problems 的 solution 能求解，跳过这个问题
    
    available_files.append({
        'pddl_file': pddl_file,
        'soln_file': soln_file,
        'filename': filename
    })
    
    if i % 500 == 0:
        print(f"已处理 {i}/{len(all_pddl_files)} 个文件，找到 {len(available_files)} 个可用文件，跳过 all_problems: {skipped_by_all_problems}，跳过 testing: {skipped_by_testing} 个")

print(f"找到 {len(available_files)} 个不重复且有解的文件")
print(f"跳过了 {skipped_by_all_problems} 个可被 all_problems 下的 solution 求解的问题")
print(f"跳过了 {skipped_by_testing} 个存在于 testing 目录中的问题")

if len(available_files) < 500:
    print(f"警告: 只有 {len(available_files)} 个可用文件，少于所需的500个")
    print(f"将使用所有 {len(available_files)} 个文件")
    selected_files = available_files
else:
    # 随机选择500个
    selected_files = random.sample(available_files, 500)
    print(f"随机选择了500个文件")

print("\n" + "=" * 60)
print("步骤3: 删除现有的 dpo_training 文件夹")
print("=" * 60)

# 删除现有的 dpo_training 文件夹
if dpo_training_dir.exists():
    print(f"删除现有的 dpo_training 文件夹: {dpo_training_dir}")
    shutil.rmtree(dpo_training_dir)

print("\n" + "=" * 60)
print("步骤4: 创建新的 dpo_training 文件夹并复制文件")
print("=" * 60)

# 创建新的 dpo_training 文件夹
print(f"创建新的 dpo_training 文件夹: {dpo_training_dir}")
dpo_training_dir.mkdir(parents=True, exist_ok=True)

# 复制选中的文件
copied_count = 0
for i, file_info in enumerate(selected_files, 1):
    pddl_src = file_info['pddl_file']
    soln_src = file_info['soln_file']
    
    pddl_dst = dpo_training_dir / pddl_src.name
    soln_dst = dpo_training_dir / soln_src.name
    
    # 复制 .pddl 文件
    shutil.copy2(pddl_src, pddl_dst)
    # 复制 .soln 文件
    shutil.copy2(soln_src, soln_dst)
    
    copied_count += 1
    if i % 50 == 0:
        print(f"已复制 {i}/{len(selected_files)} 个文件对")

print(f"\n完成！共复制了 {copied_count} 个文件对（.pddl 和 .soln）")

print("\n" + "=" * 60)
print("步骤5: 验证所有问题都有解和可解")
print("=" * 60)

# 切换到 blocksworld 目录并运行验证脚本
validation_cmd = [
    "python3",
    str(base_dir / "script" / "validate_classical_solvers.py"),
    "--domain", str(base_dir / "blocksworld" / "domain3.pddl"),
    "--problems_dir", str(dpo_training_dir),
    "--solutions_dir", str(dpo_training_dir)
]

print(f"运行验证命令: {' '.join(validation_cmd)}")
print()

try:
    result = subprocess.run(
        validation_cmd,
        check=True,
        text=True,
        capture_output=True
    )
    
    print("验证输出:")
    print(result.stdout)
    
    if result.stderr:
        print("验证错误输出:")
        print(result.stderr)
    
    # 检查验证结果文件（验证脚本会创建结果文件，名称可能不同）
    possible_results_files = [
        base_dir / "blocksworld" / "dpo_training_validation_results.json",
        base_dir / "blocksworld" / "blocksworld_domain3_validation_results.json",
        base_dir / "blocksworld" / f"blocksworld_domain3_validation_results.json"
    ]
    
    validation_results_file = None
    for path in possible_results_files:
        if path.exists():
            validation_results_file = path
            break
    
    if validation_results_file and validation_results_file.exists():
        with open(validation_results_file, 'r') as f:
            validation_results = json.load(f)
        
        summary = validation_results.get('summary', {})
        total = summary.get('total_solutions', 0)
        valid = summary.get('valid', 0)
        invalid = summary.get('invalid', 0)
        
        print("\n" + "=" * 60)
        print("验证结果摘要")
        print("=" * 60)
        print(f"总问题数: {total}")
        print(f"有效解: {valid}")
        print(f"无效解: {invalid}")
        
        if total > 0:
            success_rate = valid / total * 100
            print(f"成功率: {success_rate:.1f}%")
            
            if invalid > 0:
                print(f"\n⚠️  警告: 有 {invalid} 个问题没有有效的解！")
            else:
                print(f"\n✓ 所有问题都有有效解！")
    
except subprocess.CalledProcessError as e:
    print(f"验证过程出错: {e}")
    print(f"返回码: {e.returncode}")
    if e.stdout:
        print(f"标准输出: {e.stdout}")
    if e.stderr:
        print(f"错误输出: {e.stderr}")
    print("\n⚠️  警告: 验证脚本执行失败，但文件已复制完成。")
    print("请手动运行以下命令验证：")
    print(f"  cd {base_dir / 'blocksworld'}")
    print("  python ../script/validate_classical_solvers.py --domain domain3.pddl --problems_dir dpo_training --solutions_dir dpo_training")

print("\n" + "=" * 60)
print("任务完成！")
print("=" * 60)
print(f"文件已复制到: {dpo_training_dir}")
print(f"包含 {len(selected_files)} 个问题文件对")

