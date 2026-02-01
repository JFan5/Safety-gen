#!/usr/bin/env python3
"""
Generate benchmark results table and chart from a benchmark run folder.

Reads summary.json from the benchmark folder and generates a formatted table
showing success rates, average time per problem, and problem complexity breakdown.
Optionally generates a scatter chart showing time vs complexity with success/failure coloring.

Usage:
    python script/generate_benchmark_table.py <benchmark_folder> [--format markdown|csv|latex] [--output <file>]
    python script/generate_benchmark_table.py <benchmark_folder> --no-chart  # disable chart generation
    python script/generate_benchmark_table.py <benchmark_folder> --chart-output <file.png>  # custom chart path

    # Compare two benchmarks
    python script/generate_benchmark_table.py <folder1> --compare <folder2>
    python script/generate_benchmark_table.py <folder1> --compare <folder2> --aggregate-levels 5

Example:
    python script/generate_benchmark_table.py runs/benchmark/openai/gpt-5.2_delivery_20260126_205348
    python script/generate_benchmark_table.py runs/benchmark/openai/gpt-5.2_delivery_20260126_205348 --chart

    # Compare GPT-5.2 vs OPTIC on blocksworld
    python script/generate_benchmark_table.py \\
        runs/benchmark/openai/gpt-5.2_blocksworld_20260126_200314 \\
        --compare runs/benchmark/optic/blocksworld_20260129_162121
"""

import argparse
import json
import re
import sys
from pathlib import Path


def load_summary(benchmark_folder: str) -> dict:
    """Load summary.json from the benchmark folder."""
    summary_path = Path(benchmark_folder) / "summary.json"

    if not summary_path.exists():
        raise FileNotFoundError(f"summary.json not found in {benchmark_folder}")

    with open(summary_path, 'r') as f:
        return json.load(f)


def extract_size_key_from_problem(problem_name: str) -> str:
    """
    Extract size_key from problem filename.

    Examples:
        'bw_ops3_n05_seed5001.pddl' -> 'ops3-n5'
        'blocksworld/bw_ops3_n05_seed5001.pddl' -> 'ops3-n5'
        'ferry_s3_p1_seed1001.pddl' -> 's3-p1'
    """
    # Get just the filename
    name = Path(problem_name).stem

    # Try to extract ops/n pattern (blocksworld)
    ops_match = re.search(r'ops(\d+)', name)
    n_match = re.search(r'_n(\d+)', name)
    if ops_match and n_match:
        return f"ops{ops_match.group(1)}-n{n_match.group(1)}"

    # Try to extract s/p pattern (ferry, etc.)
    s_match = re.search(r'_s(\d+)', name)
    p_match = re.search(r'_p(\d+)', name)
    if s_match and p_match:
        return f"s{s_match.group(1)}-p{p_match.group(1)}"

    # Try to extract n/l pattern (grippers, spanner)
    n_match = re.search(r'_n(\d+)', name)
    l_match = re.search(r'_l(\d+)', name)
    if n_match and l_match:
        return f"n{n_match.group(1)}-l{l_match.group(1)}"

    # Fallback: return first numbers found
    numbers = re.findall(r'\d+', name)
    if numbers:
        return '-'.join(numbers[:2]) if len(numbers) >= 2 else numbers[0]

    return "unknown"


