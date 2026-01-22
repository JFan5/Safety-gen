#!/usr/bin/env python3
"""
Leaderboard Generator for PDDL Planning Experiments

Scans the runs/ directory structure, reads run.json and eval metrics.json files,
and generates:
1. leaderboard.csv - Full table with all eval records
2. leaderboard.md - Markdown tables grouped by base_model_family and eval_id
3. best/ directory - Best performing runs per (eval_id, base_model_family)

Usage:
    python tools/build_leaderboard.py --runs_root ./runs --out_md ./leaderboard.md

Author: Auto-generated
"""

import argparse
import json
import logging
import os
import re
import sys
from collections import defaultdict
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
logger = logging.getLogger(__name__)


# =============================================================================
# Base Model Family Normalization
# =============================================================================

# Mapping patterns to normalized family names
BASE_MODEL_PATTERNS = [
    # Qwen3 14B variants
    (r"qwen3[-_]?14b", "qwen3-14b"),
    (r"qwen3_14b", "qwen3-14b"),
    (r"qwen[-_]?3[-_]?14[-_]?b", "qwen3-14b"),
    # Mistral 7B variants
    (r"mistral[-_]?7b", "mistral-7b"),
    (r"mistral_7b", "mistral-7b"),
    (r"mistral[-_]?7[-_]?b", "mistral-7b"),
    # Llama 3.1 8B variants
    (r"llama[-_]?3\.?1[-_]?8b", "llama31-8b"),
    (r"llama31[-_]?8b", "llama31-8b"),
    (r"llama3\.1[-_]?8b", "llama31-8b"),
    (r"llama[-_]?31[-_]?8[-_]?b", "llama31-8b"),
    # Qwen3 4B variants
    (r"qwen3[-_]?4b", "qwen3-4b"),
    (r"qwen[-_]?3[-_]?4[-_]?b", "qwen3-4b"),
    # GPT variants
    (r"gpt[-_]?oss[-_]?20b", "gpt-oss-20b"),
    (r"gpt[-_]?4", "gpt-4"),
]


def normalize_base_model_family(raw_name: str) -> str:
    """
    Normalize various base model name formats to a canonical family name.

    Examples:
        "qwen3_14b" -> "qwen3-14b"
        "mistral7b" -> "mistral-7b"
        "llama31-8b" -> "llama31-8b"
        "Qwen3 14B" -> "qwen3-14b"
        "/jfan5/sft_models/mistral_7b/..." -> "mistral-7b"

    Args:
        raw_name: Raw model name string from various sources

    Returns:
        Normalized family name (lowercase with hyphens)
    """
    if not raw_name or raw_name.lower() in ("unknown", "none", ""):
        return "unknown"

    # Convert to lowercase for matching
    name_lower = raw_name.lower()

    # Try each pattern
    for pattern, normalized in BASE_MODEL_PATTERNS:
        if re.search(pattern, name_lower, re.IGNORECASE):
            return normalized

    return "unknown"


