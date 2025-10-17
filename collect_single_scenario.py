#!/usr/bin/env python3
"""
收集单个PDDL场景的数据集用于fine-tune
从指定场景的 training_problems3 目录中收集 problem/solution 对
"""

import os
import json
import argparse
from pathlib import Path
from typing import List, Dict, Tuple
from datasets import Dataset
import re

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
    """优先使用 <root>/domain.pddl，否则回退到 <root>/training_problems3/domain.pddl。"""
    cand1 = root / "domain.pddl"
    cand2 = root / "training_problems3" / "domain.pddl"
    if cand1.exists():
        return cand1
    return cand2

def build_prompt(domain_content: str, problem_content: str) -> str:
    """构建用于fine-tune的通用prompt（不绑定具体动作名）。"""
    prompt = f"""
You are a PDDL planning expert. Your task is to generate a **valid plan** for the given domain and problem.

DOMAIN:
{domain_content}

PROBLEM:
{problem_content}

### Output Requirements:
- Return ONLY the plan steps, one per line.
- Each line must follow the format:
  (<ACTION_NAME> <param1> <param2> ...)
- Use only objects defined in the PROBLEM.
- Do NOT include any explanations, comments, or headers.
- Do NOT output anything except the plan lines.
- The output must NOT contain natural language sentences.
### Plan:
"""
    return prompt

def collect_scenario_data(scenario_name: str, root_dir: Path) -> List[Dict]:
    """收集单个场景（<root>/training_problems3）中的 problem/solution 对。"""
    print(f"Collecting data from {scenario_name}...")

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

    # 遍历 training_problems3 下的所有 .pddl（排除 domain.pddl），配对同目录下同名 .soln
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

def create_dataset(dataset_entries: List[Dict], output_path: str, scenario_name: str):
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

    stats = {
        "total_entries": len(dataset_entries),
        "scenario": scenario_name,
        "scenario_count": len(dataset_entries)
    }
    with open(output_dir / f"{scenario_name}_dataset_stats.json", 'w') as f:
        json.dump(stats, f, indent=2)
    print(f"Statistics saved to {output_dir / f'{scenario_name}_dataset_stats.json'}")

def main():
    """主函数"""
    parser = argparse.ArgumentParser(description="Collect PDDL dataset for a single scenario")
    parser.add_argument("scenario", help="Scenario name (e.g., blocksworld, delivery, logistics)")
    parser.add_argument("--root", default=None, help="Root directory for the scenario (default: ./<scenario>)")
    parser.add_argument("--output", default=None, help="Output path for the dataset (default: data/sft/<scenario>_dataset.hf)")
    
    args = parser.parse_args()
    
    # 确定根目录
    if args.root:
        root_dir = Path(args.root)
    else:
        root_dir = Path("scenarios") / args.scenario
    
    # 确定输出路径
    if args.output:
        output_path = args.output
    else:
        output_path = f"data/sft/{args.scenario}_dataset.hf"
    
    print("="*60)
    print(f"PDDL Dataset Collection for {args.scenario}")
    print("="*60)
    print(f"Root directory: {root_dir}")
    print(f"Output path: {output_path}")
    print("="*60)

    if not root_dir.exists():
        print(f"Error: Root directory {root_dir} does not exist!")
        return

    # 收集数据
    entries = collect_scenario_data(args.scenario, root_dir)
    print(f"\nTotal collected entries: {len(entries)}")
    
    if not entries:
        print("No data collected! Please check the directory structure.")
        return

    print("\nFiltering valid solutions...")
    valid_entries = filter_valid_solutions(entries)
    print(f"Valid entries: {len(valid_entries)}")

    print("\nCreating dataset...")
    create_dataset(valid_entries, output_path, args.scenario)

    print(f"\nDataset collection for {args.scenario} completed!")

if __name__ == "__main__":
    main()