def load_results(benchmark_folder: str) -> dict:
    """Load detailed results from the benchmark folder.

    Supports multiple formats:
    - results_*.json (LLM benchmark format)
    - solver_cache.json (OPTIC benchmark format)
    """
    folder = Path(benchmark_folder)

    # Try results_*.json first (LLM benchmark format)
    results_files = list(folder.glob("results_*.json"))
    if results_files:
        results_file = max(results_files, key=lambda p: p.stat().st_mtime)
        with open(results_file, 'r') as f:
            return json.load(f)

    # Try solver_cache.json (OPTIC benchmark format)
    solver_cache = folder / "solver_cache.json"
    if solver_cache.exists():
        with open(solver_cache, 'r') as f:
            cache_data = json.load(f)

        # Load run_config.json for metadata if available
        run_config = folder / "run_config.json"
        config_data = {}
        if run_config.exists():
            with open(run_config, 'r') as f:
                config_data = json.load(f)

        # Convert solver_cache format to expected results format
        results = []
        solver_name = config_data.get("model", "unknown")

        for solver, problems in cache_data.items():
            if solver_name == "unknown":
                solver_name = solver
            for problem_key, problem_data in problems.items():
                is_valid = problem_data.get("validation") == "valid"
                results.append({
                    "problem_name": Path(problem_key).name,
                    "size_key": extract_size_key_from_problem(problem_key),
                    "solve_time_seconds": problem_data.get("elapsed_seconds", 0),
                    "is_valid": is_valid,
                    "category": "success_plans" if is_valid else "failed",
                    "status": problem_data.get("status", "unknown"),
                })

        # Sort by size_key for consistent ordering
        results.sort(key=lambda x: natural_sort_key(x["size_key"]))

        # Get scenario/domain from config or folder name
        scenario = config_data.get("domain") or (folder.name.split("_")[0] if "_" in folder.name else folder.name)

        return {
            "results": results,
            "scenario": scenario,
            "model_name": solver_name.upper() if solver_name in ("optic", "lpg") else solver_name,
            "problems_dir": str(folder),
        }

    raise FileNotFoundError(f"No results_*.json or solver_cache.json found in {benchmark_folder}")


def natural_sort_key(key: str) -> tuple:
    """
    Generate a sort key for natural sorting of complexity strings.

    Examples:
        's3-p1' -> (3, 1)
        's10-p1' -> (10, 1)
        's48-n47-l72' -> (48, 47, 72)
        'ops3-n43' -> (3, 43)
    """
    # Extract all numbers from the string
    numbers = re.findall(r'\d+', key)
    return tuple(int(n) for n in numbers) if numbers else (0,)


def sort_complexity_keys(keys: list) -> list:
    """Sort complexity keys in natural numeric order."""
    return sorted(keys, key=natural_sort_key)


def format_table_markdown(summary: dict) -> str:
    """Generate a markdown table from summary."""
    lines = []

    # Header
    header = "| Complexity | Total | Success | Success Rate | Avg Time (s) |"
    separator = "|------------|-------|---------|--------------|--------------|"

    lines.append(header)
    lines.append(separator)

    # Per-level rows
    by_level = summary.get("by_level", {})
    sorted_keys = sort_complexity_keys(list(by_level.keys()))

    for key in sorted_keys:
        data = by_level[key]
        total = data.get("total", 0)
        success = data.get("success", 0)
        success_rate = data.get("success_rate", 0.0)
        avg_time = data.get("avg_time", 0.0)

        row = f"| {key} | {total} | {success} | {success_rate:.1f}% | {avg_time:.2f} |"
        lines.append(row)

    # Overall row
    overall = summary.get("overall", {})
    if overall:
        total = overall.get("total_problems", 0)
        success = overall.get("success_count", 0)
        success_rate = overall.get("success_rate", 0.0)
        avg_time = overall.get("avg_time_per_problem", 0.0)

        row = f"| **Overall** | **{total}** | **{success}** | **{success_rate:.1f}%** | **{avg_time:.2f}** |"
        lines.append(row)

    return "\n".join(lines)


def format_table_csv(summary: dict) -> str:
    """Generate a CSV table from summary."""
    lines = []

    # Header
    lines.append("Complexity,Total,Success,Success Rate,Avg Time (s)")

    # Per-level rows
    by_level = summary.get("by_level", {})
    sorted_keys = sort_complexity_keys(list(by_level.keys()))

    for key in sorted_keys:
        data = by_level[key]
        total = data.get("total", 0)
        success = data.get("success", 0)
        success_rate = data.get("success_rate", 0.0)
        avg_time = data.get("avg_time", 0.0)

        row = f"{key},{total},{success},{success_rate:.1f},{avg_time:.2f}"
        lines.append(row)

    # Overall row
    overall = summary.get("overall", {})
    if overall:
        total = overall.get("total_problems", 0)
        success = overall.get("success_count", 0)
        success_rate = overall.get("success_rate", 0.0)
        avg_time = overall.get("avg_time_per_problem", 0.0)

        row = f"Overall,{total},{success},{success_rate:.1f},{avg_time:.2f}"
        lines.append(row)

    return "\n".join(lines)


