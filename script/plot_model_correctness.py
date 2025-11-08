#!/usr/bin/env python3
"""解析指定模型目录下的多个 variant 结果并生成对比图表。"""

import argparse
import json
import re
from pathlib import Path
from typing import Dict, List, Optional

import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns

# 设置 Seaborn 样式
sns.set_style("whitegrid")
sns.set_palette("husl")
sns.set_context("notebook", font_scale=1.2)

# 设置字体支持
plt.rcParams['font.sans-serif'] = ['DejaVu Sans', 'Arial', 'Liberation Sans']
plt.rcParams['axes.unicode_minus'] = False

# Variant 颜色配置
VARIANT_COLORS = {
    'baseline': '#4682B4',  # Steel Blue
    'pretrained': '#4682B4',  # Steel Blue
    'sft': '#3CB371',  # Medium Sea Green
    'sft_quant4': '#3CB371',  # Medium Sea Green
    'dpo': '#FF8C00',  # Dark Orange
    'pddl2': '#E15759',
    'pddl3': '#76B7B2',
}

# Variant 标签
VARIANT_LABELS = {
    'baseline': 'Baseline',
    'pretrained': 'Baseline',  # pretrained 显示为 Baseline
    'sft': 'SFT',
    'sft_quant4': 'SFT',
    'dpo': 'DPO',
    'pddl2': 'PDDL2',
    'pddl3': 'PDDL3',
}

# 模型名称映射（目录名 -> 显示名称）
MODEL_DISPLAY_NAMES = {
    'mistral-multi': 'Mistral-7B',
    'qwen3-14b': 'Qwen-14B',
    'gpt-oss-multi': 'GPT-OSS-20B',
}


def _extract_solution_text(item: dict) -> Optional[str]:
    """优先使用 raw_solution，若无则尝试读取 solution_file。"""
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


def _looks_like_valid_plan(plan_text: str) -> bool:
    """判断文本是否符合纯计划输出格式。"""
    lines = [line.strip() for line in plan_text.splitlines() if line.strip()]
    if not lines:
        return False
    return all(line.startswith("(") and line.endswith(")") for line in lines)


def _classify_result(item: dict) -> str:
    """根据 is_valid 和 validation_stdout 分类结果。"""
    is_valid = item.get("is_valid")
    if is_valid is None:
        is_valid = item.get("valid")

    if is_valid is None:
        status = item.get("status")
        is_valid = isinstance(status, str) and status.lower() == "valid"

    if bool(is_valid):
        return "success_plans"
    
    plan_text = _extract_solution_text(item)
    if plan_text is not None and not _looks_like_valid_plan(plan_text):
        return "plan_format_error"

    stdout_text = item.get("validation_stdout", "")
    if not stdout_text:
        stdout_text = item.get("execution_info", {}).get("stdout", "")
    if not stdout_text:
        return "plan_format_error"
    
    text = stdout_text.lower()

    if "bad operator in plan" in text or "bad plan description!" in text or "no matching action defined" in text or "object with unknown type" in text:
        return "plan_format_error"

    if "goal not satisfied" in text:
        return "goal_not_satisfied"

    if "plan failed to execute" in text and "unsatisfied precondition" in text:
        return "precondition_violation"

    if "plan failed to execute" in text and "unsatisfied precondition" not in text:
        return "safety_constraints_violation"

    return "others"


def _summarize_results(items):
    """对单个目录内的 results 进行分类汇总。"""
    categories = {
        "success_plans": [],
        "plan_format_error": [],
        "precondition_violation": [],
        "safety_constraints_violation": [],
        "goal_not_satisfied": [],
        "others": []
    }

    for it in items:
        name = it.get("problem_name") or it.get("solution_file") or "unknown"
        cat = _classify_result(it)
        categories[cat].append(name)

    summary = {k: len(v) for k, v in categories.items()}
    summary["total"] = sum(summary.values())
    
    return {
        "summary": summary,
        "problems_by_category": categories,
    }


def _load_json(path: Path) -> Optional[dict]:
    """加载 JSON 文件。"""
    if not path.exists():
        return None
    try:
        with open(path, "r", encoding="utf-8") as f:
            return json.load(f)
    except (json.JSONDecodeError, OSError) as exc:
        print(f"警告: 无法加载 {path}: {exc}")
        return None


def _extract_scenario_name(json_file: Path) -> Optional[str]:
    """从 JSON 文件名提取 scenario 名称。"""
    name = json_file.stem
    
    # 移除常见的后缀模式
    patterns = [
        r'_test_results.*$',
        r'_testing_results.*$',
        r'_all_testing.*$',
        r'_results.*$',
    ]
    
    for pattern in patterns:
        name = re.sub(pattern, '', name)
    
    return name if name else None


