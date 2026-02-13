#!/usr/bin/env python3
"""
Result processing and summary generation for benchmark solvers.
"""
from __future__ import annotations

import csv
import json
from pathlib import Path
from statistics import mean
from typing import Any, Dict, List, Optional, Tuple, Union

from benchmark_common import (
    WORKSPACE_ROOT,
    SolverOutcome,
    extract_parameter_value,
    path_to_workspace_str,
)


def format_elapsed(outcome: SolverOutcome) -> str:
    """Format elapsed time for CSV output."""
    if outcome.status == "timeout":
        return "timeout"
    if outcome.elapsed_seconds is None:
        return ""
    return f"{outcome.elapsed_seconds:.3f}"


def _format_rate(numerator: int, denominator: int) -> float:
    """Format rate as percentage."""
    return (numerator / denominator * 100.0) if denominator else 0.0


def _format_seconds(value: Optional[float]) -> Optional[float]:
    """Format seconds value."""
    return round(value, 3) if value is not None else None


def _calculate_metrics(
    scenario: str,
    problems: List[Path],
    results: Dict[Tuple[str, str], SolverOutcome],
    include_missing_as_failure: bool,
) -> Tuple[Dict[str, Union[int, float, Optional[float]]], List[float]]:
    """Calculate metrics for a scenario."""
    total = len(problems)
    success = 0
    timeout = 0
    failure = 0
    elapsed: List[float] = []

    for problem in problems:
        key = (scenario, problem.name)
        outcome = results.get(key)
        if outcome is None:
            if include_missing_as_failure:
                failure += 1
            continue

        if outcome.validation == "valid":
            success += 1
            if outcome.elapsed_seconds is not None:
                elapsed.append(outcome.elapsed_seconds)
        elif outcome.status == "timeout":
            timeout += 1
        else:
            failure += 1

    metrics: Dict[str, Union[int, float, Optional[float]]] = {
        "total_problems": total,
        "success_count": success,
        "timeout_count": timeout,
        "failure_count": failure,
        "success_rate_percent": _format_rate(success, total),
        "timeout_rate_percent": _format_rate(timeout, total),
        "failure_rate_percent": _format_rate(failure, total),
        "avg_elapsed_seconds_success": _format_seconds(mean(elapsed) if elapsed else None),
    }
    return metrics, elapsed


def compute_solver_summary(
    generated: Dict[str, List[Path]],
    results: Dict[Tuple[str, str], SolverOutcome],
    only_present: bool = False,
) -> Dict[str, Dict[str, Union[int, float, Optional[float]]]]:
    """Compute summary statistics for solver results."""
    summary: Dict[str, Dict[str, Union[int, float, Optional[float]]]] = {}
    total_counts = {
        "total": 0,
        "success": 0,
        "timeout": 0,
        "failure": 0,
        "elapsed": [],
    }

    for scenario, problems in generated.items():
        if only_present:
            considered = [p for p in problems if (scenario, p.name) in results]
        else:
            considered = list(problems)

        metrics, elapsed = _calculate_metrics(
            scenario,
            considered,
            results,
            include_missing_as_failure=not only_present,
        )

        summary[scenario] = metrics

        total_counts["total"] += metrics["total_problems"]
        total_counts["success"] += metrics["success_count"]
        total_counts["timeout"] += metrics["timeout_count"]
        total_counts["failure"] += metrics["failure_count"]
        total_counts["elapsed"].extend(elapsed)

    total = total_counts["total"]
    total_metrics: Dict[str, Union[int, float, Optional[float]]] = {
        "total_problems": total,
        "success_count": total_counts["success"],
        "timeout_count": total_counts["timeout"],
        "failure_count": total_counts["failure"],
        "success_rate_percent": _format_rate(total_counts["success"], total),
        "timeout_rate_percent": _format_rate(total_counts["timeout"], total),
        "failure_rate_percent": _format_rate(total_counts["failure"], total),
        "avg_elapsed_seconds_success": _format_seconds(
            mean(total_counts["elapsed"]) if total_counts["elapsed"] else None
        ),
    }
    summary["ALL"] = total_metrics
    return summary


