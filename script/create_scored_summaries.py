#!/usr/bin/env python3
"""
Combine classical planner solutions with scored LLM candidates to build
`scored_summaries.json` payloads consumed by construct_dpo_dataset.py.
"""

from __future__ import annotations

import argparse
import json
import os
import subprocess
import tempfile
from collections import defaultdict
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Tuple

from utils import (
    classify_result,
)
def _load_unsloth_candidates(path: Path, scenario: str) -> Dict[str, List[dict]]:
    """Group UnsLoTH scored JSONL entries by <scenario>/<problem_name>."""
    grouped: Dict[str, List[dict]] = defaultdict(list)
    if not path.exists():
        print(f"Warning: UnsLoTH JSONL file does not exist: {path}")
        return grouped

    candidates_loaded = 0
    
    with path.open("r", encoding="utf-8") as handle:
        for line in handle:
            line = line.strip()
            if not line:
                continue
            try:
                payload = json.loads(line)
            except json.JSONDecodeError as e:
                print(f"Warning: Failed to parse JSON line: {e}")
                continue
            
            # Skip GRPO pairs format (has 'chosen' and 'rejected')
            if "chosen" in payload and "rejected" in payload:
                print(f"Warning: Skipping GRPO pairs format entry. Expected candidates format with 'problem_name' and 'candidate' fields.")
                continue
            
            # Candidates format: standard UnsLoTH output
            problem_name = payload.get("problem_name") or Path(
                payload.get("problem_file", "")
            ).stem
            if not problem_name:
                print(f"Warning: No problem_name found in entry. Keys: {list(payload.keys())}")
                continue
            key = f"{scenario}/{problem_name}"
            candidate_text = payload.get("candidate") or ""
            seq = [step.strip() for step in candidate_text.splitlines() if step.strip()]
            if not seq:
                print(f"Warning: Empty planning sequence for {problem_name}, skipping")
                continue
            score_val = payload.get("score")
            try:
                score = int(score_val)
            except Exception:
                score = 0
            # Map 0-5 style scores to a 0-100 scale without reaching 100.
            scaled_score = max(0, min(score, 9)) * 20
            entry = {
                "score": scaled_score,
                "classification": payload.get("tag") or payload.get("classification"),
                "planning_sequence": seq,
                "source_file": payload.get("model") or "unsloth",
                "solution_file": payload.get("solution_file") or "",
                "problem_file": payload.get("problem_file") or "",
                "domain_file": payload.get("domain_file") or "",
                "raw_score": score_val,
                "candidate_family": payload.get("family"),
            }
            grouped[key].append(entry)
            candidates_loaded += 1
    
    if candidates_loaded > 0:
        print(f"Loaded {candidates_loaded} candidates from {path}")
        print(f"Grouped into {len(grouped)} problems")
    else:
        print(f"Warning: No candidates loaded from {path}. Please ensure the file contains candidates with 'problem_name' and 'candidate' fields.")
    
    return grouped


def _iter_solutions(problem_dir: Path) -> Iterable[Path]:
    for problem_path in sorted(problem_dir.glob("*.pddl")):
        sol_path = problem_path.with_suffix(".soln")
        if sol_path.exists():
            yield problem_path


def validate_solution(domain_file: str, problem_file: str, solution_text: str):
    """使用 VAL 验证解决方案"""
    with tempfile.NamedTemporaryFile(mode='w', suffix='.soln', delete=False) as f:
        f.write(solution_text)
        solution_file = f.name
    try:
        cmd = f"~/VAL/build/bin/Validate  -v {domain_file} {problem_file} {solution_file}"
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=30)
        if result.returncode == 0:
            out = result.stdout.lower()
            if ("plan valid\n" in out) or ("successful plans" in out):
                return True, "Plan valid", result.stdout, result.stderr, cmd
            else:
                return False, f"Validation failed: {result.stdout[:500]}", result.stdout, result.stderr, cmd
        else:
            return False, f"Validation error: {result.stderr[:500]}", result.stdout, result.stderr, cmd
    except subprocess.TimeoutExpired:
        return False, "Validation timeout", "", "Validation timeout after 30 seconds", cmd
    except Exception as e:
        return False, f"Validation exception: {str(e)}", "", str(e), cmd
    finally:
        try:
            os.unlink(solution_file)
        except:
            pass




