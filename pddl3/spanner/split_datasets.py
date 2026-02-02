#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Split validated PDDL3 problems into SFT, GRPO, and Testing datasets.

Stratifies by difficulty tier (based on problem parameters).
Ensures no overlap between datasets.
Copies both .pddl and .soln files.
Verifies constraint presence in every file.

Usage:
    python split_datasets.py \
        --input-dir pddl3/spanner/pddl3_validated \
        --sft-dir pddl3/spanner/sft_500 \
        --grpo-dir pddl3/spanner/grpo_500 \
        --testing-dir pddl3/spanner/testing_200 \
        --sft-count 500 \
        --grpo-count 500 \
        --testing-count 200
"""

import os
import re
import argparse
import shutil
import random
from typing import Dict, List, Tuple
from collections import defaultdict


def read_file(path: str) -> str:
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


def extract_tier_from_filename(filename: str) -> str:
    """
    Extract tier from filename based on problem parameters.

    Filename format: spanner-s{spanners}-n{nuts}-l{locations}-s{seed}.pddl

    Tiers:
    - tier1: s=3, n=2
    - tier2: s=4, n=3
    - tier3: s=4, n=4 or s=5, n=4+
    """
    match = re.match(r"spanner-s(\d+)-n(\d+)-l(\d+)", filename)
    if not match:
        return "unknown"

    spanners = int(match.group(1))
    nuts = int(match.group(2))
    locations = int(match.group(3))

    if spanners == 3 and nuts == 2:
        return "tier1"
    elif spanners == 4 and nuts == 3:
        return "tier2"
    elif nuts >= 4:
        return "tier3"
    else:
        return "other"


def verify_constraints(pddl_text: str) -> Tuple[bool, List[str]]:
    """
    Verify that PDDL3 problem has required constraints.

    Returns (has_all, missing_list).
    """
    missing = []

    if not re.search(r"\(always\s+\(imply", pddl_text, re.IGNORECASE):
        missing.append("always-imply")

    if not re.search(r"at-most-once.*\(at\s+\?m\s+shed\)", pddl_text, re.IGNORECASE):
        missing.append("at-most-once-shed")

    return len(missing) == 0, missing


def collect_problems_by_tier(input_dir: str) -> Dict[str, List[str]]:
    """
    Collect all PDDL files and group by tier.

    Returns dict mapping tier -> list of filenames (without extension).
    """
    problems_by_tier = defaultdict(list)

    for fname in os.listdir(input_dir):
        if not fname.lower().endswith(".pddl"):
            continue

        name_without_ext = os.path.splitext(fname)[0]
        tier = extract_tier_from_filename(fname)
        problems_by_tier[tier].append(name_without_ext)

    return problems_by_tier


def stratified_split(
    problems_by_tier: Dict[str, List[str]],
    sft_count: int,
    grpo_count: int,
    testing_count: int,
    seed: int = 42
) -> Tuple[List[str], List[str], List[str]]:
    """
    Stratified split of problems into SFT, GRPO, and Testing sets.

    Maintains tier distribution across all datasets.
    Returns (sft_problems, grpo_problems, testing_problems).
    """
    random.seed(seed)

    total_needed = sft_count + grpo_count + testing_count
    all_problems = []
    tier_counts = {}

    for tier, problems in problems_by_tier.items():
        tier_counts[tier] = len(problems)
        all_problems.extend(problems)

    total_available = len(all_problems)

    if total_available < total_needed:
        print(f"WARNING: Only {total_available} problems available, need {total_needed}")
        # Adjust counts proportionally
        ratio = total_available / total_needed
        sft_count = int(sft_count * ratio)
        grpo_count = int(grpo_count * ratio)
        testing_count = total_available - sft_count - grpo_count

    print(f"Total problems available: {total_available}")
    print(f"Tier distribution:")
    for tier, count in sorted(tier_counts.items()):
        print(f"  {tier}: {count}")

    # Calculate proportions for each tier
    tier_ratios = {tier: count / total_available for tier, count in tier_counts.items()}

    sft_problems = []
    grpo_problems = []
    testing_problems = []

    # Shuffle problems within each tier
    for tier in problems_by_tier:
        random.shuffle(problems_by_tier[tier])

    # Split each tier proportionally
    for tier, problems in problems_by_tier.items():
        n = len(problems)

        # Calculate how many from this tier go to each set
        tier_sft = int(sft_count * tier_ratios[tier])
        tier_grpo = int(grpo_count * tier_ratios[tier])
        tier_testing = n - tier_sft - tier_grpo

        # Clamp testing to not exceed testing_count proportionally
        max_tier_testing = int(testing_count * tier_ratios[tier]) + 1
        tier_testing = min(tier_testing, max_tier_testing)

        # Ensure we don't exceed available
        if tier_sft + tier_grpo + tier_testing > n:
            excess = (tier_sft + tier_grpo + tier_testing) - n
            tier_testing = max(0, tier_testing - excess)

        idx = 0
        sft_problems.extend(problems[idx:idx + tier_sft])
        idx += tier_sft
        grpo_problems.extend(problems[idx:idx + tier_grpo])
        idx += tier_grpo
        testing_problems.extend(problems[idx:idx + tier_testing])

    # If we still need more problems for any set, take from remaining pool
    used = set(sft_problems + grpo_problems + testing_problems)
    remaining = [p for p in all_problems if p not in used]
    random.shuffle(remaining)

    # Fill up to target counts
    while len(sft_problems) < sft_count and remaining:
        sft_problems.append(remaining.pop())
    while len(grpo_problems) < grpo_count and remaining:
        grpo_problems.append(remaining.pop())
    while len(testing_problems) < testing_count and remaining:
        testing_problems.append(remaining.pop())

    # Verify no overlap
    sft_set = set(sft_problems)
    grpo_set = set(grpo_problems)
    testing_set = set(testing_problems)

    assert len(sft_set & grpo_set) == 0, "SFT and GRPO overlap!"
    assert len(sft_set & testing_set) == 0, "SFT and Testing overlap!"
    assert len(grpo_set & testing_set) == 0, "GRPO and Testing overlap!"

    return sft_problems, grpo_problems, testing_problems


def copy_problems(
    problem_names: List[str],
    input_dir: str,
    output_dir: str,
    verify: bool = True
) -> Tuple[int, int]:
    """
    Copy problems and their solutions to output directory.

    Returns (copied_count, error_count).
    """
    os.makedirs(output_dir, exist_ok=True)

    copied = 0
    errors = 0

    for name in problem_names:
        pddl_src = os.path.join(input_dir, name + ".pddl")
        pddl_dst = os.path.join(output_dir, name + ".pddl")

        if not os.path.exists(pddl_src):
            print(f"WARNING: PDDL file not found: {pddl_src}")
            errors += 1
            continue

        # Verify constraints if requested
        if verify:
            pddl_text = read_file(pddl_src)
            has_constraints, missing = verify_constraints(pddl_text)
            if not has_constraints:
                print(f"WARNING: {name} missing constraints: {missing}")
                errors += 1
                continue

        # Copy PDDL file
        shutil.copy2(pddl_src, pddl_dst)

        # Copy solution file if exists
        for soln_ext in [".soln", ".plan"]:
            soln_src = os.path.join(input_dir, name + soln_ext)
            if os.path.exists(soln_src):
                soln_dst = os.path.join(output_dir, name + soln_ext)
                shutil.copy2(soln_src, soln_dst)
                break

        copied += 1

    return copied, errors


def main():
    parser = argparse.ArgumentParser(
        description="Split PDDL3 problems into SFT, GRPO, and Testing datasets"
    )
    parser.add_argument("--input-dir", required=True,
                        help="Directory containing validated PDDL3 problems")
    parser.add_argument("--sft-dir", required=True,
                        help="Output directory for SFT problems")
    parser.add_argument("--grpo-dir", required=True,
                        help="Output directory for GRPO problems")
    parser.add_argument("--testing-dir", required=True,
                        help="Output directory for Testing problems")
    parser.add_argument("--sft-count", type=int, default=500,
                        help="Number of SFT problems (default: 500)")
    parser.add_argument("--grpo-count", type=int, default=500,
                        help="Number of GRPO problems (default: 500)")
    parser.add_argument("--testing-count", type=int, default=200,
                        help="Number of Testing problems (default: 200)")
    parser.add_argument("--seed", type=int, default=42,
                        help="Random seed for reproducibility")
    parser.add_argument("--no-verify", action="store_true",
                        help="Skip constraint verification")

    args = parser.parse_args()

    if not os.path.isdir(args.input_dir):
        raise SystemExit(f"Input directory not found: {args.input_dir}")

    print("=" * 60)
    print("PDDL3 Dataset Splitter")
    print("=" * 60)

    # Collect problems by tier
    problems_by_tier = collect_problems_by_tier(args.input_dir)

    if not any(problems_by_tier.values()):
        raise SystemExit("No PDDL files found in input directory")

    # Stratified split
    sft_problems, grpo_problems, testing_problems = stratified_split(
        problems_by_tier,
        args.sft_count,
        args.grpo_count,
        args.testing_count,
        args.seed
    )

    print(f"\nSplit results:")
    print(f"  SFT: {len(sft_problems)} problems")
    print(f"  GRPO: {len(grpo_problems)} problems")
    print(f"  Testing: {len(testing_problems)} problems")

    # Clean output directories
    for out_dir in [args.sft_dir, args.grpo_dir, args.testing_dir]:
        if os.path.exists(out_dir):
            shutil.rmtree(out_dir)

    # Copy problems
    verify = not args.no_verify

    print(f"\nCopying SFT problems...")
    sft_copied, sft_errors = copy_problems(
        sft_problems, args.input_dir, args.sft_dir, verify
    )

    print(f"Copying GRPO problems...")
    grpo_copied, grpo_errors = copy_problems(
        grpo_problems, args.input_dir, args.grpo_dir, verify
    )

    print(f"Copying Testing problems...")
    testing_copied, testing_errors = copy_problems(
        testing_problems, args.input_dir, args.testing_dir, verify
    )

    print("\n" + "=" * 60)
    print("SUMMARY")
    print("=" * 60)
    print(f"SFT:     {sft_copied} copied, {sft_errors} errors")
    print(f"GRPO:    {grpo_copied} copied, {grpo_errors} errors")
    print(f"Testing: {testing_copied} copied, {testing_errors} errors")
    print("=" * 60)

    if sft_errors + grpo_errors + testing_errors > 0:
        print(f"\nWARNING: {sft_errors + grpo_errors + testing_errors} total errors")

    print(f"\nOutput directories:")
    print(f"  SFT:     {args.sft_dir}")
    print(f"  GRPO:    {args.grpo_dir}")
    print(f"  Testing: {args.testing_dir}")


if __name__ == "__main__":
    main()
