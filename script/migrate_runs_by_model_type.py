#!/usr/bin/env python3
"""
Migration Script: Reorganize runs directory by model type.

Migrates runs from:
    runs/{method}/{run_id}/

To:
    runs/{model_type}/{method}/{run_id}/

Where model_type is one of: mistral, qwen3, llama31_8b, or unknown.

Usage:
    # Preview changes (dry run)
    python script/migrate_runs_by_model_type.py --dry-run

    # Move runs to new structure
    python script/migrate_runs_by_model_type.py

    # Copy instead of move (safer, keeps originals)
    python script/migrate_runs_by_model_type.py --copy

    # Specify custom runs directory
    python script/migrate_runs_by_model_type.py --runs-dir /path/to/runs
"""

import argparse
import json
import shutil
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple


# Import extract_model_type from run_manager
sys.path.insert(0, str(Path(__file__).parent))
from utils.run_manager import extract_model_type


# Directories to skip during migration
SKIP_DIRECTORIES = {"benchmark", "safepilot"}

# Method names (indicates old structure)
METHOD_NAMES = {"sft", "dpo", "grpo", "unknown"}


def detect_model_type_from_run(run_dir: Path) -> str:
    """
    Detect model type from a run directory.

    Tries:
    1. run.json -> model_type field
    2. run.json -> config.base_model -> extract_model_type()
    3. run_id parsing for model hints
    4. Falls back to "unknown"

    Args:
        run_dir: Path to run directory

    Returns:
        Model type string
    """
    run_json = run_dir / "run.json"

    if run_json.exists():
        try:
            with open(run_json) as f:
                run_data = json.load(f)

            # Check if model_type is already set
            if run_data.get("model_type"):
                return run_data["model_type"]

            # Try to extract from base_model
            base_model = run_data.get("config", {}).get("base_model")
            if base_model:
                model_type = extract_model_type(base_model)
                if model_type != "unknown":
                    return model_type

        except (json.JSONDecodeError, KeyError):
            pass

    # Try to infer from run_id
    run_id = run_dir.name.lower()
    if "mistral" in run_id:
        return "mistral"
    if "qwen" in run_id:
        return "qwen3"
    if "llama" in run_id:
        return "llama31_8b"

    return "unknown"


def find_runs_to_migrate(runs_dir: Path) -> List[Tuple[Path, str, str]]:
    """
    Find all runs in old structure that need migration.

    Args:
        runs_dir: Path to runs directory

    Returns:
        List of (run_dir, method, model_type) tuples
    """
    runs_to_migrate = []

    for method_dir in runs_dir.iterdir():
        if not method_dir.is_dir():
            continue

        method_name = method_dir.name

        # Skip special directories
        if method_name in SKIP_DIRECTORIES:
            continue

        # Only process old structure (method at first level)
        if method_name not in METHOD_NAMES:
            continue

        # This is old structure: runs/{method}/{run_id}
        for run_dir in method_dir.iterdir():
            if not run_dir.is_dir():
                continue

            # Skip if no run.json (not a valid run)
            if not (run_dir / "run.json").exists():
                continue

            model_type = detect_model_type_from_run(run_dir)
            runs_to_migrate.append((run_dir, method_name, model_type))

    return runs_to_migrate


def update_run_json_model_type(run_dir: Path, model_type: str) -> bool:
    """
    Update run.json with model_type field.

    Args:
        run_dir: Path to run directory
        model_type: Model type to set

    Returns:
        True if successful
    """
    run_json = run_dir / "run.json"
    if not run_json.exists():
        return False

    try:
        with open(run_json) as f:
            run_data = json.load(f)

        run_data["model_type"] = model_type

        with open(run_json, "w") as f:
            json.dump(run_data, f, indent=2, ensure_ascii=False)

        return True
    except Exception:
        return False


def migrate_run(
    run_dir: Path,
    method: str,
    model_type: str,
    runs_dir: Path,
    dry_run: bool = True,
    copy_mode: bool = False
) -> Optional[Path]:
    """
    Migrate a single run to new structure.

    Args:
        run_dir: Current run directory
        method: Training method (sft, dpo, grpo)
        model_type: Detected model type
        runs_dir: Root runs directory
        dry_run: If True, only print what would happen
        copy_mode: If True, copy instead of move

    Returns:
        New path if migrated, None on failure or dry run
    """
    # Build new path
    new_dir = runs_dir / model_type / method / run_dir.name

    if dry_run:
        action = "COPY" if copy_mode else "MOVE"
        print(f"  [{action}] {run_dir.relative_to(runs_dir)} -> {new_dir.relative_to(runs_dir)}")
        return None

    # Create parent directories
    new_dir.parent.mkdir(parents=True, exist_ok=True)

    # Handle conflicts
    if new_dir.exists():
        print(f"  [SKIP] Target already exists: {new_dir}")
        return None

    try:
        if copy_mode:
            shutil.copytree(run_dir, new_dir)
            print(f"  [COPIED] {run_dir.name} -> {new_dir.relative_to(runs_dir)}")
        else:
            shutil.move(str(run_dir), str(new_dir))
            print(f"  [MOVED] {run_dir.name} -> {new_dir.relative_to(runs_dir)}")

        # Update run.json with model_type
        update_run_json_model_type(new_dir, model_type)

        return new_dir

    except Exception as e:
        print(f"  [ERROR] Failed to migrate {run_dir.name}: {e}")
        return None


