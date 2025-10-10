#!/usr/bin/env python3

import os
import subprocess
import random
import hashlib
import argparse
from typing import Tuple, Set


def resolve_generator_path() -> str:
    """Return absolute path to spanner-generator.py regardless of CWD."""
    here = os.path.dirname(os.path.abspath(__file__))
    return os.path.join(here, "spanner-generator.py")


def generate_problem(spanners: int, nuts: int, locations: int, seed: int, problem_name: str, output_file: str) -> bool:
    """Generate a single problem using the spanner generator"""
    generator = resolve_generator_path()
    cmd = [
        "python3", generator,
        str(spanners), str(nuts), str(locations),
        "--seed", str(seed),
        "--problem-name", problem_name
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

def get_problem_hash(file_path):
    """Get hash of problem file content for duplicate detection"""
    with open(file_path, 'r') as f:
        content = f.read()
    return hashlib.md5(content.encode()).hexdigest()

def _load_existing_hashes(directory: str) -> Set[str]:
    hashes: Set[str] = set()
    if not os.path.isdir(directory):
        return hashes
    for name in os.listdir(directory):
        if name.endswith('.pddl'):
            try:
                hashes.add(get_problem_hash(os.path.join(directory, name)))
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
                            max_attempts: int = 100000) -> int:
    """Generate exactly 'count' problems for fixed parameters, ensuring uniqueness by content.

    If append is True, uniqueness is checked against existing files in output_dir as well.
    """
    if nuts > spanners:
        raise ValueError("'nuts' must be <= 'spanners'")

    print(f"Generating {count} problems for s={spanners}, n={nuts}, l={locations}...")
    os.makedirs(output_dir, exist_ok=True)

    rng = random.Random(base_seed)
    problem_hashes = _load_existing_hashes(output_dir) if append else set()

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

# The old range-based testing/training generation is removed in favor of exact-parameter generation.

def remove_duplicates_between_sets(training_dir: str, testing_dir: str) -> None:
    """Deprecated: kept for compatibility if needed by older scripts."""
    print("Checking for duplicates between training and testing sets...")
    
    # Get hashes of training problems
    training_hashes = set()
    for filename in os.listdir(training_dir):
        if filename.endswith('.pddl'):
            filepath = os.path.join(training_dir, filename)
            training_hashes.add(get_problem_hash(filepath))
    
    # Check testing problems against training
    duplicates_removed = 0
    testing_files = [f for f in os.listdir(testing_dir) if f.endswith('.pddl')]
    
    for filename in testing_files:
        filepath = os.path.join(testing_dir, filename)
        problem_hash = get_problem_hash(filepath)
        
        if problem_hash in training_hashes:
            os.remove(filepath)
            duplicates_removed += 1
            print(f"Removed duplicate testing problem: {filename}")
    
    # Generate additional testing problems to replace duplicates
    if duplicates_removed > 0:
        print(f"Generating {duplicates_removed} replacement testing problems...")
        # Simple parameter ranges for replacement
        spanners_range = (2, 5)
        nuts_range = (2, 5)
        locations_range = (3, 7)
        
        generated_count = 0
        problem_hashes = set()
        
        # Get existing testing hashes
        for filename in os.listdir(testing_dir):
            if filename.endswith('.pddl'):
                filepath = os.path.join(testing_dir, filename)
                problem_hashes.add(get_problem_hash(filepath))
        
        while generated_count < duplicates_removed:
            spanners = random.randint(spanners_range[0], spanners_range[1])
            nuts = random.randint(nuts_range[0], min(nuts_range[1], spanners))
            locations = random.randint(locations_range[0], locations_range[1])
            seed = random.randint(2000001, 3000000)
            
            problem_name = f"replacement_s{spanners}_n{nuts}_l{locations}_v{generated_count}"
            filename = f"{problem_name}.pddl"
            filepath = os.path.join(testing_dir, filename)
            
            if generate_problem(spanners, nuts, locations, seed, problem_name, filepath):
                problem_hash = get_problem_hash(filepath)
                if problem_hash not in problem_hashes and problem_hash not in training_hashes:
                    problem_hashes.add(problem_hash)
                    generated_count += 1
                else:
                    os.remove(filepath)
    
    print(f"Removed {duplicates_removed} duplicates and generated replacements")

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
    args = parser.parse_args()

    random.seed(args.seed)

    total = generate_exact_problems(
        output_dir=args.output_dir,
        count=args.count,
        spanners=args.spanners,
        nuts=args.nuts,
        locations=args.locations,
        base_seed=args.seed,
        append=args.append,
        max_attempts=args.max_attempts,
    )

    print(f"\nSummary:")
    print(f"Problems written: {len([f for f in os.listdir(args.output_dir) if f.endswith('.pddl')])}")
