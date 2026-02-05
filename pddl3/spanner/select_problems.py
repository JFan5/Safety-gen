#!/usr/bin/env python3
"""
Select problems from all_problems3 with uniform difficulty distribution.

Difficulty levels based on (spanners, nuts, locations):
- s3-n2-l5: easiest
- s4-n3-l5
- s5-n4-l6
- s5-n5-l7
- s6-n5-l8: hardest

Target:
- sft_500: 500 problems (100 per difficulty level)
- grpo_500: 500 problems (100 per difficulty level)
- testing_problem200: 200 problems (40 per difficulty level)
"""

import os
import re
import shutil
import random
from pathlib import Path
from collections import defaultdict

random.seed(42)  # For reproducibility

BASE_DIR = Path("/home/jfan5/Safety-gen/pddl3/spanner")
ALL_PROBLEMS3 = BASE_DIR / "all_problems3"

# Output directories
SFT_500 = BASE_DIR / "sft_500"
GRPO_500 = BASE_DIR / "grpo_500"
TESTING_200 = BASE_DIR / "testing_problem200"

def parse_difficulty(filename):
    """Extract difficulty parameters from filename."""
    # Format: spanner-s{spanners}-n{nuts}-l{locations}-s{seed}.pddl
    m = re.match(r'spanner-s(\d+)-n(\d+)-l(\d+)', filename)
    if m:
        return f"s{m.group(1)}-n{m.group(2)}-l{m.group(3)}"
    return None

def main():
    # Group problems by difficulty
    by_difficulty = defaultdict(list)

    for pddl_file in ALL_PROBLEMS3.glob("*.pddl"):
        soln_file = pddl_file.with_suffix(".soln")
        if not soln_file.exists():
            continue

        diff = parse_difficulty(pddl_file.name)
        if diff:
            by_difficulty[diff].append(pddl_file)

    print("Problems by difficulty:")
    for diff in sorted(by_difficulty.keys()):
        print(f"  {diff}: {len(by_difficulty[diff])}")

    # Calculate per-difficulty allocation
    # Total: 1200 problems across 5 difficulty levels = 240 per level
    # sft_500: 100 per level
    # grpo_500: 100 per level
    # testing_200: 40 per level

    difficulties = sorted(by_difficulty.keys())
    per_diff_sft = 100
    per_diff_grpo = 100
    per_diff_test = 40
    per_diff_total = per_diff_sft + per_diff_grpo + per_diff_test  # 240

    # Check if we have enough problems per difficulty
    for diff in difficulties:
        if len(by_difficulty[diff]) < per_diff_total:
            print(f"Warning: {diff} has only {len(by_difficulty[diff])} problems, need {per_diff_total}")

    # Select problems
    sft_problems = []
    grpo_problems = []
    test_problems = []

    for diff in difficulties:
        problems = by_difficulty[diff].copy()
        random.shuffle(problems)

        # Take first 240 (or all available if less)
        available = min(len(problems), per_diff_total)
        selected = problems[:available]

        # Distribute among datasets
        n_sft = min(per_diff_sft, len(selected))
        n_grpo = min(per_diff_grpo, len(selected) - n_sft)
        n_test = min(per_diff_test, len(selected) - n_sft - n_grpo)

        sft_problems.extend(selected[:n_sft])
        grpo_problems.extend(selected[n_sft:n_sft + n_grpo])
        test_problems.extend(selected[n_sft + n_grpo:n_sft + n_grpo + n_test])

        print(f"  {diff}: sft={n_sft}, grpo={n_grpo}, test={n_test}")

    print(f"\nTotal selected:")
    print(f"  sft_500: {len(sft_problems)}")
    print(f"  grpo_500: {len(grpo_problems)}")
    print(f"  testing_problem200: {len(test_problems)}")

    # Create output directories and copy files
    for output_dir, problems, name in [
        (SFT_500, sft_problems, "sft_500"),
        (GRPO_500, grpo_problems, "grpo_500"),
        (TESTING_200, test_problems, "testing_problem200"),
    ]:
        # Clean and create directory
        if output_dir.exists():
            shutil.rmtree(output_dir)
        output_dir.mkdir(parents=True)

        # Copy files
        for pddl_file in problems:
            soln_file = pddl_file.with_suffix(".soln")
            shutil.copy(pddl_file, output_dir / pddl_file.name)
            shutil.copy(soln_file, output_dir / soln_file.name)

        print(f"\nCreated {name}:")
        print(f"  {len(problems)} problems copied to {output_dir}")

        # Verify difficulty distribution
        dist = defaultdict(int)
        for p in problems:
            diff = parse_difficulty(p.name)
            dist[diff] += 1
        print(f"  Difficulty distribution: {dict(sorted(dist.items()))}")

    print("\nDone!")

if __name__ == "__main__":
    main()