def infer_base_model_family(
    run_json: Dict[str, Any],
    metrics_json: Optional[Dict[str, Any]] = None,
    run_id: str = "",
) -> str:
    """
    Infer the base model family from available data sources.

    Priority order:
    1. run.json.paths.base_model or run.json.base_model or run.json.model_name_or_path
    2. run.json.wandb.project / run.json.wandb.run_name / run_id keywords
    3. metrics.json.model_path path components
    4. Fallback to "unknown"

    Args:
        run_json: Parsed run.json data
        metrics_json: Parsed metrics.json data (optional)
        run_id: The run ID string

    Returns:
        Normalized base model family string
    """
    candidates = []

    # Priority 1: Direct fields in run.json
    if "paths" in run_json and isinstance(run_json["paths"], dict):
        if "base_model" in run_json["paths"]:
            candidates.append(run_json["paths"]["base_model"])
    if "base_model" in run_json:
        candidates.append(run_json["base_model"])
    if "model_name_or_path" in run_json:
        candidates.append(run_json["model_name_or_path"])

    # Try priority 1 candidates first
    for candidate in candidates:
        normalized = normalize_base_model_family(str(candidate))
        if normalized != "unknown":
            return normalized

    # Priority 2: wandb fields and run_id
    wandb_sources = []
    if "wandb" in run_json and isinstance(run_json["wandb"], dict):
        wandb = run_json["wandb"]
        if "project" in wandb:
            wandb_sources.append(wandb["project"])
        if "run_name" in wandb:
            wandb_sources.append(wandb["run_name"])
        if "group" in wandb:
            wandb_sources.append(wandb["group"])
    if run_id:
        wandb_sources.append(run_id)
    if "project" in run_json:
        wandb_sources.append(run_json["project"])

    for source in wandb_sources:
        normalized = normalize_base_model_family(str(source))
        if normalized != "unknown":
            return normalized

    # Priority 3: metrics.json model_path
    if metrics_json and "model_path" in metrics_json:
        model_path = metrics_json["model_path"]
        # Extract path components
        path_parts = str(model_path).replace("\\", "/").split("/")
        for part in path_parts:
            normalized = normalize_base_model_family(part)
            if normalized != "unknown":
                return normalized
        # Also try the full path
        normalized = normalize_base_model_family(model_path)
        if normalized != "unknown":
            return normalized

    # Priority 4: Fallback
    return "unknown"


# =============================================================================
# Data Classes
# =============================================================================


