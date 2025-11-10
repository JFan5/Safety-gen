#!/usr/bin/env python3
"""
比较三类模型（baseline, dpo, sft）的五种错误类型分布情况
使用matplotlib和seaborn绘制柱状图

用法:
    python compare_models.py --baseline baseline.json --dpo dpo.json --sft sft.json --output paper_plots
    python compare_models.py --baseline baseline.json --dpo dpo.json --sft sft.json
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
        "others": 0,
        "generation_error": 0
    }
    
    for result in results:
        category = result.get("category", "others")
        if category in category_counts:
            category_counts[category] += 1
        else:
            category_counts["others"] += 1
    
    return category_counts

def parse_args():
    """解析命令行参数"""
    parser = argparse.ArgumentParser(
        description="比较三类模型的错误类型分布情况",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例:
  python compare_models.py --baseline baseline.json --dpo dpo.json --sft sft.json
  python compare_models.py --baseline baseline.json --dpo dpo.json --sft sft.json --output paper_plots
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
        "--sft",
        type=str,
        required=True,
        help="SFT模型的JSON结果文件路径"
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
    return parser.parse_args()

def main():
    # 解析命令行参数
    args = parse_args()
    
    # 文件路径
    baseline_file = Path(args.baseline)
    dpo_file = Path(args.dpo)
    sft_file = Path(args.sft)
    
    # 验证文件是否存在
    for name, file_path in [("Baseline", baseline_file), ("DPO", dpo_file), ("SFT", sft_file)]:
        if not file_path.exists():
            raise FileNotFoundError(f"{name}文件不存在: {file_path}")
    
    # 创建输出目录
    output_dir = Path(args.output)
    output_dir.mkdir(parents=True, exist_ok=True)
    print(f"输出目录: {output_dir.absolute()}")
    
    # 加载数据
    print("Loading JSON files...")
    baseline_data = load_json(baseline_file)
    dpo_data = load_json(dpo_file)
    sft_data = load_json(sft_file)
    
    # 解析results数组
    print("Parsing results...")
    baseline_counts = parse_results(baseline_data["results"])
    dpo_counts = parse_results(dpo_data["results"])
    sft_counts = parse_results(sft_data["results"])
    
    # 也可以直接使用category_counts（如果存在且准确）
    if "category_counts" in baseline_data:
        baseline_counts = baseline_data["category_counts"]
    if "category_counts" in dpo_data:
        dpo_counts = dpo_data["category_counts"]
    if "category_counts" in sft_data:
        sft_counts = sft_data["category_counts"]
    
    print("\nBaseline counts:", baseline_counts)
    print("DPO counts:", dpo_counts)
    print("SFT counts:", sft_counts)
    
    # 定义要比较的五种类型，按指定顺序：plan_format_error -> precondition_violation -> safety_constraints_violation -> goal_not_satisfied -> success_plans
    error_categories = [
        "plan_format_error",           # 最左边 (sft.json 12-13)
        "precondition_violation",      # (sft.json 13-14)
        "safety_constraints_violation", # (sft.json 14-15)
        "goal_not_satisfied",          # (sft.json 15-16)
        "success_plans"                # 最后 (sft.json 11-12)
    ]
    
    # 准备数据 - 改为Pretrained, SFT, DPO的顺序
    models = ["Pretrained", "SFT", "DPO"]
    model_labels = ["Pretrained", "SFT", "DPO"]
    total_tests = baseline_data.get("total_tests", 50)
    
    # 计算百分比数据（用于Y轴显示）
    percentages = {
        "Pretrained": [baseline_counts.get(cat, 0) / total_tests * 100 for cat in error_categories],
        "SFT": [sft_counts.get(cat, 0) / total_tests * 100 for cat in error_categories],
        "DPO": [dpo_counts.get(cat, 0) / total_tests * 100 for cat in error_categories]
    }
    
    # 使用百分比作为数据（Y轴显示百分比）
    data = percentages.copy()
    
    # 保留原始计数用于标签显示
    counts = {
        "Pretrained": [baseline_counts.get(cat, 0) for cat in error_categories],
        "SFT": [sft_counts.get(cat, 0) for cat in error_categories],
        "DPO": [dpo_counts.get(cat, 0) for cat in error_categories]
    }
    
    # 创建图表 - 增加宽度和高度避免标签重叠
    fig, ax = plt.subplots(figsize=(13, 7.5))
    
    # 设置柱状图的位置
    x = np.arange(len(error_categories))
    width = 0.25  # 恢复合适的柱宽
    
    # 使用不同颜色的亮色方案：Pretrained(亮蓝) -> SFT(亮绿) -> DPO(亮橙/突出)
    colors = {
        "Pretrained": "#5dade2",  # 亮蓝色
        "SFT": "#58d68d",         # 亮绿色
        "DPO": "#f39c12"          # 亮橙色（最突出）
    }
    
    # 绘制柱状图 - 按顺序：Pretrained, SFT, DPO，加上边框
    bars1 = ax.bar(x - width, data["Pretrained"], width, label="Pretrained", 
                   color=colors["Pretrained"], edgecolor='black', linewidth=1.2)
    bars2 = ax.bar(x, data["SFT"], width, label="SFT", 
                   color=colors["SFT"], edgecolor='black', linewidth=1.2)
    bars3 = ax.bar(x + width, data["DPO"], width, label="DPO", 
                   color=colors["DPO"], edgecolor='black', linewidth=1.2)
    
    # 设置标签和标题 - 增大字号，Y轴改为百分比
    ax.set_xlabel("Categories", fontsize=14, fontweight='bold')
    ax.set_ylabel("Percentage (%)", fontsize=14, fontweight='bold')
    ax.set_title("Error Type Distribution Comparison: Mistral-7B on Blocksworld", 
                 fontsize=16, fontweight='bold', pad=15)
    ax.set_xticks(x)
    # 错误类型标签加粗并增大字号，横着放，放不下就换行
    category_labels = [cat.replace("_", " ").title() for cat in error_categories]
    # 将长标签换行（超过15个字符的标签在空格处换行）
    wrapped_labels = []
    for label in category_labels:
        if len(label) > 15:
            # 尝试在空格处分割
            words = label.split()
            if len(words) > 1:
                mid = len(words) // 2
                wrapped_labels.append('\n'.join([' '.join(words[:mid]), ' '.join(words[mid:])]))
            else:
                wrapped_labels.append(label)
        else:
            wrapped_labels.append(label)
    
    ax.set_xticklabels(wrapped_labels, rotation=0, ha='center', fontsize=12, fontweight='bold')
    
    # 设置标签颜色：从红色(Plan Format Error)逐渐过渡到绿色(Success Plans)
    n_categories = len(error_categories)
    colors_list = []
    for i in range(n_categories):
        # 从红色(1,0,0)到绿色(0,1,0)的渐变
        red = 1.0 - (i / (n_categories - 1)) if n_categories > 1 else 1.0
        green = i / (n_categories - 1) if n_categories > 1 else 0.0
        colors_list.append((red, green, 0.0))
    
    # 为每个标签设置颜色
    for label, color in zip(ax.get_xticklabels(), colors_list):
        label.set_color(color)
    
    # 增加底部边距给标签更多空间（如果换行需要更多空间）
    plt.subplots_adjust(bottom=0.25)
    # 图例横排放
    ax.legend(fontsize=12, frameon=True, fancybox=True, shadow=True, ncol=3, loc='upper right')
    ax.grid(axis='y', alpha=0.3, linestyle='--')
    
    # 在柱状图上添加数值和百分比标签
    # 计算最大高度用于标签偏移（现在是百分比）
    all_values = []
    for model in models:
        all_values.extend(data[model])
    max_height = max(all_values) if all_values else 100
    
    # 设置Y轴上限为100，并稍微增加一点空间给标签
    ax.set_ylim(0, 105)  # 增加到105给标签留出空间
    
    # 设置Y轴刻度为百分比格式
    ax.yaxis.set_major_formatter(plt.FuncFormatter(lambda y, _: f'{y:.0f}%'))
    
    def add_value_labels(bars, percents, model_counts):
        for bar, pct, count in zip(bars, percents, model_counts):
            height = bar.get_height()
            # 只显示百分比，不显示数字
            label_text = f'{pct:.1f}%'
            # 增加标签位置的高度，避免与柱顶重叠，但确保不超过100
            if height > 0:
                label_y = min(height + 3, 100)  # 固定偏移3%，但不超过100
            else:
                label_y = 3  # 如果值为0，标签放在稍微高一点的位置
            ax.text(bar.get_x() + bar.get_width()/2., label_y,
                   label_text,
                   ha='center', va='bottom', fontsize=9, fontweight='bold')
    
    add_value_labels(bars1, percentages["Pretrained"], counts["Pretrained"])
    add_value_labels(bars2, percentages["SFT"], counts["SFT"])
    add_value_labels(bars3, percentages["DPO"], counts["DPO"])
    
    # 调整y轴刻度字体大小
    ax.tick_params(axis='y', labelsize=11)
    
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
        
        # 使用不同颜色的亮色方案：Pretrained(亮蓝) -> SFT(亮绿) -> DPO(亮橙/突出)
        high_contrast_palette = ["#5dade2", "#58d68d", "#f39c12"]
        
        # 使用seaborn绘制 - 使用百分比数据
        bars = sns.barplot(data=df, x="Category", y="Percentage", hue="Model", ax=ax2, 
                          palette=high_contrast_palette)
        
        # 加上边框
        for patch in ax2.patches:
            patch.set_edgecolor('black')
            patch.set_linewidth(1.2)
        
        ax2.set_xlabel("Categories", fontsize=14, fontweight='bold')
        ax2.set_ylabel("Percentage (%)", fontsize=14, fontweight='bold')
        
        # 设置Y轴刻度为百分比格式
        ax2.yaxis.set_major_formatter(plt.FuncFormatter(lambda y, _: f'{y:.0f}%'))
        ax2.set_title("Error Types Distribution Comparison for Mistral-7B on Blocksworld", 
                     fontsize=16, fontweight='bold', pad=15)
        ax2.tick_params(axis='y', labelsize=11)
        
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
        ax2.set_xticklabels(wrapped_labels, rotation=0, ha='center', fontsize=12)
        
        # 设置标签颜色：从红色(Plan Format Error)逐渐过渡到绿色(Success Plans)
        n_categories = len(error_categories)
        colors_list = []
        for i in range(n_categories):
            # 从红色(1,0,0)到绿色(0,1,0)的渐变
            red = 1.0 - (i / (n_categories - 1)) if n_categories > 1 else 1.0
            green = i / (n_categories - 1) if n_categories > 1 else 0.0
            colors_list.append((red, green, 0.0))
        
        for label, color in zip(ax2.get_xticklabels(), colors_list):
            label.set_fontweight('bold')
            label.set_color(color)
        
        # 增加底部边距给标签更多空间（如果换行需要更多空间）
        plt.subplots_adjust(bottom=0.25)
        
        # 图例横排放
        ax2.legend(fontsize=12, frameon=True, fancybox=True, shadow=True, 
                  ncol=3, loc='upper right')
        ax2.grid(axis='y', alpha=0.3, linestyle='--')
        
        # 添加数值和百分比标签
        max_height = max([max(data[m]) for m in models])
        # 设置Y轴上限为100，并稍微增加一点空间给标签
        ax2.set_ylim(0, 105)  # 增加到105给标签留出空间
        label_offset = 3  # 固定偏移3%
        
        for idx, container in enumerate(ax2.containers):
            labels = []
            model_name = models[idx]
            for i, val in enumerate(container.datavalues):
                # 只显示百分比，不显示数字
                # 每个container对应一个模型，每个值对应一个类别
                cat_idx = i
                pct = percentages[model_name][cat_idx]
                labels.append(f'{pct:.1f}%')
            # 使用固定padding，值为0的标签会自动显示在柱顶上方
            ax2.bar_label(container, labels=labels, fmt='', fontsize=9, fontweight='bold', 
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
    print(f"{'Category':<30} {'Pretrained':<12} {'SFT':<12} {'DPO':<12}")
    print("-"*60)
    for cat in error_categories:
        print(f"{cat.replace('_', ' ').title():<30} "
              f"{baseline_counts.get(cat, 0):<12} "
              f"{sft_counts.get(cat, 0):<12} "
              f"{dpo_counts.get(cat, 0):<12}")
    print("-"*60)
    print(f"{'Success Plans':<30} "
          f"{baseline_counts.get('success_plans', 0):<12} "
          f"{sft_counts.get('success_plans', 0):<12} "
          f"{dpo_counts.get('success_plans', 0):<12}")
    print("="*60)

if __name__ == "__main__":
    main()