def generate_chart(results: dict, output_path: str = None) -> str:
    """
    Generate a scatter chart with problem complexity on X-axis and time on Y-axis.
    Points are colored green for success and red for failure.

    Returns the path to the saved chart.
    """
    try:
        import matplotlib.pyplot as plt
        import matplotlib
        matplotlib.use('Agg')  # Use non-interactive backend
    except ImportError:
        raise ImportError("matplotlib is required for chart generation. Install with: pip install matplotlib")

    # Extract data from results
    problems = results.get("results", [])
    if not problems:
        raise ValueError("No problem results found in the data")

    # Prepare data points
    data_points = []
    for problem in problems:
        size_key = problem.get("size_key", "unknown")
        solve_time = problem.get("solve_time_seconds", 0)
        is_success = problem.get("category") == "success_plans"
        data_points.append({
            "size_key": size_key,
            "sort_key": natural_sort_key(size_key),
            "time": solve_time,
            "success": is_success,
        })

    # Sort by complexity
    data_points.sort(key=lambda x: x["sort_key"])

    # Prepare plot data
    x_labels = [p["size_key"] for p in data_points]
    x_indices = list(range(len(data_points)))
    y_times = [p["time"] for p in data_points]
    colors = ["#2ecc71" if p["success"] else "#e74c3c" for p in data_points]

    # Create figure
    _fig, ax = plt.subplots(figsize=(max(12, len(data_points) * 0.3), 6))

    # Plot scatter points
    ax.scatter(x_indices, y_times, c=colors, s=80, alpha=0.8, edgecolors='black', linewidths=0.5)

    # Connect points with a line (gray)
    ax.plot(x_indices, y_times, color='#bdc3c7', linewidth=1, alpha=0.5, zorder=1)

    # Customize axes
    ax.set_xlabel("Problem Complexity", fontsize=12)
    ax.set_ylabel("Solve Time (seconds)", fontsize=12)
    ax.set_title(f"Benchmark Results: {results.get('scenario', 'Unknown')} - {results.get('model_name', 'Unknown Model')}", fontsize=14)

    # Set x-axis ticks
    if len(x_labels) <= 20:
        ax.set_xticks(x_indices)
        ax.set_xticklabels(x_labels, rotation=45, ha='right')
    else:
        # Show every Nth label for readability
        step = max(1, len(x_labels) // 20)
        ax.set_xticks(x_indices[::step])
        ax.set_xticklabels(x_labels[::step], rotation=45, ha='right')

    # Add grid
    ax.grid(True, alpha=0.3)

    # Add legend
    from matplotlib.lines import Line2D
    legend_elements = [
        Line2D([0], [0], marker='o', color='w', markerfacecolor='#2ecc71', markersize=10, label='Success'),
        Line2D([0], [0], marker='o', color='w', markerfacecolor='#e74c3c', markersize=10, label='Failure'),
    ]
    ax.legend(handles=legend_elements, loc='upper left')

    # Add summary text
    total = len(data_points)
    success_count = sum(1 for p in data_points if p["success"])
    success_rate = (success_count / total * 100) if total > 0 else 0
    avg_time = sum(y_times) / total if total > 0 else 0
    summary_text = f"Total: {total} | Success: {success_count} ({success_rate:.1f}%) | Avg Time: {avg_time:.2f}s"
    ax.text(0.98, 0.98, summary_text, transform=ax.transAxes, fontsize=10,
            verticalalignment='top', horizontalalignment='right',
            bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.5))

    plt.tight_layout()

    # Determine output path
    if output_path is None:
        folder = Path(results.get("problems_dir", ".")).parent
        if not folder.exists():
            folder = Path(".")
        output_path = str(folder / f"benchmark_chart_{results.get('scenario', 'unknown')}.png")

    # Save the chart
    plt.savefig(output_path, dpi=150, bbox_inches='tight')
    plt.close()

    return output_path


