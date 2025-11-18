#!/usr/bin/env python3
"""
生成错误类型百分比的 LaTeX 表格
纵轴：每个场景（scenario）
横轴：每种错误的百分比
"""

import json
import os
from pathlib import Path
from collections import defaultdict
import sys

# 添加 script 目录到路径，以便导入 utils
sys.path.insert(0, str(Path(__file__).parent))
from utils import _classify_result

# 错误类型列表（按顺序：Plan Format Error 最左边，依次 Precondition Violation, Safety Constraints Violation, Goal Not Satisfied, Success Plans）
ERROR_CATEGORIES = [
    "plan_format_error",
    "precondition_violation",
    "safety_constraints_violation",
    "goal_not_satisfied",
    "success_plans"
]

# 场景名称映射（用于显示）
SCENARIO_NAMES = {
    "blocksworld": "Blocksworld",
    "ferry": "Ferry",
    "grippers": "Grippers",
    "spanner": "Spanner",
    "delivery": "Delivery"
}

# 错误类型显示名称
ERROR_DISPLAY_NAMES = {
    "plan_format_error": "Plan Format Error",
    "precondition_violation": "Precondition Violation",
    "safety_constraints_violation": "Safety Constraints Violation",
    "goal_not_satisfied": "Goal Not Satisfied",
    "success_plans": "Success Plans"
}


def extract_scenario_name(filename):
    """从文件名提取场景名称"""
    import re
    # 移除 .json 扩展名
    name = filename.replace(".json", "")
    # 移除 " copy" 后缀（如果有）
    name = name.replace(" copy", "")
    # 使用正则表达式提取场景名称（在 _test_results 之前的部分）
    match = re.match(r'^([^_]+)', name)
    if match:
        return match.group(1)
    # 如果正则匹配失败，尝试移除常见后缀
    name = name.replace("_test_results", "").replace("_pddl3", "")
    # 移除所有下划线和后续内容，只保留第一个单词
    if '_' in name:
        name = name.split('_')[0]
    return name


def load_pretrained_data(filepath):
    """加载 pretrained 数据并计算错误百分比"""
    with open(filepath, 'r') as f:
        data = json.load(f)

    total = data.get('total_tests', 0)
    if total == 0:
        return None

    # 统计各类错误
    category_counts = defaultdict(int)

    # 如果有 category_counts，直接使用
    if 'category_counts' in data:
        for cat in ERROR_CATEGORIES:
            category_counts[cat] = data['category_counts'].get(cat, 0)
    else:
        # 否则从 results 中分类
        results = data.get('results', [])
        for result in results:
            if result.get('is_valid', False):
                category_counts['success_plans'] = category_counts.get('success_plans', 0) + 1
            else:
                # 使用 _classify_result 分类
                stdout = result.get('validation_stdout', '')
                category = _classify_result(stdout)
                # 只统计我们需要的类别
                if category in ERROR_CATEGORIES:
                    category_counts[category] = category_counts.get(category, 0) + 1

    # 计算百分比
    category_rates = {}
    for cat in ERROR_CATEGORIES:
        count = category_counts.get(cat, 0)
        rate = (count / total * 100) if total > 0 else 0.0
        category_rates[cat] = rate

    return category_rates


def load_sft_data(filepath):
    """加载 SFT 数据并提取错误百分比"""
    with open(filepath, 'r') as f:
        data = json.load(f)

    # SFT 文件应该有 category_rates
    if 'category_rates' in data:
        category_rates = {}
        for cat in ERROR_CATEGORIES:
            category_rates[cat] = data['category_rates'].get(cat, 0.0)
        return category_rates
    else:
        # 如果没有，尝试计算
        return load_pretrained_data(filepath)


