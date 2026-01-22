#!/usr/bin/env python3
"""
Run Manager - Create and manage training runs with automatic tracking.

This module provides functions to:
1. Create run directories with run.json and config snapshots
2. Redirect stdout/stderr to log files
3. Finalize runs with status updates and symlinks
4. Mark invalid runs and move to unknown/
"""

import os
import sys
import json
import yaml
import shutil
import atexit
import signal
import subprocess
import tempfile
from pathlib import Path
from datetime import datetime
from typing import Optional, Dict, Any, Tuple, Union
from contextlib import contextmanager
import argparse


# Default runs directory (relative to repo root)
DEFAULT_RUNS_ROOT = Path(__file__).parent.parent.parent / "runs"


def get_git_info() -> Dict[str, Any]:
    """Get current git commit and dirty status."""
    try:
        # Get commit hash
        commit = subprocess.check_output(
            ["git", "rev-parse", "HEAD"],
            stderr=subprocess.DEVNULL,
            cwd=Path(__file__).parent.parent.parent
        ).decode().strip()

        # Check if dirty
        dirty = subprocess.call(
            ["git", "diff", "--quiet"],
            stderr=subprocess.DEVNULL,
            cwd=Path(__file__).parent.parent.parent
        ) != 0

        # Get branch
        branch = subprocess.check_output(
            ["git", "rev-parse", "--abbrev-ref", "HEAD"],
            stderr=subprocess.DEVNULL,
            cwd=Path(__file__).parent.parent.parent
        ).decode().strip()

        return {
            "commit": commit,
            "dirty": dirty,
            "branch": branch
        }
    except (subprocess.CalledProcessError, FileNotFoundError):
        return {}


def generate_run_id(
    method: str,
    run_name: Optional[str] = None,
    seed: Optional[int] = None
) -> str:
    """
    Generate a unique run_id.

    Format: {run_name or method}_{YYYYMMDD}_{HHMMSS}[_seed{N}]
    """
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    base_name = run_name if run_name else method

    # Sanitize base name (remove slashes, spaces)
    base_name = base_name.replace("/", "_").replace(" ", "_").replace("\\", "_")

    run_id = f"{base_name}_{timestamp}"

    if seed is not None:
        run_id += f"_seed{seed}"

    return run_id


def write_atomic_json(path: Path, data: Dict[str, Any]) -> bool:
    """
    Atomically write JSON file using temp file + rename.

    Args:
        path: Target file path
        data: Data to write

    Returns:
        True if successful, False otherwise
    """
    try:
        path = Path(path)
        path.parent.mkdir(parents=True, exist_ok=True)

        # Write to temp file first
        fd, tmp_path = tempfile.mkstemp(
            suffix=".json",
            prefix=".tmp_",
            dir=path.parent
        )
        try:
            with os.fdopen(fd, 'w') as f:
                json.dump(data, f, indent=2, ensure_ascii=False)
            # Atomic rename
            os.rename(tmp_path, path)
            return True
        except Exception:
            # Clean up temp file on error
            if os.path.exists(tmp_path):
                os.unlink(tmp_path)
            raise
    except Exception as e:
        print(f"[run_manager] Error writing {path}: {e}", file=sys.stderr)
        return False


def write_config_snapshot(
    run_dir: Path,
    args: Union[argparse.Namespace, Dict[str, Any]],
    extra_config: Optional[Dict[str, Any]] = None
) -> Path:
    """
    Write config snapshot as YAML.

    Args:
        run_dir: Run directory path
        args: Command line arguments (Namespace or dict)
        extra_config: Additional config to include

    Returns:
        Path to config file
    """
    config_path = run_dir / "config_snapshot.yaml"

    # Convert Namespace to dict if needed
    if isinstance(args, argparse.Namespace):
        config = vars(args).copy()
    else:
        config = dict(args)

    # Add extra config
    if extra_config:
        config.update(extra_config)

    # Convert Path objects to strings for YAML
    for key, value in config.items():
        if isinstance(value, Path):
            config[key] = str(value)

    with open(config_path, 'w') as f:
        yaml.dump(config, f, default_flow_style=False, allow_unicode=True)

    return config_path


