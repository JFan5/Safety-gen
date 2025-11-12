#!/usr/bin/env python3
"""
收集单个PDDL场景的数据集用于fine-tune
从指定场景的 training_problems3 目录中收集 problem/solution 对
"""

import os
import json
import argparse
import random
import sys
from pathlib import Path
from typing import List, Dict, Optional
from datasets import Dataset

# 尝试导入 prompt_variants，支持从不同位置运行
try:
    from prompt_variants import build_prompt_multi
except ImportError:
    try:
        from script.prompt_variants import build_prompt_multi
    except ImportError:
        # 如果都失败，尝试添加 script 目录到路径
        script_dir = Path(__file__).parent
        if str(script_dir) not in sys.path:
            sys.path.insert(0, str(script_dir))
        from prompt_variants import build_prompt_multi

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
    num_prompt_variants: Optional[int] = None,
    seed: Optional[int] = None,
) -> List[Dict]:
    """收集单个场景中的 problem/solution 对，问题目录由 PDDL 版本决定。

    - PDDL2: <root>/all_problems/training
    - PDDL3: <root>/all_problems3/training
    
    Args:
        scenario_name: 场景名称
        root_dir: 场景根目录
        pddl_version: PDDL 版本 (PDDL2 或 PDDL3)
        max_entries: 最大 problem 数量（None 表示使用所有）
        num_prompt_variants: 每个 problem 生成的 prompt 变体数量（None 或 1 表示使用单个 prompt）
        seed: 随机数种子（用于可复现性）
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

    # 设置随机数生成器
    rng = random.Random(seed) if seed is not None else random.Random()
    
    # 确定是否使用多 prompt 变体
    use_variants = num_prompt_variants is not None and num_prompt_variants > 1
    if use_variants:
        print(f"Using {num_prompt_variants} prompt variants per problem")
    else:
        print("Using single prompt per problem")

    dataset_entries: List[Dict] = []

    # 遍历 training_problems3 下的所有 .pddl（排除 domain.pddl 与 domain3.pddl），配对同目录下同名 .soln
    problem_files = sorted([p for p in problems_dir.glob("*.pddl") if p.name.lower() not in {"domain.pddl", "domain3.pddl"}])
    print(f"Found {len(problem_files)} problem files in {problems_dir}")
    
    # max_entries 现在表示最大 problem 数量，而不是总 entry 数量
    remaining_problem_quota = max_entries

    for problem_file in problem_files:
        if remaining_problem_quota is not None and remaining_problem_quota <= 0:
            break

        solution_file = problem_file.with_suffix('.soln')
        if not solution_file.exists():
            # 跳过没有对应解的文件
            continue

        problem_content = read_pddl_file(problem_file)
        solution_content = read_pddl_file(solution_file)
        if not problem_content or not solution_content:
            continue

        problem_name = extract_problem_name(problem_file)
        
        if use_variants:
            # 为每个 problem 生成多个 prompt 变体
            # 随机选择 num_prompt_variants 个不同的变体（如果可能）
            num_templates = 10  # prompt_variants.py 中有 10 个模板
            if num_prompt_variants >= num_templates:
                # 如果需要的变体数 >= 模板数，使用所有模板，然后随机重复
                variants_to_use = list(range(1, num_templates + 1))
                while len(variants_to_use) < num_prompt_variants:
                    variants_to_use.append(rng.randint(1, num_templates))
                rng.shuffle(variants_to_use)
            else:
                # 随机选择 num_prompt_variants 个不同的变体
                variants_to_use = rng.sample(range(1, num_templates + 1), num_prompt_variants)
            
            # 为每个变体创建一个 entry
            for variant_idx, variant_num in enumerate(variants_to_use):
                prompt = build_prompt_multi(
                    domain_content, 
                    problem_content, 
                    version, 
                    variant=variant_num,
                    rng=rng
                )
                
                entry = {
                    "prompt": prompt,
                    "path": solution_content,
                    "scenario": scenario_name,
                    "pddl": version,
                    "problem_name": problem_name,
                    "solution_file": str(solution_file),
                    "problem_file": str(problem_file),
                    "domain_file": str(domain_file),
                    "prompt_variant": variant_num,
                    "variant_index": variant_idx,
                }
                dataset_entries.append(entry)
        else:
            # 使用原来的单个 prompt 逻辑
            prompt = build_prompt(domain_content, problem_content, version)

            entry = {
                "prompt": prompt,
                "path": solution_content,
                "scenario": scenario_name,
                "pddl": version,
                "problem_name": problem_name,
                "solution_file": str(solution_file),
                "problem_file": str(problem_file),
                "domain_file": str(domain_file),
            }
            dataset_entries.append(entry)

        if remaining_problem_quota is not None:
            remaining_problem_quota -= 1
            if remaining_problem_quota == 0:
                print(f"Reached requested maximum of {max_entries} problems.")
                break

    print(f"Collected {len(dataset_entries)} entries from {scenario_name} ({len(set(e['problem_name'] for e in dataset_entries))} unique problems)")
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
    """创建HuggingFace数据集
    
    Args:
        dataset_entries: 数据集条目列表
        output_path: 输出文件路径（.hf 文件）
        scenario_name: 场景名称
        pddl_version: PDDL 版本
        
    注意：Full dataset JSON 和 Statistics JSON 文件将保存在与 output_path 相同的目录中。
    """
    if not dataset_entries:
        print("No valid dataset entries found!")
        return

    # 确保输出目录存在（与 output_path 相同的目录）
    output_dir = output_path.parent
    output_dir.mkdir(parents=True, exist_ok=True)

    dataset = Dataset.from_list(dataset_entries)
    dataset.save_to_disk(str(output_path))

    print(f"Dataset saved to {output_path}")
    print(f"Total entries: {len(dataset)}")

    # Full dataset JSON 保存在与 output_path 相同的目录
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

    # Statistics JSON 保存在与 output_path 相同的目录
    stats = {
        "total_entries": len(dataset_entries),
        "scenario": scenario_name,
        "scenario_count": len(dataset_entries),
        "pddl": (pddl_version or "").upper(),
    }
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
        help="Maximum number of problems to collect (default: use all available). Note: if --prompt_variants > 1, total entries will be max_number * prompt_variants",
    )
    parser.add_argument(
        "--prompt_variants",
        type=int,
        default=None,
        help="Number of prompt variants to generate per problem (default: 1, uses single prompt). If set to 5, each problem will generate 5 entries with different prompt templates.",
    )
    parser.add_argument(
        "--seed",
        type=int,
        default=None,
        help="Random seed for prompt variant selection (for reproducibility)",
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
        # 如果指定的是目录，则在该目录下创建默认文件名
        if output_path.is_dir() or (not output_path.suffix and not output_path.exists()):
            suffix = "pddl2" if args.pddl.upper() == "PDDL2" else "pddl3"
            output_path = output_path / f"{suffix}.hf"
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
        print(f"Max problems: {args.max_number}")
    else:
        print("Max problems: ALL")
    if args.prompt_variants is not None and args.prompt_variants > 1:
        print(f"Prompt variants per problem: {args.prompt_variants}")
        if args.max_number is not None:
            estimated_entries = args.max_number * args.prompt_variants
            print(f"Estimated total entries: {estimated_entries}")
    else:
        print("Prompt variants per problem: 1 (single prompt)")
    if args.seed is not None:
        print(f"Random seed: {args.seed}")
    print("="*60)

    if not root_dir.exists():
        print(f"Error: Root directory {root_dir} does not exist!")
        return

    # 收集数据
    entries = collect_scenario_data(
        args.scenario, 
        root_dir, 
        args.pddl, 
        args.max_number,
        num_prompt_variants=args.prompt_variants,
        seed=args.seed
    )
    print(f"\nTotal collected entries: {len(entries)}")
    unique_problems = len(set(e['problem_name'] for e in entries))
    print(f"Unique problems: {unique_problems}")
    if args.prompt_variants and args.prompt_variants > 1:
        avg_variants = len(entries) / unique_problems if unique_problems > 0 else 0
        print(f"Average variants per problem: {avg_variants:.2f}")
    
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