def _parse_variant_json(json_path: Path, variant: str) -> Optional[Dict[str, object]]:
    """解析单个 variant JSON 文件并生成 summary。"""
    raw = _load_json(json_path)
    if raw is None:
        return None
    
    items = raw.get("results") or []
    if not items:
        return None
    
    summarized = _summarize_results(items)
    
    # 提取 metadata
    metadata = raw.get("metadata") or {}
    metadata.update({
        "model": raw.get("model_path") or metadata.get("model_path") or "unknown",
        "scenario": metadata.get("scenario_name") or _extract_scenario_name(json_path) or "unknown",
        "variant": variant,
        "results_directory": raw.get("results_directory") or metadata.get("results_directory") or str(json_path.parent),
        "source_file": json_path.name,
        "domain_file": raw.get("domain_file") or metadata.get("domain_file"),
        "problems_dir": raw.get("problems_dir") or metadata.get("problems_dir"),
        "total_tests": raw.get("total_tests") or len(items),
    })
    summarized["metadata"] = metadata
    
    return summarized


def parse_model_variants(model_dir: str, variants: List[str]) -> Dict[str, Dict[str, dict]]:
    """解析指定模型目录下的多个 variant 结果。
    
    返回格式: {scenario: {variant: {summary: {...}, metadata: {...}}}}
    """
    model_path = Path(model_dir)
    if not model_path.exists():
        raise FileNotFoundError(f"模型目录不存在: {model_path}")
    
    if not model_path.is_dir():
        raise ValueError(f"路径不是目录: {model_path}")
    
    aggregated: Dict[str, Dict[str, dict]] = {}
    
    for variant in variants:
        variant_dir = model_path / variant
        if not variant_dir.exists() or not variant_dir.is_dir():
            print(f"警告: variant 目录不存在: {variant_dir}，跳过")
            continue
        
        # 查找所有 JSON 文件
        json_files = sorted(variant_dir.glob("*.json"))
        if not json_files:
            print(f"警告: {variant_dir} 中未找到任何 JSON 文件，跳过")
            continue
        
        print(f"正在解析 variant: {variant} ({len(json_files)} 个文件)")
        
        for json_file in json_files:
            scenario_name = _extract_scenario_name(json_file)
            if not scenario_name:
                print(f"警告: 无法从文件名提取 scenario 名称: {json_file.name}，跳过")
                continue
            
            result = _parse_variant_json(json_file, variant)
            if result is None:
                continue
            
            # 使用提取的 scenario 名称
            final_scenario = result.get("metadata", {}).get("scenario") or scenario_name
            
            if final_scenario not in aggregated:
                aggregated[final_scenario] = {}
            
            aggregated[final_scenario][variant] = result
    
    if not aggregated:
        raise ValueError("未成功解析任何 JSON 文件")
    
    return aggregated


