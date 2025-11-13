#!/usr/bin/env python3
"""
Assemble scenario-specific DPO training data by combining:

- Accepted plans: classical planner solutions from `<scenario>/dpo_training`
- Rejected plans: solutions from `<scenario>/all_problems` that fail validation
  (any score below 5, e.g., safety violations or other failures)

The script mirrors the flow used by `script/create_scored_summaries.py`, but
targets a single scenario directory and emits both the scored summary payload
and a ready-to-train DPO JSONL file.
"""

from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
import tempfile
from collections import defaultdict
from pathlib import Path
from typing import Dict, Iterable, List
from utils import _classify_result  # 通过这个来鉴定


def _repo_root() -> Path:
    current = Path(__file__).resolve()
    for parent in current.parents:
        if (parent / "script").is_dir():
            return parent
    return current.parents[1]


REPO_ROOT = _repo_root()

# Ensure we can import helper utilities that live under script/
SCRIPT_DIR = REPO_ROOT / "script"
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from construct_dpo_dataset import construct_dpo  # type: ignore  # noqa: E402
from utils import _classify_result  # type: ignore  # noqa: E402


SCORE_MAP = {
    "plan_format_error": 1,
    "precondition_violation": 2,
    "safety_constraints_violation": 3,
    "goal_not_satisfied": 4,
    "success_plans": 5,
    "others": 1,
}


def _iter_problem_files(problem_dir: Path) -> Iterable[Path]:
    for problem_path in sorted(problem_dir.glob("*.pddl")):
        sol_path = problem_path.with_suffix(".soln")
        if sol_path.exists():
            yield problem_path


def validate_solution(domain_file: str, problem_file: str, solution_text: str):
    with tempfile.NamedTemporaryFile(mode="w", suffix=".soln", delete=False) as tmp:
        tmp.write(solution_text)
        tmp_path = tmp.name
    try:
        cmd = f"~/VAL/build/bin/Validate  -v {domain_file} {problem_file} {tmp_path}"
        result = subprocess.run(
            cmd,
            shell=True,
            capture_output=True,
            text=True,
            timeout=30,
        )
        stdout = result.stdout
        stderr = result.stderr
        if result.returncode == 0:
            out_lower = stdout.lower()
            if "plan valid\n" in out_lower or "successful plans" in out_lower:
                return True, "Plan valid", stdout, stderr, cmd
            return False, f"Validation failed: {stdout[:500]}", stdout, stderr, cmd
        return False, f"Validation error: {stderr[:500]}", stdout, stderr, cmd
    except subprocess.TimeoutExpired:
        return False, "Validation timeout", "", "Validation timeout after 30 seconds", cmd
    except Exception as exc:  # pylint: disable=broad-except
        return False, f"Validation exception: {exc}", "", str(exc), cmd
    finally:
        try:
            os.unlink(tmp_path)
        except OSError:
            pass


def _build_accept_entries(
    scenario: str,
    domain_file: Path,
    dpo_dir: Path,
) -> Dict[str, List[dict]]:
    grouped: Dict[str, List[dict]] = defaultdict(list)
    for problem_path in _iter_problem_files(dpo_dir):
        sol_path = problem_path.with_suffix(".soln")
        plan_lines = [
            line.strip()
            for line in sol_path.read_text(encoding="utf-8").splitlines()
            if line.strip()
        ]
        key = f"{scenario}/{problem_path.stem}"
        entry = {
            "score": 100,
            "classification": "success_plans",
            "planning_sequence": plan_lines,
            "source_file": f"{scenario}_dpo_training",
            "solution_file": str(sol_path),
            "problem_file": str(problem_path),
            "domain_file": str(domain_file),
            "raw_score": 5,
        }
        grouped[key].append(entry)
    return grouped


def _build_reject_entries(
    scenario: str,
    domain_file: Path,
    problem_dir: Path,
    all_problems_dir: Path,
    problem_names: Iterable[str],
) -> Dict[str, List[dict]]:
    grouped: Dict[str, List[dict]] = defaultdict(list)
    for name in sorted(set(problem_names)):
        problem_path = problem_dir / f"{name}.pddl"
        sol_path = all_problems_dir / f"{name}.soln"
        if not problem_path.exists() or not sol_path.exists():
            continue

        try:
            solution_text = sol_path.read_text(encoding="utf-8")
        except Exception as exc:  # pylint: disable=broad-except
            print(f"Warning: failed reading {sol_path}: {exc}")
            continue

        is_valid, msg, stdout, stderr, cmd = validate_solution(
            str(domain_file), str(problem_path), solution_text
        )
        classification = _classify_result(stdout)
        raw_score = SCORE_MAP.get(classification, 1)

        if raw_score == 5:
            print(
                f"Skipping {name}: validation classification '{classification}' "
                "succeeds against the PDDL3 problem."
            )
            continue

        plan_lines = [
            line.strip()
            for line in solution_text.splitlines()
            if line.strip()
        ]

        entry = {
            "score": raw_score * 20,
            "classification": classification,
            "planning_sequence": plan_lines,
            "source_file": f"{scenario}_all_problems_validation",
            "solution_file": str(sol_path),
            "problem_file": str(problem_path),
            "domain_file": str(domain_file),
            "raw_score": raw_score,
            "raw_solution_text": solution_text,
            "validation_message": msg,
            "validation_stdout": stdout,
            "validation_stderr": stderr,
            "validator_command": cmd,
            "validation_passed": is_valid,
        }
        key = f"{scenario}/{name}"
        grouped[key].append(entry)
    return grouped


