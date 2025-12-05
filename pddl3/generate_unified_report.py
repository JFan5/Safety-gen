#!/usr/bin/env python3
"""
生成所有Scenario的统一问题难度分布报告
输出到 docs/scenario_difficulty_distribution.md
"""
import os
import re
from collections import defaultdict
from pathlib import Path
from datetime import datetime

def parse_grid_filename(filename):
    """解析 grid 文件名"""
    pattern = r'grid_x(\d+)_y(\d+)_sh(\d+)_k(\d+)_l(\d+)_seed\d+_strips_\d+\.pddl'
    match = re.match(pattern, filename)
    if match:
        return {
            'x': int(match.group(1)),
            'y': int(match.group(2)),
            'sh': int(match.group(3)),
            'k': int(match.group(4)),
            'l': int(match.group(5)),
            'grid_size': int(match.group(1)) * int(match.group(2))
        }
    return None

def parse_blocksworld_filename(filename):
    """解析 blocksworld 文件名"""
    pattern = r'bw_ops(\d+)_n(\d+)_seed\d+\.pddl'
    match = re.match(pattern, filename)
    if match:
        return {
            'ops': int(match.group(1)),
            'n': int(match.group(2)),
        }
    return None

def parse_ferry_filename(filename):
    """解析 ferry 文件名"""
    pattern = r'ferry-l(\d+)-c(\d+)-s\d+\.pddl'
    match = re.match(pattern, filename)
    if match:
        return {
            'l': int(match.group(1)),
            'c': int(match.group(2)),
        }
    return None

def parse_spanner_filename(filename):
    """解析 spanner 文件名"""
    pattern = r'spanner-s(\d+)-n(\d+)-l(\d+)-s\d+\.pddl'
    match = re.match(pattern, filename)
    if match:
        return {
            's': int(match.group(1)),
            'n': int(match.group(2)),
            'l': int(match.group(3)),
        }
    return None

def parse_grippers_filename(filename):
    """解析 grippers 文件名"""
    pattern = r'grippers-n(\d+)-r(\d+)-o(\d+)-s\d+\.pddl'
    match = re.match(pattern, filename)
    if match:
        return {
            'n': int(match.group(1)),
            'r': int(match.group(2)),
            'o': int(match.group(3)),
        }
    return None

def parse_delivery_filename(filename):
    """解析 delivery 文件名"""
    pattern = r'delivery-s(\d+)-p(\d+)-seed\d+\.pddl'
    match = re.match(pattern, filename)
    if match:
        return {
            'size': int(match.group(1)),
            'packages': int(match.group(2)),
        }
    return None

def analyze_directory(problems_dir, parser_func):
    """分析问题目录"""
    problems_path = Path(problems_dir)
    if not problems_path.exists():
        return None
    
    stats = {
        'total': 0,
        'by_params': defaultdict(int),
        'files': []
    }
    
    for pddl_file in problems_path.glob('*.pddl'):
        stats['total'] += 1
        params = parser_func(pddl_file.name)
        if params:
            param_key = tuple(sorted(params.items()))
            stats['by_params'][param_key] += 1
            params['filename'] = pddl_file.name
            stats['files'].append(params)
    
    return stats

