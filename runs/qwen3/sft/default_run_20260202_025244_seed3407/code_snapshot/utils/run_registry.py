#!/usr/bin/env python3
"""
Run Registry - Utilities for finding and managing runs.

This module provides functions to:
1. Find run_id from model_path
2. Build model path index from runs directory
3. Get eval output directory for a model
"""

import json
from pathlib import Path
from typing import Optional, Dict, Tuple
from datetime import datetime


# Default runs directory (relative to repo root)
DEFAULT_RUNS_DIR = Path(__file__).parent.parent.parent / "runs"


def build_model_path_index(runs_dir: Path = None) -> Dict[str, Path]:
    """
    Build an index mapping model_path -> run directory.

    This function indexes both:
    - artifacts.model_path (final trained model)
    - config.output_dir (checkpoint directory during training)

    Supports both directory structures:
    - Old structure: runs/{method}/{run_id}
    - New structure: runs/{model_type}/{method}/{run_id}

    Args:
        runs_dir: Path to runs directory

    Returns:
        Dict mapping normalized model_path to run directory path
    """
    if runs_dir is None:
        runs_dir = DEFAULT_RUNS_DIR

    runs_dir = Path(runs_dir)
    if not runs_dir.exists():
        return {}

    index = {}

    # Known method names (to distinguish old vs new structure)
    method_names = {"sft", "dpo", "grpo", "unknown"}
    # Special directories to skip
    special_dirs = {"benchmark", "safepilot"}

    def index_run_dir(run_dir: Path):
        """Index a single run directory."""
        run_json = run_dir / "run.json"
        if not run_json.exists():
            return

        try:
            with open(run_json) as f:
                run_data = json.load(f)

            # Get model path from artifacts (final model)
            model_path = run_data.get("artifacts", {}).get("model_path")
            if model_path:
                # Normalize path (remove trailing slashes)
                normalized = model_path.rstrip("/")
                index[normalized] = run_dir

                # Also index without checkpoint suffix for matching
                if "/checkpoint-" in normalized:
                    base_path = normalized.rsplit("/checkpoint-", 1)[0]
                    if base_path not in index:
                        index[base_path] = run_dir

            # Also index config.output_dir (for matching checkpoints during training)
            output_dir = run_data.get("config", {}).get("output_dir")
            if output_dir:
                normalized_output = output_dir.rstrip("/")
                if normalized_output not in index:
                    index[normalized_output] = run_dir

        except (json.JSONDecodeError, KeyError):
            pass

    # Iterate through first-level directories
    for first_level_dir in runs_dir.iterdir():
        if not first_level_dir.is_dir():
            continue

        first_level_name = first_level_dir.name

        # Skip special directories
        if first_level_name in special_dirs:
            continue

        if first_level_name in method_names:
            # Old structure: runs/{method}/{run_id}
            for run_dir in first_level_dir.iterdir():
                if run_dir.is_dir():
                    index_run_dir(run_dir)
        else:
            # New structure: runs/{model_type}/{method}/{run_id}
            # first_level_dir is model_type (mistral, qwen3, llama31_8b, etc.)
            for method_dir in first_level_dir.iterdir():
                if not method_dir.is_dir():
                    continue
                for run_dir in method_dir.iterdir():
                    if run_dir.is_dir():
                        index_run_dir(run_dir)

    return index


def find_run_by_model_path(
    model_path: str,
    runs_dir: Path = None,
    index: Dict[str, Path] = None
) -> Optional[Path]:
    """
    Find run directory by model path.

    Args:
        model_path: Path to the model
        runs_dir: Path to runs directory (used if index not provided)
        index: Pre-built model path index (optional, for performance)

    Returns:
        Path to run directory if found, None otherwise
    """
    if not model_path:
        return None

    # Build index if not provided
    if index is None:
        index = build_model_path_index(runs_dir)

    # Normalize model path
    normalized = model_path.rstrip("/")

    # Strategy 1: Exact match
    if normalized in index:
        return index[normalized]

    # Strategy 2: Match with checkpoint suffix removed
    if "/checkpoint-" in normalized:
        base_path = normalized.rsplit("/checkpoint-", 1)[0]
        if base_path in index:
            return index[base_path]

    # Strategy 3: Check if any indexed path starts with or ends with this path
    for indexed_path, run_dir in index.items():
        if normalized.startswith(indexed_path) or indexed_path.startswith(normalized):
            return run_dir

    # Strategy 4: Match by model name (last path component)
    import os
    model_name = os.path.basename(normalized)
    for indexed_path, run_dir in index.items():
        if os.path.basename(indexed_path) == model_name:
            return run_dir

    return None


def get_run_id(run_dir: Path) -> str:
    """Extract run_id from run directory path."""
    return run_dir.name


