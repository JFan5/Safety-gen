#!/usr/bin/env python3
"""
批量生成基于 Baseline / SFT / DPO 三类模型的单场景对比图。

使用示例:
    python batch_compare_models.py --model-dir paper_results/qwen3-14b blocksworld ferry
"""

import argparse
import json
from pathlib import Path
from typing import Dict, Iterable, List, Optional

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns


# 样式与 compare_models.py 保持一致
plt.rcParams["font.sans-serif"] = ["DejaVu Sans", "Arial", "Liberation Sans"]
plt.rcParams["axes.unicode_minus"] = False
sns.set_style("whitegrid")
sns.set_palette("husl")

CATEGORY_ORDER = [
    "plan_format_error",
    "precondition_violation",
    "safety_constraints_violation",
    "goal_not_satisfied",
    "success_plans",
]

MODEL_LABELS = {
    "baseline": "Pretrained",
    "sft": "SFT",
    "dpo": "DPO",
}

MODEL_COLORS = {
    "Pretrained": "#5dade2",  # 亮蓝色
    "SFT": "#58d68d",         # 亮绿色
    "DPO": "#f39c12",         # 亮橙色
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="批量生成单场景 Baseline / SFT / DPO 对比图",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例:
  python batch_compare_models.py --model-dir paper_results/qwen3-14b blocksworld ferry
  python batch_compare_models.py --model-dir paper_results/qwen3-14b --output-root paper_plots/qwen3-14b blocksworld
        """,
    )
    parser.add_argument(
        "--model-dir",
        required=True,
        help="模型结果根目录，例如 paper_results/qwen3-14b",
    )
    parser.add_argument(
        "--output-root",
        default="paper_plots",
        help="输出根目录（默认: paper_plots）",
    )
    parser.add_argument(
        "--no-seaborn",
        action="store_true",
        help="只生成 matplotlib 风格图，跳过 seaborn 图",
    )
    parser.add_argument(
        "scenarios",
        nargs="+",
        help="需要生成的场景列表，例如 blocksworld ferry",
    )
    return parser.parse_args()


def locate_scenario_file(variant_dir: Path, scenario: str) -> Path:
    """
    在指定 variant 目录中查找与场景名称匹配的 JSON 文件。
    会优先匹配以 `<scenario>_test_results` 开头的文件。
    """
    if not variant_dir.exists():
        raise FileNotFoundError(f"目录不存在: {variant_dir}")

    preferred_patterns = [
        f"{scenario}_test_results*.json",
        f"{scenario}_testing_results*.json",
        f"{scenario}_results*.json",
        f"{scenario}*.json",
    ]

    for pattern in preferred_patterns:
        matches = sorted(variant_dir.glob(pattern))
        if matches:
            return matches[0]

    available = sorted(p.name for p in variant_dir.glob("*.json"))
    raise FileNotFoundError(
        f"未在 {variant_dir} 找到 {scenario} 场景的 JSON 文件。\n"
        f"已存在的文件: {available}"
    )


def load_json(path: Path) -> Dict:
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def extract_solution_text(item: dict) -> Optional[str]:
    raw_solution = item.get("raw_solution")
    if isinstance(raw_solution, str):
        return raw_solution

    solution_path = item.get("solution_file")
    if not isinstance(solution_path, str) or not solution_path:
        return None

    path = Path(solution_path).expanduser()
    if not path.is_file():
        path = Path.cwd() / solution_path
    if not path.is_file():
        return None

    try:
        return path.read_text(encoding="utf-8")
    except OSError:
        return None


def looks_like_valid_plan(plan_text: str) -> bool:
    lines = [line.strip() for line in plan_text.splitlines() if line.strip()]
    if not lines:
        return False
    return all(line.startswith("(") and line.endswith(")") for line in lines)


def classify_result(item: dict) -> str:
    is_valid = item.get("is_valid")
    if is_valid is None:
        is_valid = item.get("valid")

    if is_valid is None:
        status = item.get("status")
        is_valid = isinstance(status, str) and status.lower() == "valid"

    if bool(is_valid):
        return "success_plans"

    plan_text = extract_solution_text(item)
    if plan_text is not None and not looks_like_valid_plan(plan_text):
        return "plan_format_error"

    stdout_text = item.get("validation_stdout", "") or item.get("execution_info", {}).get("stdout", "")
    if not stdout_text:
        return "plan_format_error"

    text = stdout_text.lower()

    if any(keyword in text for keyword in [
        "bad operator in plan",
        "bad plan description!",
        "no matching action defined",
        "object with unknown type",
    ]):
        return "plan_format_error"

    if "goal not satisfied" in text:
        return "goal_not_satisfied"

    if "plan failed to execute" in text and "unsatisfied precondition" in text:
        return "precondition_violation"

    if "plan failed to execute" in text and "unsatisfied precondition" not in text:
        return "safety_constraints_violation"

    return "others"


def parse_counts(payload: Dict) -> Dict[str, int]:
    default_counts = {
        "success_plans": 0,
        "plan_format_error": 0,
        "precondition_violation": 0,
        "safety_constraints_violation": 0,
        "goal_not_satisfied": 0,
        "others": 0,
        "generation_error": 0,
    }

    if "category_counts" in payload:
        counts = default_counts.copy()
        counts.update(payload["category_counts"])
        return counts

    results = payload.get("results") or []
    counts = default_counts.copy()
    for result in results:
        category = classify_result(result)
        if category in counts:
            counts[category] += 1
        else:
            counts["others"] += 1
    return counts


def compute_percentages(counts: Dict[str, int], total_tests: int) -> List[float]:
    total = max(total_tests, 1)
    return [counts.get(cat, 0) / total * 100 for cat in CATEGORY_ORDER]


def wrap_labels(labels: Iterable[str]) -> List[str]:
    wrapped = []
    for label in labels:
        if len(label) <= 15:
            wrapped.append(label)
            continue
        words = label.split()
        if len(words) > 1:
            mid = len(words) // 2
            wrapped.append("\n".join([" ".join(words[:mid]), " ".join(words[mid:])]))
        else:
            wrapped.append(label)
    return wrapped


def format_summary_line(category: str, values: Dict[str, int]) -> str:
    return (
        f"{category:<30} "
        f"{values.get('Pretrained', 0):<12} "
        f"{values.get('SFT', 0):<12} "
        f"{values.get('DPO', 0):<12}"
    )


def render_matplotlib_chart(
    scenario: str,
    percentages: Dict[str, List[float]],
    counts: Dict[str, List[int]],
    output_dir: Path,
) -> Path:
    models = ["Pretrained", "SFT", "DPO"]
    fig, ax = plt.subplots(figsize=(13, 7.5))

    x = np.arange(len(CATEGORY_ORDER))
    width = 0.25

    bars = []
    for idx, model in enumerate(models):
        bars.append(
            ax.bar(
                x + (idx - 1) * width,
                percentages[model],
                width,
                label=model,
                color=MODEL_COLORS[model],
                edgecolor="black",
                linewidth=1.2,
            )
        )

    ax.set_xlabel("Categories", fontsize=14, fontweight="bold")
    ax.set_ylabel("Percentage (%)", fontsize=14, fontweight="bold")
    ax.set_title(
        f"Error Type Distribution Comparison: {scenario.title()}",
        fontsize=16,
        fontweight="bold",
        pad=15,
    )
    ax.set_xticks(x)
    wrapped_labels = wrap_labels([cat.replace("_", " ").title() for cat in CATEGORY_ORDER])
    ax.set_xticklabels(wrapped_labels, rotation=0, ha="center", fontsize=12, fontweight="bold")

    ax.set_ylim(0, 105)
    ax.yaxis.set_major_formatter(plt.FuncFormatter(lambda y, _: f"{y:.0f}%"))
    ax.tick_params(axis="y", labelsize=11)

    ax.legend(fontsize=12, frameon=True, fancybox=True, shadow=True, ncol=3, loc="upper right")
    ax.grid(axis="y", alpha=0.3, linestyle="--")

    def add_labels(bar_container, pct_values):
        for bar, pct in zip(bar_container, pct_values):
            height = bar.get_height()
            label_y = min(height + 3, 100)
            ax.text(
                bar.get_x() + bar.get_width() / 2,
                label_y if height > 0 else 3,
                f"{pct:.1f}%",
                ha="center",
                va="bottom",
                fontsize=9,
                fontweight="bold",
            )

    for container, model in zip(bars, models):
        add_labels(container, percentages[model])

    plt.tight_layout()
    output_path = output_dir / f"{scenario}_model_comparison.png"
    plt.savefig(output_path, dpi=300, bbox_inches="tight")
    plt.close()
    return output_path


def render_seaborn_chart(
    scenario: str,
    percentages: Dict[str, List[float]],
    counts: Dict[str, List[int]],
    output_dir: Path,
) -> Path:
    models = ["Pretrained", "SFT", "DPO"]
    records = []

    for model in models:
        for cat, pct, count in zip(CATEGORY_ORDER, percentages[model], counts[model]):
            records.append(
                {
                    "Model": model,
                    "Category": cat.replace("_", " ").title(),
                    "Percentage": pct,
                    "Count": count,
                }
            )

    df = pd.DataFrame(records)

    fig, ax = plt.subplots(figsize=(13, 7.5))
    sns.barplot(data=df, x="Category", y="Percentage", hue="Model", palette=list(MODEL_COLORS.values()), ax=ax)

    for patch in ax.patches:
        patch.set_edgecolor("black")
        patch.set_linewidth(1.2)

    wrapped_labels = wrap_labels(df["Category"].unique())
    ax.set_xticks(range(len(CATEGORY_ORDER)))
    ax.set_xticklabels(wrapped_labels, rotation=0, ha="center", fontsize=12, fontweight="bold")

    ax.set_xlabel("Categories", fontsize=14, fontweight="bold")
    ax.set_ylabel("Percentage (%)", fontsize=14, fontweight="bold")
    ax.set_title(
        f"Error Types Distribution Comparison for {scenario.title()}",
        fontsize=16,
        fontweight="bold",
        pad=15,
    )
    ax.yaxis.set_major_formatter(plt.FuncFormatter(lambda y, _: f"{y:.0f}%"))
    ax.set_ylim(0, 105)
    ax.tick_params(axis="y", labelsize=11)
    ax.legend(fontsize=12, frameon=True, fancybox=True, shadow=True, ncol=3, loc="upper right")
    ax.grid(axis="y", alpha=0.3, linestyle="--")

    for container, model in zip(ax.containers, models):
        labels = [f"{pct:.1f}%" for pct in percentages[model]]
        ax.bar_label(container, labels=labels, fontsize=9, fontweight="bold", padding=3)

    plt.tight_layout()
    output_path = output_dir / f"{scenario}_model_comparison_seaborn.png"
    plt.savefig(output_path, dpi=300, bbox_inches="tight")
    plt.close()
    return output_path


def print_summary(counts_map: Dict[str, Dict[str, int]]) -> None:
    print("\n" + "=" * 60)
    print("STATISTICAL SUMMARY")
    print("=" * 60)
    print(f"{'Category':<30} {'Pretrained':<12} {'SFT':<12} {'DPO':<12}")
    print("-" * 60)

    for cat in CATEGORY_ORDER:
        label = cat.replace("_", " ").title()
        values = {model: counts_map[model][cat] for model in ["Pretrained", "SFT", "DPO"]}
        print(format_summary_line(label, values))

    success_values = {model: counts_map[model]["success_plans"] for model in ["Pretrained", "SFT", "DPO"]}
    print("-" * 60)
    print(format_summary_line("Success Plans", success_values))
    print("=" * 60)


def main() -> int:
    args = parse_args()

    model_dir = Path(args.model_dir).resolve()
    if not model_dir.exists():
        raise FileNotFoundError(f"模型目录不存在: {model_dir}")

    baseline_dir = model_dir / "baseline"
    dpo_dir = model_dir / "dpo"
    sft_dir = model_dir / "sft"

    for required_dir in [baseline_dir, dpo_dir, sft_dir]:
        if not required_dir.exists():
            raise FileNotFoundError(f"缺少子目录: {required_dir}")

    output_root = Path(args.output_root).resolve()
    output_root.mkdir(parents=True, exist_ok=True)

    generated_images = []

    for scenario in args.scenarios:
        scenario = scenario.strip()
        if not scenario:
            continue

        try:
            baseline_file = locate_scenario_file(baseline_dir, scenario)
            dpo_file = locate_scenario_file(dpo_dir, scenario)
            sft_file = locate_scenario_file(sft_dir, scenario)
        except FileNotFoundError as exc:
            print(f"跳过 {scenario}: {exc}")
            continue

        baseline_payload = load_json(baseline_file)
        dpo_payload = load_json(dpo_file)
        sft_payload = load_json(sft_file)

        total_tests = baseline_payload.get("total_tests") or len(baseline_payload.get("results", [])) or 50

        counts_map = {
            "Pretrained": parse_counts(baseline_payload),
            "SFT": parse_counts(sft_payload),
            "DPO": parse_counts(dpo_payload),
        }

        percentages = {
            model: compute_percentages(counts_map[model], total_tests)
            for model in counts_map
        }

        counts_lists = {
            model: [counts_map[model].get(cat, 0) for cat in CATEGORY_ORDER]
            for model in counts_map
        }

        output_dir = output_root / model_dir.name
        output_dir.mkdir(parents=True, exist_ok=True)

        print(f"\n>>> 生成场景: {scenario}")
        print(f"Baseline: {baseline_file.name}")
        print(f"SFT     : {sft_file.name}")
        print(f"DPO     : {dpo_file.name}")

        matplotlib_path = render_matplotlib_chart(scenario, percentages, counts_lists, output_dir)
        generated_images.append(matplotlib_path)
        
        if not args.no_seaborn:
            seaborn_path = render_seaborn_chart(scenario, percentages, counts_lists, output_dir)
            generated_images.append(seaborn_path)
            
        print_summary(counts_map)

    # 打印所有生成的图片路径
    if generated_images:
        print("\n" + "=" * 60)
        print("生成的图片路径:")
        print("=" * 60)
        for img_path in generated_images:
            print(f"  {img_path.resolve()}")
        print("=" * 60)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())