SCORE_MAP = {
    "plan_format_error": 1,
    "precondition_violation": 2,
    "safety_constraints_violation": 3,
    "goal_not_satisfied": 4,
    "success_plans": 5,
    "others": 1,  # 未知归 1 档，保守处理
}


def _load_and_validate_pddl2_solutions(
    pddl2_solution_dir: Path, 
    domain_file: Path, 
    scenario: str,
    problem_dir: Path,
    existing_grouped: Optional[Dict[str, List[dict]]] = None,
) -> Dict[str, List[dict]]:
    """
    从 PDDL2 solution 目录加载 .soln 文件，使用这些 solution 去验证 problem_dir 中的同名问题。
    如果验证未通过（不是 5 分），证明 PDDL2 的解无法求解该问题，添加到 scored_summaries 中。
    跳过验证通过的（5分），也跳过已经在 existing_grouped 中存在的相同 score。
    返回按 problem_name 分组的验证过的解决方案。
    """
    grouped: Dict[str, List[dict]] = defaultdict(list)
    if not pddl2_solution_dir.exists():
        return grouped
    
    if not problem_dir.exists():
        print(f"Warning: problem_dir does not exist: {problem_dir}")
        return grouped
    
    if existing_grouped is None:
        existing_grouped = {}
    
    # 遍历 PDDL2 solution 目录中的所有 .pddl 文件
    for pddl2_problem_path in sorted(pddl2_solution_dir.glob("*.pddl")):
        # 跳过 domain 文件
        if "domain" in pddl2_problem_path.name.lower():
            continue
        
        # 查找对应的 .soln 文件
        sol_path = pddl2_problem_path.with_suffix(".soln")
        if not sol_path.exists():
            continue
        
        # 在 problem_dir 中查找同名问题
        problem_name = pddl2_problem_path.stem
        problem_path = problem_dir / f"{problem_name}.pddl"
        if not problem_path.exists():
            # 如果 problem_dir 中没有同名问题，跳过
            continue
        
        # 读取解决方案内容
        try:
            solution_text = sol_path.read_text(encoding="utf-8")
        except Exception as e:
            print(f"Warning: Failed to read {sol_path}: {e}")
            continue
        
        # 使用 PDDL2 的 solution 去验证 problem_dir 中的问题
        # domain_file 应该是 PDDL3 的 domain（用于验证）
        is_valid, msg, stdout, stderr, cmd = validate_solution(
            str(domain_file), str(problem_path), solution_text
        )
        
        # 分类验证结果
        classification = classify_result(stdout)
        
        # 获取分数（1-5，然后映射到 0-100）
        raw_score = SCORE_MAP.get(classification, 1)
        
        # 如果验证通过（5 分，success_plans），跳过
        # 因为 PDDL2 的解能解决这个问题，不需要添加到 scored_summaries
        if raw_score == 5:
            print("stdout: ", stdout)
            print("stderr: ", stderr)
            print("cmd: ", cmd)
            print(f"Skipping validated solution (score 5): {problem_name} - PDDL2 solution can solve this problem")
            continue
        
        # Map 1-4 to 0-100 scale: 1->20, 2->40, 3->60, 4->80
        # 验证未通过，说明 PDDL2 的解无法求解该问题，需要添加到 scored_summaries
        scaled_score = raw_score * 20
        
        # 检查是否已经在 existing_grouped 中存在相同的 score
        key = f"{scenario}/{problem_name}"
        if key in existing_grouped:
            # 检查是否已有相同 score 的条目
            existing_scores = {entry.get("score", 0) for entry in existing_grouped[key]}
            if scaled_score in existing_scores:
                print(f"Skipping {problem_name}: score {scaled_score} already exists in scored_summaries")
                continue
        
        # 解析计划序列
        plan_lines = [
            line.strip()
            for line in solution_text.splitlines()
            if line.strip()
        ]
        
        # 创建条目
        entry = {
            "score": scaled_score,
            "classification": classification,
            "planning_sequence": plan_lines,
            "source_file": "pddl2_solution_validated",
            "solution_file": str(sol_path),
            "problem_file": str(problem_path),  # 使用 problem_dir 中的问题文件
            "domain_file": str(domain_file),
            "raw_score": raw_score,
            "validation_message": msg,
        }
        grouped[key].append(entry)
        print(f"Added PDDL2 solution for {problem_name} (score {scaled_score}) - cannot solve problem in problem_dir")
    
    return grouped


