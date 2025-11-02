#!/usr/bin/env python3
"""
Combine classical planner solutions with scored LLM candidates to build
`scored_summaries.json` payloads consumed by construct_dpo_dataset.py.
"""

from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path
from typing import Dict, Iterable, List, Tuple


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
            scaled_score = max(0, min(score, 9)) * 10
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
) -> dict:
    grouped = _load_unsloth_candidates(unsloth_jsonl, scenario)

    for problem_path in _iter_solutions(problem_dir):
        key, entry = _build_classical_entry(problem_path, domain_file, scenario)
        grouped[key].append(entry)

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
    )

    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("w", encoding="utf-8") as handle:
        json.dump(payload, handle, ensure_ascii=False, indent=2)


if __name__ == "__main__":
    main()
