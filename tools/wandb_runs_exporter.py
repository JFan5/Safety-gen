#!/usr/bin/env python3
"""
W&B Runs Exporter - Export finished runs from Weights & Biases to local structure.

This tool exports experiment metadata from W&B projects and creates a local
runs directory with standardized JSON files and a leaderboard CSV for easy
comparison and traceability.

Usage:
    python tools/wandb_runs_exporter.py --entity fjl2401-university-of-notre-dame
    python tools/wandb_runs_exporter.py --projects pddl-grpo-llama31-8b,pddl-dpo-mistral7b
    python tools/wandb_runs_exporter.py --overwrite --metrics "eval/accuracy,reward"
"""

import argparse
import csv
import fnmatch
import json
import os
import re
import sys
from datetime import datetime, timedelta, timezone
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple

try:
    import wandb
    from wandb.apis.public import Run
except ImportError:
    print("Error: wandb package not found. Install with: pip install wandb")
    sys.exit(1)


# =============================================================================
# Constants
# =============================================================================

DEFAULT_ENTITY = "fjl2401-university-of-notre-dame"
DEFAULT_PROJECTS = [
    "pddl-grpo-llama31-8b",
    "pddl-grpo-qwen3_14b",
    "pddl-dpo-mistral7b",
    "pddl-grpo-mistral7b",
    "pddl-finetune",
]
DEFAULT_METRICS = [
    "eval/accuracy",
    "eval_loss",
    "reward",
    "win_rate",
    "train/loss",
]

# File patterns to download
DOWNLOAD_FILE_PATTERNS = [
    "*eval*.json",
    "*metrics*.json",
    "*results*.json",
    "*pred*.jsonl",
    "*table*.json",
]

# Maximum length for dataset path in run_id
MAX_DATASET_PATH_LEN = 60


# =============================================================================
# Helper Functions
# =============================================================================

def sanitize_filename(name: str, max_length: int = 200) -> str:
    """Make a string safe for use as a filename/directory name."""
    if not name:
        return "unknown"
    # Replace problematic characters
    sanitized = re.sub(r'[<>:"/\\|?*\x00-\x1f]', '_', name)
    # Replace multiple underscores/spaces with single underscore
    sanitized = re.sub(r'[_\s]+', '_', sanitized)
    # Remove leading/trailing underscores and dots
    sanitized = sanitized.strip('_.')
    # Truncate to max length
    if len(sanitized) > max_length:
        sanitized = sanitized[:max_length]
    return sanitized or "unknown"


def truncate_path(path: str, max_len: int = MAX_DATASET_PATH_LEN) -> str:
    """Truncate a path to reasonable length for use in run_id."""
    if not path or path == "unknown":
        return "unknown"
    # Extract just the basename or last few components
    parts = path.replace("\\", "/").split("/")
    # Filter out empty parts
    parts = [p for p in parts if p]
    if not parts:
        return "unknown"
    # Use last 2-3 meaningful parts
    result = "_".join(parts[-2:]) if len(parts) > 1 else parts[-1]
    # Sanitize and truncate
    result = sanitize_filename(result, max_len)
    return result or "unknown"


def safe_serialize(obj: Any) -> Any:
    """Convert an object to a JSON-serializable form."""
    if obj is None:
        return None
    if isinstance(obj, (bool, int, float, str)):
        return obj
    if isinstance(obj, (list, tuple)):
        return [safe_serialize(item) for item in obj]
    if isinstance(obj, dict):
        return {str(k): safe_serialize(v) for k, v in obj.items()}
    # Handle numpy types
    type_name = type(obj).__name__
    if 'float' in type_name.lower():
        return float(obj)
    if 'int' in type_name.lower():
        return int(obj)
    if 'ndarray' in type_name.lower():
        return obj.tolist()
    # Fallback to string representation
    try:
        return str(obj)
    except Exception:
        return "<non-serializable>"


def parse_iso_datetime(dt_str: str) -> Optional[datetime]:
    """Parse ISO datetime string."""
    if not dt_str:
        return None
    try:
        # Handle various formats
        if dt_str.endswith('Z'):
            dt_str = dt_str[:-1] + '+00:00'
        return datetime.fromisoformat(dt_str)
    except Exception:
        return None


