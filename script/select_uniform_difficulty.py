#!/usr/bin/env python3
"""
Select problems with uniform difficulty distribution across tiers.

This script distributes problems evenly across difficulty tiers for:
- SFT training set
- GRPO training set
- Testing set

Usage:
    python select_uniform_difficulty.py <input_dir> --sft-dir <sft> --grpo-dir <grpo> --test-dir <test>
"""

import os
import re
import random
import shutil
import argparse
from collections import defaultdict
from pathlib import Path
from typing import Dict, List, Optional


# Tier patterns for Spanner domain
# Format: spanner-s<spanners>-n<nuts>-l<locations>-s<seed>
TIER_PATTERNS = {
    1: re.compile(r"s3-n2-l5"),
    2: re.compile(r"s4-n3-l5"),
    3: re.compile(r"s5-n4-l6"),
    4: re.compile(r"s5-n5-l7"),
    5: re.compile(r"s6-n5-l8"),
}


def get_tier(filename: str) -> int:
    """
    Determine which difficulty tier a problem belongs to.
    Returns 0 if the problem doesn't match any known tier.
    """
    for tier, pattern in TIER_PATTERNS.items():
        if pattern.search(filename):
            return tier
    return 0


def analyze_distribution(problems_dir: str) -> Dict[int, int]:
    """
    Analyze the difficulty distribution of problems in a directory.
    Returns dict mapping tier -> count.
    """
    distribution = defaultdict(int)

    for f in Path(problems_dir).glob("*.pddl"):
        tier = get_tier(f.name)
        distribution[tier] += 1

    return dict(distribution)


def copy_problem(problem_path: Path, dest_dir: Path):
    """Copy a problem file and its solution to destination."""
    shutil.copy(problem_path, dest_dir)
    soln_path = problem_path.with_suffix(".soln")
    if soln_path.exists():
        shutil.copy(soln_path, dest_dir)


def select_uniform(
    input_dir: str,
    sft_dir: Optional[str],
    grpo_dir: Optional[str],
    test_dir: Optional[str],
    sft_per_tier: int = 100,
    grpo_per_tier: int = 100,
    test_per_tier: int = 40,
    seed: int = 42
):
    """
    Select problems with uniform distribution across tiers.

    Problems are selected without replacement: SFT, GRPO, and test sets
    do not overlap.
    """
    random.seed(seed)

    input_path = Path(input_dir)

    # Group problems by tier
    by_tier: Dict[int, List[Path]] = defaultdict(list)
    for p in input_path.glob("*.pddl"):
        tier = get_tier(p.name)
        if tier > 0:  # Only include known tiers
            by_tier[tier].append(p)

    # Print input distribution
    print("=== Input Distribution ===")
    total_input = 0
    for tier in sorted(by_tier.keys()):
        count = len(by_tier[tier])
        total_input += count
        print(f"  Tier {tier}: {count} problems")
    print(f"  Total: {total_input} problems")
    print()

    # Shuffle each tier
    for tier in by_tier:
        random.shuffle(by_tier[tier])

    # Create output directories
    output_dirs = []
    if sft_dir:
        sft_path = Path(sft_dir)
        if sft_path.exists():
            shutil.rmtree(sft_path)
        sft_path.mkdir(parents=True)
        output_dirs.append(("SFT", sft_path, sft_per_tier))

    if grpo_dir:
        grpo_path = Path(grpo_dir)
        if grpo_path.exists():
            shutil.rmtree(grpo_path)
        grpo_path.mkdir(parents=True)
        output_dirs.append(("GRPO", grpo_path, grpo_per_tier))

    if test_dir:
        test_path = Path(test_dir)
        if test_path.exists():
            shutil.rmtree(test_path)
        test_path.mkdir(parents=True)
        output_dirs.append(("Test", test_path, test_per_tier))

    # Track used indices per tier
    tier_indices: Dict[int, int] = {tier: 0 for tier in by_tier}

    # Allocate problems to each output set
    results = {}
    for name, dest_path, per_tier in output_dirs:
        tier_counts = {}
        total = 0

        for tier in sorted(by_tier.keys()):
            problems = by_tier[tier]
            idx = tier_indices[tier]

            # Calculate how many to take
            available = len(problems) - idx
            to_take = min(per_tier, available)

            if to_take > 0:
                # Copy problems
                for p in problems[idx:idx + to_take]:
                    copy_problem(p, dest_path)

                tier_counts[tier] = to_take
                total += to_take
                tier_indices[tier] = idx + to_take

        results[name] = (total, tier_counts)

    # Print results
    print("=== Selection Results ===")
    for name, (total, tier_counts) in results.items():
        print(f"\n{name} set ({total} total):")
        for tier in sorted(tier_counts.keys()):
            print(f"  Tier {tier}: {tier_counts[tier]} problems")

    # Print remaining problems
    print("\n=== Remaining Problems ===")
    for tier in sorted(by_tier.keys()):
        remaining = len(by_tier[tier]) - tier_indices[tier]
        print(f"  Tier {tier}: {remaining} problems")


def main():
    parser = argparse.ArgumentParser(
        description="Select problems with uniform difficulty distribution."
    )
    parser.add_argument(
        "input_dir",
        help="Input directory containing validated PDDL3 problems"
    )
    parser.add_argument(
        "--sft-dir",
        help="Output directory for SFT training problems"
    )
    parser.add_argument(
        "--grpo-dir",
        help="Output directory for GRPO training problems"
    )
    parser.add_argument(
        "--test-dir",
        help="Output directory for testing problems"
    )
    parser.add_argument(
        "--sft-per-tier",
        type=int,
        default=100,
        help="Number of problems per tier for SFT (default: 100)"
    )
    parser.add_argument(
        "--grpo-per-tier",
        type=int,
        default=100,
        help="Number of problems per tier for GRPO (default: 100)"
    )
    parser.add_argument(
        "--test-per-tier",
        type=int,
        default=40,
        help="Number of problems per tier for testing (default: 40)"
    )
    parser.add_argument(
        "--seed",
        type=int,
        default=42,
        help="Random seed for shuffling (default: 42)"
    )
    parser.add_argument(
        "--analyze-only",
        action="store_true",
        help="Only analyze distribution without selecting"
    )

    args = parser.parse_args()

    if args.analyze_only:
        dist = analyze_distribution(args.input_dir)
        print("=== Distribution Analysis ===")
        total = 0
        for tier in sorted(dist.keys()):
            count = dist[tier]
            total += count
            tier_label = f"Tier {tier}" if tier > 0 else "Unknown"
            print(f"  {tier_label}: {count} problems")
        print(f"  Total: {total} problems")
    else:
        if not any([args.sft_dir, args.grpo_dir, args.test_dir]):
            parser.error("At least one output directory must be specified")

        select_uniform(
            args.input_dir,
            args.sft_dir,
            args.grpo_dir,
            args.test_dir,
            args.sft_per_tier,
            args.grpo_per_tier,
            args.test_per_tier,
            args.seed
        )


if __name__ == "__main__":
    main()
