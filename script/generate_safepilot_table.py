#!/usr/bin/env python3
"""
Generate evaluation results table from a SafePilot eval folder.

Reads metrics.json from the eval folder and generates a formatted table
showing success rates, average retries, and error category breakdowns per scenario.

Usage:
    python script/generate_safepilot_table.py [eval_folder] [--format markdown|csv|latex] [--output <file>]

Example:
    python script/generate_safepilot_table.py runs/safepilot/safepilot__temp0.6_max512_20260126_140327
"""

import argparse
import json
import sys
from pathlib import Path


# Default SafePilot eval folder
DEFAULT_EVAL_FOLDER = "runs/safepilot/safepilot__temp0.6_max512_20260126_140327"

# Error categories in display order (no generation_error for SafePilot)
ERROR_CATEGORIES = [
    "success_plans",
    "plan_format_error",
    "precondition_violation",
    "safety_constraints_violation",
    "goal_not_satisfied",
]

# Display names for error categories
CATEGORY_DISPLAY_NAMES = {
    "success_plans": "Success",
    "plan_format_error": "Format Err",
    "precondition_violation": "Precond Viol",
    "safety_constraints_violation": "Safety Viol",
    "goal_not_satisfied": "Goal Fail",
}

# Scenario display order
SCENARIO_ORDER = ["blocksworld", "ferry", "grippers", "spanner", "delivery"]


def load_metrics(eval_folder: str) -> dict:
    """Load metrics.json from the eval folder."""
    metrics_path = Path(eval_folder) / "metrics.json"

    if not metrics_path.exists():
        raise FileNotFoundError(f"metrics.json not found in {eval_folder}")

    with open(metrics_path, 'r') as f:
        return json.load(f)


def format_cell(count: int, rate: float) -> str:
    """Format a cell with count and percentage."""
    return f"{count}({rate:.1f}%)"


def format_table_markdown(metrics: dict) -> str:
    """Generate a markdown table from metrics."""
    lines = []

    # Header
    header = "| Scenario | Total | Avg Retry | " + " | ".join(CATEGORY_DISPLAY_NAMES.values()) + " |"
    separator = "|" + "|".join(["-" * (len(col) + 2) for col in ["Scenario", "Total", "Avg Retry"] + list(CATEGORY_DISPLAY_NAMES.values())]) + "|"

    lines.append(header)
    lines.append(separator)

    # Per-scenario rows (using "scenarios" key for SafePilot)
    scenarios = metrics.get("scenarios", {})

    # Sort scenarios by predefined order
    sorted_scenarios = sorted(
        scenarios.keys(),
        key=lambda x: SCENARIO_ORDER.index(x) if x in SCENARIO_ORDER else len(SCENARIO_ORDER)
    )

    for scenario in sorted_scenarios:
        data = scenarios[scenario]
        total = data.get("total_problems", 0)
        avg_retries = data.get("avg_retries", 0)
        counts = data.get("category_counts", {})
        rates = data.get("category_rates", {})

        row = f"| {scenario} | {total} | {avg_retries:.2f} |"
        for cat in ERROR_CATEGORIES:
            count = counts.get(cat, 0)
            rate = rates.get(cat, 0.0)
            row += f" {format_cell(count, rate)} |"

        lines.append(row)

    # Overall row
    overall = metrics.get("overall", {})
    if overall:
        total = overall.get("total_problems", 0)
        avg_retries = overall.get("avg_retries", 0)
        counts = overall.get("category_counts", {})
        rates = overall.get("category_rates", {})

        row = f"| **Overall** | **{total}** | **{avg_retries:.2f}** |"
        for cat in ERROR_CATEGORIES:
            count = counts.get(cat, 0)
            rate = rates.get(cat, 0.0)
            row += f" **{format_cell(count, rate)}** |"

        lines.append(row)

    return "\n".join(lines)