class LogRedirector:
    """Context manager to redirect stdout/stderr to a log file."""

    def __init__(self, log_path: Path, also_print: bool = True):
        self.log_path = Path(log_path)
        self.also_print = also_print
        self.log_file = None
        self.original_stdout = None
        self.original_stderr = None

    def __enter__(self):
        self.log_path.parent.mkdir(parents=True, exist_ok=True)
        self.log_file = open(self.log_path, 'a', buffering=1)
        self.original_stdout = sys.stdout
        self.original_stderr = sys.stderr

        if self.also_print:
            # Tee to both file and original stdout/stderr
            sys.stdout = TeeWriter(self.original_stdout, self.log_file)
            sys.stderr = TeeWriter(self.original_stderr, self.log_file)
        else:
            sys.stdout = self.log_file
            sys.stderr = self.log_file

        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        sys.stdout = self.original_stdout
        sys.stderr = self.original_stderr
        if self.log_file:
            self.log_file.close()
        return False


class TeeWriter:
    """Write to multiple outputs simultaneously."""

    def __init__(self, *writers):
        self.writers = writers

    def write(self, data):
        for w in self.writers:
            w.write(data)
            if hasattr(w, 'flush'):
                w.flush()

    def flush(self):
        for w in self.writers:
            if hasattr(w, 'flush'):
                w.flush()

    def isatty(self):
        """Check if any writer is a TTY (required by wandb)."""
        for w in self.writers:
            if hasattr(w, 'isatty') and w.isatty():
                return True
        return False

    def fileno(self):
        """Return file descriptor of first writer that has one (required by some libraries)."""
        for w in self.writers:
            if hasattr(w, 'fileno'):
                try:
                    return w.fileno()
                except Exception:
                    pass
        raise OSError("No valid file descriptor available")


def create_run(
    method: str,
    args: Union[argparse.Namespace, Dict[str, Any]],
    runs_root: Optional[Union[str, Path]] = None,
    run_name: Optional[str] = None,
    seed: Optional[int] = None,
    base_model: Optional[str] = None,
    dataset: Optional[str] = None,
    output_dir: Optional[str] = None,
    wandb_project: Optional[str] = None,
    wandb_run_name: Optional[str] = None,
    extra_metadata: Optional[Dict[str, Any]] = None,
    training_script: Optional[str] = None
) -> Tuple[Path, str, Dict[str, Any]]:
    """
    Create a new run directory with initial run.json.

    Args:
        method: Training method (sft, dpo, grpo)
        args: Command line arguments
        runs_root: Root directory for runs (default: ./runs)
        run_name: Optional custom run name
        seed: Random seed
        base_model: Path to base model
        dataset: Path to dataset
        output_dir: Output directory for model
        wandb_project: W&B project name
        wandb_run_name: W&B run name
        extra_metadata: Additional metadata to include
        training_script: Path to training script to copy to run directory

    Returns:
        Tuple of (run_dir, run_id, run_data)
    """
    # Resolve runs root
    if runs_root is None:
        runs_root = DEFAULT_RUNS_ROOT
    runs_root = Path(runs_root)

    # Generate run_id
    run_id = generate_run_id(method, run_name, seed)

    # Create run directory
    run_dir = runs_root / method / run_id
    run_dir.mkdir(parents=True, exist_ok=True)

    # Create logs directory
    (run_dir / "logs").mkdir(exist_ok=True)

    # Validate paths
    invalid_paths = []
    if base_model and not Path(base_model).exists():
        invalid_paths.append(("base_model", base_model))
    if dataset and not Path(dataset).exists():
        invalid_paths.append(("dataset", dataset))

    # Build run.json data
    run_data = {
        "run_id": run_id,
        "method": method,
        "status": "running",
        "start_time": datetime.now().isoformat(),
        "end_time": None,

        "config": {
            "base_model": base_model,
            "dataset": dataset,
            "output_dir": output_dir,
            "seed": seed,
        },

        "wandb": {
            "project": wandb_project,
            "run_name": wandb_run_name or run_name,
            "url": None  # Will be updated when wandb is initialized
        },

        "artifacts": {
            "model_path": None,  # Will be updated on finalize
        },

        "git": get_git_info(),

        "evals": {},

        "invalid_paths": invalid_paths if invalid_paths else None,
    }

    # Add extra metadata
    if extra_metadata:
        run_data["extra"] = extra_metadata

    # Copy training script to run directory for reproducibility
    if training_script:
        training_script_path = Path(training_script)
        if training_script_path.exists():
            script_dest = run_dir / "training_script.py"
            try:
                shutil.copy2(training_script_path, script_dest)
                run_data["artifacts"]["training_script"] = str(script_dest)
                print(f"[run_manager] Copied training script: {training_script} -> {script_dest}")
            except Exception as e:
                print(f"[run_manager] Warning: Could not copy training script: {e}", file=sys.stderr)
        else:
            print(f"[run_manager] Warning: Training script not found: {training_script}", file=sys.stderr)

    # Write run.json
    write_atomic_json(run_dir / "run.json", run_data)

    # Write config snapshot
    write_config_snapshot(run_dir, args)

    print(f"[run_manager] Created run: {run_id}")
    print(f"[run_manager] Run directory: {run_dir}")

    return run_dir, run_id, run_data