def align_results_by_size_key(results1: dict, results2: dict) -> tuple:
    """
    Align results from two benchmarks by common size_keys.

    Args:
        results1: First benchmark results dict
        results2: Second benchmark results dict

    Returns:
        Tuple of (sorted_keys, rates1_dict, rates2_dict)
        where rates dicts map size_key -> success_rate (0-100)
    """
    # Build success rate dicts by size_key
    def build_rates(results: dict) -> dict:
        """Build a dict of size_key -> success_rate from results."""
        by_key = {}
        for problem in results.get("results", []):
            size_key = problem.get("size_key", "unknown")
            is_success = problem.get("category") == "success_plans"
            if size_key not in by_key:
                by_key[size_key] = {"total": 0, "success": 0}
            by_key[size_key]["total"] += 1
            if is_success:
                by_key[size_key]["success"] += 1

        # Convert to success rates
        rates = {}
        for key, data in by_key.items():
            if data["total"] > 0:
                rates[key] = (data["success"] / data["total"]) * 100
            else:
                rates[key] = 0.0
        return rates

    rates1 = build_rates(results1)
    rates2 = build_rates(results2)

    # Find common keys and union of all keys
    all_keys = set(rates1.keys()) | set(rates2.keys())
    sorted_keys = sort_complexity_keys(list(all_keys))

    return sorted_keys, rates1, rates2


def aggregate_by_level_groups(size_keys: list, rates1: dict, rates2: dict, group_size: int) -> tuple:
    """
    Aggregate complexity levels into groups.

    Args:
        size_keys: List of sorted size_key strings
        rates1: Dict of size_key -> success_rate for solver 1
        rates2: Dict of size_key -> success_rate for solver 2
        group_size: Number of complexity levels per group

    Returns:
        Tuple of (aggregated_labels, aggregated_rates1, aggregated_rates2)
    """
    if group_size <= 1:
        # No aggregation
        return size_keys, [rates1.get(k, 0) for k in size_keys], [rates2.get(k, 0) for k in size_keys]

    aggregated_labels = []
    aggregated_rates1 = []
    aggregated_rates2 = []

    for i in range(0, len(size_keys), group_size):
        group_keys = size_keys[i:i + group_size]
        if len(group_keys) == 0:
            continue

        # Create label for group
        if len(group_keys) == 1:
            label = group_keys[0]
        else:
            label = f"{group_keys[0]}..{group_keys[-1]}"

        # Average rates for the group
        group_rates1 = [rates1.get(k, 0) for k in group_keys if k in rates1]
        group_rates2 = [rates2.get(k, 0) for k in group_keys if k in rates2]

        avg1 = sum(group_rates1) / len(group_rates1) if group_rates1 else 0
        avg2 = sum(group_rates2) / len(group_rates2) if group_rates2 else 0

        aggregated_labels.append(label)
        aggregated_rates1.append(avg1)
        aggregated_rates2.append(avg2)

    return aggregated_labels, aggregated_rates1, aggregated_rates2


