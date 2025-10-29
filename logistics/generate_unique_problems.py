#!/usr/bin/env python3
import subprocess
import os
import random
import argparse
import hashlib
import re
from typing import Dict, List, Optional, Set

# -------------------- 基础生成 --------------------

def generate_logistics_problem(
    cities: int,
    city_size: int,
    packages: int,
    airplanes: int,
    trucks: Optional[int] = None,
    seed: Optional[int] = None,
    output_file: Optional[str] = None,
) -> Optional[str]:
    """
    调用 ./logistics 生成单个 PDDL 问题。
    """
    cmd = ["./logistics", "-c", str(cities), "-s", str(city_size), "-p", str(packages), "-a", str(airplanes)]
    if trucks is not None:
        cmd.extend(["-t", str(trucks)])
    if seed is not None:
        cmd.extend(["-r", str(seed)])

    try:
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        pddl_content = result.stdout
        if output_file:
            with open(output_file, "w", encoding="utf-8") as f:
                f.write(pddl_content)
            print(f"问题已保存到: {output_file}")
        return pddl_content
    except subprocess.CalledProcessError as e:
        print(f"生成问题失败: {e}")
        print(f"错误输出: {e.stderr}")
        return None


# -------------------- 工具函数 --------------------

def _compute_sha256(content: str) -> str:
    hasher = hashlib.sha256()
    hasher.update(content.encode("utf-8"))
    return hasher.hexdigest()

def _collect_existing_hashes(output_dir: str) -> Set[str]:
    """遍历输出目录，收集现有 .pddl 文件的内容哈希，用于去重。"""
    hashes: Set[str] = set()
    if not os.path.isdir(output_dir):
        return hashes
    for filename in os.listdir(output_dir):
        if not filename.lower().endswith(".pddl"):
            continue
        file_path = os.path.join(output_dir, filename)
        try:
            with open(file_path, "r", encoding="utf-8") as f:
                content = f.read()
            hashes.add(_compute_sha256(content))
        except Exception:
            continue
    return hashes

def _generate_filename_from_params(
    cities: int, city_size: int, packages: int, airplanes: int, trucks: Optional[int] = None, seed: Optional[int] = None
) -> str:
    """根据参数和seed生成文件名"""
    parts = [f"c{cities}", f"s{city_size}", f"p{packages}", f"a{airplanes}"]
    if trucks is not None:
        parts.append(f"t{trucks}")
    if seed is not None:
        parts.append(f"seed{seed}")
    return "_".join(parts) + ".pddl"

def _find_next_index_filename(output_dir: str) -> str:
    """在输出目录中查找下一个可用的编号文件名，如 001.pddl、002.pddl。"""
    os.makedirs(output_dir, exist_ok=True)
    max_num = 0
    existing_width = 3
    for name in os.listdir(output_dir):
        m = re.match(r"^(\d+)\.pddl$", name)
        if not m:
            continue
        num_str = m.group(1)
        try:
            num = int(num_str)
        except ValueError:
            continue
        max_num = max(max_num, num)
        existing_width = max(existing_width, len(num_str))
    next_num = max_num + 1
    width = max(existing_width, len(str(next_num)), 3)
    return os.path.join(output_dir, f"{next_num:0{width}d}.pddl")


# -------------------- 新增：按单一参数批量生成 N 个 --------------------

def generate_n_with_params(
    *,
    num: int,
    cities: int,
    city_size: int,
    packages: int,
    airplanes: int,
    trucks: Optional[int],
    start_seed: int,
    output_dir: str,
    unique: bool,
    use_param_filename: bool,
    max_attempts_per_problem: int,
) -> int:
    """
    给定一组参数，生成 num 个问题。
    - 若 unique=True，会基于全文哈希去重；不重复才写入。
    - 起始种子为 start_seed，每次尝试种子自增 1。
    - use_param_filename=True 时，文件名包含参数与 seed；否则使用自增编号 001/002...
    返回成功写入的数量。
    """
    os.makedirs(output_dir, exist_ok=True)
    generated = 0
    attempts = 0
    seen_hashes = _collect_existing_hashes(output_dir) if unique else set()
    seed = start_seed

    while generated < num:

        content = generate_logistics_problem(
            cities=cities,
            city_size=city_size,
            packages=packages,
            airplanes=airplanes,
            trucks=trucks,
            seed=seed,
            output_file=None,
        )
        attempts += 1
        seed += 1  # 下一次尝试使用下一个种子

        if not content:
            continue

        chash = _compute_sha256(content)
        if unique and chash in seen_hashes:
            # 重复，跳过
            continue

        if use_param_filename:
            fname = _generate_filename_from_params(
                cities, city_size, packages, airplanes, trucks, seed - 1
            )
            out_path = os.path.join(output_dir, fname)
            if unique and os.path.exists(out_path):
                # 文件名已存在且 unique，跳过（避免覆盖）
                continue
        else:
            out_path = _find_next_index_filename(output_dir)

        with open(out_path, "w", encoding="utf-8") as f:
            f.write(content)

        generated += 1
        if unique:
            seen_hashes.add(chash)

        if generated % 50 == 0 or generated == num:
            print(f"[info] 已生成 {generated}/{num} 个到 {output_dir}")

    return generated