# =============================================================================
# Inference Logic
# =============================================================================

def infer_method(config: Dict, project: str, tags: List[str], group: str, run_name: str) -> str:
    """
    Infer training method from config, project name, tags, group, or run name.

    Priority:
    1) config fields: method, algo, trainer, stage
    2) project name contains: grpo, dpo, finetune/sft
    3) tags/group/run_name contains: sft, dpo, grpo
    """
    method_keywords = {
        'grpo': 'grpo',
        'dpo': 'dpo',
        'sft': 'sft',
        'finetune': 'sft',
        'ppo': 'ppo',
        'rlhf': 'rlhf',
    }

    # 1) Check config fields
    config_fields = ['method', 'algo', 'trainer', 'stage', 'training_method', 'algorithm']
    for field in config_fields:
        value = config.get(field)
        if isinstance(value, str):
            value_lower = value.lower()
            for keyword, method in method_keywords.items():
                if keyword in value_lower:
                    return method

    # 2) Check project name
    project_lower = project.lower()
    for keyword, method in method_keywords.items():
        if keyword in project_lower:
            return method

    # 3) Check tags, group, run_name
    searchable = [str(t).lower() for t in (tags or [])]
    searchable.append((group or "").lower())
    searchable.append((run_name or "").lower())

    for text in searchable:
        for keyword, method in method_keywords.items():
            if keyword in text:
                return method

    return "unknown"


def infer_base_model(config: Dict, project: str) -> str:
    """
    Infer base model from config or project name.

    Priority:
    1) config["base_model"]
    2) config["model_name_or_path"]
    3) config["model"] / config["model_id"]
    4) project name patterns (llama, qwen, mistral, etc.)
    """
    # Config fields to check
    model_fields = [
        'base_model', 'model_name_or_path', 'model', 'model_id',
        'pretrained_model_name_or_path', 'model_path', 'base_model_name'
    ]

    for field in model_fields:
        value = config.get(field)
        if value and isinstance(value, str) and len(value) > 1:
            return value

    # Try to infer from project name
    project_lower = project.lower().replace('-', '_').replace(' ', '_')

    model_patterns = {
        'llama31_8b': ['llama31-8b', 'llama31_8b', 'llama-3.1-8b', 'llama3.1-8b'],
        'llama31_70b': ['llama31-70b', 'llama31_70b', 'llama-3.1-70b'],
        'llama2_7b': ['llama2-7b', 'llama2_7b', 'llama-2-7b'],
        'llama2_13b': ['llama2-13b', 'llama2_13b', 'llama-2-13b'],
        'qwen3_14b': ['qwen3_14b', 'qwen3-14b', 'qwen-3-14b'],
        'qwen2_7b': ['qwen2_7b', 'qwen2-7b', 'qwen-2-7b'],
        'mistral_7b': ['mistral7b', 'mistral_7b', 'mistral-7b'],
        'mixtral_8x7b': ['mixtral', 'mixtral_8x7b'],
        'gemma_7b': ['gemma_7b', 'gemma-7b'],
        'phi3': ['phi3', 'phi-3'],
    }

    for model_name, patterns in model_patterns.items():
        for pattern in patterns:
            if pattern.replace('-', '_') in project_lower:
                return model_name

    return "unknown"


def infer_dataset(config: Dict) -> Dict[str, str]:
    """
    Infer dataset information from config.

    Returns dict with: dataset_id, dataset_path, dataset_artifact
    """
    result = {
        'dataset_id': 'unknown',
        'dataset_path': 'unknown',
        'dataset_artifact': 'unknown',
    }

    # Dataset ID fields
    id_fields = ['dataset_id', 'dataset_version', 'data_version', 'dataset_name', 'data_id']
    for field in id_fields:
        value = config.get(field)
        if value and isinstance(value, str):
            result['dataset_id'] = value
            break

    # Dataset path fields
    path_fields = [
        'dataset_path', 'data_path', 'train_file', 'data_dir',
        'train_data_path', 'training_data', 'dataset', 'data_files'
    ]
    for field in path_fields:
        value = config.get(field)
        if value:
            if isinstance(value, str):
                result['dataset_path'] = value
                break
            elif isinstance(value, dict) and 'train' in value:
                result['dataset_path'] = str(value['train'])
                break
            elif isinstance(value, list) and len(value) > 0:
                result['dataset_path'] = str(value[0])
                break

    # Dataset artifact (W&B specific)
    artifact_fields = ['dataset_artifact', 'data_artifact', 'artifact']
    for field in artifact_fields:
        value = config.get(field)
        if value and isinstance(value, str):
            result['dataset_artifact'] = value
            break

    return result


