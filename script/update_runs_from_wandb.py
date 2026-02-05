#!/usr/bin/env python3
"""
Runs Ledger Update Tool - Update run.json with wandb info and organize by method.

This tool:
1. Reads existing runs/<run_id>/run.json
2. Fetches additional info from wandb API
3. Discovers and confirms model paths on local filesystem
4. Verifies dataset paths
5. Reorganizes runs by method (sft/dpo/grpo/unknown)

Usage:
    python tools/update_runs_from_wandb.py --runs_dir ./runs
    python tools/update_runs_from_wandb.py --runs_dir ./runs --dry_run
"""

import argparse
import json
import os
import re
import shutil
import sys
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

try:
    import wandb
except ImportError:
    print("Error: wandb package not found. Install with: pip install wandb")
    sys.exit(1)


# =============================================================================
# Constants
# =============================================================================

MODEL_ROOT_DIRS = {
    'grpo': '/jfan5/grpo_models',
    'sft': '/jfan5/sft_models',
    'dpo': '/jfan5/dpo_models',
}

# Config fields that might contain model output path
MODEL_PATH_FIELDS = [
    'output_dir',
    'model_path',
    'save_dir',
    'ckpt_path',
    'checkpoint_dir',
    'save_path',
    'model_output_dir',
]

# Config fields that might contain dataset path
DATASET_PATH_FIELDS = [
    'dataset_path',
    'data_path',
    'train_file',
    'data_dir',
    'train_data_path',
    'training_data',
    'dataset',
    'data_files',
]

DATASET_ID_FIELDS = [
    'dataset_id',
    'dataset_version',
    'data_version',
    'dataset_name',
]

# CLI arg names that contain model output path
MODEL_PATH_ARGS = [
    '--output_dir', '--output', '-o',
    '--model_path', '--save_dir', '--checkpoint_dir',
]

# CLI arg names that contain dataset path
DATASET_PATH_ARGS = [
    '--dataset', '--data', '--train_file', '--data_path',
    '--dataset_path', '--train_data',
]

# CLI arg names that contain base model
BASE_MODEL_ARGS = [
    '--base_model', '--model', '--model_name_or_path',
]


# =============================================================================
# Data Classes
# =============================================================================

@dataclass
class UpdateStats:
    """Statistics for the update operation."""
    total_runs: int = 0
    method_confirmed: Dict[str, int] = field(default_factory=lambda: {'sft': 0, 'dpo': 0, 'grpo': 0, 'unknown': 0})
    model_path_confirmed: int = 0
    model_path_unknown: int = 0
    dataset_path_confirmed: int = 0
    dataset_path_relative: int = 0
    dataset_path_unknown: int = 0
    wandb_fetch_success: int = 0
    wandb_fetch_failed: int = 0
    moved_to_unknown: int = 0
    unknown_reasons: Dict[str, int] = field(default_factory=dict)


# =============================================================================
# Helper Functions
# =============================================================================

