#!/usr/bin/env python3
"""
从五个场景（blocksworld, delivery, ferry, grippers, spanner）的 all_problems3/testing 中
创建 testing_problems100 数据集（每个场景 100 个问题）

要求：
- blocksworld: 100个问题，按 n=3,4,5,6 均匀分配（各25个），放在 blocksworld/testing_problems100
- delivery: 100个问题，按配置(s, p)均匀分配，放在 delivery/testing_problems100
- ferry: 100个问题，按位置数(l)和汽车数(c)均匀分配，放在 ferry/testing_problems100
- grippers: 100个问题，按机器人数(n)和房间数(r)均匀分配，放在 grippers/testing_problems100
- spanner: 100个问题，按扳手数(s)和螺母数(n)均匀分配，放在 spanner/testing_problems100
"""
import os
import shutil
import random
import re
from pathlib import Path
from collections import defaultdict


def select_blocksworld(source_dir: Path, target_count: int = 20):
    """从 blocksworld 的 all_problems3/testing 中选择问题"""
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
    
    print(f"\n[blocksworld] 源目录问题分布:")
    for n in [3, 4, 5, 6]:
        count = len(files_by_blocks[n])
        print(f"  {n} blocks: {count} 个问题")
    
    # 每个blocks数量需要选择的问题数（平均分配20个）
    blocks_counts = [3, 4, 5, 6]
    num_blocks_types = len(blocks_counts)
    base_count = target_count // num_blocks_types  # 5
    remainder = target_count % num_blocks_types     # 0
    
    selected_files = []
    for i, n in enumerate(blocks_counts):
        target_n = base_count + (1 if i < remainder else 0)
        available = files_by_blocks[n]
        take_n = min(target_n, len(available))
        if take_n > 0:
            selected = random.sample(available, take_n)
            selected_files.extend(selected)
            print(f"  选择 {n} blocks: {take_n} 个问题")
    
    # 如果不足，从剩余中补齐
    if len(selected_files) < target_count:
        remaining_needed = target_count - len(selected_files)
        selected_set = set(selected_files)
        remaining_pool = []
        for n in blocks_counts:
            for p in files_by_blocks[n]:
                if p not in selected_set:
                    remaining_pool.append(p)
        if remaining_pool:
            extra = random.sample(remaining_pool, min(remaining_needed, len(remaining_pool)))
            selected_files.extend(extra)
            print(f"  额外补充 {len(extra)} 个问题")
    
    return selected_files[:target_count]


def parse_delivery(filename: str):
    """解析 delivery 文件名: delivery-s{number}-p{number}-seed{number}.pddl"""
    m = re.match(r"delivery-s(\d+)-p(\d+)-seed\d+\.pddl$", filename)
    if not m:
        return None
    return (int(m.group(1)), int(m.group(2)))


def select_delivery(source_dir: Path, target_count: int = 20):
    """从 delivery 的 all_problems3 中选择问题（注意：delivery 没有 testing 子目录）"""
    files_by_config = defaultdict(list)
    
    for pddl_file in source_dir.glob("*.pddl"):
        filename = pddl_file.name
        # 只保留存在对应 .soln 的问题
        if not pddl_file.with_suffix(".soln").exists():
            continue
        config = parse_delivery(filename)
        if config:
            files_by_config[config].append(pddl_file)
    
    print(f"\n[delivery] 源目录问题分布:")
    for config in sorted(files_by_config.keys()):
        count = len(files_by_config[config])
        print(f"  {config}: {count} 个问题")
    
    # 按配置均匀分配
    configs = sorted(files_by_config.keys())
    num_configs = len(configs)
    if num_configs == 0:
        print("  错误: 没有找到任何有解决方案的问题")
        return []
    
    base_count = target_count // num_configs
    remainder = target_count % num_configs
    
    selected_files = []
    for i, config in enumerate(configs):
        target_n = base_count + (1 if i < remainder else 0)
        available = files_by_config[config]
        take_n = min(target_n, len(available))
        if take_n > 0:
            selected = random.sample(available, take_n)
            selected_files.extend(selected)
            print(f"  选择 {config}: {take_n} 个问题")
    
    # 如果不足，从剩余中补齐
    if len(selected_files) < target_count:
        remaining_needed = target_count - len(selected_files)
        selected_set = set(selected_files)
        remaining_files = []
        for config, files in files_by_config.items():
            remaining_files.extend([f for f in files if f not in selected_set])
        if remaining_files:
            additional = random.sample(remaining_files, min(remaining_needed, len(remaining_files)))
            selected_files.extend(additional)
            print(f"  额外补充 {len(additional)} 个问题")
    
    return selected_files[:target_count]


