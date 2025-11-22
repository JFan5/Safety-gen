#!/usr/bin/env python3
"""
Utility for generating (mostly) unique Grid problems for training/testing.

This script wraps the existing `generate.py` scenario generator so we can
request a batch of problems with consistent parameters, mirroring the helpers
found in other domains such as Grippers and Rovers.

Example:
  python3 generate_grid_training_unique.py --count 50 --x 5 --y 5 \\
      --shapes 3 --keys 4 --locks 4 --prob-goal 0.8 --seed-start 100
"""

from __future__ import annotations

import argparse
import hashlib
import subprocess
import sys
from pathlib import Path
from typing import Iterable, Optional, Sequence


SCENARIO_DIR = Path(__file__).resolve().parent
GENERATOR_SCRIPT = SCENARIO_DIR / "generate.py"
DEFAULT_OUTPUT = SCENARIO_DIR / "training_problems3"


def run(cmd: Sequence[str], cwd: Optional[Path] = None, timeout: Optional[int] = None) -> subprocess.CompletedProcess[str]:
    """Execute a subprocess and capture stdout/stderr."""
    return subprocess.run(
        list(cmd),
        cwd=str(cwd) if cwd else None,
        capture_output=True,
        text=True,
        timeout=timeout,
    )


def ensure_generator_script() -> None:
    """Sanity check for the underlying generator script."""
    if GENERATOR_SCRIPT.exists():
        return
    raise FileNotFoundError(f"Grid generator script missing: {GENERATOR_SCRIPT}")


def content_hash(data: bytes) -> str:
    """Stable hash for identifying duplicate problem instances."""
    return hashlib.sha256(data).hexdigest()


def seed_existing_hashes(out_dir: Path) -> set[str]:
    """Load hashes for already generated problems to avoid duplicates."""
    seen: set[str] = set()
    if not out_dir.exists():
        return seen
    for candidate in out_dir.glob("*.pddl"):
        try:
            seen.add(content_hash(candidate.read_bytes()))
        except OSError:
            continue
    return seen


def build_generator_command(
    *,
    x: int,
    y: int,
    shapes: int,
    keys: int,
    locks: int,
    prob_goal: float,
    seed: int,
    typed: bool,
) -> list[str]:
    """Assemble the command line for a single grid problem."""
    cmd: list[str] = [
        sys.executable,
        str(GENERATOR_SCRIPT),
        str(x),
        str(y),
        "--shapes",
        str(shapes),
        "--keys",
        str(keys),
        "--locks",
        str(locks),
        "--prob-goal",
        f"{prob_goal:.6f}",
        "--seed",
        str(seed),
    ]
    if typed:
        cmd.append("--typed")
    return cmd


def generate_problem_text(
    *,
    x: int,
    y: int,
    shapes: int,
    keys: int,
    locks: int,
    prob_goal: float,
    seed: int,
    typed: bool,
) -> bytes:
    """Invoke the generator script and return the emitted PDDL bytes."""
    cmd = build_generator_command(
        x=x,
        y=y,
        shapes=shapes,
        keys=keys,
        locks=locks,
        prob_goal=prob_goal,
        seed=seed,
        typed=typed,
    )
    result = run(cmd, cwd=SCENARIO_DIR, timeout=15)
    if result.returncode != 0:
        raise RuntimeError(
            "grid generator failed:\n"
            f"cmd: {' '.join(cmd)}\n"
            f"stdout:\n{result.stdout}\n"
            f"stderr:\n{result.stderr}"
        )
    stdout = result.stdout.strip()
    if not stdout:
        raise RuntimeError("grid generator produced empty output")
    return stdout.encode("utf-8")


def write_problem(
    out_dir: Path,
    *,
    x: int,
    y: int,
    shapes: int,
    keys: int,
    locks: int,
    seed: int,
    typed: bool,
    index: int,
    content: bytes,
) -> Path:
    """Persist the generated problem to disk with a descriptive filename."""
    suffix = "typed" if typed else "strips"
    filename = (
        f"grid_x{x}_y{y}_sh{shapes}_k{keys}_l{locks}_seed{seed}_{suffix}_{index:04d}.pddl"
    )
    out_path = out_dir / filename
    out_path.write_bytes(content)
    return out_path


