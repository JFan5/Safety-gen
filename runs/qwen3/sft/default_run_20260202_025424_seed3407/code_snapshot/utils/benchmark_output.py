"""
Benchmark output utilities for organizing and saving benchmark results.

This module provides functions for:
- Creating standardized benchmark output directories
- Saving run configurations with commands
- Computing and saving level-based statistics
"""

import json
import sys
from datetime import datetime
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional
from collections import defaultdict
import re

# Default benchmark output directory
DEFAULT_BENCHMARK_DIR = Path("runs/benchmark")


def create_benchmark_run_dir(
    solver_type: str,
    domain: str,
    model: Optional[str] = None,
    output_dir: Optional[Path] = None,
) -> Path:
    """
    Create a benchmark run directory with standardized naming.

    Structure: {output_dir}/{solver_type}/{model_name}_{domain}_{timestamp}/
    For solvers without model (e.g., optic): {output_dir}/{solver_type}/{domain}_{timestamp}/

    Args:
        solver_type: Type of solver (optic, gemini, llm)
        domain: Domain name (blocksworld, ferry, etc.)
        model: Model name/path (optional, for gemini/llm)
        output_dir: Base output directory (default: runs/benchmark/)

    Returns:
        Path to the created run directory
    """
    base_dir = output_dir or DEFAULT_BENCHMARK_DIR
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")

    # Clean model name for directory
    if model:
        model_clean = Path(model).name if "/" in model or "\\" in model else model
        model_clean = model_clean.replace("/", "_").replace("\\", "_").replace(" ", "_")
        run_name = f"{model_clean}_{domain}_{timestamp}"
    else:
        run_name = f"{domain}_{timestamp}"

    run_dir = base_dir / solver_type / run_name
    run_dir.mkdir(parents=True, exist_ok=True)

    return run_dir


def save_run_config(
    run_dir: Path,
    command: str,
    config: Dict[str, Any],
    solver_type: str,
    model: Optional[str] = None,
    domain: Optional[str] = None,
) -> Path:
    """
    Save run configuration to run_config.json.

    Args:
        run_dir: Directory to save the config
        command: Full command used to run the benchmark
        config: Additional configuration parameters
        solver_type: Type of solver (optic, gemini, llm)
        model: Model name/path
        domain: Domain name

    Returns:
        Path to the saved config file
    """
    config_data = {
        "command": command,
        "timestamp": datetime.now().isoformat(),
        "solver_type": solver_type,
        "model": model or "N/A",
        "domain": domain,
        "parameters": config,
    }

    config_path = run_dir / "run_config.json"
    with open(config_path, "w", encoding="utf-8") as f:
        json.dump(config_data, f, indent=2, ensure_ascii=False)

    return config_path


def extract_size_key(problem_name: str, domain: str) -> Optional[str]:
    """
    Extract difficulty level key from problem name based on domain.

    Args:
        problem_name: Name of the problem file (without extension)
        domain: Domain name (blocksworld, ferry, etc.)

    Returns:
        Size key string (e.g., "ops3-n3") or None if not extractable
    """
    name = problem_name.lower()
    domain = domain.lower() if domain else ""

    # Delivery: sizeX packagesY
    if domain == "delivery":
        m = re.search(r"size(\d+)[-_]?packages?(\d+)", name)
        if m:
            return f"s{int(m.group(1))}-p{int(m.group(2))}"
        m = re.search(r"s(\d+)[-_]?p(\d+)", name)
        if m:
            return f"s{m.group(1)}-p{m.group(2)}"

    # Blocksworld: opsX_nY
    if domain == "blocksworld":
        m = re.search(r"ops(\d+).*n0*([0-9]+)", name)
        if m:
            return f"ops{int(m.group(1))}-n{int(m.group(2))}"

    # Ferry: lX-cY
    if domain == "ferry":
        m = re.search(r"l0*([0-9]+).*c0*([0-9]+)", name)
        if m:
            return f"l{int(m.group(1))}-c{int(m.group(2))}"

    # Spanner: sX-nY-lZ
    if domain == "spanner":
        m = re.search(r"s0*([0-9]+).*n0*([0-9]+).*l0*([0-9]+)", name)
        if m:
            return f"s{int(m.group(1))}-n{int(m.group(2))}-l{int(m.group(3))}"

    # Grippers: nX-rY-oZ
    if domain == "grippers":
        m = re.search(r"n0*([0-9]+).*r0*([0-9]+).*o0*([0-9]+)", name)
        if m:
            return f"n{int(m.group(1))}-r{int(m.group(2))}-o{int(m.group(3))}"

    # Grid: xX-yY
    if domain == "grid":
        m = re.search(r"x0*([0-9]+).*y0*([0-9]+)", name)
        if m:
            return f"x{int(m.group(1))}-y{int(m.group(2))}"

    # Generic fallback: sX-pY pattern
    m = re.search(r"s(\d+)[_-]?p(\d+)", name, flags=re.IGNORECASE)
    if m:
        return f"s{m.group(1)}-p{m.group(2)}"

    return None


