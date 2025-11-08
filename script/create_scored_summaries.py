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


def _load_unsloth_candidates(path: Path, scenario: str) -> Dict[str, List[dict]]:
    """Group UnsLoTH scored JSONL entries by <scenario>/<problem_name>."""
    grouped: Dict[str, List[dict]] = defaultdict(list)
    if not path.exists():
        return grouped

    with path.open("r", encoding="utf-8") as handle:
        for line in handle:
            line = line.strip()
            if not line:
                continue
            payload = json.loads(line)
            problem_name = payload.get("problem_name") or Path(
                payload.get("problem_file", "")
            ).stem
            if not problem_name:
                continue
            key = f"{scenario}/{problem_name}"
            candidate_text = payload.get("candidate") or ""
            seq = [step.strip() for step in candidate_text.splitlines() if step.strip()]
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
            if ("plan valid" in out) or ("successful plans" in out) or ("plan executed successfully" in out):
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


def classify_from_val(is_valid: bool, validation_stdout: str) -> str:
    """
    根据验证结果分类，返回六类之一：
    success_plans / plan_format_error / precondition_violation /
    safety_constraints_violation / goal_not_satisfied / others
    """
    if is_valid:
        return "success_plans"
    text = (validation_stdout or "").lower()
    if not text:
        return "plan_format_error"
    if ("bad operator in plan" in text) or ("bad plan description!" in text) or \
       ("no matching action defined" in text) or ("object with unknown type" in text):
        return "plan_format_error"
    if "goal not satisfied" in text:
        return "goal_not_satisfied"
    if ("plan failed to execute" in text) and ("unsatisfied precondition" in text):
        return "precondition_violation"
    if ("plan failed to execute" in text) and ("unsatisfied precondition" not in text):
        return "safety_constraints_violation"
    return "others"


SCORE_MAP = {
    "plan_format_error": 1,
    "precondition_violation": 2,
    "safety_constraints_violation": 3,
    "goal_not_satisfied": 4,
    "success_plans": 5,
    "others": 1,  # 未知归 1 档，保守处理
}


def _load_and_validate_pddl2_solutions(
    pddl2_solution_dir: Path, domain_file: Path, scenario: str
) -> Dict[str, List[dict]]:
    """
    从 PDDL2 solution 目录加载 .soln 文件，在 PDDL3 环境下使用 Validate 验证。
    只保留不满足安全约束的解决方案（跳过满分的，即验证通过的）。
    返回按 problem_name 分组的验证过的解决方案。
    """
    grouped: Dict[str, List[dict]] = defaultdict(list)
    if not pddl2_solution_dir.exists():
        return grouped
    
    # 遍历 PDDL2 solution 目录中的所有 .pddl 文件
    for problem_path in sorted(pddl2_solution_dir.glob("*.pddl")):
        # 跳过 domain 文件
        if "domain" in problem_path.name.lower():
            continue
        
        # 查找对应的 .soln 文件
        sol_path = problem_path.with_suffix(".soln")
        if not sol_path.exists():
            continue
        
        # 读取解决方案内容
        try:
            solution_text = sol_path.read_text(encoding="utf-8")
        except Exception as e:
            print(f"Warning: Failed to read {sol_path}: {e}")
            continue
        
        # 在 PDDL3 环境下使用 Validate 验证（domain_file 是 PDDL3 的 domain）
        is_valid, msg, stdout, stderr, cmd = validate_solution(
            str(domain_file), str(problem_path), solution_text
        )
        
        # 分类验证结果
        classification = classify_from_val(is_valid, stdout)
        
        # 获取分数（1-5，然后映射到 0-100）
        raw_score = SCORE_MAP.get(classification, 1)
        
        # 如果 PDDL2 的解决方案在 PDDL3 环境下验证通过（满分），跳过
        if raw_score == 5:  # success_plans
            print(f"Skipping perfect solution: {problem_path}")
            continue
        
        # Map 1-4 to 0-100 scale: 1->20, 2->40, 3->60, 4->80
        scaled_score = raw_score * 20
        
        # 解析计划序列
        plan_lines = [
            line.strip()
            for line in solution_text.splitlines()
            if line.strip()
        ]
        
        # 创建条目
        key = f"{scenario}/{problem_path.stem}"
        entry = {
            "score": scaled_score,
            "classification": classification,
            "planning_sequence": plan_lines,
            "source_file": "pddl2_solution_validated",
            "solution_file": str(sol_path),
            "problem_file": str(problem_path),
            "domain_file": str(domain_file),
            "raw_score": raw_score,
            "validation_message": msg,
        }
        grouped[key].append(entry)
    
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
    
    # Add validated PDDL2 solutions that fail safety constraints in PDDL3 environment
    # (skip perfect solutions that already satisfy safety constraints)
    if pddl2_solution_dir is not None:
        validated_solutions = _load_and_validate_pddl2_solutions(
            pddl2_solution_dir, domain_file, scenario
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