def infer_seed(config: Dict) -> Optional[int]:
    """Infer random seed from config."""
    seed_fields = [
        'seed', 'random_seed', 'training.seed', 'train_seed',
        'np_seed', 'torch_seed', 'global_seed'
    ]

    for field in seed_fields:
        # Handle nested fields like "training.seed"
        if '.' in field:
            parts = field.split('.')
            value = config
            for part in parts:
                if isinstance(value, dict):
                    value = value.get(part)
                else:
                    value = None
                    break
        else:
            value = config.get(field)

        if value is not None:
            try:
                return int(value)
            except (ValueError, TypeError):
                pass

    return None


def infer_train_hparams(config: Dict) -> Dict[str, Any]:
    """Extract training hyperparameters from config."""
    result = {
        'seed': infer_seed(config),
        'lr': None,
        'batch_size': None,
        'epochs': None,
        'max_steps': None,
        'other_hparams': {},
    }

    # Learning rate
    lr_fields = ['learning_rate', 'lr', 'initial_lr', 'base_lr']
    for field in lr_fields:
        value = config.get(field)
        if value is not None:
            try:
                result['lr'] = float(value)
                break
            except (ValueError, TypeError):
                pass

    # Batch size
    batch_fields = [
        'batch_size', 'train_batch_size', 'per_device_train_batch_size',
        'micro_batch_size', 'global_batch_size'
    ]
    for field in batch_fields:
        value = config.get(field)
        if value is not None:
            try:
                result['batch_size'] = int(value)
                break
            except (ValueError, TypeError):
                pass

    # Epochs
    epoch_fields = ['num_epochs', 'epochs', 'num_train_epochs', 'n_epochs']
    for field in epoch_fields:
        value = config.get(field)
        if value is not None:
            try:
                result['epochs'] = int(value) if float(value) == int(float(value)) else float(value)
                break
            except (ValueError, TypeError):
                pass

    # Max steps
    step_fields = ['max_steps', 'total_steps', 'num_training_steps', 'train_steps']
    for field in step_fields:
        value = config.get(field)
        if value is not None:
            try:
                result['max_steps'] = int(value)
                break
            except (ValueError, TypeError):
                pass

    # Other common hyperparameters
    other_hparam_fields = [
        'warmup_steps', 'warmup_ratio', 'weight_decay', 'gradient_accumulation_steps',
        'max_grad_norm', 'adam_epsilon', 'adam_beta1', 'adam_beta2',
        'lr_scheduler_type', 'optimizer', 'fp16', 'bf16',
        'gradient_checkpointing', 'lora_r', 'lora_alpha', 'lora_dropout',
    ]
    for field in other_hparam_fields:
        value = config.get(field)
        if value is not None:
            result['other_hparams'][field] = safe_serialize(value)

    return result


def infer_git_commit(config: Dict, run: Run) -> str:
    """Try to get git commit from run metadata."""
    # Check config first
    commit_fields = ['git_commit', 'commit', 'git_sha', 'commit_hash']
    for field in commit_fields:
        value = config.get(field)
        if value and isinstance(value, str):
            return value

    # Try to get from run metadata
    try:
        if hasattr(run, 'commit') and run.commit:
            return run.commit
    except Exception:
        pass

    return "unknown"


# =============================================================================
# Run Processing
# =============================================================================

