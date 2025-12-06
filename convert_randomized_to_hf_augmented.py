#!/usr/bin/env python3
"""
将随机化的 PDDL JSON 数据集转换为 HuggingFace 格式（带 Prompt 增强）
每个 problem 生成 5 条不同的 prompt 变体，用于数据增强
"""

import json
import argparse
import sys
from pathlib import Path
from datasets import Dataset, DatasetDict
from typing import List, Dict
import random

# 导入 prompt_variants
try:
    from script.prompt_variants import build_prompt_multi
except ImportError:
    # 尝试添加 script 目录到路径
    script_dir = Path(__file__).parent / 'script'
    if script_dir.exists() and str(script_dir) not in sys.path:
        sys.path.insert(0, str(script_dir))
    try:
        from prompt_variants import build_prompt_multi
    except ImportError:
        print("Error: Cannot import prompt_variants module.")
        print("Please ensure script/prompt_variants.py exists.")
        sys.exit(1)


def format_pddl_prompt_with_variant(
    domain_pddl: str,
    problem_pddl: str,
    pddl_version: str = "PDDL3",
    variant: int = None,
    seed: int = None
) -> str:
    """
    使用 prompt_variants 生成带变体的 prompt

    Args:
        domain_pddl: Domain PDDL 内容
        problem_pddl: Problem PDDL 内容
        pddl_version: PDDL 版本（默认 PDDL3）
        variant: 模板变体编号（1-10），None 表示随机
        seed: 随机种子

    Returns:
        格式化后的 prompt
    """
    rng = random.Random(seed) if seed is not None else None
    return build_prompt_multi(
        domain_content=domain_pddl,
        problem_content=problem_pddl,
        pddl_version=pddl_version,
        variant=variant,
        rng=rng
    )


def convert_json_to_hf_format_augmented(
    json_data: List[Dict],
    num_variants: int = 5,
    use_sequential_variants: bool = True,
    pddl_version: str = "PDDL3",
    seed: int = 42
) -> Dict[str, List]:
    """
    将 JSON 数据转换为 HuggingFace 格式（带 Prompt 增强）

    Args:
        json_data: 原始 JSON 数据列表
        num_variants: 每个 problem 生成的 prompt 变体数量（默认 5）
        use_sequential_variants: 是否使用顺序模板（1-5）还是随机选择
        pddl_version: PDDL 版本
        seed: 随机种子

    Returns:
        HuggingFace 格式的字典
    """
    hf_data = {
        'text': [],
        'domain': [],
        'problem_id': [],
        'variant_id': [],
        'domain_pddl': [],
        'problem_pddl': [],
        'plan': []
    }

    rng = random.Random(seed)

    for item_idx, item in enumerate(json_data):
        # 为每个 problem 生成多个变体
        for variant_idx in range(num_variants):
            if use_sequential_variants:
                # 使用顺序模板：1, 2, 3, 4, 5
                variant_num = variant_idx + 1
            else:
                # 随机选择模板（1-10）
                variant_num = rng.randint(1, 10)

            # 生成带变体的 prompt
            prompt = format_pddl_prompt_with_variant(
                domain_pddl=item['domain_pddl'],
                problem_pddl=item['problem_pddl'],
                pddl_version=pddl_version,
                variant=variant_num,
                seed=seed + item_idx * num_variants + variant_idx
            )

            # Plan 内容（所有变体使用相同的 plan）
            completion = item['plan']
            full_text = f"{prompt}\n{completion}"

            # 添加到数据集
            hf_data['text'].append(full_text)
            hf_data['domain'].append(item['domain'])
            hf_data['problem_id'].append(f"{item['problem_id']}_v{variant_idx+1}")
            hf_data['variant_id'].append(variant_num)
            hf_data['domain_pddl'].append(item['domain_pddl'])
            hf_data['problem_pddl'].append(item['problem_pddl'])
            hf_data['plan'].append(item['plan'])

        # 进度显示
        if (item_idx + 1) % 100 == 0:
            total_generated = (item_idx + 1) * num_variants
            print(f"  已处理 {item_idx + 1}/{len(json_data)} 个 problems，生成 {total_generated} 条训练数据")

    return hf_data


