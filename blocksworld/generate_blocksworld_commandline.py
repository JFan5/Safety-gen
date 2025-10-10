#!/usr/bin/env python3
"""
blocksworld问题生成器 - 使用命令行生成器
生成训练和测试问题，确保唯一性，参数化命名，记录生成参数
"""

import os
import sys
import subprocess
import hashlib
import random
import shutil
from pathlib import Path
from typing import Set, List, Tuple
import argparse

def clear_directories(train_dir: Path, test_dir: Path):
    """清空训练和测试目录"""
    print("清空现有问题目录...", flush=True)
    
    if train_dir.exists():
        shutil.rmtree(train_dir)
    if test_dir.exists():
        shutil.rmtree(test_dir)
    
    train_dir.mkdir(parents=True, exist_ok=True)
    test_dir.mkdir(parents=True, exist_ok=True)
    
    print(f"✓ 清空了 {train_dir.name} 和 {test_dir.name}", flush=True)

def generate_single_problem(ops: int, blocks: int, seed: int, script_dir: Path) -> str:
    """使用命令行生成器生成单个问题"""
    try:
        result = subprocess.run(
            ["./blocksworld", str(ops), str(blocks), str(seed)],
            cwd=script_dir,
            capture_output=True,
            text=True,
            timeout=30
        )
        
        if result.returncode == 0:
            return result.stdout
        else:
            print(f"  警告: 生成失败 (ops={ops}, blocks={blocks}, seed={seed}): {result.stderr}", flush=True)
            return ""
    except subprocess.TimeoutExpired:
        print(f"  警告: 生成超时 (ops={ops}, blocks={blocks}, seed={seed})", flush=True)
        return ""
    except Exception as e:
        print(f"  警告: 生成异常 (ops={ops}, blocks={blocks}, seed={seed}): {e}", flush=True)
        return ""

def generate_problems_internal(ops_list: List[int], num_blocks_list: List[int],
                              start_seed: int, end_seed: int, target_count: int, 
                              output_dir: Path, existing_hashes: Set[str], 
                              is_testing_set: bool = False) -> Tuple[int, Set[str]]:
    """内部生成逻辑"""
    generated_count = 0
    attempts = 0
    current_seed = start_seed
    max_attempts = target_count * 10  # 最多尝试10倍数量
    
    print(f"开始生成 {output_dir.name}，目标 {target_count} 个", flush=True)
    
    while generated_count < target_count and attempts < max_attempts:
        # 随机选择参数
        ops = random.choice(ops_list)
        num_blocks = random.choice(num_blocks_list)
        
        # 生成问题
        problem_content = generate_single_problem(ops, num_blocks, current_seed, output_dir.parent)
        
        if problem_content:
            # 检查唯一性
            content_hash = hashlib.sha256(problem_content.encode()).hexdigest()
            if content_hash not in existing_hashes:
                # 生成文件名
                filename = f"bw_ops{ops}_n{num_blocks}_seed{current_seed}.pddl"
                filepath = output_dir / filename
                
                # 写入文件
                with open(filepath, 'w') as f:
                    f.write(problem_content)
                
                existing_hashes.add(content_hash)
                generated_count += 1
                print(f"生成了 {filename}", flush=True)
            else:
                # 重复问题，静默跳过
                pass
        else:
            print(f"  警告: 生成问题失败 (ops={ops}, blocks={num_blocks}, seed={current_seed})", flush=True)
        
        attempts += 1
        current_seed += 1
        
        # 进度报告
        if attempts % 100 == 0:
            print(f"  尝试 {attempts} 次，已生成 {generated_count}/{target_count}...", flush=True)
    
    if generated_count < target_count:
        print(f"  警告: 只生成了 {generated_count}/{target_count} 个唯一问题", flush=True)
    
    print(f"  {output_dir.name}: {generated_count}/{target_count} completed", flush=True)
    return generated_count, existing_hashes