def generate_run_id(
    created_at: datetime,
    project: str,
    method: str,
    base_model: str,
    dataset_info: Dict[str, str],
    seed: Optional[int],
    wandb_run_id: str
) -> str:
    """
    Generate a unique, filesystem-safe run_id.

    Format: <date>_<time>_proj-<project>_method-<method>_base-<base>_ds-<dataset>_seed-<seed>_<wandbIdShort>
    """
    # Date and time
    date_str = created_at.strftime("%Y%m%d")
    time_str = created_at.strftime("%H%M%S")

    # Project (sanitized, shortened)
    proj_short = sanitize_filename(project, 30)

    # Method
    method_short = sanitize_filename(method, 10)

    # Base model (extract just the model name, not full path)
    base_short = base_model
    if '/' in base_model:
        base_short = base_model.split('/')[-1]
    base_short = sanitize_filename(base_short, 30)

    # Dataset (use ID if available, otherwise truncated path)
    ds_str = dataset_info.get('dataset_id', 'unknown')
    if ds_str == 'unknown':
        ds_str = truncate_path(dataset_info.get('dataset_path', 'unknown'))
    ds_str = sanitize_filename(ds_str, MAX_DATASET_PATH_LEN)

    # Seed
    seed_str = str(seed) if seed is not None else "none"

    # W&B run ID (first 8 chars)
    wandb_short = sanitize_filename(wandb_run_id, 8)

    # Combine
    run_id = f"{date_str}_{time_str}_proj-{proj_short}_method-{method_short}_base-{base_short}_ds-{ds_str}_seed-{seed_str}_{wandb_short}"

    # Final sanitization
    return sanitize_filename(run_id, 250)


def parse_wandb_config(config_data) -> Dict[str, Any]:
    """Parse W&B config which may be a dict, JSON string, or other format."""
    if config_data is None:
        return {}

    # If it's a string, try to parse as JSON
    if isinstance(config_data, str):
        try:
            return json.loads(config_data)
        except json.JSONDecodeError:
            return {}

    # If it's already a dict-like object
    if isinstance(config_data, dict):
        return dict(config_data)

    # Try to convert to dict (for wandb Config objects)
    try:
        return dict(config_data)
    except (TypeError, ValueError):
        pass

    # Try _as_dict method
    if hasattr(config_data, '_as_dict'):
        try:
            return config_data._as_dict()
        except Exception:
            pass

    # Try to_dict method
    if hasattr(config_data, 'to_dict'):
        try:
            return config_data.to_dict()
        except Exception:
            pass

    return {}


def extract_run_metadata(run: Run, project: str, entity: str) -> Dict[str, Any]:
    """Extract and standardize run metadata."""
    # Get config (may contain nested 'value' structure from W&B)
    raw_config = parse_wandb_config(run.config)

    # Flatten config if it has 'value' wrappers
    config = {}
    for key, val in raw_config.items():
        if isinstance(val, dict) and 'value' in val:
            config[key] = val['value']
        else:
            config[key] = val

    # Get basic info
    tags = list(run.tags) if run.tags else []
    group = run.group or ""
    run_name = run.name or ""

    # Infer fields
    method = infer_method(config, project, tags, group, run_name)
    base_model = infer_base_model(config, project)
    dataset_info = infer_dataset(config)
    train_hparams = infer_train_hparams(config)
    git_commit = infer_git_commit(config, run)

    # Parse timestamps
    created_at = run.created_at if hasattr(run, 'created_at') else None
    if isinstance(created_at, str):
        created_dt = parse_iso_datetime(created_at)
    elif isinstance(created_at, datetime):
        created_dt = created_at
    else:
        created_dt = datetime.now(timezone.utc)

    # Ensure timezone aware
    if created_dt and created_dt.tzinfo is None:
        created_dt = created_dt.replace(tzinfo=timezone.utc)

    # Generate run_id
    run_id = generate_run_id(
        created_dt,
        project,
        method,
        base_model,
        dataset_info,
        train_hparams['seed'],
        run.id
    )

    # Build standardized metadata
    metadata = {
        "run_id": run_id,
        "project": project,
        "wandb": {
            "entity": entity,
            "project": project,
            "run_id": run.id,
            "run_name": run_name,
            "url": run.url,
            "group": group,
            "tags": tags,
        },
        "state": run.state,
        "method": method,
        "base_model": base_model,
        "dataset": dataset_info,
        "train": train_hparams,
        "code": {
            "git_commit": git_commit,
        },
        "created_at": created_dt.isoformat() if created_dt else None,
        "updated_at": run.updated_at if hasattr(run, 'updated_at') else None,
    }

    return metadata, config