def update_wandb_url(run_dir: Path, wandb_url: str) -> bool:
    """
    Update run.json with wandb URL.

    Args:
        run_dir: Run directory path
        wandb_url: W&B run URL

    Returns:
        True if successful
    """
    run_json = run_dir / "run.json"
    if not run_json.exists():
        return False

    try:
        with open(run_json) as f:
            run_data = json.load(f)

        if "wandb" not in run_data:
            run_data["wandb"] = {}
        run_data["wandb"]["url"] = wandb_url

        return write_atomic_json(run_json, run_data)
    except Exception:
        return False


def finalize_run(
    run_dir: Path,
    status: str = "finished",
    final_model_path: Optional[str] = None,
    dataset_path: Optional[str] = None,
    error_message: Optional[str] = None
) -> bool:
    """
    Finalize a run after training completes.

    Args:
        run_dir: Run directory path
        status: Final status (finished, failed)
        final_model_path: Path to final model/checkpoint
        dataset_path: Path to dataset (for symlink)
        error_message: Error message if failed

    Returns:
        True if successful
    """
    run_dir = Path(run_dir)
    run_json = run_dir / "run.json"

    if not run_json.exists():
        print(f"[run_manager] Warning: run.json not found at {run_json}", file=sys.stderr)
        return False

    try:
        with open(run_json) as f:
            run_data = json.load(f)

        # Update status and timestamps
        run_data["status"] = status
        run_data["end_time"] = datetime.now().isoformat()

        if error_message:
            run_data["error"] = error_message

        # Update model path
        if final_model_path:
            run_data["artifacts"]["model_path"] = final_model_path

            # Create symlink to model
            model_path = Path(final_model_path)
            if model_path.exists():
                symlink_path = run_dir / "model"
                if symlink_path.exists() or symlink_path.is_symlink():
                    symlink_path.unlink()
                try:
                    symlink_path.symlink_to(model_path.resolve())
                    print(f"[run_manager] Created symlink: model -> {model_path}")
                except OSError as e:
                    print(f"[run_manager] Warning: Could not create model symlink: {e}", file=sys.stderr)

        # Create symlink to dataset
        if dataset_path:
            dataset_path_obj = Path(dataset_path)
            if dataset_path_obj.exists():
                symlink_path = run_dir / "dataset"
                if symlink_path.exists() or symlink_path.is_symlink():
                    symlink_path.unlink()
                try:
                    symlink_path.symlink_to(dataset_path_obj.resolve())
                    print(f"[run_manager] Created symlink: dataset -> {dataset_path}")
                except OSError as e:
                    print(f"[run_manager] Warning: Could not create dataset symlink: {e}", file=sys.stderr)

        # Write updated run.json
        success = write_atomic_json(run_json, run_data)

        if success:
            print(f"[run_manager] Finalized run: {run_data.get('run_id', 'unknown')} (status={status})")

        return success

    except Exception as e:
        print(f"[run_manager] Error finalizing run: {e}", file=sys.stderr)
        return False


