#!/usr/bin/env python3
"""
Generate evaluation results table from SafePilot/GRPO eval folders.

Supports single folder or comparison of multiple models.

Usage:
    # Single model table
    python script/generate_safepilot_table.py [eval_folder] [--format markdown|csv|latex]

    # Multi-model comparison table (for papers)
    python script/generate_safepilot_table.py --compare \
        --pretrained <folder1> \
        --grpo <folder2> \
        --grpo-workflow <folder3> \
        --format latex --output table.tex
"""

import argparse
import json
import sys
from pathlib import Path


# Default SafePilot eval folder
DEFAULT_EVAL_FOLDER = "runs/safepilot/safepilot__temp0.6_max512_20260126_140327"

# Error categories in display order
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

# Short names for LaTeX comparison table
CATEGORY_SHORT_NAMES = {
    "success_plans": "Succ",
    "safety_constraints_violation": "Safety",
}

# Scenario display order
SCENARIO_ORDER = ["blocksworld", "ferry", "grippers", "spanner", "delivery"]

# Scenario display names for LaTeX
SCENARIO_DISPLAY = {
    "blocksworld": "Blocksworld",
    "ferry": "Ferry",
    "grippers": "Grippers",
    "spanner": "Spanner",
    "delivery": "Delivery",
}


def load_metrics(eval_folder: str) -> dict:
    """Load metrics.json from the eval folder."""
    metrics_path = Path(eval_folder) / "metrics.json"

    if not metrics_path.exists():
        raise FileNotFoundError(f"metrics.json not found in {eval_folder}")

    with open(metrics_path, 'r') as f:
        return json.load(f)


def normalize_metrics(metrics: dict) -> dict:
    """Normalize metrics to a common format."""
    # Handle different key names: "scenarios" vs "per_scenario"
    if "scenarios" in metrics:
        scenarios = metrics["scenarios"]
        total_key = "total_problems"
    elif "per_scenario" in metrics:
        scenarios = metrics["per_scenario"]
        total_key = "total_tests"
    else:
        scenarios = {}
        total_key = "total_tests"

    normalized = {"scenarios": {}, "overall": {}}

    for scenario, data in scenarios.items():
        normalized["scenarios"][scenario] = {
            "total": data.get(total_key, data.get("total_problems", data.get("total_tests", 0))),
            "success_rate": data.get("success_rate", 0),
            "avg_retries": data.get("avg_retries", 0),
            "category_counts": data.get("category_counts", {}),
            "category_rates": data.get("category_rates", {}),
        }

    # Overall
    overall = metrics.get("overall", {})
    normalized["overall"] = {
        "total": overall.get("total_problems", overall.get("total_tests", 0)),
        "success_rate": overall.get("success_rate", 0),
        "avg_retries": overall.get("avg_retries", 0),
        "category_counts": overall.get("category_counts", {}),
        "category_rates": overall.get("category_rates", {}),
    }

    return normalized


def format_cell(count: int, rate: float) -> str:
    """Format a cell with count and percentage."""
    return f"{count}({rate:.1f}%)"


