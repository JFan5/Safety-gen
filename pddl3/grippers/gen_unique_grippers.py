#!/usr/bin/env python3
import argparse
import os
import re
import subprocess
import sys
from pathlib import Path
from typing import Set, Tuple
import random


def ensure_built(grippers_dir: Path) -> Path:
    """Ensure the grippers generator binary exists by running make if needed."""
    binary = grippers_dir / "grippers"
    if binary.exists() and os.access(binary, os.X_OK):
        return binary
    subprocess.run(["make"], cwd=str(grippers_dir), check=True)
    if not binary.exists():
        raise RuntimeError("Failed to build grippers generator")
    return binary


def run_grippers(binary: Path, robots: int, rooms: int, objects: int, seed: int) -> str:
    cmd = [
        str(binary),
        "-n", str(robots),
        "-r", str(rooms),
        "-o", str(objects),
        "-s", str(seed),
    ]
    result = subprocess.run(cmd, cwd=str(binary.parent), check=True, capture_output=True, text=True)
    return result.stdout


# Simple syntactic signatures for uniqueness
AT_ROB_RE = re.compile(r"\(\s*at-robby\s+(robot\d+)\s+(room\d+)\s*\)", re.IGNORECASE)
AT_OBJ_RE = re.compile(r"\(\s*at\s+(ball\d+)\s+(room\d+)\s*\)", re.IGNORECASE)
CARRY_RE = re.compile(r"\(\s*carry\s+(robot\d+)\s+(ball\d+)\s+(?:rgripper\d+|lgripper\d+)\s*\)", re.IGNORECASE)


def extract_section(text: str, header: str) -> str:
    needle = f"(:{header}"
    lower = text.lower()
    start = lower.find(needle)
    if start == -1:
        raise ValueError(f"section :{header} not found")
    depth = 0
    end = None
    for i in range(start, len(text)):
        ch = text[i]
        if ch == '(': depth += 1
        elif ch == ')':
            depth -= 1
            if depth == 0:
                end = i
                break
    if end is None:
        raise ValueError(f"section :{header} unbalanced")
    section = text[start:end+1]
    body = section[len(needle):-1]
    return body


def signature_isomorphic(problem_text: str) -> Tuple:
    """A reasonably strict signature ignoring object/room index permutations.

    We capture multisets of initial placements and goal placements.
    """
    init_text = extract_section(problem_text, "init")
    goal_text = extract_section(problem_text, "goal")

    # Initial: robots at rooms (orderless), balls at rooms
    init_robots = tuple(sorted(AT_ROB_RE.findall(init_text)))
    init_balls = tuple(sorted(AT_OBJ_RE.findall(init_text)))

    # Goal: just ball at room goals (ignore robots/gripper states)
    goal_balls = tuple(sorted(AT_OBJ_RE.findall(goal_text)))

    return (init_robots, init_balls, goal_balls)


def signature_text(problem_text: str) -> Tuple[str]:
    import hashlib
    return (hashlib.sha256(problem_text.encode("utf-8")).hexdigest(),)


def make_signature(problem_text: str, mode: str) -> Tuple:
    if mode == "text":
        return signature_text(problem_text)
    return signature_isomorphic(problem_text)


def seed_signatures_from_dir(out_dir: Path, mode: str) -> Set[Tuple]:
    seen: Set[Tuple] = set()
    if not out_dir.exists():
        return seen
    for p in out_dir.glob("*.pddl"):
        try:
            text = p.read_text()
            seen.add(make_signature(text, mode))
        except Exception:
            continue
    return seen


def write_problem(out_dir: Path, text: str, robots: int, rooms: int, objects: int, seed: int, index: int) -> Path:
    name = f"grippers-n{robots}-r{rooms}-o{objects}-s{seed}.pddl"
    out_path = out_dir / name
    if out_path.exists():
        out_path = out_dir / f"grippers-n{robots}-r{rooms}-o{objects}-{index:06d}.pddl"
    out_path.write_text(text)
    return out_path


def generate_unique(
    binary: Path,
    out_dir: Path,
    count: int,
    robots: int,
    rooms: int,
    objects: int,
    base_seed: int,
    mode: str = "isomorphic",
    max_attempts: int = 200000,
) -> int:
    rng = random.Random(base_seed)
    seen = seed_signatures_from_dir(out_dir, mode)
    out_dir.mkdir(parents=True, exist_ok=True)
    attempts = 0
    generated = 0
    dup_hits = 0

    while generated < count and attempts < max_attempts:
        attempts += 1
        seed = rng.randint(1, 2**31 - 1)
        text = run_grippers(binary, robots, rooms, objects, seed)
        try:
            sig = make_signature(text, mode)
        except Exception:
            continue
        if sig in seen:
            dup_hits += 1
            continue
        seen.add(sig)
        write_problem(out_dir, text, robots, rooms, objects, seed, generated + 1)
        generated += 1
        if generated % 50 == 0 or generated == count:
            print(f"Generated {generated}/{count} unique problems...")
    return generated


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate unique grippers problems (PDDL2)")
    parser.add_argument("--count", type=int, default=200, help="Number of problems")
    parser.add_argument("--target-dir", type=str, default="all_problems", help="Output directory")
    parser.add_argument("--robots", type=int, default=1, help="Number of robots")
    parser.add_argument("--rooms", type=int, default=3, help="Number of rooms")
    parser.add_argument("--objects", type=int, default=3, help="Number of balls")
    parser.add_argument("--seed", type=int, default=20250101, help="Base seed for uniqueness sampling")
    parser.add_argument("--uniqueness", choices=["isomorphic", "text"], default="isomorphic",
                        help="Uniqueness criterion: 'isomorphic' (structural) or 'text' (hash)")
    args = parser.parse_args()

    grippers_dir = Path(__file__).resolve().parent
    out_dir = Path(args.target_dir)
    if not out_dir.is_absolute():
        out_dir = grippers_dir / out_dir

    try:
        binary = ensure_built(grippers_dir)
    except Exception as e:
        print(f"ERROR: build failed: {e}")
        sys.exit(1)

    total = generate_unique(
        binary=binary,
        out_dir=out_dir,
        count=args.count,
        robots=args.robots,
        rooms=args.rooms,
        objects=args.objects,
        base_seed=args.seed,
        mode=args.uniqueness,
    )
    print(f"Done. Generated {total} unique problems in {out_dir}")


if __name__ == "__main__":
    main()


