#!/usr/bin/env python3
"""可视化由 parse_planning_results.py 生成的聚合 JSON。"""

import argparse
import json
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Tuple

import matplotlib.pyplot as plt
import numpy as np

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

RUN_ORDER = ['baseline', 'pddl2', 'pddl3']
RUN_LABELS = {
    'baseline': 'Baseline',
    'pddl2': 'PDDL2',
    'pddl3': 'PDDL3',
}
RUN_COLORS = {
    'baseline': '#4E79A7',
    'pddl2': '#F28E2B',
    'pddl3': '#59A14F',
}


def load_data(json_file: str) -> Dict:
    """加载JSON数据"""
    with open(json_file, 'r', encoding='utf-8') as f:
        return json.load(f)

def extract_scenario_data(data: Dict) -> Dict[str, Dict[str, Optional[Dict[str, int]]]]:
    """提取场景 -> 运行类型 -> summary 数据。"""
    scenarios: Dict[str, Dict[str, Optional[Dict[str, int]]]] = {}
    for scenario_name, runs in data.items():
        scenario_entry: Dict[str, Optional[Dict[str, int]]] = {}
        if not isinstance(runs, dict):
            continue
        for run_name, payload in runs.items():
            if not isinstance(payload, dict):
                scenario_entry[run_name] = None
                continue
            summary = payload.get('summary')
            if isinstance(summary, dict):
                scenario_entry[run_name] = summary
            else:
                scenario_entry[run_name] = None
        if scenario_entry:
            scenarios[scenario_name] = scenario_entry
    return scenarios


def _ensure_keys(summary: Optional[Dict[str, int]]) -> Dict[str, int]:
    """补全 summary 中的分类键，缺失时返回 0。"""
    default = {k: 0 for k in CATEGORY_LABELS}
    if not summary:
        default['total'] = 0
        return default
    filled = default.copy()
    filled.update({k: int(v) for k, v in summary.items() if k in filled})
    filled['total'] = int(summary.get('total', sum(filled.values())))
    return filled


def _available_runs(scenario_data: Dict[str, Optional[Dict[str, int]]]) -> List[str]:
    """返回该场景可用的运行类型顺序。"""
    present = [run for run in RUN_ORDER if run in scenario_data and scenario_data[run] is not None]
    return present


def plot_scenario_comparison(
    scenarios: Dict[str, Dict[str, Optional[Dict[str, int]]]],
    output_dir: str = "plots",
) -> None:
    """生成每个场景的运行类型对比图。"""
    # 创建输出目录
    Path(output_dir).mkdir(exist_ok=True)
    
    categories = list(CATEGORY_LABELS.keys())
    
    for scenario_name, scenario_data in scenarios.items():
        run_list = _available_runs(scenario_data)
        if not run_list:
            continue

        fig, ax = plt.subplots(figsize=(14, 6))

        x_pos = np.arange(len(categories))
        width = 0.2 if len(run_list) >= 3 else 0.25

        for idx, run_name in enumerate(run_list):
            summary = _ensure_keys(scenario_data.get(run_name))
            total = max(summary.get('total', 0), 1)  # 防止除零
            percents = [summary.get(cat, 0) / total * 100 for cat in categories]
            counts = [summary.get(cat, 0) for cat in categories]

            offset = (idx - (len(run_list) - 1) / 2) * width
            bars = ax.bar(
                x_pos + offset,
                percents,
                width=width,
                label=f"{RUN_LABELS.get(run_name, run_name)} (n={summary.get('total', 0)})",
                color=RUN_COLORS.get(run_name, '#808080'),
                alpha=0.85,
            )

            for bar, percent, count in zip(bars, percents, counts):
                if count > 0:
                    ax.text(
                        bar.get_x() + bar.get_width() / 2,
                        bar.get_height() + 1,
                        f'{count}\n({percent:.1f}%)',
                        ha='center',
                        va='bottom',
                        fontsize=8,
                        rotation=0,
                    )

        ax.set_title(f'{scenario_name.title()} - Result Distribution', fontsize=14, fontweight='bold')
        ax.set_ylabel('Percentage (%)', fontsize=12)
        ax.set_xticks(x_pos)
        ax.set_xticklabels([CATEGORY_LABELS[cat] for cat in categories], rotation=45, ha='right')
        ax.set_ylim(0, 100)
        ax.legend()
        ax.grid(axis='y', alpha=0.3)

        plt.tight_layout()
        plt.savefig(f'{output_dir}/{scenario_name}_comparison.png', dpi=300, bbox_inches='tight')
        plt.close()