def generate_latex_table(pretrained_dir, sft_dir, output_file):
    """生成 LaTeX 表格"""

    # 收集所有场景
    pretrained_files = list(Path(pretrained_dir).glob("*_test_results*.json"))
    sft_files = list(Path(sft_dir).glob("*_test_results*.json"))

    scenarios = set()
    for f in pretrained_files:
        scenarios.add(extract_scenario_name(f.name))
    for f in sft_files:
        scenarios.add(extract_scenario_name(f.name))

    # 定义场景顺序：delivery 排在最后
    scenario_order = ["blocksworld", "ferry", "grippers", "spanner", "delivery"]
    # 按照指定顺序排序，不在列表中的场景放在最后
    scenarios = sorted(scenarios, key=lambda x: (
        scenario_order.index(x) if x in scenario_order else len(scenario_order)
    ))

    # 收集数据
    pretrained_data = {}
    sft_data = {}

    # 加载 pretrained 数据
    for f in pretrained_files:
        scenario = extract_scenario_name(f.name)
        rates = load_pretrained_data(f)
        if rates:
            pretrained_data[scenario] = rates

    # 加载 SFT 数据（如果有重复文件，使用最后一个）
    for f in sft_files:
        scenario = extract_scenario_name(f.name)
        rates = load_sft_data(f)
        if rates:
            # 如果已经有数据，合并或覆盖（这里选择覆盖，使用最新的）
            sft_data[scenario] = rates

    # 生成 LaTeX 表格
    latex_lines = []
    latex_lines.append("% Simple table, vertical lines between error categories")
    latex_lines.append("\\begin{table*}[h]")
    latex_lines.append("\\centering")
    latex_lines.append("\\caption{Error Type Percentages by Scenario}")
    latex_lines.append("\\label{tab:error_percentages}")
    latex_lines.append("\\resizebox{0.85\\textwidth}{!}{%")

    # 列格式：l|cc|cc|...，每种错误之间用竖线隔开，最后一列前面再加一个竖线
    col_spec = "l|" + "|".join(["cc"] * (len(ERROR_CATEGORIES) - 1)) + "||cc"
    latex_lines.append(f"\\begin{{tabular}}{{{col_spec}}}")
    latex_lines.append("\\hline")

    # 表头（每个 multicolumn 单独一行）
    header_lines = ["\\textbf{Scenario}"]
    for i, error_type in enumerate(ERROR_CATEGORIES):
        if i == len(ERROR_CATEGORIES) - 1:
            # 最后一列
            header_lines.append(f"  & \\multicolumn{{2}}{{c}}{{{ERROR_DISPLAY_NAMES[error_type]}}}")
        else:
            header_lines.append(f"  & \\multicolumn{{2}}{{c}}{{{ERROR_DISPLAY_NAMES[error_type]}}}")
    latex_lines.append(" \n".join(header_lines) + " \\\\")
    latex_lines.append("\\hline")

    # 子表头：Pretrained 和 SFT（每个部分单独一行）
    subheader_lines = [" "]
    for i in range(len(ERROR_CATEGORIES)):
        subheader_lines.append(f"   & \\textbf{{Pretrained}} & \\textbf{{SFT}}")
    latex_lines.append(" \n".join(subheader_lines) + " \\\\")
    latex_lines.append("\\hline")

    # 数据行
    total_cols = 1 + len(ERROR_CATEGORIES) * 2  # 1 scenario column + 2 columns per error type
    
    for i, scenario in enumerate(scenarios):
        # 如果是 delivery，在它之前添加 "Generalized Domain" 行和分隔线
        if scenario == "delivery":
            latex_lines.append("\\hline")
            latex_lines.append(f"  \\multicolumn{{{total_cols}}}{{c}}{{\\textbf{{Generalized Domain}}}} \\\\")
            latex_lines.append("\\hline")
        
        # 对齐场景名称（使用空格对齐，最长的是 "Blocksworld" = 11 个字符）
        scenario_name = SCENARIO_NAMES.get(scenario, scenario)
        max_length = 11  # "Blocksworld" 的长度
        # 在 \textbf{} 内部添加空格对齐
        if len(scenario_name) < max_length:
            padding = " " * (max_length - len(scenario_name))
            row = f"\\textbf{{{scenario_name}{padding}}}"
        else:
            row = f"\\textbf{{{scenario_name}}}"
        
        for error_type in ERROR_CATEGORIES:
            pretrained_rate = pretrained_data.get(scenario, {}).get(error_type, 0.0)
            sft_rate = sft_data.get(scenario, {}).get(error_type, 0.0)

            # 一律显示百分比，0 也显示为 0.0\%
            pretrained_str = f"{pretrained_rate:.1f}\\%"
            # 如果是 success_plans 且是 SFT，则加粗
            if error_type == "success_plans":
                sft_str = f"\\textbf{{{sft_rate:.1f}\\%}}"
            else:
                sft_str = f"{sft_rate:.1f}\\%"

            row += f" & {pretrained_str} & {sft_str}"

        row += " \\\\"
        latex_lines.append(row)
    latex_lines.append("\\end{tabular}")
    latex_lines.append("}% end resizebox")
    latex_lines.append("\\end{table*}")

    # 写入文件
    with open(output_file, 'w') as f:
        f.write('\n'.join(latex_lines))

    print(f"LaTeX table generated: {output_file}")
    print("\nTable preview:")
    print('\n'.join(latex_lines))


if __name__ == "__main__":
    pretrained_dir = "/home/ubuntu/Safety-gen/paper_results/figure3_cross_domain_generalizability/baseline"
    sft_dir = "/home/ubuntu/Safety-gen/paper_results/figure3_cross_domain_generalizability/sft"
    output_file = "/home/ubuntu/Safety-gen/paper_results/figure3_cross_domain_generalizability/error_table.tex"

    generate_latex_table(pretrained_dir, sft_dir, output_file)
