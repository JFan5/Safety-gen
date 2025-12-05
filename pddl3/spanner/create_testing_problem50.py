#!/usr/bin/env python3
"""
从 all_problems3/testing 中创建 testing_problem50 数据集
要求：50个问题，按照扳手数(s)和螺母数(n)平均分配
- 扳手数：2, 3, 4 各约16-17个
- 螺母数：2 和 3 各25个
"""
import os
import shutil
import random
from pathlib import Path
from collections import defaultdict

def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3/spanner")
    source_dir = base_dir / "all_problems3" / "testing"
    target_dir = base_dir / "testing_problem50"
    
    # 检查源目录
    if not source_dir.exists():
        print(f"错误: 源目录不存在: {source_dir}")
        return
    
    # 按配置分类文件
    files_by_config = defaultdict(list)  # (s, n) -> [files]
    files_by_s = defaultdict(list)       # s -> [files]
    files_by_n = defaultdict(list)       # n -> [files]
    
    for pddl_file in source_dir.glob("*.pddl"):
        filename = pddl_file.name
        # 解析文件名: spanner-s{number}-n{number}-l{number}-s{number}.pddl
        parts = filename.replace('.pddl', '').split('-')
        if len(parts) >= 4:
            s_str = parts[1].replace('s', '')
            n_str = parts[2].replace('n', '')
            try:
                s = int(s_str)
                n = int(n_str)
                files_by_config[(s, n)].append(pddl_file)
                files_by_s[s].append(pddl_file)
                files_by_n[n].append(pddl_file)
            except ValueError:
                pass
    
    # 打印统计信息
    print("源目录问题分布:")
    print("\n按配置组合 (s, n):")
    for (s, n), files in sorted(files_by_config.items()):
        print(f"  s={s}, n={n}: {len(files)} 个问题")
    
    print("\n按扳手数分布:")
    for s in sorted(files_by_s.keys()):
        print(f"  s={s}: {len(files_by_s[s])} 个问题")
    
    print("\n按螺母数分布:")
    for n in sorted(files_by_n.keys()):
        print(f"  n={n}: {len(files_by_n[n])} 个问题")
    
    # 计算分配
    total_needed = 50
    
    # 扳手数分配：2, 3, 4 各约16-17个
    s_counts = [2, 3, 4]
    num_s_types = len(s_counts)
    base_s_count = total_needed // num_s_types  # 16
    remainder_s = total_needed % num_s_types     # 2
    
    # 螺母数分配：2 和 3 各25个
    n_counts = [2, 3]
    num_n_types = len(n_counts)
    base_n_count = total_needed // num_n_types  # 25
    
    # 选择文件，同时满足扳手数和螺母数的要求
    selected_files = []
    selected_by_s = defaultdict(int)
    selected_by_n = defaultdict(int)
    selected_by_config = defaultdict(int)
    
    # 策略：先按配置组合选择，确保扳手数和螺母数都平衡
    configs = sorted(files_by_config.keys())
    
    # 目标分配
    target_by_s = {}
    for i, s in enumerate(s_counts):
        target_by_s[s] = base_s_count + (1 if i < remainder_s else 0)
    
    target_by_n = {}
    for n in n_counts:
        target_by_n[n] = base_n_count
    
    print(f"\n目标分配:")
    print("扳手数:")
    for s in sorted(target_by_s.keys()):
        print(f"  s={s}: {target_by_s[s]} 个")
    print("螺母数:")
    for n in sorted(target_by_n.keys()):
        print(f"  n={n}: {target_by_n[n]} 个")
    
    # 按配置组合选择，优先选择能同时满足扳手数和螺母数要求的配置
    for (s, n) in configs:
        if len(selected_files) >= total_needed:
            break
        
        available = files_by_config[(s, n)]
        if len(available) == 0:
            continue
        
        # 计算还需要多少个
        needed_s = target_by_s.get(s, 0) - selected_by_s.get(s, 0)
        needed_n = target_by_n.get(n, 0) - selected_by_n.get(n, 0)
        
        if needed_s <= 0 and needed_n <= 0:
            continue
        
        # 选择数量：取两者中较小的，但不超过可用数量
        take = min(needed_s, needed_n, len(available), total_needed - len(selected_files))
        
        if take > 0:
            selected = random.sample(available, take)
            selected_files.extend(selected)
            selected_by_s[s] = selected_by_s.get(s, 0) + take
            selected_by_n[n] = selected_by_n.get(n, 0) + take
            selected_by_config[(s, n)] = selected_by_config.get((s, n), 0) + take
    
    # 如果还没达到50个，补充
    while len(selected_files) < total_needed:
        # 找到还需要的位置
        for s in s_counts:
            if len(selected_files) >= total_needed:
                break
            needed_s = target_by_s.get(s, 0) - selected_by_s.get(s, 0)
            if needed_s > 0:
                # 从该扳手数的问题中选择，优先选择能平衡螺母数的
                available_s = [f for f in files_by_s[s] if f not in selected_files]
                if available_s:
                    # 优先选择螺母数不足的配置
                    for n in n_counts:
                        if len(selected_files) >= total_needed:
                            break
                        needed_n = target_by_n.get(n, 0) - selected_by_n.get(n, 0)
                        if needed_n > 0:
                            available_sn = [f for f in available_s 
                                          if f in files_by_config.get((s, n), []) 
                                          and f not in selected_files]
                            if available_sn:
                                take = min(needed_s, needed_n, len(available_sn), total_needed - len(selected_files))
                                selected = random.sample(available_sn, take)
                                selected_files.extend(selected)
                                selected_by_s[s] = selected_by_s.get(s, 0) + take
                                selected_by_n[n] = selected_by_n.get(n, 0) + take
                                selected_by_config[(s, n)] = selected_by_config.get((s, n), 0) + take
                                needed_s -= take
                    
                    # 如果还有剩余，随机选择
                    if needed_s > 0 and len(selected_files) < total_needed:
                        remaining = [f for f in available_s if f not in selected_files]
                        if remaining:
                            take = min(needed_s, len(remaining), total_needed - len(selected_files))
                            selected = random.sample(remaining, take)
                            selected_files.extend(selected)
                            selected_by_s[s] = selected_by_s.get(s, 0) + take
                            # 更新螺母数统计
                            for f in selected:
                                parts = f.name.replace('.pddl', '').split('-')
                                if len(parts) >= 3:
                                    n_str = parts[2].replace('n', '')
                                    try:
                                        n = int(n_str)
                                        selected_by_n[n] = selected_by_n.get(n, 0) + 1
                                        selected_by_config[(s, n)] = selected_by_config.get((s, n), 0) + 1
                                    except:
                                        pass
    
    # 确保正好50个
    if len(selected_files) > total_needed:
        selected_files = random.sample(selected_files, total_needed)
    elif len(selected_files) < total_needed:
        print(f"警告: 只能选择 {len(selected_files)} 个问题，少于目标 {total_needed} 个")
    
    # 重新统计最终选择
    final_by_s = defaultdict(int)
    final_by_n = defaultdict(int)
    final_by_config = defaultdict(int)
    for f in selected_files:
        parts = f.name.replace('.pddl', '').split('-')
        if len(parts) >= 4:
            s_str = parts[1].replace('s', '')
            n_str = parts[2].replace('n', '')
            try:
                s = int(s_str)
                n = int(n_str)
                final_by_s[s] += 1
                final_by_n[n] += 1
                final_by_config[(s, n)] += 1
            except:
                pass
    
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
    print("按扳手数:")
    for s in sorted(final_by_s.keys()):
        print(f"  s={s}: {final_by_s[s]} 个问题")
    
    print("按螺母数:")
    for n in sorted(final_by_n.keys()):
        print(f"  n={n}: {final_by_n[n]} 个问题")
    
    print("\n按配置组合:")
    for (s, n) in sorted(final_by_config.keys()):
        print(f"  s={s}, n={n}: {final_by_config[(s, n)]} 个问题")

if __name__ == "__main__":
    # 设置随机种子以确保可重复性
    random.seed(42)
    main()





