#!/usr/bin/env python3
import argparse
import shutil
import subprocess
from pathlib import Path
from typing import List, Optional, Tuple


DEFAULT_SCENARIOS = ["blocksworld", "grippers", "ferry", "spanner", "delivery"]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Ensure <scenario>/dpo_training has N problems with valid .soln from <scenario>/all_problems3"
    )
    parser.add_argument(
        "--repo-root",
        type=Path,
        default=Path.home() / "Safety-gen",
        help="Repository root (default: ~/Safety-gen)",
    )
    parser.add_argument(
        "--scenarios",
        nargs="*",
        default=DEFAULT_SCENARIOS,
        help=f"Scenarios to prepare (default: {', '.join(DEFAULT_SCENARIOS)})",
    )
    parser.add_argument(
        "--count",
        type=int,
        default=500,
        help="Desired number of valid pairs per scenario (default: 500)",
    )
    parser.add_argument(
        "--timeout-sec",
        type=int,
        default=30,
        help="Validate timeout per problem in seconds (default: 30)",
    )
    parser.add_argument(
        "--force-topup",
        action="store_true",
        help="If destination exists with fewer than count, top up to count",
    )
    return parser.parse_args()


def resolve_validate_path() -> str:
    candidates = [
        shutil.which("Validate"),
        str(Path.home() / "VAL/build/linux64/Release/bin/Validate"),
        str(Path.home() / "VAL/build/linux64/debug/bin/Validate"),
        str(Path.home() / "VAL/build/bin/Validate"),
    ]
    for c in candidates:
        if c and Path(c).exists():
            return c
    # Fallback to PATH if not an existing file but resolvable executable name
    return "Validate"


def validate_pair(validate_bin: str, domain_file: Path, problem_file: Path, soln_file: Path, timeout_sec: int) -> bool:
    if not (domain_file.exists() and problem_file.exists() and soln_file.exists()):
        return False
    try:
        proc = subprocess.run(
            [validate_bin, "-v", str(domain_file), str(problem_file), str(soln_file)],
            text=True,
            capture_output=True,
            timeout=timeout_sec,
        )
    except subprocess.TimeoutExpired:
        return False
    if proc.returncode != 0:
        return False
    out = (proc.stdout or "").lower()
    return ("plan valid" in out) or ("plan successfully executed" in out)


def count_pairs(dir_path: Path) -> int:
    return sum(1 for _ in dir_path.glob("*.pddl"))


def ensure_for_scenario(repo_root: Path, scenario: str, desired_count: int, timeout_sec: int, force_topup: bool, validate_bin: str) -> Tuple[int, int]:
    scenario_dir = repo_root / scenario
    domain_file = scenario_dir / "domain3.pddl"
    src_root = scenario_dir / "all_problems3"
    # Fallbacks for scenarios like delivery
    if not src_root.exists():
        alt_src = scenario_dir / "training_problems3"
        if alt_src.exists():
            src_root = alt_src
        else:
            alt_src2 = scenario_dir / "training_problems"
            if alt_src2.exists():
                src_root = alt_src2

    dst_dir = scenario_dir / "dpo_training"

    if not scenario_dir.exists():
        raise FileNotFoundError(f"Scenario dir not found: {scenario_dir}")
    if not domain_file.exists():
        raise FileNotFoundError(f"Domain file not found: {domain_file}")
    if not src_root.exists():
        raise FileNotFoundError(f"Source dir not found: {src_root}")

    # If destination exists and has enough, return early unless topping up requested
    if dst_dir.exists():
        existing = count_pairs(dst_dir)
        if existing >= desired_count and not force_topup:
            return existing, 0
    else:
        dst_dir.mkdir(parents=True, exist_ok=True)

    # Special handling for delivery: source may not have .soln; copy then solve
    if scenario == "delivery":
        existing = count_pairs(dst_dir)
        needed = max(0, desired_count - existing)
        if needed > 0:
            sources = sorted(src_root.glob("*.pddl"))
            # Copy up to needed problems into dst_dir
            added_copy = 0
            for p in sources:
                if added_copy >= needed:
                    break
                dst_p = dst_dir / p.name
                if not dst_p.exists():
                    shutil.copy2(p, dst_p)
                    added_copy += 1
            # Run the delivery solver to produce .soln files
            solver = repo_root / "delivery" / "solve_dpo_training.py"
            if solver.exists():
                subprocess.run([
                    "python3", str(solver), "--directory", str(dst_dir)
                ], check=False)
        # After solving, return current count
        return count_pairs(dst_dir), needed if needed > 0 else 0

    # Build candidate list: problems in src_root with existing .soln
    candidates: List[Path] = sorted(src_root.glob("*.pddl"))
    added = 0
    existing = count_pairs(dst_dir)
    needed = max(0, desired_count - existing)
    if needed == 0:
        return existing, 0

    for problem_file in candidates:
        if added >= needed:
            break
        soln_file = problem_file.with_suffix(".soln")
        if not soln_file.exists():
            continue
        if not validate_pair(validate_bin, domain_file, problem_file, soln_file, timeout_sec):
            continue
        # Copy into destination if not already present
        dst_problem = dst_dir / problem_file.name
        dst_soln = dst_dir / soln_file.name
        if dst_problem.exists() and dst_soln.exists():
            continue
        shutil.copy2(problem_file, dst_problem)
        shutil.copy2(soln_file, dst_soln)
        added += 1

    return existing + added, added


def main() -> None:
    args = parse_args()
    validate_bin = resolve_validate_path()
    total_added = 0
    for scenario in args.scenarios:
        final_count, added = ensure_for_scenario(
            args.repo_root,
            scenario,
            args.count,
            args.timeout_sec,
            args.force_topup,
            validate_bin,
        )
        total_added += added
        print(f"[{scenario}] dpo_training count={final_count} (added {added})")
    print(f"Done. Total added: {total_added}")


if __name__ == "__main__":
    main()


