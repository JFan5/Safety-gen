#!/usr/bin/env python3
"""
从 all_problems3/testing 中创建 grippers 的 testing_problem50 数据集

要求：
- 总共 50 个 testing 问题
- 按“机器人数 n = {1, 2}”和“房间数 r = {3, 4}”尽量平均分配
  - n=1 ≈ 25 个，n=2 ≈ 25 个
  - r=3 ≈ 25 个，r=4 ≈ 25 个

注意：按物体数 o（2,3,4）不强制均匀，只保证来自原始分布。
"""

import shutil
import random
from pathlib import Path
from collections import defaultdict


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3/grippers")
    source_dir = base_dir / "all_problems3" / "testing"
    target_dir = base_dir / "testing_problem50"

    if not source_dir.exists():
        print(f"错误: 源目录不存在: {source_dir}")
        return

    # 分类：按 (n, r, o)、n、r，只保留有解(solution)的实例
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

    print("源目录问题分布：")
    print("\n按配置组合 (n, r, o):")
    for (n, r, o), files in sorted(files_by_config.items()):
        print(f"  n={n}, r={r}, o={o}: {len(files)} 个问题")

    print("\n按机器人数分布:")
    for n in sorted(files_by_n.keys()):
        print(f"  n={n}: {len(files_by_n[n])} 个问题")

    print("\n按房间数分布:")
    for r in sorted(files_by_r.keys()):
        print(f"  r={r}: {len(files_by_r[r])} 个问题")

    total_needed = 50

    # 目标分配
    n_values = [1, 2]
    r_values = [3, 4]

    target_by_n: dict[int, int] = {1: 25, 2: 25}
    target_by_r: dict[int, int] = {3: 25, 4: 25}

    print("\n目标分配:")
    print("按机器人数 n:")
    for n in n_values:
        print(f"  n={n}: {target_by_n[n]} 个")
    print("按房间数 r:")
    for r in r_values:
        print(f"  r={r}: {target_by_r[r]} 个")

    selected_files: list[Path] = []
    selected_by_n: dict[int, int] = defaultdict(int)
    selected_by_r: dict[int, int] = defaultdict(int)
    selected_by_config: dict[tuple[int, int, int], int] = defaultdict(int)

    # 第一步：按 (n, r, o) 组合，优先平衡 n 和 r
    configs = sorted(files_by_config.keys())
    for (n, r, o) in configs:
        if len(selected_files) >= total_needed:
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
            total_needed - len(selected_files),
        )

        if take <= 0:
            continue

        chosen = random.sample(available, take)
        selected_files.extend(chosen)
        selected_by_n[n] += take
        selected_by_r[r] += take
        selected_by_config[(n, r, o)] += take

    # 第二步：如果未达 50 个，按 n 和 r 的不足进行补充
    while len(selected_files) < total_needed:
        progress = False
        for n in n_values:
            if len(selected_files) >= total_needed:
                break
            need_n = target_by_n[n] - selected_by_n.get(n, 0)
            if need_n <= 0:
                continue

            # 在该 n 下优先选择 r 仍有缺口的组合
            for r in r_values:
                if len(selected_files) >= total_needed:
                    break
                need_r = target_by_r[r] - selected_by_r.get(r, 0)
                if need_r <= 0:
                    continue

                # 找到该 (n, r, o) 下尚未选过的文件
                for (cfg_n, cfg_r, cfg_o), files in files_by_config.items():
                    if cfg_n != n or cfg_r != r:
                        continue
                    remaining = [f for f in files if f not in selected_files]
                    if not remaining:
                        continue
                    take = min(need_n, need_r, len(remaining), total_needed - len(selected_files))
                    if take <= 0:
                        continue
                    chosen = random.sample(remaining, take)
                    selected_files.extend(chosen)
                    selected_by_n[n] += take
                    selected_by_r[r] += take
                    selected_by_config[(cfg_n, cfg_r, cfg_o)] += take
                    need_n -= take
                    need_r -= take
                    progress = True
                    if len(selected_files) >= total_needed:
                        break

        if not progress:
            # 无法再根据 n/r 缺口补充，直接从剩余中补满
            remaining_all = [
                f for files in files_by_config.values() for f in files if f not in selected_files
            ]
            if not remaining_all:
                break
            take = min(total_needed - len(selected_files), len(remaining_all))
            selected_files.extend(random.sample(remaining_all, take))
            break

    # 截断/检查数量
    if len(selected_files) > total_needed:
        selected_files = random.sample(selected_files, total_needed)

    # 重新统计最终分布
    final_by_n: dict[int, int] = defaultdict(int)
    final_by_r: dict[int, int] = defaultdict(int)
    final_by_config: dict[tuple[int, int, int], int] = defaultdict(int)

    for f in selected_files:
        parts = f.name.replace(".pddl", "").split("-")
        if len(parts) < 4:
            continue
        try:
            n = int(parts[1].replace("n", ""))
            r = int(parts[2].replace("r", ""))
            o = int(parts[3].replace("o", ""))
        except ValueError:
            continue
        final_by_n[n] += 1
        final_by_r[r] += 1
        final_by_config[(n, r, o)] += 1

    # 创建目标目录并复制文件
    if target_dir.exists():
        print(f"\n删除已存在的目录: {target_dir}")
        shutil.rmtree(target_dir)
    target_dir.mkdir(parents=True, exist_ok=True)

    print(f"\n复制文件到 {target_dir}...")
    for pddl_file in selected_files:
        shutil.copy2(pddl_file, target_dir / pddl_file.name)
        soln_file = pddl_file.with_suffix(".soln")
        if soln_file.exists():
            shutil.copy2(soln_file, target_dir / soln_file.name)

    # 打印最终统计
    print("\n完成！")
    print(f"目标目录: {target_dir}")
    print(f"总问题数: {len(selected_files)}")

    print("\n最终分布:")
    print("按机器人数 n:")
    for n in sorted(final_by_n.keys()):
        print(f"  n={n}: {final_by_n[n]} 个问题")

    print("按房间数 r:")
    for r in sorted(final_by_r.keys()):
        print(f"  r={r}: {final_by_r[r]} 个问题")

    print("\n按配置组合 (n, r, o):")
    for (n, r, o) in sorted(final_by_config.keys()):
        print(f"  n={n}, r={r}, o={o}: {final_by_config[(n, r, o)]} 个问题")


if __name__ == "__main__":
    random.seed(42)
    main()