def extract_summary(run: Run) -> Dict[str, Any]:
    """Extract and safely serialize run summary."""
    try:
        summary_data = run.summary
        if summary_data is None:
            return {}
        # Handle JSON string case
        if isinstance(summary_data, str):
            try:
                summary = json.loads(summary_data)
            except json.JSONDecodeError:
                return {}
        else:
            try:
                summary = dict(summary_data)
            except (TypeError, ValueError):
                summary = {}
        return safe_serialize(summary)
    except Exception as e:
        return {"_error": f"Failed to extract summary: {str(e)}"}


def download_run_files(run: Run, files_dir: Path, patterns: List[str]) -> List[str]:
    """Download files matching patterns from a run."""
    downloaded = []

    try:
        files = run.files()
        for f in files:
            filename = f.name
            # Check if matches any pattern
            for pattern in patterns:
                if fnmatch.fnmatch(filename.lower(), pattern.lower()):
                    try:
                        files_dir.mkdir(parents=True, exist_ok=True)
                        # Download file
                        f.download(root=str(files_dir), replace=True)
                        downloaded.append(filename)
                    except Exception as e:
                        print(f"    Warning: Failed to download {filename}: {e}")
                    break
    except Exception as e:
        # Files API might not be available or accessible
        pass

    return downloaded


# =============================================================================
# Export Logic
# =============================================================================

def export_run(
    run: Run,
    project: str,
    entity: str,
    out_dir: Path,
    overwrite: bool = False,
    download_files: bool = True
) -> Tuple[str, bool, str]:
    """
    Export a single run to local directory.

    Returns: (run_id, success, message)
    """
    try:
        # Extract metadata
        metadata, raw_config = extract_run_metadata(run, project, entity)
        run_id = metadata['run_id']

        # Create run directory
        run_dir = out_dir / run_id
        run_dir.mkdir(parents=True, exist_ok=True)

        # File paths
        run_json_path = run_dir / "run.json"
        summary_json_path = run_dir / "summary.json"
        config_json_path = run_dir / "config.json"

        # Check if files exist and handle overwrite
        files_to_write = []

        if not run_json_path.exists() or overwrite:
            files_to_write.append(('run.json', run_json_path, metadata))

        if not summary_json_path.exists() or overwrite:
            summary = extract_summary(run)
            files_to_write.append(('summary.json', summary_json_path, summary))

        if not config_json_path.exists() or overwrite:
            safe_config = safe_serialize(raw_config)
            files_to_write.append(('config.json', config_json_path, safe_config))

        # Write files
        for name, path, data in files_to_write:
            with open(path, 'w', encoding='utf-8') as f:
                json.dump(data, f, indent=2, ensure_ascii=False, default=str)

        # Download files if requested
        if download_files:
            files_dir = run_dir / "files"
            downloaded = download_run_files(run, files_dir, DOWNLOAD_FILE_PATTERNS)
            if downloaded:
                metadata['_downloaded_files'] = downloaded

        status = "exported" if files_to_write else "skipped (exists)"
        return run_id, True, status

    except Exception as e:
        return run.id, False, f"Error: {str(e)}"


def export_project(
    api: wandb.Api,
    entity: str,
    project: str,
    out_dir: Path,
    overwrite: bool = False,
    max_runs: Optional[int] = None,
    since_days: Optional[int] = None,
    download_files: bool = True
) -> Dict[str, int]:
    """
    Export all finished runs from a project.

    Returns dict with counts: finished, skipped, failed
    """
    stats = {
        'finished': 0,
        'skipped_state': 0,
        'skipped_date': 0,
        'failed': 0,
        'run_ids': [],
    }

    # Calculate date filter
    since_date = None
    if since_days is not None:
        since_date = datetime.now(timezone.utc) - timedelta(days=since_days)

    print(f"\n  Fetching runs from {entity}/{project}...")

    try:
        runs = api.runs(f"{entity}/{project}")
    except Exception as e:
        print(f"  Error fetching runs: {e}")
        return stats

    run_count = 0
    for run in runs:
        # Check max runs limit
        if max_runs is not None and run_count >= max_runs:
            print(f"  Reached max_runs limit ({max_runs})")
            break

        # Filter by state - ONLY export finished runs
        if run.state != "finished":
            stats['skipped_state'] += 1
            continue

        # Filter by date if specified
        if since_date is not None:
            created_at = run.created_at
            if isinstance(created_at, str):
                created_dt = parse_iso_datetime(created_at)
            elif isinstance(created_at, datetime):
                created_dt = created_at
            else:
                created_dt = None

            if created_dt:
                if created_dt.tzinfo is None:
                    created_dt = created_dt.replace(tzinfo=timezone.utc)
                if created_dt < since_date:
                    stats['skipped_date'] += 1
                    continue

        # Export the run
        run_id, success, message = export_run(
            run, project, entity, out_dir, overwrite, download_files
        )

        if success:
            stats['finished'] += 1
            stats['run_ids'].append(run_id)
            print(f"    [{stats['finished']}] {run_id}: {message}")
        else:
            stats['failed'] += 1
            print(f"    [FAILED] {run.id}: {message}")

        run_count += 1

    return stats


