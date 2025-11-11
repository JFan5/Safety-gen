#!/usr/bin/env python3
"""
比较 Baseline / SFT / DPO 三类模型的单场景结果并生成对比图。

使用示例:
    python compare_models.py --baseline paper_results/mistral-blocksworld/baseline.json \
                             --dpo paper_results/mistral-blocksworld/dpo.json \
                             --sft paper_results/mistral-blocksworld/sft.json \
                             --output paper_plots
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


# 样式设置
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

# 类别颜色：从红色（plan_format_error）到绿色（success_plans）的渐变色
# 用于设置 x 轴标签文字颜色
CATEGORY_COLORS = {
    "plan_format_error": "#e74c3c",              # 红色
    "precondition_violation": "#f39c12",         # 橙红色
    "safety_constraints_violation": "#f1c40f",   # 黄色
    "goal_not_satisfied": "#27ae60",             # 黄绿色
    "success_plans": "#2ecc71",                  # 绿色
}

# 模型透明度调整
MODEL_ALPHA = {
    "Pretrained": 0.85,
    "SFT": 0.90,
    "DPO": 0.95,
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="比较 Baseline / SFT / DPO 三类模型的单场景结果并生成对比图",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例:
  python compare_models.py --baseline paper_results/mistral-blocksworld/baseline.json \\
                           --dpo paper_results/mistral-blocksworld/dpo.json \\
                           --sft paper_results/mistral-blocksworld/sft.json \\
                           --output paper_plots
  
  python compare_models.py --baseline paper_results/mistral-blocksworld/baseline.json \\
                           --dpo paper_results/mistral-blocksworld/dpo.json \\
                           --sft paper_results/mistral-blocksworld/sft.json \\
                           --output paper_plots/mistral-blocksworld \\
                           --scenario blocksworld
        """,
    )
    parser.add_argument(
        "--baseline",
        required=True,
        type=Path,
        help="Baseline 模型的 JSON 结果文件路径",
    )
    parser.add_argument(
        "--dpo",
        required=True,
        type=Path,
        help="DPO 模型的 JSON 结果文件路径",
    )
    parser.add_argument(
        "--sft",
        required=True,
        type=Path,
        help="SFT 模型的 JSON 结果文件路径",
    )
    parser.add_argument(
        "--output",
        required=True,
        type=Path,
        help="输出目录",
    )
    parser.add_argument(
        "--scenario",
        type=str,
        default=None,
        help="场景名称（如果不指定，将从文件路径或 JSON 内容中推断）",
    )
    parser.add_argument(
        "--no-seaborn",
        action="store_true",
        help="只生成 matplotlib 风格图，跳过 seaborn 图",
    )
    return parser.parse_args()


def load_json(path: Path) -> Dict:
    """加载 JSON 文件"""
    if not path.exists():
        raise FileNotFoundError(f"文件不存在: {path}")
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def extract_solution_text(item: dict) -> Optional[str]:
    """从结果项中提取解决方案文本"""
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
    """检查文本是否看起来像有效的计划"""
    lines = [line.strip() for line in plan_text.splitlines() if line.strip()]
    if not lines:
        return False
    return all(line.startswith("(") and line.endswith(")") for line in lines)


def classify_result(item: dict) -> str:
    """分类结果项"""
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
    """解析结果计数"""
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
    """计算百分比"""
    total = max(total_tests, 1)
    return [counts.get(cat, 0) / total * 100 for cat in CATEGORY_ORDER]


def wrap_labels(labels: Iterable[str]) -> List[str]:
    """包装标签文本"""
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
    """格式化统计摘要行"""
    return (
        f"{category:<30} "
        f"{values.get('Pretrained', 0):<12} "
        f"{values.get('SFT', 0):<12} "
        f"{values.get('DPO', 0):<12}"
    )