def plot_overall_comparison(
    scenarios: Dict[str, Dict[str, Optional[Dict[str, int]]]],
    output_dir: str = "plots",
) -> None:
    """生成总体成功率对比图。"""
    Path(output_dir).mkdir(exist_ok=True)
    
    scenario_names: List[str] = []
    success_rates: Dict[str, List[float]] = {run: [] for run in RUN_ORDER}

    for scenario_name, scenario_data in scenarios.items():
        run_list = _available_runs(scenario_data)
        if not run_list:
            continue

        scenario_names.append(scenario_name.title())
        for run_name in RUN_ORDER:
            if run_name in scenario_data and scenario_data[run_name] is not None:
                summary = _ensure_keys(scenario_data[run_name])
                total = max(summary.get('total', 0), 1)
                rate = summary.get('success_plans', 0) / total * 100
            else:
                rate = 0.0
            success_rates[run_name].append(rate)

    if not scenario_names:
        return

    x_pos = np.arange(len(scenario_names))
    width = 0.2 if len(RUN_ORDER) >= 3 else 0.3

    fig, ax = plt.subplots(figsize=(16, 7))
    for idx, run_name in enumerate(RUN_ORDER):
        if len(success_rates[run_name]) != len(scenario_names):
            continue
        offset = (idx - (len(RUN_ORDER) - 1) / 2) * width
        rates = success_rates[run_name]
        bars = ax.bar(
            x_pos + offset,
            rates,
            width=width,
            label=RUN_LABELS.get(run_name, run_name),
            color=RUN_COLORS.get(run_name, '#808080'),
            alpha=0.85,
        )
        for bar in bars:
            height = bar.get_height()
            if height > 0:
                ax.text(
                    bar.get_x() + bar.get_width() / 2,
                    height + 0.5,
                    f'{height:.1f}%',
                    ha='center',
                    va='bottom',
                    fontsize=9,
                )

    ax.set_title('Success Rate Comparison Across Scenarios', fontsize=16, fontweight='bold')
    ax.set_ylabel('Success Rate (%)', fontsize=12)
    ax.set_xlabel('Scenarios', fontsize=12)
    ax.set_xticks(x_pos)
    ax.set_xticklabels(scenario_names, rotation=45, ha='right')
    ax.set_ylim(0, 100)
    ax.grid(axis='y', alpha=0.3)
    ax.legend()

    plt.tight_layout()
    plt.savefig(f'{output_dir}/overall_success_rates.png', dpi=300, bbox_inches='tight')
    plt.close()


