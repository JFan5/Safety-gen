#!/usr/bin/env python3
"""
Generate unique gripper problems for training and testing sets with no overlap.

This script wraps the local `gripper` binary directly and ensures that:
- Newly created training problems are unique among themselves
- Newly created testing problems are unique among themselves
- No duplicates exist across training and testing sets
- Existing .pddl files in the target directories are also considered to avoid
  re-generating duplicates

Filenames encode parameters so they do not clash with pre-existing numeric
files. We use prefixes `train` and `test` for clarity.
"""

from __future__ import annotations

import argparse
import hashlib
import os
import random
import subprocess
import sys
import time
from pathlib import Path


def compute_hash(content: bytes) -> str:
    return hashlib.sha256(content).hexdigest()


def ensure_binary(bindir: Path, build: bool) -> Path:
    binary = bindir / "gripper"
    if binary.exists() and os.access(binary, os.X_OK):
        return binary
    if not build:
        raise FileNotFoundError(
            f"gripper binary not found at {binary}. Run 'make' or pass --build.")
    subprocess.run(["make"], cwd=str(bindir), check=True)
    if not binary.exists():
        raise FileNotFoundError(f"Build completed but {binary} not found")
    return binary


def sanitize_token(value: str) -> str:
    out_chars: list[str] = []
    prev_dash = False
    for ch in value:
        if ch.isalnum() or ch in {'@', '-', '_'}:
            out_chars.append(ch)
            prev_dash = False
        else:
            if not prev_dash:
                out_chars.append('-')
                prev_dash = True
    sanitized = ''.join(out_chars).strip('-')
    return sanitized or 'x'


def build_filename(prefix: str,
                   n: int,
                   rooms: int,
                   cap: int,
                   init_arg: str | None,
                   goal_arg: str | None,
                   seed: int | None,
                   index: int) -> str:
    parts: list[str] = [
        f"n{n}", f"R{rooms}", f"cap{cap}",
        f"init-{sanitize_token(init_arg)}" if init_arg else "init-default",
        f"goal-{sanitize_token(goal_arg)}" if goal_arg else "goal-default",
    ]
    if seed is not None:
        parts.append(f"seed{seed}")
    parts.append(f"i{index:04d}")
    return f"{prefix}_{'_'.join(parts)}.pddl"


def generate_once(binary: Path,
                  n: int,
                  rooms: int,
                  cap: int,
                  init_arg: str | None,
                  goal_arg: str | None,
                  seed: int | None) -> bytes:
    cmd = [str(binary), "-n", str(n), "-R", str(rooms), "-cap", str(cap)]
    if seed is not None:
        cmd.extend(["-seed", str(seed)])
    if init_arg:
        cmd.extend(["-init", init_arg])
    if goal_arg:
        cmd.extend(["-goal", goal_arg])
    proc = subprocess.run(cmd, check=True, capture_output=True)
    return proc.stdout


def collect_existing_hashes(*dirs: Path) -> set[str]:
    seen: set[str] = set()
    for d in dirs:
        if not d.exists():
            continue
        for p in d.glob('*.pddl'):
            try:
                data = p.read_bytes()
                seen.add(compute_hash(data))
            except Exception:
                # skip unreadable
                pass
    return seen


def random_spec_counts(n: int, rooms: int) -> str:
    # Random explicit distribution rK:v ensuring sum == n
    parts = [0] * rooms
    for _ in range(n):
        parts[random.randrange(rooms)] += 1
    tokens = [f"r{k+1}:{v}" for k, v in enumerate(parts) if v > 0]
    return ','.join(tokens) if tokens else f"r1:{n}"