# =============================================================================
# Leaderboard Generation
# =============================================================================

def generate_leaderboard(
    out_dir: Path,
    metrics: List[str],
    output_path: Optional[Path] = None
) -> int:
    """
    Generate leaderboard.csv from all exported runs.

    Returns number of runs included.
    """
    if output_path is None:
        output_path = out_dir.parent / "leaderboard.csv"

    rows = []

    # Find all run directories
    if not out_dir.exists():
        print("No runs directory found.")
        return 0

    for run_dir in sorted(out_dir.iterdir()):
        if not run_dir.is_dir():
            continue

        run_json = run_dir / "run.json"
        summary_json = run_dir / "summary.json"

        if not run_json.exists():
            continue

        try:
            with open(run_json, 'r', encoding='utf-8') as f:
                run_data = json.load(f)

            summary = {}
            if summary_json.exists():
                with open(summary_json, 'r', encoding='utf-8') as f:
                    summary = json.load(f)

            # Build row
            row = {
                'run_id': run_data.get('run_id', ''),
                'project': run_data.get('project', ''),
                'method': run_data.get('method', ''),
                'base_model': run_data.get('base_model', ''),
                'dataset_id': run_data.get('dataset', {}).get('dataset_id', ''),
                'dataset_path': run_data.get('dataset', {}).get('dataset_path', ''),
                'seed': run_data.get('train', {}).get('seed', ''),
                'created_at': run_data.get('created_at', ''),
                'wandb_url': run_data.get('wandb', {}).get('url', ''),
            }

            # Add metrics from summary
            for metric in metrics:
                value = summary.get(metric)
                # Handle nested metrics like "eval/accuracy"
                if value is None and '/' in metric:
                    parts = metric.split('/')
                    nested = summary
                    for part in parts:
                        if isinstance(nested, dict):
                            nested = nested.get(part)
                        else:
                            nested = None
                            break
                    value = nested

                # Convert to string for CSV
                if value is not None:
                    if isinstance(value, float):
                        row[metric] = f"{value:.6f}"
                    else:
                        row[metric] = str(value)
                else:
                    row[metric] = ''

            rows.append(row)

        except Exception as e:
            print(f"  Warning: Failed to process {run_dir.name}: {e}")

    if not rows:
        print("No runs found to include in leaderboard.")
        return 0

    # Write CSV
    fieldnames = [
        'run_id', 'project', 'method', 'base_model',
        'dataset_id', 'dataset_path', 'seed', 'created_at', 'wandb_url'
    ] + metrics

    with open(output_path, 'w', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames, extrasaction='ignore')
        writer.writeheader()
        writer.writerows(rows)

    print(f"\nLeaderboard written to: {output_path}")
    print(f"  Total runs: {len(rows)}")

    return len(rows)


# =============================================================================
# Main CLI
# =============================================================================

