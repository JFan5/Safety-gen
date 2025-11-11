#!/usr/bin/env python3
"""
Common utilities and data structures for benchmark problem generation and solving.
"""
from __future__ import annotations

import json
import re
import subprocess
import sys
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple, Union

PROJECT_ROOT = Path(__file__).resolve().parents[1]
WORKSPACE_ROOT = Path(__file__).resolve().parents[2]
OPTIC = WORKSPACE_ROOT / "optic" / "release" / "optic" / "optic-clp"
VALIDATOR = Path("/home/ubuntu/VAL/build/linux64/Release/bin/Validate")
PROMPT_PATH = PROJECT_ROOT / "prompt.txt"

SCENARIOS: Tuple[str, ...] = (
    "blocksworld",
    "grippers",
    "ferry",
    "grid",
    "delivery",
    "spanner",
)

DOMAIN_PATHS: Dict[str, Path] = {
    name: PROJECT_ROOT / name / "domain.pddl" for name in SCENARIOS
}

CACHE_FILENAME = "solver_cache.json"
DEFAULT_INSTANCES_PER_PARAMETER = 2
DEFAULT_TIME_LIMIT = 100
OPTIC_RESULTS_DIRNAME = "optic_results"
LLM_RESULTS_DIRNAME = "llm_results"


@dataclass
class SolverOutcome:
    """Result of running a solver on a problem."""

    status: str = "unknown"
    validation: str = ""
    elapsed_seconds: Optional[float] = None
    plan_path: Optional[Path] = None
    log_path: Optional[Path] = None
    notes: str = ""


def to_text(value: Optional[Union[str, bytes]]) -> str:
    """Convert bytes or None to string."""
    if value is None:
        return ""
    if isinstance(value, bytes):
        return value.decode("utf-8", errors="ignore")
    return value


def path_to_workspace_str(path: Optional[Path]) -> Optional[str]:
    """Convert Path to workspace-relative string."""
    if not path or not path.exists():
        return None
    try:
        return str(path.resolve().relative_to(WORKSPACE_ROOT))
    except ValueError:
        return str(path.resolve())


def workspace_str_to_path(path_str: Optional[str]) -> Optional[Path]:
    """Convert workspace-relative string to Path."""
    if not path_str:
        return None
    path = Path(path_str)
    if not path.is_absolute():
        path = WORKSPACE_ROOT / path
    return path


def load_solver_cache(cache_path: Path) -> Dict[str, Dict[str, Any]]:
    """Load solver cache from JSON file."""
    if not cache_path.exists():
        return {"optic": {}, "llm": {}}
    try:
        with cache_path.open("r", encoding="utf-8") as fh:
            data = json.load(fh)
    except Exception as exc:
        print(f"Warning: Failed to read cache {cache_path}: {exc}", flush=True)
        return {"optic": {}, "llm": {}}

    if not isinstance(data, dict):
        return {"optic": {}, "llm": {}}

    data.setdefault("optic", {})
    data.setdefault("llm", {})
    # Ensure nested structures are dictionaries
    optic_cache = data["optic"] if isinstance(data["optic"], dict) else {}
    llm_cache = data["llm"] if isinstance(data["llm"], dict) else {}
    return {"optic": optic_cache, "llm": llm_cache}


def save_solver_cache(cache_path: Path, cache: Dict[str, Dict[str, Any]]) -> None:
    """Save solver cache to JSON file."""
    cache_path.parent.mkdir(parents=True, exist_ok=True)
    with cache_path.open("w", encoding="utf-8") as fh:
        json.dump(cache, fh, indent=2, ensure_ascii=False)


