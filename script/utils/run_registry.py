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

    # Iterate through method directories (sft, dpo, grpo, unknown)
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
                    # Normalize path (remove trailing slashes)
                    normalized = model_path.rstrip("/")
                    index[normalized] = run_dir

                    # Also index without checkpoint suffix for matching
                    if "/checkpoint-" in normalized:
                        base_path = normalized.rsplit("/checkpoint-", 1)[0]
                        if base_path not in index:
                            index[base_path] = run_dir

            except (json.JSONDecodeError, KeyError):
                continue

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
    extra_params: Optional[Dict] = None
) -> str:
    """
    Generate eval_id based on eval parameters.

    Format: {eval_type}__temp{temperature}_max{max_new_tokens}[_bs{batch_size}]

    Args:
        eval_type: Type of evaluation (solver, solver_batch)
        temperature: Generation temperature
        max_new_tokens: Maximum new tokens
        batch_size: Batch size (for batch evaluation)
        extra_params: Additional parameters to include

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
