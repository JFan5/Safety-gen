#!/usr/bin/env python3
"""
Sample testing problems with uniform difficulty distribution.

Usage:
    python script/sample_testing_problems.py \
        --input_dir pddl3/spanner/testing_200 \
        --output_dir pddl3/spanner/new_testing_problem50 \
        --num_samples 50 \
        --seed 42
"""

import argparse
import os
import re
import shutil
import random
from pathlib import Path
from collections import defaultdict
import json
from datetime import datetime


def extract_difficulty(filename: str) -> str:
    """Extract difficulty key from filename like spanner-s3-n2-l5-s123.pddl"""
    match = re.search(r'(s\d+-n\d+-l\d+)', filename)
    return match.group(1) if match else None


def main():
    parser = argparse.ArgumentParser(description="Sample testing problems with uniform difficulty distribution")
    parser.add_argument('--input_dir', type=str, required=True, help="Source directory with problems")
    parser.add_argument('--output_dir', type=str, required=True, help="Output directory for sampled problems")
    parser.add_argument('--num_samples', type=int, default=50, help="Total number of problems to sample")
    parser.add_argument('--seed', type=int, default=42, help="Random seed for reproducibility")
    args = parser.parse_args()

    random.seed(args.seed)

    input_dir = Path(args.input_dir)
    output_dir = Path(args.output_dir)

    # Group problems by difficulty
    problems_by_difficulty = defaultdict(list)
    for pddl_file in input_dir.glob("*.pddl"):
        difficulty = extract_difficulty(pddl_file.name)
        if difficulty:
            # Check if solution file exists
            soln_file = pddl_file.with_suffix('.soln')
            if soln_file.exists():
                problems_by_difficulty[difficulty].append(pddl_file)

    # Sort difficulties by complexity (s, n, l values)
    def difficulty_key(d):
        nums = re.findall(r'\d+', d)
        return tuple(int(n) for n in nums)

    sorted_difficulties = sorted(problems_by_difficulty.keys(), key=difficulty_key)

    print(f"Found {len(sorted_difficulties)} difficulty levels:")
    for d in sorted_difficulties:
        print(f"  {d}: {len(problems_by_difficulty[d])} problems")

    # Calculate samples per difficulty level
    num_difficulties = len(sorted_difficulties)
    if num_difficulties == 0:
        print("Error: No problems found!")
        return

    base_samples = args.num_samples // num_difficulties
    remainder = args.num_samples % num_difficulties

    print(f"\nSampling {args.num_samples} problems ({base_samples} per level, {remainder} extra)")

    # Sample from each difficulty level
    sampled_problems = []
    for i, difficulty in enumerate(sorted_difficulties):
        available = problems_by_difficulty[difficulty]
        # Distribute remainder to earlier (easier) difficulties
        n_samples = base_samples + (1 if i < remainder else 0)
        n_samples = min(n_samples, len(available))

        selected = random.sample(available, n_samples)
        sampled_problems.extend(selected)
        print(f"  {difficulty}: sampled {n_samples} problems")

    # Create output directory
    output_dir.mkdir(parents=True, exist_ok=True)

    # Copy selected problems and their solutions
    for pddl_file in sampled_problems:
        soln_file = pddl_file.with_suffix('.soln')

        shutil.copy2(pddl_file, output_dir / pddl_file.name)
        if soln_file.exists():
            shutil.copy2(soln_file, output_dir / soln_file.name)

    # Generate config file
    config = {
        "generated_at": datetime.now().isoformat(),
        "source_dir": str(input_dir.resolve()),
        "output_dir": str(output_dir.resolve()),
        "num_samples": len(sampled_problems),
        "seed": args.seed,
        "difficulty_distribution": {
            d: len([p for p in sampled_problems if extract_difficulty(p.name) == d])
            for d in sorted_difficulties
        },
        "files": sorted([p.name for p in sampled_problems])
    }

    config_path = output_dir / "config.json"
    with open(config_path, 'w', encoding='utf-8') as f:
        json.dump(config, f, indent=2, ensure_ascii=False)

    print(f"\nCreated {len(sampled_problems)} problems in: {output_dir}")
    print(f"Config saved to: {config_path}")


if __name__ == '__main__':
    main()
