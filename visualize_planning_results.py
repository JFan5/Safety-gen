#!/usr/bin/env python3
"""
Planning Results Visualization Script
生成柱状图可视化planning结果的分类统计
"""

import json
import matplotlib.pyplot as plt
import numpy as np
import argparse
from pathlib import Path
from typing import Dict, List, Tuple

# 设置字体支持（避免中文字体问题）
plt.rcParams['font.sans-serif'] = ['DejaVu Sans', 'Arial', 'Liberation Sans']
plt.rcParams['axes.unicode_minus'] = False

# 分类颜色配置
CATEGORY_COLORS = {
    'success_plans': '#2E8B57',           # Sea Green - Success
    'plan_format_error': '#DC143C',       # Crimson - Format Error
    'precondition_violation': '#FF8C00',  # Dark Orange - Precondition Violation
    'safety_constraints_violation': '#8B0000',  # Dark Red - Safety Constraints Violation
    'goal_not_satisfied': '#4169E1',      # Royal Blue - Goal Not Satisfied
    'others': '#808080'                   # Gray - Others
}

# 分类标签（英文，避免字体问题）
CATEGORY_LABELS = {
    'success_plans': 'Success Plans',
    'plan_format_error': 'Plan Format Error',
    'precondition_violation': 'Precondition Violation',
    'safety_constraints_violation': 'Safety Constraints Violation',
    'goal_not_satisfied': 'Goal Not Satisfied',
    'others': 'Others'
}

def load_data(json_file: str) -> Dict:
    """加载JSON数据"""
    with open(json_file, 'r', encoding='utf-8') as f:
        return json.load(f)

def extract_scenario_data(data: Dict) -> Dict[str, Dict[str, Dict[str, int]]]:
    """提取场景数据"""
    scenarios = {}
    model_data = data.get('mistral', {})
    
    for scenario_name, scenario_data in model_data.items():
        scenarios[scenario_name] = {}
        for model_type, model_results in scenario_data.items():
            if 'summary' in model_results:
                scenarios[scenario_name][model_type] = model_results['summary']
    
    return scenarios

def plot_scenario_comparison(scenarios: Dict[str, Dict[str, Dict[str, int]]], 
                           output_dir: str = "plots"):
    """生成场景对比图"""
    # 创建输出目录
    Path(output_dir).mkdir(exist_ok=True)
    
    categories = ['success_plans', 'plan_format_error', 'precondition_violation', 
                 'safety_constraints_violation', 'goal_not_satisfied', 'others']
    
    for scenario_name, scenario_data in scenarios.items():
        if 'finetuned' not in scenario_data or 'unfinetuned' not in scenario_data:
            continue
            
        fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(15, 6))
        
        # 准备数据
        finetuned_data = scenario_data['finetuned']
        unfinetuned_data = scenario_data['unfinetuned']
        
        # 计算百分比
        finetuned_total = finetuned_data.get('total', 1)
        unfinetuned_total = unfinetuned_data.get('total', 1)
        
        finetuned_percent = [finetuned_data.get(cat, 0) / finetuned_total * 100 for cat in categories]
        unfinetuned_percent = [unfinetuned_data.get(cat, 0) / unfinetuned_total * 100 for cat in categories]
        
        # 绘制unfinetuned结果（左边）
        x_pos = np.arange(len(categories))
        bars1 = ax1.bar(x_pos, unfinetuned_percent, 
                       color=[CATEGORY_COLORS[cat] for cat in categories],
                       alpha=0.8)
        
        ax1.set_title(f'{scenario_name.title()} - Unfine-tuned Model', fontsize=14, fontweight='bold')
        ax1.set_ylabel('Percentage (%)', fontsize=12)
        ax1.set_ylim(0, 100)
        ax1.set_xticks(x_pos)
        ax1.set_xticklabels([CATEGORY_LABELS[cat] for cat in categories], rotation=45, ha='right')
        
        # 添加数值标签
        for i, (bar, percent, count) in enumerate(zip(bars1, unfinetuned_percent, 
                                                     [unfinetuned_data.get(cat, 0) for cat in categories])):
            if count > 0:
                ax1.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 1,
                        f'{count}\n({percent:.1f}%)', ha='center', va='bottom', fontsize=9)
        
        # 绘制finetuned结果（右边）
        bars2 = ax2.bar(x_pos, finetuned_percent,
                       color=[CATEGORY_COLORS[cat] for cat in categories],
                       alpha=0.8)
        
        ax2.set_title(f'{scenario_name.title()} - Fine-tuned Model', fontsize=14, fontweight='bold')
        ax2.set_ylabel('Percentage (%)', fontsize=12)
        ax2.set_ylim(0, 100)
        ax2.set_xticks(x_pos)
        ax2.set_xticklabels([CATEGORY_LABELS[cat] for cat in categories], rotation=45, ha='right')
        
        # 添加数值标签
        for i, (bar, percent, count) in enumerate(zip(bars2, finetuned_percent,
                                                     [finetuned_data.get(cat, 0) for cat in categories])):
            if count > 0:
                ax2.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 1,
                        f'{count}\n({percent:.1f}%)', ha='center', va='bottom', fontsize=9)
        
        plt.tight_layout()
        plt.savefig(f'{output_dir}/{scenario_name}_comparison.png', dpi=300, bbox_inches='tight')
        plt.close()

