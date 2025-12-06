#!/usr/bin/env python3
"""
PDDL 随机化数据集使用示例
展示如何加载和使用生成的数据集
"""

import json
from pathlib import Path


def load_dataset(dataset_path):
    """加载数据集"""
    with open(dataset_path, 'r', encoding='utf-8') as f:
        return json.load(f)


def example_1_load_single_domain():
    """示例 1: 加载单个 domain 的数据集"""
    print("\n" + "="*60)
    print("示例 1: 加载 blocksworld 数据集")
    print("="*60)

    dataset = load_dataset('data_randomized/blocksworld_dataset.json')

    print(f"数据集大小: {len(dataset)} 条")
    print(f"\n第一条数据:")
    print(f"  Domain: {dataset[0]['domain']}")
    print(f"  Problem ID: {dataset[0]['problem_id']}")
    print(f"  Domain PDDL 长度: {len(dataset[0]['domain_pddl'])} 字符")
    print(f"  Problem PDDL 长度: {len(dataset[0]['problem_pddl'])} 字符")
    print(f"  Plan 长度: {len(dataset[0]['plan'])} 字符")

    print(f"\nDomain PDDL 前 200 字符:")
    print(dataset[0]['domain_pddl'][:200] + "...")

    print(f"\nProblem PDDL:")
    print(dataset[0]['problem_pddl'][:300] + "...")

    print(f"\nPlan (前 5 行):")
    plan_lines = dataset[0]['plan'].split('\n')[:5]
    for line in plan_lines:
        print(f"  {line}")


def example_2_load_mixed_dataset():
    """示例 2: 加载混合数据集"""
    print("\n" + "="*60)
    print("示例 2: 加载混合数据集")
    print("="*60)

    dataset = load_dataset('data_randomized/mixed_dataset.json')

    print(f"数据集大小: {len(dataset)} 条")

    # 统计各 domain 的数量
    from collections import Counter
    domain_counts = Counter(item['domain'] for item in dataset)

    print("\n各场景分布:")
    for domain, count in sorted(domain_counts.items()):
        print(f"  {domain}: {count} 条")

    # 按 domain 分组
    print("\n按 domain 分组的第一条数据的 problem_id:")
    for domain in sorted(domain_counts.keys()):
        first_item = next(item for item in dataset if item['domain'] == domain)
        print(f"  {domain}: {first_item['problem_id']}")


def example_3_check_mapping():
    """示例 3: 查看映射表"""
    print("\n" + "="*60)
    print("示例 3: 查看 blocksworld 映射表")
    print("="*60)

    with open('data_randomized/blocksworld/mapping.json', 'r') as f:
        mapping = json.load(f)

    print("\nPredicate 映射:")
    for old, new in sorted(mapping['predicate_map'].items()):
        print(f"  {old:15} → {new}")

    print("\nAction 映射:")
    for old, new in sorted(mapping['action_map'].items()):
        print(f"  {old:15} → {new}")

    print("\nObject 映射:")
    for old, new in sorted(mapping['object_map'].items()):
        print(f"  {old:15} → {new}")


def example_4_create_training_batch():
    """示例 4: 创建训练批次"""
    print("\n" + "="*60)
    print("示例 4: 创建训练批次")
    print("="*60)

    dataset = load_dataset('data_randomized/mixed_dataset.json')

    # 创建训练批次（例如前 10 条）
    batch_size = 10
    batch = dataset[:batch_size]

    print(f"\n创建了一个包含 {len(batch)} 条数据的批次")

    # 格式化为训练输入
    print("\n训练样本格式示例:")
    sample = batch[0]

    # 模拟一个简单的训练格式
    training_input = f"""Domain:
{sample['domain_pddl']}

Problem:
{sample['problem_pddl']}

请生成解决该问题的计划。"""

    training_target = sample['plan']

    print("\n输入:")
    print(training_input[:300] + "...")

    print("\n目标输出:")
    print(training_target[:200] + "...")


def example_5_compare_before_after():
    """示例 5: 对比原始和随机化版本"""
    print("\n" + "="*60)
    print("示例 5: 对比原始和随机化版本")
    print("="*60)

    # 读取原始文件
    with open('pddl3/blocksworld/domain3.pddl', 'r') as f:
        original_domain = f.read()

    # 读取随机化文件
    with open('data_randomized/blocksworld/domain.pddl', 'r') as f:
        randomized_domain = f.read()

    # 读取映射表
    with open('data_randomized/blocksworld/mapping.json', 'r') as f:
        mapping = json.load(f)

    print("\n原始 Domain (前 15 行):")
    for i, line in enumerate(original_domain.split('\n')[:15], 1):
        print(f"{i:3}: {line}")

    print("\n随机化 Domain (前 15 行):")
    for i, line in enumerate(randomized_domain.split('\n')[:15], 1):
        print(f"{i:3}: {line}")

    print("\n映射示例:")
    print(f"  Predicates: {len(mapping['predicate_map'])} 个")
    print(f"  Actions: {len(mapping['action_map'])} 个")
    print(f"  Objects: {len(mapping['object_map'])} 个")


def main():
    print("PDDL 随机化数据集使用示例")
    print("="*60)

    # 检查数据集是否存在
    if not Path('data_randomized').exists():
        print("\n错误: 找不到 data_randomized 目录")
        print("请先运行: python randomize_pddl.py --output_root data_randomized --domains blocksworld ferry spanner grippers --seed 42")
        return

    # 运行所有示例
    example_1_load_single_domain()
    example_2_load_mixed_dataset()
    example_3_check_mapping()
    example_4_create_training_batch()
    example_5_compare_before_after()

    print("\n" + "="*60)
    print("所有示例完成！")
    print("="*60)


if __name__ == '__main__':
    main()
