#!/usr/bin/env python3
"""
Cross-model comparison across all 5 PDDL planning domains.
Generates two publication-quality figures:
  1. Grouped bar chart of success rates
  2. Multi-panel stacked bar chart of error breakdowns

Usage:
    python script/plot_cross_model_comparison.py \
        --gpt5-dir runs/gpt5 \
        --llama-dir runs/llama31_8b/grpo/.../eval/solver_batch_... \
        --qwen-dir runs/qwen3/grpo/.../eval/solver_batch_... \
        --output paper_plots
"""

import json
import argparse
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
from pathlib import Path

# Academic publication style (NeurIPS/ICLR)
plt.rcParams.update({
    'font.family': 'serif',
    'font.serif': ['Times New Roman', 'DejaVu Serif', 'Computer Modern Roman'],
    'mathtext.fontset': 'cm',
    'axes.labelsize': 18,
    'axes.titlesize': 20,
    'xtick.labelsize': 14,
    'ytick.labelsize': 14,
    'legend.fontsize': 14,
    'axes.linewidth': 0.8,
    'axes.edgecolor': 'black',
    'axes.unicode_minus': False,
})

DOMAINS = ["blocksworld", "ferry", "spanner", "grippers"]
DOMAIN_LABELS = ["Blocksworld", "Ferry", "Spanner", "Grippers"]

MODEL_NAMES = ["GPT-5 Nano", "GRPO Llama-8B", "GRPO Qwen3-14B"]

# Error categories for stacked bar (order: success first, then errors)
STACK_CATEGORIES = [
    "success_plans",
    "precondition_violation",
    "safety_constraints_violation",
    "goal_not_satisfied",
    "plan_format_error",
    "other",  # generation_error + others combined
]

STACK_LABELS = [
    "Success",
    "Precondition Violation",
    "Safety Violation",
    "Goal Not Satisfied",
    "Format Error",
    "Other Error",
]

# Colors for stacked bars
STACK_COLORS = [
    "#4daf4a",  # green - success
    "#e41a1c",  # red - precondition
    "#ff7f00",  # orange - safety
    "#377eb8",  # blue - goal
    "#984ea3",  # purple - format
    "#999999",  # gray - other
]

# Model colors for grouped bar chart
MODEL_COLORS = ["#a6cee3", "#b2df8a", "#fdbf6f"]  # pastel blue, green, orange
MODEL_HATCHES = ["", "//", "xx"]


