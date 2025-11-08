#!/usr/bin/env python3
"""
收集PDDL数据集用于fine-tune
从每个场景的 all_problems3/all_problems 的 training 子目录收集数据
支持通过 --max-number 限制每个场景采样的 problem/solution 对数量
"""

import json
import argparse
import subprocess
from pathlib import Path
from typing import List, Dict, Tuple, Optional, Set
from datasets import Dataset

PROJECT_ROOT = Path(__file__).resolve().parents[1]
SCENARIO_SEARCH_ROOTS = [
    PROJECT_ROOT / "scenarios",
    PROJECT_ROOT,
]

def resolve_scenario_root(scenario_name: str) -> Optional[Path]:
    """查找场景根目录，兼容旧的 scenarios/<name> 与新的仓库根目录结构。"""
    for base_dir in SCENARIO_SEARCH_ROOTS:
        candidate = base_dir / scenario_name
        if candidate.exists():
            return candidate
    return None

def normalize_pddl_selection(pddl_args: Optional[List[str]]) -> Set[str]:
    """标准化 PDDL 版本参数，默认为同时包含 PDDL2 和 PDDL3。"""
    if not pddl_args:
        return {"PDDL2", "PDDL3"}
    return {arg.upper() for arg in pddl_args}

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

def resolve_domain_file(root: Path, pddl_version: str) -> Optional[Path]:
    """根据 PDDL 版本推断 domain 文件位置。"""
    candidates: List[Path] = []
    version = (pddl_version or "").upper()
    if version == "PDDL3":
        candidates.extend([
            root / "domain3.pddl",
            root / "domain.pddl",
            root / "training_problems3" / "domain3.pddl",
            root / "training_problems3" / "domain.pddl",
            root / "all_problems3" / "domain3.pddl",
        ])
    else:
        candidates.extend([
            root / "domain.pddl",
            root / "training_problems" / "domain.pddl",
            root / "all_problems" / "domain.pddl",
        ])

    for candidate in candidates:
        if candidate.exists():
            return candidate
    return None

def validate_solution(domain_file: str, problem_file: str, solution_file: str, timeout_sec: int = 30) -> Tuple[bool, str, Dict]:
    """Run Validate to check if solution is valid for the problem and domain."""
    execution_info = {
        "stdout": "",
        "stderr": "",
        "returncode": None,
        "timeout": False,
        "exception": None
    }

    try:
        cmd = f"Validate {domain_file} {problem_file} {solution_file}"
        execution_info["command"] = cmd
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=timeout_sec)

        execution_info["returncode"] = result.returncode
        execution_info["stdout"] = result.stdout if result.stdout else ""
        execution_info["stderr"] = result.stderr if result.stderr else ""

        if result.returncode == 0:
            output = result.stdout.lower()
            if "plan valid\n" in output or "successful plans" in output:
                return True, "Plan valid", execution_info
            return False, (result.stdout if result.stdout else "Validation failed"), execution_info
        return False, (result.stderr if result.stderr else "Validation error"), execution_info
    except subprocess.TimeoutExpired:
        execution_info["timeout"] = True
        return False, "Validation timeout", execution_info
    except Exception as e:
        execution_info["exception"] = str(e)
        return False, f"Validation exception: {e}", execution_info

def build_prompt(domain_content: str, problem_content: str, pddl_version: str) -> str:
    """读取统一的 prompt 模板。"""
    prompt_file = Path('prompt.txt')
    if prompt_file.exists():
        with open(prompt_file, 'r', encoding='utf-8') as f:
            prompt_text = f.read()
    else:
        print("Warning: Prompt template prompt.txt not found, using fallback template.")
        prompt_text = "{domain_content}\n\n{problem_content}"

    return prompt_text.format(domain_content=domain_content, problem_content=problem_content)

def _iter_problem_directories(root_dir: Path, allowed_versions: Set[str]) -> List[Tuple[str, Path]]:
    """返回按优先级排序的问题目录列表，仅限 all_problems*/training。"""
    candidates: List[Tuple[str, Path]] = [
        ("PDDL3", root_dir / "all_problems3" / "training"),
        ("PDDL2", root_dir / "all_problems" / "training"),
    ]
    result: List[Tuple[str, Path]] = []
    for version, path in candidates:
        if version in allowed_versions and path.exists():
            result.append((version, path))
    return result

def collect_scenario_data(
    scenario_name: str,
    root_dir: Path,
    allowed_versions: Set[str],
    max_entries: Optional[int] = None,
) -> List[Dict]:
    """收集单个场景中的 problem/solution 对，来源限定为 all_problems*/training。"""
    print(f"Collecting data from {scenario_name}...")

    problem_dirs = _iter_problem_directories(root_dir, allowed_versions)
    if not problem_dirs:
        print(f"Problems directory not found under {root_dir}")
        return []

    dataset_entries: List[Dict] = []
    remaining_quota: Optional[int] = max_entries

    for version, problems_dir in problem_dirs:
        if remaining_quota is not None and remaining_quota <= 0:
            break

        domain_file = resolve_domain_file(root_dir, version)
        if domain_file is None or not domain_file.exists():
            print(f"Domain file not found for {scenario_name} ({version}): {domain_file}")
            continue

        domain_content = read_pddl_file(domain_file)
        if not domain_content:
            continue

        problem_files = sorted([
            p for p in problems_dir.glob("*.pddl")
            if p.name.lower() not in {"domain.pddl", "domain3.pddl"}
        ])
        print(f"  [{version}] Found {len(problem_files)} problem files in {problems_dir}")

        for problem_file in problem_files:
            if remaining_quota is not None and remaining_quota <= 0:
                break

            solution_file = problem_file.with_suffix('.soln')
            if not solution_file.exists():
                continue

            problem_content = read_pddl_file(problem_file)
            solution_content = read_pddl_file(solution_file)
            if not problem_content or not solution_content:
                continue

            problem_name = extract_problem_name(problem_file)

            if not validate_solution_format(solution_content):
                print(f"Invalid solution format for {problem_name}")
                continue

            is_valid_plan, message, execution_info = validate_solution(
                str(domain_file),
                str(problem_file),
                str(solution_file),
            )

            if not is_valid_plan:
                print(f"Validation failed for {problem_name}: {message}")
                stderr_output = execution_info.get("stderr") or ""
                if stderr_output:
                    print(f"  Validate stderr: {stderr_output.strip()}")
                continue

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

            if remaining_quota is not None:
                remaining_quota -= 1
                if remaining_quota == 0:
                    print(f"  Reached requested maximum of {max_entries} valid entries for {scenario_name}.")
                    break

    print(f"Collected {len(dataset_entries)} valid entries from {scenario_name}")
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

