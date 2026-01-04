#!/usr/bin/env python3
"""
从 all_problems3 中创建 testing_problems100 数据集
要求：100个问题，按配置(s, p)均匀分配
"""
import os
import shutil
import random
from pathlib import Path
from collections import defaultdict
import re


def parse_delivery(filename: str):
    """解析 delivery 文件名: delivery-s{number}-p{number}-seed{number}.pddl"""
    m = re.match(r"delivery-s(\d+)-p(\d+)-seed\d+\.pddl$", filename)
    if not m:
        return None
    return (int(m.group(1)), int(m.group(2)))


def main():
    base_dir = Path(__file__).parent.resolve()
    source_dir = base_dir / "all_problems3"
    target_dir = base_dir / "testing_problems100"
    
    # 检查源目录
    if not source_dir.exists():
        print(f"错误: 源目录不存在: {source_dir}")
        return
    
    # 按配置(s, p)分类文件，只保留有解(solution)的实例
    files_by_config = defaultdict(list)
    
    for pddl_file in source_dir.glob("*.pddl"):
        filename = pddl_file.name
        # 只保留存在对应 .soln 的问题
        if not pddl_file.with_suffix(".soln").exists():
            continue
        
        config = parse_delivery(filename)
        if config:
            files_by_config[config].append(pddl_file)
    
    # 打印统计信息
    print("源目录问题分布:")
    for config in sorted(files_by_config.keys()):
        count = len(files_by_config[config])
        print(f"  {config}: {count} 个问题")
    
    # 计算每个配置需要选择的问题数（平均分配100个）
    total_needed = 100
    configs = sorted(files_by_config.keys())
    num_configs = len(configs)
    
    if num_configs == 0:
        print("错误: 没有找到任何有解决方案的问题")
        return
    
    # 每个配置的基础数量
    base_count = total_needed // num_configs
    remainder = total_needed % num_configs
    
    selected_files = []
    
    # 第一步：按目标配比从各个配置中选择
    for i, config in enumerate(configs):
        # 前 remainder 个配置多分配 1 个
        target_n = base_count + (1 if i < remainder else 0)
        available = files_by_config[config]
        
        # 实际可选数量不能超过 available
        take_n = min(target_n, len(available))
        if take_n < target_n:
            print(f"警告: {config} 只有 {len(available)} 个有解问题，需要 {target_n} 个，实际选择 {take_n} 个")
        else:
            print(f"{config} 目标 {target_n} 个，实际可用 {len(available)} 个")
        
        if take_n > 0:
            selected = random.sample(available, take_n)
            selected_files.extend(selected)
            print(f"选择 {config}: {take_n} 个问题")
    
    # 第二步：如仍不足 100 个，则从剩余有解问题中补齐
    if len(selected_files) < total_needed:
        remaining_needed = total_needed - len(selected_files)
        print(f"\n当前已选择 {len(selected_files)} 个问题，还需补充 {remaining_needed} 个（仍保证都有解）")
        
        selected_set = set(selected_files)
        remaining_files = []
        for config, files in files_by_config.items():
            remaining_files.extend([f for f in files if f not in selected_set])
        
        if remaining_files:
            additional = random.sample(remaining_files, min(remaining_needed, len(remaining_files)))
            selected_files.extend(additional)
            print(f"额外补充 {len(additional)} 个问题，最终总数 {len(selected_files)} 个")
    
    # 删除已存在的目录
    if target_dir.exists():
        print(f"\n删除已存在的目录: {target_dir}")
        shutil.rmtree(target_dir)
    
    # 创建目标目录
    target_dir.mkdir(parents=True, exist_ok=True)
    
    # 复制文件
    print(f"\n复制文件到 {target_dir}...")
    copied_count = 0
    for pddl_file in selected_files:
        # 复制 .pddl 文件
        shutil.copy2(pddl_file, target_dir / pddl_file.name)
        
        # 复制对应的 .soln 文件
        soln_file = pddl_file.with_suffix(".soln")
        if soln_file.exists():
            shutil.copy2(soln_file, target_dir / soln_file.name)
            copied_count += 1
    
    print(f"\n完成！")
    print(f"目标目录: {target_dir}")
    print(f"总问题数: {len(selected_files)}")
    
    # 统计最终分布
    final_distribution = defaultdict(int)
    for pddl_file in selected_files:
        config = parse_delivery(pddl_file.name)
        if config:
            final_distribution[config] += 1
    
    print(f"\n最终分布:")
    for config in sorted(final_distribution.keys()):
        print(f"  {config}: {final_distribution[config]} 个问题")


if __name__ == "__main__":
    random.seed(42)
    main()