def infer_scenario_name(baseline_path: Path, payload: Dict) -> str:
    """从文件路径或 JSON 内容推断场景名称"""
    # 从文件路径推断
    path_str = str(baseline_path)
    if "blocksworld" in path_str.lower():
        return "blocksworld"
    if "ferry" in path_str.lower():
        return "ferry"
    if "grippers" in path_str.lower():
        return "grippers"
    if "grid" in path_str.lower():
        return "grid"
    if "delivery" in path_str.lower():
        return "delivery"
    if "spanner" in path_str.lower():
        return "spanner"
    
    # 从 JSON 内容推断
    problems_dir = payload.get("problems_dir", "")
    if "blocksworld" in problems_dir.lower():
        return "blocksworld"
    if "ferry" in problems_dir.lower():
        return "ferry"
    if "grippers" in problems_dir.lower():
        return "grippers"
    if "grid" in problems_dir.lower():
        return "grid"
    if "delivery" in problems_dir.lower():
        return "delivery"
    if "spanner" in problems_dir.lower():
        return "spanner"
    
    # 默认值
    return "unknown"


def render_matplotlib_chart(
    scenario: str,
    percentages: Dict[str, List[float]],
    counts: Dict[str, List[int]],
    output_dir: Path,
) -> Path:
    """渲染 matplotlib 风格的图表"""
    models = ["Pretrained", "SFT", "DPO"]
    fig, ax = plt.subplots(figsize=(13, 7.5))

    x = np.arange(len(CATEGORY_ORDER))
    width = 0.25

    bars = []
    all_rectangles = []  # 存储所有矩形对象
    for idx, model in enumerate(models):
        # 为每个类别使用对应的渐变色，模型之间用不同的亮度区分
        bars_per_category = []
        
        for cat_idx, (cat, pct) in enumerate(zip(CATEGORY_ORDER, percentages[model])):
            # 使用模型颜色（不是类别颜色）
            model_color = MODEL_COLORS[model]
            
            bar_container = ax.bar(
                x[cat_idx] + (idx - 1) * width,
                pct,
                width,
                label=model if cat_idx == 0 else "",  # 只在第一个类别显示图例
                color=model_color,
                edgecolor="black",
                linewidth=1.2,
                alpha=MODEL_ALPHA[model],
            )
            bars_per_category.append(bar_container)
            # 提取矩形对象
            all_rectangles.extend(bar_container)
        
        bars.extend(bars_per_category)

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
    # 设置 x 轴标签颜色为渐变色（从红色到绿色）
    xtick_labels = ax.set_xticklabels(wrapped_labels, rotation=0, ha="center", fontsize=12, fontweight="bold")
    for label, cat in zip(xtick_labels, CATEGORY_ORDER):
        label.set_color(CATEGORY_COLORS[cat])

    ax.set_ylim(0, 105)
    ax.yaxis.set_major_formatter(plt.FuncFormatter(lambda y, _: f"{y:.0f}%"))
    ax.tick_params(axis="y", labelsize=11)

    ax.grid(axis="y", alpha=0.3, linestyle="--")

    # 添加标签
    rect_idx = 0
    for model_idx, model in enumerate(models):
        for cat_idx, pct in enumerate(percentages[model]):
            if rect_idx < len(all_rectangles):
                rect = all_rectangles[rect_idx]
                height = rect.get_height()
                if height > 0:
                    label_y = min(height + 3, 100)
                    ax.text(
                        rect.get_x() + rect.get_width() / 2,
                        label_y,
                        f"{pct:.1f}%",
                        ha="center",
                        va="bottom",
                        fontsize=9,
                        fontweight="bold",
                    )
                rect_idx += 1
    
    # 创建图例（使用模型颜色）
    from matplotlib.patches import Rectangle
    legend_elements = []
    for model in models:
        model_color = MODEL_COLORS[model]
        legend_elements.append(
            Rectangle((0, 0), 1, 1, facecolor=model_color, edgecolor="black", 
                     linewidth=1.2, alpha=MODEL_ALPHA[model], label=model)
        )
    ax.legend(handles=legend_elements, fontsize=12, frameon=True, fancybox=True, 
              shadow=True, ncol=3, loc="upper right")

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
    """渲染 seaborn 风格的图表"""
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
    
    # 使用 seaborn barplot，但之后手动设置颜色
    sns.barplot(data=df, x="Category", y="Percentage", hue="Model", ax=ax, 
                palette=["#808080", "#808080", "#808080"])  # 临时灰色，后面会替换
    
    # 为每个柱状图设置对应的模型颜色
    # seaborn barplot 的顺序是：对于每个类别，先显示所有模型，然后下一个类别
    patch_idx = 0
    for cat in CATEGORY_ORDER:
        for model_idx, model in enumerate(models):
            if patch_idx < len(ax.patches):
                patch = ax.patches[patch_idx]
                # 使用模型颜色
                model_color = MODEL_COLORS[model]
                
                patch.set_facecolor(model_color)
                patch.set_alpha(MODEL_ALPHA[model])
                patch.set_edgecolor("black")
                patch.set_linewidth(1.2)
                patch_idx += 1
    
    # 更新图例以使用模型颜色
    ax.legend_.remove()
    from matplotlib.patches import Rectangle
    legend_elements = []
    for model in models:
        model_color = MODEL_COLORS[model]
        legend_elements.append(
            Rectangle((0, 0), 1, 1, facecolor=model_color, edgecolor="black", 
                     linewidth=1.2, alpha=MODEL_ALPHA[model], label=model)
        )
    ax.legend(handles=legend_elements, fontsize=12, frameon=True, fancybox=True, 
              shadow=True, ncol=3, loc="upper right")

    wrapped_labels = wrap_labels(df["Category"].unique())
    ax.set_xticks(range(len(CATEGORY_ORDER)))
    # 设置 x 轴标签颜色为渐变色（从红色到绿色）
    xtick_labels = ax.set_xticklabels(wrapped_labels, rotation=0, ha="center", fontsize=12, fontweight="bold")
    for label, cat in zip(xtick_labels, CATEGORY_ORDER):
        label.set_color(CATEGORY_COLORS[cat])

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
    """打印统计摘要"""
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

    # 加载 JSON 文件
    baseline_payload = load_json(args.baseline)
    dpo_payload = load_json(args.dpo)
    sft_payload = load_json(args.sft)

    # 推断场景名称
    scenario = args.scenario
    if scenario is None:
        scenario = infer_scenario_name(args.baseline, baseline_payload)
        print(f"推断的场景名称: {scenario}")

    # 确定总测试数
    total_tests = baseline_payload.get("total_tests") or len(baseline_payload.get("results", [])) or 50

    # 解析计数
    counts_map = {
        "Pretrained": parse_counts(baseline_payload),
        "SFT": parse_counts(sft_payload),
        "DPO": parse_counts(dpo_payload),
    }

    # 计算百分比
    percentages = {
        model: compute_percentages(counts_map[model], total_tests)
        for model in counts_map
    }

    # 生成计数列表
    counts_lists = {
        model: [counts_map[model].get(cat, 0) for cat in CATEGORY_ORDER]
        for model in counts_map
    }

    # 创建输出目录
    output_dir = Path(args.output)
    output_dir.mkdir(parents=True, exist_ok=True)

    print(f"\n>>> 生成场景: {scenario}")
    print(f"Baseline: {args.baseline.name}")
    print(f"SFT     : {args.sft.name}")
    print(f"DPO     : {args.dpo.name}")

    # 生成图表
    generated_images = []

    matplotlib_path = render_matplotlib_chart(scenario, percentages, counts_lists, output_dir)
    generated_images.append(matplotlib_path)
    print(f"生成 matplotlib 图表: {matplotlib_path}")

    if not args.no_seaborn:
        seaborn_path = render_seaborn_chart(scenario, percentages, counts_lists, output_dir)
        generated_images.append(seaborn_path)
        print(f"生成 seaborn 图表: {seaborn_path}")

    # 打印统计摘要
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