def format_table_csv(metrics: dict) -> str:
    """Generate a CSV table from metrics."""
    lines = []

    # Header
    header = "Scenario,Total,Avg Retry," + ",".join(
        f"{name}_count,{name}_rate" for name in CATEGORY_DISPLAY_NAMES.values()
    )
    lines.append(header)

    # Per-scenario rows (using "scenarios" key for SafePilot)
    scenarios = metrics.get("scenarios", {})
    sorted_scenarios = sorted(
        scenarios.keys(),
        key=lambda x: SCENARIO_ORDER.index(x) if x in SCENARIO_ORDER else len(SCENARIO_ORDER)
    )

    for scenario in sorted_scenarios:
        data = scenarios[scenario]
        total = data.get("total_problems", 0)
        avg_retries = data.get("avg_retries", 0)
        counts = data.get("category_counts", {})
        rates = data.get("category_rates", {})

        row = f"{scenario},{total},{avg_retries:.2f}"
        for cat in ERROR_CATEGORIES:
            count = counts.get(cat, 0)
            rate = rates.get(cat, 0.0)
            row += f",{count},{rate:.1f}"

        lines.append(row)

    # Overall row
    overall = metrics.get("overall", {})
    if overall:
        total = overall.get("total_problems", 0)
        avg_retries = overall.get("avg_retries", 0)
        counts = overall.get("category_counts", {})
        rates = overall.get("category_rates", {})

        row = f"Overall,{total},{avg_retries:.2f}"
        for cat in ERROR_CATEGORIES:
            count = counts.get(cat, 0)
            rate = rates.get(cat, 0.0)
            row += f",{count},{rate:.1f}"

        lines.append(row)

    return "\n".join(lines)


def format_table_latex(metrics: dict) -> str:
    """Generate a LaTeX table from metrics."""
    lines = []

    # Table setup
    num_cols = 3 + len(ERROR_CATEGORIES)  # Scenario + Total + Avg Retry + categories
    col_spec = "l" + "r" * (num_cols - 1)

    lines.append("\\begin{table}[h]")
    lines.append("\\centering")
    lines.append("\\caption{SafePilot Evaluation Results by Scenario}")
    lines.append("\\label{tab:safepilot_results}")
    lines.append(f"\\begin{{tabular}}{{{col_spec}}}")
    lines.append("\\hline")

    # Header
    header = "\\textbf{Scenario} & \\textbf{Total} & \\textbf{Avg Retry}"
    for name in CATEGORY_DISPLAY_NAMES.values():
        header += f" & \\textbf{{{name}}}"
    header += " \\\\"
    lines.append(header)
    lines.append("\\hline")

    # Per-scenario rows (using "scenarios" key for SafePilot)
    scenarios = metrics.get("scenarios", {})
    sorted_scenarios = sorted(
        scenarios.keys(),
        key=lambda x: SCENARIO_ORDER.index(x) if x in SCENARIO_ORDER else len(SCENARIO_ORDER)
    )

    for scenario in sorted_scenarios:
        data = scenarios[scenario]
        total = data.get("total_problems", 0)
        avg_retries = data.get("avg_retries", 0)
        counts = data.get("category_counts", {})
        rates = data.get("category_rates", {})

        # Capitalize scenario name
        display_name = scenario.capitalize()
        row = f"{display_name} & {total} & {avg_retries:.2f}"
        for cat in ERROR_CATEGORIES:
            count = counts.get(cat, 0)
            rate = rates.get(cat, 0.0)
            row += f" & {count}({rate:.1f}\\%)"
        row += " \\\\"

        lines.append(row)

    lines.append("\\hline")

    # Overall row
    overall = metrics.get("overall", {})
    if overall:
        total = overall.get("total_problems", 0)
        avg_retries = overall.get("avg_retries", 0)
        counts = overall.get("category_counts", {})
        rates = overall.get("category_rates", {})

        row = f"\\textbf{{Overall}} & \\textbf{{{total}}} & \\textbf{{{avg_retries:.2f}}}"
        for cat in ERROR_CATEGORIES:
            count = counts.get(cat, 0)
            rate = rates.get(cat, 0.0)
            row += f" & \\textbf{{{count}({rate:.1f}\\%)}}"
        row += " \\\\"

        lines.append(row)

    lines.append("\\hline")
    lines.append("\\end{tabular}")
    lines.append("\\end{table}")

    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(
        description="Generate SafePilot evaluation results table from an eval folder"
    )
    parser.add_argument(
        "eval_folder",
        nargs="?",
        default=DEFAULT_EVAL_FOLDER,
        help=f"Path to the eval folder containing metrics.json (default: {DEFAULT_EVAL_FOLDER})"
    )
    parser.add_argument(
        "--format",
        choices=["markdown", "csv", "latex"],
        default="markdown",
        help="Output format (default: markdown)"
    )
    parser.add_argument(
        "--output",
        help="Output file path (prints to stdout if not specified)"
    )

    args = parser.parse_args()

    try:
        metrics = load_metrics(args.eval_folder)
    except FileNotFoundError as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

    # Generate table in requested format
    if args.format == "markdown":
        table = format_table_markdown(metrics)
    elif args.format == "csv":
        table = format_table_csv(metrics)
    elif args.format == "latex":
        table = format_table_latex(metrics)

    # Output
    if args.output:
        with open(args.output, 'w') as f:
            f.write(table)
        print(f"Table written to {args.output}")
    else:
        print(table)


if __name__ == "__main__":
    main()