def generate_comparison_time_chart(results1: dict, results2: dict, output_path: str = None) -> str:
    """
    Generate a comparison chart showing solve time vs complexity for two solvers.
    Similar to generate_chart but with two lines overlaid.

    Args:
        results1: First benchmark results dict
        results2: Second benchmark results dict
        output_path: Path to save the chart (optional)

    Returns:
        Path to the saved chart
    """
    try:
        import matplotlib.pyplot as plt
        import matplotlib
        matplotlib.use('Agg')
        from matplotlib.lines import Line2D
    except ImportError:
        raise ImportError("matplotlib is required for chart generation.")

    # Get model names and scenario
    model1 = results1.get("model_name", "Solver 1")
    model2 = results2.get("model_name", "Solver 2")
    scenario = results1.get("scenario", results2.get("scenario", "Unknown"))

    # Build data points for each solver, keyed by size_key
    def build_time_data(results: dict) -> dict:
        """Build dict of size_key -> list of (time, success) tuples."""
        by_key = {}
        for problem in results.get("results", []):
            size_key = problem.get("size_key", "unknown")
            solve_time = problem.get("solve_time_seconds", 0)
            is_success = problem.get("category") == "success_plans"
            if size_key not in by_key:
                by_key[size_key] = []
            by_key[size_key].append((solve_time, is_success))
        return by_key

    data1 = build_time_data(results1)
    data2 = build_time_data(results2)

    # Get all unique size_keys and sort them
    all_keys = set(data1.keys()) | set(data2.keys())
    sorted_keys = sort_complexity_keys(list(all_keys))

    # Compute average time per size_key for each solver
    def get_avg_times(data: dict, keys: list) -> tuple:
        """Return (times, success_rates) for each key."""
        times = []
        success_rates = []
        for key in keys:
            if key in data:
                entries = data[key]
                avg_time = sum(t for t, _ in entries) / len(entries)
                success_rate = sum(1 for _, s in entries if s) / len(entries)
                times.append(avg_time)
                success_rates.append(success_rate)
            else:
                times.append(None)
                success_rates.append(None)
        return times, success_rates

    times1, sr1 = get_avg_times(data1, sorted_keys)
    times2, sr2 = get_avg_times(data2, sorted_keys)

    # Create figure
    fig_width = max(14, len(sorted_keys) * 0.4)
    _fig, ax = plt.subplots(figsize=(fig_width, 6))

    x_indices = list(range(len(sorted_keys)))

    # Common color for both lines
    line_color = '#2980b9'  # Blue

    # Plot solver 1 (solid line)
    valid_x1 = [i for i, t in enumerate(times1) if t is not None]
    valid_times1 = [times1[i] for i in valid_x1]
    valid_sr1 = [sr1[i] for i in valid_x1]
    colors1 = ["#2ecc71" if sr == 1.0 else "#e74c3c" if sr == 0.0 else "#f39c12" for sr in valid_sr1]

    ax.scatter(valid_x1, valid_times1, c=colors1, s=80, alpha=0.9, edgecolors=line_color, linewidths=2, zorder=3, marker='o')
    ax.plot(valid_x1, valid_times1, color=line_color, linewidth=2, alpha=0.8, zorder=2, linestyle='-', label=model1)

    # Plot solver 2 (dashed line)
    valid_x2 = [i for i, t in enumerate(times2) if t is not None]
    valid_times2 = [times2[i] for i in valid_x2]
    valid_sr2 = [sr2[i] for i in valid_x2]
    colors2 = ["#2ecc71" if sr == 1.0 else "#e74c3c" if sr == 0.0 else "#f39c12" for sr in valid_sr2]

    ax.scatter(valid_x2, valid_times2, c=colors2, s=80, alpha=0.9, edgecolors=line_color, linewidths=2, zorder=3, marker='s')
    ax.plot(valid_x2, valid_times2, color=line_color, linewidth=2, alpha=0.8, zorder=2, linestyle='--', label=model2)

    # Customize axes
    ax.set_xlabel("Problem Complexity", fontsize=12)
    ax.set_ylabel("Solve Time (seconds)", fontsize=12)
    ax.set_title(f"Benchmark Comparison: {scenario} - {model1} vs {model2}", fontsize=14)

    # Set x-axis ticks
    if len(sorted_keys) <= 30:
        ax.set_xticks(x_indices)
        ax.set_xticklabels(sorted_keys, rotation=45, ha='right')
    else:
        step = max(1, len(sorted_keys) // 25)
        ax.set_xticks(x_indices[::step])
        ax.set_xticklabels(sorted_keys[::step], rotation=45, ha='right')

    # Add grid
    ax.grid(True, alpha=0.3)

    # Create legend with line styles and success/failure markers
    legend_elements = [
        Line2D([0], [0], color=line_color, linewidth=2, linestyle='-', marker='o',
               markerfacecolor=line_color, markeredgecolor=line_color, markersize=8, label=f"{model1} (solid)"),
        Line2D([0], [0], color=line_color, linewidth=2, linestyle='--', marker='s',
               markerfacecolor=line_color, markeredgecolor=line_color, markersize=8, label=f"{model2} (dashed)"),
        Line2D([0], [0], marker='o', color='w', markerfacecolor='#2ecc71', markersize=10, label='Success'),
        Line2D([0], [0], marker='o', color='w', markerfacecolor='#e74c3c', markersize=10, label='Failure'),
    ]
    ax.legend(handles=legend_elements, loc='upper left')

    # Calculate stats
    total1 = sum(len(data1.get(k, [])) for k in sorted_keys)
    success1 = sum(sum(1 for _, s in data1.get(k, []) if s) for k in sorted_keys)
    avg_time1 = sum(t for t in valid_times1) / len(valid_times1) if valid_times1 else 0
    rate1 = (success1 / total1 * 100) if total1 > 0 else 0

    total2 = sum(len(data2.get(k, [])) for k in sorted_keys)
    success2 = sum(sum(1 for _, s in data2.get(k, []) if s) for k in sorted_keys)
    avg_time2 = sum(t for t in valid_times2) / len(valid_times2) if valid_times2 else 0
    rate2 = (success2 / total2 * 100) if total2 > 0 else 0

    # Add summary text
    summary_text = (f"{model1}: {success1}/{total1} ({rate1:.1f}%), Avg: {avg_time1:.1f}s\n"
                    f"{model2}: {success2}/{total2} ({rate2:.1f}%), Avg: {avg_time2:.1f}s")
    ax.text(0.98, 0.98, summary_text, transform=ax.transAxes, fontsize=10,
            verticalalignment='top', horizontalalignment='right',
            bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.5))

    plt.tight_layout()

    # Determine output path
    if output_path is None:
        output_path = f"comparison_{model1}_vs_{model2}_{scenario}.png".replace(" ", "_")

    plt.savefig(output_path, dpi=150, bbox_inches='tight')
    plt.close()

    return output_path