def build_payload(
    scenario: str,
    domain_file: Path,
    dpo_dir: Path,
    all_problems_dir: Path,
) -> dict:
    accept_grouped = _build_accept_entries(scenario, domain_file, dpo_dir)
    problem_names = [path.stem for path in dpo_dir.glob("*.pddl")]
    reject_grouped = _build_reject_entries(
        scenario,
        domain_file,
        dpo_dir,
        all_problems_dir,
        problem_names,
    )

    grouped: Dict[str, List[dict]] = defaultdict(list)
    for key, entries in accept_grouped.items():
        grouped[key].extend(entries)
    for key, entries in reject_grouped.items():
        grouped[key].extend(entries)

    data = {
        key: sorted(entries, key=lambda e: int(e.get("score", 0)), reverse=True)
        for key, entries in grouped.items()
        if entries
    }

    payload = {
        "scenario": scenario,
        "variant": "pddl3",
        "dpo_training_dir": str(dpo_dir),
        "all_problems_dir": str(all_problems_dir),
        "domain_file": str(domain_file),
        "data": data,
    }
    return payload


def _default_domain_file(scenario: str) -> Path:
    scenario_dir = REPO_ROOT / scenario
    candidate = scenario_dir / "domain3.pddl"
    if candidate.exists():
        return candidate
    return scenario_dir / "domain.pddl"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Create scenario-specific DPO data using <scenario>/dpo_training (accept) and <scenario>/all_problems (reject when validation fails)."
    )
    parser.add_argument(
        "--scenario",
        default="blocksworld",
        help="Scenario name used to locate input data and annotate scored summaries.",
    )
    parser.add_argument(
        "--dpo-training-dir",
        type=Path,
        default=None,
        help="Directory containing accepted plans (.pddl + .soln). Defaults to <repo>/<scenario>/dpo_training.",
    )
    parser.add_argument(
        "--all-problems-dir",
        type=Path,
        default=None,
        help="Directory containing candidate rejected plans (.pddl + .soln). Defaults to <repo>/<scenario>/all_problems.",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=None,
        help="Directory where both scored summaries and DPO dataset will be written. Defaults to <repo>/jfan5/dpo_data/<scenario>.",
    )
    parser.add_argument(
        "--domain-file",
        type=Path,
        default=None,
        help="Domain file used for validation. Defaults to <repo>/<scenario>/domain3.pddl if present, otherwise domain.pddl.",
    )
    parser.add_argument(
        "--summary-output",
        type=Path,
        default=None,
        help="Explicit path to write the scored summaries JSON. Defaults to <output-dir>/scored_summaries.json.",
    )
    parser.add_argument(
        "--dpo-output",
        type=Path,
        default=None,
        help="Explicit path to write the constructed DPO dataset. Defaults to <output-dir>/dpo_dataset.jsonl.",
    )
    parser.add_argument(
        "--raw-json",
        nargs="*",
        default=[],
        help="Optional raw result JSONs to enrich prompts.",
    )
    parser.add_argument(
        "--all-pairs",
        action="store_true",
        help="Generate all 100-score vs lowest-score pairs when constructing DPO data.",
    )
    parser.add_argument(
        "--prompt-variants",
        type=int,
        default=None,
        help="Number of prompt variants per problem (passes through to construct_dpo_dataset).",
    )
    parser.add_argument(
        "--seed",
        type=int,
        default=None,
        help="Random seed for prompt variant selection.",
    )
    parser.add_argument(
        "--include-pddl",
        dest="include_pddl",
        action="store_true",
        help="Include PDDL text in prompts.",
    )
    parser.add_argument(
        "--no-pddl",
        dest="include_pddl",
        action="store_false",
        help="Exclude PDDL text from prompts.",
    )
    parser.set_defaults(include_pddl=True)
    parser.add_argument(
        "--skip-dpo",
        action="store_true",
        help="Only build scored summaries; do not construct the DPO JSONL.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()

    scenario = args.scenario
    scenario_dir = REPO_ROOT / scenario
    if not scenario_dir.exists():
        raise FileNotFoundError(f"Scenario directory does not exist: {scenario_dir}")

    dpo_dir = args.dpo_training_dir or (scenario_dir / "dpo_training")
    all_problems_dir = args.all_problems_dir or (scenario_dir / "all_problems")
    output_dir = args.output_dir or (REPO_ROOT / "jfan5" / "dpo_data" / scenario)
    domain_file = args.domain_file or _default_domain_file(scenario)

    if not dpo_dir.exists():
        raise FileNotFoundError(f"dpo_training directory does not exist: {dpo_dir}")
    if not all_problems_dir.exists():
        raise FileNotFoundError(f"all_problems directory does not exist: {all_problems_dir}")
    if not domain_file.exists():
        raise FileNotFoundError(f"Domain file does not exist: {domain_file}")

    summary_output = args.summary_output or (output_dir / "scored_summaries.json")
    dpo_output = args.dpo_output or (output_dir / "dpo_dataset.jsonl")

    payload = build_payload(
        scenario=scenario,
        domain_file=domain_file,
        dpo_dir=dpo_dir,
        all_problems_dir=all_problems_dir,
    )

    summary_output.parent.mkdir(parents=True, exist_ok=True)
    with summary_output.open("w", encoding="utf-8") as handle:
        json.dump(payload, handle, ensure_ascii=False, indent=2)
    print(f"Wrote scored summaries: {summary_output}")

    if args.skip_dpo:
        return

    dpo_output.parent.mkdir(parents=True, exist_ok=True)
    written = construct_dpo(
        scored_path=str(summary_output),
        output_path=str(dpo_output),
        raw_jsons=args.raw_json,
        include_pddl=args.include_pddl,
        all_pairs=args.all_pairs,
        num_prompt_variants=args.prompt_variants,
        seed=args.seed,
    )
    print(f"Wrote {written} DPO pairs to {dpo_output}")


if __name__ == "__main__":
    main()