def mark_unknown(run_dir: Path, runs_root: Optional[Path] = None) -> Optional[Path]:
    """
    Move a run to the unknown/ directory.

    Args:
        run_dir: Current run directory
        runs_root: Root runs directory

    Returns:
        New path if moved, None on failure
    """
    run_dir = Path(run_dir)

    if runs_root is None:
        # Infer from run_dir path (runs/<method>/<run_id>)
        runs_root = run_dir.parent.parent
    runs_root = Path(runs_root)

    if not run_dir.exists():
        return None

    unknown_dir = runs_root / "unknown"
    unknown_dir.mkdir(parents=True, exist_ok=True)

    new_path = unknown_dir / run_dir.name

    # Handle name conflicts
    if new_path.exists():
        suffix = 1
        while (unknown_dir / f"{run_dir.name}_{suffix}").exists():
            suffix += 1
        new_path = unknown_dir / f"{run_dir.name}_{suffix}"

    try:
        shutil.move(str(run_dir), str(new_path))

        # Update run.json with new status
        run_json = new_path / "run.json"
        if run_json.exists():
            with open(run_json) as f:
                run_data = json.load(f)
            run_data["status"] = "invalid"
            run_data["moved_to_unknown"] = datetime.now().isoformat()
            write_atomic_json(run_json, run_data)

        print(f"[run_manager] Moved run to unknown: {new_path}")
        return new_path

    except Exception as e:
        print(f"[run_manager] Error moving run to unknown: {e}", file=sys.stderr)
        return None


