#!/usr/bin/env python3
"""
收集并合并多个场景的PDDL数据集用于fine-tune
从已生成的场景目录中读取数据并合并（支持从 collect_single_scenario.py 生成的目录读取）
"""

import json
import argparse
from pathlib import Path
from typing import List, Dict, Optional, Set
from datasets import Dataset

# 默认的四个场景（从 collect_multi_scenarios_sft_variant.sh 中提取）
DEFAULT_VARIANT_SCENARIOS = ["blocksworld", "ferry", "grippers", "spanner"]

# 默认的基础输出目录
DEFAULT_BASE_DIR = Path.home() / "data" / "sft"


def find_scenario_data_dir(scenario_name: str, base_dir: Path = None) -> Optional[Path]:
    """
    查找场景的数据目录。
    查找模式：{base_dir}/{scenario}-variant-500/
    
    Args:
        scenario_name: 场景名称
        base_dir: 基础目录，默认为 ~/data/sft
        
    Returns:
        找到的数据目录路径，如果不存在则返回 None
    """
    if base_dir is None:
        base_dir = DEFAULT_BASE_DIR
    
    base_dir = Path(base_dir).expanduser()
    
    # 尝试多种可能的目录名称
    candidates = [
        base_dir / f"{scenario_name}-variant-500",
        base_dir / f"{scenario_name}-variant-500" / "pddl3.hf",
        base_dir / scenario_name,
    ]
    
    for candidate in candidates:
        if candidate.exists():
            if candidate.is_dir():
                return candidate
            elif candidate.is_file() and candidate.suffix == '.hf':
                return candidate.parent
    
    return None


