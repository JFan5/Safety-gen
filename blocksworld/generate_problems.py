import subprocess
import os
import itertools

def generate_problems(ops_list=[3, 4], num_blocks_list=[2, 3, 4, 5, 10], seeds_range=(1, 101), max_count=None):
    """
    生成不同参数的blocksworld问题
    
    Args:
        ops_list: 操作符数量列表，支持3和4
        num_blocks_list: 块数量列表
        seeds_range: 种子范围，元组(start, end)
    """
    output_dir = "problems"
    
    # 清空problems文件夹
    if os.path.exists(output_dir):
        print(f"清空 {output_dir} 文件夹...")
        for file in os.listdir(output_dir):
            file_path = os.path.join(output_dir, file)
            try:
                if os.path.isfile(file_path):
                    os.remove(file_path)
                elif os.path.isdir(file_path):
                    import shutil
                    shutil.rmtree(file_path)
            except Exception as e:
                print(f"警告: 无法删除 {file_path}: {e}")
    else:
        os.makedirs(output_dir)
        print(f"创建 {output_dir} 文件夹...")
    
    # 目标生成数量：若指定了max_count，则以其为准；否则等于组合的总量
    pairs = list(itertools.product(ops_list, num_blocks_list))
    base_configs = [(ops, nb, seed)
                    for ops, nb in pairs
                    for seed in range(seeds_range[0], seeds_range[1])]

    if max_count is not None:
        try:
            target_count = max(0, int(max_count))
        except Exception:
            target_count = len(base_configs)
    else:
        target_count = len(base_configs)

    # 若目标数量超过基础组合数量，则循环参数并递增种子生成更多实例
    configs = []
    if target_count <= len(base_configs):
        configs = base_configs[:target_count]
    else:
        configs = list(base_configs)
        seed = max(seeds_range[0], seeds_range[1])
        pair_cycle = itertools.cycle(pairs)
        while len(configs) < target_count:
            ops, nb = next(pair_cycle)
            configs.append((ops, nb, seed))
            seed += 1

    width = max(3, len(str(target_count)))

    total_generated = 0
    for idx, (ops, num_blocks, seed) in enumerate(configs, start=1):
        if idx == 1 or (idx - 1) % ((seeds_range[1] - seeds_range[0]) or 1) == 0:
            print(f"生成 {ops}ops, {num_blocks}blocks 的问题...")

        # 使用序号作为文件名
        output_file = os.path.join(output_dir, f"{idx:0{width}d}.pddl")
        try:
            with open(output_file, "w") as f:
                subprocess.run(["./blocksworld", str(ops), str(num_blocks), str(seed)],
                               stdout=f, check=True)
            total_generated += 1
        except subprocess.CalledProcessError as e:
            print(f"错误: 生成 {ops}ops, {num_blocks}blocks, seed={seed} 失败: {e}")
        except Exception as e:
            print(f"错误: 生成 {ops}ops, {num_blocks}blocks, seed={seed} 时发生异常: {e}")
    
    print(f"\n总共生成了 {total_generated} 个问题文件")
    print(f"输出目录: {output_dir}")

def generate_3ops_problems(max_count=None):
    """生成3ops变体的问题"""
    print("生成Blocksworld-3ops问题...")
    generate_problems(ops_list=[3], num_blocks_list=[2, 3, 4, 5, 10], seeds_range=(1, 21), max_count=max_count)

def generate_4ops_problems(max_count=None):
    """生成4ops变体的问题"""
    print("生成Blocksworld-4ops问题...")
    generate_problems(ops_list=[4], num_blocks_list=[2, 3, 4, 5, 10], seeds_range=(1, 21), max_count=max_count)

def generate_small_problems(max_count=None):
    """生成小规模问题（2-5个块）"""
    print("生成小规模问题...")
    generate_problems(ops_list=[3, 4], num_blocks_list=[2, 3, 4, 5], seeds_range=(1, 11), max_count=max_count)

def generate_medium_problems(max_count=None):
    """生成中等规模问题（10个块）"""
    print("生成中等规模问题...")
    generate_problems(ops_list=[3, 4], num_blocks_list=[10], seeds_range=(1, 11), max_count=max_count)

def generate_all_problems(max_count=None):
    """生成所有配置的问题"""
    print("生成所有配置的问题...")
    generate_problems(ops_list=[3, 4], num_blocks_list=[2, 3, 4, 5, 10], seeds_range=(1, 21), max_count=max_count)

if __name__ == "__main__":
    import sys
    
    if len(sys.argv) > 1:
        command = sys.argv[1]
        max_count = None
        if len(sys.argv) > 2 and sys.argv[2].isdigit():
            max_count = int(sys.argv[2])
        if command == "3ops":
            generate_3ops_problems(max_count=max_count)
        elif command == "4ops":
            generate_4ops_problems(max_count=max_count)
        elif command == "small":
            generate_small_problems(max_count=max_count)
        elif command == "medium":
            generate_medium_problems(max_count=max_count)
        elif command == "all":
            generate_all_problems(max_count=max_count)
        else:
            print("用法: python generate_problems.py [3ops|4ops|small|medium|all]")
            print("默认生成所有配置的问题")
            generate_all_problems(max_count=max_count)
    else:
        # 默认生成所有配置
        generate_all_problems()