def write_problems_md(train_count: int, test_count: int, ops_list: List[int], 
                     blocks_list: List[int], train_seed_range: Tuple[int, int], 
                     test_seed_range: Tuple[int, int]):
    """写入problems.md文件记录生成参数"""
    md_content = f"""# Blocksworld 问题生成参数

## 生成配置

- **训练问题数量**: {train_count}
- **测试问题数量**: {test_count}
- **总问题数量**: {train_count + test_count}

## 参数范围

### 操作数 (ops)
- **范围**: {min(ops_list)} - {max(ops_list)}
- **具体值**: {ops_list}

### 积木数量 (blocks)
- **范围**: {min(blocks_list)} - {max(blocks_list)}
- **具体值**: {blocks_list}

### 随机种子范围

#### 训练问题
- **起始种子**: {train_seed_range[0]}
- **结束种子**: {train_seed_range[1]}
- **种子范围**: {train_seed_range[1] - train_seed_range[0] + 1}

#### 测试问题
- **起始种子**: {test_seed_range[0]}
- **结束种子**: {test_seed_range[1]}
- **种子范围**: {test_seed_range[1] - test_seed_range[0] + 1}

## 文件命名规则

文件名格式: `bw_ops<ops>_n<blocks>_seed<seed>.pddl`

示例:
- `bw_ops3_n5_seed100.pddl` - 3个操作，5个积木，种子100
- `bw_ops4_n8_seed200.pddl` - 4个操作，8个积木，种子200

## 唯一性保证

- 使用内容哈希确保问题唯一性
- 训练集和测试集之间无重复
- 每个集合内部无重复

## 生成方法

使用命令行生成器 `./blocksworld <ops> <blocks> <seed>` 生成问题。

## 生成时间

生成时间: {__import__('datetime').datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
"""
    
    with open("problems.md", 'w', encoding='utf-8') as f:
        f.write(md_content)
    
    print("✓ 已写入 problems.md", flush=True)

def main():
    parser = argparse.ArgumentParser(description='生成blocksworld训练和测试问题')
    parser.add_argument('--train', type=int, default=1000, help='训练问题数量 (默认: 1000)')
    parser.add_argument('--test', type=int, default=100, help='测试问题数量 (默认: 100)')
    parser.add_argument('--clean', action='store_true', help='清空现有问题目录')
    parser.add_argument('--ops', nargs='+', type=int, default=[3, 4], help='操作数列表 (默认: 3 4)')
    parser.add_argument('--blocks', nargs='+', type=int, default=list(range(3, 11)), help='积木数量列表 (默认: 3-10)')
    parser.add_argument('--train-seed-start', type=int, default=1, help='训练问题种子起始值 (默认: 1)')
    parser.add_argument('--test-seed-start', type=int, default=10000, help='测试问题种子起始值 (默认: 10000)')
    
    args = parser.parse_args()
    
    # 设置目录
    script_dir = Path(__file__).parent
    train_dir = script_dir / "training_problems"
    test_dir = script_dir / "testing_problems"
    
    print(f"Blocksworld 问题生成器", flush=True)
    print(f"训练问题: {args.train} 个", flush=True)
    print(f"测试问题: {args.test} 个", flush=True)
    print(f"操作数: {args.ops}", flush=True)
    print(f"积木数: {args.blocks}", flush=True)
    print(f"训练种子范围: {args.train_seed_start} - {args.train_seed_start + args.train * 10}", flush=True)
    print(f"测试种子范围: {args.test_seed_start} - {args.test_seed_start + args.test * 10}", flush=True)
    print("=" * 50, flush=True)
    
    # 清空目录
    if args.clean:
        clear_directories(train_dir, test_dir)
    
    # 用于确保唯一性的哈希集合
    existing_hashes: Set[str] = set()
    
    # 生成训练问题
    train_count, existing_hashes = generate_problems_internal(
        args.ops, args.blocks,
        args.train_seed_start, args.train_seed_start + args.train * 10,
        args.train, train_dir, existing_hashes, is_testing_set=False
    )
    
    print("", flush=True)
    
    # 生成测试问题
    test_count, existing_hashes = generate_problems_internal(
        args.ops, args.blocks,
        args.test_seed_start, args.test_seed_start + args.test * 10,
        args.test, test_dir, existing_hashes, is_testing_set=True
    )
    
    # 写入problems.md
    write_problems_md(
        train_count, test_count, args.ops, args.blocks,
        (args.train_seed_start, args.train_seed_start + args.train * 10),
        (args.test_seed_start, args.test_seed_start + args.test * 10)
    )
    
    print("", flush=True)
    print("Summary:", flush=True)
    print(f"  training_problems: {train_count}", flush=True)
    print(f"  testing_problems:  {test_count}", flush=True)
    print(f"  filenames: bw_ops<ops>_n<blocks>_seed<seed>.pddl", flush=True)
    print(f"  parameters recorded in: problems.md", flush=True)

if __name__ == "__main__":
    main()