def format_table_markdown(metrics: dict) -> str:
    """Generate a markdown table from metrics."""
    metrics = normalize_metrics(metrics)
    lines = []

    # Header
    header = "| Scenario | Total | Avg Retry | " + " | ".join(CATEGORY_DISPLAY_NAMES.values()) + " |"
    separator = "|" + "|".join(["-" * (len(col) + 2) for col in ["Scenario", "Total", "Avg Retry"] + list(CATEGORY_DISPLAY_NAMES.values())]) + "|"

    lines.append(header)
    lines.append(separator)

    scenarios = metrics.get("scenarios", {})
    sorted_scenarios = sorted(
        scenarios.keys(),
        key=lambda x: SCENARIO_ORDER.index(x) if x in SCENARIO_ORDER else len(SCENARIO_ORDER)
    )

    for scenario in sorted_scenarios:
        data = scenarios[scenario]
        total = data.get("total", 0)
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
        total = overall.get("total", 0)
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
    metrics = normalize_metrics(metrics)
    lines = []

    header = "Scenario,Total,Avg Retry," + ",".join(
        f"{name}_count,{name}_rate" for name in CATEGORY_DISPLAY_NAMES.values()
    )
    lines.append(header)

    scenarios = metrics.get("scenarios", {})
    sorted_scenarios = sorted(
        scenarios.keys(),
        key=lambda x: SCENARIO_ORDER.index(x) if x in SCENARIO_ORDER else len(SCENARIO_ORDER)
    )

    for scenario in sorted_scenarios:
        data = scenarios[scenario]
        total = data.get("total", 0)
        avg_retries = data.get("avg_retries", 0)
        counts = data.get("category_counts", {})
        rates = data.get("category_rates", {})

        row = f"{scenario},{total},{avg_retries:.2f}"
        for cat in ERROR_CATEGORIES:
            count = counts.get(cat, 0)
            rate = rates.get(cat, 0.0)
            row += f",{count},{rate:.1f}"

        lines.append(row)

    overall = metrics.get("overall", {})
    if overall:
        total = overall.get("total", 0)
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
    metrics = normalize_metrics(metrics)
    lines = []

    num_cols = 3 + len(ERROR_CATEGORIES)
    col_spec = "l" + "r" * (num_cols - 1)

    lines.append("\\begin{table}[h]")
    lines.append("\\centering")
    lines.append("\\caption{SafePilot Evaluation Results by Scenario}")
    lines.append("\\label{tab:safepilot_results}")
    lines.append(f"\\begin{{tabular}}{{{col_spec}}}")
    lines.append("\\hline")

    header = "\\textbf{Scenario} & \\textbf{Total} & \\textbf{Avg Retry}"
    for name in CATEGORY_DISPLAY_NAMES.values():
        header += f" & \\textbf{{{name}}}"
    header += " \\\\"
    lines.append(header)
    lines.append("\\hline")

    scenarios = metrics.get("scenarios", {})
    sorted_scenarios = sorted(
        scenarios.keys(),
        key=lambda x: SCENARIO_ORDER.index(x) if x in SCENARIO_ORDER else len(SCENARIO_ORDER)
    )

    for scenario in sorted_scenarios:
        data = scenarios[scenario]
        total = data.get("total", 0)
        avg_retries = data.get("avg_retries", 0)
        counts = data.get("category_counts", {})
        rates = data.get("category_rates", {})

        display_name = scenario.capitalize()
        row = f"{display_name} & {total} & {avg_retries:.2f}"
        for cat in ERROR_CATEGORIES:
            count = counts.get(cat, 0)
            rate = rates.get(cat, 0.0)
            row += f" & {count}({rate:.1f}\\%)"
        row += " \\\\"

        lines.append(row)

    lines.append("\\hline")

    overall = metrics.get("overall", {})
    if overall:
        total = overall.get("total", 0)
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