def outcome_to_cache_dict(outcome: SolverOutcome, problem_path: Path) -> Dict[str, Any]:
    """Convert SolverOutcome to cache dictionary."""
    return {
        "status": outcome.status,
        "validation": outcome.validation,
        "elapsed_seconds": outcome.elapsed_seconds,
        "plan_path": path_to_workspace_str(outcome.plan_path),
        "log_path": path_to_workspace_str(outcome.log_path),
        "notes": outcome.notes,
        "timestamp": datetime.utcnow().isoformat(),
        "problem_path": path_to_workspace_str(problem_path),
    }


def cache_dict_to_outcome(cache_entry: Dict[str, Any]) -> SolverOutcome:
    """Convert cache dictionary to SolverOutcome."""
    return SolverOutcome(
        status=cache_entry.get("status", "unknown"),
        validation=cache_entry.get("validation", ""),
        elapsed_seconds=cache_entry.get("elapsed_seconds"),
        plan_path=workspace_str_to_path(cache_entry.get("plan_path")),
        log_path=workspace_str_to_path(cache_entry.get("log_path")),
        notes=cache_entry.get("notes", ""),
    )


def run_command(cmd: List[str], cwd: Optional[Path] = None, timeout: Optional[int] = None) -> subprocess.CompletedProcess:
    """Run a command and return the result."""
    return subprocess.run(
        cmd,
        cwd=str(cwd) if cwd else None,
        check=True,
        capture_output=True,
        text=True,
        timeout=timeout,
    )


def extract_parameter_value(scenario: str, path: Path) -> Optional[int]:
    """Extract parameter value from problem filename."""
    name = path.stem
    match: Optional[re.Match[str]] = None
    if scenario == "blocksworld":
        match = re.search(r"n(\d+)", name)
    elif scenario == "grippers":
        match = re.search(r"o(\d+)", name)
        if not match:
            match = re.search(r"n(\d+)", name)
    elif scenario == "ferry":
        match = re.search(r"l(\d+)", name)
    elif scenario == "grid":
        match = re.search(r"x(\d+)", name)
    elif scenario == "delivery":
        # Try new format: delivery_size{size}_packages{packages}_seed{seed}
        match = re.search(r"size(\d+)", name)
        if not match:
            # Fallback to old format: waypoint(\d+)
            match = re.search(r"waypoint(\d+)", name)
    elif scenario == "spanner":
        match = re.search(r"s(\d+)", name)
        if not match:
            match = re.search(r"n(\d+)", name)
    return int(match.group(1)) if match else None


def count_symbols(section: str) -> int:
    """Count symbols in a PDDL section."""
    tokens = re.split(r"[\s()]+", section.strip())
    return sum(1 for token in tokens if token and token != "-" and not token.startswith(";"))


def problem_complexity(path: Path) -> Tuple[int, int, int, int, int]:
    """Calculate problem complexity metrics."""
    try:
        text = path.read_text(encoding="utf-8")
    except Exception:
        return (sys.maxsize, sys.maxsize, sys.maxsize, sys.maxsize, sys.maxsize)

    objects_match = re.search(r"\(:objects\s+(.*?)\)", text, re.DOTALL | re.IGNORECASE)
    init_match = re.search(r"\(:init\s+(.*?)\)\s*\(:", text, re.DOTALL | re.IGNORECASE)
    goal_match = re.search(r"\(:goal\s+(.*?)\)", text, re.DOTALL | re.IGNORECASE)

    object_score = count_symbols(objects_match.group(1)) if objects_match else 0
    init_score = count_symbols(init_match.group(1)) if init_match else 0
    goal_score = count_symbols(goal_match.group(1)) if goal_match else 0
    line_count = text.count("\n") + 1
    char_count = len(text)

    return (object_score, init_score, goal_score, line_count, char_count)


def ensure_binaries(check_optic: bool = True, check_validator: bool = True) -> None:
    """Check that required binaries exist."""
    if check_optic and not OPTIC.exists():
        raise FileNotFoundError(f"OPTIC binary missing: {OPTIC}")
    if check_validator and not VALIDATOR.exists():
        raise FileNotFoundError(f"Validate binary missing: {VALIDATOR}")