def load_json(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        return json.load(f)


def load_gpt5_data(gpt5_dir):
    """Load GPT-5 per-domain data from individual JSON files."""
    gpt5_dir = Path(gpt5_dir)
    domain_data = {}
    for json_file in sorted(gpt5_dir.glob("*.json")):
        data = load_json(json_file)
        scenario = data.get("scenario")
        if scenario:
            cc = data.get("category_counts", {})
            total = data.get("total_tests", 50)
            # Combine generation_error and others into "other"
            other_count = cc.get("generation_error", 0) + cc.get("others", 0)
            domain_data[scenario] = {
                "category_counts": cc,
                "other": other_count,
                "total_tests": total,
                "success_rate": data.get("success_rate", 0.0),
            }
    return domain_data


def load_grpo_data(grpo_dir):
    """Load GRPO eval data from metrics.json with per_scenario breakdown."""
    grpo_dir = Path(grpo_dir)
    metrics = load_json(grpo_dir / "metrics.json")
    domain_data = {}
    for scenario, sdata in metrics.get("per_scenario", {}).items():
        cc = sdata.get("category_counts", {})
        total = sdata.get("total_tests", 50)
        other_count = cc.get("generation_error", 0) + cc.get("others", 0)
        domain_data[scenario] = {
            "category_counts": cc,
            "other": other_count,
            "total_tests": total,
            "success_rate": sdata.get("success_rate", 0.0),
        }
    return domain_data


def get_category_count(domain_data, domain, category):
    """Get count for a category, handling 'other' specially."""
    dd = domain_data.get(domain, {})
    if category == "other":
        return dd.get("other", 0)
    return dd.get("category_counts", {}).get(category, 0)


def get_success_rate(domain_data, domain):
    return domain_data.get(domain, {}).get("success_rate", 0.0)


def get_total_tests(domain_data, domain):
    return domain_data.get(domain, {}).get("total_tests", 50)


def parse_args():
    parser = argparse.ArgumentParser(
        description="Cross-model comparison across 5 PDDL planning domains",
    )
    parser.add_argument("--gpt5-dir", type=str, required=True,
                        help="Directory with GPT-5 evaluation_summary_*.json files")
    parser.add_argument("--llama-dir", type=str, required=True,
                        help="GRPO Llama eval dir (contains metrics.json)")
    parser.add_argument("--qwen-dir", type=str, required=True,
                        help="GRPO Qwen eval dir (contains metrics.json)")
    parser.add_argument("--output", type=str, default="paper_plots",
                        help="Output directory (default: paper_plots)")
    return parser.parse_args()


def plot_success_rate(all_data, output_dir):
    """Figure 1: Grouped bar chart of success rates across domains."""
    fig, ax = plt.subplots(figsize=(13, 7))

    x = np.arange(len(DOMAINS))
    width = 0.25

    for i, (model_name, model_data) in enumerate(zip(MODEL_NAMES, all_data)):
        rates = [get_success_rate(model_data, d) for d in DOMAINS]
        bars = ax.bar(
            x + (i - 1) * width, rates, width,
            label=model_name,
            color=MODEL_COLORS[i],
            hatch=MODEL_HATCHES[i],
            edgecolor='black',
            linewidth=0.8,
        )
        # Value labels above bars
        for bar, rate in zip(bars, rates):
            ax.text(
                bar.get_x() + bar.get_width() / 2., bar.get_height() + 1.5,
                f'{rate:.0f}%',
                ha='center', va='bottom', fontsize=11,
            )

    ax.set_xlabel("Domain", fontsize=18)
    ax.set_ylabel("Success Rate (%)", fontsize=18)
    ax.set_title("Cross-Model Success Rate Comparison", fontsize=20, pad=15)
    ax.set_xticks(x)
    ax.set_xticklabels(DOMAIN_LABELS, fontsize=14)
    ax.set_ylim(0, 115)
    ax.yaxis.set_major_formatter(plt.FuncFormatter(lambda y, _: f'{y:.0f}%'))
    ax.yaxis.grid(True, linestyle='--', alpha=0.5, color='gray')
    ax.xaxis.grid(False)
    ax.set_axisbelow(True)

    legend = ax.legend(loc='upper center', ncol=3, frameon=True, fancybox=False,
                       edgecolor='black', fontsize=14,
                       bbox_to_anchor=(0.5, 1.02))
    legend.get_frame().set_facecolor('white')
    legend.get_frame().set_alpha(0.85)

    plt.tight_layout()
    out_path = output_dir / "cross_model_success_rate.png"
    plt.savefig(out_path, dpi=300, bbox_inches='tight')
    print(f"Saved: {out_path}")
    plt.close()


def plot_error_breakdown(all_data, output_dir):
    """Figure 2: Multi-panel stacked bar chart (one subplot per domain)."""
    fig, axes = plt.subplots(2, 3, figsize=(18, 10))
    axes_flat = axes.flatten()

    for idx, domain in enumerate(DOMAINS):
        ax = axes_flat[idx]

        x = np.arange(len(MODEL_NAMES))
        width = 0.6

        # Compute percentages for each model and category
        bottoms = np.zeros(len(MODEL_NAMES))
        for cat_idx, category in enumerate(STACK_CATEGORIES):
            counts = []
            for model_data in all_data:
                count = get_category_count(model_data, domain, category)
                total = get_total_tests(model_data, domain)
                counts.append(count / total * 100 if total > 0 else 0)
            vals = np.array(counts)
            ax.bar(
                x, vals, width, bottom=bottoms,
                label=STACK_LABELS[cat_idx] if idx == 0 else None,
                color=STACK_COLORS[cat_idx],
                edgecolor='black',
                linewidth=0.5,
            )
            bottoms += vals

        ax.set_title(DOMAIN_LABELS[idx], fontsize=16)
        ax.set_xticks(x)
        ax.set_xticklabels(MODEL_NAMES, fontsize=9, rotation=20, ha='right')
        ax.set_ylim(0, 110)
        ax.yaxis.set_major_formatter(plt.FuncFormatter(lambda y, _: f'{y:.0f}%'))
        ax.yaxis.grid(True, linestyle='--', alpha=0.4, color='gray')
        ax.xaxis.grid(False)
        ax.set_axisbelow(True)
        if idx % 3 == 0:
            ax.set_ylabel("Percentage (%)", fontsize=14)

    # Hide the 6th (empty) subplot
    axes_flat[5].set_visible(False)

    # Place legend in the empty 6th subplot area
    handles, labels = axes_flat[0].get_legend_handles_labels()
    fig.legend(handles, labels, loc='lower right',
               bbox_to_anchor=(0.95, 0.05),
               frameon=True, fancybox=False, edgecolor='black',
               fontsize=12, ncol=1)

    fig.suptitle("Error Breakdown by Domain and Model", fontsize=20, y=1.01)
    plt.tight_layout()
    out_path = output_dir / "cross_model_error_breakdown.png"
    plt.savefig(out_path, dpi=300, bbox_inches='tight')
    print(f"Saved: {out_path}")
    plt.close()


def print_summary(all_data):
    """Print a summary table to console."""
    print("\n" + "=" * 90)
    print("CROSS-MODEL COMPARISON SUMMARY")
    print("=" * 90)

    # Header
    header = f"{'Domain':<15}"
    for name in MODEL_NAMES:
        header += f" {name:>18}"
    print(header)
    print("-" * 90)

    # Success rates
    print("\nSuccess Rate (%):")
    for domain, label in zip(DOMAINS, DOMAIN_LABELS):
        row = f"  {label:<13}"
        for model_data in all_data:
            rate = get_success_rate(model_data, domain)
            row += f" {rate:>17.1f}%"
        print(row)

    # Error breakdown per domain
    print("\nDetailed Error Counts:")
    for domain, label in zip(DOMAINS, DOMAIN_LABELS):
        print(f"\n  {label}:")
        cats_to_show = [
            ("success_plans", "Success"),
            ("precondition_violation", "Precond. Violation"),
            ("safety_constraints_violation", "Safety Violation"),
            ("goal_not_satisfied", "Goal Not Satisfied"),
            ("plan_format_error", "Format Error"),
            ("other", "Other"),
        ]
        cat_header = f"    {'Category':<25}"
        for name in MODEL_NAMES:
            cat_header += f" {name:>15}"
        print(cat_header)
        print("    " + "-" * 75)
        for cat_key, cat_label in cats_to_show:
            row = f"    {cat_label:<25}"
            for model_data in all_data:
                count = get_category_count(model_data, domain, cat_key)
                total = get_total_tests(model_data, domain)
                pct = count / total * 100 if total > 0 else 0
                row += f" {count:>7} ({pct:4.0f}%)"
            print(row)

    print("\n" + "=" * 90)


def main():
    args = parse_args()

    output_dir = Path(args.output)
    output_dir.mkdir(parents=True, exist_ok=True)
    print(f"Output directory: {output_dir.absolute()}")

    # Load data
    print("Loading GPT-5 Nano data...")
    gpt5_data = load_gpt5_data(args.gpt5_dir)
    print(f"  Found domains: {sorted(gpt5_data.keys())}")

    print("Loading GRPO Llama-8B data...")
    llama_data = load_grpo_data(args.llama_dir)
    print(f"  Found domains: {sorted(llama_data.keys())}")

    print("Loading GRPO Qwen3-14B data...")
    qwen_data = load_grpo_data(args.qwen_dir)
    print(f"  Found domains: {sorted(qwen_data.keys())}")

    all_data = [gpt5_data, llama_data, qwen_data]

    # Check all domains present
    for model_name, model_data in zip(MODEL_NAMES, all_data):
        missing = [d for d in DOMAINS if d not in model_data]
        if missing:
            print(f"WARNING: {model_name} missing domains: {missing}")

    # Generate plots
    print("\nGenerating success rate chart...")
    plot_success_rate(all_data, output_dir)

    # Print summary
    print_summary(all_data)


if __name__ == "__main__":
    main()