def select_ferry(source_dir: Path, target_count: int = 20):
    """从 ferry 的 all_problems3/testing 中选择问题"""
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
    
    print(f"\n[ferry] 源目录问题分布:")
    print("  按配置组合 (l, c):")
    for (l, c), files in sorted(files_by_config.items()):
        print(f"    l={l}, c={c}: {len(files)} 个问题")
    
    # 位置数分配：3, 4, 5, 6 均匀分配
    l_counts = [3, 4, 5, 6]
    num_l_types = len(l_counts)
    base_l_count = target_count // num_l_types
    remainder_l = target_count % num_l_types
    
    # 汽车数分配：2 和 3 均匀分配
    c_counts = [2, 3]
    num_c_types = len(c_counts)
    base_c_count = target_count // num_c_types
    
    selected_files = []
    selected_by_l = defaultdict(int)
    selected_by_c = defaultdict(int)
    
    # 按配置组合选择，优先平衡 l 和 c
    configs = sorted(files_by_config.keys())
    target_by_l = {l: base_l_count + (1 if i < remainder_l else 0) for i, l in enumerate(l_counts)}
    target_by_c = {c: base_c_count for c in c_counts}
    
    for (l, c) in configs:
        if len(selected_files) >= target_count:
            break
        available = files_by_config[(l, c)]
        if len(available) == 0:
            continue
        needed_l = target_by_l.get(l, 0) - selected_by_l.get(l, 0)
        needed_c = target_by_c.get(c, 0) - selected_by_c.get(c, 0)
        if needed_l <= 0 and needed_c <= 0:
            continue
        take = min(needed_l, needed_c, len(available), target_count - len(selected_files))
        if take > 0:
            selected = random.sample(available, take)
            selected_files.extend(selected)
            selected_by_l[l] = selected_by_l.get(l, 0) + take
            selected_by_c[c] = selected_by_c.get(c, 0) + take
    
    # 如果不足，补充
    while len(selected_files) < target_count:
        for l in l_counts:
            if len(selected_files) >= target_count:
                break
            needed_l = target_by_l.get(l, 0) - selected_by_l.get(l, 0)
            if needed_l > 0:
                available_l = [f for f in files_by_l[l] if f not in selected_files]
                if available_l:
                    take = min(needed_l, len(available_l), target_count - len(selected_files))
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
    
    print(f"  最终选择: l分布={dict(selected_by_l)}, c分布={dict(selected_by_c)}")
    return selected_files[:target_count]