def generate_grid_report(stats):
    """生成 grid 报告"""
    if not stats:
        return "无数据\n"
    
    lines = []
    lines.append(f"- **总问题数**: {stats['total']}\n")
    
    # 按网格大小
    by_grid_size = defaultdict(int)
    by_x = defaultdict(int)
    by_y = defaultdict(int)
    by_sh = defaultdict(int)
    by_k = defaultdict(int)
    by_l = defaultdict(int)
    by_config = defaultdict(int)
    
    for file_info in stats['files']:
        x = file_info['x']
        y = file_info['y']
        sh = file_info['sh']
        k = file_info['k']
        l = file_info['l']
        grid_size = file_info['grid_size']
        
        by_grid_size[grid_size] += 1
        by_x[x] += 1
        by_y[y] += 1
        by_sh[sh] += 1
        by_k[k] += 1
        by_l[l] += 1
        by_config[(x, y, sh, k, l)] += 1
    
    lines.append("\n#### 按网格大小分布\n")
    lines.append("| 网格大小 (X×Y) | 问题数 | 占比 |\n")
    lines.append("|----------------|--------|------|\n")
    # 按配置统计，避免重复
    grid_size_configs = {}
    for (x, y, sh, k, l), count in by_config.items():
        size = x * y
        key = (x, y)
        if key not in grid_size_configs:
            grid_size_configs[key] = 0
        grid_size_configs[key] += count
    
    for (x, y), count in sorted(grid_size_configs.items(), key=lambda item: item[0][0] * item[0][1]):
        size = x * y
        pct = count / stats['total'] * 100
        lines.append(f"| {x}×{y} ({size}) | {count} | {pct:.1f}% |\n")
    
    lines.append("\n#### 按难度参数分布\n")
    lines.append("| 参数 | 值 | 问题数 | 占比 |\n")
    lines.append("|------|-----|--------|------|\n")
    
    for sh, count in sorted(by_sh.items()):
        pct = count / stats['total'] * 100
        lines.append(f"| Shapes | {sh} | {count} | {pct:.1f}% |\n")
    for k, count in sorted(by_k.items()):
        pct = count / stats['total'] * 100
        lines.append(f"| Keys | {k} | {count} | {pct:.1f}% |\n")
    for l, count in sorted(by_l.items()):
        pct = count / stats['total'] * 100
        lines.append(f"| Locks | {l} | {count} | {pct:.1f}% |\n")
    
    lines.append("\n#### 主要配置（Top 5）\n")
    lines.append("| X | Y | Shapes | Keys | Locks | 问题数 | 占比 |\n")
    lines.append("|---||---|--------|------|-------|--------|------|\n")
    for (x, y, sh, k, l), count in sorted(by_config.items(), key=lambda x: -x[1])[:5]:
        pct = count / stats['total'] * 100
        lines.append(f"| {x} | {y} | {sh} | {k} | {l} | {count} | {pct:.1f}% |\n")
    
    return ''.join(lines)

def generate_blocksworld_report(stats):
    """生成 blocksworld 报告"""
    if not stats:
        return "无数据\n"
    
    lines = []
    lines.append(f"- **总问题数**: {stats['total']}\n")
    
    by_ops = defaultdict(int)
    by_n = defaultdict(int)
    by_config = defaultdict(int)
    
    for file_info in stats['files']:
        ops = file_info['ops']
        n = file_info['n']
        by_ops[ops] += 1
        by_n[n] += 1
        by_config[(ops, n)] += 1
    
    lines.append("\n#### 按操作符数量分布\n")
    lines.append("| Ops | 问题数 | 占比 |\n")
    lines.append("|-----|--------|------|\n")
    for ops in sorted(by_ops.keys()):
        count = by_ops[ops]
        pct = count / stats['total'] * 100
        lines.append(f"| {ops} | {count} | {pct:.1f}% |\n")
    
    lines.append("\n#### 按块数量分布\n")
    lines.append("| 块数 (n) | 问题数 | 占比 |\n")
    lines.append("|----------|--------|------|\n")
    for n in sorted(by_n.keys()):
        count = by_n[n]
        pct = count / stats['total'] * 100
        lines.append(f"| {n} | {count} | {pct:.1f}% |\n")
    
    lines.append("\n#### 主要配置（Top 5）\n")
    lines.append("| Ops | 块数 (n) | 问题数 | 占比 |\n")
    lines.append("|-----|-----------|--------|------|\n")
    for (ops, n), count in sorted(by_config.items(), key=lambda x: -x[1])[:5]:
        pct = count / stats['total'] * 100
        lines.append(f"| {ops} | {n} | {count} | {pct:.1f}% |\n")
    
    return ''.join(lines)

