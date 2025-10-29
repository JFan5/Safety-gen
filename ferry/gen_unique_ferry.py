#!/usr/bin/env python3
import argparse
import os
import subprocess
import sys
from pathlib import Path
from typing import Dict, Set, Tuple
import re
import random

# Regex for extracting (at c l) pairs
AT_RE = re.compile(r"\(\s*at\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)", re.IGNORECASE)
INIT_SECTION_RE = re.compile(r"\(\s*:init(.*?)\)\s*\(\s*:\w+", re.DOTALL | re.IGNORECASE)
GOAL_SECTION_RE = re.compile(r"\(\s*:goal(.*?)\)\s*\)\s*$", re.DOTALL | re.IGNORECASE)


def ensure_built(ferry_dir: Path) -> Path:
    """Ensure the ferry generator binary exists by running make if needed."""
    binary = ferry_dir / "ferry"
    if binary.exists() and os.access(binary, os.X_OK):
        return binary
    print("Building ferry generator with make...")
    subprocess.run(["make"], cwd=str(ferry_dir), check=True)
    if not binary.exists():
        raise RuntimeError("Failed to build ferry generator")
    return binary


def run_ferry(binary: Path, locations: int, cars: int, seed: int) -> str:
    cmd = [str(binary), "-l", str(locations), "-c", str(cars), "-s", str(seed)]
    result = subprocess.run(cmd, cwd=str(binary.parent), check=True, capture_output=True, text=True)
    return result.stdout


def signature(problem_text: str) -> Tuple[Tuple[Tuple[str, str], ...], Tuple[Tuple[str, str], ...]]:
    """Build a canonical signature based on init and goal at-relations for cars."""
    init_m = INIT_SECTION_RE.search(problem_text)
    goal_m = GOAL_SECTION_RE.search(problem_text)
    if not init_m or not goal_m:
        raise ValueError("Problem missing :init or :goal section")
    init_text = init_m.group(1)
    goal_text = goal_m.group(1)

    init_pairs = []
    for car, loc in AT_RE.findall(init_text):
        if car.startswith("c") and loc.startswith("l"):
            init_pairs.append((car, loc))
    goal_pairs = []
    for car, loc in AT_RE.findall(goal_text):
        if car.startswith("c") and loc.startswith("l"):
            goal_pairs.append((car, loc))
    init_pairs_sorted = tuple(sorted(init_pairs))
    goal_pairs_sorted = tuple(sorted(goal_pairs))
    return init_pairs_sorted, goal_pairs_sorted


def write_problem(out_dir: Path, text: str, locations: int, cars: int, seed: int, index: int) -> Path:
    name = f"ferry-l{locations}-c{cars}-s{seed}.pddl"
    out_path = out_dir / name
    if out_path.exists():
        out_path = out_dir / f"ferry-l{locations}-c{cars}-{index:06d}.pddl"
    out_path.write_text(text)
    return out_path


def seed_seen_from_dir(out_dir: Path) -> Set[Tuple[Tuple[Tuple[str, str], ...], Tuple[Tuple[str, str], ...]]]:
    seen: Set[Tuple[Tuple[Tuple[str, str], ...], Tuple[Tuple[str, str], ...]]] = set()
    if not out_dir.exists():
        return seen
    for p in out_dir.glob("*.pddl"):
        try:
            text = p.read_text()
            sig = signature(text)
            seen.add(sig)
        except Exception:
            # Skip unreadable or malformed
            continue
    return seen


def generate_unique(binary: Path, out_dir: Path, count: int, locations: int, cars: int, base_seed: int, max_attempts: int = 100000) -> int:
    rng = random.Random(base_seed)
    seen = seed_seen_from_dir(out_dir)
    generated = 0
    attempts = 0
    out_dir.mkdir(parents=True, exist_ok=True)

    while generated < count and attempts < max_attempts:
        attempts += 1
        seed = rng.randint(1, 2**31 - 1)
        text = run_ferry(binary, locations, cars, seed)
        sig = signature(text)
        if sig in seen:
            continue
        seen.add(sig)
        write_problem(out_dir, text, locations, cars, seed, generated + 1)
        generated += 1
        if generated % 50 == 0 or generated == count:
            print(f"Generated {generated}/{count} unique problems...")
    return generated


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate simple unique ferry training problems")
    parser.add_argument("--count", type=int, default=100, help="Number of unique problems to generate")
    parser.add_argument("--target-dir", type=str, default="training_problems_unique", help="Output directory")
    parser.add_argument("--locations", type=int, default=3, help="Number of locations (keep small for simplicity)")
    parser.add_argument("--cars", type=int, default=2, help="Number of cars (keep small for simplicity)")
    parser.add_argument("--seed", type=int, default=20250101, help="Base seed for sampling unique instances")
    args = parser.parse_args()

    ferry_dir = Path(__file__).resolve().parent
    out_dir = ferry_dir / args.target_dir

    try:
        binary = ensure_built(ferry_dir)
    except Exception as e:
        print(f"ERROR: build failed: {e}")
        sys.exit(1)

    try:
        total = generate_unique(binary, out_dir, args.count, args.locations, args.cars, args.seed)
    except Exception as e:
        print(f"ERROR: generation failed: {e}")
        sys.exit(1)

    print(f"Done. Generated {total} unique problems in {out_dir}")


if __name__ == "__main__":
    main()