def plot_category_distribution(
    scenarios: Dict[str, Dict[str, Optional[Dict[str, int]]]],
    output_dir: str = "plots",
) -> None:
    """生成各运行类型整体分类分布堆叠图。"""
    Path(output_dir).mkdir(exist_ok=True)
    
    categories = list(CATEGORY_LABELS.keys())
    
    aggregated: Dict[str, List[int]] = {run: [0] * len(categories) for run in RUN_ORDER}
    totals: Dict[str, int] = {run: 0 for run in RUN_ORDER}

    for scenario_data in scenarios.values():
        for run_name in RUN_ORDER:
            summary = scenario_data.get(run_name)
            if summary is None:
                continue
            filled = _ensure_keys(summary)
            totals[run_name] += filled.get('total', 0)
            for idx, cat in enumerate(categories):
                aggregated[run_name][idx] += filled.get(cat, 0)

    run_list = [run for run in RUN_ORDER if totals[run] > 0]
    if not run_list:
        return

    x_pos = np.arange(len(run_list))
    width = 0.6

    fig, ax = plt.subplots(figsize=(12, 8))
    bottom = np.zeros(len(run_list))

    for idx, category in enumerate(categories):
        values = [aggregated[run][idx] for run in run_list]
        percentages = [
            v / totals[run] * 100 if totals[run] > 0 else 0 for v, run in zip(values, run_list)
        ]
        bars = ax.bar(
            x_pos,
            percentages,
            width,
            bottom=bottom,
            label=CATEGORY_LABELS[category],
            color=CATEGORY_COLORS.get(category, '#808080'),
            alpha=0.85,
        )
        bottom += percentages

        for bar, value, run in zip(bars, values, run_list):
            if value > 0:
                ax.text(
                    bar.get_x() + bar.get_width() / 2,
                    bar.get_y() + bar.get_height() / 2,
                    f'{value}\n({value / totals[run] * 100:.1f}%)',
                    ha='center',
                    va='center',
                    fontsize=8,
                )

    ax.set_title('Category Distribution by Run Type (Aggregated)', fontsize=14, fontweight='bold')
    ax.set_ylabel('Percentage (%)', fontsize=12)
    ax.set_xticks(x_pos)
    ax.set_xticklabels([RUN_LABELS.get(run, run) for run in run_list])
    ax.set_ylim(0, 100)
    ax.legend(bbox_to_anchor=(1.02, 1), loc='upper left')
    ax.grid(axis='y', alpha=0.3)

    plt.tight_layout()
    plt.savefig(f'{output_dir}/category_distribution.png', dpi=300, bbox_inches='tight')
    plt.close()


def filter_scenarios(
    scenarios: Dict[str, Dict[str, Optional[Dict[str, int]]]],
    selected: Optional[Iterable[str]],
) -> Dict[str, Dict[str, Optional[Dict[str, int]]]]:
    """按用户指定的场景过滤数据。"""
    if not selected:
        return scenarios
    selected_set = {s.lower() for s in selected}
    return {
        name: data
        for name, data in scenarios.items()
        if name.lower() in selected_set
    }


def main() -> None:
    parser = argparse.ArgumentParser(description='Visualize aggregated planning results')
    parser.add_argument('--input', '-i', default='planning_results_aggregated.json',
                        help='Input aggregated JSON file (default: planning_results_aggregated.json)')
    parser.add_argument('--output-dir', '-o', default='plots',
                        help='Output directory for generated plots')
    parser.add_argument('--scenarios', nargs='+', default=None,
                        help='Specific scenarios to plot (default: all available)')
    
    args = parser.parse_args()
    
    # 加载数据
    print(f"Loading data from {args.input}...")
    data = load_data(args.input)
    
    # 提取并过滤场景
    scenarios = extract_scenario_data(data)
    scenarios = filter_scenarios(scenarios, args.scenarios)
    
    if not scenarios:
        print("No scenarios available for plotting. Please check the input file or scenario filters.")
        return
    
    print(f"Found scenarios: {list(scenarios.keys())}")
    
    print("Generating per-scenario comparison plots...")
    plot_scenario_comparison(scenarios, args.output_dir)
    
    print("Generating overall success-rate comparison...")
    plot_overall_comparison(scenarios, args.output_dir)
    
    print("Generating aggregated category distribution plot...")
    plot_category_distribution(scenarios, args.output_dir)
    
    print(f"All plots saved to {Path(args.output_dir).resolve()}")
    print("Generated files:")
    print("- {scenario}_comparison.png (per available scenario)")
    print("- overall_success_rates.png")
    print("- category_distribution.png")

if __name__ == "__main__":
    main()
