#!/usr/bin/env python3
"""
Organize planning_results JSON files into corresponding runs directories.

This tool:
1. Scans all JSON files in planning_results/
2. Extracts model_path from each JSON
3. Matches to runs by model_path in run.json
4. Copies evaluation results to runs/<run_id>/evals/
5. Moves unmatched results to planning_results/unknown/
"""

import os
import sys
import json
import shutil
import argparse
from pathlib import Path
from typing import Dict, List, Optional, Tuple
from collections import defaultdict


def build_model_path_index(runs_dir: Path) -> Dict[str, List[Path]]:
    """
    Build an index mapping model_path -> list of run directories.

    Returns:
        Dict mapping model_path (normalized) to list of run directory paths
    """
    index = defaultdict(list)

    for method_dir in runs_dir.iterdir():
        if not method_dir.is_dir():
            continue

        for run_dir in method_dir.iterdir():
            if not run_dir.is_dir():
                continue

            run_json = run_dir / "run.json"
            if not run_json.exists():
                continue

            try:
                with open(run_json) as f:
                    run_data = json.load(f)

                # Get model path from artifacts
                model_path = run_data.get("artifacts", {}).get("model_path")
                if model_path:
                    # Normalize path
                    normalized = normalize_model_path(model_path)
                    index[normalized].append(run_dir)

            except (json.JSONDecodeError, KeyError) as e:
                print(f"  Warning: Could not read {run_json}: {e}")

    return dict(index)


def normalize_model_path(path: str) -> str:
    """
    Normalize model path for matching.
    - Remove trailing slashes
    - Handle checkpoint subdirectories
    """
    if not path:
        return ""

    # Remove trailing slashes
    path = path.rstrip("/")

    # Return normalized path
    return path


def extract_model_path_from_eval(json_path: Path) -> Optional[str]:
    """Extract model_path from evaluation JSON file."""
    try:
        with open(json_path) as f:
            data = json.load(f)
        return data.get("model_path")
    except (json.JSONDecodeError, KeyError) as e:
        print(f"  Warning: Could not read {json_path}: {e}")
        return None


def find_matching_run(
    model_path: str,
    index: Dict[str, List[Path]]
) -> Optional[Path]:
    """
    Find a run that matches the given model_path.

    Tries multiple matching strategies:
    1. Exact match
    2. Match with checkpoint suffix removed
    3. Match as prefix/suffix
    """
    if not model_path:
        return None

    normalized = normalize_model_path(model_path)

    # Strategy 1: Exact match
    if normalized in index:
        return index[normalized][0]  # Return first match

    # Strategy 2: Check if model_path is a checkpoint of a run
    # e.g., /jfan5/grpo_models/mistral_7b-1214-stl-500/checkpoint-300
    if "/checkpoint-" in normalized:
        base_path = normalized.rsplit("/checkpoint-", 1)[0]
        if base_path in index:
            return index[base_path][0]

    # Strategy 3: Check if any run's model_path is a prefix of this path
    for run_path, run_dirs in index.items():
        if normalized.startswith(run_path) or run_path.startswith(normalized):
            return run_dirs[0]

    # Strategy 4: Match by model name (last component)
    model_name = os.path.basename(normalized)
    for run_path, run_dirs in index.items():
        if os.path.basename(run_path) == model_name:
            return run_dirs[0]

    return None


def copy_eval_to_run(
    eval_json: Path,
    run_dir: Path,
    dry_run: bool = False
) -> bool:
    """
    Copy evaluation JSON to run's evals/ directory.

    Returns:
        True if successful, False otherwise
    """
    evals_dir = run_dir / "evals"

    if dry_run:
        print(f"    [DRY RUN] Would copy to {evals_dir / eval_json.name}")
        return True

    try:
        evals_dir.mkdir(exist_ok=True)
        dest = evals_dir / eval_json.name
        shutil.copy2(eval_json, dest)
        return True
    except Exception as e:
        print(f"    Error copying {eval_json}: {e}")
        return False


def move_to_unknown(
    eval_json: Path,
    unknown_dir: Path,
    dry_run: bool = False
) -> bool:
    """
    Move evaluation JSON to unknown/ directory.

    Returns:
        True if successful, False otherwise
    """
    if dry_run:
        print(f"    [DRY RUN] Would move to {unknown_dir / eval_json.name}")
        return True

    try:
        unknown_dir.mkdir(exist_ok=True)
        dest = unknown_dir / eval_json.name
        shutil.move(str(eval_json), str(dest))
        return True
    except Exception as e:
        print(f"    Error moving {eval_json}: {e}")
        return False


