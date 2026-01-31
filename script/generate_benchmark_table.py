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

Example:
    python script/generate_benchmark_table.py runs/benchmark/openai/gpt-5.2_delivery_20260126_205348
    python script/generate_benchmark_table.py runs/benchmark/openai/gpt-5.2_delivery_20260126_205348 --chart
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

    args = parser.parse_args()

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