def plot_overall_comparison(scenarios: Dict[str, Dict[str, Dict[str, int]]], 
                          output_dir: str = "plots"):
    """生成总体对比图"""
    Path(output_dir).mkdir(exist_ok=True)
    
    categories = ['success_plans', 'plan_format_error', 'precondition_violation', 
                 'safety_constraints_violation', 'goal_not_satisfied', 'others']
    
    scenario_names = []
    finetuned_success = []
    unfinetuned_success = []
    finetuned_format_error = []
    unfinetuned_format_error = []
    
    for scenario_name, scenario_data in scenarios.items():
        if 'finetuned' not in scenario_data or 'unfinetuned' not in scenario_data:
            continue
            
        scenario_names.append(scenario_name.title())
        finetuned_data = scenario_data['finetuned']
        unfinetuned_data = scenario_data['unfinetuned']
        
        finetuned_total = finetuned_data.get('total', 1)
        unfinetuned_total = unfinetuned_data.get('total', 1)
        
        finetuned_success.append(finetuned_data.get('success_plans', 0) / finetuned_total * 100)
        unfinetuned_success.append(unfinetuned_data.get('success_plans', 0) / unfinetuned_total * 100)
        
        finetuned_format_error.append(finetuned_data.get('plan_format_error', 0) / finetuned_total * 100)
        unfinetuned_format_error.append(unfinetuned_data.get('plan_format_error', 0) / unfinetuned_total * 100)
    
    # 创建对比图
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(16, 8))
    
    x_pos = np.arange(len(scenario_names))
    width = 0.35
    
    # 成功率对比
    bars1 = ax1.bar(x_pos - width/2, unfinetuned_success, width, 
                   label='Unfine-tuned', color='#FF6B6B', alpha=0.8)
    bars2 = ax1.bar(x_pos + width/2, finetuned_success, width,
                   label='Fine-tuned', color='#4ECDC4', alpha=0.8)
    
    ax1.set_title('Success Rate Comparison Across Scenarios', fontsize=16, fontweight='bold')
    ax1.set_ylabel('Success Rate (%)', fontsize=12)
    ax1.set_xlabel('Scenarios', fontsize=12)
    ax1.set_xticks(x_pos)
    ax1.set_xticklabels(scenario_names, rotation=45, ha='right')
    ax1.legend()
    ax1.grid(axis='y', alpha=0.3)
    
    # 添加数值标签
    for bar in bars1:
        height = bar.get_height()
        if height > 0:
            ax1.text(bar.get_x() + bar.get_width()/2, height + 0.5,
                    f'{height:.1f}%', ha='center', va='bottom', fontsize=9)
    
    for bar in bars2:
        height = bar.get_height()
        if height > 0:
            ax1.text(bar.get_x() + bar.get_width()/2, height + 0.5,
                    f'{height:.1f}%', ha='center', va='bottom', fontsize=9)
    
    # 格式错误对比
    bars3 = ax2.bar(x_pos - width/2, unfinetuned_format_error, width,
                   label='Unfine-tuned', color='#FF6B6B', alpha=0.8)
    bars4 = ax2.bar(x_pos + width/2, finetuned_format_error, width,
                   label='Fine-tuned', color='#4ECDC4', alpha=0.8)
    
    ax2.set_title('Plan Format Error Rate Comparison', fontsize=16, fontweight='bold')
    ax2.set_ylabel('Format Error Rate (%)', fontsize=12)
    ax2.set_xlabel('Scenarios', fontsize=12)
    ax2.set_xticks(x_pos)
    ax2.set_xticklabels(scenario_names, rotation=45, ha='right')
    ax2.legend()
    ax2.grid(axis='y', alpha=0.3)
    
    # 添加数值标签
    for bar in bars3:
        height = bar.get_height()
        if height > 0:
            ax2.text(bar.get_x() + bar.get_width()/2, height + 0.5,
                    f'{height:.1f}%', ha='center', va='bottom', fontsize=9)
    
    for bar in bars4:
        height = bar.get_height()
        if height > 0:
            ax2.text(bar.get_x() + bar.get_width()/2, height + 0.5,
                    f'{height:.1f}%', ha='center', va='bottom', fontsize=9)
    
    plt.tight_layout()
    plt.savefig(f'{output_dir}/overall_comparison.png', dpi=300, bbox_inches='tight')
    plt.close()

