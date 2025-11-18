#!/usr/bin/env python3
"""
生成 SFT 与 DPO 对比的错误类型百分比 LaTeX 表格。
纵轴：每个场景
横轴：五类错误（Plan Format Error -> Success Plans），列展示 SFT 与 DPO。
"""

from pathlib import Path
from collections import defaultdict
import json

# 错误类型（保持指定顺序）
ERROR_CATEGORIES = [
    "plan_format_error",
    "precondition_violation",
    "safety_constraints_violation",
    "goal_not_satisfied",
    "success_plans",
]

# 场景顺序
SCENARIO_ORDER = ["blocksworld", "ferry", "grippers", "spanner", "delivery"]
SCENARIO_NAMES = {
    "blocksworld": "Blocksworld",
    "ferry": "Ferry",
    "grippers": "Grippers",
    "spanner": "Spanner",
    "delivery": "Delivery",
}

ERROR_DISPLAY_NAMES = {
    "plan_format_error": "Plan Format Error",
    "precondition_violation": "Precondition Violation",
    "safety_constraints_violation": "Safety Constraints Violation",
    "goal_not_satisfied": "Goal Not Satisfied",
    "success_plans": "Success Plans",
}


def extract_scenario_name(filename: str) -> str:
    """通过文件名识别场景名称。"""
    lowered = filename.lower()
    for scenario in SCENARIO_ORDER:
        if scenario in lowered:
            return scenario

    # 回退策略：去掉扩展名后取首段
    name = filename.replace(".json", "")
    if "_" in name:
        return name.split("_", 1)[0]
    return name


def load_model_data(filepath: Path) -> dict | None:
    """读取 JSON 文件并返回错误类型百分比。"""
    with open(filepath, "r") as f:
        data = json.load(f)

    total = data.get("total_tests", data.get("max_problems", 0))
    if not total:
        return None

    # 优先使用 category_rates
    if "category_rates" in data:
        return {cat: data["category_rates"].get(cat, 0.0) for cat in ERROR_CATEGORIES}

    # 否则根据 category_counts 计算
    category_counts = defaultdict(int)
    if "category_counts" in data:
        for cat, value in data["category_counts"].items():
            category_counts[cat] = value
    else:
        # 更保险：遍历 results
        for result in data.get("results", []):
            if result.get("is_valid"):
                category_counts["success_plans"] += 1
            else:
                category = result.get("category")
                if category in ERROR_CATEGORIES:
                    category_counts[category] += 1

    return {
        cat: (category_counts.get(cat, 0) / total) * 100.0 for cat in ERROR_CATEGORIES
    }


def gather_directory_data(directory: str) -> dict[str, dict]:
    """扫描目录，返回 {scenario: category_rates}。"""
    data_per_scenario: dict[str, dict] = {}
    for json_file in Path(directory).glob("*.json"):
        scenario = extract_scenario_name(json_file.name)
        rates = load_model_data(json_file)
        if rates:
            data_per_scenario[scenario] = rates
    return data_per_scenario


def format_percentage(value: float, bold: bool = False) -> str:
    percent = f"{value:.1f}\\%"
    return f"\\textbf{{{percent}}}" if bold else percent


def generate_comparison_table(
    left_label: str,
    left_dir: str,
    right_label: str,
    right_dir: str,
    output_file: str,
):
    left_data = gather_directory_data(left_dir)
    right_data = gather_directory_data(right_dir)

    latex_lines: list[str] = []
    latex_lines.append("% SFT vs DPO comparison table")
    latex_lines.append("\\begin{table*}[h]")
    latex_lines.append("  \\centering")
    latex_lines.append("  \\caption{Error Type Percentages by Scenario}")
    latex_lines.append("  \\label{tab:error_percentages_sft_dpo}")
    latex_lines.append("  \\resizebox{0.85\\textwidth}{!}{%")

    col_spec = "l|" + "|".join(["cc"] * (len(ERROR_CATEGORIES) - 1)) + "||cc"
    latex_lines.append(f"  \\begin{{tabular}}{{{col_spec}}}")
    latex_lines.append("  \\hline")

    # Header rows
    header_lines = ["  \\textbf{Scenario}"]
    for cat in ERROR_CATEGORIES:
        header_lines.append(
            f"  & \\multicolumn{{2}}{{c}}{{{ERROR_DISPLAY_NAMES[cat]}}}"
        )
    latex_lines.append("\n".join(header_lines) + " \\\\")
    latex_lines.append("  \\hline")

    subheader_lines = ["  "]
    for _ in ERROR_CATEGORIES:
        subheader_lines.append(
            f"  & \\textbf{{{left_label}}} & \\textbf{{{right_label}}}"
        )
    latex_lines.append("\n".join(subheader_lines) + " \\\\")
    latex_lines.append("  \\hline")

    total_cols = 1 + len(ERROR_CATEGORIES) * 2
    max_label_len = max(len(name) for name in SCENARIO_NAMES.values())

    for scenario in SCENARIO_ORDER:
        if scenario == "delivery":
            latex_lines.append("  \\hline")
            latex_lines.append(
                f"  \\multicolumn{{{total_cols}}}{{c}}{{\\textbf{{Generalized Domain}}}} \\\\"
            )
            latex_lines.append("  \\hline")

        left_rates = left_data.get(scenario, {})
        right_rates = right_data.get(scenario, {})

        name = SCENARIO_NAMES[scenario]
        padded_name = name.ljust(max_label_len)
        row = f"  \\textbf{{{padded_name}}}"

        for cat in ERROR_CATEGORIES:
            left_value = left_rates.get(cat, 0.0)
            right_value = right_rates.get(cat, 0.0)
            left_str = format_percentage(left_value)
            right_str = format_percentage(
                right_value, bold=(cat == "success_plans")
            )
            row += f" & {left_str} & {right_str}"

        row += " \\\\"
        latex_lines.append(row)

    latex_lines.append("  \\hline")
    latex_lines.append("  \\end{tabular}")
    latex_lines.append("  }% end resizebox")
    latex_lines.append("\\end{table*}")

    Path(output_file).write_text("\n".join(latex_lines), encoding="utf-8")
    print(f"LaTeX table generated: {output_file}")
    print("\nTable preview:\n")
    print("\n".join(latex_lines))


if __name__ == "__main__":
    sft_dir = "/home/ubuntu/Safety-gen/paper_results/figure3_cross_domain_generalizability/sft"
    dpo_dir = "/home/ubuntu/Safety-gen/paper_results/figure3_cross_domain_generalizability/dpo"
    output = "/home/ubuntu/Safety-gen/paper_results/figure3_cross_domain_generalizability/error_table_sft_vs_dpo.tex"
    generate_comparison_table("SFT", sft_dir, "DPO", dpo_dir, output)