# -------------------- 旧接口（保留） --------------------

def generate_multiple_problems(configs: List[Dict], output_dir: str = "problems", count: Optional[int] = None, unique: bool = False):
    """
    生成多个不同配置的问题（旧接口，保留以兼容）
    """
    os.makedirs(output_dir, exist_ok=True)
    total_generated = 0
    seen_hashes = _collect_existing_hashes(output_dir) if unique else set()

    total_to_generate = len(configs)
    if count is not None:
        total_to_generate = min(total_to_generate, max(0, int(count)))

    for i, config in enumerate(configs[:total_to_generate]):
        print(f"生成问题 {i+1}/{total_to_generate}...")
        pddl_content = generate_logistics_problem(
            cities=config["cities"],
            city_size=config["city_size"],
            packages=config["packages"],
            airplanes=config["airplanes"],
            trucks=config.get("trucks"),
            seed=config.get("seed"),
            output_file=None,
        )
        if not pddl_content:
            continue

        if unique:
            content_hash = _compute_sha256(pddl_content)
            if content_hash in seen_hashes:
                print("发现重复问题（基于内容哈希），已跳过。")
                continue

        filename = _generate_filename_from_params(
            config["cities"],
            config["city_size"],
            config["packages"],
            config["airplanes"],
            config.get("trucks"),
            config.get("seed"),
        )
        output_path = os.path.join(output_dir, filename)
        if unique and os.path.exists(output_path):
            print(f"文件已存在，跳过: {output_path}")
            continue

        with open(output_path, "w", encoding="utf-8") as f:
            f.write(pddl_content)
        print(f"问题已保存到: {output_path}")

        total_generated += 1
        if unique:
            seen_hashes.add(content_hash)

    print(f"\n总共生成了 {total_generated} 个问题文件")
    print(f"输出目录: {output_dir}")


# -------------------- 一些预置批量（保留） --------------------

def generate_ipc00_instances(count: Optional[int] = None, output_dir: str = "problems", unique: bool = False):
    print("生成IPC-2000风格的实例...")
    configs: List[Dict] = []

    for packages in [4, 6, 8]:
        for airplanes in [1, 2]:
            configs.append({
                "cities": 2,
                "city_size": 3,
                "packages": packages,
                "airplanes": airplanes,
                "seed": random.randint(1, 1000),
            })

    for packages in [6, 8, 10]:
        for airplanes in [1, 2]:
            configs.append({
                "cities": 3,
                "city_size": 4,
                "packages": packages,
                "airplanes": airplanes,
                "seed": random.randint(1, 1000),
            })

    for packages in [10, 12, 15]:
        for airplanes in [1, 2]:
            configs.append({
                "cities": 5,
                "city_size": 5,
                "packages": packages,
                "airplanes": airplanes,
                "seed": random.randint(1, 1000),
            })

    generate_multiple_problems(configs, output_dir, count=count, unique=unique)


def generate_ipc98_instances(count: Optional[int] = None, output_dir: str = "problems", unique: bool = False):
    print("生成IPC-1998风格的实例...")
    configs: List[Dict] = []

    for cities in [2, 3, 4, 5, 6, 7, 8]:
        city_size = 3
        packages = cities * 3
        airplanes = min(cities, 5)
        configs.append({
            "cities": cities,
            "city_size": city_size,
            "packages": packages,
            "airplanes": airplanes,
            "seed": random.randint(1, 1000),
        })

    for cities in [3, 4, 5]:
        configs.append({
            "cities": cities,
            "city_size": 4,
            "packages": cities * 4,
            "airplanes": min(cities + 1, 6),
            "trucks": cities + 1,
            "seed": random.randint(1, 1000),
        })

    generate_multiple_problems(configs, output_dir, count=count, unique=unique)


