#!/usr/bin/env python3
"""
Generate unique Rover training problems by wrapping the native `rovgen` binary.

Usage example:
  python3 generate_rovers_training_unique.py --count 50 --rovers 2 --waypoints 6 \\
      --objectives 3 --cameras 2 --goals 4 --seed-start 100

The script guarantees uniqueness via SHA256 hashing, automatically builds the
generator if needed, and saves instances in `training_problems/` by default.
"""

from __future__ import annotations

import argparse
import hashlib
import subprocess
from pathlib import Path
from typing import Optional

SCENARIO_DIR = Path(__file__).resolve().parent
GENERATOR_BIN = SCENARIO_DIR / "rovgen"
DEFAULT_OUTPUT = SCENARIO_DIR / "training_problems"


def run(cmd: list[str], cwd: Optional[Path] = None, timeout: Optional[int] = None) -> subprocess.CompletedProcess[str]:
    """Run a subprocess, capturing stdout/stderr."""
    return subprocess.run(
        cmd,
        cwd=str(cwd) if cwd else None,
        capture_output=True,
        text=True,
        timeout=timeout,
    )


def ensure_generator() -> None:
    """Build the rover generator binary if it is missing."""
    if GENERATOR_BIN.exists():
        return
    result = run(["make"], cwd=SCENARIO_DIR)
    if result.returncode != 0 or not GENERATOR_BIN.exists():
        raise RuntimeError(
            "Failed to build rovgen with make.\n"
            f"stdout:\n{result.stdout}\n"
            f"stderr:\n{result.stderr}"
        )


def content_hash(data: bytes) -> str:
    """Return a stable SHA256 hash for the given content."""
    return hashlib.sha256(data).hexdigest()


def build_command(
    seed: int,
    rovers: int,
    waypoints: int,
    objectives: int,
    cameras: int,
    goals: int,
    typed: bool,
    variant: str,
) -> list[str]:
    """Construct the command line for rovgen."""
    cmd = [str(GENERATOR_BIN), str(seed)]
    if not typed:
        cmd.append("-u")
    if variant == "numeric":
        cmd.append("-n")
    elif variant == "simple-time":
        cmd.append("-s")
    elif variant == "time":
        cmd.append("-t")
    cmd.extend(
        [
            str(rovers),
            str(waypoints),
            str(objectives),
            str(cameras),
            str(goals),
        ]
    )
    return cmd


def generate_problem(
    seed: int,
    rovers: int,
    waypoints: int,
    objectives: int,
    cameras: int,
    goals: int,
    typed: bool,
    variant: str,
) -> bytes:
    """Invoke rovgen and return the generated problem as bytes."""
    cmd = build_command(seed, rovers, waypoints, objectives, cameras, goals, typed, variant)
    result = run(cmd, cwd=SCENARIO_DIR, timeout=20)
    if result.returncode != 0 or not result.stdout.strip():
        raise RuntimeError(
            "rovgen failed:\n"
            f"cmd: {' '.join(cmd)}\n"
            f"stdout:\n{result.stdout}\n"
            f"stderr:\n{result.stderr}"
        )
    return result.stdout.encode()


def variant_suffix(typed: bool, variant: str) -> str:
    """Build a suffix for filenames capturing variant details."""
    parts: list[str] = []
    if not typed:
        parts.append("untyped")
    if variant != "strips":
        parts.append(variant.replace("-", ""))
    return ("_" + "_".join(parts)) if parts else ""


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate unique Rover training problems.")
    parser.add_argument("--count", type=int, default=100, help="number of problems to generate (default: 100)")
    parser.add_argument("--seed-start", type=int, default=1, help="seed offset for rovgen (default: 1)")
    parser.add_argument("--rovers", type=int, default=1, help="number of rovers (default: 1)")
    parser.add_argument("--waypoints", type=int, default=6, help="number of waypoints (default: 6)")
    parser.add_argument("--objectives", type=int, default=2, help="number of objectives (default: 2)")
    parser.add_argument("--cameras", type=int, default=2, help="number of cameras (default: 2)")
    parser.add_argument("--goals", type=int, default=3, help="number of goals requests (default: 3)")
    parser.add_argument(
        "--variant",
        choices=["strips", "numeric", "simple-time", "time"],
        default="strips",
        help="rovgen variant (default: strips)",
    )
    parser.add_argument(
        "--untyped",
        action="store_true",
        help="generate untyped problems (default: typed)",
    )
    parser.add_argument(
        "--out-dir",
        type=str,
        default=str(DEFAULT_OUTPUT),
        help="output directory for generated problems (default: training_problems)",
    )
    parser.add_argument(
        "--max-attempts",
        type=int,
        default=0,
        help="cap on attempts to find unique problems (default: 0 -> auto)",
    )
    args = parser.parse_args()

    if args.count <= 0:
        print("Nothing to do: --count <= 0")
        return

    ensure_generator()

    out_dir = Path(args.out_dir)
    if not out_dir.is_absolute():
        out_dir = (SCENARIO_DIR / out_dir).resolve()
    out_dir.mkdir(parents=True, exist_ok=True)

    seen_hashes: set[str] = set()
    for problem in out_dir.glob("*.pddl"):
        try:
            seen_hashes.add(content_hash(problem.read_bytes()))
        except OSError:
            continue

    target = args.count
    seed = args.seed_start
    generated = 0
    attempts = 0
    max_attempts = args.max_attempts if args.max_attempts > 0 else max(target * 50, 1000)
    suffix = variant_suffix(not args.untyped, args.variant)
    base = (
        f"rover{args.rovers}_"
        f"waypoint{args.waypoints}_"
        f"objective{args.objectives}_"
        f"camera{args.cameras}_"
        f"goal{args.goals}"
    )

    while generated < target and attempts < max_attempts:
        attempts += 1
        try:
            data = generate_problem(
                seed=seed,
                rovers=args.rovers,
                waypoints=args.waypoints,
                objectives=args.objectives,
                cameras=args.cameras,
                goals=args.goals,
                typed=not args.untyped,
                variant=args.variant,
            )
        except Exception:
            seed += 1
            continue

        digest = content_hash(data)
        if digest in seen_hashes:
            seed += 1
            continue

        filename = f"{base}{suffix}_seed{seed}.pddl"
        out_path = out_dir / filename
        # Avoid accidental overwrite when reusing seeds under different settings
        if out_path.exists():
            counter = 1
            stem = out_path.stem
            while out_path.exists():
                out_path = out_dir / f"{stem}_dup{counter}.pddl"
                counter += 1

        out_path.write_bytes(data)
        seen_hashes.add(digest)
        generated += 1
        seed += 1
        print(f"生成进度: {generated}/{target}")

    if generated < target:
        raise RuntimeError(
            f"Only generated {generated}/{target} unique rover problems. "
            "Consider adjusting seeds or problem parameters."
        )

    print(f"Generated {generated} unique rover problems in {out_dir}")


if __name__ == "__main__":
    main()

