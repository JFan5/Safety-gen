#!/usr/bin/env python3
"""
Collect GRPO training candidates by checking which PDDL3 problems are not
solved by the legacy solutions.

The script scans <scenario>/all_problems3/training, validates each problem
against the matching solution from <scenario>/all_problems/training using VAL's
Validate tool, and records any problem whose legacy solution fails. Failing
problems are copied into <scenario>/grpo_training (or a custom directory) and
an optional JSON report may be generated.
"""

from __future__ import annotations

import argparse
import json
import shutil
import subprocess
import sys
from pathlib import Path
from typing import Dict, List, Optional, Sequence, Tuple

DEFAULT_REPO_ROOT = Path(__file__).resolve().parent
VALID_SUCCESS_STRINGS = ("plan valid", "plan successfully executed")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Collect problems from all_problems3/training whose legacy "
            "solutions (all_problems/training) fail validation."
        )
    )
    parser.add_argument(
        "--scenario",
        default="blocksworld",
        help="Scenario directory under the repository root (e.g., blocksworld, logistics).",
    )
    parser.add_argument(
        "--repo-root",
        type=Path,
        default=DEFAULT_REPO_ROOT,
        help="Path to the repository root. Defaults to this script's directory.",
    )
    parser.add_argument(
        "--domain-file",
        type=Path,
        help="Optional override for the domain file. Defaults to <scenario>/domain3.pddl or domain.pddl.",
    )
    parser.add_argument(
        "--problems-dir",
        type=Path,
        help="Optional override for the problems directory. Defaults to <scenario>/all_problems3/training.",
    )
    parser.add_argument(
        "--solutions-dir",
        type=Path,
        help="Optional override for the legacy solutions directory. Defaults to <scenario>/all_problems/training.",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        help="Override for the output directory (default: <scenario>/grpo_training).",
    )
    parser.add_argument(
        "--copy-solutions",
        action="store_true",
        help="Copy the legacy solution files alongside the problems.",
    )
    parser.add_argument(
        "--report",
        type=Path,
        help="Optional path to a JSON report detailing the collection results.",
    )
    parser.add_argument(
        "--max-number",
        type=int,
        help="Stop after collecting this many failing problems (default: process all).",
    )
    parser.add_argument(
        "--timeout",
        type=int,
        default=30,
        help="Validation timeout in seconds (default: 30).",
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Print validation stderr/stdout summaries for failures.",
    )
    return parser.parse_args()


def determine_domain_file(args: argparse.Namespace, scenario_dir: Path) -> Path:
    if args.domain_file:
        domain_path = args.domain_file
    else:
        domain3 = scenario_dir / "domain3.pddl"
        domain = scenario_dir / "domain.pddl"
        if domain3.exists():
            domain_path = domain3
        elif domain.exists():
            domain_path = domain
        else:
            raise FileNotFoundError("Could not find domain3.pddl or domain.pddl in scenario directory.")
    domain_path = domain_path.resolve()
    if not domain_path.exists():
        raise FileNotFoundError(f"Domain file not found: {domain_path}")
    return domain_path


def determine_directory(override: Optional[Path], default: Path, description: str) -> Path:
    directory = override if override is not None else default
    directory = directory.resolve()
    if not directory.exists():
        raise FileNotFoundError(f"{description} not found: {directory}")
    if not directory.is_dir():
        raise NotADirectoryError(f"{description} is not a directory: {directory}")
    return directory


def ensure_validate_available() -> None:
    if shutil.which("Validate") is None:
        raise RuntimeError("Validate binary not found in PATH. Please ensure VAL is installed and on PATH.")


def run_validate(
    domain_file: Path,
    problem_file: Path,
    solution_file: Path,
    timeout: int,
) -> Tuple[bool, str, Dict[str, Optional[str]]]:
    cmd = ["Validate", "-v", str(domain_file), str(problem_file), str(solution_file)]
    execution_info: Dict[str, Optional[str]] = {
        "command": " ".join(cmd),
        "stdout": None,
        "stderr": None,
        "returncode": None,
        "timeout": None,
    }
    try:
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=timeout,
        )
    except subprocess.TimeoutExpired:
        execution_info["timeout"] = str(timeout)
        return False, f"Validation timeout after {timeout}s", execution_info
    execution_info["returncode"] = str(result.returncode)
    execution_info["stdout"] = result.stdout.strip() if result.stdout else ""
    execution_info["stderr"] = result.stderr.strip() if result.stderr else ""
    lowered = (result.stdout or "").lower()
    success = result.returncode == 0 and any(marker in lowered for marker in VALID_SUCCESS_STRINGS)
    if success:
        return True, "Plan valid", execution_info
    failure_msg = execution_info["stderr"] or execution_info["stdout"] or f"Validate exited {result.returncode}"
    return False, failure_msg, execution_info


