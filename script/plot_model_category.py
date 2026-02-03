#!/usr/bin/env python3
"""
Compare three model types (baseline, GRPO, sft) across five error categories.
Publication-quality grouped bar chart with academic styling (NeurIPS/ICLR style).

Usage:
    python plot_model_category.py --baseline baseline.json --GRPO GRPO.json --sft sft.json --output paper_plots
    python plot_model_category.py --baseline baseline.json --GRPO GRPO.json --sft sft.json
"""

import json
import argparse
import matplotlib
matplotlib.use('Agg')  # Non-interactive backend for server environments
import matplotlib.pyplot as plt
import numpy as np
from pathlib import Path

# Academic publication style (NeurIPS/ICLR)
plt.rcParams.update({
    'font.family': 'serif',
    'font.serif': ['Times New Roman', 'DejaVu Serif', 'Computer Modern Roman'],
    'mathtext.fontset': 'cm',  # Computer Modern for math
    'axes.labelsize': 18,
    'axes.titlesize': 20,
    'xtick.labelsize': 14,
    'ytick.labelsize': 14,
    'legend.fontsize': 14,
    'axes.linewidth': 0.8,
    'axes.edgecolor': 'black',
    'axes.unicode_minus': False,
})

def load_json(file_path):
    """Load JSON file."""
    with open(file_path, 'r', encoding='utf-8') as f:
        return json.load(f)

def parse_results(results):
    """Parse results array and count occurrences per category."""
    category_counts = {
        "success_plans": 0,
        "plan_format_error": 0,
        "precondition_violation": 0,
        "safety_constraints_violation": 0,
        "goal_not_satisfied": 0,

    }
    
    for result in results:
        category = result.get("category")
        if category and category in category_counts:
            category_counts[category] += 1
    
    return category_counts