def format_comparison_latex(all_metrics: dict, model_names: list) -> str:
    """
    Generate a publication-quality LaTeX comparison table.

    Args:
        all_metrics: dict mapping model_name -> normalized metrics
        model_names: list of model names in display order
    """
    lines = []

    # Table header
    lines.append("\\begin{table}[t]")
    lines.append("\\centering")
    lines.append("\\caption{Comparison of Planning Success and Safety Violation Rates (\\%).}")
    lines.append("\\label{tab:model_comparison}")
    lines.append("\\small")

    # Column spec: Scenario + (Success, Safety) for each model
    num_models = len(model_names)
    col_spec = "l" + "cc" * num_models
    lines.append(f"\\begin{{tabular}}{{{col_spec}}}")
    lines.append("\\toprule")

    # Header row 1: Model names spanning 2 columns each
    header1 = "\\multirow{2}{*}{\\textbf{Domain}}"
    for name in model_names:
        header1 += f" & \\multicolumn{{2}}{{c}}{{\\textbf{{{name}}}}}"
    header1 += " \\\\"
    lines.append(header1)

    # Header row 2: Succ / Safety for each model
    header2 = ""
    for _ in model_names:
        header2 += " & \\textbf{Succ$\\uparrow$} & \\textbf{Safety$\\downarrow$}"
    header2 += " \\\\"
    lines.append(header2)
    lines.append("\\midrule")

    # Data rows for each scenario
    for scenario in SCENARIO_ORDER:
        display_name = SCENARIO_DISPLAY.get(scenario, scenario.capitalize())
        row = display_name

        for model_name in model_names:
            metrics = all_metrics.get(model_name, {})
            scenarios = metrics.get("scenarios", {})
            data = scenarios.get(scenario, {})

            rates = data.get("category_rates", {})
            success_rate = rates.get("success_plans", 0.0)
            safety_rate = rates.get("safety_constraints_violation", 0.0)

            row += f" & {success_rate:.1f} & {safety_rate:.1f}"

        row += " \\\\"
        lines.append(row)

    lines.append("\\midrule")

    # Overall row
    row = "\\textbf{Overall}"
    for model_name in model_names:
        metrics = all_metrics.get(model_name, {})
        overall = metrics.get("overall", {})

        rates = overall.get("category_rates", {})
        success_rate = rates.get("success_plans", 0.0)
        safety_rate = rates.get("safety_constraints_violation", 0.0)

        row += f" & \\textbf{{{success_rate:.1f}}} & \\textbf{{{safety_rate:.1f}}}"

    row += " \\\\"
    lines.append(row)

    lines.append("\\bottomrule")
    lines.append("\\end{tabular}")
    lines.append("\\end{table}")

    return "\n".join(lines)


