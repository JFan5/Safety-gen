#!/usr/bin/env python3
"""
Helper for producing batches of (mostly) unique Zenotravel problems.

The script wraps the native ``ztravel`` generator, mirroring the workflow used
in other scenarios (e.g., Grippers, Rovers). Problems are deduplicated by
SHA256 hash to avoid accidental repeats when sampling seeds.

Example:
  python3 generate_zenotravel_training_unique.py --count 50 --cities 4 --planes 2 \\
      --people 5 --distance 150 --variant time --seed-start 500
"""

from __future__ import annotations

import argparse
import hashlib
import subprocess
import sys
from pathlib import Path
from typing import Optional, Sequence


SCENARIO_DIR = Path(__file__).resolve().parent
GENERATOR_BIN = SCENARIO_DIR / "ztravel"
DEFAULT_OUTPUT = SCENARIO_DIR / "training_problems3"


def run(cmd: Sequence[str], cwd: Optional[Path] = None, timeout: Optional[int] = None) -> subprocess.CompletedProcess[str]:
    """Run a subprocess, capturing stdout/stderr."""
    return subprocess.run(
        list(cmd),
        cwd=str(cwd) if cwd else None,
        capture_output=True,
        text=True,
        timeout=timeout,
    )


def ensure_generator() -> Path:
    """Build the ztravel generator if needed."""
    if GENERATOR_BIN.exists() and GENERATOR_BIN.is_file() and GENERATOR_BIN.stat().st_mode & 0o111:
        return GENERATOR_BIN
    result = run(["make"], cwd=SCENARIO_DIR)
    if result.returncode != 0 or not GENERATOR_BIN.exists():
        raise RuntimeError(
            "Failed to build ztravel generator.\n"
            f"stdout:\n{result.stdout}\n"
            f"stderr:\n{result.stderr}"
        )
    GENERATOR_BIN.chmod(GENERATOR_BIN.stat().st_mode | 0o111)
    return GENERATOR_BIN


def content_hash(data: bytes) -> str:
    """Return a stable content hash for deduplication."""
    return hashlib.sha256(data).hexdigest()


def seed_existing(out_dir: Path) -> set[str]:
    """Collect hashes of existing problems in the output directory."""
    seen: set[str] = set()
    if not out_dir.exists():
        return seen
    for problem in out_dir.glob("*.pddl"):
        try:
            seen.add(content_hash(problem.read_bytes()))
        except OSError:
            continue
    return seen


VARIANT_FLAGS = {
    "strips": None,
    "numeric": "-n",
    "simple-time": "-s",
    "time": "-t",
    "complex": "-c",
}


def build_command(
    *,
    variant: str,
    untyped: bool,
    seed: int,
    cities: int,
    planes: int,
    people: int,
    distance: int,
) -> list[str]:
    """Build the ztravel invocation."""
    flag = VARIANT_FLAGS[variant]
    cmd: list[str] = [str(GENERATOR_BIN)]
    if flag:
        cmd.append(flag)
    if untyped:
        cmd.append("-u")
    cmd.extend(
        [
            str(seed),
            str(cities),
            str(planes),
            str(people),
        ]
    )
    if distance > 0:
        cmd.append(str(distance))
    return cmd


def generate_problem(
    *,
    variant: str,
    untyped: bool,
    seed: int,
    cities: int,
    planes: int,
    people: int,
    distance: int,
) -> bytes:
    """Invoke ztravel and return stdout bytes."""
    cmd = build_command(
        variant=variant,
        untyped=untyped,
        seed=seed,
        cities=cities,
        planes=planes,
        people=people,
        distance=distance,
    )
    result = run(cmd, cwd=SCENARIO_DIR, timeout=15)
    if result.returncode != 0:
        raise RuntimeError(
            "ztravel failed:\n"
            f"cmd: {' '.join(cmd)}\n"
            f"stdout:\n{result.stdout}\n"
            f"stderr:\n{result.stderr}"
        )
    stdout = result.stdout.strip()
    if not stdout:
        raise RuntimeError("ztravel produced empty output")
    return stdout.encode("utf-8")