def safe_load_json(path: Path) -> Optional[Dict]:
    """Safely load JSON file."""
    try:
        with open(path, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception as e:
        print(f"  Warning: Failed to load {path}: {e}")
        return None


def backup_and_save_json(path: Path, data: Dict) -> bool:
    """Backup existing file and save new data."""
    try:
        # Backup existing file
        if path.exists():
            backup_path = path.with_suffix('.json.bak')
            shutil.copy2(path, backup_path)

        # Save new data
        with open(path, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2, ensure_ascii=False, default=str)
        return True
    except Exception as e:
        print(f"  Error saving {path}: {e}")
        return False


def parse_wandb_config(config_data) -> Dict[str, Any]:
    """Parse W&B config which may be a dict, JSON string, or other format."""
    if config_data is None:
        return {}

    if isinstance(config_data, str):
        try:
            return json.loads(config_data)
        except json.JSONDecodeError:
            return {}

    if isinstance(config_data, dict):
        return dict(config_data)

    try:
        return dict(config_data)
    except (TypeError, ValueError):
        pass

    return {}


def flatten_config(raw_config: Dict) -> Dict:
    """Flatten config with 'value' wrappers."""
    config = {}
    for key, val in raw_config.items():
        if isinstance(val, dict) and 'value' in val:
            config[key] = val['value']
        else:
            config[key] = val
    return config


def extract_date_from_run_id(run_id: str) -> Optional[str]:
    """Extract date string from run_id (e.g., '20251208' from run_id)."""
    match = re.match(r'^(\d{8})_', run_id)
    if match:
        return match.group(1)
    return None


def extract_cli_args(config: Dict) -> Dict[str, str]:
    """
    Extract CLI arguments from wandb config.

    The args are stored in config['_wandb']['e'][key]['args'] as a list.
    """
    result = {}

    wandb_meta = config.get('_wandb', {})
    if not isinstance(wandb_meta, dict):
        return result

    # Find the 'e' section (execution info)
    e_section = wandb_meta.get('e', {})
    if not isinstance(e_section, dict):
        return result

    # Get first entry's args
    for key, entry in e_section.items():
        if isinstance(entry, dict) and 'args' in entry:
            args = entry['args']
            if isinstance(args, list):
                # Parse args list
                i = 0
                while i < len(args):
                    arg = args[i]
                    if isinstance(arg, str) and arg.startswith('-'):
                        # This is a flag/option
                        if i + 1 < len(args) and not args[i + 1].startswith('-'):
                            result[arg] = args[i + 1]
                            i += 2
                        else:
                            result[arg] = 'true'
                            i += 1
                    else:
                        i += 1
            break  # Only process first entry

    return result


def get_cli_arg_value(cli_args: Dict[str, str], arg_names: List[str]) -> Optional[str]:
    """Get value for any of the given arg names."""
    for arg_name in arg_names:
        if arg_name in cli_args:
            return cli_args[arg_name]
    return None


def extract_timestamp_patterns(run_data: Dict, config: Dict) -> List[str]:
    """Extract patterns that might help identify model directories."""
    patterns = []

    # From wandb info
    wandb_info = run_data.get('wandb', {})
    if wandb_info.get('run_id'):
        patterns.append(wandb_info['run_id'])
    if wandb_info.get('run_name'):
        patterns.append(wandb_info['run_name'])
    if wandb_info.get('group'):
        patterns.append(wandb_info['group'])

    # From run_id date
    run_id = run_data.get('run_id', '')
    date_str = extract_date_from_run_id(run_id)
    if date_str:
        # Convert 20251208 to various patterns
        patterns.append(date_str)
        patterns.append(f"{date_str[4:6]}{date_str[6:8]}")  # 1208
        patterns.append(f"{date_str[4:6]}_{date_str[6:8]}")  # 12_08
        patterns.append(f"{date_str[2:4]}{date_str[4:6]}{date_str[6:8]}")  # 251208

    # From created_at
    created_at = run_data.get('created_at', '')
    if created_at:
        try:
            dt = datetime.fromisoformat(created_at.replace('Z', '+00:00'))
            patterns.append(dt.strftime('%m%d'))  # 1208
            patterns.append(dt.strftime('%Y%m%d'))  # 20251208
        except Exception:
            pass

    return [p for p in patterns if p and len(p) >= 4]


# =============================================================================
# Method Inference
# =============================================================================

def infer_method(run_data: Dict, config: Dict) -> str:
    """
    Infer training method from run data and config.

    Priority:
    1) Existing method in run_data (if not 'unknown')
    2) Config fields: method, algo, trainer, stage
    3) Project name: sft, dpo, grpo, finetune
    4) Tags/group/run_name
    """
    method_keywords = {
        'grpo': 'grpo',
        'dpo': 'dpo',
        'sft': 'sft',
        'finetune': 'sft',
        'ppo': 'ppo',
    }

    # 1) Check existing method
    existing = run_data.get('method', 'unknown')
    if existing and existing != 'unknown':
        return existing

    # 2) Check config fields
    config_fields = ['method', 'algo', 'trainer', 'stage', 'training_method', 'algorithm']
    for field_name in config_fields:
        value = config.get(field_name)
        if isinstance(value, str):
            value_lower = value.lower()
            for keyword, method in method_keywords.items():
                if keyword in value_lower:
                    return method

    # 3) Check project name
    project = run_data.get('project', '')
    project_lower = project.lower()
    for keyword, method in method_keywords.items():
        if keyword in project_lower:
            return method

    # 4) Check tags, group, run_name
    wandb_info = run_data.get('wandb', {})
    searchable = [str(t).lower() for t in (wandb_info.get('tags') or [])]
    searchable.append((wandb_info.get('group') or '').lower())
    searchable.append((wandb_info.get('run_name') or '').lower())

    for text in searchable:
        for keyword, method in method_keywords.items():
            if keyword in text:
                return method

    return 'unknown'


# =============================================================================
# Model Path Discovery
# =============================================================================

def find_model_path_in_config(config: Dict, cli_args: Dict[str, str]) -> Optional[str]:
    """Find model output path from config fields or CLI args."""
    # First try CLI args
    cli_path = get_cli_arg_value(cli_args, MODEL_PATH_ARGS)
    if cli_path and len(cli_path) > 5:
        return cli_path

    # Then try config fields
    for field_name in MODEL_PATH_FIELDS:
        value = config.get(field_name)
        if value and isinstance(value, str) and len(value) > 5:
            return value
    return None


def search_model_directory(
    method: str,
    patterns: List[str],
    config: Dict,
    cli_args: Dict[str, str]
) -> Optional[str]:
    """
    Search for model directory in the method's root directory.

    Returns confirmed path if found and exists.
    """
    # First, try exact path from config or CLI args
    config_path = find_model_path_in_config(config, cli_args)
    if config_path:
        # If absolute and exists
        if os.path.isabs(config_path) and os.path.exists(config_path):
            return config_path
        # Check if exists relative to current directory
        if os.path.exists(config_path):
            return os.path.abspath(config_path)

    # If method is known, search in that directory
    if method in MODEL_ROOT_DIRS:
        root_dir = Path(MODEL_ROOT_DIRS[method])
        if root_dir.exists():
            # Try joining config_path with root
            if config_path:
                joined = root_dir / config_path
                if joined.exists():
                    return str(joined)

            # Search subdirectories for patterns
            try:
                subdirs = [d for d in root_dir.iterdir() if d.is_dir()]
            except Exception:
                subdirs = []

            # Score each subdirectory by pattern matches
            best_match = None
            best_score = 0

            for subdir in subdirs:
                subdir_name = subdir.name.lower()
                score = 0

                for pattern in patterns:
                    pattern_lower = pattern.lower()
                    if pattern_lower in subdir_name:
                        # Longer pattern match = higher score
                        score += len(pattern_lower)

                if score > best_score:
                    best_score = score
                    best_match = subdir

            if best_match and best_score >= 4:
                return str(best_match)

    return None


def discover_model_path(
    run_data: Dict,
    config: Dict,
    cli_args: Dict[str, str],
    method: str
) -> Tuple[Optional[str], str]:
    """
    Discover and confirm model path.

    Returns: (path, status) where status is 'confirmed' or 'unknown'
    """
    # Check existing confirmed path
    artifacts = run_data.get('artifacts', {})
    existing_path = artifacts.get('model_path')
    existing_status = artifacts.get('model_path_status')

    if existing_path and existing_status == 'confirmed':
        if os.path.exists(existing_path):
            return existing_path, 'confirmed'

    # Try to find from config
    patterns = extract_timestamp_patterns(run_data, config)

    # Search in method-specific directory
    found_path = search_model_directory(method, patterns, config, cli_args)

    if found_path and os.path.exists(found_path):
        return found_path, 'confirmed'

    # Also try other method directories (in case method inference is wrong)
    for m, root in MODEL_ROOT_DIRS.items():
        if m == method:
            continue
        found_path = search_model_directory(m, patterns, config, cli_args)
        if found_path and os.path.exists(found_path):
            return found_path, 'confirmed'

    return None, 'unknown'


# =============================================================================
# Dataset Path Verification
# =============================================================================

def discover_dataset_path(
    run_data: Dict,
    config: Dict,
    cli_args: Dict[str, str]
) -> Tuple[Optional[str], str]:
    """
    Discover and verify dataset path.

    Returns: (path, status) where status is 'confirmed', 'relative', or 'unknown'
    """
    # Check existing confirmed path
    dataset_info = run_data.get('dataset', {})
    existing_path = dataset_info.get('dataset_path')
    existing_status = dataset_info.get('status')

    if existing_path and existing_status == 'confirmed':
        if os.path.exists(existing_path):
            return existing_path, 'confirmed'

    # First try CLI args
    cli_dataset = get_cli_arg_value(cli_args, DATASET_PATH_ARGS)
    if cli_dataset and len(cli_dataset) > 3:
        if os.path.isabs(cli_dataset):
            if os.path.exists(cli_dataset):
                return cli_dataset, 'confirmed'
            else:
                return cli_dataset, 'unknown'
        else:
            if os.path.exists(cli_dataset):
                return os.path.abspath(cli_dataset), 'confirmed'
            return cli_dataset, 'relative'

    # Search config for dataset path
    for field_name in DATASET_PATH_FIELDS:
        value = config.get(field_name)
        if value:
            if isinstance(value, str) and len(value) > 3:
                path = value
            elif isinstance(value, dict) and 'train' in value:
                path = str(value['train'])
            elif isinstance(value, list) and len(value) > 0:
                path = str(value[0])
            else:
                continue

            if path and path != 'unknown':
                if os.path.isabs(path):
                    if os.path.exists(path):
                        return path, 'confirmed'
                    else:
                        return path, 'unknown'
                else:
                    return path, 'relative'

    # Try dataset_id fields
    for field_name in DATASET_ID_FIELDS:
        value = config.get(field_name)
        if value and isinstance(value, str) and len(value) > 2:
            return value, 'relative'

    return None, 'unknown'


# =============================================================================
# W&B Integration
# =============================================================================

def fetch_wandb_config(api: wandb.Api, run_data: Dict) -> Optional[Dict]:
    """Fetch config from W&B API."""
    wandb_info = run_data.get('wandb', {})
    entity = wandb_info.get('entity')
    project = wandb_info.get('project')
    run_id = wandb_info.get('run_id')

    if not all([entity, project, run_id]):
        return None

    try:
        run = api.run(f"{entity}/{project}/{run_id}")
        raw_config = parse_wandb_config(run.config)
        return flatten_config(raw_config)
    except Exception as e:
        return None


# =============================================================================
# Run Processing
# =============================================================================

def should_move_to_unknown(
    method: str,
    model_path_status: str,
    dataset_status: str
) -> Tuple[bool, List[str]]:
    """
    Determine if run should be moved to unknown directory.

    Returns: (should_move, reasons)
    """
    reasons = []

    if method == 'unknown':
        reasons.append('method_unknown')

    if model_path_status != 'confirmed':
        reasons.append('model_path_not_confirmed')

    if dataset_status == 'unknown':
        reasons.append('dataset_unknown')

    return len(reasons) > 0, reasons


def process_run(
    run_dir: Path,
    api: wandb.Api,
    stats: UpdateStats,
    dry_run: bool = False
) -> Tuple[str, bool, List[str]]:
    """
    Process a single run directory.

    Returns: (method, should_move_to_unknown, reasons)
    """
    run_json_path = run_dir / 'run.json'
    config_json_path = run_dir / 'config.json'

    if not run_json_path.exists():
        return 'unknown', True, ['no_run_json']

    # Load existing data
    run_data = safe_load_json(run_json_path)
    if not run_data:
        return 'unknown', True, ['invalid_run_json']

    # Load config.json if exists
    config = safe_load_json(config_json_path) or {}

    # Fetch from W&B if needed
    if not config or len(config) < 5:
        wandb_config = fetch_wandb_config(api, run_data)
        if wandb_config:
            config.update(wandb_config)
            stats.wandb_fetch_success += 1
        else:
            stats.wandb_fetch_failed += 1

    # Extract CLI args from config
    cli_args = extract_cli_args(config)

    # Infer method
    method = infer_method(run_data, config)
    stats.method_confirmed[method] = stats.method_confirmed.get(method, 0) + 1

    # Discover model path
    model_path, model_status = discover_model_path(run_data, config, cli_args, method)
    if model_status == 'confirmed':
        stats.model_path_confirmed += 1
    else:
        stats.model_path_unknown += 1

    # Discover dataset path
    dataset_path, dataset_status = discover_dataset_path(run_data, config, cli_args)
    if dataset_status == 'confirmed':
        stats.dataset_path_confirmed += 1
    elif dataset_status == 'relative':
        stats.dataset_path_relative += 1
    else:
        stats.dataset_path_unknown += 1

    # Determine if should move to unknown
    move_to_unknown, reasons = should_move_to_unknown(method, model_status, dataset_status)

    # Update run_data (only if not dry run and values are new/better)
    updated = False

    # Update method
    if run_data.get('method') in [None, 'unknown'] and method != 'unknown':
        run_data['method'] = method
        updated = True

    # Update artifacts.model_path
    if 'artifacts' not in run_data:
        run_data['artifacts'] = {}

    current_model_status = run_data['artifacts'].get('model_path_status')
    if model_status == 'confirmed' and current_model_status != 'confirmed':
        run_data['artifacts']['model_path'] = model_path
        run_data['artifacts']['model_path_status'] = 'confirmed'
        updated = True
    elif model_path and current_model_status != 'confirmed':
        run_data['artifacts']['model_path_status'] = model_status
        updated = True

    # Update dataset
    if 'dataset' not in run_data:
        run_data['dataset'] = {}

    current_ds_status = run_data['dataset'].get('status')
    if dataset_status == 'confirmed' and current_ds_status != 'confirmed':
        run_data['dataset']['dataset_path'] = dataset_path
        run_data['dataset']['status'] = 'confirmed'
        updated = True
    elif dataset_path and current_ds_status not in ['confirmed']:
        if run_data['dataset'].get('dataset_path') in [None, 'unknown']:
            run_data['dataset']['dataset_path'] = dataset_path
        run_data['dataset']['status'] = dataset_status
        updated = True

    # Save if updated
    if updated and not dry_run:
        backup_and_save_json(run_json_path, run_data)

    return method, move_to_unknown, reasons


# =============================================================================
# Directory Reorganization
# =============================================================================

def reorganize_runs(
    runs_dir: Path,
    run_classifications: Dict[str, Tuple[str, bool, List[str]]],
    stats: UpdateStats,
    dry_run: bool = False
) -> None:
    """
    Reorganize runs into method-based subdirectories.

    Structure: runs/{sft,dpo,grpo,unknown}/<run_id>/
    """
    # Create target directories
    for method in ['sft', 'dpo', 'grpo', 'unknown']:
        target_dir = runs_dir / method
        if not dry_run:
            target_dir.mkdir(exist_ok=True)

    # Move runs
    for run_id, (method, move_to_unknown, reasons) in run_classifications.items():
        source = runs_dir / run_id
        if not source.exists() or not source.is_dir():
            continue

        # Skip if already in a method subdirectory
        if source.parent != runs_dir:
            continue

        if move_to_unknown:
            target_method = 'unknown'
            stats.moved_to_unknown += 1
            for reason in reasons:
                stats.unknown_reasons[reason] = stats.unknown_reasons.get(reason, 0) + 1
        else:
            target_method = method if method in ['sft', 'dpo', 'grpo'] else 'unknown'

        target = runs_dir / target_method / run_id

        if dry_run:
            print(f"  [DRY RUN] Would move: {run_id} -> {target_method}/")
        else:
            if target.exists():
                print(f"  Warning: Target exists, skipping: {target}")
                continue
            try:
                shutil.move(str(source), str(target))
                print(f"  Moved: {run_id} -> {target_method}/")
            except Exception as e:
                print(f"  Error moving {run_id}: {e}")


# =============================================================================
# Main CLI
# =============================================================================

def parse_args():
    parser = argparse.ArgumentParser(
        description="Update runs with wandb info and reorganize by method.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python tools/update_runs_from_wandb.py --runs_dir ./runs
  python tools/update_runs_from_wandb.py --runs_dir ./runs --dry_run
  python tools/update_runs_from_wandb.py --runs_dir ./runs --no_reorganize
        """
    )

    parser.add_argument(
        '--runs_dir',
        type=str,
        default='./runs',
        help='Path to runs directory (default: ./runs)'
    )

    parser.add_argument(
        '--dry_run',
        action='store_true',
        help='Show what would be done without making changes'
    )

    parser.add_argument(
        '--no_reorganize',
        action='store_true',
        help='Skip directory reorganization, only update run.json files'
    )

    parser.add_argument(
        '--skip_wandb',
        action='store_true',
        help='Skip W&B API calls, use only local config.json'
    )

    return parser.parse_args()


def main():
    args = parse_args()
    runs_dir = Path(args.runs_dir)

    if not runs_dir.exists():
        print(f"Error: Runs directory not found: {runs_dir}")
        sys.exit(1)

    print("=" * 60)
    print("Runs Ledger Update Tool")
    print("=" * 60)
    print(f"Runs directory: {runs_dir}")
    print(f"Dry run: {args.dry_run}")
    print(f"Skip W&B: {args.skip_wandb}")
    print(f"Reorganize: {not args.no_reorganize}")
    print("=" * 60)

    # Initialize W&B API
    api = None
    if not args.skip_wandb:
        try:
            api = wandb.Api()
            print("W&B API initialized successfully")
        except Exception as e:
            print(f"Warning: Failed to initialize W&B API: {e}")
            print("Continuing with local data only...")

    # Find all run directories
    run_dirs = []
    for item in runs_dir.iterdir():
        if item.is_dir():
            # Skip method subdirectories if they exist
            if item.name in ['sft', 'dpo', 'grpo', 'unknown']:
                # Process runs inside method subdirectories
                for sub_item in item.iterdir():
                    if sub_item.is_dir() and (sub_item / 'run.json').exists():
                        run_dirs.append(sub_item)
            elif (item / 'run.json').exists():
                run_dirs.append(item)

    print(f"\nFound {len(run_dirs)} run directories")

    # Process each run
    stats = UpdateStats()
    run_classifications = {}

    for i, run_dir in enumerate(sorted(run_dirs)):
        run_id = run_dir.name
        stats.total_runs += 1

        print(f"\n[{i+1}/{len(run_dirs)}] Processing: {run_id}")

        method, move_to_unknown, reasons = process_run(
            run_dir,
            api,
            stats,
            dry_run=args.dry_run
        )

        run_classifications[run_id] = (method, move_to_unknown, reasons)

        status_str = f"method={method}"
        if move_to_unknown:
            status_str += f" -> unknown ({', '.join(reasons)})"
        print(f"  Status: {status_str}")

    # Reorganize directories
    if not args.no_reorganize:
        print("\n" + "=" * 60)
        print("Reorganizing directories...")
        print("=" * 60)
        reorganize_runs(runs_dir, run_classifications, stats, dry_run=args.dry_run)

    # Print summary
    print("\n" + "=" * 60)
    print("SUMMARY")
    print("=" * 60)
    print(f"Total runs processed: {stats.total_runs}")
    print(f"\nMethod classification:")
    for method, count in sorted(stats.method_confirmed.items()):
        print(f"  {method}: {count}")

    print(f"\nModel path discovery:")
    print(f"  Confirmed: {stats.model_path_confirmed}")
    print(f"  Unknown: {stats.model_path_unknown}")

    print(f"\nDataset path verification:")
    print(f"  Confirmed: {stats.dataset_path_confirmed}")
    print(f"  Relative: {stats.dataset_path_relative}")
    print(f"  Unknown: {stats.dataset_path_unknown}")

    if not args.skip_wandb:
        print(f"\nW&B API calls:")
        print(f"  Success: {stats.wandb_fetch_success}")
        print(f"  Failed: {stats.wandb_fetch_failed}")

    if not args.no_reorganize:
        print(f"\nMoved to unknown: {stats.moved_to_unknown}")
        if stats.unknown_reasons:
            print("  Reasons:")
            for reason, count in sorted(stats.unknown_reasons.items()):
                print(f"    {reason}: {count}")

    print("=" * 60)
    print("Done!")


if __name__ == "__main__":
    main()