def positive_float(value: str) -> float:
    """Parse a probability argument and validate it lies in (0, 1]."""
    try:
        parsed = float(value)
    except ValueError as exc:
        raise argparse.ArgumentTypeError(f"invalid float: {value}") from exc
    if parsed <= 0.0 or parsed > 1.0:
        raise argparse.ArgumentTypeError("probability must be in (0.0, 1.0]")
    return parsed


def parse_args(argv: Optional[Sequence[str]] = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Generate unique Grid problems.")
    parser.add_argument("--count", type=int, default=100, help="number of problems to generate (default: 100)")
    parser.add_argument("--seed-start", type=int, default=1, help="starting random seed (default: 1)")
    parser.add_argument("--x", type=int, default=4, help="grid width (>= 2)")
    parser.add_argument("--y", type=int, default=4, help="grid height (>= 2)")
    parser.add_argument("--shapes", type=int, default=2, help="number of key/lock shapes (default: 2)")
    parser.add_argument("--keys", type=int, default=4, help="number of keys (default: 4)")
    parser.add_argument("--locks", type=int, default=4, help="number of locks (default: 4)")
    parser.add_argument(
        "--prob-goal",
        type=positive_float,
        default=1.0,
        help="probability that any key appears in the goal (0.0 < p <= 1.0, default: 1.0)",
    )
    parser.add_argument("--typed", action="store_true", help="include --typed flag when invoking generator.py")
    parser.add_argument(
        "--out-dir",
        type=str,
        default=str(DEFAULT_OUTPUT),
        help="directory for generated problems (default: training_problems3)",
    )
    parser.add_argument(
        "--max-attempts",
        type=int,
        default=0,
        help="limit attempts to find unique problems (default: auto = 50 * count, min 1000)",
    )
    return parser.parse_args(argv)


def ensure_parameter_constraints(*, shapes: int, keys: int, locks: int) -> None:
    if shapes > keys:
        raise ValueError("--shapes cannot exceed --keys")
    if shapes > locks:
        raise ValueError("--shapes cannot exceed --locks")


def main(argv: Optional[Sequence[str]] = None) -> None:
    args = parse_args(argv)
    ensure_generator_script()
    ensure_parameter_constraints(shapes=args.shapes, keys=args.keys, locks=args.locks)

    if args.count <= 0:
        print("Nothing to do: --count <= 0")
        return

    out_dir = Path(args.out_dir)
    if not out_dir.is_absolute():
        out_dir = (SCENARIO_DIR / out_dir).resolve()
    out_dir.mkdir(parents=True, exist_ok=True)

    seen_hashes = seed_existing_hashes(out_dir)

    target = int(args.count)
    generated = 0
    attempts = 0
    max_attempts = args.max_attempts if args.max_attempts > 0 else max(target * 50, 1000)

    seed = int(args.seed_start)
    while generated < target and attempts < max_attempts:
        attempts += 1
        try:
            content = generate_problem_text(
                x=args.x,
                y=args.y,
                shapes=args.shapes,
                keys=args.keys,
                locks=args.locks,
                prob_goal=args.prob_goal,
                seed=seed,
                typed=args.typed,
            )
        except Exception:
            seed += 1
            continue

        h = content_hash(content)
        if h in seen_hashes:
            seed += 1
            continue
        seen_hashes.add(h)
        generated += 1
        write_problem(
            out_dir,
            x=args.x,
            y=args.y,
            shapes=args.shapes,
            keys=args.keys,
            locks=args.locks,
            seed=seed,
            typed=args.typed,
            index=generated,
            content=content,
        )
        if generated % 50 == 0 or generated == target:
            print(f"Generated {generated}/{target} unique problems...", flush=True)
        seed += 1

    if generated < target:
        raise RuntimeError(
            f"Failed to reach requested count. Generated {generated}/{target} unique problems "
            "before hitting max attempts. Consider adjusting --seed-start or parameters."
        )

    print(f"Done. Generated {generated} problems in {out_dir}")


if __name__ == "__main__":
    main()