def write_problem(
    out_dir: Path,
    *,
    variant: str,
    untyped: bool,
    seed: int,
    cities: int,
    planes: int,
    people: int,
    index: int,
    content: bytes,
) -> Path:
    """Persist generated content with a descriptive filename."""
    suffix_parts = [variant.replace("-", "")]
    if untyped:
        suffix_parts.append("untyped")
    suffix = "_".join(suffix_parts)
    filename = (
        f"zenotravel_c{cities}_pl{planes}_pe{people}_seed{seed}_{suffix}_{index:04d}.pddl"
    )
    out_path = out_dir / filename
    out_path.write_bytes(content)
    return out_path


def positive_int(value: str) -> int:
    parsed = int(value)
    if parsed <= 0:
        raise argparse.ArgumentTypeError("value must be positive")
    return parsed


def non_negative_int(value: str) -> int:
    parsed = int(value)
    if parsed < 0:
        raise argparse.ArgumentTypeError("value must be >= 0")
    return parsed


def parse_args(argv: Optional[Sequence[str]] = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Generate unique Zenotravel problems.")
    parser.add_argument("--count", type=positive_int, default=100, help="target number of problems (default: 100)")
    parser.add_argument("--seed-start", type=int, default=1, help="initial seed value (default: 1)")
    parser.add_argument("--cities", type=positive_int, default=3, help="number of cities (default: 3)")
    parser.add_argument("--planes", type=positive_int, default=1, help="number of planes (default: 1)")
    parser.add_argument("--people", type=positive_int, default=2, help="number of people (default: 2)")
    parser.add_argument("--distance", type=non_negative_int, default=100, help="distance upper bound (default: 100, 0 disables random distances)")
    parser.add_argument(
        "--variant",
        choices=tuple(VARIANT_FLAGS.keys()),
        default="strips",
        help="domain variant flag for ztravel (default: strips)",
    )
    parser.add_argument(
        "--untyped",
        action="store_true",
        help="pass -u to ztravel to disable typing",
    )
    parser.add_argument(
        "--out-dir",
        type=str,
        default=str(DEFAULT_OUTPUT),
        help="output directory for generated problems (default: training_problems3)",
    )
    parser.add_argument(
        "--max-attempts",
        type=int,
        default=0,
        help="limit attempts to find unique problems (default: auto = 50 * count, min 1000)",
    )
    return parser.parse_args(argv)


def main(argv: Optional[Sequence[str]] = None) -> None:
    args = parse_args(argv)

    generator = ensure_generator()

    if args.cities < 2:
        raise ValueError("--cities must be at least 2")
    if args.planes > args.cities * 2:
        print("Warning: planes count is quite high relative to cities; uniqueness may suffer.", file=sys.stderr)
    if args.people > args.cities * 4:
        print("Warning: people count is quite high relative to cities; uniqueness may suffer.", file=sys.stderr)

    out_dir = Path(args.out_dir)
    if not out_dir.is_absolute():
        out_dir = (SCENARIO_DIR / out_dir).resolve()
    out_dir.mkdir(parents=True, exist_ok=True)

    seen_hashes = seed_existing(out_dir)

    target = args.count
    generated = 0
    attempts = 0
    max_attempts = args.max_attempts if args.max_attempts > 0 else max(target * 50, 1000)
    seed = args.seed_start

    while generated < target and attempts < max_attempts:
        attempts += 1
        try:
            content = generate_problem(
                variant=args.variant,
                untyped=args.untyped,
                seed=seed,
                cities=args.cities,
                planes=args.planes,
                people=args.people,
                distance=args.distance,
            )
        except Exception:
            seed += 1
            continue

        digest = content_hash(content)
        if digest in seen_hashes:
            seed += 1
            continue
        seen_hashes.add(digest)

        generated += 1
        write_problem(
            out_dir,
            variant=args.variant,
            untyped=args.untyped,
            seed=seed,
            cities=args.cities,
            planes=args.planes,
            people=args.people,
            index=generated,
            content=content,
        )
        if generated % 50 == 0 or generated == target:
            print(f"Generated {generated}/{target} unique problems...", flush=True)
        seed += 1

    if generated < target:
        raise RuntimeError(
            f"Generated {generated}/{target} problems before hitting max attempts. "
            "Try adjusting seeds or parameters."
        )

    print(f"Done. Generated {generated} problems in {out_dir}")


if __name__ == "__main__":
    main()

