#!/usr/bin/env python3
"""
收集单个PDDL场景的数据集用于fine-tune
从指定场景的 training_problems3 目录中收集 problem/solution 对
"""

import os
import json
import argparse
from pathlib import Path
from typing import List, Dict, Optional
from datasets import Dataset

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

def resolve_domain_file(root: Path, pddl_version: str) -> Path:
    """根据 PDDL 版本解析 domain 文件路径。

    - PDDL2: 使用 <root>/domain.pddl
    - PDDL3: 优先 <root>/domain3.pddl，回退到 <root>/training_problems3/domain3.pddl（若存在）
    """
    version = (pddl_version or "").upper()
    if version == "PDDL2":
        return root / "domain.pddl"
    # 默认按 PDDL3 处理
    cand1 = root / "domain3.pddl"
    cand2 = root / "training_problems3" / "domain3.pddl"
    if cand1.exists():
        return cand1
    return cand2


def build_prompt(domain_content: str, problem_content: str, pddl_version: str) -> str:
    """使用统一的 prompt.txt 模板构建输入；若不存在则使用默认格式。"""
    file_path = Path('prompt.txt')
    if file_path.exists():
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                prompt_text = f.read()
        except Exception as e:
            print(f"Error reading prompt template prompt.txt: {e}")
            prompt_text = "{domain_content}\n\n{problem_content}"
    else:
        print("Warning: prompt.txt not found. Falling back to default prompt format.")
        prompt_text = "{domain_content}\n\n{problem_content}"

    return prompt_text.format(domain_content=domain_content, problem_content=problem_content)

def collect_scenario_data(
    scenario_name: str,
    root_dir: Path,
    pddl_version: str,
    max_entries: Optional[int] = None,
) -> List[Dict]:
    """收集单个场景中的 problem/solution 对，问题目录由 PDDL 版本决定。

    - PDDL2: <root>/all_problems/training
    - PDDL3: <root>/all_problems3/training
    """
    print(f"Collecting data from {scenario_name}...")

    version = (pddl_version or "").upper()
    if version == "PDDL2":
        problems_dir = root_dir / "all_problems" / "training"
    else:
        problems_dir = root_dir / "all_problems3" / "training"
    if not problems_dir.exists():
        print(f"Problems directory not found: {problems_dir}")
        return []

    domain_file = resolve_domain_file(root_dir, version)
    if not domain_file.exists():
        print(f"Domain file not found: {domain_file}")
        return []

    domain_content = read_pddl_file(domain_file)
    if not domain_content:
        return []

    dataset_entries: List[Dict] = []

    # 遍历 training_problems3 下的所有 .pddl（排除 domain.pddl 与 domain3.pddl），配对同目录下同名 .soln
    problem_files = sorted([p for p in problems_dir.glob("*.pddl") if p.name.lower() not in {"domain.pddl", "domain3.pddl"}])
    print(f"Found {len(problem_files)} problem files in {problems_dir}")
    remaining_quota = max_entries

    for problem_file in problem_files:
        if remaining_quota is not None and remaining_quota <= 0:
            break

        solution_file = problem_file.with_suffix('.soln')
        if not solution_file.exists():
            # 跳过没有对应解的文件
            continue

        problem_content = read_pddl_file(problem_file)
        solution_content = read_pddl_file(solution_file)
        if not problem_content or not solution_content:
            continue

        prompt = build_prompt(domain_content, problem_content, version)

        entry = {
            "prompt": prompt,
            "path": solution_content,
            "scenario": scenario_name,
            "pddl": version,
            "problem_name": extract_problem_name(problem_file),
            "solution_file": str(solution_file),
            "problem_file": str(problem_file),
            "domain_file": str(domain_file),
        }
        dataset_entries.append(entry)

        if remaining_quota is not None:
            remaining_quota -= 1
            if remaining_quota == 0:
                print(f"Reached requested maximum of {max_entries} entries.")
                break

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