def _build_classical_entry(
    problem_path: Path, domain_path: Path, scenario: str
) -> Tuple[str, dict]:
    key = f"{scenario}/{problem_path.stem}"
    sol_path = problem_path.with_suffix(".soln")
    plan_lines = [
        line.strip()
        for line in sol_path.read_text(encoding="utf-8").splitlines()
        if line.strip()
    ]
    entry = {
        "score": 100,
        "classification": "success_plans",
        "planning_sequence": plan_lines,
        "source_file": "classical_planner",
        "solution_file": str(sol_path),
        "problem_file": str(problem_path),
        "domain_file": str(domain_path),
    }
    return key, entry


def build_payload(
    scenario: str,
    variant: str,
    unsloth_jsonl: Path,
    problem_dir: Path,
    domain_file: Path,
    pddl2_solution_dir: Optional[Path] = None,
) -> dict:
    grouped = _load_unsloth_candidates(unsloth_jsonl, scenario)

    # Add classical planner solutions from problem_dir
    for problem_path in _iter_solutions(problem_dir):
        key, entry = _build_classical_entry(problem_path, domain_file, scenario)
        grouped[key].append(entry)
    
    # Add validated PDDL2 solutions that fail to solve problems in problem_dir
    # Use PDDL2 solutions to validate problems in problem_dir
    # If validation fails (not score 5), it means PDDL2 solution cannot solve the problem,
    # so add it to scored_summaries for GRPO to create solutions
    if pddl2_solution_dir is not None:
        validated_solutions = _load_and_validate_pddl2_solutions(
            pddl2_solution_dir, 
            domain_file, 
            scenario,
            problem_dir=problem_dir,  # 使用 problem_dir 中的问题
            existing_grouped=grouped,  # 传入已有的 grouped 以检查重复
        )
        for key, entries in validated_solutions.items():
            grouped[key].extend(entries)

    # Convert defaultdict to plain dict of lists sorted by score (desc so 100 first)
    data = {
        key: sorted(entries, key=lambda e: int(e.get("score", 0)), reverse=True)
        for key, entries in grouped.items()
        if entries
    }

    payload = {
        "scenario": scenario,
        "variant": variant,
        "unsloth_jsonl": str(unsloth_jsonl),
        "problem_dir": str(problem_dir),
        "domain_file": str(domain_file),
        "pddl2_solution_dir": str(pddl2_solution_dir) if pddl2_solution_dir else None,
        "data": data,
    }
    return payload


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Create scored_summaries.json from classical planner solutions and "
            "UnsLoTH scored JSONL"
        )
    )
    parser.add_argument("--scenario", required=True, help="Scenario name, e.g. blocksworld")
    parser.add_argument(
        "--variant",
        required=True,
        choices=["pddl2", "pddl3"],
        help="Planning variant for bookkeeping",
    )
    parser.add_argument(
        "--unsloth-jsonl",
        required=True,
        type=Path,
        help="Path to UnsLoTH scored.jsonl (reject candidates)",
    )
    parser.add_argument(
        "--problem-dir",
        required=True,
        type=Path,
        help="Directory holding problem .pddl and matching .soln files",
    )
    parser.add_argument(
        "--domain-file",
        required=True,
        type=Path,
        help="Domain file used by the classical planner",
    )
    parser.add_argument(
        "--pddl2-solution-dir",
        type=Path,
        default=None,
        help="Optional: Directory containing PDDL2 .pddl and .soln files (will be validated in PDDL3 environment, perfect solutions are skipped)",
    )
    parser.add_argument(
        "--output",
        required=True,
        type=Path,
        help="Output scored_summaries.json path",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()

    payload = build_payload(
        scenario=args.scenario,
        variant=args.variant,
        unsloth_jsonl=args.unsloth_jsonl,
        problem_dir=args.problem_dir,
        domain_file=args.domain_file,
        pddl2_solution_dir=args.pddl2_solution_dir,
    )

    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("w", encoding="utf-8") as handle:
        json.dump(payload, handle, ensure_ascii=False, indent=2)


if __name__ == "__main__":
    main()
