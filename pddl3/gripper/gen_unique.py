#!/usr/bin/env python3
import hashlib
import os
import subprocess
import sys
from pathlib import Path


def compute_hash(content: bytes) -> str:
    return hashlib.sha256(content).hexdigest()


def ensure_dir(path: Path) -> None:
    path.mkdir(parents=True, exist_ok=True)


def generate_problem(binary: Path, num_balls: int) -> bytes:
    # gripper takes -n <num>
    proc = subprocess.run([str(binary), "-n", str(num_balls)], capture_output=True, check=True)
    return proc.stdout


def main() -> None:
    repo_root = Path(__file__).resolve().parent
    binary = repo_root / "gripper"
    out_dir = repo_root / "training_problems"
    ensure_dir(out_dir)

    # Collect existing file hashes to avoid regenerating duplicates
    seen_hashes = set()
    existing_files = sorted(out_dir.glob("*.pddl"))
    for f in existing_files:
        data = f.read_bytes()
        seen_hashes.add(compute_hash(data))

    target_unique = 1000
    # The stock generator is deterministic given -n, so vary the number of balls
    # across a reasonable range to obtain distinct instances.
    # Start from 1 and increase; wrap around if needed but ensure uniqueness by hash.
    num_balls = 1

    # Determine next index for new files
    next_index = 1
    if existing_files:
        try:
            # filenames like 0001.pddl
            nums = [int(p.stem) for p in existing_files if p.stem.isdigit()]
            if nums:
                next_index = max(nums) + 1
        except Exception:
            pass

    while len(seen_hashes) < target_unique:
        try:
            content = generate_problem(binary, num_balls)
        except subprocess.CalledProcessError as e:
            print(f"Error generating with -n {num_balls}: {e}", file=sys.stderr)
            sys.exit(1)

        h = compute_hash(content)
        if h not in seen_hashes:
            filename = f"{next_index:04d}.pddl"
            (out_dir / filename).write_bytes(content)
            seen_hashes.add(h)
            next_index += 1
            print(f"Added {filename} (n={num_balls}) total={len(seen_hashes)}/{target_unique}")

        # Increase balls to explore new instances; after 10000, stop to avoid runaway
        num_balls += 1
        if num_balls > 10000:
            print("Reached num_balls limit without enough unique instances.", file=sys.stderr)
            break

    if len(seen_hashes) < target_unique:
        print(f"Only {len(seen_hashes)} unique problems generated.", file=sys.stderr)
        sys.exit(2)


if __name__ == "__main__":
    main()



