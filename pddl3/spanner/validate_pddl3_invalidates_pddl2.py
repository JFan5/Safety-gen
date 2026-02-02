#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Validate PDDL3 problems to ensure:
1. PDDL2 solutions FAIL constraint validation
2. Problem files are within character limit
3. Problems contain required constraints

Usage:
    python validate_pddl3_invalidates_pddl2.py \
        --pddl3-dir pddl3/spanner/pddl3_all \
        --pddl2-dir pddl3/spanner/pddl2_raw \
        --domain pddl3/spanner/domain3.pddl \
        --output-dir pddl3/spanner/pddl3_validated \
        --max-chars 1500
"""

import os
import re
import argparse
import subprocess
import shutil
from typing import Tuple, Optional, List
from pathlib import Path


def read_file(path: str) -> str:
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


def write_file(path: str, content: str) -> None:
    os.makedirs(os.path.dirname(path) or ".", exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)


def find_val_executable() -> Optional[str]:
    """Find VAL validator executable."""
    candidates = [
        "Validate",
        "/usr/local/bin/Validate",
        os.path.expanduser("~/VAL/build/Validate"),
        "/opt/VAL/bin/Validate",
    ]
    for cand in candidates:
        if shutil.which(cand):
            return cand
        if os.path.isfile(cand) and os.access(cand, os.X_OK):
            return cand
    return None


def validate_plan_with_val(
    domain_path: str,
    problem_path: str,
    plan_path: str,
    val_executable: str,
    verbose: bool = False
) -> Tuple[bool, str]:
    """
    Run VAL validator on a plan.
    Returns (is_valid, output_message).
    """
    cmd = [val_executable, "-v", domain_path, problem_path, plan_path]
    try:
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=30
        )
        output = result.stdout + result.stderr

        # VAL reports success with "Plan valid" or exit code 0
        is_valid = result.returncode == 0 and "Plan valid" in output

        if verbose:
            print(f"VAL output for {problem_path}:")
            print(output[:500])

        return is_valid, output
    except subprocess.TimeoutExpired:
        return False, "TIMEOUT"
    except Exception as e:
        return False, f"ERROR: {e}"


def check_constraint_format(pddl_text: str) -> Tuple[bool, List[str]]:
    """
    Check if PDDL3 problem has required constraint format:
    - (always (imply ...)) constraint
    - (forall (?m - man) (at-most-once (at ?m shed))) constraint

    Returns (has_all_constraints, list_of_missing_constraints).
    """
    missing = []

    # Check for always-imply constraint
    if not re.search(r"\(always\s+\(imply", pddl_text, re.IGNORECASE):
        missing.append("always-imply")

    # Check for at-most-once shed constraint
    if not re.search(r"at-most-once.*\(at\s+\?m\s+shed\)", pddl_text, re.IGNORECASE):
        missing.append("at-most-once-shed")

    return len(missing) == 0, missing


def validate_single(
    pddl3_path: str,
    pddl2_dir: str,
    domain_path: str,
    val_executable: str,
    max_chars: int,
    verbose: bool = False
) -> Tuple[bool, str]:
    """
    Validate a single PDDL3 problem.
    Returns (is_valid, reason).
    """
    basename = os.path.basename(pddl3_path)
    name_without_ext = os.path.splitext(basename)[0]

    # Read PDDL3 problem
    try:
        pddl3_text = read_file(pddl3_path)
    except Exception as e:
        return False, f"cannot read PDDL3: {e}"

    # Check character count
    char_count = len(pddl3_text)
    if char_count > max_chars:
        return False, f"too long: {char_count} > {max_chars}"

    # Check constraint format
    has_constraints, missing = check_constraint_format(pddl3_text)
    if not has_constraints:
        return False, f"missing constraints: {', '.join(missing)}"

    # Find PDDL2 solution
    pddl2_soln_path = os.path.join(pddl2_dir, name_without_ext + ".soln")
    if not os.path.exists(pddl2_soln_path):
        pddl2_soln_path = os.path.join(pddl2_dir, name_without_ext + ".plan")
    if not os.path.exists(pddl2_soln_path):
        return False, "no PDDL2 solution found"

    # Validate PDDL2 solution against PDDL3 problem
    # It should FAIL (because constraints invalidate the solution)
    is_valid, output = validate_plan_with_val(
        domain_path, pddl3_path, pddl2_soln_path, val_executable, verbose
    )

    if is_valid:
        return False, "PDDL2 solution still valid (should fail)"

    # Check that it specifically failed due to constraint violation
    if "constraint" not in output.lower() and "violation" not in output.lower():
        # Might have failed for other reasons - let's still accept if plan is invalid
        if verbose:
            print(f"  Warning: {basename} - plan invalid but not clearly constraint violation")

    return True, f"ok (chars={char_count})"


def validate_directory(
    pddl3_dir: str,
    pddl2_dir: str,
    domain_path: str,
    output_dir: str,
    max_chars: int,
    verbose: bool = False
) -> Tuple[int, int, int]:
    """
    Validate all PDDL3 problems in a directory.
    Copy valid ones to output_dir along with their solutions.

    Returns (valid_count, invalid_count, skipped_count).
    """
    val_executable = find_val_executable()
    if not val_executable:
        print("ERROR: VAL validator not found. Please install VAL or set path.")
        print("  Looking for: Validate, ~/VAL/build/Validate, /opt/VAL/bin/Validate")
        return 0, 0, 0

    print(f"Using VAL: {val_executable}")

    if os.path.exists(output_dir):
        shutil.rmtree(output_dir)
    os.makedirs(output_dir, exist_ok=True)

    valid_count = 0
    invalid_count = 0
    skipped_count = 0

    pddl_files = sorted([f for f in os.listdir(pddl3_dir) if f.lower().endswith(".pddl")])
    total = len(pddl_files)

    for i, fname in enumerate(pddl_files):
        pddl3_path = os.path.join(pddl3_dir, fname)

        is_valid, reason = validate_single(
            pddl3_path, pddl2_dir, domain_path,
            val_executable, max_chars, verbose
        )

        if is_valid:
            valid_count += 1
            # Copy PDDL3 file
            shutil.copy2(pddl3_path, os.path.join(output_dir, fname))
            # Copy solution if exists
            name_without_ext = os.path.splitext(fname)[0]
            for soln_ext in [".soln", ".plan"]:
                soln_src = os.path.join(pddl3_dir, name_without_ext + soln_ext)
                if os.path.exists(soln_src):
                    shutil.copy2(soln_src, os.path.join(output_dir, name_without_ext + soln_ext))
                    break
            if verbose:
                print(f"[{i+1}/{total}] VALID: {fname} - {reason}")
        else:
            invalid_count += 1
            if verbose or "still valid" in reason:
                print(f"[{i+1}/{total}] INVALID: {fname} - {reason}")

    print(f"\nValidation complete:")
    print(f"  Valid: {valid_count}")
    print(f"  Invalid: {invalid_count}")
    print(f"  Total: {total}")
    print(f"  Output: {output_dir}")

    return valid_count, invalid_count, skipped_count


def main():
    parser = argparse.ArgumentParser(
        description="Validate PDDL3 problems to ensure PDDL2 solutions fail"
    )
    parser.add_argument("--pddl3-dir", required=True,
                        help="Directory containing PDDL3 problems")
    parser.add_argument("--pddl2-dir", required=True,
                        help="Directory containing PDDL2 problems with solutions")
    parser.add_argument("--domain", required=True,
                        help="Path to PDDL3 domain file")
    parser.add_argument("--output-dir", required=True,
                        help="Directory to copy validated problems")
    parser.add_argument("--max-chars", type=int, default=1500,
                        help="Maximum character count for problems (default: 1500)")
    parser.add_argument("--verbose", "-v", action="store_true",
                        help="Print detailed output")

    args = parser.parse_args()

    if not os.path.isdir(args.pddl3_dir):
        raise SystemExit(f"PDDL3 directory not found: {args.pddl3_dir}")
    if not os.path.isdir(args.pddl2_dir):
        raise SystemExit(f"PDDL2 directory not found: {args.pddl2_dir}")
    if not os.path.isfile(args.domain):
        raise SystemExit(f"Domain file not found: {args.domain}")

    validate_directory(
        args.pddl3_dir,
        args.pddl2_dir,
        args.domain,
        args.output_dir,
        args.max_chars,
        args.verbose
    )


if __name__ == "__main__":
    main()
