#!/usr/bin/env python3
"""
Validate PDDL3 Spanner problems: ensure they have a valid solution AND
the original PDDL2 solution violates the PDDL3 constraints.

This script filters problems to keep only those where:
1. A PDDL3 solution exists (problem is solvable with constraints)
2. The original PDDL2 solution violates the sometime-before constraints

Usage:
    python validate_spanner_pddl3.py <pddl3_dir> <pddl2_solutions_dir> <output_dir>
"""

import os
import re
import sys
import shutil
import argparse
from pathlib import Path
from typing import List, Tuple, Optional


def extract_sometime_before_constraints(problem_text: str) -> List[Tuple[str, str]]:
    """
    Extract (sometime-before (tightened A) (tightened B)) constraints.
    Returns list of (before_nut, after_nut) tuples.
    The constraint means: before_nut must be tightened BEFORE after_nut.
    """
    # Match: (sometime-before (tightened nut1) (tightened nut2))
    pattern = re.compile(
        r"\(sometime-before\s+\(tightened\s+(\w+)\)\s+\(tightened\s+(\w+)\)\)",
        re.IGNORECASE
    )
    constraints = pattern.findall(problem_text)
    return constraints


def extract_tighten_order_from_plan(plan_text: str) -> List[str]:
    """
    Extract the order in which nuts are tightened in the plan.
    Returns list of nut names in order of first tightening.
    """
    # Match: (tighten_nut <location> <spanner> <man> <nut>)
    tighten_re = re.compile(
        r"\(\s*tighten_nut\s+\S+\s+\S+\s+\S+\s+(\S+)\s*\)",
        re.IGNORECASE
    )

    order = []
    seen = set()
    for match in tighten_re.finditer(plan_text):
        nut = match.group(1)
        if nut not in seen:
            seen.add(nut)
            order.append(nut)
    return order


def check_sometime_before_violation(
    constraints: List[Tuple[str, str]],
    tighten_order: List[str]
) -> bool:
    """
    Check if the plan violates any sometime-before constraints.

    For (sometime-before (tightened A) (tightened B)):
    - A must be tightened BEFORE B
    - If B appears before A in the plan, it's a violation

    Returns True if there's a violation.
    """
    if not constraints or not tighten_order:
        return False

    pos = {nut: idx for idx, nut in enumerate(tighten_order)}

    for (before_nut, after_nut) in constraints:
        if before_nut in pos and after_nut in pos:
            # before_nut should appear BEFORE after_nut (lower index)
            if pos[before_nut] >= pos[after_nut]:
                return True  # Violation found

    return False


def validate_problem(
    pddl3_file: Path,
    pddl3_solutions_dir: Path,
    pddl2_solutions_dir: Path,
    verbose: bool = False
) -> Tuple[bool, str]:
    """
    Validate a single problem.

    Returns (is_valid, reason) where is_valid means the problem should be kept.
    """
    stem = pddl3_file.stem

    # Check PDDL3 solution exists
    pddl3_soln = pddl3_solutions_dir / f"{stem}.soln"
    if not pddl3_soln.exists():
        return False, "No PDDL3 solution"

    # Check PDDL2 solution exists
    pddl2_soln = pddl2_solutions_dir / f"{stem}.soln"
    if not pddl2_soln.exists():
        return False, "No PDDL2 solution"

    # Read problem and solutions
    try:
        problem_text = pddl3_file.read_text()
        pddl2_plan = pddl2_soln.read_text()
    except Exception as e:
        return False, f"Read error: {e}"

    # Extract constraints
    constraints = extract_sometime_before_constraints(problem_text)
    if not constraints:
        # No sometime-before constraints to validate
        return True, "No sometime-before constraints (keeping anyway)"

    # Extract tighten order from PDDL2 plan
    tighten_order = extract_tighten_order_from_plan(pddl2_plan)
    if not tighten_order:
        return False, "No tighten actions in PDDL2 plan"

    # Check if PDDL2 plan violates constraints
    violates = check_sometime_before_violation(constraints, tighten_order)

    if violates:
        return True, "PDDL2 plan violates constraints (good!)"
    else:
        return False, "PDDL2 plan satisfies constraints (not challenging)"


def validate_all(
    pddl3_dir: str,
    pddl2_solutions_dir: str,
    output_dir: str,
    verbose: bool = False
) -> Tuple[int, int, int]:
    """
    Validate all problems and copy valid ones to output directory.

    Returns (kept, skipped, total) counts.
    """
    pddl3_path = Path(pddl3_dir)
    pddl2_path = Path(pddl2_solutions_dir)
    output_path = Path(output_dir)

    # Create output directory
    if output_path.exists():
        shutil.rmtree(output_path)
    output_path.mkdir(parents=True)

    kept = 0
    skipped = 0
    total = 0

    skip_reasons = {}

    for pddl3_file in sorted(pddl3_path.glob("*.pddl")):
        total += 1

        # Validate problem (solutions are in same dir as problems)
        is_valid, reason = validate_problem(
            pddl3_file,
            pddl3_path,  # PDDL3 solutions are in pddl3_dir
            pddl2_path,  # PDDL2 solutions are in pddl2_dir
            verbose
        )

        if is_valid:
            # Copy problem and solution to output
            shutil.copy(pddl3_file, output_path)
            soln_file = pddl3_path / f"{pddl3_file.stem}.soln"
            if soln_file.exists():
                shutil.copy(soln_file, output_path)
            kept += 1
            if verbose:
                print(f"  [KEEP] {pddl3_file.name}: {reason}")
        else:
            skipped += 1
            skip_reasons[reason] = skip_reasons.get(reason, 0) + 1
            if verbose:
                print(f"  [SKIP] {pddl3_file.name}: {reason}")

    # Print summary
    print(f"\n=== Validation Summary ===")
    print(f"Total problems: {total}")
    print(f"Kept: {kept}")
    print(f"Skipped: {skipped}")

    if skip_reasons:
        print(f"\nSkip reasons:")
        for reason, count in sorted(skip_reasons.items(), key=lambda x: -x[1]):
            print(f"  {reason}: {count}")

    return kept, skipped, total


def main():
    parser = argparse.ArgumentParser(
        description="Validate PDDL3 Spanner problems and filter to keep only challenging ones."
    )
    parser.add_argument(
        "pddl3_dir",
        help="Directory containing PDDL3 problems and their solutions"
    )
    parser.add_argument(
        "pddl2_solutions_dir",
        help="Directory containing original PDDL2 solutions"
    )
    parser.add_argument(
        "output_dir",
        help="Output directory for validated problems"
    )
    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="Print details for each problem"
    )

    args = parser.parse_args()

    validate_all(
        args.pddl3_dir,
        args.pddl2_solutions_dir,
        args.output_dir,
        args.verbose
    )


if __name__ == "__main__":
    main()