class RunContext:
    """
    Context manager for managing a training run lifecycle.

    Usage:
        with RunContext(method="grpo", args=args, ...) as run:
            # Training code here
            run.update_wandb_url(wandb.run.get_url())
            # ... training ...
        # Automatically finalized on exit
    """

    def __init__(
        self,
        method: str,
        args: Union[argparse.Namespace, Dict[str, Any]],
        runs_root: Optional[Union[str, Path]] = None,
        run_name: Optional[str] = None,
        seed: Optional[int] = None,
        base_model: Optional[str] = None,
        dataset: Optional[str] = None,
        output_dir: Optional[str] = None,
        wandb_project: Optional[str] = None,
        wandb_run_name: Optional[str] = None,
        extra_metadata: Optional[Dict[str, Any]] = None,
        redirect_logs: bool = True,
        training_script: Optional[str] = None
    ):
        self.method = method
        self.args = args
        self.runs_root = runs_root
        self.run_name = run_name
        self.seed = seed
        self.base_model = base_model
        self.dataset = dataset
        self.output_dir = output_dir
        self.wandb_project = wandb_project
        self.wandb_run_name = wandb_run_name
        self.extra_metadata = extra_metadata
        self.redirect_logs = redirect_logs
        self.training_script = training_script

        self.run_dir: Optional[Path] = None
        self.run_id: Optional[str] = None
        self.run_data: Optional[Dict] = None
        self.log_redirector: Optional[LogRedirector] = None
        self._finalized = False

    def __enter__(self) -> "RunContext":
        # Create run
        self.run_dir, self.run_id, self.run_data = create_run(
            method=self.method,
            args=self.args,
            runs_root=self.runs_root,
            run_name=self.run_name,
            seed=self.seed,
            base_model=self.base_model,
            dataset=self.dataset,
            output_dir=self.output_dir,
            wandb_project=self.wandb_project,
            wandb_run_name=self.wandb_run_name,
            extra_metadata=self.extra_metadata,
            training_script=self.training_script
        )

        # Set up log redirection
        if self.redirect_logs:
            log_path = self.run_dir / "logs" / "train.log"
            self.log_redirector = LogRedirector(log_path, also_print=True)
            self.log_redirector.__enter__()

        # Register cleanup handlers
        atexit.register(self._emergency_cleanup)
        signal.signal(signal.SIGTERM, self._signal_handler)
        signal.signal(signal.SIGINT, self._signal_handler)

        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        # Stop log redirection
        if self.log_redirector:
            self.log_redirector.__exit__(exc_type, exc_val, exc_tb)

        # Determine status
        if exc_type is not None:
            status = "failed"
            error_message = f"{exc_type.__name__}: {exc_val}"
        else:
            status = "finished"
            error_message = None

        # Finalize
        self._finalize(status, error_message)

        # Unregister cleanup
        try:
            atexit.unregister(self._emergency_cleanup)
        except Exception:
            pass

        return False  # Don't suppress exceptions

    def _finalize(self, status: str = "finished", error_message: Optional[str] = None):
        if self._finalized:
            return
        self._finalized = True

        # Check for invalid paths and move to unknown if needed
        should_move_to_unknown = False
        if self.run_data and self.run_data.get("invalid_paths"):
            should_move_to_unknown = True

        # Finalize the run
        finalize_run(
            run_dir=self.run_dir,
            status="invalid" if should_move_to_unknown else status,
            final_model_path=self.output_dir,
            dataset_path=self.dataset,
            error_message=error_message
        )

        # Move to unknown if needed
        if should_move_to_unknown:
            mark_unknown(self.run_dir, self.runs_root)

    def _emergency_cleanup(self):
        """Emergency cleanup on unexpected exit."""
        if not self._finalized:
            self._finalize("failed", "Unexpected exit")

    def _signal_handler(self, signum, frame):
        """Handle termination signals."""
        signal_name = signal.Signals(signum).name
        self._finalize("failed", f"Received signal: {signal_name}")
        sys.exit(128 + signum)

    def update_wandb_url(self, url: str):
        """Update wandb URL in run.json."""
        if self.run_dir:
            update_wandb_url(self.run_dir, url)


def add_run_args(parser: argparse.ArgumentParser) -> argparse.ArgumentParser:
    """
    Add standard run management arguments to an argument parser.

    Args:
        parser: ArgumentParser to add arguments to

    Returns:
        The modified parser
    """
    run_group = parser.add_argument_group("Run Management")
    run_group.add_argument(
        "--runs_root",
        type=str,
        default="./runs",
        help="Root directory for runs (default: ./runs)"
    )
    run_group.add_argument(
        "--method",
        type=str,
        choices=["sft", "dpo", "grpo"],
        help="Training method (auto-detected if not specified)"
    )
    run_group.add_argument(
        "--run_name",
        type=str,
        default=None,
        help="Custom run name (optional)"
    )
    run_group.add_argument(
        "--seed",
        type=int,
        default=None,
        help="Random seed"
    )
    run_group.add_argument(
        "--no_run_tracking",
        action="store_true",
        help="Disable run tracking (don't create run directory)"
    )

    return parser


# Convenience function for extracting run-related args
def extract_run_args(args: argparse.Namespace) -> Dict[str, Any]:
    """
    Extract run management arguments from parsed args.

    Args:
        args: Parsed arguments

    Returns:
        Dict with run management arguments
    """
    return {
        "runs_root": getattr(args, "runs_root", "./runs"),
        "method": getattr(args, "method", None),
        "run_name": getattr(args, "run_name", None),
        "seed": getattr(args, "seed", None),
        "no_run_tracking": getattr(args, "no_run_tracking", False),
    }
