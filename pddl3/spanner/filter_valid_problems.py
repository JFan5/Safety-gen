#!/usr/bin/env python3
"""
Filter spanner problems to keep only those with valid OPTIC solutions.
Validates each problem-solution pair and removes invalid ones.
"""

import os
import subprocess
from pathlib import Path

def validate_solution(domain_file: str, problem_file: str, solution_file: str, timeout: int = 30) -> bool:
    """Validate a solution using VAL."""
    try:
        cmd = ["Validate", "-v", domain_file, problem_file, solution_file]
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)
        output = result.stdout.lower()
        # Check for explicit "plan valid" in output
        if "plan valid" in output and "failed" not in output:
            return True
        return False
    except Exception as e:
        print(f"  Validation error: {e}")
        return False

def filter_directory(problems_dir: str, domain_file: str):
    """Filter a directory to keep only valid problem-solution pairs."""
    problems_path = Path(problems_dir)

    if not problems_path.exists():
        print(f"Directory not found: {problems_dir}")
        return 0, 0

    problem_files = sorted(problems_path.glob("*.pddl"))
    print(f"Checking {len(problem_files)} problems in {problems_dir}")

    valid_count = 0
    invalid_count = 0
    invalid_files = []

    for i, prob in enumerate(problem_files, 1):
        soln = prob.with_suffix(".soln")

        if not soln.exists():
            print(f"[{i}/{len(problem_files)}] {prob.name}: No solution - REMOVING")
            invalid_count += 1
            invalid_files.append(prob)
            continue

        is_valid = validate_solution(domain_file, str(prob), str(soln))

        if is_valid:
            valid_count += 1
            if i % 100 == 0:
                print(f"[{i}/{len(problem_files)}] Progress: {valid_count} valid so far")
        else:
            invalid_count += 1
            invalid_files.append(prob)
            print(f"[{i}/{len(problem_files)}] {prob.name}: INVALID - will remove")

    print(f"\nResults: {valid_count} valid, {invalid_count} invalid")

    # Remove invalid files
    if invalid_files:
        print(f"\nRemoving {len(invalid_files)} invalid problem-solution pairs...")
        for prob in invalid_files:
            soln = prob.with_suffix(".soln")
            try:
                os.remove(prob)
            except Exception as e:
                print(f"  Error removing {prob.name}: {e}")

            if soln.exists():
                try:
                    os.remove(soln)
                except Exception:
                    pass

    # Count remaining
    remaining = len(list(problems_path.glob("*.pddl")))
    print(f"Remaining problems: {remaining}")

    return valid_count, invalid_count

def main():
    domain_file = "/home/jfan5/Safety-gen/pddl3/spanner/domain3.pddl"

    directories = [
        "/home/jfan5/Safety-gen/pddl3/spanner/testing_problem50_hard",
        "/home/jfan5/Safety-gen/pddl3/spanner/sft_500_hard",
        "/home/jfan5/Safety-gen/pddl3/spanner/grpo_500_hard",
    ]

    total_valid = 0
    total_invalid = 0

    for dir_path in directories:
        print(f"\n{'='*60}")
        print(f"Processing: {os.path.basename(dir_path)}")
        print('='*60)

        valid, invalid = filter_directory(dir_path, domain_file)
        total_valid += valid
        total_invalid += invalid

    print(f"\n{'='*60}")
    print(f"TOTAL: {total_valid} valid, {total_invalid} invalid (removed)")
    print('='*60)

if __name__ == "__main__":
    main()