def create_train_val_split(
    dataset: Dataset,
    val_ratio: float = 0.1,
    seed: int = 42,
    group_by_problem: bool = True
) -> DatasetDict:
    """
    创建训练/验证集分割

    Args:
        dataset: 原始数据集
        val_ratio: 验证集比例
        seed: 随机种子
        group_by_problem: 是否按 problem 分组（确保同一 problem 的所有变体在同一集合）

    Returns:
        包含训练集和验证集的 DatasetDict
    """
    if group_by_problem:
        # 提取原始 problem_id（去掉 _vX 后缀）
        original_ids = [pid.rsplit('_v', 1)[0] for pid in dataset['problem_id']]
        unique_problems = list(set(original_ids))

        # 按 domain 分层分割 unique problems
        rng = random.Random(seed)
        rng.shuffle(unique_problems)

        val_size = int(len(unique_problems) * val_ratio)
        val_problems = set(unique_problems[:val_size])

        # 根据 problem 归属创建训练/验证集索引
        train_indices = []
        val_indices = []

        for idx, orig_id in enumerate(original_ids):
            if orig_id in val_problems:
                val_indices.append(idx)
            else:
                train_indices.append(idx)

        return DatasetDict({
            'train': dataset.select(train_indices),
            'validation': dataset.select(val_indices)
        })
    else:
        # 简单随机分割
        split = dataset.train_test_split(
            test_size=val_ratio,
            seed=seed
        )
        return DatasetDict({
            'train': split['train'],
            'validation': split['test']
        })


