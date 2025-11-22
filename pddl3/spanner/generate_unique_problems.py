#!/usr/bin/env python3

import os
import subprocess
import random
import hashlib
import argparse
from typing import Iterable, Optional, Set


def resolve_generator_path() -> str:
    here = os.path.dirname(os.path.abspath(__file__))
    return os.path.join(here, "spanner-generator.py")


def generate_problem(spanners: int, nuts: int, locations: int, seed: int, problem_name: str, output_file: str) -> bool:
    generator = resolve_generator_path()
    cmd = [
        "python3", generator,
        str(spanners), str(nuts), str(locations),
        "--seed", str(seed),
        "--problem-name", problem_name,
    ]

    try:
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        os.makedirs(os.path.dirname(output_file), exist_ok=True)
        with open(output_file, 'w') as f:
            f.write(f"; params: {' '.join(cmd)}\n")
            f.write(result.stdout)
        return True
    except subprocess.CalledProcessError as e:
        print(f"Error generating problem: {e}")
        return False


def get_problem_hash(file_path: str) -> str:
    with open(file_path, 'r') as f:
        content = f.read()
    return hashlib.md5(content.encode()).hexdigest()


def _iter_pddl_files(directory: str, recursive: bool = False) -> Iterable[str]:
    if not os.path.isdir(directory):
        return []
    if recursive:
        for root, _, files in os.walk(directory):
            for name in files:
                if name.endswith('.pddl'):
                    yield os.path.join(root, name)
    else:
        for name in os.listdir(directory):
            path = os.path.join(directory, name)
            if os.path.isfile(path) and name.endswith('.pddl'):
                yield path


def _load_existing_hashes(directory: str, recursive: bool = False) -> Set[str]:
    hashes: Set[str] = set()
    for file_path in _iter_pddl_files(directory, recursive=recursive):
        try:
            hashes.add(get_problem_hash(file_path))
        except Exception:
            continue
    return hashes


def _load_hashes_from_paths(paths: Iterable[str]) -> Set[str]:
    hashes: Set[str] = set()
    for path in paths:
        if not path:
            continue
        if os.path.isdir(path):
            hashes.update(_load_existing_hashes(path, recursive=True))
        elif os.path.isfile(path) and path.endswith('.pddl'):
            try:
                hashes.add(get_problem_hash(path))
            except Exception:
                continue
    return hashes


def generate_exact_problems(output_dir: str,
                            count: int,
                            spanners: int,
                            nuts: int,
                            locations: int,
                            base_seed: int = 42,
                            append: bool = False,
                            max_attempts: int = 100000,
                            unique_against: Optional[Iterable[str]] = None) -> int:
    if nuts > spanners:
        raise ValueError("'nuts' must be <= 'spanners'")

    print(f"Generating {count} problems for s={spanners}, n={nuts}, l={locations}...")
    os.makedirs(output_dir, exist_ok=True)

    rng = random.Random(base_seed)
    problem_hashes: Set[str] = set()
    if append:
        problem_hashes.update(_load_existing_hashes(output_dir))
    if unique_against:
        problem_hashes.update(_load_hashes_from_paths(unique_against))

    generated_count = 0
    attempts = 0

    while generated_count < count and attempts < max_attempts:
        attempts += 1
        seed = rng.randint(1, 2**31 - 1)
        problem_name = f"spanner-s{spanners}-n{nuts}-l{locations}-s{seed}"
        filename = f"{problem_name}.pddl"
        filepath = os.path.join(output_dir, filename)

        if generate_problem(spanners, nuts, locations, seed, problem_name, filepath):
            problem_hash = get_problem_hash(filepath)
            if problem_hash not in problem_hashes:
                problem_hashes.add(problem_hash)
                generated_count += 1
                if generated_count % 50 == 0 or generated_count == count:
                    print(f"Generated {generated_count}/{count} unique problems...")
            else:
                os.remove(filepath)

    if generated_count < count:
        print(f"Warning: requested {count}, generated {generated_count} unique problems after {attempts} attempts.")
    else:
        print(f"Generated {generated_count} unique problems.")
    return generated_count


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate Spanner problems with fixed parameters into a single directory")
    parser.add_argument("--output-dir", type=str, default="all_problems", help="Directory to write problems")
    parser.add_argument("--count", type=int, default=100, help="Number of problems to generate for the given parameters")
    parser.add_argument("--spanners", type=int, required=True, help="Exact number of spanners")
    parser.add_argument("--nuts", type=int, required=True, help="Exact number of nuts (<= spanners)")
    parser.add_argument("--locations", type=int, required=True, help="Exact number of locations")
    parser.add_argument("--seed", type=int, default=42, help="Base seed for randomness")
    parser.add_argument("--append", action="store_true", help="Append to existing directory (check uniqueness against existing files)")
    parser.add_argument("--max-attempts", type=int, default=100000, help="Maximum attempts to reach the requested unique count")
    parser.add_argument("--unique-against", nargs="*", default=[], help="One or more directories/files to enforce uniqueness against (recursively for directories)")
    args = parser.parse_args()

    random.seed(args.seed)

    generate_exact_problems(
        output_dir=args.output_dir,
        count=args.count,
        spanners=args.spanners,
        nuts=args.nuts,
        locations=args.locations,
        base_seed=args.seed,
        append=args.append,
        max_attempts=args.max_attempts,
        unique_against=args.unique_against,
    )

    print(f"\nSummary:")
    print(f"Problems written: {len([f for f in os.listdir(args.output_dir) if f.endswith('.pddl')])}")