def generate_comparison_chart(results1: dict, results2: dict, output_path: str = None, aggregate_levels: int = 1, chart_style: str = "line") -> str:
    """
    Generate a comparison chart for two benchmark results.

    Args:
        results1: First benchmark results dict
        results2: Second benchmark results dict
        output_path: Path to save the chart (optional)
        aggregate_levels: Number of complexity levels to aggregate (1 = no aggregation)
        chart_style: "line" for line chart (default), "bar" for grouped bar chart

    Returns:
        Path to the saved chart
    """
    try:
        import matplotlib.pyplot as plt
        import matplotlib
        matplotlib.use('Agg')  # Use non-interactive backend
        import numpy as np
    except ImportError:
        raise ImportError("matplotlib and numpy are required for chart generation. Install with: pip install matplotlib numpy")

    # Align results by size_key
    sorted_keys, rates1, rates2 = align_results_by_size_key(results1, results2)

    if not sorted_keys:
        raise ValueError("No common size_keys found between the two benchmarks")

    # Aggregate if requested
    labels, values1, values2 = aggregate_by_level_groups(sorted_keys, rates1, rates2, aggregate_levels)

    # Get model names
    model1 = results1.get("model_name", "Solver 1")
    model2 = results2.get("model_name", "Solver 2")
    scenario = results1.get("scenario", results2.get("scenario", "Unknown"))

    # Calculate overall averages
    all_rates1 = [rates1.get(k, 0) for k in sorted_keys if k in rates1]
    all_rates2 = [rates2.get(k, 0) for k in sorted_keys if k in rates2]
    avg1 = sum(all_rates1) / len(all_rates1) if all_rates1 else 0
    avg2 = sum(all_rates2) / len(all_rates2) if all_rates2 else 0

    # Create figure
    fig_width = max(12, len(labels) * 0.5)
    fig, ax = plt.subplots(figsize=(fig_width, 6))

    x = np.arange(len(labels))

    if chart_style == "line":
        # Line chart with markers
        ax.plot(x, values1, marker='o', linewidth=2, markersize=8, label=model1,
                color='#3498db', markerfacecolor='#3498db', markeredgecolor='white', markeredgewidth=1.5)
        ax.plot(x, values2, marker='s', linewidth=2, markersize=8, label=model2,
                color='#e67e22', markerfacecolor='#e67e22', markeredgecolor='white', markeredgewidth=1.5)

        # Fill area under curves (optional, for visual effect)
        ax.fill_between(x, values1, alpha=0.1, color='#3498db')
        ax.fill_between(x, values2, alpha=0.1, color='#e67e22')

    else:
        # Grouped bar chart
        width = 0.35
        ax.bar(x - width / 2, values1, width, label=model1, color='#3498db', edgecolor='black', linewidth=0.5)
        ax.bar(x + width / 2, values2, width, label=model2, color='#e67e22', edgecolor='black', linewidth=0.5)

    # Customize axes
    ax.set_xlabel("Problem Complexity", fontsize=12)
    ax.set_ylabel("Success Rate (%)", fontsize=12)
    ax.set_title(f"Comparison: {model1} vs {model2} on {scenario}", fontsize=14)

    # Set x-axis ticks
    if len(labels) <= 25:
        ax.set_xticks(x)
        ax.set_xticklabels(labels, rotation=45, ha='right')
    else:
        # Show every Nth label for readability
        step = max(1, len(labels) // 20)
        ax.set_xticks(x[::step])
        ax.set_xticklabels([labels[i] for i in range(0, len(labels), step)], rotation=45, ha='right')

    # Set y-axis range
    ax.set_ylim(0, 105)

    # Add grid
    ax.grid(True, alpha=0.3)
    ax.set_axisbelow(True)

    # Add legend
    ax.legend(loc='upper right', fontsize=10)

    # Add summary annotation
    summary_text = f"Overall Avg: {model1}: {avg1:.1f}%  |  {model2}: {avg2:.1f}%"
    ax.text(0.02, 0.98, summary_text, transform=ax.transAxes, fontsize=10,
            verticalalignment='top', horizontalalignment='left',
            bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.5))

    plt.tight_layout()

    # Determine output path
    if output_path is None:
        output_path = f"comparison_{model1}_vs_{model2}_{scenario}.png".replace(" ", "_")

    # Save the chart
    plt.savefig(output_path, dpi=150, bbox_inches='tight')
    plt.close()

    return output_path


