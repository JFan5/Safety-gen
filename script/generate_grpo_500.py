#!/usr/bin/env python3
"""
从 pddl3/<scenario>/grpo_500 目录读取问题，生成 GRPO 训练用的 JSONL 文件

GRPO 数据集格式:
- prompt (str): required - 问题描述（包含 domain 和 problem）
- meta (dict): optional - 包含 domain_file / problem_file 等，用于 VAL 校验

注意: GRPO 不需要 plan/response，模型会在线生成，然后通过 reward 函数评估

生成到 /jfan5/grpo_data/five_domain_0108:
1. 每个场景单独的 JSONL 文件
2. 一个合并的 combined.jsonl 文件
"""

import argparse
import json
from pathlib import Path
from typing import Dict, List, Optional
from collections import defaultdict


def format_pddl_prompt_simple(domain_pddl: str, problem_pddl: str) -> str:
    """格式化 PDDL 为训练 prompt（简单模板）"""
    prompt = f"""You are a PDDL planning expert. Solve the following problem based on the provided domain.

Domain:
{domain_pddl}

Problem:
{problem_pddl}

Plan:
"""
    return prompt


def format_pddl_prompt_from_template(domain_pddl: str, problem_pddl: str, template: str) -> str:
    """使用外部模板格式化 PDDL prompt"""
    # 支持两种占位符格式: {domain_content}/{problem_content} 或 {domain_pddl}/{problem_pddl}
    prompt = template.replace("{domain_content}", domain_pddl)
    prompt = prompt.replace("{problem_content}", problem_pddl)
    prompt = prompt.replace("{domain_pddl}", domain_pddl)
    prompt = prompt.replace("{problem_pddl}", problem_pddl)
    return prompt


def load_prompt_template(template_file: Path) -> str:
    """从文件加载 prompt 模板"""
    with open(template_file, 'r', encoding='utf-8') as f:
        content = f.read()

    # 如果文件内容是 Python 格式的 f-string 定义（如 prompt = f"""..."""），提取其中的模板
    if content.strip().startswith('prompt = f"""'):
        # 移除 'prompt = f"""' 和结尾的 '"""'
        content = content.strip()
        if content.startswith('prompt = f"""'):
            content = content[len('prompt = f"""'):]
        if content.endswith('"""'):
            content = content[:-3]
    elif content.strip().startswith("prompt = f'''"):
        content = content.strip()
        if content.startswith("prompt = f'''"):
            content = content[len("prompt = f'''"):]
        if content.endswith("'''"):
            content = content[:-3]

    return content


def read_file(file_path: Path) -> str:
    """读取文件内容"""
    with open(file_path, 'r', encoding='utf-8') as f:
        return f.read()