def plot_category_distribution(scenarios: Dict[str, Dict[str, Dict[str, int]]], 
                             output_dir: str = "plots"):
    """生成分类分布图"""
    Path(output_dir).mkdir(exist_ok=True)
    
    categories = ['success_plans', 'plan_format_error', 'precondition_violation', 
                 'safety_constraints_violation', 'goal_not_satisfied', 'others']
    
    # 收集所有场景的数据
    all_scenarios = []
    finetuned_data_matrix = []
    unfinetuned_data_matrix = []
    
    for scenario_name, scenario_data in scenarios.items():
        if 'finetuned' not in scenario_data or 'unfinetuned' not in scenario_data:
            continue
            
        all_scenarios.append(scenario_name.title())
        finetuned_data = scenario_data['finetuned']
        unfinetuned_data = scenario_data['unfinetuned']
        
        finetuned_total = finetuned_data.get('total', 1)
        unfinetuned_total = unfinetuned_data.get('total', 1)
        
        finetuned_row = [finetuned_data.get(cat, 0) / finetuned_total * 100 for cat in categories]
        unfinetuned_row = [unfinetuned_data.get(cat, 0) / unfinetuned_total * 100 for cat in categories]
        
        finetuned_data_matrix.append(finetuned_row)
        unfinetuned_data_matrix.append(unfinetuned_row)
    
    # 创建堆叠柱状图
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(14, 12))
    
    x_pos = np.arange(len(all_scenarios))
    width = 0.8
    
    # Fine-tuned模型堆叠图
    bottom = np.zeros(len(all_scenarios))
    for i, category in enumerate(categories):
        values = [row[i] for row in finetuned_data_matrix]
        ax1.bar(x_pos, values, width, bottom=bottom, 
               label=CATEGORY_LABELS[category], 
               color=CATEGORY_COLORS[category], alpha=0.8)
        bottom += values
    
    ax1.set_title('Fine-tuned Model: Category Distribution', fontsize=14, fontweight='bold')
    ax1.set_ylabel('Percentage (%)', fontsize=12)
    ax1.set_xticks(x_pos)
    ax1.set_xticklabels(all_scenarios, rotation=45, ha='right')
    ax1.legend(bbox_to_anchor=(1.05, 1), loc='upper left')
    ax1.set_ylim(0, 100)
    
    # Unfine-tuned模型堆叠图
    bottom = np.zeros(len(all_scenarios))
    for i, category in enumerate(categories):
        values = [row[i] for row in unfinetuned_data_matrix]
        ax2.bar(x_pos, values, width, bottom=bottom,
               label=CATEGORY_LABELS[category],
               color=CATEGORY_COLORS[category], alpha=0.8)
        bottom += values
    
    ax2.set_title('Unfine-tuned Model: Category Distribution', fontsize=14, fontweight='bold')
    ax2.set_ylabel('Percentage (%)', fontsize=12)
    ax2.set_xlabel('Scenarios', fontsize=12)
    ax2.set_xticks(x_pos)
    ax2.set_xticklabels(all_scenarios, rotation=45, ha='right')
    ax2.legend(bbox_to_anchor=(1.05, 1), loc='upper left')
    ax2.set_ylim(0, 100)
    
    plt.tight_layout()
    plt.savefig(f'{output_dir}/category_distribution.png', dpi=300, bbox_inches='tight')
    plt.close()

def main():
    parser = argparse.ArgumentParser(description='Visualize planning results')
    parser.add_argument('--input', '-i', default='planning_results_aggregated_mistral_final_complete.json',
                       help='Input JSON file path')
    parser.add_argument('--output-dir', '-o', default='plots',
                       help='Output directory for plots')
    parser.add_argument('--scenarios', nargs='+', default=None,
                       help='Specific scenarios to plot (default: all)')
    
    args = parser.parse_args()
    
    # 加载数据
    print(f"Loading data from {args.input}...")
    data = load_data(args.input)
    
    # 提取场景数据
    scenarios = extract_scenario_data(data)
    
    # 过滤特定场景
    if args.scenarios:
        scenarios = {k: v for k, v in scenarios.items() if k in args.scenarios}
    
    print(f"Found scenarios: {list(scenarios.keys())}")
    
    # 生成图表
    print("Generating scenario comparison plots...")
    plot_scenario_comparison(scenarios, args.output_dir)
    
    print("Generating overall comparison plot...")
    plot_overall_comparison(scenarios, args.output_dir)
    
    print("Generating category distribution plot...")
    plot_category_distribution(scenarios, args.output_dir)
    
    print(f"All plots saved to {args.output_dir}/")
    print("Generated files:")
    print("- {scenario}_comparison.png (for each scenario)")
    print("- overall_comparison.png")
    print("- category_distribution.png")

if __name__ == "__main__":
    main()