def format_table_latex(summary: dict) -> str:
    """Generate a LaTeX table from summary."""
    lines = []

    # Table setup
    lines.append("\\begin{table}[h]")
    lines.append("\\centering")
    lines.append("\\caption{Benchmark Results by Complexity}")
    lines.append("\\label{tab:benchmark_results}")
    lines.append("\\begin{tabular}{lrrrr}")
    lines.append("\\hline")

    # Header
    lines.append("\\textbf{Complexity} & \\textbf{Total} & \\textbf{Success} & \\textbf{Success Rate} & \\textbf{Avg Time (s)} \\\\")
    lines.append("\\hline")

    # Per-level rows
    by_level = summary.get("by_level", {})
    sorted_keys = sort_complexity_keys(list(by_level.keys()))

    for key in sorted_keys:
        data = by_level[key]
        total = data.get("total", 0)
        success = data.get("success", 0)
        success_rate = data.get("success_rate", 0.0)
        avg_time = data.get("avg_time", 0.0)

        row = f"{key} & {total} & {success} & {success_rate:.1f}\\% & {avg_time:.2f} \\\\"
        lines.append(row)

    lines.append("\\hline")

    # Overall row
    overall = summary.get("overall", {})
    if overall:
        total = overall.get("total_problems", 0)
        success = overall.get("success_count", 0)
        success_rate = overall.get("success_rate", 0.0)
        avg_time = overall.get("avg_time_per_problem", 0.0)

        row = f"\\textbf{{Overall}} & \\textbf{{{total}}} & \\textbf{{{success}}} & \\textbf{{{success_rate:.1f}\\%}} & \\textbf{{{avg_time:.2f}}} \\\\"
        lines.append(row)

    lines.append("\\hline")
    lines.append("\\end{tabular}")
    lines.append("\\end{table}")

    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(
        description="Generate benchmark results table and chart from a benchmark run folder"
    )
    parser.add_argument(
        "benchmark_folder",
        help="Path to the benchmark folder containing summary.json"
    )
    parser.add_argument(
        "--format",
        choices=["markdown", "csv", "latex"],
        default="markdown",
        help="Output format for table (default: markdown)"
    )
    parser.add_argument(
        "--output",
        help="Output file path for table (prints to stdout if not specified)"
    )
    parser.add_argument(
        "--no-chart",
        action="store_true",
        help="Disable scatter chart generation (chart is generated by default)"
    )
    parser.add_argument(
        "--chart-output",
        help="Output file path for chart (default: benchmark_chart_<scenario>.png in benchmark folder)"
    )
    parser.add_argument(
        "--compare",
        metavar="FOLDER",
        help="Second benchmark folder to compare against (generates comparison chart)"
    )
    parser.add_argument(
        "--aggregate-levels",
        type=int,
        default=1,
        help="Aggregate N complexity levels into groups for cleaner comparison charts (default: 1, no aggregation)"
    )
    parser.add_argument(
        "--chart-style",
        choices=["line", "bar"],
        default="line",
        help="Chart style for comparison: 'line' (default) or 'bar'"
    )
    parser.add_argument(
        "--time-chart",
        action="store_true",
        help="Generate time-based comparison chart (like original benchmark chart with two curves)"
    )

    args = parser.parse_args()

    # Handle comparison mode
    if args.compare:
        try:
            results1 = load_results(args.benchmark_folder)
            results2 = load_results(args.compare)

            # Validate same scenario (optional warning)
            scenario1 = results1.get("scenario", "unknown")
            scenario2 = results2.get("scenario", "unknown")
            if scenario1 != scenario2:
                print(f"Warning: Comparing different scenarios ({scenario1} vs {scenario2})", file=sys.stderr)

            # Generate comparison chart
            chart_output = args.chart_output
            if chart_output is None:
                model1 = results1.get("model_name", "solver1").replace(" ", "_")
                model2 = results2.get("model_name", "solver2").replace(" ", "_")
                chart_output = str(Path(args.benchmark_folder) / f"comparison_{model1}_vs_{model2}.png")

            if args.time_chart:
                chart_path = generate_comparison_time_chart(results1, results2, chart_output)
            else:
                chart_path = generate_comparison_chart(
                    results1, results2, chart_output, args.aggregate_levels, args.chart_style
                )
            print(f"Comparison chart saved to: {chart_path}")

        except FileNotFoundError as e:
            print(f"Error: {e}", file=sys.stderr)
            sys.exit(1)
        except ImportError as e:
            print(f"Error: {e}", file=sys.stderr)
            sys.exit(1)
        except Exception as e:
            print(f"Error: Failed to generate comparison chart - {e}", file=sys.stderr)
            sys.exit(1)

        return  # Exit after comparison mode

    # Standard mode: generate table and chart
    try:
        summary = load_summary(args.benchmark_folder)
    except FileNotFoundError as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

    # Generate table in requested format
    if args.format == "markdown":
        table = format_table_markdown(summary)
    elif args.format == "csv":
        table = format_table_csv(summary)
    elif args.format == "latex":
        table = format_table_latex(summary)

    # Output table
    if args.output:
        with open(args.output, 'w') as f:
            f.write(table)
        print(f"Table written to {args.output}")
    else:
        print(table)

    # Generate chart by default (unless --no-chart is specified)
    if not args.no_chart:
        try:
            results = load_results(args.benchmark_folder)
            chart_output = args.chart_output
            if chart_output is None:
                scenario = results.get("scenario", "unknown")
                chart_output = str(Path(args.benchmark_folder) / f"benchmark_chart_{scenario}.png")
            chart_path = generate_chart(results, chart_output)
            print(f"\nChart saved to: {chart_path}")
        except FileNotFoundError as e:
            print(f"Warning: Could not generate chart - {e}", file=sys.stderr)
        except ImportError as e:
            print(f"Warning: {e}", file=sys.stderr)
        except Exception as e:
            print(f"Warning: Failed to generate chart - {e}", file=sys.stderr)


if __name__ == "__main__":
    main()
