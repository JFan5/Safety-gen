#!/usr/bin/env python3
"""
Convert all_problems to PDDL3 with constraints, filter to ensure PDDL2 solutions fail,
then solve with OPTIC and validate.

Workflow:
1. Convert all_problems/*.pddl to all_problems3/*.pddl with constraints
2. For each converted problem, verify the original PDDL2 solution FAILS validation
3. Solve with OPTIC
4. Validate OPTIC solutions
5. Keep only problems with valid OPTIC solutions
"""

import os
import subprocess
import shutil
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed
import json
import sys

# Paths
BASE_DIR = Path("/home/jfan5/Safety-gen/pddl3/spanner")
ALL_PROBLEMS = BASE_DIR / "all_problems"
ALL_PROBLEMS3 = BASE_DIR / "all_problems3"
DOMAIN3 = BASE_DIR / "domain3.pddl"
CONVERT_SCRIPT = BASE_DIR / "convert_training_to_pddl3.py"

def run_command(cmd, timeout=60):
    """Run a command and return (success, stdout, stderr)."""
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)
        return result.returncode == 0, result.stdout, result.stderr
    except subprocess.TimeoutExpired:
        return False, "", "timeout"
    except Exception as e:
        return False, "", str(e)

def validate_solution(domain_file: str, problem_file: str, solution_file: str, timeout: int = 30) -> bool:
    """Validate a solution using VAL."""
    try:
        cmd = ["Validate", "-v", domain_file, problem_file, solution_file]
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)
        output = result.stdout.lower()
        if "plan valid" in output and "failed" not in output:
            return True
        return False
    except Exception as e:
        return False

def validate_solution_detailed(domain_file: str, problem_file: str, solution_file: str, timeout: int = 30):
    """Validate and return (is_valid, output)."""
    try:
        cmd = ["Validate", "-v", domain_file, problem_file, solution_file]
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)
        output = result.stdout.lower()
        is_valid = "plan valid" in output and "failed" not in output
        return is_valid, result.stdout
    except Exception as e:
        return False, str(e)

OPTIC_BIN = "/home/jfan5/optic/release/optic/optic-clp"

def solve_with_optic(domain_file: str, problem_file: str, solution_file: str, timeout: int = 120) -> bool:
    """Solve a problem with OPTIC and save the solution."""
    try:
        cmd = [OPTIC_BIN, "-N", str(domain_file), str(problem_file)]
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)

        # Check if solution was found
        if "Solution Found" not in result.stdout:
            return False

        # Parse OPTIC output for solution
        # Format: "0.000: (walk shed location1 bob)  [0.001]"
        lines = result.stdout.split('\n')
        plan_lines = []

        import re
        # Match lines like "0.000: (action args)  [0.001]"
        action_pattern = re.compile(r'^\d+\.\d+:\s*(\([^)]+\))\s*\[')

        for line in lines:
            stripped = line.strip()
            m = action_pattern.match(stripped)
            if m:
                action = m.group(1)
                plan_lines.append(action)

        if plan_lines:
            with open(solution_file, 'w') as f:
                f.write('\n'.join(plan_lines) + '\n')
            return True
        return False
    except subprocess.TimeoutExpired:
        return False
    except Exception as e:
        return False

def process_single_problem(prob_file: Path, domain3: str, all_problems: Path, all_problems3: Path):
    """
    Process a single problem:
    1. Check if PDDL3 conversion was successful (file exists with constraints)
    2. Check that original PDDL2 solution FAILS on PDDL3 problem
    3. Return status
    """
    prob_name = prob_file.stem
    pddl3_file = all_problems3 / prob_file.name
    pddl2_soln = all_problems / f"{prob_name}.soln"

    # Check if PDDL3 file was created
    if not pddl3_file.exists():
        return prob_name, "no_pddl3", None

    # Check if original PDDL2 solution exists
    if not pddl2_soln.exists():
        return prob_name, "no_pddl2_soln", None

    # Check that PDDL3 file has constraints
    with open(pddl3_file) as f:
        content = f.read()
    if ":constraints" not in content:
        return prob_name, "no_constraints", None

    # Validate PDDL2 solution against PDDL3 problem - it SHOULD FAIL
    is_valid, output = validate_solution_detailed(domain3, str(pddl3_file), str(pddl2_soln))

    if is_valid:
        # PDDL2 solution still works - constraint didn't invalidate it!
        return prob_name, "pddl2_still_valid", None

    # Good - PDDL2 solution fails. This problem is a candidate.
    return prob_name, "candidate", str(pddl3_file)

