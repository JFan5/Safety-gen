#!/usr/bin/env python3
"""
收集PDDL数据集用于fine-tune
从三个场景收集数据：blocksworld, delivery, logistics
来源：各场景根目录下的 problems3 中的 problem/solution 对
"""

import os
import json
import argparse
from pathlib import Path
from typing import List, Dict, Tuple
from datasets import Dataset
import re

# 场景根目录模板
SCENARIO_ROOT_TEMPLATE = "scenarios/{scenario}"

def read_pddl_file(file_path: Path) -> str:
    """读取文本文件内容"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            return f.read().strip()
    except Exception as e:
        print(f"Error reading file {file_path}: {e}")
        return ""

def extract_problem_name(problem_file: Path) -> str:
    """从问题文件名中提取问题名称"""
    return problem_file.stem

def resolve_domain_file(root: Path) -> Path:
    """优先使用 <root>/domain.pddl，否则回退到 training_problems 或 training_problems3 中的 domain.pddl。"""
    cand1 = root / "domain.pddl"
    cand2 = root / "training_problems3" / "domain.pddl"
    cand3 = root / "training_problems" / "domain.pddl"
    
    if cand1.exists():
        return cand1
    elif cand2.exists():
        return cand2
    else:
        return cand3

def build_prompt(domain_content: str, problem_content: str) -> str:
    """构建用于fine-tune的通用prompt（不绑定具体动作名）。"""

    with open('prompt.txt', 'r', encoding='utf-8') as f:
        prompt = f.read()
        
    return prompt

def collect_scenario_data(scenario_name: str, root_dir: Path) -> List[Dict]:
    """收集单个场景（<root>/training_problems 或 training_problems3）中的 problem/solution 对。"""
    print(f"Collecting data from {scenario_name}...")

    # 优先使用 training_problems3，如果不存在则使用 training_problems
    problems_dir = root_dir / "training_problems"
    if not problems_dir.exists():
        problems_dir = root_dir / "training_problems3"
        if not problems_dir.exists():
            print(f"Problems directory not found: {problems_dir}")
            return []

    domain_file = resolve_domain_file(root_dir)
    if not domain_file.exists():
        print(f"Domain file not found: {domain_file}")
        return []

    domain_content = read_pddl_file(domain_file)
    if not domain_content:
        return []

    dataset_entries: List[Dict] = []

    # 遍历 training_problems 或 training_problems3 下的所有 .pddl（排除 domain.pddl），配对同目录下同名 .soln
    problem_files = sorted([p for p in problems_dir.glob("*.pddl") if p.name.lower() != "domain.pddl"])
    print(f"Found {len(problem_files)} problem files in {problems_dir}")

    for problem_file in problem_files:
        solution_file = problem_file.with_suffix('.soln')
        if not solution_file.exists():
            # 跳过没有对应解的文件
            continue

        problem_content = read_pddl_file(problem_file)
        solution_content = read_pddl_file(solution_file)
        if not problem_content or not solution_content:
            continue

        prompt = build_prompt(domain_content, problem_content)

        entry = {
            "prompt": prompt,
            "path": solution_content,
            "scenario": scenario_name,
            "problem_name": extract_problem_name(problem_file),
            "solution_file": str(solution_file),
            "problem_file": str(problem_file),
            "domain_file": str(domain_file),
        }
        dataset_entries.append(entry)

    print(f"Collected {len(dataset_entries)} entries from {scenario_name}")
    return dataset_entries

def validate_solution_format(solution_content: str) -> bool:
    """验证解决方案格式是否包含至少一条计划动作行（放宽条件）。"""
    lines = [ln.strip() for ln in solution_content.strip().split('\n') if ln.strip()]
    # 至少一行满足: 形如 0.00: (action ...) 或者 (action ...)（兼容无时间戳/无duration的plan）
    for line in lines:
        if '(' in line and ')' in line:
            # 若有时间戳，检验时间可解析
            if ':' in line:
                try:
                    time_part = line.split(':')[0].strip()
                    if time_part.replace('.', '').isdigit() or time_part == '0':
                        return True
                except:
                    pass
            else:
                # 无时间戳也允许
                return True
    return False

def filter_valid_solutions(dataset_entries: List[Dict]) -> List[Dict]:
    """过滤出格式合理的解决方案。"""
    valid_entries = []
    for entry in dataset_entries:
        if validate_solution_format(entry["path"]):
            valid_entries.append(entry)
        else:
            print(f"Invalid solution format for {entry['problem_name']}")
    return valid_entries

def create_dataset(dataset_entries: List[Dict], output_path: str = "data/sft/multiple_scenarios/combined_dataset.hf"):
    """创建HuggingFace数据集"""
    if not dataset_entries:
        print("No valid dataset entries found!")
        return

    output_dir = Path(output_path).parent
    output_dir.mkdir(parents=True, exist_ok=True)

    dataset = Dataset.from_list(dataset_entries)
    dataset.save_to_disk(output_path)

    print(f"Dataset saved to {output_path}")
    print(f"Total entries: {len(dataset)}")

    scenario_counts: Dict[str, int] = {}
    for entry in dataset_entries:
        scenario = entry["scenario"]
        scenario_counts[scenario] = scenario_counts.get(scenario, 0) + 1

    print("\nDataset statistics:")
    for scenario, count in scenario_counts.items():
        print(f"  {scenario}: {count} entries")

    stats = {
        "total_entries": len(dataset_entries),
        "scenario_counts": scenario_counts,
        "scenarios": list(scenario_counts.keys()),
        "output_path": output_path
    }
    with open(output_dir / "combined_dataset_stats.json", 'w') as f:
        json.dump(stats, f, indent=2)
    print(f"Statistics saved to {output_dir / 'combined_dataset_stats.json'}")

def parse_arguments():
    """解析命令行参数"""
    parser = argparse.ArgumentParser(
        description="收集PDDL数据集用于fine-tune",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例用法:
  # 使用所有默认场景
  python3 collect_finetuned_dataset_together.py
  
  # 指定特定场景
  python3 collect_finetuned_dataset_together.py --scenarios rovers satellite blocksworld
  
  # 指定输出路径
  python3 collect_finetuned_dataset_together.py --output data/sft/custom_dataset.hf
  
  # 列出所有可用场景
  python3 collect_finetuned_dataset_together.py --list-scenarios
        """
    )
    
    parser.add_argument(
        "--scenarios", 
        nargs="+", 
        default=None,
        help="要收集数据的场景列表 (默认: 所有场景)"
    )
    
    parser.add_argument(
        "--output", 
        default="data/sft/multiple_scenarios/combined_dataset.hf",
        help="输出数据集路径 (默认: data/sft/multiple_scenarios/combined_dataset.hf)"
    )
    
    parser.add_argument(
        "--list-scenarios", 
        action="store_true",
        help="列出所有可用的场景"
    )
    
    return parser.parse_args()