def generate_eval_id(
    eval_type: str = "solver",
    temperature: float = 0.6,
    max_new_tokens: int = 1024,
    batch_size: Optional[int] = None,
    extra_params: Optional[Dict] = None,
    include_timestamp: bool = True
) -> str:
    """
    Generate eval_id based on eval parameters.

    Format: {eval_type}__temp{temperature}_max{max_new_tokens}[_bs{batch_size}][_{timestamp}]

    Args:
        eval_type: Type of evaluation (solver, solver_batch)
        temperature: Generation temperature
        max_new_tokens: Maximum new tokens
        batch_size: Batch size (for batch evaluation)
        extra_params: Additional parameters to include
        include_timestamp: Whether to include timestamp for uniqueness (default: True)

    Returns:
        eval_id string
    """
    parts = [eval_type]

    # Add core parameters
    parts.append(f"temp{temperature}")
    parts.append(f"max{max_new_tokens}")

    if batch_size is not None:
        parts.append(f"bs{batch_size}")

    # Add extra parameters
    if extra_params:
        for key, value in sorted(extra_params.items()):
            if value is not None:
                parts.append(f"{key}{value}")

    # Add timestamp for uniqueness
    if include_timestamp:
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        parts.append(timestamp)

    return "__".join([parts[0], "_".join(parts[1:])])


def get_eval_output_dir(
    model_path: str,
    eval_id: str,
    runs_dir: Path = None,
    create: bool = True
) -> Tuple[Optional[Path], Optional[str]]:
    """
    Get the output directory for evaluation results.

    Structure: runs/<run_id>/eval/<eval_id>/

    Args:
        model_path: Path to the model being evaluated
        eval_id: Evaluation identifier
        runs_dir: Path to runs directory
        create: Whether to create the directory if it doesn't exist

    Returns:
        Tuple of (eval_output_dir, run_id) or (None, None) if run not found
    """
    if runs_dir is None:
        runs_dir = DEFAULT_RUNS_DIR

    # Find run directory
    run_dir = find_run_by_model_path(model_path, runs_dir)

    if run_dir is None:
        return None, None

    run_id = get_run_id(run_dir)
    eval_output_dir = run_dir / "eval" / eval_id

    if create:
        eval_output_dir.mkdir(parents=True, exist_ok=True)
        (eval_output_dir / "scenarios").mkdir(exist_ok=True)

    return eval_output_dir, run_id


def resolve_model_path_from_run(
    run_path: str,
    verbose: bool = True
) -> Tuple[str, Optional[Path]]:
    """
    Resolve model path from run directory with fallback to latest checkpoint.

    Priority:
    1. artifacts.model_path in run.json (if exists and valid)
    2. model_dir symlink in run directory
    3. Latest checkpoint in config.output_dir

    Args:
        run_path: Path to run directory
        verbose: Whether to print resolution details

    Returns:
        Tuple of (resolved_model_path, run_dir_path)

    Raises:
        ValueError: If no valid model path can be found
    """
    run_dir = Path(run_path)
    run_json_path = run_dir / "run.json"

    # Handle case where run_path points to a checkpoint directory
    if not run_json_path.exists():
        if run_dir.name.startswith("checkpoint-") and run_dir.parent.name == "model":
            # Go up: checkpoint-XXX -> model -> run_dir
            parent_run_dir = run_dir.parent.parent
            parent_run_json = parent_run_dir / "run.json"
            if parent_run_json.exists():
                if verbose:
                    print(f"[Model Resolution] Detected checkpoint path, using parent run: {parent_run_dir}")
                # Return the checkpoint path directly as the model
                return str(run_dir), parent_run_dir

    if not run_json_path.exists():
        raise ValueError(
            f"run.json not found at {run_json_path}\n"
            f"Please provide a valid run directory containing run.json"
        )

    # Load run.json
    try:
        with open(run_json_path, 'r') as f:
            run_data = json.load(f)
    except json.JSONDecodeError as e:
        raise ValueError(f"Failed to parse run.json: {e}")

    run_id = run_data.get("run_id", run_dir.name)
    if verbose:
        print(f"[Model Resolution] Run ID: {run_id}")
        print(f"[Model Resolution] Status: {run_data.get('status', 'unknown')}")

    # Strategy 1: Check artifacts.model_path
    model_path = run_data.get("artifacts", {}).get("model_path")
    if model_path and Path(model_path).exists():
        if verbose:
            print(f"[Model Resolution] Using artifacts.model_path: {model_path}")
        return model_path, run_dir

    if model_path:
        if verbose:
            print(f"[Model Resolution] artifacts.model_path not available: {model_path}")

    # Strategy 2: Check model_dir symlink
    model_dir_link = run_dir / "model_dir"
    if model_dir_link.exists():
        if model_dir_link.is_symlink():
            resolved_link = model_dir_link.resolve()
            if resolved_link.exists():
                if verbose:
                    print(f"[Model Resolution] Using model_dir symlink: {resolved_link}")
                return str(resolved_link), run_dir
            else:
                if verbose:
                    print(f"[Model Resolution] model_dir symlink target not found: {resolved_link}")
        else:
            # It's a real directory
            if verbose:
                print(f"[Model Resolution] Using model_dir directory: {model_dir_link}")
            return str(model_dir_link), run_dir

    # Strategy 3: Fallback to latest checkpoint in output_dir
    output_dir = run_data.get("config", {}).get("output_dir")
    if not output_dir:
        raise ValueError(
            f"Cannot resolve model path:\n"
            f"  - artifacts.model_path: {model_path or 'not set'}\n"
            f"  - model_dir symlink: not found\n"
            f"  - config.output_dir: not set\n"
            f"Please wait for training to complete or specify a checkpoint path directly."
        )

    output_dir_path = Path(output_dir)
    if not output_dir_path.exists():
        raise ValueError(
            f"Cannot resolve model path:\n"
            f"  - artifacts.model_path: {model_path or 'not set'}\n"
            f"  - model_dir symlink: not found\n"
            f"  - config.output_dir: {output_dir} (does not exist)\n"
            f"Training may not have started or output directory is invalid."
        )

    # Find latest checkpoint
    latest_checkpoint = find_latest_checkpoint(output_dir_path, verbose=verbose)

    if latest_checkpoint:
        if verbose:
            print(f"[Model Resolution] ✓ Fallback to latest checkpoint: {latest_checkpoint}")
        return str(latest_checkpoint), run_dir

    # No checkpoint found - check if there are model files directly in output_dir
    if _is_valid_model_dir(output_dir_path):
        if verbose:
            print(f"[Model Resolution] Using output_dir directly (contains model files): {output_dir}")
        return output_dir, run_dir

    raise ValueError(
        f"Cannot resolve model path:\n"
        f"  - artifacts.model_path: {model_path or 'not set'}\n"
        f"  - model_dir symlink: not found\n"
        f"  - config.output_dir: {output_dir} (no checkpoints found)\n"
        f"Training may still be in early stages. Please wait for first checkpoint."
    )