def create_dataset(dataset_entries: List[Dict], output_path: Path, scenario_name: str, pddl_version: str):
    """创建HuggingFace数据集"""
    if not dataset_entries:
        print("No valid dataset entries found!")
        return

    output_dir = output_path.parent
    output_dir.mkdir(parents=True, exist_ok=True)

    dataset = Dataset.from_list(dataset_entries)
    dataset.save_to_disk(str(output_path))

    print(f"Dataset saved to {output_path}")
    print(f"Total entries: {len(dataset)}")

    # 根据pddl标准设置full_json_path的文件名
    suffix = (pddl_version or "").lower()
    if suffix:
        full_json_path = output_dir / f"{suffix}_dataset.json"
    else:
        full_json_path = output_dir / f"{scenario_name}_dataset.json"

    try:
        with open(full_json_path, 'w', encoding='utf-8') as f:
            json.dump(dataset_entries, f, ensure_ascii=False, indent=2)
        print(f"Full dataset JSON saved to {full_json_path}")
    except Exception as e:
        print(f"Error saving full dataset JSON: {e}")

    stats = {
        "total_entries": len(dataset_entries),
        "scenario": scenario_name,
        "scenario_count": len(dataset_entries),
        "pddl": (pddl_version or "").upper(),
    }
    # 根据pddl标准设置统计文件名
    suffix = (pddl_version or "").lower()
    if suffix:
        stats_json_path = output_dir / f"{suffix}_dataset_stats.json"
    else:
        stats_json_path = output_dir / f"{scenario_name}_dataset_stats.json"
    with open(stats_json_path, 'w') as f:
        json.dump(stats, f, indent=2)
    print(f"Statistics saved to {stats_json_path}")

def main():
    """主函数"""
    parser = argparse.ArgumentParser(description="Collect PDDL dataset for a single scenario")
    parser.add_argument("scenario", help="Scenario name (e.g., blocksworld, delivery, logistics)")
    parser.add_argument("--root", default=None, help="Root directory for the scenario (default: ./<scenario>)")
    parser.add_argument("--output", default=None, help="Output path for the dataset (default: data/sft/<scenario>/pddl{2,3}.hf)")
    parser.add_argument(
        "--pddl",
        type=lambda s: s.upper(),
        choices=["PDDL2", "PDDL3"],
        default="PDDL3",
        help=(
            "PDDL standard to use. PDDL2: use domain.pddl + all_problems/training; "
            "PDDL3: use domain3.pddl + all_problems3/training"
        ),
    )
    parser.add_argument(
        "--max_number",
        type=int,
        default=None,
        help="Maximum number of problem/solution pairs to collect (default: use all available)",
    )

    args = parser.parse_args()
    
    # 确定根目录
    if args.root:
        root_dir = Path(args.root)
    else:
        root_dir = Path("scenarios") / args.scenario
    
    # 确定输出路径
    if args.output:
        output_path = Path(args.output)
    else:
        base_dir = Path("data/sft") / args.scenario
        base_dir.mkdir(parents=True, exist_ok=True)
        suffix = "pddl2" if args.pddl.upper() == "PDDL2" else "pddl3"
        output_path = base_dir / f"{suffix}.hf"
    
    if args.max_number is not None and args.max_number <= 0:
        print("Error: --max_number must be a positive integer.")
        return

    print("="*60)
    print(f"PDDL Dataset Collection for {args.scenario}")
    print("="*60)
    print(f"Root directory: {root_dir}")
    print(f"Output path: {output_path}")
    print(f"PDDL: {args.pddl}")
    if args.max_number is not None:
        print(f"Max entries: {args.max_number}")
    else:
        print("Max entries: ALL")
    print("="*60)

    if not root_dir.exists():
        print(f"Error: Root directory {root_dir} does not exist!")
        return

    # 收集数据
    entries = collect_scenario_data(args.scenario, root_dir, args.pddl, args.max_number)
    print(f"\nTotal collected entries: {len(entries)}")
    
    if not entries:
        print("No data collected! Please check the directory structure.")
        return

    print("\nFiltering valid solutions...")
    valid_entries = filter_valid_solutions(entries)
    print(f"Valid entries: {len(valid_entries)}")
    if not valid_entries:
        print("No valid solutions found after filtering; aborting dataset creation.")
        return
    else:
        sample = valid_entries[0]
        print(f"Example valid entry: {sample['problem_name']}")

    print("\nCreating dataset...")
    create_dataset(valid_entries, output_path, args.scenario, args.pddl)

    print(f"\nDataset collection for {args.scenario} completed!")

if __name__ == "__main__":
    main()