def summarize_execution(execution_info: Dict[str, Optional[str]]) -> str:
    parts: List[str] = []
    if execution_info.get("returncode") is not None:
        parts.append(f"code={execution_info['returncode']}")
    if execution_info.get("timeout"):
        parts.append(f"timeout={execution_info['timeout']}s")
    if execution_info.get("stderr"):
        parts.append(f"stderr={execution_info['stderr'][:200]}")
    elif execution_info.get("stdout"):
        parts.append(f"stdout={execution_info['stdout'][:200]}")
    return "; ".join(parts)


def collect_problems(
    domain_file: Path,
    problems_dir: Path,
    solutions_dir: Path,
    timeout: int,
    max_problems: Optional[int],
    verbose: bool,
) -> Tuple[List[Dict[str, str]], Dict[str, int]]:
    stats = {
        "total_problems": 0,
        "missing_solution": 0,
        "validated": 0,
        "failed_validation": 0,
    }
    collected: List[Dict[str, str]] = []
    problem_files: Sequence[Path] = sorted(problems_dir.glob("*.pddl"))
    for problem_file in problem_files:
        stats["total_problems"] += 1
        solution_file = solutions_dir / (problem_file.stem + ".soln")
        if not solution_file.exists():
            stats["missing_solution"] += 1
            continue
        ok, reason, exec_info = run_validate(domain_file, problem_file, solution_file, timeout)
        if ok:
            stats["validated"] += 1
            continue
        stats["failed_validation"] += 1
        entry = {
            "problem": str(problem_file),
            "solution": str(solution_file),
            "reason": reason,
        }
        if verbose:
            summary = summarize_execution(exec_info)
            print(f"[FAIL] {problem_file.name}: {reason} ({summary})")
        collected.append(entry)
        if max_problems is not None and len(collected) >= max_problems:
            break
    return collected, stats


def copy_artifacts(
    entries: List[Dict[str, str]],
    output_dir: Path,
    copy_solutions: bool,
) -> None:
    output_dir.mkdir(parents=True, exist_ok=True)
    for entry in entries:
        problem_src = Path(entry["problem"])
        shutil.copy2(problem_src, output_dir / problem_src.name)
        if copy_solutions:
            solution_src = Path(entry["solution"])
            if solution_src.exists():
                shutil.copy2(solution_src, output_dir / solution_src.name)


def write_report(
    report_path: Path,
    scenario: str,
    domain_file: Path,
    problems_dir: Path,
    solutions_dir: Path,
    stats: Dict[str, int],
    entries: List[Dict[str, str]],
) -> None:
    payload = {
        "scenario": scenario,
        "domain_file": str(domain_file),
        "problems_dir": str(problems_dir),
        "solutions_dir": str(solutions_dir),
        "stats": stats,
        "collected": entries,
    }
    report_path.parent.mkdir(parents=True, exist_ok=True)
    report_path.write_text(json.dumps(payload, indent=2), encoding="utf-8")


def main() -> int:
    args = parse_args()
    try:
        ensure_validate_available()
    except RuntimeError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 1

    repo_root = args.repo_root.resolve()
    scenario_dir = (repo_root / args.scenario).resolve()
    if not scenario_dir.exists():
        print(f"ERROR: Scenario directory not found: {scenario_dir}", file=sys.stderr)
        return 1

    try:
        domain_file = determine_domain_file(args, scenario_dir)
        problems_dir = determine_directory(
            args.problems_dir,
            scenario_dir / "all_problems3" / "training",
            "Problems directory",
        )
        solutions_dir = determine_directory(
            args.solutions_dir,
            scenario_dir / "all_problems" / "training",
            "Solutions directory",
        )
    except (FileNotFoundError, NotADirectoryError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 1

    output_dir = (args.output_dir or (scenario_dir / "grpo_training")).resolve()

    print(
        f"Collecting from scenario '{args.scenario}'\n"
        f"  Domain   : {domain_file}\n"
        f"  Problems : {problems_dir}\n"
        f"  Solutions: {solutions_dir}\n"
        f"  Output   : {output_dir}\n"
        f"  Timeout  : {args.timeout}s\n"
    )

    entries, stats = collect_problems(
        domain_file=domain_file,
        problems_dir=problems_dir,
        solutions_dir=solutions_dir,
        timeout=args.timeout,
        max_problems=args.max_number,
        verbose=args.verbose,
    )

    copy_artifacts(entries, output_dir, args.copy_solutions)
    print(f"Copied {len(entries)} problems to {output_dir}")

    if args.report:
        write_report(
            args.report.resolve(),
            args.scenario,
            domain_file,
            problems_dir,
            solutions_dir,
            stats,
            entries,
        )
        print(f"Wrote report to {args.report.resolve()}")

    print(
        "Summary:\n"
        f"  Total problems      : {stats['total_problems']}\n"
        f"  Missing solutions   : {stats['missing_solution']}\n"
        f"  Validated solutions : {stats['validated']}\n"
        f"  Failed validations  : {stats['failed_validation']}\n"
        f"  Collected problems  : {len(entries)}"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