def generate_ferry_report(stats):
    """生成 ferry 报告"""
    if not stats:
        return "无数据\n"
    
    lines = []
    lines.append(f"- **总问题数**: {stats['total']}\n")
    
    by_l = defaultdict(int)
    by_c = defaultdict(int)
    by_config = defaultdict(int)
    
    for file_info in stats['files']:
        l = file_info['l']
        c = file_info['c']
        by_l[l] += 1
        by_c[c] += 1
        by_config[(l, c)] += 1
    
    lines.append("\n#### 按位置数量分布\n")
    lines.append("| 位置数 (l) | 问题数 | 占比 |\n")
    lines.append("|------------|--------|------|\n")
    for l in sorted(by_l.keys()):
        count = by_l[l]
        pct = count / stats['total'] * 100
        lines.append(f"| {l} | {count} | {pct:.1f}% |\n")
    
    lines.append("\n#### 按汽车数量分布\n")
    lines.append("| 汽车数 (c) | 问题数 | 占比 |\n")
    lines.append("|------------|--------|------|\n")
    for c in sorted(by_c.keys()):
        count = by_c[c]
        pct = count / stats['total'] * 100
        lines.append(f"| {c} | {count} | {pct:.1f}% |\n")
    
    lines.append("\n#### 主要配置（Top 5）\n")
    lines.append("| 位置数 (l) | 汽车数 (c) | 问题数 | 占比 |\n")
    lines.append("|------------|------------|--------|------|\n")
    for (l, c), count in sorted(by_config.items(), key=lambda x: -x[1])[:5]:
        pct = count / stats['total'] * 100
        lines.append(f"| {l} | {c} | {count} | {pct:.1f}% |\n")
    
    return ''.join(lines)

def generate_spanner_report(stats):
    """生成 spanner 报告"""
    if not stats:
        return "无数据\n"
    
    lines = []
    lines.append(f"- **总问题数**: {stats['total']}\n")
    
    by_s = defaultdict(int)
    by_n = defaultdict(int)
    by_l = defaultdict(int)
    by_config = defaultdict(int)
    
    for file_info in stats['files']:
        s = file_info['s']
        n = file_info['n']
        l = file_info['l']
        by_s[s] += 1
        by_n[n] += 1
        by_l[l] += 1
        by_config[(s, n, l)] += 1
    
    lines.append("\n#### 按扳手数量分布\n")
    lines.append("| 扳手数 (s) | 问题数 | 占比 |\n")
    lines.append("|------------|--------|------|\n")
    for s in sorted(by_s.keys()):
        count = by_s[s]
        pct = count / stats['total'] * 100
        lines.append(f"| {s} | {count} | {pct:.1f}% |\n")
    
    lines.append("\n#### 按螺母数量分布\n")
    lines.append("| 螺母数 (n) | 问题数 | 占比 |\n")
    lines.append("|------------|--------|------|\n")
    for n in sorted(by_n.keys()):
        count = by_n[n]
        pct = count / stats['total'] * 100
        lines.append(f"| {n} | {count} | {pct:.1f}% |\n")
    
    lines.append("\n#### 按位置数量分布\n")
    lines.append("| 位置数 (l) | 问题数 | 占比 |\n")
    lines.append("|------------|--------|------|\n")
    for l in sorted(by_l.keys()):
        count = by_l[l]
        pct = count / stats['total'] * 100
        lines.append(f"| {l} | {count} | {pct:.1f}% |\n")
    
    lines.append("\n#### 主要配置（Top 5）\n")
    lines.append("| 扳手数 (s) | 螺母数 (n) | 位置数 (l) | 问题数 | 占比 |\n")
    lines.append("|------------|------------|------------|--------|------|\n")
    for (s, n, l), count in sorted(by_config.items(), key=lambda x: -x[1])[:5]:
        pct = count / stats['total'] * 100
        lines.append(f"| {s} | {n} | {l} | {count} | {pct:.1f}% |\n")
    
    return ''.join(lines)

