#!/usr/bin/env python3
"""
Select Grippers problems with uniform difficulty distribution across tiers.
"""

import os
import re
import random
import shutil
import argparse
from collections import defaultdict
from pathlib import Path
from typing import Dict, List, Optional


# Tier patterns for Grippers domain
# Format: grippers-n<robots>-r<rooms>-o<objects>-s<seed>
TIER_PATTERNS = {
    1: re.compile(r"n1-r4-o4"),
    2: re.compile(r"n2-r4-o4"),
    3: re.compile(r"n2-r5-o5"),
    4: re.compile(r"n2-r5-o6"),
    5: re.compile(r"n2-r6-o6"),
}


def get_tier(filename: str) -> int:
    for tier, pattern in TIER_PATTERNS.items():
        if pattern.search(filename):
            return tier
    return 0


def copy_problem(problem_path: Path, dest_dir: Path):
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
    random.seed(seed)
    input_path = Path(input_dir)

    by_tier: Dict[int, List[Path]] = defaultdict(list)
    for p in input_path.glob("*.pddl"):
        tier = get_tier(p.name)
        if tier > 0:
            by_tier[tier].append(p)

    print("=== Input Distribution ===")
    total_input = 0
    for tier in sorted(by_tier.keys()):
        count = len(by_tier[tier])
        total_input += count
        print(f"  Tier {tier}: {count} problems")
    print(f"  Total: {total_input} problems")
    print()

    for tier in by_tier:
        random.shuffle(by_tier[tier])

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

    tier_indices: Dict[int, int] = {tier: 0 for tier in by_tier}

    results = {}
    for name, dest_path, per_tier in output_dirs:
        tier_counts = {}
        total = 0

        for tier in sorted(by_tier.keys()):
            problems = by_tier[tier]
            idx = tier_indices[tier]
            available = len(problems) - idx
            to_take = min(per_tier, available)

            if to_take > 0:
                for p in problems[idx:idx + to_take]:
                    copy_problem(p, dest_path)
                tier_counts[tier] = to_take
                total += to_take
                tier_indices[tier] = idx + to_take

        results[name] = (total, tier_counts)

    print("=== Selection Results ===")
    for name, (total, tier_counts) in results.items():
        print(f"\n{name} set ({total} total):")
        for tier in sorted(tier_counts.keys()):
            print(f"  Tier {tier}: {tier_counts[tier]} problems")


def main():
    parser = argparse.ArgumentParser(description="Select Grippers problems with uniform difficulty distribution.")
    parser.add_argument("input_dir", help="Input directory containing validated PDDL3 problems")
    parser.add_argument("--sft-dir", help="Output directory for SFT training problems")
    parser.add_argument("--grpo-dir", help="Output directory for GRPO training problems")
    parser.add_argument("--test-dir", help="Output directory for testing problems")
    parser.add_argument("--sft-per-tier", type=int, default=100)
    parser.add_argument("--grpo-per-tier", type=int, default=100)
    parser.add_argument("--test-per-tier", type=int, default=40)
    parser.add_argument("--seed", type=int, default=42)
    args = parser.parse_args()

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