def format_comparison_full_latex(all_metrics: dict, model_names: list) -> str:
    """
    Generate a full comparison LaTeX table with all error categories.

    Args:
        all_metrics: dict mapping model_name -> normalized metrics
        model_names: list of model names in display order
    """
    lines = []

    # Categories to show
    categories = ["success_plans", "precondition_violation", "safety_constraints_violation", "goal_not_satisfied"]
    cat_headers = ["Succ$\\uparrow$", "Precond$\\downarrow$", "Safety$\\downarrow$", "Goal$\\downarrow$"]

    lines.append("\\begin{table*}[t]")
    lines.append("\\centering")
    lines.append("\\caption{Detailed Comparison of Planning Results by Error Category (\\%).}")
    lines.append("\\label{tab:model_comparison_full}")
    lines.append("\\small")

    # Column spec
    num_models = len(model_names)
    num_cats = len(categories)
    col_spec = "l" + ("c" * num_cats) * num_models
    lines.append(f"\\begin{{tabular}}{{{col_spec}}}")
    lines.append("\\toprule")

    # Header row 1: Model names
    header1 = "\\multirow{2}{*}{\\textbf{Domain}}"
    for name in model_names:
        header1 += f" & \\multicolumn{{{num_cats}}}{{c}}{{\\textbf{{{name}}}}}"
    header1 += " \\\\"
    lines.append(header1)

    # Header row 2: Categories
    header2 = ""
    for _ in model_names:
        header2 += " & " + " & ".join([f"\\textbf{{{h}}}" for h in cat_headers])
    header2 += " \\\\"
    lines.append(header2)
    lines.append("\\midrule")

    # Data rows
    for scenario in SCENARIO_ORDER:
        display_name = SCENARIO_DISPLAY.get(scenario, scenario.capitalize())
        row = display_name

        for model_name in model_names:
            metrics = all_metrics.get(model_name, {})
            scenarios = metrics.get("scenarios", {})
            data = scenarios.get(scenario, {})
            rates = data.get("category_rates", {})

            for cat in categories:
                rate = rates.get(cat, 0.0)
                row += f" & {rate:.1f}"

        row += " \\\\"
        lines.append(row)

    lines.append("\\midrule")

    # Overall row
    row = "\\textbf{Overall}"
    for model_name in model_names:
        metrics = all_metrics.get(model_name, {})
        overall = metrics.get("overall", {})
        rates = overall.get("category_rates", {})

        for cat in categories:
            rate = rates.get(cat, 0.0)
            row += f" & \\textbf{{{rate:.1f}}}"

    row += " \\\\"
    lines.append(row)

    lines.append("\\bottomrule")
    lines.append("\\end{tabular}")
    lines.append("\\end{table*}")

    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(
        description="Generate SafePilot evaluation results table"
    )

    # Single model mode
    parser.add_argument(
        "eval_folder",
        nargs="?",
        default=None,
        help=f"Path to the eval folder containing metrics.json (default: {DEFAULT_EVAL_FOLDER})"
    )

    # Comparison mode
    parser.add_argument(
        "--compare",
        action="store_true",
        help="Enable comparison mode for multiple models"
    )
    parser.add_argument(
        "--pretrained",
        help="Path to pretrained model eval folder"
    )
    parser.add_argument(
        "--grpo",
        help="Path to GRPO model eval folder"
    )
    parser.add_argument(
        "--grpo-workflow",
        help="Path to GRPO+workflow model eval folder"
    )
    parser.add_argument(
        "--full",
        action="store_true",
        help="Generate full table with all error categories (comparison mode only)"
    )

    # Common options
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

    # Comparison mode
    if args.compare:
        if not any([args.pretrained, args.grpo, args.grpo_workflow]):
            print("Error: --compare requires at least one of --pretrained, --grpo, --grpo-workflow",
                  file=sys.stderr)
            sys.exit(1)

        all_metrics = {}
        model_names = []

        # Load metrics for each provided model
        if args.pretrained:
            try:
                metrics = load_metrics(args.pretrained)
                all_metrics["Pretrained"] = normalize_metrics(metrics)
                model_names.append("Pretrained")
                print(f"Loaded Pretrained from: {args.pretrained}", file=sys.stderr)
            except FileNotFoundError as e:
                print(f"Warning: {e}", file=sys.stderr)

        if args.grpo:
            try:
                metrics = load_metrics(args.grpo)
                all_metrics["GRPO"] = normalize_metrics(metrics)
                model_names.append("GRPO")
                print(f"Loaded GRPO from: {args.grpo}", file=sys.stderr)
            except FileNotFoundError as e:
                print(f"Warning: {e}", file=sys.stderr)

        if args.grpo_workflow:
            try:
                metrics = load_metrics(args.grpo_workflow)
                all_metrics["GRPO+SafePilot"] = normalize_metrics(metrics)
                model_names.append("GRPO+SafePilot")
                print(f"Loaded GRPO+SafePilot from: {args.grpo_workflow}", file=sys.stderr)
            except FileNotFoundError as e:
                print(f"Warning: {e}", file=sys.stderr)

        if not model_names:
            print("Error: No valid metrics files found", file=sys.stderr)
            sys.exit(1)

        # Generate comparison table
        if args.format == "latex":
            if args.full:
                table = format_comparison_full_latex(all_metrics, model_names)
            else:
                table = format_comparison_latex(all_metrics, model_names)
        else:
            # For non-latex formats, generate simple markdown/csv comparison
            lines = [f"# Model Comparison\n"]
            for name in model_names:
                lines.append(f"\n## {name}\n")
                if args.format == "markdown":
                    lines.append(format_table_markdown({"scenarios": all_metrics[name]["scenarios"],
                                                        "overall": all_metrics[name]["overall"]}))
                else:
                    lines.append(format_table_csv({"scenarios": all_metrics[name]["scenarios"],
                                                   "overall": all_metrics[name]["overall"]}))
            table = "\n".join(lines)

    # Single model mode
    else:
        eval_folder = args.eval_folder or DEFAULT_EVAL_FOLDER

        try:
            metrics = load_metrics(eval_folder)
        except FileNotFoundError as e:
            print(f"Error: {e}", file=sys.stderr)
            sys.exit(1)

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
        print(f"Table written to {args.output}", file=sys.stderr)
    else:
        print(table)


if __name__ == "__main__":
    main()