def load_entries_from_json(json_path: Path) -> List[Dict]:
    """从 JSON 文件加载数据集条目"""
    try:
        with open(json_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        if isinstance(data, list):
            return data
        else:
            print(f"Warning: JSON file {json_path} does not contain a list")
            return []
    except Exception as e:
        print(f"Error loading JSON from {json_path}: {e}")
        return []


def load_entries_from_hf(hf_path: Path) -> List[Dict]:
    """从 HuggingFace 数据集加载条目"""
    try:
        dataset = Dataset.load_from_disk(str(hf_path))
        # 将数据集转换为字典列表
        entries = []
        for i in range(len(dataset)):
            entry = {key: dataset[i][key] for key in dataset.column_names}
            entries.append(entry)
        return entries
    except Exception as e:
        print(f"Error loading HuggingFace dataset from {hf_path}: {e}")
        return []


def collect_scenario_entries(scenario_name: str, base_dir: Path = None) -> List[Dict]:
    """
    从场景的数据目录中收集条目。
    优先尝试从 JSON 文件读取，如果不存在则尝试从 HuggingFace 数据集读取。
    
    Args:
        scenario_name: 场景名称
        base_dir: 基础目录
        
    Returns:
        数据集条目列表
    """
    data_dir = find_scenario_data_dir(scenario_name, base_dir)
    if data_dir is None:
        print(f"Warning: Data directory not found for scenario '{scenario_name}'")
        return []
    
    print(f"Loading data from {scenario_name}...")
    print(f"  Data directory: {data_dir}")
    
    entries: List[Dict] = []
    
    # 优先尝试从 JSON 文件读取
    json_candidates = [
        data_dir / "pddl3_dataset.json",
        data_dir / "pddl2_dataset.json",
        data_dir / f"{scenario_name}_dataset.json",
    ]
    
    json_found = False
    for json_path in json_candidates:
        if json_path.exists():
            print(f"  Loading from JSON: {json_path}")
            entries = load_entries_from_json(json_path)
            json_found = True
            break
    
    # 如果 JSON 不存在，尝试从 HuggingFace 数据集读取
    if not json_found:
        hf_candidates = [
            data_dir / "pddl3.hf",
            data_dir / "pddl2.hf",
            data_dir / f"{scenario_name}.hf",
        ]
        
        for hf_path in hf_candidates:
            if hf_path.exists():
                print(f"  Loading from HuggingFace dataset: {hf_path}")
                entries = load_entries_from_hf(hf_path)
                break
    
    if not entries:
        print(f"  Warning: No data found for scenario '{scenario_name}'")
        return []
    
    # 确保所有条目都有 scenario 字段
    for entry in entries:
        if "scenario" not in entry:
            entry["scenario"] = scenario_name
    
    print(f"  Loaded {len(entries)} entries from {scenario_name}")
    return entries


def create_combined_dataset(
    dataset_entries: List[Dict],
    output_path: Path,
):
    """创建合并后的 HuggingFace 数据集并保存统计信息"""
    if not dataset_entries:
        print("No valid dataset entries found!")
        return
    
    # 确保输出路径是绝对路径并展开用户目录
    output_path = Path(output_path).expanduser().resolve()
    
    # 如果输出路径以 .hf 结尾，则创建目录
    if output_path.suffix == '.hf':
        output_dir = output_path.parent
        hf_path = output_path
    else:
        # 如果是目录，在目录下创建默认文件名
        output_dir = output_path
        hf_path = output_dir / "combined.hf"
    
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # 创建 HuggingFace 数据集
    dataset = Dataset.from_list(dataset_entries)
    dataset.save_to_disk(str(hf_path))
    
    print(f"\nDataset saved to {hf_path}")
    print(f"Total entries: {len(dataset)}")
    
    # 统计信息
    scenario_counts: Dict[str, int] = {}
    pddl_counts: Dict[str, int] = {}
    variant_counts: Dict[str, int] = {}
    
    for entry in dataset_entries:
        scenario = entry.get("scenario", "UNKNOWN")
        scenario_counts[scenario] = scenario_counts.get(scenario, 0) + 1
        
        version = entry.get("pddl", "UNKNOWN")
        pddl_counts[version] = pddl_counts.get(version, 0) + 1
        
        # 统计 prompt variant 信息（如果存在）
        if "prompt_variant" in entry:
            variant_key = f"{scenario}-variant-{entry['prompt_variant']}"
            variant_counts[variant_key] = variant_counts.get(variant_key, 0) + 1
    
    print("\nDataset statistics:")
    print("  Scenario distribution:")
    for scenario, count in sorted(scenario_counts.items()):
        print(f"    {scenario}: {count} entries")
    
    print("  PDDL version distribution:")
    for version, count in sorted(pddl_counts.items()):
        print(f"    {version}: {count} entries")
    
    if variant_counts:
        print("  Prompt variant distribution:")
        for variant, count in sorted(variant_counts.items()):
            print(f"    {variant}: {count} entries")
    
    # 保存统计信息
    stats = {
        "total_entries": len(dataset_entries),
        "scenario_counts": scenario_counts,
        "scenarios": sorted(scenario_counts.keys()),
        "pddl_counts": pddl_counts,
        "output_path": str(hf_path),
    }
    
    if variant_counts:
        stats["variant_counts"] = variant_counts
    
    stats_path = output_dir / "combined_dataset_stats.json"
    with open(stats_path, 'w', encoding='utf-8') as f:
        json.dump(stats, f, indent=2, ensure_ascii=False)
    print(f"\nStatistics saved to {stats_path}")
    
    # 保存包含所有问题和答案的 JSON 文件
    json_data = []
    for entry in dataset_entries:
        json_entry = {
            "prompt": entry.get("prompt", ""),
            "solution": entry.get("path", ""),
            "scenario": entry.get("scenario", "UNKNOWN"),
            "pddl": entry.get("pddl", "UNKNOWN"),
            "problem_name": entry.get("problem_name", ""),
        }
        # 如果存在 variant 信息，也包含进去
        if "prompt_variant" in entry:
            json_entry["prompt_variant"] = entry["prompt_variant"]
        if "variant_index" in entry:
            json_entry["variant_index"] = entry["variant_index"]
        
        json_data.append(json_entry)
    
    json_file_path = output_dir / "dataset_qa.json"
    with open(json_file_path, 'w', encoding='utf-8') as f:
        json.dump(json_data, f, indent=2, ensure_ascii=False)
    print(f"Questions and answers saved to {json_file_path}")


def parse_arguments():
    """解析命令行参数"""
    parser = argparse.ArgumentParser(
        description="收集并合并多个场景的PDDL数据集（从已生成的目录读取）",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例用法:
  # 使用默认的四个场景（blocksworld, ferry, grippers, spanner）
  python3 collect_finetuned_dataset_together.py
  
  # 指定特定场景
  python3 collect_finetuned_dataset_together.py --scenarios blocksworld ferry
  
  # 指定输出路径
  python3 collect_finetuned_dataset_together.py --output ~/data/sft/combined-variant-500/combined.hf
  
  # 指定基础目录（查找场景数据的目录）
  python3 collect_finetuned_dataset_together.py --base-dir ~/data/sft
        """
    )
    
    parser.add_argument(
        "--scenarios", 
        nargs="+", 
        default=None,
        help=f"要合并的场景列表 (默认: {', '.join(DEFAULT_VARIANT_SCENARIOS)})"
    )
    
    parser.add_argument(
        "--output", 
        default=None,
        help="输出数据集路径 (默认: {base_dir}/combined-variant-500/combined.hf)"
    )
    
    parser.add_argument(
        "--base-dir",
        default=None,
        help=f"查找场景数据的基础目录 (默认: {DEFAULT_BASE_DIR})"
    )
    
    return parser.parse_args()


def main():
    """主函数"""
    args = parse_arguments()
    
    # 确定基础目录
    base_dir = Path(args.base_dir).expanduser() if args.base_dir else DEFAULT_BASE_DIR
    
    # 确定要使用的场景
    if args.scenarios:
        scenarios_to_use = args.scenarios
    else:
        scenarios_to_use = DEFAULT_VARIANT_SCENARIOS
    
    # 确定输出路径
    if args.output:
        output_path = Path(args.output).expanduser()
    else:
        output_path = base_dir / "combined-variant-500" / "combined.hf"
    
    print("="*60)
    print("PDDL Dataset Collection and Merging")
    print("="*60)
    print(f"Base directory: {base_dir}")
    print(f"Scenarios: {', '.join(scenarios_to_use)}")
    print(f"Output path: {output_path}")
    print("="*60)
    
    # 收集所有场景的数据
    all_entries: List[Dict] = []
    for scenario_name in scenarios_to_use:
        entries = collect_scenario_entries(scenario_name, base_dir)
        if entries:
            all_entries.extend(entries)
        else:
            print(f"Warning: No data collected from scenario '{scenario_name}'")
    
    print(f"\nTotal collected entries: {len(all_entries)}")
    
    if not all_entries:
        print("No data collected! Please check:")
        print(f"  1. Base directory exists: {base_dir}")
        print(f"  2. Scenario directories exist under {base_dir}")
        print(f"  3. JSON or HuggingFace dataset files exist in scenario directories")
        return
    
    # 创建合并后的数据集
    print("\nCreating combined dataset...")
    create_combined_dataset(all_entries, output_path)
    
    print("\nDataset collection and merging completed!")


if __name__ == "__main__":
    main()