def plot_success_rate_comparison(
    data: Dict[str, Dict[str, dict]],
    variants: List[str],
    output_path: str,
    model_display_name: Optional[str] = None,
) -> None:
    """使用 Seaborn 美化生成成功率对比图。"""
    # 收集所有场景
    scenario_names = sorted(data.keys())
    if not scenario_names:
        print("警告: 没有可用的场景数据")
        return
    
    # 计算每个 variant 在每个 scenario 上的成功率
    success_rates: Dict[str, List[float]] = {variant: [] for variant in variants}
    
    for scenario_name in scenario_names:
        scenario_data = data[scenario_name]
        for variant in variants:
            if variant in scenario_data:
                summary = scenario_data[variant].get("summary", {})
                total = max(summary.get("total", 0), 1)
                success_count = summary.get("success_plans", 0)
                rate = success_count / total * 100
            else:
                rate = 0.0
            success_rates[variant].append(rate)
    
    # 创建图表，使用 Seaborn 样式
    fig, ax = plt.subplots(figsize=(max(14, len(scenario_names) * 1.8), 8))
    
    # 设置背景色
    fig.patch.set_facecolor('white')
    ax.set_facecolor('#FAFAFA')
    
    # 准备数据用于绘制
    x_pos = np.arange(len(scenario_names))
    width = min(0.8 / len(variants), 0.3) if len(variants) > 1 else 0.6
    
    # 使用 Seaborn 调色板获取颜色
    palette = sns.color_palette("husl", len(variants))
    variant_colors_map = {variant: VARIANT_COLORS.get(variant, palette[i]) 
                          for i, variant in enumerate(variants)}
    
    for idx, variant in enumerate(variants):
        if len(success_rates[variant]) != len(scenario_names):
            continue
        
        offset = (idx - (len(variants) - 1) / 2) * width
        rates = success_rates[variant]
        
        # 绘制柱状图，添加边缘和阴影效果
        bars = ax.bar(
            x_pos + offset,
            rates,
            width=width,
            label=VARIANT_LABELS.get(variant, variant.upper()),
            color=variant_colors_map[variant],
            alpha=0.85,
            edgecolor='white',
            linewidth=2,
        )
        
        # 在柱状图上添加数值标签
        for bar, rate in zip(bars, rates):
            if rate > 0:
                # 成功率为正数时，显示在柱状图上方
                ax.text(
                    bar.get_x() + bar.get_width() / 2,
                    bar.get_height() + max(1.5, 100 / len(scenario_names) * 0.03),
                    f'{rate:.1f}%',
                    ha='center',
                    va='bottom',
                    fontsize=10,
                    fontweight='bold',
                    color='#2C3E50',
                )
            else:
                # 成功率为0时，在x轴上方显示标签
                ax.text(
                    bar.get_x() + bar.get_width() / 2,
                    2.5,  # 显示在x轴上方2.5%的位置
                    '0.0%',
                    ha='center',
                    va='bottom',
                    fontsize=10,
                    fontweight='bold',
                    color='#E74C3C',  # 使用红色突出显示0值
                    style='italic',  # 斜体表示特殊情况
                    bbox=dict(boxstyle='round,pad=0.4', facecolor='white', 
                             edgecolor='#E74C3C', linewidth=1.5, alpha=0.9),
                )
    
    # 设置标题和标签，使用更好的样式
    if model_display_name:
        title = f'{model_display_name} - Success Rate Comparison Across Scenarios'
    else:
        title = 'Success Rate Comparison Across Scenarios'
    
    ax.set_title(
        title,
        fontsize=18,
        fontweight='bold',
        pad=20,
        color='#2C3E50'
    )
    ax.set_ylabel('Success Rate (%)', fontsize=14, fontweight='semibold', color='#34495E')
    ax.set_xlabel('Scenarios', fontsize=14, fontweight='semibold', color='#34495E')
    
    # 设置x轴标签（增大字体）
    ax.set_xticks(x_pos)
    ax.set_xticklabels(
        [name.title() for name in scenario_names],
        rotation=45,
        ha='right',
        fontsize=14,  # 从 12 增大到 14
        fontweight='semibold'  # 添加半粗体
    )
    
    # 设置y轴
    ax.set_ylim(0, 105)  # 留出空间显示标签
    ax.set_yticks(range(0, 101, 10))
    ax.tick_params(axis='y', labelsize=11)
    
    # 添加网格线（Seaborn 样式）
    ax.grid(axis='y', alpha=0.3, linestyle='--', linewidth=0.8)
    ax.grid(axis='x', alpha=0.1, linestyle='--', linewidth=0.5)
    
    # 设置图例，使用更好的样式
    legend = ax.legend(
        loc='upper left',
        frameon=True,
        fancybox=True,
        shadow=True,
        fontsize=12,
        framealpha=0.95,
        edgecolor='gray',
        facecolor='white'
    )
    legend.get_frame().set_linewidth(1.5)
    
    # 添加边框
    for spine in ax.spines.values():
        spine.set_visible(True)
        spine.set_color('#BDC3C7')
        spine.set_linewidth(1.5)
    
    plt.tight_layout()
    plt.savefig(output_path, dpi=300, bbox_inches='tight', facecolor='white')
    plt.close()
    print(f"✓ 图表已保存: {output_path}")


def main():
    """主函数"""
    parser = argparse.ArgumentParser(
        description="解析指定模型目录下的多个 variant 结果并生成对比图表",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例:
  python plot_model_correctness.py --model paper_results/qwen3-14b baseline sft dpo
  python plot_model_correctness.py --model paper_results/qwen3-14b baseline sft
        """
    )
    parser.add_argument(
        "--model",
        required=True,
        help="模型目录路径，例如 paper_results/qwen3-14b"
    )
    parser.add_argument(
        "variants",
        nargs="+",
        help="要比较的 variant 列表，例如 baseline sft dpo"
    )
    
    args = parser.parse_args()
    
    # 解析模型目录下的 variant 结果
    print(f"正在解析模型目录: {args.model}")
    print(f"Variants: {', '.join(args.variants)}")
    
    try:
        data = parse_model_variants(args.model, args.variants)
    except Exception as exc:
        print(f"错误: {exc}")
        return 1
    
    # 提取模型名称（从路径中）
    model_name = Path(args.model).name
    
    # 获取模型显示名称
    model_display_name = MODEL_DISPLAY_NAMES.get(model_name, model_name)
    
    # 创建输出目录
    output_dir = Path("paper_plots") / model_name
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # 保存 JSON 文件
    json_path = Path("paper_plots") / f"{model_name}.json"
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f"✓ JSON 文件已保存: {json_path}")
    
    # 生成图表
    plot_path = output_dir / "success_rate_comparison.png"
    plot_success_rate_comparison(data, args.variants, str(plot_path), model_display_name)
    
    print(f"\n✓ 成功解析 {len(data)} 个场景")
    print(f"✓ 结果已保存到: {json_path.resolve()}")
    print(f"✓ 图表已保存到: {plot_path.resolve()}")
    
    return 0


if __name__ == "__main__":
    main()

