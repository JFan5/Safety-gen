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


def generate_problem(binary: Path, seed: int, rovers: int, waypoints: int, objectives: int, cameras: int, goals: int, typed: bool = True, variant: str | None = None) -> bytes:
    args = [str(binary)]
    # seed first
    args.append(str(seed))
    # type/time options
    if not typed:
        args.append("-u")
    if variant == "numeric":
        args.append("-n")
    elif variant == "simple-time":
        args.append("-s")
    elif variant == "time":
        args.append("-t")
    # parameters
    args.extend([str(rovers), str(waypoints), str(objectives), str(cameras), str(goals)])
    proc = subprocess.run(args, capture_output=True, check=True)
    return proc.stdout


def main() -> None:
    repo_root = Path(__file__).resolve().parent
    binary = repo_root / "rovgen"
    out_dir = repo_root / "training_problems"
    ensure_dir(out_dir)

    # Collect existing unique hashes
    seen_hashes = set()
    existing_files = sorted(out_dir.glob("*.pddl"))
    for f in existing_files:
        seen_hashes.add(compute_hash(f.read_bytes()))

    target_unique = 1000

    # Ranges picked to resemble README examples and scale variety
    rover_range = range(1, 15)
    waypoint_range = range(4, 101)
    objective_range = range(2, 12)
    camera_range = range(1, 16)
    goals_range = range(3, 70)
    variants = [None]  # stick to STRIPS by default for domain compatibility

    # Next index for filename
    next_index = 1
    if existing_files:
        nums = [int(p.stem) for p in existing_files if p.stem.isdigit()]
        if nums:
            next_index = max(nums) + 1

    # Iterate seeds and parameters to produce many distinct instances
    seed = 1
    while len(seen_hashes) < target_unique:
        for variant in variants:
            for r in rover_range:
                for w in waypoint_range:
                    for o in objective_range:
                        for c in camera_range:
                            for g in goals_range:
                                if len(seen_hashes) >= target_unique:
                                    break
                                try:
                                    content = generate_problem(binary, seed, r, w, o, c, g, typed=True, variant=variant)
                                except subprocess.CalledProcessError as e:
                                    print(f"Error generating seed={seed} r={r} w={w} o={o} c={c} g={g}: {e}", file=sys.stderr)
                                    sys.exit(1)
                                h = compute_hash(content)
                                if h in seen_hashes:
                                    seed += 1
                                    continue
                                filename = f"{next_index:04d}.pddl"
                                (out_dir / filename).write_bytes(content)
                                seen_hashes.add(h)
                                print(f"Added {filename} seed={seed} r={r} w={w} o={o} c={c} g={g} total={len(seen_hashes)}/{target_unique}")
                                next_index += 1
                                seed += 1
                        if len(seen_hashes) >= target_unique:
                            break
                    if len(seen_hashes) >= target_unique:
                        break
                if len(seen_hashes) >= target_unique:
                    break
            if len(seen_hashes) >= target_unique:
                break
        # safety to prevent infinite loop if something goes wrong
        if seed > 10_000_000:
            print("Reached seed limit without enough unique instances.", file=sys.stderr)
            break

    if len(seen_hashes) < target_unique:
        print(f"Only {len(seen_hashes)} unique problems generated.", file=sys.stderr)
        sys.exit(2)


if __name__ == "__main__":
    main()