def compute_level_statistics(
    results: List[Dict[str, Any]],
    domain: str,
    success_key: str = "is_valid",
    time_key: str = "solve_time_seconds",
    problem_name_key: str = "problem_name",
) -> Dict[str, Dict[str, Any]]:
    """
    Compute statistics per difficulty level.

    Args:
        results: List of result dictionaries
        domain: Domain name for level extraction
        success_key: Key to check for success (default: "is_valid")
        time_key: Key for solve time (default: "solve_time_seconds")
        problem_name_key: Key for problem name (default: "problem_name")

    Returns:
        Dictionary mapping level keys to statistics
    """
    level_data = defaultdict(lambda: {
        "problems": [],
        "success_count": 0,
        "total_count": 0,
        "solve_times": [],
    })

    for result in results:
        problem_name = result.get(problem_name_key, "")
        level_key = extract_size_key(problem_name, domain)
        if not level_key:
            level_key = "unknown"

        level_data[level_key]["problems"].append(problem_name)
        level_data[level_key]["total_count"] += 1

        if result.get(success_key, False):
            level_data[level_key]["success_count"] += 1

        solve_time = result.get(time_key)
        if solve_time is not None:
            level_data[level_key]["solve_times"].append(solve_time)

    # Compute final statistics
    level_statistics = {}
    for level_key, data in level_data.items():
        total = data["total_count"]
        success = data["success_count"]
        times = data["solve_times"]

        stats = {
            "total_problems": total,
            "success_count": success,
            "success_rate": (success / total * 100) if total > 0 else 0.0,
            "problems": data["problems"],
        }

        if times:
            stats["total_solve_time_seconds"] = sum(times)
            stats["avg_solve_time_seconds"] = sum(times) / len(times)
            stats["min_solve_time_seconds"] = min(times)
            stats["max_solve_time_seconds"] = max(times)
        else:
            stats["total_solve_time_seconds"] = 0.0
            stats["avg_solve_time_seconds"] = 0.0
            stats["min_solve_time_seconds"] = 0.0
            stats["max_solve_time_seconds"] = 0.0

        level_statistics[level_key] = stats

    return level_statistics


def compute_overall_statistics(
    results: List[Dict[str, Any]],
    success_key: str = "is_valid",
    time_key: str = "solve_time_seconds",
) -> Dict[str, Any]:
    """
    Compute overall statistics across all problems.

    Args:
        results: List of result dictionaries
        success_key: Key to check for success
        time_key: Key for solve time

    Returns:
        Dictionary with overall statistics
    """
    total_count = len(results)
    success_count = sum(1 for r in results if r.get(success_key, False))
    times = [r.get(time_key) for r in results if r.get(time_key) is not None]

    stats = {
        "total_problems": total_count,
        "success_count": success_count,
        "success_rate": (success_count / total_count * 100) if total_count > 0 else 0.0,
    }

    if times:
        stats["total_time_seconds"] = sum(times)
        stats["avg_time_per_problem"] = sum(times) / len(times)
    else:
        stats["total_time_seconds"] = 0.0
        stats["avg_time_per_problem"] = 0.0

    return stats


