#!/usr/bin/env python3
"""
分析 all_problems3 目录中的问题难度和数量分布
"""
import os
import re
from collections import defaultdict
from pathlib import Path

def parse_problem_filename(filename):
    """从文件名中提取参数"""
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

def analyze_problems(problems_dir):
    """分析问题目录"""
    problems_path = Path(problems_dir)
    
    # 统计信息
    total_problems = 0
    by_x = defaultdict(int)
    by_y = defaultdict(int)
    by_sh = defaultdict(int)
    by_k = defaultdict(int)
    by_l = defaultdict(int)
    by_grid_size = defaultdict(int)
    by_config = defaultdict(int)  # (x, y, sh, k, l) -> count
    
    # 解析所有问题文件
    for pddl_file in problems_path.glob('*.pddl'):
        total_problems += 1
        params = parse_problem_filename(pddl_file.name)
        if params:
            by_x[params['x']] += 1
            by_y[params['y']] += 1
            by_sh[params['sh']] += 1
            by_k[params['k']] += 1
            by_l[params['l']] += 1
            by_grid_size[params['grid_size']] += 1
            config = (params['x'], params['y'], params['sh'], params['k'], params['l'])
            by_config[config] += 1
    
    return {
        'total': total_problems,
        'by_x': dict(sorted(by_x.items())),
        'by_y': dict(sorted(by_y.items())),
        'by_sh': dict(sorted(by_sh.items())),
        'by_k': dict(sorted(by_k.items())),
        'by_l': dict(sorted(by_l.items())),
        'by_grid_size': dict(sorted(by_grid_size.items())),
        'by_config': dict(sorted(by_config.items()))
    }

def generate_readme(stats, output_file):
    """生成README文件"""
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("# all_problems3 问题统计\n\n")
        f.write("本目录包含 PDDL3 grid 问题的集合。\n\n")
        
        f.write("## 总体统计\n\n")
        f.write(f"- **总问题数**: {stats['total']}\n\n")
        
        f.write("## 按网格大小分布\n\n")
        f.write("### 按 X 维度 (宽度)\n\n")
        f.write("| X | 问题数 | 占比 |\n")
        f.write("|---|--------|------|\n")
        for x, count in stats['by_x'].items():
            percentage = count / stats['total'] * 100
            f.write(f"| {x} | {count} | {percentage:.1f}% |\n")
        
        f.write("\n### 按 Y 维度 (高度)\n\n")
        f.write("| Y | 问题数 | 占比 |\n")
        f.write("|---|--------|------|\n")
        for y, count in stats['by_y'].items():
            percentage = count / stats['total'] * 100
            f.write(f"| {y} | {count} | {percentage:.1f}% |\n")
        
        f.write("\n### 按网格总面积\n\n")
        f.write("| 网格大小 (X×Y) | 总面积 | 问题数 | 占比 |\n")
        f.write("|----------------|--------|--------|------|\n")
        # 按配置统计，避免重复
        grid_size_configs = {}
        for (x, y, sh, k, l), count in stats['by_config'].items():
            size = x * y
            key = (x, y)
            if key not in grid_size_configs:
                grid_size_configs[key] = 0
            grid_size_configs[key] += count
        
        for (x, y), count in sorted(grid_size_configs.items(), key=lambda item: item[0][0] * item[0][1]):
            size = x * y
            percentage = count / stats['total'] * 100
            f.write(f"| {x}×{y} | {size} | {count} | {percentage:.1f}% |\n")
        
        f.write("\n## 按难度参数分布\n\n")
        f.write("### 按形状数量 (shapes)\n\n")
        f.write("| 形状数 | 问题数 | 占比 |\n")
        f.write("|--------|--------|------|\n")
        for sh, count in stats['by_sh'].items():
            percentage = count / stats['total'] * 100
            f.write(f"| {sh} | {count} | {percentage:.1f}% |\n")
        
        f.write("\n### 按钥匙数量 (keys)\n\n")
        f.write("| 钥匙数 | 问题数 | 占比 |\n")
        f.write("|--------|--------|------|\n")
        for k, count in stats['by_k'].items():
            percentage = count / stats['total'] * 100
            f.write(f"| {k} | {count} | {percentage:.1f}% |\n")
        
        f.write("\n### 按锁数量 (locks)\n\n")
        f.write("| 锁数 | 问题数 | 占比 |\n")
        f.write("|------|--------|------|\n")
        for l, count in stats['by_l'].items():
            percentage = count / stats['total'] * 100
            f.write(f"| {l} | {count} | {percentage:.1f}% |\n")
        
        f.write("\n## 按完整配置分布\n\n")
        f.write("| X | Y | Shapes | Keys | Locks | 问题数 | 占比 |\n")
        f.write("|---||---|--------|------|-------|--------|------|\n")
        for (x, y, sh, k, l), count in sorted(stats['by_config'].items(), key=lambda x: (-x[1], x[0])):
            percentage = count / stats['total'] * 100
            f.write(f"| {x} | {y} | {sh} | {k} | {l} | {count} | {percentage:.1f}% |\n")
        
        f.write("\n## 难度分析\n\n")
        f.write("问题的难度主要由以下因素决定：\n\n")
        f.write("1. **网格大小 (X × Y)**: 网格越大，搜索空间越大，问题越难\n")
        f.write("2. **形状数量 (shapes)**: 形状越多，需要匹配的锁-钥匙对越多\n")
        f.write("3. **钥匙数量 (keys)**: 钥匙越多，需要管理的对象越多\n")
        f.write("4. **锁数量 (locks)**: 锁越多，需要解锁的位置越多\n\n")
        f.write("通常，网格大小是影响难度的主要因素，其次是形状、钥匙和锁的数量。\n\n")

if __name__ == "__main__":
    problems_dir = "/home/jfan5/Safety-gen/pddl3/grid/all_problems3"
    output_file = "/home/jfan5/Safety-gen/pddl3/grid/README.md"
    
    print(f"正在分析 {problems_dir}...")
    stats = analyze_problems(problems_dir)
    
    print(f"找到 {stats['total']} 个问题")
    print(f"生成 README 到 {output_file}...")
    generate_readme(stats, output_file)
    print("完成！")