def generate_custom_instances(count: Optional[int] = None, output_dir: str = "problems", unique: bool = False):
    print("生成自定义配置的实例...")
    configs: List[Dict] = []

    for cities in [1, 2]:
        for city_size in [2, 3]:
            for packages in [2, 3, 4]:
                for airplanes in [1, 2]:
                    if airplanes <= cities:
                        configs.append({
                            "cities": cities,
                            "city_size": city_size,
                            "packages": packages,
                            "airplanes": airplanes,
                            "seed": random.randint(1, 1000),
                        })

    for cities in [3, 4]:
        for city_size in [3, 4]:
            for packages in [5, 6, 7, 8]:
                for airplanes in [1, 2, 3]:
                    if airplanes <= cities:
                        configs.append({
                            "cities": cities,
                            "city_size": city_size,
                            "packages": packages,
                            "airplanes": airplanes,
                            "seed": random.randint(1, 1000),
                        })

    generate_multiple_problems(configs, output_dir, count=count, unique=unique)


def generate_random_instances(num_instances: int = 50, count: Optional[int] = None, output_dir: str = "problems", unique: bool = False):
    effective_count = int(count) if count is not None else int(num_instances)
    print(f"生成 {effective_count} 个随机配置的实例...")
    configs: List[Dict] = []
    for _ in range(effective_count):
        cities = random.randint(1, 8)
        city_size = random.randint(2, 6)
        packages = random.randint(2, min(20, cities * city_size))
        airplanes = random.randint(1, min(5, cities))
        trucks = random.randint(cities, cities + 2) if random.random() > 0.7 else None
        configs.append({
            "cities": cities,
            "city_size": city_size,
            "packages": packages,
            "airplanes": airplanes,
            "trucks": trucks,
            "seed": random.randint(1, 10000),
        })
    generate_multiple_problems(configs, output_dir, count=effective_count, unique=unique)


# -------------------- CLI --------------------

def main():
    parser = argparse.ArgumentParser(description="生成 logistics 问题")
    parser.add_argument("--type", choices=["ipc00", "ipc98", "custom", "random", "single"], default="custom",
                        help="生成类型；single=给定参数批量生成")
    parser.add_argument("--count", type=int, help="用于非 single 类型的列表生成数量限制")
    # single 参数
    parser.add_argument("--cities", type=int, help="城市数量")
    parser.add_argument("--city-size", type=int, help="城市大小")
    parser.add_argument("--packages", type=int, help="包裹数量")
    parser.add_argument("--airplanes", type=int, help="飞机数量")
    parser.add_argument("--trucks", type=int, help="卡车数量（可选；默认=城市数，且每城≥1）")
    parser.add_argument("--seed", type=int, default=1, help="起始随机种子（single 模式起点）")
    parser.add_argument("--num", "-n", type=int, help="single 模式下要生成的问题数量（必须）")
    parser.add_argument("--output", type=str, help="single 模式下仅生成 1 个时的输出文件名（一般不使用）")
    parser.add_argument("--num-random", type=int, default=50, help="random 模式实例数量")
    parser.add_argument("--output-dir", type=str, default="problems", help="输出目录（默认: problems）")
    parser.add_argument("--unique", action="store_true", help="去重生成，避免与输出目录中现有问题重复")
    parser.add_argument("--use-param-filename", action="store_true",
                        help="使用参数+seed 作为文件名；不加时使用自增编号 001/002...")
    parser.add_argument("--max-attempts-per-problem", type=int, default=50,
                        help="unique 模式下，每个目标问题的最大尝试次数（避免死循环）")

    args = parser.parse_args()

    if args.type == "single":
        # 校验
        need = [args.cities, args.city_size, args.packages, args.airplanes, args.num]
        if not all(v is not None for v in need):
            print("single 模式需要：--cities --city-size --packages --airplanes --num")
            return

        os.makedirs(args.output_dir, exist_ok=True)

        # 单参数批量生成
        produced = generate_n_with_params(
            num=int(args.num),
            cities=int(args.cities),
            city_size=int(args.city_size),
            packages=int(args.packages),
            airplanes=int(args.airplanes),
            trucks=int(args.trucks) if args.trucks is not None else None,
            start_seed=int(args.seed),
            output_dir=args.output_dir,
            unique=bool(args.unique),
            use_param_filename=bool(args.use_param_filename),
            max_attempts_per_problem=int(args.max_attempts_per_problem),
        )
        print(f"Done. 生成 {produced}/{args.num} 个问题到 {args.output_dir}")
        return

    # 其余批量生成模式（保留原有逻辑）
    if args.type == "ipc00":
        generate_ipc00_instances(count=args.count, output_dir=args.output_dir, unique=args.unique)
    elif args.type == "ipc98":
        generate_ipc98_instances(count=args.count, output_dir=args.output_dir, unique=args.unique)
    elif args.type == "custom":
        generate_custom_instances(count=args.count, output_dir=args.output_dir, unique=args.unique)
    elif args.type == "random":
        generate_random_instances(num_instances=args.num_random, count=args.count, output_dir=args.output_dir, unique=args.unique)

if __name__ == "__main__":
    main()