def parse_args():
    parser = argparse.ArgumentParser(
        description="Export finished runs from W&B to local directory structure.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python tools/wandb_runs_exporter.py
  python tools/wandb_runs_exporter.py --entity fjl2401-university-of-notre-dame
  python tools/wandb_runs_exporter.py --projects pddl-grpo-llama31-8b,pddl-dpo-mistral7b
  python tools/wandb_runs_exporter.py --overwrite --metrics "eval/accuracy,reward"
  python tools/wandb_runs_exporter.py --since_days 30 --max_runs_per_project 10
        """
    )

    parser.add_argument(
        '--entity',
        type=str,
        default=DEFAULT_ENTITY,
        help=f'W&B entity (default: {DEFAULT_ENTITY})'
    )

    parser.add_argument(
        '--projects',
        type=str,
        default=None,
        help='Comma-separated list of projects (default: predefined list)'
    )

    parser.add_argument(
        '--out_dir',
        type=str,
        default='./runs',
        help='Output directory for runs (default: ./runs)'
    )

    parser.add_argument(
        '--overwrite',
        action='store_true',
        help='Overwrite existing run.json/summary.json/config.json files'
    )

    parser.add_argument(
        '--metrics',
        type=str,
        default=None,
        help='Comma-separated list of metrics for leaderboard (default: eval/accuracy,eval_loss,reward,win_rate,train/loss)'
    )

    parser.add_argument(
        '--max_runs_per_project',
        type=int,
        default=None,
        help='Maximum runs to export per project (for debugging)'
    )

    parser.add_argument(
        '--since_days',
        type=int,
        default=None,
        help='Only export runs created in the last N days'
    )

    parser.add_argument(
        '--no_download_files',
        action='store_true',
        help='Skip downloading files from W&B runs'
    )

    parser.add_argument(
        '--leaderboard_only',
        action='store_true',
        help='Only regenerate leaderboard.csv from existing runs'
    )

    return parser.parse_args()


def main():
    args = parse_args()

    # Parse projects
    if args.projects:
        projects = [p.strip() for p in args.projects.split(',')]
    else:
        projects = DEFAULT_PROJECTS

    # Parse metrics
    if args.metrics:
        metrics = [m.strip() for m in args.metrics.split(',')]
    else:
        metrics = DEFAULT_METRICS

    # Setup output directory
    out_dir = Path(args.out_dir)

    print("=" * 60)
    print("W&B Runs Exporter")
    print("=" * 60)
    print(f"Entity: {args.entity}")
    print(f"Projects: {', '.join(projects)}")
    print(f"Output directory: {out_dir}")
    print(f"Overwrite: {args.overwrite}")
    print(f"Metrics: {', '.join(metrics)}")
    if args.since_days:
        print(f"Since days: {args.since_days}")
    if args.max_runs_per_project:
        print(f"Max runs per project: {args.max_runs_per_project}")
    print("=" * 60)

    # Leaderboard only mode
    if args.leaderboard_only:
        print("\nRegenerating leaderboard only...")
        generate_leaderboard(out_dir, metrics)
        return

    # Initialize W&B API
    print("\nInitializing W&B API...")
    try:
        api = wandb.Api()
    except Exception as e:
        print(f"Error initializing W&B API: {e}")
        print("Make sure you're logged in with: wandb login")
        sys.exit(1)

    # Export each project
    total_stats = {
        'finished': 0,
        'skipped_state': 0,
        'skipped_date': 0,
        'failed': 0,
    }

    for project in projects:
        print(f"\n{'=' * 40}")
        print(f"Project: {project}")
        print('=' * 40)

        stats = export_project(
            api=api,
            entity=args.entity,
            project=project,
            out_dir=out_dir,
            overwrite=args.overwrite,
            max_runs=args.max_runs_per_project,
            since_days=args.since_days,
            download_files=not args.no_download_files
        )

        print(f"\n  Summary for {project}:")
        print(f"    Exported: {stats['finished']}")
        print(f"    Skipped (not finished): {stats['skipped_state']}")
        print(f"    Skipped (date filter): {stats['skipped_date']}")
        print(f"    Failed: {stats['failed']}")

        for key in ['finished', 'skipped_state', 'skipped_date', 'failed']:
            total_stats[key] += stats[key]

    # Generate leaderboard
    print("\n" + "=" * 60)
    print("Generating leaderboard...")
    generate_leaderboard(out_dir, metrics)

    # Final summary
    print("\n" + "=" * 60)
    print("FINAL SUMMARY")
    print("=" * 60)
    print(f"Total exported:              {total_stats['finished']}")
    print(f"Total skipped (not finished):{total_stats['skipped_state']}")
    print(f"Total skipped (date filter): {total_stats['skipped_date']}")
    print(f"Total failed:                {total_stats['failed']}")
    print("=" * 60)
    print("Done!")


if __name__ == "__main__":
    main()