def select_grippers(source_dir: Path, target_count: int = 20):
    """从 grippers 的 all_problems3/testing 中选择问题"""
    files_by_config: dict[tuple[int, int, int], list[Path]] = defaultdict(list)
    files_by_n: dict[int, list[Path]] = defaultdict(list)
    files_by_r: dict[int, list[Path]] = defaultdict(list)
    
    for pddl_file in source_dir.glob("*.pddl"):
        # 只保留存在对应 .soln 的问题
        if not pddl_file.with_suffix(".soln").exists():
            continue
        name = pddl_file.name.replace(".pddl", "")
        # 期望格式: grippers-n{n}-r{r}-o{O}-s{seed}
        parts = name.split("-")
        if len(parts) < 4:
            continue
        try:
            n = int(parts[1].replace("n", ""))
            r = int(parts[2].replace("r", ""))
            o = int(parts[3].replace("o", ""))
        except ValueError:
            continue
        files_by_config[(n, r, o)].append(pddl_file)
        files_by_n[n].append(pddl_file)
        files_by_r[r].append(pddl_file)
    
    print(f"\n[grippers] 源目录问题分布:")
    print("  按配置组合 (n, r, o):")
    for (n, r, o), files in sorted(files_by_config.items()):
        print(f"    n={n}, r={r}, o={o}: {len(files)} 个问题")
    
    # 目标分配：n=1,2 均匀分配，r=3,4 均匀分配
    n_values = [1, 2]
    r_values = [3, 4]
    base_n_count = target_count // len(n_values)
    remainder_n = target_count % len(n_values)
    base_r_count = target_count // len(r_values)
    remainder_r = target_count % len(r_values)
    target_by_n: dict[int, int] = {}
    for i, n in enumerate(n_values):
        target_by_n[n] = base_n_count + (1 if i < remainder_n else 0)
    target_by_r: dict[int, int] = {}
    for i, r in enumerate(r_values):
        target_by_r[r] = base_r_count + (1 if i < remainder_r else 0)
    
    selected_files: list[Path] = []
    selected_by_n: dict[int, int] = defaultdict(int)
    selected_by_r: dict[int, int] = defaultdict(int)
    
    # 按配置组合选择，优先平衡 n 和 r
    configs = sorted(files_by_config.keys())
    for (n, r, o) in configs:
        if len(selected_files) >= target_count:
            break
        available = files_by_config[(n, r, o)]
        if not available:
            continue
        need_n = target_by_n.get(n, 0) - selected_by_n.get(n, 0)
        need_r = target_by_r.get(r, 0) - selected_by_r.get(r, 0)
        if need_n <= 0 and need_r <= 0:
            continue
        take = min(
            max(need_n, 0) if need_n > 0 else len(available),
            max(need_r, 0) if need_r > 0 else len(available),
            len(available),
            target_count - len(selected_files),
        )
        if take <= 0:
            continue
        chosen = random.sample(available, take)
        selected_files.extend(chosen)
        selected_by_n[n] += take
        selected_by_r[r] += take
    
    # 如果不足，补充
    while len(selected_files) < target_count:
        progress = False
        for n in n_values:
            if len(selected_files) >= target_count:
                break
            need_n = target_by_n[n] - selected_by_n.get(n, 0)
            if need_n <= 0:
                continue
            for r in r_values:
                if len(selected_files) >= target_count:
                    break
                need_r = target_by_r[r] - selected_by_r.get(r, 0)
                if need_r <= 0:
                    continue
                for (cfg_n, cfg_r, cfg_o), files in files_by_config.items():
                    if cfg_n != n or cfg_r != r:
                        continue
                    remaining = [f for f in files if f not in selected_files]
                    if not remaining:
                        continue
                    take = min(need_n, need_r, len(remaining), target_count - len(selected_files))
                    if take <= 0:
                        continue
                    chosen = random.sample(remaining, take)
                    selected_files.extend(chosen)
                    selected_by_n[n] += take
                    selected_by_r[r] += take
                    need_n -= take
                    need_r -= take
                    progress = True
                    if len(selected_files) >= target_count:
                        break
        if not progress:
            remaining_all = [
                f for files in files_by_config.values() for f in files if f not in selected_files
            ]
            if not remaining_all:
                break
            take = min(target_count - len(selected_files), len(remaining_all))
            selected_files.extend(random.sample(remaining_all, take))
            break
    
    print(f"  最终选择: n分布={dict(selected_by_n)}, r分布={dict(selected_by_r)}")
    return selected_files[:target_count]


