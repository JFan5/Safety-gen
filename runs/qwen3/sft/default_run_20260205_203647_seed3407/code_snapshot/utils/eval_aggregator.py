#!/usr/bin/env python3
"""
Eval Aggregator - Aggregate multi-scenario evaluation results into metrics.json.

This module provides functions to:
1. Aggregate per-scenario JSON files into a unified metrics.json
2. Calculate overall statistics (weighted average)
3. Handle missing or malformed scenario files gracefully
"""

import json
from pathlib import Path
from datetime import datetime
from typing import Dict, List, Optional, Any
from collections import defaultdict


def aggregate_scenario_results(
    scenarios_dir: Path,
    eval_id: str = None,
    model_path: str = None
) -> Dict[str, Any]:
    """
    Aggregate results from all scenario JSON files.

    Args:
        scenarios_dir: Path to scenarios/ directory containing per-scenario JSONs
        eval_id: Evaluation identifier (for metadata)
        model_path: Model path (for metadata)

    Returns:
        Aggregated metrics dictionary ready to be written as metrics.json
    """
    scenarios_dir = Path(scenarios_dir)

    if not scenarios_dir.exists():
        return _create_empty_metrics(eval_id, model_path, "scenarios_dir not found")

    # Find all JSON files in scenarios directory
    json_files = list(scenarios_dir.glob("*.json"))

    if not json_files:
        return _create_empty_metrics(eval_id, model_path, "no scenario files found")

    # Aggregate per-scenario results
    per_scenario = {}
    warnings = []

    # Overall accumulators
    total_tests_all = 0
    success_count_all = 0

    # Category accumulators (for optional aggregation)
    overall_category_counts = defaultdict(int)

    for json_file in sorted(json_files):
        scenario_name = json_file.stem  # e.g., "blocksworld" from "blocksworld.json"

        try:
            with open(json_file) as f:
                data = json.load(f)

            # Extract core metrics
            total_tests = data.get("total_tests", 0)
            success_count = data.get("success_count", 0)
            success_rate = data.get("success_rate", 0.0)

            # Store per-scenario results
            per_scenario[scenario_name] = {
                "total_tests": total_tests,
                "success_count": success_count,
                "success_rate": round(success_rate, 2)
            }

            # Add optional detailed fields if present
            if "category_counts" in data:
                per_scenario[scenario_name]["category_counts"] = dict(data["category_counts"])

            if "category_rates" in data:
                per_scenario[scenario_name]["category_rates"] = dict(data["category_rates"])

            if "size_success_rates" in data:
                per_scenario[scenario_name]["size_success_rates"] = dict(data["size_success_rates"])

            # Accumulate for overall
            total_tests_all += total_tests
            success_count_all += success_count

            # Accumulate category counts
            if "category_counts" in data:
                for cat, count in data["category_counts"].items():
                    overall_category_counts[cat] += count

        except json.JSONDecodeError as e:
            warnings.append(f"Failed to parse {json_file.name}: {str(e)}")
        except Exception as e:
            warnings.append(f"Error reading {json_file.name}: {str(e)}")

    # Calculate overall success rate (weighted average)
    success_rate_all = (success_count_all / total_tests_all * 100) if total_tests_all > 0 else 0.0

    # Build metrics dictionary
    metrics = {
        "eval_id": eval_id,
        "timestamp": datetime.now().isoformat(),
        "model_path": model_path,
        "per_scenario": per_scenario,
        "overall": {
            "total_tests": total_tests_all,
            "success_count": success_count_all,
            "success_rate": round(success_rate_all, 2),
            "num_scenarios": len(per_scenario)
        }
    }

    # Add overall category statistics if available
    if overall_category_counts:
        metrics["overall"]["category_counts"] = dict(overall_category_counts)

        # Calculate overall category rates
        if total_tests_all > 0:
            metrics["overall"]["category_rates"] = {
                cat: round(count / total_tests_all * 100, 2)
                for cat, count in overall_category_counts.items()
            }

    # Add warnings if any
    if warnings:
        metrics["warnings"] = warnings

    return metrics


