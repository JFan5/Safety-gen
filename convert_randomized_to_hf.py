#!/usr/bin/env python3
"""
将随机化的 PDDL JSON 数据集转换为 HuggingFace 格式
用于 pddl_finetune.py 训练
"""

import json
import argparse
from pathlib import Path
from datasets import Dataset, DatasetDict
from typing import List, Dict


def format_pddl_prompt(domain_pddl: str, problem_pddl: str) -> str:
    """
    格式化 PDDL 为训练 prompt

    Args:
        domain_pddl: Domain PDDL 内容
        problem_pddl: Problem PDDL 内容

    Returns:
        格式化后的 prompt
    """
    prompt = f"""Given the following PDDL domain and problem, generate a valid plan.

Domain:
{domain_pddl}

Problem:
{problem_pddl}

Generate a plan to solve this problem:"""

    return prompt


def convert_json_to_hf_format(json_data: List[Dict]) -> Dict[str, List]:
    """
    将 JSON 数据转换为 HuggingFace 格式

    Args:
        json_data: 原始 JSON 数据列表

    Returns:
        HuggingFace 格式的字典
    """
    hf_data = {
        'prompt': [],
        'path': [],
        'domain': [],
        'problem_id': [],
        'domain_pddl': [],
        'problem_pddl': [],
        'plan': []
    }

    for item in json_data:
        # 创建 prompt（用于 pddl_finetune.py）
        prompt = format_pddl_prompt(item['domain_pddl'], item['problem_pddl'])

        hf_data['prompt'].append(prompt)
        hf_data['path'].append(item['plan'])
        hf_data['domain'].append(item['domain'])
        hf_data['problem_id'].append(item['problem_id'])
        hf_data['domain_pddl'].append(item['domain_pddl'])
        hf_data['problem_pddl'].append(item['problem_pddl'])
        hf_data['plan'].append(item['plan'])

    return hf_data


def create_train_val_split(dataset: Dataset, val_ratio: float = 0.1, seed: int = 42) -> DatasetDict:
    """
    创建训练/验证集分割

    Args:
        dataset: 原始数据集
        val_ratio: 验证集比例
        seed: 随机种子

    Returns:
        包含训练集和验证集的 DatasetDict
    """
    # 将 domain 列转换为 ClassLabel 以支持分层分割
    from datasets import ClassLabel
    domain_names = sorted(list(set(dataset['domain'])))
    dataset = dataset.cast_column('domain', ClassLabel(names=domain_names))

    # 按场景分层分割
    split = dataset.train_test_split(
        test_size=val_ratio,
        seed=seed,
        stratify_by_column='domain'
    )

    return DatasetDict({
        'train': split['train'],
        'validation': split['test']
    })


def main():
    parser = argparse.ArgumentParser(
        description='将随机化 PDDL JSON 数据集转换为 HuggingFace 格式'
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
        help='输出 HuggingFace 数据集路径（例如：/jfan5/sft_data/four_scenarios500_randomized/combined.hf）'
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

    args = parser.parse_args()

    print("=" * 70)
    print("将随机化 PDDL JSON 数据集转换为 HuggingFace 格式")
    print("=" * 70)

    # 读取 JSON 数据
    print(f"\n读取输入文件: {args.input}")
    with open(args.input, 'r', encoding='utf-8') as f:
        json_data = json.load(f)

    print(f"  加载了 {len(json_data)} 条数据")

    # 统计各场景数量
    from collections import Counter
    domain_counts = Counter(item['domain'] for item in json_data)
    print("\n各场景分布:")
    for domain, count in sorted(domain_counts.items()):
        print(f"  {domain}: {count} 条")

    # 转换为 HuggingFace 格式
    print("\n转换为 HuggingFace 格式...")
    hf_data = convert_json_to_hf_format(json_data)
    dataset = Dataset.from_dict(hf_data)

    print(f"  数据集大小: {len(dataset)} 条")
    print(f"  字段: {list(dataset.column_names)}")

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
        dataset_dict = create_train_val_split(dataset, args.val_ratio, args.seed)

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
    print(f"\nPrompt (前 300 字符):")
    print(sample['prompt'][:300] + "...")
    print(f"\nPath/Plan (前 200 字符):")
    print(sample['path'][:200])
    print("-" * 70)

    print("\n" + "=" * 70)
    print("转换完成！")
    print("=" * 70)
    print(f"\n数据集已保存到: {args.output}")
    print("\n你现在可以使用以下命令进行训练:")
    print(f"  sbatch shells/finetune_mistral_7b_randomized.sh")
    print("\n或直接运行:")
    print(f"  python3 pddl_finetune.py --mode train --dataset {args.output} ...")


if __name__ == '__main__':
    main()