def organize_planning_results(
    planning_results_dir: Path,
    runs_dir: Path,
    dry_run: bool = False,
    verbose: bool = False
) -> Dict[str, int]:
    """
    Main function to organize planning results.

    Returns:
        Statistics dict with counts
    """
    stats = {
        "total": 0,
        "matched": 0,
        "unmatched": 0,
        "errors": 0,
        "skipped_dirs": 0
    }

    # Build index of runs by model_path
    print("Building model path index from runs...")
    index = build_model_path_index(runs_dir)
    print(f"  Found {len(index)} unique model paths in runs")

    if verbose:
        print("\n  Model paths in index:")
        for path in sorted(index.keys())[:20]:
            print(f"    {path}")
        if len(index) > 20:
            print(f"    ... and {len(index) - 20} more")

    # Unknown directory
    unknown_dir = planning_results_dir / "unknown"

    # Track matches for summary
    matches = []
    unmatched = []

    # Process each JSON file
    print(f"\nProcessing JSON files in {planning_results_dir}...")

    json_files = list(planning_results_dir.glob("*.json"))
    print(f"  Found {len(json_files)} JSON files")

    for json_file in sorted(json_files):
        stats["total"] += 1

        if verbose:
            print(f"\n[{stats['total']}] {json_file.name}")

        # Extract model path
        model_path = extract_model_path_from_eval(json_file)
        if not model_path:
            stats["errors"] += 1
            if verbose:
                print(f"    No model_path found")
            continue

        if verbose:
            print(f"    model_path: {model_path}")

        # Find matching run
        run_dir = find_matching_run(model_path, index)

        if run_dir:
            stats["matched"] += 1
            matches.append((json_file.name, model_path, run_dir.name))

            if verbose:
                print(f"    Matched to: {run_dir.name}")

            # Copy to run's evals directory
            copy_eval_to_run(json_file, run_dir, dry_run)
        else:
            stats["unmatched"] += 1
            unmatched.append((json_file.name, model_path))

            if verbose:
                print(f"    No match found -> unknown/")

            # Move to unknown
            move_to_unknown(json_file, unknown_dir, dry_run)

    # Handle subdirectories (just count them)
    for item in planning_results_dir.iterdir():
        if item.is_dir() and item.name != "unknown":
            stats["skipped_dirs"] += 1

    # Print summary
    print("\n" + "=" * 60)
    print("SUMMARY")
    print("=" * 60)
    print(f"Total JSON files processed: {stats['total']}")
    print(f"  Matched to runs: {stats['matched']}")
    print(f"  Unmatched (-> unknown/): {stats['unmatched']}")
    print(f"  Errors: {stats['errors']}")
    print(f"  Subdirectories skipped: {stats['skipped_dirs']}")

    if dry_run:
        print("\n[DRY RUN MODE - No files were actually moved/copied]")

    # Show some unmatched examples
    if unmatched and verbose:
        print(f"\nUnmatched model paths (first 10):")
        for name, path in unmatched[:10]:
            print(f"  {path}")
            print(f"    -> {name}")

    return stats


def main():
    parser = argparse.ArgumentParser(
        description="Organize planning_results into corresponding runs directories"
    )
    parser.add_argument(
        "--planning_results_dir",
        type=Path,
        default=Path("planning_results"),
        help="Directory containing evaluation JSON files"
    )
    parser.add_argument(
        "--runs_dir",
        type=Path,
        default=Path("runs"),
        help="Directory containing organized runs"
    )
    parser.add_argument(
        "--dry_run",
        action="store_true",
        help="Show what would be done without making changes"
    )
    parser.add_argument(
        "--verbose", "-v",
        action="store_true",
        help="Show detailed output"
    )

    args = parser.parse_args()

    # Validate directories
    if not args.planning_results_dir.exists():
        print(f"Error: Planning results directory not found: {args.planning_results_dir}")
        sys.exit(1)

    if not args.runs_dir.exists():
        print(f"Error: Runs directory not found: {args.runs_dir}")
        sys.exit(1)

    print("=" * 60)
    print("Planning Results Organizer")
    print("=" * 60)
    print(f"Planning results: {args.planning_results_dir}")
    print(f"Runs directory: {args.runs_dir}")
    print(f"Dry run: {args.dry_run}")
    print("=" * 60)

    organize_planning_results(
        args.planning_results_dir,
        args.runs_dir,
        dry_run=args.dry_run,
        verbose=args.verbose
    )


if __name__ == "__main__":
    main()