def create_dataset(
    dataset_entries: List[Dict],
    output_path: str = "data/sft/multi_scenarios/base.hf",
    max_entries: Optional[int] = None,
):
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
    pddl_counts: Dict[str, int] = {}
    for entry in dataset_entries:
        scenario = entry["scenario"]
        scenario_counts[scenario] = scenario_counts.get(scenario, 0) + 1
        version = entry.get("pddl", "UNKNOWN")
        pddl_counts[version] = pddl_counts.get(version, 0) + 1

    print("\nDataset statistics:")
    for scenario, count in scenario_counts.items():
        print(f"  {scenario}: {count} entries")
    print("PDDL distribution:")
    for version, count in pddl_counts.items():
        print(f"  {version}: {count} entries")

    stats = {
        "total_entries": len(dataset_entries),
        "scenario_counts": scenario_counts,
        "scenarios": list(scenario_counts.keys()),
        "pddl_counts": pddl_counts,
        "output_path": output_path
    }
    if max_entries is not None:
        stats["max_number_per_scenario"] = max_entries
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
        default="data/sft/multi_scenarios/base.hf",
        help="输出数据集路径 (默认: data/sft/multi_scenarios/base.hf)"
    )
    parser.add_argument(
        "--max-number",
        type=int,
        default=None,
        help="限制每个场景采样的 problem/solution 对数量（默认：使用全部）"
    )
    parser.add_argument(
        "--pddl",
        nargs="+",
        choices=["PDDL2", "PDDL3", "pddl2", "pddl3"],
        default=None,
        help="指定需要收集的 PDDL 版本，可同时传入多个值 (默认: 同时收集 PDDL2 和 PDDL3)。"
    )
    
    parser.add_argument(
        "--list-scenarios", 
        action="store_true",
        help="列出所有可用的场景"
    )
    
    return parser.parse_args()

def get_available_scenarios(allowed_versions: Set[str]):
    """获取所有可用的场景（通过扫描scenarios目录）"""
    available_scenarios = set()

    for base_dir in SCENARIO_SEARCH_ROOTS:
        if not base_dir.exists():
            continue
        for scenario_dir in base_dir.iterdir():
            if not scenario_dir.is_dir():
                continue
            if scenario_dir.name.startswith('.'):
                continue
            if _iter_problem_directories(scenario_dir, allowed_versions):
                available_scenarios.add(scenario_dir.name)

    return sorted(available_scenarios)

def validate_scenarios(scenario_names: List[str], allowed_versions: Set[str]) -> List[str]:
    """验证场景名称是否有效"""
    available_scenarios = get_available_scenarios(allowed_versions)
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
    allowed_versions = normalize_pddl_selection(args.pddl)

    if args.max_number is not None and args.max_number <= 0:
        print("Error: --max-number must be a positive integer.")
        return
    
    # 如果只是列出场景，则显示并退出
    if args.list_scenarios:
        print("可用的场景:")
        for i, scenario in enumerate(get_available_scenarios(allowed_versions), 1):
            print(f"  {i}. {scenario}")
        return
    
    # 确定要使用的场景
    if args.scenarios:
        scenarios_to_use = validate_scenarios(args.scenarios, allowed_versions)
        if not scenarios_to_use:
            print("没有有效的场景，退出")
            return
    else:
        scenarios_to_use = get_available_scenarios(allowed_versions)
    
    print("="*60)
    print("PDDL Dataset Collection for Fine-tuning")
    print(f"场景数量: {len(scenarios_to_use)}")
    print(f"场景列表: {', '.join(scenarios_to_use)}")
    print(f"输出路径: {args.output}")
    if args.max_number is not None:
        print(f"每个场景最大采样数: {args.max_number}")
    print("="*60)

    all_entries: List[Dict] = []
    for scenario_name in scenarios_to_use:
        root = resolve_scenario_root(scenario_name)
        if root is None:
            print(f"Root directory not found for scenario {scenario_name}")
            continue
        entries = collect_scenario_data(
            scenario_name,
            root,
            allowed_versions,
            max_entries=args.max_number,
        )
        all_entries.extend(entries)

    print(f"\nTotal collected valid entries: {len(all_entries)}")
    if not all_entries:
        print("No data collected! Please check the directory structure.")
        return

    print("\nCreating dataset...")
    create_dataset(all_entries, args.output, args.max_number)

    print("\nDataset collection completed!")

if __name__ == "__main__":
    main()