def generate_grippers_report(stats):
    """生成 grippers 报告"""
    if not stats:
        return "无数据\n"
    
    lines = []
    lines.append(f"- **总问题数**: {stats['total']}\n")
    
    by_n = defaultdict(int)
    by_r = defaultdict(int)
    by_o = defaultdict(int)
    by_config = defaultdict(int)
    
    for file_info in stats['files']:
        n = file_info['n']
        r = file_info['r']
        o = file_info['o']
        by_n[n] += 1
        by_r[r] += 1
        by_o[o] += 1
        by_config[(n, r, o)] += 1
    
    lines.append("\n#### 按机器人数量分布\n")
    lines.append("| 机器人数 (n) | 问题数 | 占比 |\n")
    lines.append("|--------------|--------|------|\n")
    for n in sorted(by_n.keys()):
        count = by_n[n]
        pct = count / stats['total'] * 100
        lines.append(f"| {n} | {count} | {pct:.1f}% |\n")
    
    lines.append("\n#### 按房间数量分布\n")
    lines.append("| 房间数 (r) | 问题数 | 占比 |\n")
    lines.append("|------------|--------|------|\n")
    for r in sorted(by_r.keys()):
        count = by_r[r]
        pct = count / stats['total'] * 100
        lines.append(f"| {r} | {count} | {pct:.1f}% |\n")
    
    lines.append("\n#### 按物体数量分布\n")
    lines.append("| 物体数 (o) | 问题数 | 占比 |\n")
    lines.append("|------------|--------|------|\n")
    for o in sorted(by_o.keys()):
        count = by_o[o]
        pct = count / stats['total'] * 100
        lines.append(f"| {o} | {count} | {pct:.1f}% |\n")
    
    lines.append("\n#### 主要配置（Top 5）\n")
    lines.append("| 机器人数 (n) | 房间数 (r) | 物体数 (o) | 问题数 | 占比 |\n")
    lines.append("|--------------|------------|------------|--------|------|\n")
    for (n, r, o), count in sorted(by_config.items(), key=lambda x: -x[1])[:5]:
        pct = count / stats['total'] * 100
        lines.append(f"| {n} | {r} | {o} | {count} | {pct:.1f}% |\n")
    
    return ''.join(lines)

def generate_delivery_report(stats):
    """生成 delivery 报告"""
    if not stats:
        return "无数据\n"
    
    lines = []
    lines.append(f"- **总问题数**: {stats['total']}\n")
    
    by_size = defaultdict(int)
    by_packages = defaultdict(int)
    by_config = defaultdict(int)
    
    for file_info in stats['files']:
        size = file_info['size']
        packages = file_info['packages']
        by_size[size] += 1
        by_packages[packages] += 1
        by_config[(size, packages)] += 1
    
    lines.append("\n#### 按网格大小分布\n")
    lines.append("| 网格大小 | 问题数 | 占比 |\n")
    lines.append("|----------|--------|------|\n")
    for size in sorted(by_size.keys()):
        count = by_size[size]
        pct = count / stats['total'] * 100
        lines.append(f"| {size}×{size} | {count} | {pct:.1f}% |\n")
    
    lines.append("\n#### 按包裹数量分布\n")
    lines.append("| 包裹数 | 问题数 | 占比 |\n")
    lines.append("|--------|--------|------|\n")
    for packages in sorted(by_packages.keys()):
        count = by_packages[packages]
        pct = count / stats['total'] * 100
        lines.append(f"| {packages} | {count} | {pct:.1f}% |\n")
    
    lines.append("\n#### 主要配置（Top 5）\n")
    lines.append("| 网格大小 | 包裹数 | 问题数 | 占比 |\n")
    lines.append("|----------|--------|--------|------|\n")
    for (size, packages), count in sorted(by_config.items(), key=lambda x: -x[1])[:5]:
        pct = count / stats['total'] * 100
        lines.append(f"| {size}×{size} | {packages} | {count} | {pct:.1f}% |\n")
    
    return ''.join(lines)