def save_results_with_levels(
    run_dir: Path,
    results: List[Dict[str, Any]],
    domain: str,
    metadata: Optional[Dict[str, Any]] = None,
    success_key: str = "is_valid",
    time_key: str = "solve_time_seconds",
) -> Path:
    """
    Save results.json with level_statistics and overall_statistics.

    Args:
        run_dir: Directory to save results
        results: List of result dictionaries
        domain: Domain name for level extraction
        metadata: Additional metadata to include
        success_key: Key to check for success
        time_key: Key for solve time

    Returns:
        Path to the saved results file
    """
    level_stats = compute_level_statistics(
        results, domain, success_key=success_key, time_key=time_key
    )
    overall_stats = compute_overall_statistics(
        results, success_key=success_key, time_key=time_key
    )

    output_data = {
        "timestamp": datetime.now().isoformat(),
        "domain": domain,
        "level_statistics": level_stats,
        "overall_statistics": overall_stats,
        "results": results,
    }

    if metadata:
        output_data.update(metadata)

    results_path = run_dir / "results.json"
    with open(results_path, "w", encoding="utf-8") as f:
        json.dump(output_data, f, indent=2, ensure_ascii=False)

    return results_path


def save_summary(
    run_dir: Path,
    overall_stats: Dict[str, Any],
    level_stats: Dict[str, Dict[str, Any]],
    category_counts: Optional[Dict[str, int]] = None,
) -> Path:
    """
    Save a concise summary.json file.

    Args:
        run_dir: Directory to save summary
        overall_stats: Overall statistics
        level_stats: Per-level statistics
        category_counts: Category breakdown counts

    Returns:
        Path to the saved summary file
    """
    summary_data = {
        "timestamp": datetime.now().isoformat(),
        "overall": overall_stats,
        "by_level": {
            k: {
                "total": v["total_problems"],
                "success": v["success_count"],
                "success_rate": v["success_rate"],
                "avg_time": v.get("avg_solve_time_seconds", 0),
            }
            for k, v in level_stats.items()
        },
    }

    if category_counts:
        total = sum(category_counts.values())
        summary_data["categories"] = {
            k: {"count": v, "rate": (v / total * 100) if total > 0 else 0}
            for k, v in category_counts.items()
        }

    summary_path = run_dir / "summary.json"
    with open(summary_path, "w", encoding="utf-8") as f:
        json.dump(summary_data, f, indent=2, ensure_ascii=False)

    return summary_path


def get_command_string() -> str:
    """
    Get the full command string used to invoke the script.

    Returns:
        Command string
    """
    return " ".join(sys.argv)


def print_benchmark_summary(
    overall_stats: Dict[str, Any],
    level_stats: Dict[str, Dict[str, Any]],
    category_counts: Optional[Dict[str, int]] = None,
):
    """
    Print a formatted benchmark summary to stdout.

    Args:
        overall_stats: Overall statistics
        level_stats: Per-level statistics
        category_counts: Category breakdown counts
    """
    print("\n" + "=" * 60)
    print("BENCHMARK RESULTS")
    print("=" * 60)
    print(f"Total problems: {overall_stats['total_problems']}")
    print(f"Success count: {overall_stats['success_count']}")
    print(f"Success rate: {overall_stats['success_rate']:.1f}%")

    if overall_stats.get("total_time_seconds"):
        print(f"Total time: {overall_stats['total_time_seconds']:.2f}s")
        print(f"Avg time per problem: {overall_stats['avg_time_per_problem']:.2f}s")

    if category_counts:
        print("\nCategory Breakdown:")
        total = sum(category_counts.values())
        for cat, count in sorted(category_counts.items()):
            rate = (count / total * 100) if total > 0 else 0
            print(f"  {cat}: {count} ({rate:.1f}%)")

    if level_stats:
        print("\nSuccess by Problem Level:")
        for level_key in sorted(level_stats.keys()):
            stats = level_stats[level_key]
            time_str = f", avg {stats.get('avg_solve_time_seconds', 0):.2f}s" if stats.get('avg_solve_time_seconds') else ""
            print(f"  {level_key}: {stats['success_count']}/{stats['total_problems']} ({stats['success_rate']:.1f}%){time_str}")

    print("=" * 60 + "\n")
