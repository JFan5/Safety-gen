#!/usr/bin/env python3
"""
从 pddl3/<scenario>/grpo_500 目录读取问题，生成 GRPO 训练用的 JSONL 文件

GRPO 数据集格式:
- prompt (str): required - 问题描述
- meta (dict): optional - 包含 domain_file / problem_file 等，用于 VAL 校验

注意: GRPO 不需要 plan/response，模型会在线生成，然后通过 reward 函数评估

生成到 /jfan5/grpo_data-127:
1. 每个场景单独的 JSONL 文件
2. 一个合并的 JSONL 文件
"""

import json
from pathlib import Path
from typing import Dict, List
from collections import defaultdict


def format_pddl_prompt(problem_pddl: str) -> str:
    """格式化 PDDL 为训练 prompt（不包含 domain，因为 domain 信息在 meta 中）"""
    prompt = f"""You are a PDDL planner. Given the following problem, generate a valid plan.

Problem:
{problem_pddl}

Plan:
"""
    return prompt


def read_file(file_path: Path) -> str:
    """读取文件内容"""
    with open(file_path, 'r', encoding='utf-8') as f:
        return f.read()


def process_scenario(scenario: str, pddl3_dir: Path) -> List[Dict]:
    """从 grpo_500 目录读取问题并生成训练数据"""
    print(f"\n{'='*80}")
    print(f"处理场景: {scenario}")
    print(f"{'='*80}")

    # 路径
    grpo_500_dir = pddl3_dir / scenario / "grpo_500"
    domain3_file = pddl3_dir / scenario / "domain3.pddl"

    if not grpo_500_dir.exists():
        print(f"  跳过: {grpo_500_dir} 不存在")
        return []

    if not domain3_file.exists():
        print(f"  跳过: {domain3_file} 不存在")
        return []

    # 相对路径（用于 meta）
    domain_rel = f"pddl3/{scenario}/domain3.pddl"

    print(f"  Domain 相对路径: {domain_rel}")

    # 读取所有问题
    pddl_files = list(grpo_500_dir.glob("*.pddl"))
    print(f"  找到 {len(pddl_files)} 个问题文件")

    training_data = []

    for pddl_file in pddl_files:
        problem_id = pddl_file.stem

        # 相对路径（用于 meta）
        problem_rel = f"pddl3/{scenario}/grpo_500/{pddl_file.name}"

        # 读取问题
        problem_pddl = read_file(pddl_file)

        # 生成 prompt
        prompt = format_pddl_prompt(problem_pddl)

        # 创建训练样本（GRPO 格式）
        sample = {
            "prompt": prompt,
            "meta": {
                "scenario": scenario,
                "problem_id": problem_id,
                "domain_file": domain_rel,
                "problem_file": problem_rel
            }
        }

        training_data.append(sample)

    print(f"  成功处理 {len(training_data)} 个问题")

    return training_data


def save_jsonl(data: List[Dict], output_file: Path):
    """保存为 JSONL 格式"""
    output_file.parent.mkdir(parents=True, exist_ok=True)

    with open(output_file, 'w', encoding='utf-8') as f:
        for item in data:
            f.write(json.dumps(item, ensure_ascii=False) + '\n')

    print(f"  已保存到: {output_file}")


def generate_stats(data: List[Dict]) -> Dict:
    """生成统计信息"""
    stats = {
        "total": len(data),
        "by_scenario": defaultdict(int)
    }

    for item in data:
        scenario = item.get("meta", {}).get("scenario", "unknown")
        stats["by_scenario"][scenario] += 1

    stats["by_scenario"] = dict(stats["by_scenario"])
    return stats


def main():
    pddl3_dir = Path("/home/ubuntu/Safety-gen/pddl3")
    output_base_dir = Path("/jfan5/grpo_data-127")
    scenarios = ['blocksworld', 'spanner', 'grippers', 'ferry']

    print("=" * 80)
    print("从 grpo_500 生成 GRPO 训练数据到 /jfan5/grpo_data-127")
    print("=" * 80)
    print("\nGRPO 数据格式说明:")
    print("  - prompt: 问题描述 (required)")
    print("  - meta: {scenario, problem_id, domain_file, problem_file} (用于 VAL 校验)")
    print("  - 注意: 不包含 plan/response，GRPO 会在线生成并用 reward 函数评估")

    all_data = []
    scenario_stats = {}

    # 处理每个场景
    for scenario in scenarios:
        scenario_data = process_scenario(scenario, pddl3_dir)

        if scenario_data:
            # 保存单场景 JSONL
            output_file = output_base_dir / f"{scenario}.jsonl"
            save_jsonl(scenario_data, output_file)

            # 添加到总数据
            all_data.extend(scenario_data)
            scenario_stats[scenario] = len(scenario_data)

    # 保存合并的 JSONL
    if all_data:
        print(f"\n{'='*80}")
        print("创建合并数据集")
        print(f"{'='*80}")

        merged_file = output_base_dir / "merged.jsonl"
        save_jsonl(all_data, merged_file)
        print(f"  合并总数: {len(all_data)}")

    # 生成统计信息
    stats = generate_stats(all_data)

    # 保存统计信息
    stats_file = output_base_dir / "metadata.json"
    with open(stats_file, 'w', encoding='utf-8') as f:
        json.dump(stats, f, indent=2, ensure_ascii=False)
    print(f"\n  统计信息已保存到: {stats_file}")

    # 生成汇总报告
    print(f"\n{'='*80}")
    print("汇总报告")
    print(f"{'='*80}\n")

    print("| 场景 | 问题数 | 输出文件 |")
    print("|------|--------|----------|")

    for scenario in scenarios:
        if scenario in scenario_stats:
            count = scenario_stats[scenario]
            print(f"| {scenario} | {count} | {scenario}.jsonl |")

    print(f"| **总计** | **{len(all_data)}** | merged.jsonl |")

    print(f"\n数据集已生成到: {output_base_dir}/")
    print(f"  - 单场景文件: blocksworld.jsonl, spanner.jsonl, grippers.jsonl, ferry.jsonl")
    print(f"  - 合并文件: merged.jsonl")
    print(f"  - 统计信息: metadata.json")


if __name__ == "__main__":
    main()
