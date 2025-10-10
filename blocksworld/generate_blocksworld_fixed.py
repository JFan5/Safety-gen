#!/usr/bin/env python3
"""
Generate Blocksworld training_problems and testing_problems
- Uses existing generate_problems.py as base
- Ensures problems are unique by content hash within each set and across sets
- Problem filenames encode generation parameters: bw_ops<ops>_n<blocks>_seed<seed>.pddl
- Creates training_problems and testing_problems directories

Usage:
  python3 generate_blocksworld_fixed.py --train 1000 --test 100
  python3 generate_blocksworld_fixed.py --clean
"""

import argparse
import hashlib
import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path
from typing import List, Set

SCENARIO_DIR = Path(__file__).resolve().parent
TRAIN_DIR = SCENARIO_DIR / "training_problems"
TEST_DIR = SCENARIO_DIR / "testing_problems"

DEFAULT_TRAIN = 1000
DEFAULT_TEST = 100


def content_hash(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def filename_for(ops: int, blocks: int, seed: int) -> str:
    return f"bw_ops{ops}_n{blocks}_seed{seed}.pddl"


def run_generate_problems(ops_list: List[int], blocks_list: List[int], seeds_range: tuple, max_count: int, output_dir: str) -> int:
    """Run the existing generate_problems.py with specific parameters"""
    # Import the existing generate_problems function
    sys.path.insert(0, str(SCENARIO_DIR))
    from generate_problems import generate_problems
    
    # Save current directory and problem files
    original_problems_dir = SCENARIO_DIR / "problems"
    backup_dir = None
    if original_problems_dir.exists():
        backup_dir = SCENARIO_DIR / f"problems_backup_{os.getpid()}"
        shutil.move(str(original_problems_dir), str(backup_dir))
    
    try:
        # Generate problems to the problems directory
        generate_problems(
            ops_list=ops_list,
            num_blocks_list=blocks_list, 
            seeds_range=seeds_range,
            max_count=max_count
        )
        
        generated_count = 0
        for pddl_file in original_problems_dir.glob("*.pddl"):
            if pddl_file.stat().st_size > 0:  # Skip empty files
                generated_count += 1
        
        return generated_count
        
    finally:
        # Restore original problems directory
        if original_problems_dir.exists():
            shutil.rmtree(original_problems_dir)
        if backup_dir and backup_dir.exists():
            shutil.move(str(backup_dir), str(original_problems_dir))


def copy_and_rename_problems(source_dir: Path, target_dir: Path, ops_list: List[int], blocks_list: List[int], seeds_range: tuple, existing_hashes: Set[str]) -> tuple:
    """Copy problems from problems/ to target directory with parameter-based names"""
    target_dir.mkdir(parents=True, exist_ok=True)
    
    copied_count = 0
    new_hashes = set()
    seed = seeds_range[0]
    
    # Create mapping of ops and blocks combinations
    import itertools
    combinations = list(itertools.product(ops_list, blocks_list))
    combo_index = 0
    
    for pddl_file in sorted(source_dir.glob("*.pddl")):
        if pddl_file.stat().st_size == 0:  # Skip empty files
            continue
            
        try:
            content = pddl_file.read_bytes()
            content_hash = content_hash(content)
            
            # Skip if already exists
            if content_hash in existing_hashes or content_hash in new_hashes:
                continue
            
            # Get parameters for this file
            ops, blocks = combinations[combo_index % len(combinations)]
            combo_index += 1
            
            # Create new filename
            new_filename = filename_for(ops, blocks, seed)
            target_file = target_dir / new_filename
            
            # Copy file with new name
            target_file.write_bytes(content)
            print(f"生成了 {new_filename}")
            
            new_hashes.add(content_hash)
            copied_count += 1
            seed += 1
            
        except Exception as e:
            print(f"Error processing {pddl_file}: {e}")
            continue
    
    return copied_count, new_hashes


def clean_outputs():
    """Remove existing generated .pddl files"""
    for d in [TRAIN_DIR, TEST_DIR]:
        if d.exists():
            for p in d.glob("*.pddl"):
                try:
                    p.unlink()
                except Exception:
                    pass


def generate_set(out_dir: Path, target: int, ops_list: List[int], blocks_list: List[int], seeds_range: tuple, existing_hashes: set) -> tuple:
    """Generate a set of unique problems"""
    print(f"开始生成 {out_dir.name}，目标 {target} 个")
    
    # Calculate how many problems we need to generate
    # Use wider seed range to ensure uniqueness
    max_attempts = target * 10
    current_seeds = seeds_range
    
    # Try to generate enough unique problems
    temp_dir = SCENARIO_DIR / f"temp_problems_{os.getpid()}"
    temp_dir.mkdir(exist_ok=True)
    
    try:
        # Generate problems using existing script
        generated_count = run_generate_problems(ops_list, blocks_list, current_seeds, max_attempts, str(temp_dir))
        
        if generated_count == 0:
            print(f"Warning: No problems generated for {out_dir.name}")
            return 0, set()
        
        # Copy and rename with parameter-based names
        copied_count, new_hashes = copy_and_rename_problems(
            SCENARIO_DIR / "problems", 
            out_dir, 
            ops_list, 
            blocks_list, 
            current_seeds, 
            existing_hashes
        )
        
        print(f"  {out_dir.name}: {copied_count}/{target}")
        return copied_count, new_hashes
        
    finally:
        # Clean up temp directory
        if temp_dir.exists():
            shutil.rmtree(temp_dir)


def main():
    parser = argparse.ArgumentParser(description="Generate unique Blocksworld training/testing sets")
    parser.add_argument("--train", type=int, default=DEFAULT_TRAIN, help="number of training problems")
    parser.add_argument("--test", type=int, default=DEFAULT_TEST, help="number of testing problems") 
    parser.add_argument("--clean", action="store_true", help="remove existing .pddl files before generating")
    args = parser.parse_args()

    if args.clean:
        clean_outputs()

    # Training set parameters
    train_ops = [3, 4]
    train_blocks = [3, 4, 5, 6, 7, 8, 9, 10]
    train_seeds = (1, 100)

    # Testing set parameters  
    test_ops = [3, 4]
    test_blocks = [3, 4, 5, 6]
    test_seeds = (1001, 1100)

    print("Generating training_problems...")
    train_count, train_hashes = generate_set(
        TRAIN_DIR, args.train, train_ops, train_blocks, train_seeds, set()
    )
    
    if train_count < args.train:
        print(f"Warning: Only generated {train_count}/{args.train} training problems")
    
    print("Generating testing_problems...")
    test_count, test_hashes = generate_set(
        TEST_DIR, args.test, test_ops, test_blocks, test_seeds, train_hashes
    )
    
    if test_count < args.test:
        print(f"Warning: Only generated {test_count}/{args.test} testing problems")

    print("\nSummary:")
    print(f"  training_problems: {train_count}")
    print(f"  testing_problems:  {test_count}")
    print("  filenames: bw_ops<ops>_n<blocks>_seed<seed>.pddl")


if __name__ == "__main__":
    main()