def main():
    parser = argparse.ArgumentParser(
        description='将随机化 PDDL JSON 数据集转换为 HuggingFace 格式（带 Prompt 增强）',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例:
  # 每个 problem 生成 5 个变体（使用模板 1-5）
  python convert_randomized_to_hf_augmented.py \\
    --input data_randomized/mixed_dataset.json \\
    --output /jfan5/sft_data/four_scenarios500_randomized_augmented/combined.hf \\
    --num-variants 5

  # 每个 problem 生成 10 个变体（使用所有模板）
  python convert_randomized_to_hf_augmented.py \\
    --input data_randomized/mixed_dataset.json \\
    --output /jfan5/sft_data/four_scenarios500_randomized_augmented/combined.hf \\
    --num-variants 10

  # 使用随机选择的模板
  python convert_randomized_to_hf_augmented.py \\
    --input data_randomized/mixed_dataset.json \\
    --output /jfan5/sft_data/four_scenarios500_randomized_augmented/combined.hf \\
    --num-variants 5 \\
    --random-variants
"""
    )

    parser.add_argument(
        '--input',
        type=str,
        default='data_randomized/mixed_dataset.json',
        help='输入 JSON 文件路径'
    )

    parser.add_argument(
        '--output',
        type=str,
        required=True,
        help='输出 HuggingFace 数据集路径'
    )

    parser.add_argument(
        '--num-variants',
        type=int,
        default=5,
        help='每个 problem 生成的 prompt 变体数量（默认：5）'
    )

    parser.add_argument(
        '--random-variants',
        action='store_true',
        help='随机选择模板而不是使用顺序模板 1-N'
    )

    parser.add_argument(
        '--pddl-version',
        type=str,
        default='PDDL3',
        help='PDDL 版本（默认：PDDL3）'
    )

    parser.add_argument(
        '--val-ratio',
        type=float,
        default=0.1,
        help='验证集比例（默认：0.1）'
    )

    parser.add_argument(
        '--seed',
        type=int,
        default=42,
        help='随机种子（默认：42）'
    )

    parser.add_argument(
        '--no-split',
        action='store_true',
        help='不分割训练/验证集，只创建完整数据集'
    )

    parser.add_argument(
        '--no-group-by-problem',
        action='store_true',
        help='不按 problem 分组（允许同一 problem 的变体在训练集和验证集中）'
    )

    args = parser.parse_args()

    print("=" * 70)
    print("将随机化 PDDL JSON 数据集转换为 HuggingFace 格式（带 Prompt 增强）")
    print("=" * 70)

    # 读取 JSON 数据
    print(f"\n读取输入文件: {args.input}")
    with open(args.input, 'r', encoding='utf-8') as f:
        json_data = json.load(f)

    print(f"  加载了 {len(json_data)} 个原始 problems")

    # 统计各场景数量
    from collections import Counter
    domain_counts = Counter(item['domain'] for item in json_data)
    print("\n原始数据各场景分布:")
    for domain, count in sorted(domain_counts.items()):
        print(f"  {domain}: {count} 个 problems")

    # 转换为 HuggingFace 格式（带增强）
    print(f"\n转换为 HuggingFace 格式（每个 problem 生成 {args.num_variants} 个变体）...")
    print(f"  使用模板策略: {'随机选择' if args.random_variants else f'顺序使用 1-{args.num_variants}'}")
    print(f"  PDDL 版本: {args.pddl_version}")

    hf_data = convert_json_to_hf_format_augmented(
        json_data=json_data,
        num_variants=args.num_variants,
        use_sequential_variants=not args.random_variants,
        pddl_version=args.pddl_version,
        seed=args.seed
    )

    dataset = Dataset.from_dict(hf_data)

    print(f"\n  增强后数据集大小: {len(dataset)} 条")
    print(f"  原始数据: {len(json_data)} problems")
    print(f"  增强倍数: {args.num_variants}x")
    print(f"  字段: {list(dataset.column_names)}")

    # 统计增强后的场景分布
    augmented_domain_counts = Counter(dataset['domain'])
    print("\n增强后各场景分布:")
    for domain, count in sorted(augmented_domain_counts.items()):
        print(f"  {domain}: {count} 条 (原始 {domain_counts[domain]} × {args.num_variants})")

    # 创建输出目录
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    # 分割数据集或保存完整数据集
    if args.no_split:
        print(f"\n保存完整数据集到: {args.output}")
        dataset.save_to_disk(args.output)
        print(f"  总计: {len(dataset)} 条")
    else:
        print(f"\n创建训练/验证集分割 (验证集比例: {args.val_ratio})")
        print(f"  分组策略: {'按 problem 分组' if not args.no_group_by_problem else '随机分割'}")

        dataset_dict = create_train_val_split(
            dataset,
            args.val_ratio,
            args.seed,
            group_by_problem=not args.no_group_by_problem
        )

        print(f"  训练集: {len(dataset_dict['train'])} 条")
        print(f"  验证集: {len(dataset_dict['validation'])} 条")

        print(f"\n保存数据集到: {args.output}")
        dataset_dict.save_to_disk(args.output)

    # 显示示例
    print("\n示例数据:")
    print("-" * 70)
    sample = dataset[0]
    print(f"Domain: {sample['domain']}")
    print(f"Problem ID: {sample['problem_id']}")
    print(f"Variant ID: {sample['variant_id']}")
    print(f"\nPrompt (前 400 字符):")
    print(sample['text'][:400] + "...")
    print("-" * 70)

    # 显示不同变体的示例
    if args.num_variants > 1:
        print("\n不同 Prompt 变体示例:")
        print("=" * 70)
        # 找到同一个 problem 的不同变体
        base_problem_id = sample['problem_id'].rsplit('_v', 1)[0]
        variants = [item for item in dataset if item['problem_id'].startswith(base_problem_id)][:min(3, args.num_variants)]

        for idx, var in enumerate(variants, 1):
            print(f"\n变体 {idx} (模板 {var['variant_id']}):")
            print("-" * 70)
            print(var['text'][:300] + "...")
            print("-" * 70)

    print("\n" + "=" * 70)
    print("转换完成！")
    print("=" * 70)
    print(f"\n数据集已保存到: {args.output}")
    print(f"  原始 problems: {len(json_data)}")
    print(f"  增强后总数据: {len(dataset)} 条")
    print(f"  增强倍数: {args.num_variants}x")

    print("\n你现在可以使用以下命令进行训练:")
    print(f"  sbatch shells/finetune_mistral_7b_randomized_augmented.sh")
    print("\n或直接运行:")
    print(f"  python3 pddl_finetune.py --mode train --dataset {args.output} ...")


if __name__ == '__main__':
    main()
