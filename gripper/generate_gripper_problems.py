#!/usr/bin/env python3
"""
Gripper problem generator (parameterized wrapper).

This script wraps the enhanced `gripper` generator binary to create one or
multiple PDDL problem instances and names files based on the input parameters.

Examples
--------
Generate one legacy instance (all balls from rooma -> roomb):
    python3 generate_gripper_problems.py -n 10

Generate 5 randomized instances with explicit naming and seeds:
    python3 generate_gripper_problems.py -n 12 -R 3 --init rand --goal rand \
        --count 5 --prefix gripper --build

Generate a custom distribution with single gripper and fixed seed:
    python3 generate_gripper_problems.py -n 8 -R 3 --cap 1 \
        --init r1:3,r2:5 --goal all@r3 --seed 12345

Notes
-----
- The `gripper` binary supports additional options documented in README.md.
- Filenames include a sanitized signature derived from parameters so you can
  recover generation settings from the filename itself.
"""

import argparse
import os
import subprocess
import sys
import time
from pathlib import Path


def run(cmd: list[str], cwd: Path | None = None) -> subprocess.CompletedProcess:
    return subprocess.run(cmd, cwd=str(cwd) if cwd else None, check=True, capture_output=True)


def ensure_binary(bindir: Path, build: bool) -> Path:
    binary = bindir / "gripper"
    if binary.exists() and os.access(binary, os.X_OK):
        return binary
    if not build:
        raise FileNotFoundError(
            f"gripper binary not found at {binary}. Run 'make' or pass --build.")
    # attempt to build via Makefile in bindir
    try:
        subprocess.run(["make"], cwd=str(bindir), check=True)
    except subprocess.CalledProcessError as e:
        raise RuntimeError(f"Failed to build gripper in {bindir}: {e}")
    if not binary.exists():
        raise FileNotFoundError(f"Build completed but {binary} not found")
    return binary


def sanitize_token(value: str) -> str:
    # keep alnum, @, -, _, and collapse others to '-'
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
                   index: int | None) -> str:
    parts: list[str] = [
        f"n{n}",
        f"R{rooms}",
        f"cap{cap}",
    ]
    parts.append(f"init-{sanitize_token(init_arg)}" if init_arg else "init-default")
    parts.append(f"goal-{sanitize_token(goal_arg)}" if goal_arg else "goal-default")
    if seed is not None:
        parts.append(f"seed{seed}")
    if index is not None:
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


def main(argv: list[str]) -> int:
    parser = argparse.ArgumentParser(description="Generate gripper PDDL problems with parameter-based filenames")
    parser.add_argument("-n", "--balls", type=int, required=True, help="number of balls (>=1)")
    parser.add_argument("-R", "--rooms", type=int, default=2, help="number of rooms (>=1)")
    parser.add_argument("--cap", type=int, default=2, choices=[1, 2], help="gripper capacity (1 or 2)")
    parser.add_argument("--init", dest="init_arg", type=str, default=None,
                        help="initial distribution: rand | rK:v,... (omit for default: all in rooma)")
    parser.add_argument("--goal", dest="goal_arg", type=str, default=None,
                        help="goal distribution: all@rK | rand | rK:v,... (omit for default: all to roomb)")
    parser.add_argument("--seed", type=int, default=None, help="RNG seed (uint); when omitted and rand used, auto varies per instance")
    parser.add_argument("-c", "--count", type=int, default=1, help="number of instances to generate")
    parser.add_argument("-o", "--out-dir", type=Path, default=Path("training_problems"), help="output directory")
    parser.add_argument("--prefix", type=str, default="gripper", help="filename prefix")
    parser.add_argument("--start-index", type=int, default=1, help="starting index for multi-instance naming")
    parser.add_argument("--build", action="store_true", help="build gripper binary if missing")
    parser.add_argument("--dry-run", action="store_true", help="print filenames and commands without writing files")

    args = parser.parse_args(argv)

    scenario_dir = Path(__file__).resolve().parent
    binary = ensure_binary(scenario_dir, build=args.build)

    # Ensure output directory exists
    args.out_dir.mkdir(parents=True, exist_ok=True)

    # Decide if we need to vary seeds automatically
    rand_used = (args.init_arg == 'rand') or (args.goal_arg == 'rand')
    base_seed = int(time.time()) & 0xFFFFFFFF

    # When generating multiple instances:
    # - If user provided --seed, we vary deterministically by +i-1 to avoid duplicates
    # - If no seed but rand is used, we auto-assign seeds based on base_seed + i
    # - If no randomness used, we keep seed=None across all (deterministic output)
    results: list[str] = []
    for i in range(args.count):
        index = args.start_index + i if args.count > 1 else None
        if args.seed is not None:
            seed_i = (int(args.seed) + i) & 0xFFFFFFFF
        elif rand_used:
            seed_i = (base_seed + i) & 0xFFFFFFFF
        else:
            seed_i = None

        filename = build_filename(
            prefix=args.prefix,
            n=args.balls,
            rooms=args.rooms,
            cap=args.cap,
            init_arg=args.init_arg,
            goal_arg=args.goal_arg,
            seed=seed_i,
            index=index,
        )
        out_path = args.out_dir / filename

        if args.dry_run:
            cmd_preview = ["./gripper", "-n", str(args.balls), "-R", str(args.rooms), "-cap", str(args.cap)]
            if seed_i is not None:
                cmd_preview += ["-seed", str(seed_i)]
            if args.init_arg:
                cmd_preview += ["-init", args.init_arg]
            if args.goal_arg:
                cmd_preview += ["-goal", args.goal_arg]
            print(f"WRITE {out_path}")
            print("CMD  ", " ".join(cmd_preview))
            results.append(str(out_path))
            continue

        try:
            data = generate_once(binary, args.balls, args.rooms, args.cap, args.init_arg, args.goal_arg, seed_i)
        except subprocess.CalledProcessError as e:
            sys.stderr.write(e.stderr.decode("utf-8", errors="ignore"))
            print(f"Error generating instance {i+1}: {e}", file=sys.stderr)
            return 2

        out_path.write_bytes(data)
        results.append(str(out_path))
        print(f"Wrote {out_path}")

    # Print a concise summary at the end
    print(f"Generated {len(results)} file(s) in {args.out_dir}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))


