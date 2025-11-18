#!/usr/bin/env python3
"""
比较两个模型（baseline, dpo）的五种错误类型分布情况
使用matplotlib和seaborn绘制柱状图

用法:
    python plot_two_models.py --baseline baseline.json --dpo dpo.json --output output_dir
"""

import json
import argparse
import matplotlib
matplotlib.use('Agg')  # 使用非交互式后端，适合服务器环境
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import pandas as pd
from pathlib import Path

# 设置中文字体和样式
plt.rcParams['font.sans-serif'] = ['DejaVu Sans', 'Arial', 'Liberation Sans']
plt.rcParams['axes.unicode_minus'] = False
sns.set_style("whitegrid")
sns.set_palette("husl")

def load_json(file_path):
    """加载JSON文件"""
    with open(file_path, 'r', encoding='utf-8') as f:
        return json.load(f)

def parse_results(results):
    """解析results数组，统计各类别的分布"""
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
    """解析命令行参数"""
    parser = argparse.ArgumentParser(
        description="比较两个模型的错误类型分布情况",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例:
  python plot_two_models.py --baseline baseline.json --dpo dpo.json --output output_dir
        """
    )
    parser.add_argument(
        "--baseline",
        type=str,
        required=True,
        help="Baseline模型的JSON结果文件路径"
    )
    parser.add_argument(
        "--dpo",
        type=str,
        required=True,
        help="DPO模型的JSON结果文件路径"
    )
    parser.add_argument(
        "--output",
        type=str,
        default="paper_plots",
        help="输出目录（默认: paper_plots）"
    )
    parser.add_argument(
        "--no-seaborn",
        action="store_true",
        help="不生成seaborn风格的图表"
    )
    parser.add_argument(
        "--model-name",
        type=str,
        default=None,
        help="模型名称（用于标题，默认从路径推断或使用'Model'）"
    )
    parser.add_argument(
        "--domain",
        type=str,
        default=None,
        help="测试领域名称（用于标题，默认从文件路径推断）"
    )
    parser.add_argument(
        "--baseline-label",
        type=str,
        default="Mistral-7B",
        help="Baseline模型的标签（默认: Mistral-7B）"
    )
    parser.add_argument(
        "--dpo-label",
        type=str,
        default="Blocksworld DPO",
        help="DPO模型的标签（默认: Blocksworld DPO）"
    )
    return parser.parse_args()

def main():
    # 解析命令行参数
    args = parse_args()
    
    # 文件路径
    baseline_file = Path(args.baseline)
    dpo_file = Path(args.dpo)
    
    # 验证文件是否存在
    for name, file_path in [("Baseline", baseline_file), ("DPO", dpo_file)]:
        if not file_path.exists():
            raise FileNotFoundError(f"{name}文件不存在: {file_path}")
    
    # 创建输出目录
    output_dir = Path(args.output)
    output_dir.mkdir(parents=True, exist_ok=True)
    print(f"输出目录: {output_dir.absolute()}")
    
    # 从文件路径推断domain名称（如果未提供）
    if args.domain is None:
        baseline_name = baseline_file.stem
        domain = baseline_name
        if domain.endswith("_test_results_pddl3"):
            domain = domain[:-len("_test_results_pddl3")]
        elif domain.endswith("_test_results"):
            domain = domain[:-len("_test_results")]
        args.domain = domain.replace("_", " ").title()
    
    # 从路径推断模型名称（如果未提供）
    if args.model_name is None:
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
            args.model_name = "Mistral-7B"  # 默认值
    
    print(f"模型名称: {args.model_name}")
    print(f"测试领域: {args.domain}")
    
    # 加载数据
    print("Loading JSON files...")
    baseline_data = load_json(baseline_file)
    dpo_data = load_json(dpo_file)
    
    # 优先使用category_counts，如果不存在则从results解析
    print("Parsing results...")
    if "category_counts" in baseline_data:
        baseline_counts = baseline_data["category_counts"]
        print("Using category_counts from baseline data")
    else:
        baseline_counts = parse_results(baseline_data["results"])
        print("Parsing baseline results...")
    
    if "category_counts" in dpo_data:
        dpo_counts = dpo_data["category_counts"]
        print("Using category_counts from DPO data")
    else:
        dpo_counts = parse_results(dpo_data["results"])
        print("Parsing DPO results...")
    
    print("\nBaseline counts:", baseline_counts)
    print("DPO counts:", dpo_counts)
    
    # 定义要比较的五种类型
    error_categories = [
        "plan_format_error",
        "precondition_violation",
        "safety_constraints_violation",
        "goal_not_satisfied",
        "success_plans"
    ]
    
    # 准备数据
    models = [args.baseline_label, args.dpo_label]
    model_labels = [args.baseline_label, args.dpo_label]
    total_tests = baseline_data.get("total_tests", 50)
    
    # 计算百分比数据（用于Y轴显示）
    percentages = {
        args.baseline_label: [baseline_counts.get(cat, 0) / total_tests * 100 for cat in error_categories],
        args.dpo_label: [dpo_counts.get(cat, 0) / total_tests * 100 for cat in error_categories]
    }
    
    # 使用百分比作为数据（Y轴显示百分比）
    data = percentages.copy()
    
    # 保留原始计数用于标签显示
    counts = {
        args.baseline_label: [baseline_counts.get(cat, 0) for cat in error_categories],
        args.dpo_label: [dpo_counts.get(cat, 0) for cat in error_categories]
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
    
    # 创建图表
    fig, ax = plt.subplots(figsize=(16, 9))
    
    # 设置柱状图的位置
    x = np.arange(len(error_categories))
    width = 0.35  # 两个模型，稍微宽一点
    
    # 使用不同颜色的亮色方案
    colors = {
        args.baseline_label: "#5dade2",  # 亮蓝色
        args.dpo_label: "#f39c12"         # 亮橙色
    }
    
    # 绘制柱状图
    bars1 = ax.bar(x - width/2, data[args.baseline_label], width, label=args.baseline_label, 
                   color=colors[args.baseline_label], edgecolor='black', linewidth=1.2)
    bars2 = ax.bar(x + width/2, data[args.dpo_label], width, label=args.dpo_label, 
                   color=colors[args.dpo_label], edgecolor='black', linewidth=1.2)
    
    # 设置标签和标题
    ax.set_xlabel("Categories", fontsize=18, fontweight='bold')
    ax.set_ylabel("Percentage (%)", fontsize=20, fontweight='bold')
    title = "Mistral-7B and Blocksworld DPO model Cross-domain generalization comparison"
    ax.set_title(title, fontsize=22, fontweight='bold', pad=15)
    ax.set_xticks(x)
    
    # 错误类型标签加粗并增大字号
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
    
    # 设置 x 轴标签颜色为渐变色（从红色到绿色）
    xtick_labels = ax.set_xticklabels(wrapped_labels, rotation=0, ha='center', fontsize=16, fontweight='bold')
    for label, cat in zip(xtick_labels, error_categories):
        label.set_color(CATEGORY_COLORS[cat])
    
    # 增加底部边距给标签更多空间
    plt.subplots_adjust(bottom=0.25)
    # 图例横排放
    ax.legend(fontsize=18, frameon=True, fancybox=True, shadow=True, ncol=2, loc='upper right')
    ax.grid(axis='y', alpha=0.3, linestyle='--')
    
    # 设置Y轴上限为100，并稍微增加一点空间给标签
    ax.set_ylim(0, 105)
    
    # 设置Y轴刻度为百分比格式
    ax.yaxis.set_major_formatter(plt.FuncFormatter(lambda y, _: f'{y:.0f}%'))
    
    def add_value_labels(bars, percents, model_counts):
        for bar, pct, count in zip(bars, percents, model_counts):
            height = bar.get_height()
            label_text = f"{int(round(pct))}%"
            if height > 0:
                label_y = min(height + 3, 100)
            else:
                label_y = 3
            ax.text(bar.get_x() + bar.get_width()/2., label_y,
                   label_text,
                   ha='center', va='bottom', fontsize=18, fontweight='bold')
    
    add_value_labels(bars1, percentages[args.baseline_label], counts[args.baseline_label])
    add_value_labels(bars2, percentages[args.dpo_label], counts[args.dpo_label])
    
    # 调整y轴刻度字体大小
    ax.tick_params(axis='y', labelsize=17)
    
    plt.tight_layout()
    
    # 保存图片
    output_file = output_dir / "model_comparison.png"
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    print(f"\nChart saved to: {output_file}")
    plt.close()
    
    # 创建第二个图表：使用seaborn绘制（如果未禁用）
    if not args.no_seaborn:
        print("\nCreating seaborn-style chart...")
        fig2, ax2 = plt.subplots(figsize=(13, 7.5))
        
        # 准备seaborn格式的数据（使用百分比）
        seaborn_data = []
        for model in models:
            for i, cat in enumerate(error_categories):
                pct = percentages[model][i]
                count = counts[model][i]
                seaborn_data.append({
                    "Model": model,
                    "Category": cat.replace("_", " ").title(),
                    "Percentage": pct,
                    "Count": count
                })
        
        df = pd.DataFrame(seaborn_data)
        
        # 使用不同颜色的亮色方案
        high_contrast_palette = ["#5dade2", "#f39c12"]
        
        # 使用seaborn绘制
        bars = sns.barplot(data=df, x="Category", y="Percentage", hue="Model", ax=ax2, 
                          palette=high_contrast_palette)
        
        # 加上边框
        for patch in ax2.patches:
            patch.set_edgecolor('black')
            patch.set_linewidth(1.2)
        
        ax2.set_xlabel("Categories", fontsize=18, fontweight='bold')
        ax2.set_ylabel("Percentage (%)", fontsize=20, fontweight='bold')
        
        # 设置Y轴刻度为百分比格式
        ax2.yaxis.set_major_formatter(plt.FuncFormatter(lambda y, _: f'{y:.0f}%'))
        title2 = "Mistral-7B and Blocksworld DPO model Cross-domain generalization comparison"
        ax2.set_title(title2, fontsize=22, fontweight='bold', pad=15)
        ax2.tick_params(axis='y', labelsize=18)
        
        # 错误类型标签加粗并换行
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
        
        # 先设置ticks，再设置labels
        ax2.set_xticks(range(len(error_categories)))
        # 设置 x 轴标签颜色为渐变色（从红色到绿色）
        xtick_labels = ax2.set_xticklabels(wrapped_labels, rotation=0, ha='center', fontsize=16, fontweight='bold')
        for label, cat in zip(xtick_labels, error_categories):
            label.set_color(CATEGORY_COLORS[cat])
        
        # 增加底部边距
        plt.subplots_adjust(bottom=0.25)
        
        # 图例横排放
        ax2.legend(fontsize=18, frameon=True, fancybox=True, shadow=True, 
                  ncol=2, loc='upper right')
        ax2.grid(axis='y', alpha=0.3, linestyle='--')
        
        # 添加数值和百分比标签
        ax2.set_ylim(0, 105)
        label_offset = 5
        
        for idx, container in enumerate(ax2.containers):
            labels = []
            model_name = models[idx]
            for i, val in enumerate(container.datavalues):
                cat_idx = i
                pct = percentages[model_name][cat_idx]
                labels.append(f"{int(round(pct))}%")
            ax2.bar_label(container, labels=labels, fmt='', fontsize=18, fontweight='bold', 
                         padding=label_offset)
        
        plt.tight_layout()
        
        # 保存seaborn风格的图片
        output_file2 = output_dir / "model_comparison_seaborn.png"
        plt.savefig(output_file2, dpi=300, bbox_inches='tight')
        print(f"Seaborn chart saved to: {output_file2}")
        plt.close()
    
    # 打印统计摘要
    print("\n" + "="*60)
    print("STATISTICAL SUMMARY")
    print("="*60)
    print(f"{'Category':<30} {args.baseline_label:<20} {args.dpo_label:<20}")
    print("-"*60)
    for cat in error_categories:
        print(f"{cat.replace('_', ' ').title():<30} "
              f"{baseline_counts.get(cat, 0):<20} "
              f"{dpo_counts.get(cat, 0):<20}")
    print("="*60)

if __name__ == "__main__":
    main()