def param_sampler(iteration: int) -> tuple[int, int, int, str | None, str | None, int | None]:
    # Vary parameters across a broad space to maximize uniqueness
    # balls: 4..40, rooms: 2..6, capacity: 1 or 2
    n = random.randint(4, 40)
    rooms = random.randint(2, 6)
    cap = 2 if random.random() < 0.8 else 1

    # init: 50% rand, 30% explicit spec, 20% default
    r = random.random()
    if r < 0.5:
        init_arg = 'rand'
    elif r < 0.8:
        init_arg = random_spec_counts(n, rooms)
    else:
        init_arg = None

    # goal: 40% all@rK, 40% rand, 20% explicit spec
    r2 = random.random()
    if r2 < 0.4:
        goal_arg = f"all@r{random.randint(1, rooms)}"
    elif r2 < 0.8:
        goal_arg = 'rand'
    else:
        goal_arg = random_spec_counts(n, rooms)

    # seed if randomness used; otherwise sometimes still vary seed to alter prints
    uses_rand = (init_arg == 'rand') or (goal_arg == 'rand')
    seed = (random.getrandbits(32)) if uses_rand else None
    return n, rooms, cap, init_arg, goal_arg, seed


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description='Generate unique gripper training/testing sets without duplicates')
    ap.add_argument('--train', type=int, default=1000, help='number of training problems to create')
    ap.add_argument('--test', type=int, default=100, help='number of testing problems to create')
    ap.add_argument('--train-dir', type=Path, default=Path('training_problems'))
    ap.add_argument('--test-dir', type=Path, default=Path('testing_problems'))
    ap.add_argument('--build', action='store_true', help='build gripper binary if missing')
    ap.add_argument('--clean', action='store_true', help='delete existing .pddl files in train/test dirs before generating')
    ap.add_argument('--max-iters', type=int, default=100000, help='safety bound on attempts')
    ap.add_argument('--start-index', type=int, default=1, help='start index for new files (per set)')
    args = ap.parse_args(argv)

    scenario_dir = Path(__file__).resolve().parent
    binary = ensure_binary(scenario_dir, build=args.build)

    args.train_dir.mkdir(parents=True, exist_ok=True)
    args.test_dir.mkdir(parents=True, exist_ok=True)

    if args.clean:
        removed = 0
        for d in (args.train_dir, args.test_dir):
            for p in d.glob('*.pddl'):
                try:
                    p.unlink()
                    removed += 1
                except Exception:
                    pass
        print(f"Cleaned {removed} .pddl files from {args.train_dir} and {args.test_dir}")

    seen_hashes = collect_existing_hashes(args.train_dir, args.test_dir)

    created_train = 0
    created_test = 0
    idx_train = args.start_index
    idx_test = args.start_index

    # attempt loop
    attempts = 0
    while (created_train < args.train or created_test < args.test) and attempts < args.max_iters:
        attempts += 1
        n, rooms, cap, init_arg, goal_arg, seed = param_sampler(attempts)
        try:
            data = generate_once(binary, n, rooms, cap, init_arg, goal_arg, seed)
        except subprocess.CalledProcessError as e:
            # Skip problematic parameterizations
            continue
        h = compute_hash(data)
        if h in seen_hashes:
            continue

        # Decide which bucket to fill next: prioritize training until target met
        if created_train < args.train:
            name = build_filename('train', n, rooms, cap, init_arg, goal_arg, seed, idx_train)
            (args.train_dir / name).write_bytes(data)
            created_train += 1
            idx_train += 1
        else:
            name = build_filename('test', n, rooms, cap, init_arg, goal_arg, seed, idx_test)
            (args.test_dir / name).write_bytes(data)
            created_test += 1
            idx_test += 1
        seen_hashes.add(h)

        # Log occasionally
        if (created_train + created_test) % 50 == 0:
            print(f"Progress: train={created_train}/{args.train}, test={created_test}/{args.test}")

    if created_train < args.train or created_test < args.test:
        print(f"Stopped after {attempts} attempts. Created train={created_train}/{args.train}, test={created_test}/{args.test}", file=sys.stderr)
        return 2

    print(f"Created train={created_train}, test={created_test}")
    return 0


if __name__ == '__main__':
    raise SystemExit(main(sys.argv[1:]))