def parse_args():
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(
        description="Compare error type distribution across three model types",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python plot_model_category.py --baseline baseline.json --GRPO GRPO.json --sft sft.json
  python plot_model_category.py --baseline baseline.json --GRPO GRPO.json --sft sft.json --output paper_plots
        """
    )
    parser.add_argument(
        "--baseline",
        type=str,
        required=True,
        help="Path to baseline model JSON results file"
    )
    parser.add_argument(
        "--GRPO",
        type=str,
        required=True,
        help="Path to GRPO model JSON results file"
    )
    parser.add_argument(
        "--sft",
        type=str,
        required=True,
        help="Path to SFT model JSON results file"
    )
    parser.add_argument(
        "--output",
        type=str,
        default="paper_plots",
        help="Output directory (default: paper_plots)"
    )
    parser.add_argument(
        "--model-name",
        type=str,
        default=None,
        help="Model name for title (default: inferred from path or 'Model')"
    )
    parser.add_argument(
        "--domain",
        type=str,
        default=None,
        help="Domain name for title (default: inferred from file path)"
    )
    return parser.parse_args()

def main():
    # Parse command line arguments
    args = parse_args()

    # File paths
    baseline_file = Path(args.baseline)
    GRPO_file = Path(args.GRPO)
    sft_file = Path(args.sft)

    # Validate files exist
    for name, file_path in [("Baseline", baseline_file), ("GRPO", GRPO_file), ("SFT", sft_file)]:
        if not file_path.exists():
            raise FileNotFoundError(f"{name} file not found: {file_path}")

    # Create output directory
    output_dir = Path(args.output)
    output_dir.mkdir(parents=True, exist_ok=True)
    print(f"Output directory: {output_dir.absolute()}")

    # Infer domain name from file path if not provided
    if args.domain is None:
        # Extract domain name from baseline file path
        # e.g.: .../baseline/blocksworld_test_results.json -> blocksworld
        baseline_name = baseline_file.stem
        domain = baseline_name
        if domain.endswith("_test_results_pddl3"):
            domain = domain[:-len("_test_results_pddl3")]
        elif domain.endswith("_test_results"):
            domain = domain[:-len("_test_results")]
        args.domain = domain.replace("_", " ").title()

    # Infer model name from path if not provided
    if args.model_name is None:
        # Try to extract model name from path
        # e.g.: .../paper_results/qwen3-14b/... -> qwen3-14b
        path_parts = baseline_file.parts
        if "paper_results" in path_parts:
            idx = path_parts.index("paper_results")
            if idx + 1 < len(path_parts):
                model_name = path_parts[idx + 1]
                if "qwen" in model_name.lower():
                    args.model_name = "Qwen3-14B"
                elif "mistral" in model_name.lower():
                    args.model_name = "Mistral-7B"
                else:
                    args.model_name = model_name.replace("-", " ").replace("_", " ").title()
            else:
                args.model_name = "Model"
        else:
            args.model_name = "Model"

    print(f"Model name: {args.model_name}")
    print(f"Domain: {args.domain}")

    # Load data
    print("Loading JSON files...")
    baseline_data = load_json(baseline_file)
    GRPO_data = load_json(GRPO_file)
    sft_data = load_json(sft_file)

    # Use category_counts if available, otherwise parse from results
    print("Parsing results...")
    if "category_counts" in baseline_data:
        baseline_counts = baseline_data["category_counts"]
        print("Using category_counts from baseline data")
    else:
        baseline_counts = parse_results(baseline_data["results"])
        print("Parsing baseline results...")
    
    if "category_counts" in GRPO_data:
        GRPO_counts = GRPO_data["category_counts"]
        print("Using category_counts from GRPO data")
    else:
        GRPO_counts = parse_results(GRPO_data["results"])
        print("Parsing GRPO results...")
    
    if "category_counts" in sft_data:
        sft_counts = sft_data["category_counts"]
        print("Using category_counts from SFT data")
    else:
        sft_counts = parse_results(sft_data["results"])
        print("Parsing SFT results...")
    
    print("\nBaseline counts:", baseline_counts)
    print("GRPO counts:", GRPO_counts)
    print("SFT counts:", sft_counts)
    
    # Define five categories in order: errors first, success last
    error_categories = [
        "plan_format_error",
        "precondition_violation",
        "safety_constraints_violation",
        "goal_not_satisfied",
        "success_plans"
    ]

    # Prepare data - order: Pretrained, SFT, GRPO
    models = ["Pretrained", "SFT", "GRPO"]
    total_tests = baseline_data.get("total_tests", 50)

    # Calculate percentages for Y-axis display
    percentages = {
        "Pretrained": [baseline_counts.get(cat, 0) / total_tests * 100 for cat in error_categories],
        "SFT": [sft_counts.get(cat, 0) / total_tests * 100 for cat in error_categories],
        "GRPO": [GRPO_counts.get(cat, 0) / total_tests * 100 for cat in error_categories]
    }

    # Use percentages as data
    data = percentages.copy()

    # Keep raw counts for reference
    counts = {
        "Pretrained": [baseline_counts.get(cat, 0) for cat in error_categories],
        "SFT": [sft_counts.get(cat, 0) for cat in error_categories],
        "GRPO": [GRPO_counts.get(cat, 0) for cat in error_categories]
    }

    # Create figure
    fig, ax = plt.subplots(figsize=(13, 7.5))

    # Set bar positions
    x = np.arange(len(error_categories))
    width = 0.25
    
    # Academic pastel color palette
    colors = {
        "Pretrained": "#a6cee3",  # Pastel blue
        "SFT": "#b2df8a",         # Pastel green
        "GRPO": "#fdbf6f"          # Pastel orange
    }

    # Distinct hatch patterns for accessibility
    hatches = {
        "Pretrained": "",      # Solid fill
        "SFT": "//",           # Diagonal lines
        "GRPO": "xx"            # Cross-hatch
    }

    # Draw bars with hatches and black edges
    bars1 = ax.bar(x - width, data["Pretrained"], width, label="Pretrained",
                   color=colors["Pretrained"], hatch=hatches["Pretrained"],
                   edgecolor='black', linewidth=0.8)
    bars2 = ax.bar(x, data["SFT"], width, label="SFT",
                   color=colors["SFT"], hatch=hatches["SFT"],
                   edgecolor='black', linewidth=0.8)
    bars3 = ax.bar(x + width, data["GRPO"], width, label="GRPO",
                   color=colors["GRPO"], hatch=hatches["GRPO"],
                   edgecolor='black', linewidth=0.8)
    
    # Set labels and title (academic style - no bold)
    ax.set_xlabel("Categories", fontsize=18)
    ax.set_ylabel("Percentage (%)", fontsize=18)
    title = f"Error Type Distribution: {args.model_name} on {args.domain}"
    ax.set_title(title, fontsize=20, pad=15)
    ax.set_xticks(x)

    # Category labels with line wrapping for long names
    category_labels = [cat.replace("_", " ").title() for cat in error_categories]
    wrapped_labels = []
    for label in category_labels:
        if len(label) > 15:
            words = label.split()
            if len(words) > 1:
                mid = len(words) // 2
                wrapped_labels.append('\n'.join([' '.join(words[:mid]), ' '.join(words[mid:])]))
            else:
                wrapped_labels.append(label)
        else:
            wrapped_labels.append(label)

    ax.set_xticklabels(wrapped_labels, rotation=0, ha='center', fontsize=14)

    # Grid styling: y-axis only, dashed lines
    ax.yaxis.grid(True, linestyle='--', alpha=0.5, color='gray')
    ax.xaxis.grid(False)
    ax.set_axisbelow(True)

    # Legend with semi-transparent background (academic style)
    legend = ax.legend(loc='upper right', frameon=True, fancybox=False,
                       edgecolor='black', fontsize=14)
    legend.get_frame().set_facecolor('white')
    legend.get_frame().set_alpha(0.85)

    # Adjust bottom margin for labels
    plt.subplots_adjust(bottom=0.20)
    
    # Set Y-axis limit with space for labels
    ax.set_ylim(0, 105)

    # Format Y-axis as percentages
    ax.yaxis.set_major_formatter(plt.FuncFormatter(lambda y, _: f'{y:.0f}%'))
    
    def add_value_labels(bars, percents, model_counts):
        for bar, pct, count in zip(bars, percents, model_counts):
            height = bar.get_height()
            label_text = f'{pct:.1f}%'
            if height > 0:
                label_y = min(height + 2, 100)
            else:
                label_y = 2
            ax.text(bar.get_x() + bar.get_width()/2., label_y,
                    label_text,
                    ha='center', va='bottom', fontsize=11)
    
    add_value_labels(bars1, percentages["Pretrained"], counts["Pretrained"])
    add_value_labels(bars2, percentages["SFT"], counts["SFT"])
    add_value_labels(bars3, percentages["GRPO"], counts["GRPO"])

    plt.tight_layout()

    # Save figure
    output_file = output_dir / "model_comparison.png"
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    print(f"\nChart saved to: {output_file}")
    plt.close()

    # Print statistical summary
    print("\n" + "="*60)
    print("STATISTICAL SUMMARY")
    print("="*60)
    print(f"{'Category':<30} {'Pretrained':<12} {'SFT':<12} {'GRPO':<12}")
    print("-"*60)
    for cat in error_categories:
        print(f"{cat.replace('_', ' ').title():<30} "
              f"{baseline_counts.get(cat, 0):<12} "
              f"{sft_counts.get(cat, 0):<12} "
              f"{GRPO_counts.get(cat, 0):<12}")
    print("-"*60)
    print(f"{'Success Plans':<30} "
          f"{baseline_counts.get('success_plans', 0):<12} "
          f"{sft_counts.get('success_plans', 0):<12} "
          f"{GRPO_counts.get('success_plans', 0):<12}")
    print("="*60)

if __name__ == "__main__":
    main()