def _summary_to_csv_rows(
    solver_name: str, summary: Dict[str, Dict[str, Union[int, float, Optional[float]]]]
) -> List[Dict[str, str]]:
    """Convert summary to CSV rows."""
    rows: List[Dict[str, str]] = []
    for scenario, metrics in summary.items():
        rows.append(
            {
                "solver": solver_name,
                "scenario": scenario,
                "total_problems": str(metrics["total_problems"]),
                "success_count": str(metrics["success_count"]),
                "success_rate_percent": f"{metrics['success_rate_percent']:.2f}",
                "timeout_count": str(metrics["timeout_count"]),
                "timeout_rate_percent": f"{metrics['timeout_rate_percent']:.2f}",
                "failure_count": str(metrics["failure_count"]),
                "failure_rate_percent": f"{metrics['failure_rate_percent']:.2f}",
                "avg_elapsed_seconds_success": (
                    f"{metrics['avg_elapsed_seconds_success']:.3f}"
                    if metrics["avg_elapsed_seconds_success"] is not None
                    else ""
                ),
            }
        )
    return rows


def write_summary_csv(
    benchmark_dir: Path,
    optic_summary: Dict[str, Dict[str, Union[int, float, Optional[float]]]],
    llm_summary: Optional[Dict[str, Dict[str, Union[int, float, Optional[float]]]]],
) -> None:
    """Write summary statistics to CSV file."""
    summary_path = benchmark_dir / "solver_summary.csv"
    fieldnames = [
        "solver",
        "scenario",
        "total_problems",
        "success_count",
        "success_rate_percent",
        "timeout_count",
        "timeout_rate_percent",
        "failure_count",
        "failure_rate_percent",
        "avg_elapsed_seconds_success",
    ]

    rows: List[Dict[str, str]] = []
    if optic_summary:
        rows.extend(_summary_to_csv_rows("optic", optic_summary))
    if llm_summary:
        rows.extend(_summary_to_csv_rows("llm", llm_summary))

    with summary_path.open("w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def outcome_to_json(outcome: Optional[SolverOutcome]) -> Optional[Dict[str, Union[str, float, None]]]:
    """Convert SolverOutcome to JSON-serializable dict."""
    if outcome is None:
        return None
    return {
        "status": outcome.status,
        "validation": outcome.validation,
        "elapsed_seconds": _format_seconds(outcome.elapsed_seconds),
        "plan_path": path_to_workspace_str(outcome.plan_path),
        "log_path": path_to_workspace_str(outcome.log_path),
        "notes": outcome.notes or "",
        "validation_stdout": outcome.validation_stdout or "",
    }


def write_summary_json(
    benchmark_dir: Path,
    generated: Dict[str, List[Path]],
    optic_results: Dict[Tuple[str, str], SolverOutcome],
    llm_results: Dict[Tuple[str, str], SolverOutcome],
    optic_summary: Dict[str, Dict[str, Union[int, float, Optional[float]]]],
    llm_summary: Optional[Dict[str, Dict[str, Union[int, float, Optional[float]]]]],
    instances_per_parameter: int,
    problems_per_scenario: int,
    time_limit: float,
    llm_model: str,
    llm_family: str,
    llm_max_new_tokens: int,
    llm_hardest_only: bool,
    output_filename: str = "solver_summary.json",
) -> None:
    """Write summary statistics to JSON file."""
    summary_path = benchmark_dir / output_filename

    scenarios_data: Dict[str, Dict[str, Union[List[Dict[str, Union[str, int, None, Dict[str, Union[str, float, None]]]]], Dict[str, Union[int, float, Optional[float]]], None]]] = {}

    for scenario, problems in generated.items():
        problems_info: List[Dict[str, Union[str, int, None, Dict[str, Union[str, float, None]]]]] = []
        for problem in problems:
            key = (scenario, problem.name)
            problems_info.append(
                {
                    "problem": problem.name,
                    "problem_path": path_to_workspace_str(problem),
                    "parameter_value": extract_parameter_value(scenario, problem),
                    "optic": outcome_to_json(optic_results.get(key)),
                    "llm": outcome_to_json(llm_results.get(key)),
                }
            )

        scenarios_data[scenario] = {
            "problems": problems_info,
            "optic_summary": optic_summary.get(scenario, {}),
            "llm_summary": llm_summary.get(scenario, {}) if llm_summary else None,
        }

    data = {
        "parameters": {
            "instances_per_parameter": instances_per_parameter,
            "problems_per_scenario": problems_per_scenario,
            "optic_time_limit": time_limit,
            "llm_model": llm_model,
            "llm_family": llm_family,
            "llm_max_new_tokens": llm_max_new_tokens,
            "llm_hardest_only": llm_hardest_only,
        },
        "scenarios": scenarios_data,
        "optic_summary": optic_summary,
        "llm_summary": llm_summary if llm_summary else None,
    }

    with summary_path.open("w", encoding="utf-8") as fh:
        json.dump(data, fh, indent=2)


def merge_results(
    generated: Dict[str, List[Path]],
    optic_results: Dict[Tuple[str, str], SolverOutcome],
    llm_results: Dict[Tuple[str, str], SolverOutcome],
    results_csv: Path,
) -> None:
    """Write combined OPTIC and LLM results to CSV file."""
    fieldnames = [
        "scenario",
        "problem",
        "optic_status",
        "optic_validation",
        "optic_elapsed",
        "optic_plan_path",
        "optic_log_path",
        "optic_notes",
        "llm_status",
        "llm_validation",
        "llm_elapsed",
        "llm_plan_path",
        "llm_notes",
    ]

    with results_csv.open("w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=fieldnames)
        writer.writeheader()

        for scenario, problems in generated.items():
            for problem_path in problems:
                key = (scenario, problem_path.name)
                optic_out = optic_results.get(key, SolverOutcome())
                llm_out = llm_results.get(key, SolverOutcome())
                
                optic_plan_path = ""
                if optic_out.plan_path and optic_out.plan_path.exists():
                    try:
                        optic_plan_path = str(optic_out.plan_path.resolve().relative_to(WORKSPACE_ROOT))
                    except ValueError:
                        optic_plan_path = str(optic_out.plan_path.resolve())
                
                optic_log_path = ""
                if optic_out.log_path and optic_out.log_path.exists():
                    try:
                        optic_log_path = str(optic_out.log_path.resolve().relative_to(WORKSPACE_ROOT))
                    except ValueError:
                        optic_log_path = str(optic_out.log_path.resolve())
                
                llm_plan_path = ""
                if llm_out.plan_path and llm_out.plan_path.exists():
                    try:
                        llm_plan_path = str(llm_out.plan_path.resolve().relative_to(WORKSPACE_ROOT))
                    except ValueError:
                        llm_plan_path = str(llm_out.plan_path.resolve())
                
                writer.writerow({
                    "scenario": scenario,
                    "problem": problem_path.name,
                    "optic_status": optic_out.status,
                    "optic_validation": optic_out.validation,
                    "optic_elapsed": format_elapsed(optic_out),
                    "optic_plan_path": optic_plan_path,
                    "optic_log_path": optic_log_path,
                    "optic_notes": optic_out.notes or "",
                    "llm_status": llm_out.status,
                    "llm_validation": llm_out.validation,
                    "llm_elapsed": format_elapsed(llm_out),
                    "llm_plan_path": llm_plan_path,
                    "llm_notes": llm_out.notes or "",
                })

