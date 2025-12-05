#!/usr/bin/env python3
"""
从 all_problems3/testing 中创建 testing_problem50 数据集
要求：50个问题，3-4-5-6 blocks平均分配
"""
import os
import shutil
import random
from pathlib import Path
from collections import defaultdict

def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3/blocksworld")
    source_dir = base_dir / "all_problems3" / "testing"
    target_dir = base_dir / "testing_problem50"
    
    # 检查源目录
    if not source_dir.exists():
        print(f"错误: 源目录不存在: {source_dir}")
        return
    
    # 按blocks数量分类文件，只保留有解(solution)的实例
    files_by_blocks = defaultdict(list)
    
    for pddl_file in source_dir.glob("*.pddl"):
        filename = pddl_file.name
        # 只保留存在对应 .soln 的问题
        if not pddl_file.with_suffix(".soln").exists():
            continue
        # 解析文件名: bw_ops{3|4}_n{3|4|5|6}_seed{number}.pddl
        if "_n3_" in filename:
            files_by_blocks[3].append(pddl_file)
        elif "_n4_" in filename:
            files_by_blocks[4].append(pddl_file)
        elif "_n5_" in filename:
            files_by_blocks[5].append(pddl_file)
        elif "_n6_" in filename:
            files_by_blocks[6].append(pddl_file)
    
    # 打印统计信息
    print("源目录问题分布:")
    for n in [3, 4, 5, 6]:
        count = len(files_by_blocks[n])
        print(f"  {n} blocks: {count} 个问题")
    
    # 计算每个blocks数量需要选择的问题数（平均分配50个）
    total_needed = 50
    blocks_counts = [3, 4, 5, 6]
    num_blocks_types = len(blocks_counts)
    
    # 每个类型的基础数量
    base_count = total_needed // num_blocks_types  # 12
    remainder = total_needed % num_blocks_types     # 2
    
    selected_files = []
    
    # 第一步：按目标配比从各个 blocks 中选择，可能总数 < 50（例如 3-block 不足）
    for i, n in enumerate(blocks_counts):
        # 前 remainder 个类型多分配 1 个
        target_n = base_count + (1 if i < remainder else 0)
        available = files_by_blocks[n]
        
        # 实际可选数量不能超过 available
        take_n = min(target_n, len(available))
        if take_n < target_n:
            print(f"警告: {n} blocks 只有 {len(available)} 个有解问题，需要 {target_n} 个，实际选择 {take_n} 个")
        else:
            print(f"{n} blocks 目标 {target_n} 个，实际可用 {len(available)} 个")
        
        if take_n > 0:
            selected = random.sample(available, take_n)
            selected_files.extend(selected)
            print(f"选择 {n} blocks: {take_n} 个问题")
    
    # 第二步：如仍不足 50 个，则从剩余有解问题中补齐
    if len(selected_files) < total_needed:
        remaining_needed = total_needed - len(selected_files)
        print(f"\n当前已选择 {len(selected_files)} 个问题，还需补充 {remaining_needed} 个（仍保证都有解）")
        
        selected_set = set(selected_files)
        remaining_pool = []
        for n in blocks_counts:
            for p in files_by_blocks[n]:
                if p not in selected_set:
                    remaining_pool.append(p)
        
        if len(remaining_pool) < remaining_needed:
            print(f"警告: 剩余有解问题只有 {len(remaining_pool)} 个，无法补足到 {total_needed} 个，将使用所有剩余问题")
            extra = remaining_pool
        else:
            extra = random.sample(remaining_pool, remaining_needed)
        
        selected_files.extend(extra)
        print(f"额外补充 {len(extra)} 个问题，最终总数 {len(selected_files)} 个")
    
    # 创建目标目录
    if target_dir.exists():
        print(f"删除已存在的目录: {target_dir}")
        shutil.rmtree(target_dir)
    target_dir.mkdir(parents=True, exist_ok=True)
    
    # 复制文件
    print(f"\n复制文件到 {target_dir}...")
    for pddl_file in selected_files:
        # 复制 .pddl 文件
        shutil.copy2(pddl_file, target_dir / pddl_file.name)
        
        # 如果存在对应的 .soln 文件，也复制
        soln_file = pddl_file.with_suffix('.soln')
        if soln_file.exists():
            shutil.copy2(soln_file, target_dir / soln_file.name)
    
    # 验证结果
    final_count = len(list(target_dir.glob("*.pddl")))
    print(f"\n完成！")
    print(f"目标目录: {target_dir}")
    print(f"总问题数: {final_count}")
    
    # 验证blocks分布
    print("\n最终分布:")
    for n in [3, 4, 5, 6]:
        count = len(list(target_dir.glob(f"bw_ops*_n{n}_*.pddl")))
        print(f"  {n} blocks: {count} 个问题")

if __name__ == "__main__":
    # 设置随机种子以确保可重复性
    random.seed(42)
    main()


