#!/usr/bin/env python3
"""
Test script to verify difficulty parsing and scoring logic for GRPO V2.

This script:
1. Loads sample data from each domain
2. Parses difficulty parameters from problem_file names
3. Computes difficulty scores
4. Shows difficulty distribution and bucket assignments
"""
import json
import re
from pathlib import Path
from typing import Tuple
import numpy as np


def parse_difficulty_from_filename(problem_file: str, domain: str) -> Tuple[int, int, int]:
    """Parse n, r, o from problem_file name (domain-aware)."""
    filename = Path(problem_file).name.lower()

    n = 0
    r = 0
    o = 0

    if 'blocksworld' in domain.lower() or 'bw_' in filename:
        n_match = re.search(r'_n(\d+)', filename)
        if n_match:
            n = int(n_match.group(1))
        return (n, 0, 0)

    elif 'ferry' in domain.lower():
        l_match = re.search(r'-l(\d+)', filename)
        c_match = re.search(r'-c(\d+)', filename)
        if l_match:
            n = int(l_match.group(1))
        if c_match:
            r = int(c_match.group(1))
        return (n, r, 0)

    elif 'grippers' in domain.lower():
        n_match = re.search(r'-n(\d+)', filename)
        r_match = re.search(r'-r(\d+)', filename)
        o_match = re.search(r'-o(\d+)', filename)
        if n_match:
            n = int(n_match.group(1))
        if r_match:
            r = int(r_match.group(1))
        if o_match:
            o = int(o_match.group(1))
        return (n, r, o)

    elif 'spanner' in domain.lower():
        s_match = re.search(r'spanner-s(\d+)', filename)
        n_match = re.search(r'-n(\d+)', filename)
        l_match = re.search(r'-l(\d+)', filename)
        if n_match:
            n = int(n_match.group(1))
        if l_match:
            r = int(l_match.group(1))
        if s_match:
            o = int(s_match.group(1))
        return (n, r, o)

    else:
        n_match = re.search(r'-n(\d+)', filename)
        r_match = re.search(r'-r(\d+)', filename)
        o_match = re.search(r'-o(\d+)', filename)
        if n_match:
            n = int(n_match.group(1))
        if r_match:
            r = int(r_match.group(1))
        if o_match:
            o = int(o_match.group(1))
        return (n, r, o)


def compute_difficulty_score(n: int, r: int, o: int) -> float:
    """Compute difficulty score: 5*n + 3*r + 2*o"""
    return 5.0 * n + 3.0 * r + 2.0 * o


def analyze_domain(domain_file: Path, max_samples: int = 100):
    """Analyze difficulty distribution for a domain."""
    domain_name = domain_file.stem
    print(f"\n{'='*70}")
    print(f"Domain: {domain_name}")
    print(f"{'='*70}")

    if not domain_file.exists():
        print(f"File not found: {domain_file}")
        return

    scores = []
    examples = []

    with open(domain_file, 'r') as f:
        for i, line in enumerate(f):
            if i >= max_samples:
                break
            if not line.strip():
                continue

            record = json.loads(line)
            meta = record.get('meta', {})
            problem_file = meta.get('problem_file', '')

            if not problem_file:
                continue

            n, r, o = parse_difficulty_from_filename(problem_file, domain_name)
            score = compute_difficulty_score(n, r, o)
            scores.append(score)

            # Store first 5 examples
            if len(examples) < 5:
                examples.append({
                    'problem_file': Path(problem_file).name,
                    'n': n,
                    'r': r,
                    'o': o,
                    'score': score
                })

    if not scores:
        print("No valid samples found")
        return

    # Statistics
    scores = np.array(scores)
    p40 = np.percentile(scores, 40)
    p80 = np.percentile(scores, 80)

    print(f"\nSamples analyzed: {len(scores)}")
    print(f"\nDifficulty Score Statistics:")
    print(f"  Min:    {scores.min():.1f}")
    print(f"  Max:    {scores.max():.1f}")
    print(f"  Mean:   {scores.mean():.1f}")
    print(f"  Median: {np.median(scores):.1f}")
    print(f"  Std:    {scores.std():.1f}")

    print(f"\nPercentiles (for bucketing):")
    print(f"  40th (p40): {p40:.1f}  → Easy/Medium threshold")
    print(f"  80th (p80): {p80:.1f}  → Medium/Hard threshold")

    # Bucket counts
    easy = np.sum(scores <= p40)
    medium = np.sum((scores > p40) & (scores <= p80))
    hard = np.sum(scores > p80)

    print(f"\nBucket Distribution:")
    print(f"  Easy   (≤{p40:.1f}):  {easy:4d} samples ({easy/len(scores)*100:.1f}%)")
    print(f"  Medium ({p40:.1f}-{p80:.1f}): {medium:4d} samples ({medium/len(scores)*100:.1f}%)")
    print(f"  Hard   (>{p80:.1f}):  {hard:4d} samples ({hard/len(scores)*100:.1f}%)")

    print(f"\nExample Problems:")
    print(f"  {'Filename':<40} {'n':>3} {'r':>3} {'o':>3} {'Score':>6}")
    print(f"  {'-'*59}")
    for ex in examples:
        print(f"  {ex['problem_file']:<40} {ex['n']:3d} {ex['r']:3d} {ex['o']:3d} {ex['score']:6.1f}")


def main():
    """Run difficulty analysis on all domains."""
    data_root = Path("/jfan5/grpo_data/five_domain_0109")

    print(f"\n{'#'*70}")
    print(f"# Difficulty Parsing & Scoring Test")
    print(f"# Data root: {data_root}")
    print(f"# Formula: difficulty_score = 5*n + 3*r + 2*o")
    print(f"{'#'*70}")

    domains = ['blocksworld', 'ferry', 'grippers', 'spanner', 'delivery']

    for domain in domains:
        domain_file = data_root / f"{domain}.jsonl"
        analyze_domain(domain_file, max_samples=500)

    print(f"\n{'#'*70}")
    print(f"# Analysis Complete")
    print(f"{'#'*70}\n")


if __name__ == "__main__":
    main()