def select_spanner(source_dir: Path, target_count: int = 20):
    """从 spanner 的 all_problems3/testing 中选择问题"""
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
    
    print(f"\n[spanner] 源目录问题分布:")
    print("  按配置组合 (s, n):")
    for (s, n), files in sorted(files_by_config.items()):
        print(f"    s={s}, n={n}: {len(files)} 个问题")
    
    # 扳手数分配：2, 3, 4 均匀分配
    s_counts = [2, 3, 4]
    num_s_types = len(s_counts)
    base_s_count = target_count // num_s_types
    remainder_s = target_count % num_s_types
    
    # 螺母数分配：2 和 3 均匀分配
    n_counts = [2, 3]
    num_n_types = len(n_counts)
    base_n_count = target_count // num_n_types
    
    selected_files = []
    selected_by_s = defaultdict(int)
    selected_by_n = defaultdict(int)
    
    # 目标分配
    target_by_s = {}
    for i, s in enumerate(s_counts):
        target_by_s[s] = base_s_count + (1 if i < remainder_s else 0)
    target_by_n = {n: base_n_count for n in n_counts}
    
    # 按配置组合选择，优先平衡 s 和 n
    configs = sorted(files_by_config.keys())
    for (s, n) in configs:
        if len(selected_files) >= target_count:
            break
        available = files_by_config[(s, n)]
        if len(available) == 0:
            continue
        needed_s = target_by_s.get(s, 0) - selected_by_s.get(s, 0)
        needed_n = target_by_n.get(n, 0) - selected_by_n.get(n, 0)
        if needed_s <= 0 and needed_n <= 0:
            continue
        take = min(needed_s, needed_n, len(available), target_count - len(selected_files))
        if take > 0:
            selected = random.sample(available, take)
            selected_files.extend(selected)
            selected_by_s[s] = selected_by_s.get(s, 0) + take
            selected_by_n[n] = selected_by_n.get(n, 0) + take
    
    # 如果不足，补充
    while len(selected_files) < target_count:
        progress = False
        for s in s_counts:
            if len(selected_files) >= target_count:
                break
            needed_s = target_by_s.get(s, 0) - selected_by_s.get(s, 0)
            if needed_s > 0:
                available_s = [f for f in files_by_s[s] if f not in selected_files]
                if available_s:
                    for n in n_counts:
                        if len(selected_files) >= target_count:
                            break
                        needed_n = target_by_n.get(n, 0) - selected_by_n.get(n, 0)
                        if needed_n > 0:
                            available_sn = [f for f in available_s 
                                          if f in files_by_config.get((s, n), []) 
                                          and f not in selected_files]
                            if available_sn:
                                take = min(needed_s, needed_n, len(available_sn), target_count - len(selected_files))
                                selected = random.sample(available_sn, take)
                                selected_files.extend(selected)
                                selected_by_s[s] = selected_by_s.get(s, 0) + take
                                selected_by_n[n] = selected_by_n.get(n, 0) + take
                                needed_s -= take
                                progress = True
                    if needed_s > 0 and len(selected_files) < target_count:
                        remaining = [f for f in available_s if f not in selected_files]
                        if remaining:
                            take = min(needed_s, len(remaining), target_count - len(selected_files))
                            selected = random.sample(remaining, take)
                            selected_files.extend(selected)
                            selected_by_s[s] = selected_by_s.get(s, 0) + take
                            for f in selected:
                                parts = f.name.replace('.pddl', '').split('-')
                                if len(parts) >= 3:
                                    n_str = parts[2].replace('n', '')
                                    try:
                                        n = int(n_str)
                                        selected_by_n[n] = selected_by_n.get(n, 0) + 1
                                    except:
                                        pass
                            progress = True
        
        # 如果没有进展，说明没有更多文件可以选择，退出循环
        if not progress:
            # 尝试从所有剩余文件中补充
            all_remaining = [f for files in files_by_config.values() for f in files if f not in selected_files]
            if all_remaining:
                take = min(target_count - len(selected_files), len(all_remaining))
                selected = random.sample(all_remaining, take)
                selected_files.extend(selected)
                for f in selected:
                    parts = f.name.replace('.pddl', '').split('-')
                    if len(parts) >= 4:
                        s_str = parts[1].replace('s', '')
                        n_str = parts[2].replace('n', '')
                        try:
                            s = int(s_str)
                            n = int(n_str)
                            selected_by_s[s] = selected_by_s.get(s, 0) + 1
                            selected_by_n[n] = selected_by_n.get(n, 0) + 1
                        except:
                            pass
            else:
                # 没有更多文件了，退出循环
                break
    
    print(f"  最终选择: s分布={dict(selected_by_s)}, n分布={dict(selected_by_n)}")
    return selected_files[:target_count]