def _create_empty_metrics(
    eval_id: str = None,
    model_path: str = None,
    error_message: str = None
) -> Dict[str, Any]:
    """Create an empty/error metrics structure."""
    metrics = {
        "eval_id": eval_id,
        "timestamp": datetime.now().isoformat(),
        "model_path": model_path,
        "per_scenario": {},
        "overall": {
            "total_tests": 0,
            "success_count": 0,
            "success_rate": 0.0,
            "num_scenarios": 0
        }
    }

    if error_message:
        metrics["error"] = error_message

    return metrics


def write_metrics_json(
    metrics: Dict[str, Any],
    output_path: Path
) -> bool:
    """
    Write metrics dictionary to JSON file.

    Args:
        metrics: Aggregated metrics dictionary
        output_path: Path to output metrics.json

    Returns:
        True if successful, False otherwise
    """
    try:
        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)

        with open(output_path, "w", encoding="utf-8") as f:
            json.dump(metrics, f, indent=2, ensure_ascii=False)

        return True
    except Exception as e:
        print(f"Error writing metrics.json: {e}")
        return False


def write_eval_config(
    config: Dict[str, Any],
    output_path: Path
) -> bool:
    """
    Write evaluation config to YAML file.

    Args:
        config: Evaluation configuration dictionary
        output_path: Path to output eval_config.yaml

    Returns:
        True if successful, False otherwise
    """
    try:
        import yaml
        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)

        with open(output_path, "w", encoding="utf-8") as f:
            yaml.dump(config, f, default_flow_style=False, allow_unicode=True)

        return True
    except ImportError:
        # Fallback to JSON if yaml not available
        try:
            output_path = Path(str(output_path).replace(".yaml", ".json"))
            with open(output_path, "w", encoding="utf-8") as f:
                json.dump(config, f, indent=2, ensure_ascii=False)
            return True
        except Exception as e:
            print(f"Error writing eval config: {e}")
            return False
    except Exception as e:
        print(f"Error writing eval_config.yaml: {e}")
        return False


def aggregate_and_write_metrics(
    eval_output_dir: Path,
    eval_id: str,
    model_path: str,
    eval_config: Dict[str, Any] = None
) -> Optional[Dict[str, Any]]:
    """
    High-level function to aggregate scenario results and write metrics.json.

    Args:
        eval_output_dir: Path to eval output directory (containing scenarios/)
        eval_id: Evaluation identifier
        model_path: Model path
        eval_config: Optional evaluation config to write

    Returns:
        Aggregated metrics dictionary, or None if failed
    """
    eval_output_dir = Path(eval_output_dir)
    scenarios_dir = eval_output_dir / "scenarios"

    # Aggregate results
    metrics = aggregate_scenario_results(scenarios_dir, eval_id, model_path)

    # Write metrics.json
    metrics_path = eval_output_dir / "metrics.json"
    if not write_metrics_json(metrics, metrics_path):
        print(f"Warning: Failed to write {metrics_path}")
        return None

    # Write eval_config.yaml if provided
    if eval_config:
        config_path = eval_output_dir / "eval_config.yaml"
        write_eval_config(eval_config, config_path)

    return metrics


def print_metrics_summary(metrics: Dict[str, Any]) -> None:
    """Print a formatted summary of metrics."""
    print("\n" + "=" * 60)
    print("AGGREGATED METRICS SUMMARY")
    print("=" * 60)

    overall = metrics.get("overall", {})
    print(f"Total tests: {overall.get('total_tests', 0)}")
    print(f"Success count: {overall.get('success_count', 0)}")
    print(f"Overall success rate: {overall.get('success_rate', 0):.2f}%")
    print(f"Number of scenarios: {overall.get('num_scenarios', 0)}")

    per_scenario = metrics.get("per_scenario", {})
    if per_scenario:
        print("\nPer-scenario breakdown:")
        for scenario, data in sorted(per_scenario.items()):
            total = data.get("total_tests", 0)
            success = data.get("success_count", 0)
            rate = data.get("success_rate", 0)
            print(f"  {scenario}: {success}/{total} ({rate:.2f}%)")

    if "warnings" in metrics:
        print(f"\nWarnings ({len(metrics['warnings'])}):")
        for warning in metrics["warnings"]:
            print(f"  - {warning}")

    print("=" * 60)
