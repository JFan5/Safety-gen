#!/usr/bin/env python3
"""
从 all_problems3/testing 中创建 testing_problem50 数据集
要求：50个问题，按照位置数(l)和汽车数(c)平均分配
- 位置数：3, 4, 5, 6 各约12-13个
- 汽车数：2 和 3 各25个
"""
import os
import shutil
import random
from pathlib import Path
from collections import defaultdict

def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3/ferry")
    source_dir = base_dir / "all_problems3" / "testing"
    target_dir = base_dir / "testing_problem50"
    
    # 检查源目录
    if not source_dir.exists():
        print(f"错误: 源目录不存在: {source_dir}")
        return
    
    # 按配置分类文件
    files_by_config = defaultdict(list)  # (l, c) -> [files]
    files_by_l = defaultdict(list)       # l -> [files]
    files_by_c = defaultdict(list)       # c -> [files]
    
    for pddl_file in source_dir.glob("*.pddl"):
        filename = pddl_file.name
        # 解析文件名: ferry-l{number}-c{number}-s{number}.pddl
        parts = filename.replace('.pddl', '').split('-')
        if len(parts) >= 3:
            l_str = parts[1].replace('l', '')
            c_str = parts[2].replace('c', '')
            try:
                l = int(l_str)
                c = int(c_str)
                files_by_config[(l, c)].append(pddl_file)
                files_by_l[l].append(pddl_file)
                files_by_c[c].append(pddl_file)
            except ValueError:
                pass
    
    # 打印统计信息
    print("源目录问题分布:")
    print("\n按配置组合 (l, c):")
    for (l, c), files in sorted(files_by_config.items()):
        print(f"  l={l}, c={c}: {len(files)} 个问题")
    
    print("\n按位置数分布:")
    for l in sorted(files_by_l.keys()):
        print(f"  l={l}: {len(files_by_l[l])} 个问题")
    
    print("\n按汽车数分布:")
    for c in sorted(files_by_c.keys()):
        print(f"  c={c}: {len(files_by_c[c])} 个问题")
    
    # 计算分配
    total_needed = 50
    
    # 位置数分配：3, 4, 5, 6 各约12-13个
    l_counts = [3, 4, 5, 6]
    num_l_types = len(l_counts)
    base_l_count = total_needed // num_l_types  # 12
    remainder_l = total_needed % num_l_types     # 2
    
    # 汽车数分配：2 和 3 各25个
    c_counts = [2, 3]
    num_c_types = len(c_counts)
    base_c_count = total_needed // num_c_types  # 25
    
    # 选择文件
    selected_files = []
    selected_by_l = defaultdict(int)
    selected_by_c = defaultdict(int)
    
    # 首先按位置数分配
    for i, l in enumerate(l_counts):
        needed_l = base_l_count + (1 if i < remainder_l else 0)
        available_l = files_by_l[l]
        
        if len(available_l) < needed_l:
            print(f"警告: l={l} 只有 {len(available_l)} 个问题，需要 {needed_l} 个")
            needed_l = len(available_l)
        
        # 从该位置数的问题中随机选择
        selected_l = random.sample(available_l, needed_l)
        selected_files.extend(selected_l)
        selected_by_l[l] = needed_l
        
        # 统计汽车数
        for f in selected_l:
            parts = f.name.replace('.pddl', '').split('-')
            if len(parts) >= 3:
                c_str = parts[2].replace('c', '')
                try:
                    c = int(c_str)
                    selected_by_c[c] += 1
                except:
                    pass
    
    # 检查汽车数分配是否平衡
    print(f"\n初步选择结果:")
    print("按位置数:")
    for l in sorted(selected_by_l.keys()):
        print(f"  l={l}: {selected_by_l[l]} 个问题")
    print("按汽车数:")
    for c in sorted(selected_by_c.keys()):
        print(f"  c={c}: {selected_by_c[c]} 个问题")
    
    # 如果汽车数不平衡，进行调整
    if len(selected_files) == total_needed:
        c2_count = selected_by_c.get(2, 0)
        c3_count = selected_by_c.get(3, 0)
        
        # 目标：各25个
        target_c2 = base_c_count
        target_c3 = base_c_count
        
        if abs(c2_count - target_c2) > 2 or abs(c3_count - target_c3) > 2:
            print(f"\n调整汽车数分配...")
            # 重新选择，确保汽车数平衡
            selected_files = []
            selected_by_l = defaultdict(int)
            selected_by_c = defaultdict(int)
            
            # 按配置组合选择，优先选择能平衡汽车数的组合
            configs = sorted(files_by_config.keys())
            config_selected = defaultdict(int)
            
            # 目标：每个位置数约12-13个，汽车数各25个
            for i, l in enumerate(l_counts):
                needed_l = base_l_count + (1 if i < remainder_l else 0)
                
                # 从该位置数的配置中选择，尽量平衡汽车数
                l_configs = [(l_val, c_val) for (l_val, c_val) in configs if l_val == l]
                
                # 计算当前汽车数
                current_c2 = selected_by_c.get(2, 0)
                current_c3 = selected_by_c.get(3, 0)
                
                # 优先选择能平衡汽车数的配置
                for (l_val, c_val) in l_configs:
                    if len(selected_files) >= total_needed:
                        break
                    
                    available = files_by_config[(l_val, c_val)]
                    if len(available) == 0:
                        continue
                    
                    # 计算还需要多少个
                    remaining_l = needed_l - selected_by_l.get(l_val, 0)
                    if remaining_l <= 0:
                        continue
                    
                    # 检查选择这个配置是否有助于平衡汽车数
                    if c_val == 2 and current_c2 < target_c2:
                        take = min(remaining_l, len(available), target_c2 - current_c2)
                    elif c_val == 3 and current_c3 < target_c3:
                        take = min(remaining_l, len(available), target_c3 - current_c3)
                    else:
                        # 如果已经达到目标，按比例选择
                        take = min(remaining_l, len(available))
                    
                    if take > 0:
                        selected = random.sample(available, take)
                        selected_files.extend(selected)
                        config_selected[(l_val, c_val)] += take
                        selected_by_l[l_val] = selected_by_l.get(l_val, 0) + take
                        selected_by_c[c_val] = selected_by_c.get(c_val, 0) + take
                        current_c2 = selected_by_c.get(2, 0)
                        current_c3 = selected_by_c.get(3, 0)
            
            # 如果还没达到50个，补充
            while len(selected_files) < total_needed:
                # 找到还需要的位置数和汽车数
                for l in l_counts:
                    if len(selected_files) >= total_needed:
                        break
                    needed_l = base_l_count + (1 if l_counts.index(l) < remainder_l else 0)
                    current_l = selected_by_l.get(l, 0)
                    if current_l < needed_l:
                        # 选择该位置数的问题
                        available_l = [f for f in files_by_l[l] if f not in selected_files]
                        if available_l:
                            take = min(needed_l - current_l, len(available_l), total_needed - len(selected_files))
                            selected = random.sample(available_l, take)
                            selected_files.extend(selected)
                            selected_by_l[l] = selected_by_l.get(l, 0) + take
                            for f in selected:
                                parts = f.name.replace('.pddl', '').split('-')
                                if len(parts) >= 3:
                                    c_str = parts[2].replace('c', '')
                                    try:
                                        c = int(c_str)
                                        selected_by_c[c] = selected_by_c.get(c, 0) + 1
                                    except:
                                        pass
    
    # 确保正好50个
    if len(selected_files) > total_needed:
        selected_files = random.sample(selected_files, total_needed)
    elif len(selected_files) < total_needed:
        print(f"警告: 只能选择 {len(selected_files)} 个问题，少于目标 {total_needed} 个")
    
    # 创建目标目录
    if target_dir.exists():
        print(f"\n删除已存在的目录: {target_dir}")
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
    
    # 验证分布
    print("\n最终分布:")
    print("按位置数:")
    final_by_l = defaultdict(int)
    for pddl_file in target_dir.glob("*.pddl"):
        parts = pddl_file.name.replace('.pddl', '').split('-')
        if len(parts) >= 2:
            l_str = parts[1].replace('l', '')
            try:
                l = int(l_str)
                final_by_l[l] += 1
            except:
                pass
    for l in sorted(final_by_l.keys()):
        print(f"  l={l}: {final_by_l[l]} 个问题")
    
    print("按汽车数:")
    final_by_c = defaultdict(int)
    for pddl_file in target_dir.glob("*.pddl"):
        parts = pddl_file.name.replace('.pddl', '').split('-')
        if len(parts) >= 3:
            c_str = parts[2].replace('c', '')
            try:
                c = int(c_str)
                final_by_c[c] += 1
            except:
                pass
    for c in sorted(final_by_c.keys()):
        print(f"  c={c}: {final_by_c[c]} 个问题")
    
    print("\n按配置组合:")
    final_by_config = defaultdict(int)
    for pddl_file in target_dir.glob("*.pddl"):
        parts = pddl_file.name.replace('.pddl', '').split('-')
        if len(parts) >= 3:
            l_str = parts[1].replace('l', '')
            c_str = parts[2].replace('c', '')
            try:
                l = int(l_str)
                c = int(c_str)
                final_by_config[(l, c)] += 1
            except:
                pass
    for (l, c) in sorted(final_by_config.keys()):
        print(f"  l={l}, c={c}: {final_by_config[(l, c)]} 个问题")

if __name__ == "__main__":
    # 设置随机种子以确保可重复性
    random.seed(42)
    main()