def main():
    base_dir = Path("/home/ubuntu/Safety-gen/pddl3")
    
    # 设置随机种子以确保可重复性
    random.seed(42)
    
    # 每个场景选择100个问题
    target_per_scenario = 100
    
    scenarios = {
        "blocksworld": {
            "source": base_dir / "blocksworld" / "all_problems3" / "testing",
            "target": base_dir / "blocksworld" / "testing_problems100",
            "selector": select_blocksworld,
        },
        "delivery": {
            "source": base_dir / "delivery" / "all_problems3",  # delivery 没有 testing 子目录
            "target": base_dir / "delivery" / "testing_problems100",
            "selector": select_delivery,
        },
        "ferry": {
            "source": base_dir / "ferry" / "all_problems3" / "testing",
            "target": base_dir / "ferry" / "testing_problems100",
            "selector": select_ferry,
        },
        "grippers": {
            "source": base_dir / "grippers" / "all_problems3" / "testing",
            "target": base_dir / "grippers" / "testing_problems100",
            "selector": select_grippers,
        },
        "spanner": {
            "source": base_dir / "spanner" / "all_problems3" / "testing",
            "target": base_dir / "spanner" / "testing_problems100",
            "selector": select_spanner,
        },
    }
    
    # 为每个场景选择问题并复制到各自的目录
    for scen_name, scen_cfg in scenarios.items():
        source_dir = scen_cfg["source"]
        target_dir = scen_cfg["target"]
        selector = scen_cfg["selector"]
        
        if not source_dir.exists():
            print(f"\n错误: [{scen_name}] 源目录不存在: {source_dir}")
            continue
        
        print(f"\n{'='*60}")
        print(f"处理场景: {scen_name}")
        print(f"{'='*60}")
        
        selected = selector(source_dir, target_per_scenario)
        print(f"[{scen_name}] 选择了 {len(selected)} 个问题")
        
        # 创建目标目录
        if target_dir.exists():
            print(f"\n删除已存在的目录: {target_dir}")
            shutil.rmtree(target_dir)
        target_dir.mkdir(parents=True, exist_ok=True)
        
        # 复制文件
        print(f"复制文件到 {target_dir}...")
        for pddl_file in selected:
            # 复制 .pddl 文件
            shutil.copy2(pddl_file, target_dir / pddl_file.name)
            
            # 如果存在对应的 .soln 文件，也复制
            soln_file = pddl_file.with_suffix('.soln')
            if soln_file.exists():
                shutil.copy2(soln_file, target_dir / soln_file.name)
        
        # 验证结果
        final_count = len(list(target_dir.glob("*.pddl")))
        print(f"[{scen_name}] 完成！目标目录: {target_dir}")
        print(f"[{scen_name}] 总问题数: {final_count}")
    
    # 最终总结
    print(f"\n{'='*60}")
    print(f"所有场景处理完成！")
    print(f"{'='*60}")
    
    # 按场景统计
    print("\n各场景问题数统计:")
    for scen_name, scen_cfg in scenarios.items():
        target_dir = scen_cfg["target"]
        if target_dir.exists():
            count = len(list(target_dir.glob("*.pddl")))
            print(f"  {scen_name}: {count} 个问题 (位于 {target_dir})")


if __name__ == "__main__":
    main()