def get_available_scenarios():
    """获取所有可用的场景（通过扫描scenarios目录）"""
    scenarios_dir = Path("scenarios")
    if not scenarios_dir.exists():
        return []
    
    available_scenarios = []
    for scenario_dir in scenarios_dir.iterdir():
        if scenario_dir.is_dir():
            # 检查是否有training_problems或training_problems3目录
            if (scenario_dir / "training_problems").exists() or (scenario_dir / "training_problems3").exists():
                available_scenarios.append(scenario_dir.name)
    
    return sorted(available_scenarios)

def validate_scenarios(scenario_names: List[str]) -> List[str]:
    """验证场景名称是否有效"""
    available_scenarios = get_available_scenarios()
    valid_scenarios = []
    invalid_scenarios = []
    
    for scenario in scenario_names:
        if scenario in available_scenarios:
            valid_scenarios.append(scenario)
        else:
            invalid_scenarios.append(scenario)
    
    if invalid_scenarios:
        print(f"❌ 无效的场景: {invalid_scenarios}")
        print(f"✅ 可用的场景: {available_scenarios}")
        return []
    
    return valid_scenarios

def main():
    """主函数"""
    args = parse_arguments()
    
    # 如果只是列出场景，则显示并退出
    if args.list_scenarios:
        print("可用的场景:")
        for i, scenario in enumerate(get_available_scenarios(), 1):
            print(f"  {i}. {scenario}")
        return
    
    # 确定要使用的场景
    if args.scenarios:
        scenarios_to_use = validate_scenarios(args.scenarios)
        if not scenarios_to_use:
            print("没有有效的场景，退出")
            return
    else:
        scenarios_to_use = get_available_scenarios()
    
    print("="*60)
    print("PDDL Dataset Collection for Fine-tuning")
    print(f"场景数量: {len(scenarios_to_use)}")
    print(f"场景列表: {', '.join(scenarios_to_use)}")
    print(f"输出路径: {args.output}")
    print("="*60)

    all_entries: List[Dict] = []
    for scenario_name in scenarios_to_use:
        root = Path(SCENARIO_ROOT_TEMPLATE.format(scenario=scenario_name))  # 动态构建场景根目录
        entries = collect_scenario_data(scenario_name, root)
        all_entries.extend(entries)

    print(f"\nTotal collected entries: {len(all_entries)}")
    if not all_entries:
        print("No data collected! Please check the directory structure.")
        return

    print("\nFiltering valid solutions...")
    valid_entries = filter_valid_solutions(all_entries)
    print(f"Valid entries: {len(valid_entries)}")

    print("\nCreating dataset...")
    create_dataset(valid_entries, args.output)

    print("\nDataset collection completed!")

if __name__ == "__main__":
    main()