def find_latest_checkpoint(
    output_dir: Path,
    verbose: bool = True
) -> Optional[Path]:
    """
    Find the latest checkpoint in an output directory.

    Checkpoints are directories named 'checkpoint-{step}' where step is an integer.
    The latest checkpoint is the one with the highest step number.

    Args:
        output_dir: Directory to search for checkpoints
        verbose: Whether to print search details

    Returns:
        Path to latest checkpoint directory, or None if no checkpoints found
    """
    import re

    if not output_dir.exists():
        return None

    checkpoint_pattern = re.compile(r'^checkpoint-(\d+)$')
    checkpoints = []

    for item in output_dir.iterdir():
        if item.is_dir():
            match = checkpoint_pattern.match(item.name)
            if match:
                step = int(match.group(1))
                checkpoints.append((step, item))

    if not checkpoints:
        if verbose:
            print(f"[Model Resolution] No checkpoints found in {output_dir}")
        return None

    # Sort by step number (descending) and return the latest
    checkpoints.sort(key=lambda x: x[0], reverse=True)

    if verbose:
        print(f"[Model Resolution] Found {len(checkpoints)} checkpoint(s):")
        for step, path in checkpoints[:5]:  # Show up to 5
            print(f"    - checkpoint-{step}")
        if len(checkpoints) > 5:
            print(f"    ... and {len(checkpoints) - 5} more")

    latest_step, latest_path = checkpoints[0]
    return latest_path


def _is_valid_model_dir(path: Path) -> bool:
    """
    Check if a directory contains valid model files.

    A valid model directory should contain:
    - config.json (Hugging Face model config)
    - Some weight files (.bin, .safetensors, or .pt)
    """
    if not path.is_dir():
        return False

    has_config = (path / "config.json").exists()
    has_weights = any(
        path.glob("*.bin")
    ) or any(
        path.glob("*.safetensors")
    ) or any(
        path.glob("*.pt")
    )

    return has_config and has_weights


def update_run_evals(
    run_dir: Path,
    eval_id: str,
    main_metric: float,
    eval_path: str
) -> bool:
    """
    Update run.json with evaluation record.

    Args:
        run_dir: Path to run directory
        eval_id: Evaluation identifier
        main_metric: Main metric value (overall success_rate)
        eval_path: Relative path to eval directory

    Returns:
        True if successful, False otherwise
    """
    run_json = run_dir / "run.json"
    if not run_json.exists():
        return False

    try:
        with open(run_json) as f:
            run_data = json.load(f)

        # Initialize evals dict if not exists
        if "evals" not in run_data:
            run_data["evals"] = {}

        # Add eval record
        run_data["evals"][eval_id] = {
            "path": eval_path,
            "main_metric": main_metric,
            "timestamp": datetime.now().isoformat()
        }

        # Write back
        with open(run_json, "w") as f:
            json.dump(run_data, f, indent=2, ensure_ascii=False)

        return True

    except (json.JSONDecodeError, IOError):
        return False