def process_scenario(scenario: str, pddl3_dir: Path, max_problems: Optional[int] = None,
                     prompt_template: Optional[str] = None) -> List[Dict]:
    """从 grpo_500 目录读取问题并生成训练数据

    Args:
        scenario: 场景名称
        pddl3_dir: pddl3 目录路径
        max_problems: 最大问题数量
        prompt_template: 外部 prompt 模板（如果为 None，使用简单模板）
    """
    print(f"\n{'='*80}")
    print(f"Processing scenario: {scenario}")
    print(f"{'='*80}")

    # 路径
    grpo_500_dir = pddl3_dir / scenario / "grpo_500"
    domain3_file = pddl3_dir / scenario / "domain3.pddl"

    if not grpo_500_dir.exists():
        print(f"  ERROR: {grpo_500_dir} does not exist")
        return []

    if not domain3_file.exists():
        print(f"  ERROR: {domain3_file} does not exist")
        return []

    # 相对路径（用于 meta）
    domain_rel = f"pddl3/{scenario}/domain3.pddl"

    print(f"  Domain file: {domain_rel}")

    # 读取 domain 文件
    domain_pddl = read_file(domain3_file)

    # 读取所有问题文件
    pddl_files = sorted(grpo_500_dir.glob("*.pddl"))
    print(f"  Found {len(pddl_files)} problem files")

    # 限制数量
    if max_problems is not None and len(pddl_files) > max_problems:
        pddl_files = pddl_files[:max_problems]
        print(f"  Limited to {max_problems} problems")

    training_data = []

    for pddl_file in pddl_files:
        problem_id = pddl_file.stem

        # 相对路径（用于 meta）
        problem_rel = f"pddl3/{scenario}/grpo_500/{pddl_file.name}"

        # 读取问题
        problem_pddl = read_file(pddl_file)

        # 生成 prompt（包含 domain 和 problem）
        if prompt_template is not None:
            prompt = format_pddl_prompt_from_template(domain_pddl, problem_pddl, prompt_template)
        else:
            prompt = format_pddl_prompt_simple(domain_pddl, problem_pddl)

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

    print(f"  Successfully processed {len(training_data)} problems")

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
    parser = argparse.ArgumentParser(description="Generate GRPO training data from pddl3/*/grpo_500 directories")
    parser.add_argument("--output-dir", "-o", type=str, default="/jfan5/grpo_data/five_domain_0108",
                        help="Output directory for JSONL files")
    parser.add_argument("--pddl3-dir", type=str, default="/home/ubuntu/Safety-gen/pddl3",
                        help="Path to pddl3 directory")
    parser.add_argument("--scenarios", type=str, nargs="+",
                        default=['blocksworld', 'spanner', 'ferry', 'delivery', 'grippers'],
                        help="List of scenarios to process")
    parser.add_argument("--max-problems", type=int, default=500,
                        help="Maximum number of problems per scenario (default: 500)")
    parser.add_argument("--prompt-mode", type=str, choices=["simple", "file"], default="simple",
                        help="Prompt template mode: 'simple' uses built-in template, 'file' reads from prompt file (default: simple)")
    parser.add_argument("--prompt-file", type=str, default="/home/ubuntu/Safety-gen/prompt.txt",
                        help="Path to prompt template file (used when --prompt-mode=file)")
    args = parser.parse_args()

    pddl3_dir = Path(args.pddl3_dir)
    output_base_dir = Path(args.output_dir)
    scenarios = args.scenarios
    max_problems = args.max_problems
    prompt_mode = args.prompt_mode
    prompt_file = Path(args.prompt_file)

    # 加载 prompt 模板
    prompt_template = None
    if prompt_mode == "file":
        if not prompt_file.exists():
            print(f"ERROR: Prompt file not found: {prompt_file}")
            return
        prompt_template = load_prompt_template(prompt_file)
        print(f"Loaded prompt template from: {prompt_file}")

    print("=" * 80)
    print(f"Generating GRPO training data to {output_base_dir}")
    print("=" * 80)
    print("\nGRPO data format:")
    print("  - prompt: Domain + Problem description (required)")
    print("  - meta: {scenario, problem_id, domain_file, problem_file} (for VAL validation)")
    print("  - Note: No plan/response - GRPO generates online and evaluates via reward function")
    print(f"\nScenarios: {scenarios}")
    print(f"Max problems per scenario: {max_problems}")
    print(f"Prompt mode: {prompt_mode}" + (f" ({prompt_file})" if prompt_mode == "file" else " (built-in)"))

    all_data = []
    scenario_stats = {}
    failed_scenarios = []

    # 处理每个场景
    for scenario in scenarios:
        try:
            scenario_data = process_scenario(scenario, pddl3_dir, max_problems, prompt_template)

            if scenario_data:
                # 保存单场景 JSONL
                output_file = output_base_dir / f"{scenario}.jsonl"
                save_jsonl(scenario_data, output_file)

                # 添加到总数据
                all_data.extend(scenario_data)
                scenario_stats[scenario] = len(scenario_data)
            else:
                failed_scenarios.append((scenario, "No data generated"))
        except Exception as e:
            print(f"  ERROR processing {scenario}: {e}")
            failed_scenarios.append((scenario, str(e)))

    # 保存合并的 JSONL
    if all_data:
        print(f"\n{'='*80}")
        print("Creating combined dataset")
        print(f"{'='*80}")

        combined_file = output_base_dir / "combined.jsonl"
        save_jsonl(all_data, combined_file)
        print(f"  Total: {len(all_data)} entries")

    # 生成统计信息
    stats = generate_stats(all_data)

    # 保存统计信息
    stats_file = output_base_dir / "metadata.json"
    with open(stats_file, 'w', encoding='utf-8') as f:
        json.dump(stats, f, indent=2, ensure_ascii=False)
    print(f"\n  Metadata saved to: {stats_file}")

    # 生成汇总报告
    print(f"\n{'='*80}")
    print("Summary Report")
    print(f"{'='*80}\n")

    print("| Scenario | Count | Output File |")
    print("|----------|-------|-------------|")

    for scenario in scenarios:
        if scenario in scenario_stats:
            count = scenario_stats[scenario]
            print(f"| {scenario} | {count} | {scenario}.jsonl |")
        else:
            print(f"| {scenario} | FAILED | - |")

    print(f"| **Total** | **{len(all_data)}** | combined.jsonl |")

    # 报告失败的场景
    if failed_scenarios:
        print(f"\n{'='*80}")
        print("Failed Scenarios")
        print(f"{'='*80}")
        for scenario, reason in failed_scenarios:
            print(f"  - {scenario}: {reason}")

    print(f"\nDataset generated at: {output_base_dir}/")
    scenario_files = ", ".join([f"{s}.jsonl" for s in scenarios if s in scenario_stats])
    print(f"  - Per-scenario files: {scenario_files}")
    print(f"  - Combined file: combined.jsonl")
    print(f"  - Metadata: metadata.json")


if __name__ == "__main__":
    main()