def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3")
    docs_dir = Path("/home/jfan5/Safety-gen/docs")
    output_file = docs_dir / "scenario_difficulty_distribution.md"
    
    scenarios = {
        'grid': {
            'parser': parse_grid_filename,
            'report_gen': generate_grid_report,
            'base_path': base_dir / 'grid'
        },
        'blocksworld': {
            'parser': parse_blocksworld_filename,
            'report_gen': generate_blocksworld_report,
            'base_path': base_dir / 'blocksworld'
        },
        'ferry': {
            'parser': parse_ferry_filename,
            'report_gen': generate_ferry_report,
            'base_path': base_dir / 'ferry'
        },
        'spanner': {
            'parser': parse_spanner_filename,
            'report_gen': generate_spanner_report,
            'base_path': base_dir / 'spanner'
        },
        'grippers': {
            'parser': parse_grippers_filename,
            'report_gen': generate_grippers_report,
            'base_path': base_dir / 'grippers'
        },
        'delivery': {
            'parser': parse_delivery_filename,
            'report_gen': generate_delivery_report,
            'base_path': base_dir / 'delivery'
        }
    }
    
    # 定义要分析的目录
    dirs_to_analyze = [
        ('all_problems3', 'all_problems3'),
        ('all_problems3/testing', 'all_problems3/testing'),
        ('sft_500', 'sft_500'),
        ('grpo_500', 'grpo_500')
    ]
    
    # 生成报告
    report_lines = []
    report_lines.append("# 所有Scenario问题难度分布统计\n\n")
    report_lines.append(f"生成时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
    report_lines.append("本文档汇总了所有PDDL3 Scenario的问题难度和数量分布统计。\n\n")
    report_lines.append("包含以下目录的统计：\n")
    report_lines.append("- `all_problems3`: 所有PDDL3问题\n")
    report_lines.append("- `all_problems3/testing`: 测试集问题\n")
    report_lines.append("- `sft_500`: SFT训练集（500个问题）\n")
    report_lines.append("- `grpo_500`: GRPO训练集（500个问题）\n\n")
    
    total_counts = {
        'all_problems3': 0,
        'all_problems3/testing': 0,
        'sft_500': 0,
        'grpo_500': 0
    }
    scenario_counts = {}
    
    for scenario_name, scenario_info in scenarios.items():
        print(f"分析 {scenario_name}...")
        report_lines.append(f"## {scenario_name.upper()}\n\n")
        
        scenario_counts[scenario_name] = {}
        
        # 分析各个目录
        for dir_name, dir_key in dirs_to_analyze:
            dir_path = scenario_info['base_path'] / dir_key
            print(f"  分析 {dir_name}...")
            
            stats = None
            if dir_path.exists():
                stats = analyze_directory(dir_path, scenario_info['parser'])
            
            if stats and stats['total'] > 0:
                total_counts[dir_key] += stats['total']
                scenario_counts[scenario_name][dir_key] = stats['total']
                report_lines.append(f"### {dir_name}\n\n")
                report_lines.append(scenario_info['report_gen'](stats))
            else:
                scenario_counts[scenario_name][dir_key] = 0
                report_lines.append(f"### {dir_name}\n\n无数据\n\n")
            
            report_lines.append("\n")
        
        report_lines.append("---\n\n")
    
    # 添加总结
    report_lines.append("## 总结\n\n")
    
    # 各目录总问题数
    report_lines.append("### 各目录总问题数\n\n")
    report_lines.append("| 目录 | 总问题数 |\n")
    report_lines.append("|------|----------|\n")
    for dir_key, total in total_counts.items():
        report_lines.append(f"| {dir_key} | {total} |\n")
    
    report_lines.append("\n### 各Scenario问题数量分布\n\n")
    report_lines.append("| Scenario | all_problems3 | all_problems3/testing | sft_500 | grpo_500 |\n")
    report_lines.append("|----------|---------------|----------------------|---------|----------|\n")
    
    for scenario_name in sorted(scenario_counts.keys()):
        counts = scenario_counts[scenario_name]
        all3 = counts.get('all_problems3', 0)
        testing = counts.get('all_problems3/testing', 0)
        sft = counts.get('sft_500', 0)
        grpo = counts.get('grpo_500', 0)
        report_lines.append(f"| {scenario_name} | {all3} | {testing} | {sft} | {grpo} |\n")
    
    # 写入文件
    docs_dir.mkdir(exist_ok=True)
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(''.join(report_lines))
    
    print(f"\n报告已生成: {output_file}")
    print(f"\n总问题数统计:")
    for dir_key, total in total_counts.items():
        print(f"  {dir_key}: {total}")

if __name__ == "__main__":
    main()