def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--skip-convert", action="store_true", help="Skip conversion and filtering, go directly to solving")
    args = parser.parse_args()

    if args.skip_convert and ALL_PROBLEMS3.exists():
        pddl3_files = list(ALL_PROBLEMS3.glob("*.pddl"))
        print(f"Skipping conversion, found {len(pddl3_files)} PDDL3 problems in {ALL_PROBLEMS3}")
        candidates = [(p.stem, str(p)) for p in pddl3_files]
        pddl2_still_valid = []
        remaining = pddl3_files
    else:
        print("=" * 70)
        print("Step 1: Convert all_problems to all_problems3 with PDDL3 constraints")
        print("=" * 70)

        # Clean and create output directory
        if ALL_PROBLEMS3.exists():
            shutil.rmtree(ALL_PROBLEMS3)
        ALL_PROBLEMS3.mkdir(parents=True, exist_ok=True)

        # Run conversion
        cmd = [
            "python3", str(CONVERT_SCRIPT),
            "--input", str(ALL_PROBLEMS),
            "--output", str(ALL_PROBLEMS3),
            "--constraint-style", "spanner-invalidating"
        ]

        print(f"Running: {' '.join(cmd)}")
        result = subprocess.run(cmd, capture_output=True, text=True)
        print(result.stdout)
        if result.stderr:
            print("STDERR:", result.stderr)

        # Count converted files
        pddl3_files = list(ALL_PROBLEMS3.glob("*.pddl"))
        print(f"\nConverted {len(pddl3_files)} problems to PDDL3")

        print("\n" + "=" * 70)
        print("Step 2: Filter - keep only problems where PDDL2 solution FAILS")
        print("=" * 70)

        # Process all problems in parallel
        domain3_str = str(DOMAIN3)
        candidates = []
        pddl2_still_valid = []
        no_constraints = []
        other_issues = []

        print(f"Checking {len(pddl3_files)} problems...")

        with ThreadPoolExecutor(max_workers=16) as executor:
            futures = {
                executor.submit(process_single_problem, p, domain3_str, ALL_PROBLEMS, ALL_PROBLEMS3): p
                for p in pddl3_files
            }

            for i, future in enumerate(as_completed(futures), 1):
                prob_name, status, pddl3_path = future.result()

                if status == "candidate":
                    candidates.append((prob_name, pddl3_path))
                elif status == "pddl2_still_valid":
                    pddl2_still_valid.append(prob_name)
                elif status == "no_constraints":
                    no_constraints.append(prob_name)
                else:
                    other_issues.append((prob_name, status))

                if i % 500 == 0:
                    print(f"  Processed {i}/{len(pddl3_files)}: {len(candidates)} candidates so far")

        print(f"\nFiltering results:")
        print(f"  Candidates (PDDL2 solution fails): {len(candidates)}")
        print(f"  PDDL2 solution still valid: {len(pddl2_still_valid)}")
        print(f"  No constraints generated: {len(no_constraints)}")
        print(f"  Other issues: {len(other_issues)}")

        # Remove non-candidates from all_problems3
        print(f"\nRemoving {len(pddl3_files) - len(candidates)} non-candidate files...")
        candidate_names = {c[0] for c in candidates}
        removed = 0
        for pddl3_file in pddl3_files:
            if pddl3_file.stem not in candidate_names:
                pddl3_file.unlink()
                removed += 1
        print(f"Removed {removed} files")

        remaining = list(ALL_PROBLEMS3.glob("*.pddl"))
        print(f"Remaining candidate problems: {len(remaining)}")

    print("\n" + "=" * 70)
    print("Step 3: Solve all candidate problems with OPTIC (parallel)")
    print("=" * 70)

    def solve_one(prob_file):
        soln_file = prob_file.with_suffix(".soln")
        success = solve_with_optic(str(DOMAIN3), str(prob_file), str(soln_file), timeout=60)
        return prob_file.stem, success

    solved = 0
    failed_to_solve = []

    with ThreadPoolExecutor(max_workers=8) as executor:
        futures = {executor.submit(solve_one, p): p for p in remaining}

        for i, future in enumerate(as_completed(futures), 1):
            prob_name, success = future.result()
            if success:
                solved += 1
            else:
                failed_to_solve.append(prob_name)

            if i % 500 == 0:
                print(f"  Progress: {i}/{len(remaining)}, solved: {solved}")

    print(f"\nOPTIC solving results:")
    print(f"  Solved: {solved}")
    print(f"  Failed to solve: {len(failed_to_solve)}")

    print("\n" + "=" * 70)
    print("Step 4: Validate all OPTIC solutions (parallel)")
    print("=" * 70)

    # Get all files with solutions
    soln_files = list(ALL_PROBLEMS3.glob("*.soln"))
    print(f"Validating {len(soln_files)} solutions...")

    def validate_one(soln_file):
        prob_file = soln_file.with_suffix(".pddl")
        if not prob_file.exists():
            return soln_file.stem, False, "no_problem"
        is_valid = validate_solution(str(DOMAIN3), str(prob_file), str(soln_file))
        return soln_file.stem, is_valid, "validation_failed" if not is_valid else "ok"

    valid = []
    invalid = []

    with ThreadPoolExecutor(max_workers=16) as executor:
        futures = {executor.submit(validate_one, s): s for s in soln_files}

        for i, future in enumerate(as_completed(futures), 1):
            name, is_valid, reason = future.result()
            if is_valid:
                valid.append(name)
            else:
                invalid.append((name, reason))

            if i % 500 == 0:
                print(f"  Progress: {i}/{len(soln_files)}, valid: {len(valid)}")

    print(f"\nValidation results:")
    print(f"  Valid solutions: {len(valid)}")
    print(f"  Invalid solutions: {len(invalid)}")

    # Remove invalid files
    print(f"\nRemoving invalid problem-solution pairs...")
    for name, reason in invalid:
        prob_file = ALL_PROBLEMS3 / f"{name}.pddl"
        soln_file = ALL_PROBLEMS3 / f"{name}.soln"
        if prob_file.exists():
            prob_file.unlink()
        if soln_file.exists():
            soln_file.unlink()

    # Also remove problems without solutions
    for prob_file in ALL_PROBLEMS3.glob("*.pddl"):
        soln_file = prob_file.with_suffix(".soln")
        if not soln_file.exists():
            prob_file.unlink()

    final_count = len(list(ALL_PROBLEMS3.glob("*.pddl")))

    print("\n" + "=" * 70)
    print("FINAL SUMMARY")
    print("=" * 70)
    print(f"Original problems: 7000")
    print(f"After PDDL3 conversion: {len(pddl3_files)}")
    print(f"After filtering (PDDL2 fails): {len(candidates)}")
    print(f"After OPTIC solving: {solved}")
    print(f"After validation: {final_count}")
    print(f"\nFinal all_problems3 contains {final_count} valid PDDL3 problems")

    # Save summary
    summary = {
        "original_count": 7000,
        "after_conversion": len(pddl3_files),
        "after_pddl2_filter": len(candidates),
        "after_optic_solve": solved,
        "final_valid": final_count,
        "pddl2_still_valid_count": len(pddl2_still_valid),
    }

    with open(ALL_PROBLEMS3 / "conversion_summary.json", "w") as f:
        json.dump(summary, f, indent=2)

    print(f"\nSummary saved to {ALL_PROBLEMS3}/conversion_summary.json")

if __name__ == "__main__":
    main()