def cleanup_empty_directories(runs_dir: Path, dry_run: bool = True):
    """
    Remove empty method directories after migration.

    Args:
        runs_dir: Root runs directory
        dry_run: If True, only print what would happen
    """
    for method in METHOD_NAMES:
        method_dir = runs_dir / method
        if method_dir.exists() and method_dir.is_dir():
            # Check if empty (no subdirectories with run.json)
            has_runs = any(
                (d / "run.json").exists()
                for d in method_dir.iterdir()
                if d.is_dir()
            )
            if not has_runs:
                if dry_run:
                    print(f"  [REMOVE] Empty directory: {method_dir.relative_to(runs_dir)}")
                else:
                    try:
                        shutil.rmtree(method_dir)
                        print(f"  [REMOVED] Empty directory: {method_dir.relative_to(runs_dir)}")
                    except Exception as e:
                        print(f"  [ERROR] Failed to remove {method_dir}: {e}")


def main():
    parser = argparse.ArgumentParser(
        description="Migrate runs directory to model-type-based structure",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__
    )
    parser.add_argument(
        "--runs-dir",
        type=str,
        default="./runs",
        help="Root runs directory (default: ./runs)"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Preview changes without executing"
    )
    parser.add_argument(
        "--copy",
        action="store_true",
        help="Copy runs instead of moving (safer, keeps originals)"
    )
    parser.add_argument(
        "--no-cleanup",
        action="store_true",
        help="Don't remove empty method directories after migration"
    )
    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="Verbose output"
    )

    args = parser.parse_args()

    runs_dir = Path(args.runs_dir).resolve()
    if not runs_dir.exists():
        print(f"Error: Runs directory does not exist: {runs_dir}")
        sys.exit(1)

    print("=" * 70)
    print("Runs Migration: Reorganize by Model Type")
    print("=" * 70)
    print(f"Runs directory: {runs_dir}")
    print(f"Mode: {'DRY RUN (preview only)' if args.dry_run else ('COPY' if args.copy else 'MOVE')}")
    print()

    # Find runs to migrate
    runs_to_migrate = find_runs_to_migrate(runs_dir)

    if not runs_to_migrate:
        print("No runs found in old structure to migrate.")
        print("(Runs may already be in new structure or directory is empty)")
        sys.exit(0)

    # Group by model type for summary
    by_model_type: Dict[str, List[Tuple[Path, str]]] = {}
    for run_dir, method, model_type in runs_to_migrate:
        if model_type not in by_model_type:
            by_model_type[model_type] = []
        by_model_type[model_type].append((run_dir, method))

    # Print summary
    print(f"Found {len(runs_to_migrate)} runs to migrate:")
    for model_type in sorted(by_model_type.keys()):
        runs = by_model_type[model_type]
        print(f"  {model_type}: {len(runs)} runs")
        if args.verbose:
            for run_dir, method in runs:
                print(f"    - [{method}] {run_dir.name}")
    print()

    # Perform migration
    print("Migration plan:")
    migrated = 0
    failed = 0

    for run_dir, method, model_type in runs_to_migrate:
        result = migrate_run(
            run_dir=run_dir,
            method=method,
            model_type=model_type,
            runs_dir=runs_dir,
            dry_run=args.dry_run,
            copy_mode=args.copy
        )
        if result is not None:
            migrated += 1
        elif not args.dry_run:
            failed += 1

    print()

    # Cleanup empty directories
    if not args.no_cleanup:
        print("Cleanup:")
        cleanup_empty_directories(runs_dir, dry_run=args.dry_run)
        print()

    # Final summary
    if args.dry_run:
        print("=" * 70)
        print("DRY RUN COMPLETE - No changes made")
        print(f"Would migrate {len(runs_to_migrate)} runs")
        print("Run without --dry-run to execute migration")
        print("=" * 70)
    else:
        print("=" * 70)
        print("MIGRATION COMPLETE")
        print(f"Migrated: {migrated}")
        if failed > 0:
            print(f"Failed: {failed}")
        print("=" * 70)


if __name__ == "__main__":
    main()
