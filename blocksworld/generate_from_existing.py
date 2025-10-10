#!/usr/bin/env python3
"""
Generate Blocksworld training_problems and testing_problems from existing problems
- Uses existing problem files from testing_problems3/ and other directories
- Ensures problems are unique by content hash
- Problem filenames encode generation parameters: bw_ops<ops>_n<blocks>_seed<seed>.pddl

Usage:
  python3 generate_from_existing.py --train 1000 --test 100
  python3 generate_from_existing.py --clean
"""

import argparse
import hashlib
import os
import random
import shutil
from pathlib import Path
from typing import List, Set, Tuple

SCENARIO_DIR = Path(__file__).resolve().parent
TRAIN_DIR = SCENARIO_DIR / "training_problems"
TEST_DIR = SCENARIO_DIR / "testing_problems"

DEFAULT_TRAIN = 1000
DEFAULT_TEST = 100


def content_hash(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def filename_for(ops: int, blocks: int, seed: int) -> str:
    return f"bw_ops{ops}_n{blocks}_seed{seed}.pddl"


def find_existing_problems() -> List[Path]:
    """Find all existing PDDL problem files"""
    problem_files = []
    
    # Search in various directories
    search_dirs = [
        SCENARIO_DIR / "testing_problems3",
        SCENARIO_DIR / "testing_problems", 
        SCENARIO_DIR / "training_problems3",
        SCENARIO_DIR / "training_problems",
        SCENARIO_DIR / "problems",
        SCENARIO_DIR / "3ops" / "2pddl",
        SCENARIO_DIR / "4ops" / "2pddl"
    ]
    
    for search_dir in search_dirs:
        if search_dir.exists():
            for pddl_file in search_dir.glob("*.pddl"):
                if pddl_file.stat().st_size > 0:  # Skip empty files
                    problem_files.append(pddl_file)
    
    return problem_files


def extract_params_from_filename(filename: str) -> Tuple[int, int, int]:
    """Extract parameters from filename or generate random ones"""
    # Try to extract from existing naming patterns
    parts = filename.replace('.pddl', '').split('_')
    
    # Default parameters
    ops = random.choice([3, 4])
    blocks = random.randint(3, 10)
    seed = random.randint(1, 100000)
    
    # Try to extract meaningful parameters
    for part in parts:
        if part.isdigit():
            num = int(part)
            if 2 <= num <= 10:
                blocks = num
            elif num > 100:
                seed = num
    
    return ops, blocks, seed


def generate_set(out_dir: Path, target: int, existing_problems: List[Path], used_hashes: Set[str], start_index: int) -> Tuple[int, Set[str]]:
    """Generate a set of unique problems from existing files"""
    out_dir.mkdir(parents=True, exist_ok=True)
    
    new_hashes = set()
    copied_count = 0
    problem_index = start_index
    
    # Shuffle problems for variety
    shuffled_problems = existing_problems.copy()
    random.shuffle(shuffled_problems)
    
    print(f"开始生成 {out_dir.name}，目标 {target} 个")
    
    for pddl_file in shuffled_problems:
        if copied_count >= target:
            break
            
        try:
            content = pddl_file.read_bytes()
            content_hash_val = content_hash(content)
            
            # Skip if already used
            if content_hash_val in used_hashes or content_hash_val in new_hashes:
                continue
            
            # Extract/generate parameters
            ops, blocks, seed = extract_params_from_filename(pddl_file.name)
            
            # Create new filename
            new_filename = filename_for(ops, blocks, seed + problem_index)
            target_file = out_dir / new_filename
            
            # Copy file with new name
            target_file.write_bytes(content)
            print(f"生成了 {new_filename}")
            
            new_hashes.add(content_hash_val)
            copied_count += 1
            problem_index += 1
            
            if copied_count % 100 == 0:
                print(f"  {out_dir.name}: {copied_count}/{target}")
                
        except Exception as e:
            print(f"Error processing {pddl_file}: {e}")
            continue
    
    print(f"  {out_dir.name}: {copied_count}/{target} completed")
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


def main():
    parser = argparse.ArgumentParser(description="Generate unique Blocksworld training/testing sets from existing problems")
    parser.add_argument("--train", type=int, default=DEFAULT_TRAIN, help="number of training problems")
    parser.add_argument("--test", type=int, default=DEFAULT_TEST, help="number of testing problems")
    parser.add_argument("--clean", action="store_true", help="remove existing .pddl files before generating")
    args = parser.parse_args()

    if args.clean:
        clean_outputs()

    # Find existing problems
    existing_problems = find_existing_problems()
    print(f"Found {len(existing_problems)} existing problem files")
    
    if len(existing_problems) == 0:
        print("No existing problem files found!")
        return
    
    # Set random seed for reproducibility
    random.seed(42)
    
    print("Generating training_problems...")
    train_count, train_hashes = generate_set(
        TRAIN_DIR, args.train, existing_problems, set(), 0
    )
    
    print("Generating testing_problems...")
    test_count, test_hashes = generate_set(
        TEST_DIR, args.test, existing_problems, train_hashes, 1000
    )

    print("\nSummary:")
    print(f"  training_problems: {train_count}")
    print(f"  testing_problems:  {test_count}")
    print("  filenames: bw_ops<ops>_n<blocks>_seed<seed>.pddl")
    print(f"  source problems: {len(existing_problems)}")


if __name__ == "__main__":
    main()