@dataclass
class EvalRecord:
    """Represents a single evaluation record (run + eval pair)."""

    # Identifiers
    run_id: str
    eval_id: str  # filename without .json

    # Core info
    method: str  # sft, dpo, grpo
    base_model_family: str

    # Metrics
    main_metric: float  # success_rate
    total_tests: int
    success_count: int
    eval_timestamp: str

    # Paths
    model_path: str
    output_dir: str
    dataset_path: str

    # W&B
    wandb_url: str

    # Per-scenario success rates
    scenario_metrics: Dict[str, float] = field(default_factory=dict)

    # Category rates (success_plans, plan_format_error, etc.)
    category_rates: Dict[str, float] = field(default_factory=dict)

    # Extra fields for reference
    project: str = ""
    seed: int = 0
    created_at: str = ""

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for CSV/JSON output."""
        d = {
            "run_id": self.run_id,
            "eval_id": self.eval_id,
            "method": self.method,
            "base_model_family": self.base_model_family,
            "main_metric": self.main_metric,
            "total_tests": self.total_tests,
            "success_count": self.success_count,
            "eval_timestamp": self.eval_timestamp,
            "model_path": self.model_path,
            "output_dir": self.output_dir,
            "dataset_path": self.dataset_path,
            "wandb_url": self.wandb_url,
            "project": self.project,
            "seed": self.seed,
            "created_at": self.created_at,
        }
        # Add scenario metrics with prefix
        for scenario, rate in self.scenario_metrics.items():
            d[f"scenario_{scenario}_success_rate"] = rate
        # Add category rates
        for category, rate in self.category_rates.items():
            d[f"category_{category}"] = rate
        return d


# =============================================================================
# Parsing Functions
# =============================================================================


def safe_get(d: Dict, *keys, default=None):
    """Safely get nested dictionary values."""
    for key in keys:
        if isinstance(d, dict) and key in d:
            d = d[key]
        else:
            return default
    return d


def parse_run_json(run_json_path: Path) -> Optional[Dict[str, Any]]:
    """Parse a run.json file with error handling."""
    try:
        with open(run_json_path, "r", encoding="utf-8") as f:
            return json.load(f)
    except (json.JSONDecodeError, IOError) as e:
        logger.warning(f"Failed to parse {run_json_path}: {e}")
        return None


def parse_metrics_json(metrics_path: Path) -> Optional[Dict[str, Any]]:
    """Parse a metrics.json file with error handling."""
    try:
        with open(metrics_path, "r", encoding="utf-8") as f:
            return json.load(f)
    except (json.JSONDecodeError, IOError) as e:
        logger.warning(f"Failed to parse {metrics_path}: {e}")
        return None


def extract_scenario_from_eval_id(eval_id: str) -> str:
    """
    Extract scenario name from eval_id.

    Examples:
        "blocksworld_-jfan5-grpo_models-..." -> "blocksworld"
        "delivery_-jfan5-sft_models-..." -> "delivery"
        "-jfan5-sft_models-..._blocksworld" -> "blocksworld" (scenario at end)
    """
    known_scenarios = {
        "blocksworld",
        "delivery",
        "ferry",
        "grippers",
        "spanner",
        "grid",
        "rovers",
    }

    eval_id_lower = eval_id.lower()

    # Pattern 1: Scenario at the beginning (most common)
    parts = eval_id.split("_")
    if parts:
        scenario = parts[0].lower()
        if scenario in known_scenarios:
            return scenario

    # Pattern 2: Scenario at the end (e.g., "-jfan5-..._blocksworld")
    # Check if any known scenario appears at the end
    for scenario in known_scenarios:
        if eval_id_lower.endswith(f"_{scenario}") or eval_id_lower.endswith(scenario):
            return scenario

    # Pattern 3: Scenario anywhere in the eval_id (fallback)
    # Check for exact word matches using underscore/hyphen boundaries
    for scenario in known_scenarios:
        # Look for scenario surrounded by underscores, hyphens, or at boundaries
        pattern = rf"(?:^|[_\-])({scenario})(?:[_\-]|$)"
        if re.search(pattern, eval_id_lower):
            return scenario

    return "unknown"


def create_eval_record(
    run_id: str,
    run_json: Dict[str, Any],
    eval_id: str,
    metrics_json: Dict[str, Any],
    method: str,
) -> EvalRecord:
    """Create an EvalRecord from run.json and metrics.json data."""

    # Infer base model family
    base_model_family = infer_base_model_family(run_json, metrics_json, run_id)

    # Extract metrics
    main_metric = metrics_json.get("success_rate", 0.0)
    total_tests = metrics_json.get("total_tests", 0)
    success_count = metrics_json.get("success_count", 0)
    eval_timestamp = metrics_json.get("timestamp", "")

    # Model path from metrics or run.json
    model_path = metrics_json.get("model_path", "")
    if not model_path:
        model_path = safe_get(run_json, "artifacts", "model_path", default="")

    # Output dir from run.json
    output_dir = safe_get(run_json, "paths", "output_dir", default="")
    if not output_dir:
        output_dir = safe_get(run_json, "artifacts", "model_path", default="")

    # Dataset path
    dataset_path = safe_get(run_json, "dataset", "dataset_path", default="")

    # W&B URL
    wandb_url = safe_get(run_json, "wandb", "url", default="")

    # Category rates
    category_rates = metrics_json.get("category_rates", {})

    # Scenario metrics (for multi-scenario evals - currently single scenario per file)
    scenario = extract_scenario_from_eval_id(eval_id)
    scenario_metrics = {}
    if scenario != "unknown":
        scenario_metrics[scenario] = main_metric

    # Additional fields
    project = run_json.get("project", "")
    seed = safe_get(run_json, "train", "seed", default=0)
    if not seed:
        seed = run_json.get("seed", 0)
    created_at = run_json.get("created_at", "")

    return EvalRecord(
        run_id=run_id,
        eval_id=eval_id,
        method=method,
        base_model_family=base_model_family,
        main_metric=main_metric,
        total_tests=total_tests,
        success_count=success_count,
        eval_timestamp=eval_timestamp,
        model_path=model_path,
        output_dir=output_dir,
        dataset_path=dataset_path,
        wandb_url=wandb_url,
        scenario_metrics=scenario_metrics,
        category_rates=category_rates,
        project=project,
        seed=seed,
        created_at=created_at,
    )


# =============================================================================
# Scanning Functions
# =============================================================================


def process_new_format_metrics(
    run_id: str,
    run_json: Dict[str, Any],
    eval_id: str,
    metrics_json: Dict[str, Any],
    method: str,
    stats: Dict,
) -> List[EvalRecord]:
    """
    Process new format metrics.json with per_scenario and overall fields.

    This format has:
    - eval_id: identifier
    - per_scenario: dict of scenario -> metrics
    - overall: aggregated metrics

    Returns list of EvalRecord (one per scenario, plus optionally overall).
    """
    records = []
    per_scenario = metrics_json.get("per_scenario", {})

    if not per_scenario:
        # Fallback: create single record from overall
        overall = metrics_json.get("overall", {})
        if overall:
            record = create_eval_record_from_new_format(
                run_id=run_id,
                run_json=run_json,
                eval_id=eval_id,
                scenario="unknown",
                scenario_metrics=overall,
                metrics_json=metrics_json,
                method=method,
            )
            if record:
                records.append(record)
        return records

    # Create one record per scenario
    for scenario, scenario_data in per_scenario.items():
        try:
            # Construct a unique eval_id that includes the scenario
            scenario_eval_id = f"{eval_id}__{scenario}"

            record = create_eval_record_from_new_format(
                run_id=run_id,
                run_json=run_json,
                eval_id=scenario_eval_id,
                scenario=scenario,
                scenario_metrics=scenario_data,
                metrics_json=metrics_json,
                method=method,
            )
            if record:
                records.append(record)
                stats["evals_parsed"] += 1
                stats["methods"][method] += 1
                stats["base_model_families"][record.base_model_family] += 1
        except Exception as e:
            logger.warning(f"Error creating record for {eval_id}/{scenario}: {e}")
            stats["parse_errors"] += 1

    return records


def create_eval_record_from_new_format(
    run_id: str,
    run_json: Dict[str, Any],
    eval_id: str,
    scenario: str,
    scenario_metrics: Dict[str, Any],
    metrics_json: Dict[str, Any],
    method: str,
) -> Optional[EvalRecord]:
    """Create an EvalRecord from new format per-scenario metrics."""

    # Infer base model family
    base_model_family = infer_base_model_family(run_json, metrics_json, run_id)

    # Extract metrics from scenario data
    main_metric = scenario_metrics.get("success_rate", 0.0)
    total_tests = scenario_metrics.get("total_tests", 0)
    success_count = scenario_metrics.get("success_count", 0)
    eval_timestamp = metrics_json.get("timestamp", "")

    # Model path from metrics or run.json
    model_path = metrics_json.get("model_path", "")
    if not model_path:
        model_path = safe_get(run_json, "artifacts", "model_path", default="")

    # Output dir from run.json
    output_dir = safe_get(run_json, "paths", "output_dir", default="")
    if not output_dir:
        output_dir = safe_get(run_json, "artifacts", "model_path", default="")

    # Dataset path
    dataset_path = safe_get(run_json, "dataset", "dataset_path", default="")

    # W&B URL
    wandb_url = safe_get(run_json, "wandb", "url", default="")

    # Category rates from scenario data
    category_rates = scenario_metrics.get("category_rates", {})

    # Scenario metrics
    scenario_metrics_dict = {scenario: main_metric} if scenario != "unknown" else {}

    # Additional fields
    project = run_json.get("project", "")
    seed = safe_get(run_json, "train", "seed", default=0)
    if not seed:
        seed = run_json.get("seed", 0)
    created_at = run_json.get("created_at", "")

    return EvalRecord(
        run_id=run_id,
        eval_id=eval_id,
        method=method,
        base_model_family=base_model_family,
        main_metric=main_metric,
        total_tests=total_tests,
        success_count=success_count,
        eval_timestamp=eval_timestamp,
        model_path=model_path,
        output_dir=output_dir,
        dataset_path=dataset_path,
        wandb_url=wandb_url,
        scenario_metrics=scenario_metrics_dict,
        category_rates=category_rates,
        project=project,
        seed=seed,
        created_at=created_at,
    )


def scan_runs_directory(
    runs_root: Path, include_unknown: bool = False
) -> List[EvalRecord]:
    """
    Scan the runs/ directory and collect all eval records.

    Supports two directory structures:
    1. Old format: runs/<method>/<run_id>/evals/<eval_id>.json
    2. New format: runs/<method>/<run_id>/eval/<eval_config>/metrics.json
       with per_scenario and overall fields

    Args:
        runs_root: Path to runs/ directory
        include_unknown: Whether to include runs/unknown/ directory

    Returns:
        List of EvalRecord objects
    """
    records = []
    stats = {
        "runs_scanned": 0,
        "evals_found": 0,
        "evals_parsed": 0,
        "parse_errors": 0,
        "methods": defaultdict(int),
        "base_model_families": defaultdict(int),
    }

    # Methods to scan
    methods = ["sft", "dpo", "grpo"]
    if include_unknown:
        methods.append("unknown")

    for method in methods:
        method_dir = runs_root / method
        if not method_dir.exists():
            logger.debug(f"Method directory not found: {method_dir}")
            continue

        # Iterate over run directories
        for run_dir in method_dir.iterdir():
            if not run_dir.is_dir():
                continue

            stats["runs_scanned"] += 1
            run_id = run_dir.name

            # Parse run.json
            run_json_path = run_dir / "run.json"
            if not run_json_path.exists():
                logger.debug(f"No run.json found in {run_dir}")
                continue

            run_json = parse_run_json(run_json_path)
            if run_json is None:
                stats["parse_errors"] += 1
                continue

            # Try both eval directory structures

            # Structure 1: evals/ directory with individual JSON files (old format)
            evals_dir = run_dir / "evals"
            if evals_dir.exists():
                for eval_file in evals_dir.iterdir():
                    if not eval_file.name.endswith(".json"):
                        continue

                    stats["evals_found"] += 1
                    eval_id = eval_file.stem  # filename without .json

                    # Parse metrics.json
                    metrics_json = parse_metrics_json(eval_file)
                    if metrics_json is None:
                        stats["parse_errors"] += 1
                        continue

                    # Check if this is new format (has per_scenario/overall)
                    if "per_scenario" in metrics_json or "overall" in metrics_json:
                        new_records = process_new_format_metrics(
                            run_id=run_id,
                            run_json=run_json,
                            eval_id=eval_id,
                            metrics_json=metrics_json,
                            method=method,
                            stats=stats,
                        )
                        records.extend(new_records)
                    else:
                        # Old format: create single record
                        try:
                            record = create_eval_record(
                                run_id=run_id,
                                run_json=run_json,
                                eval_id=eval_id,
                                metrics_json=metrics_json,
                                method=method,
                            )
                            records.append(record)
                            stats["evals_parsed"] += 1
                            stats["methods"][method] += 1
                            stats["base_model_families"][record.base_model_family] += 1
                        except Exception as e:
                            logger.warning(f"Error creating record for {eval_file}: {e}")
                            stats["parse_errors"] += 1

            # Structure 2: eval/ directory with subdirectories (new format)
            eval_dir = run_dir / "eval"
            if eval_dir.exists():
                for eval_config_dir in eval_dir.iterdir():
                    if not eval_config_dir.is_dir():
                        continue

                    # Look for metrics.json in the config directory
                    metrics_file = eval_config_dir / "metrics.json"
                    if not metrics_file.exists():
                        continue

                    stats["evals_found"] += 1
                    eval_id = eval_config_dir.name  # directory name as eval_id

                    metrics_json = parse_metrics_json(metrics_file)
                    if metrics_json is None:
                        stats["parse_errors"] += 1
                        continue

                    # Use eval_id from metrics if available
                    if "eval_id" in metrics_json:
                        eval_id = metrics_json["eval_id"]

                    # Process new format metrics
                    new_records = process_new_format_metrics(
                        run_id=run_id,
                        run_json=run_json,
                        eval_id=eval_id,
                        metrics_json=metrics_json,
                        method=method,
                        stats=stats,
                    )
                    records.extend(new_records)

    # Log stats
    logger.info(f"Scan complete:")
    logger.info(f"  Runs scanned: {stats['runs_scanned']}")
    logger.info(f"  Evals found: {stats['evals_found']}")
    logger.info(f"  Evals parsed: {stats['evals_parsed']}")
    logger.info(f"  Parse errors: {stats['parse_errors']}")
    logger.info(f"  Methods: {dict(stats['methods'])}")
    logger.info(f"  Base model families: {dict(stats['base_model_families'])}")

    return records


# =============================================================================
# Filtering and Sorting
# =============================================================================


def filter_records(
    records: List[EvalRecord],
    only_method: Optional[str] = None,
    only_eval_id: Optional[str] = None,
    only_base_model_family: Optional[str] = None,
) -> List[EvalRecord]:
    """Filter records based on criteria."""
    filtered = records

    if only_method:
        filtered = [r for r in filtered if r.method == only_method]

    if only_eval_id:
        filtered = [r for r in filtered if only_eval_id in r.eval_id]

    if only_base_model_family:
        normalized = normalize_base_model_family(only_base_model_family)
        filtered = [r for r in filtered if r.base_model_family == normalized]

    return filtered


def sort_records(
    records: List[EvalRecord], sort_order: str = "desc"
) -> List[EvalRecord]:
    """Sort records by main_metric (success_rate)."""
    reverse = sort_order == "desc"
    return sorted(records, key=lambda r: r.main_metric, reverse=reverse)


# =============================================================================
# Output Generation
# =============================================================================


def generate_csv(records: List[EvalRecord], out_path: Path):
    """Generate leaderboard.csv file."""
    if not records:
        logger.warning("No records to write to CSV")
        return

    # Collect all possible columns
    all_keys = set()
    for r in records:
        all_keys.update(r.to_dict().keys())

    # Define column order (core columns first, then scenario, then category)
    core_columns = [
        "run_id",
        "method",
        "base_model_family",
        "eval_id",
        "eval_timestamp",
        "main_metric",
        "total_tests",
        "success_count",
        "model_path",
        "output_dir",
        "dataset_path",
        "wandb_url",
        "project",
        "seed",
        "created_at",
    ]
    scenario_columns = sorted([k for k in all_keys if k.startswith("scenario_")])
    category_columns = sorted([k for k in all_keys if k.startswith("category_")])

    columns = core_columns + scenario_columns + category_columns

    # Write CSV
    import csv

    with open(out_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=columns, extrasaction="ignore")
        writer.writeheader()
        for r in records:
            writer.writerow(r.to_dict())

    logger.info(f"Generated CSV: {out_path} ({len(records)} records)")


def generate_markdown(records: List[EvalRecord], out_path: Path, top_k: int = 50):
    """
    Generate leaderboard.md with tables grouped by base_model_family.

    Structure:
    - Top-level grouping by base_model_family
    - Within each family, grouped by scenario (extracted from eval_id)
    """
    if not records:
        logger.warning("No records to write to Markdown")
        return

    # Group by base_model_family, then by scenario
    by_family: Dict[str, Dict[str, List[EvalRecord]]] = defaultdict(
        lambda: defaultdict(list)
    )
    for r in records:
        scenario = extract_scenario_from_eval_id(r.eval_id)
        by_family[r.base_model_family][scenario].append(r)

    # Sort families
    sorted_families = sorted(by_family.keys(), key=lambda x: (x == "unknown", x))

    lines = []
    lines.append("# PDDL Planning Leaderboard")
    lines.append("")
    lines.append(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("")
    lines.append(f"Total records: {len(records)}")
    lines.append("")

    # Table of contents
    lines.append("## Table of Contents")
    lines.append("")
    for family in sorted_families:
        lines.append(f"- [{family}](#{family.replace(' ', '-')})")
    lines.append("")

    # Generate sections for each family
    for family in sorted_families:
        lines.append(f"## {family}")
        lines.append("")

        scenarios = by_family[family]
        sorted_scenarios = sorted(scenarios.keys(), key=lambda x: (x == "unknown", x))

        for scenario in sorted_scenarios:
            scenario_records = scenarios[scenario]
            # Sort by main_metric descending
            scenario_records = sorted(
                scenario_records, key=lambda r: r.main_metric, reverse=True
            )[:top_k]

            lines.append(f"### {scenario.capitalize()}")
            lines.append("")

            # Markdown table header
            lines.append(
                "| Rank | Method | Success Rate | Total | Model Path | Run ID |"
            )
            lines.append(
                "|------|--------|--------------|-------|------------|--------|"
            )

            for i, r in enumerate(scenario_records, 1):
                # Truncate model path for readability
                model_path_short = r.model_path
                if len(model_path_short) > 40:
                    model_path_short = "..." + model_path_short[-37:]
                run_id_short = r.run_id[:30] + "..." if len(r.run_id) > 30 else r.run_id

                lines.append(
                    f"| {i} | {r.method} | {r.main_metric:.2f}% | {r.total_tests} | `{model_path_short}` | `{run_id_short}` |"
                )

            lines.append("")

    # Write file
    with open(out_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    logger.info(f"Generated Markdown: {out_path}")


def find_best_records(
    records: List[EvalRecord],
) -> Dict[Tuple[str, str], EvalRecord]:
    """
    Find the best record for each (scenario, base_model_family) pair.

    Tie-breaking rules:
    1. Higher main_metric (success_rate)
    2. More total_tests
    3. More recent eval_timestamp
    4. Lexicographically smaller run_id
    """
    # Group by (scenario, base_model_family)
    groups: Dict[Tuple[str, str], List[EvalRecord]] = defaultdict(list)
    for r in records:
        scenario = extract_scenario_from_eval_id(r.eval_id)
        key = (scenario, r.base_model_family)
        groups[key].append(r)

    best_records = {}
    for key, group in groups.items():

        def sort_key(r: EvalRecord):
            # Parse timestamp for comparison
            try:
                ts = datetime.fromisoformat(r.eval_timestamp.replace("Z", "+00:00"))
            except:
                ts = datetime.min
            return (
                -r.main_metric,  # Higher is better (negate for ascending sort)
                -r.total_tests,  # Higher is better
                ts,  # Keep as-is, will reverse to prefer newer
                r.run_id,  # Lexicographically smaller
            )

        # Sort with custom key and pick the first one
        sorted_group = sorted(group, key=sort_key)
        # For timestamp, we want newer (higher) to win, so we need to re-sort
        # Actually, let's do this properly with multiple criteria
        best = max(
            group,
            key=lambda r: (
                r.main_metric,
                r.total_tests,
                r.eval_timestamp,
                -ord(r.run_id[0]) if r.run_id else 0,
            ),
        )
        best_records[key] = best

    return best_records


def generate_best_outputs(
    best_records: Dict[Tuple[str, str], EvalRecord], best_dir: Path
):
    """Generate best/ directory with JSON and TXT files for each best record."""
    best_dir.mkdir(parents=True, exist_ok=True)

    for (scenario, family), record in best_records.items():
        # Sanitize names for filenames
        scenario_safe = re.sub(r"[^\w\-]", "_", scenario)
        family_safe = re.sub(r"[^\w\-]", "_", family)

        base_name = f"BEST_{scenario_safe}__{family_safe}"

        # JSON output
        json_path = best_dir / f"{base_name}.json"
        with open(json_path, "w", encoding="utf-8") as f:
            json.dump(record.to_dict(), f, indent=2, default=str)

        # TXT output (human readable summary)
        txt_path = best_dir / f"{base_name}.txt"
        with open(txt_path, "w", encoding="utf-8") as f:
            f.write(f"BEST RESULT: {scenario} / {family}\n")
            f.write("=" * 60 + "\n\n")
            f.write(f"Run ID:           {record.run_id}\n")
            f.write(f"Eval ID:          {record.eval_id}\n")
            f.write(f"Method:           {record.method}\n")
            f.write(f"Base Model:       {record.base_model_family}\n")
            f.write(f"\n")
            f.write(f"Success Rate:     {record.main_metric:.2f}%\n")
            f.write(f"Success Count:    {record.success_count}/{record.total_tests}\n")
            f.write(f"\n")
            f.write(f"Model Path:       {record.model_path}\n")
            f.write(f"Dataset:          {record.dataset_path}\n")
            f.write(f"W&B URL:          {record.wandb_url}\n")
            f.write(f"\n")
            f.write(f"Eval Timestamp:   {record.eval_timestamp}\n")
            f.write(f"Created At:       {record.created_at}\n")

            if record.category_rates:
                f.write(f"\nCategory Breakdown:\n")
                for cat, rate in record.category_rates.items():
                    f.write(f"  {cat}: {rate:.2f}%\n")

    logger.info(f"Generated best outputs: {best_dir} ({len(best_records)} records)")


# =============================================================================
# CLI
# =============================================================================


def parse_args():
    parser = argparse.ArgumentParser(
        description="Generate leaderboard from runs/ directory",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    python tools/build_leaderboard.py --runs_root ./runs --out_md ./leaderboard.md
    python tools/build_leaderboard.py --only_method grpo --only_base_model_family qwen3-14b
    python tools/build_leaderboard.py --include_unknown --top_k 100
        """,
    )

    parser.add_argument(
        "--runs_root",
        type=Path,
        default=Path("./runs"),
        help="Path to runs/ directory (default: ./runs)",
    )
    parser.add_argument(
        "--out_csv",
        type=Path,
        default=Path("./leaderboard.csv"),
        help="Output CSV path (default: ./leaderboard.csv)",
    )
    parser.add_argument(
        "--out_md",
        type=Path,
        default=Path("./leaderboard.md"),
        help="Output Markdown path (default: ./leaderboard.md)",
    )
    parser.add_argument(
        "--best_dir",
        type=Path,
        default=Path("./best"),
        help="Output directory for best records (default: ./best)",
    )
    parser.add_argument(
        "--include_unknown",
        action="store_true",
        help="Include runs/unknown/ directory in scan",
    )
    parser.add_argument(
        "--only_eval_id",
        type=str,
        default=None,
        help="Filter to eval IDs containing this string",
    )
    parser.add_argument(
        "--only_method",
        type=str,
        choices=["sft", "dpo", "grpo"],
        default=None,
        help="Filter to specific method",
    )
    parser.add_argument(
        "--only_base_model_family",
        type=str,
        default=None,
        help="Filter to specific base model family",
    )
    parser.add_argument(
        "--top_k",
        type=int,
        default=50,
        help="Maximum records per group in Markdown output (default: 50)",
    )
    parser.add_argument(
        "--sort",
        type=str,
        choices=["desc", "asc"],
        default="desc",
        help="Sort order for main_metric (default: desc)",
    )
    parser.add_argument(
        "--verbose", "-v", action="store_true", help="Enable verbose logging"
    )

    return parser.parse_args()


def main():
    args = parse_args()

    if args.verbose:
        logging.getLogger().setLevel(logging.DEBUG)

    # Validate runs_root
    if not args.runs_root.exists():
        logger.error(f"Runs directory not found: {args.runs_root}")
        sys.exit(1)

    logger.info(f"Scanning runs directory: {args.runs_root}")

    # Scan and collect records
    records = scan_runs_directory(args.runs_root, include_unknown=args.include_unknown)

    if not records:
        logger.warning("No eval records found!")
        sys.exit(0)

    # Filter records
    records = filter_records(
        records,
        only_method=args.only_method,
        only_eval_id=args.only_eval_id,
        only_base_model_family=args.only_base_model_family,
    )

    if not records:
        logger.warning("No records after filtering!")
        sys.exit(0)

    logger.info(f"Processing {len(records)} records after filtering")

    # Sort records
    records = sort_records(records, sort_order=args.sort)

    # Generate outputs
    generate_csv(records, args.out_csv)
    generate_markdown(records, args.out_md, top_k=args.top_k)

    # Find and output best records
    best_records = find_best_records(records)
    generate_best_outputs(best_records, args.best_dir)

    logger.info("Leaderboard generation complete!")


if __name__ == "__main__":
    main()
