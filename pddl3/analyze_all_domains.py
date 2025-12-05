#!/usr/bin/env python3
"""
分析四个场景（blocksworld, ferry, spanner, grippers）的问题难度和数量分布
统计 all_problems3/testing 和 sft_500 目录
"""
import os
import re
from collections import defaultdict
from pathlib import Path

def parse_blocksworld_filename(filename):
    """解析 blocksworld 文件名: bw_ops{3|4}_n{number}_seed{number}.pddl"""
    pattern = r'bw_ops(\d+)_n(\d+)_seed\d+\.pddl'
    match = re.match(pattern, filename)
    if match:
        return {
            'ops': int(match.group(1)),
            'n': int(match.group(2)),
        }
    return None

def parse_ferry_filename(filename):
    """解析 ferry 文件名: ferry-l{number}-c{number}-s{number}.pddl"""
    pattern = r'ferry-l(\d+)-c(\d+)-s\d+\.pddl'
    match = re.match(pattern, filename)
    if match:
        return {
            'l': int(match.group(1)),
            'c': int(match.group(2)),
        }
    return None

def parse_spanner_filename(filename):
    """解析 spanner 文件名: spanner-s{number}-n{number}-l{number}-s{number}.pddl"""
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
    """解析 grippers 文件名: grippers-n{number}-r{number}-o{number}-s{number}.pddl"""
    pattern = r'grippers-n(\d+)-r(\d+)-o(\d+)-s\d+\.pddl'
    match = re.match(pattern, filename)
    if match:
        return {
            'n': int(match.group(1)),
            'r': int(match.group(2)),
            'o': int(match.group(3)),
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
            # 创建参数键用于统计
            if isinstance(params, dict):
                param_key = tuple(sorted(params.items()))
                stats['by_params'][param_key] += 1
                params['filename'] = pddl_file.name
                stats['files'].append(params)
    
    return stats

def generate_blocksworld_stats(testing_stats, sft_stats):
    """生成 blocksworld 统计报告"""
    lines = []
    lines.append("## 问题统计\n")
    
    # 总体统计
    lines.append("### all_problems3/testing\n")
    if testing_stats:
        lines.append(f"- **总问题数**: {testing_stats['total']}\n")
        
        # 按 ops 统计
        by_ops = defaultdict(int)
        by_n = defaultdict(int)
        by_config = defaultdict(int)
        
        for file_info in testing_stats['files']:
            ops = file_info['ops']
            n = file_info['n']
            by_ops[ops] += 1
            by_n[n] += 1
            by_config[(ops, n)] += 1
        
        if by_ops:
            lines.append("\n#### 按操作符数量分布\n")
            lines.append("| Ops | 问题数 | 占比 |\n")
            lines.append("|-----|--------|------|\n")
            for ops in sorted(by_ops.keys()):
                count = by_ops[ops]
                pct = count / testing_stats['total'] * 100
                lines.append(f"| {ops} | {count} | {pct:.1f}% |\n")
        
        if by_n:
            lines.append("\n#### 按块数量分布\n")
            lines.append("| 块数 (n) | 问题数 | 占比 |\n")
            lines.append("|----------|--------|------|\n")
            for n in sorted(by_n.keys()):
                count = by_n[n]
                pct = count / testing_stats['total'] * 100
                lines.append(f"| {n} | {count} | {pct:.1f}% |\n")
        
        if by_config:
            lines.append("\n#### 按完整配置分布\n")
            lines.append("| Ops | 块数 (n) | 问题数 | 占比 |\n")
            lines.append("|-----|-----------|--------|------|\n")
            for (ops, n), count in sorted(by_config.items(), key=lambda x: (-x[1], x[0])):
                pct = count / testing_stats['total'] * 100
                lines.append(f"| {ops} | {n} | {count} | {pct:.1f}% |\n")
    else:
        lines.append("- **总问题数**: 0\n")
    
    lines.append("\n### sft_500\n")
    if sft_stats:
        lines.append(f"- **总问题数**: {sft_stats['total']}\n")
        
        # 按 ops 统计
        by_ops = defaultdict(int)
        by_n = defaultdict(int)
        by_config = defaultdict(int)
        
        for file_info in sft_stats['files']:
            ops = file_info['ops']
            n = file_info['n']
            by_ops[ops] += 1
            by_n[n] += 1
            by_config[(ops, n)] += 1
        
        if by_ops:
            lines.append("\n#### 按操作符数量分布\n")
            lines.append("| Ops | 问题数 | 占比 |\n")
            lines.append("|-----|--------|------|\n")
            for ops in sorted(by_ops.keys()):
                count = by_ops[ops]
                pct = count / sft_stats['total'] * 100
                lines.append(f"| {ops} | {count} | {pct:.1f}% |\n")
        
        if by_n:
            lines.append("\n#### 按块数量分布\n")
            lines.append("| 块数 (n) | 问题数 | 占比 |\n")
            lines.append("|----------|--------|------|\n")
            for n in sorted(by_n.keys()):
                count = by_n[n]
                pct = count / sft_stats['total'] * 100
                lines.append(f"| {n} | {count} | {pct:.1f}% |\n")
        
        if by_config:
            lines.append("\n#### 按完整配置分布\n")
            lines.append("| Ops | 块数 (n) | 问题数 | 占比 |\n")
            lines.append("|-----|-----------|--------|------|\n")
            for (ops, n), count in sorted(by_config.items(), key=lambda x: (-x[1], x[0])):
                pct = count / sft_stats['total'] * 100
                lines.append(f"| {ops} | {n} | {count} | {pct:.1f}% |\n")
    else:
        lines.append("- **总问题数**: 0\n")
    
    lines.append("\n### 难度分析\n")
    lines.append("问题的难度主要由以下因素决定：\n")
    lines.append("1. **操作符数量 (ops)**: 3ops 或 4ops 表示不同的操作符表示方式\n")
    lines.append("2. **块数量 (n)**: 块越多，搜索空间越大，问题越难\n")
    
    return ''.join(lines)

def generate_ferry_stats(testing_stats, sft_stats):
    """生成 ferry 统计报告"""
    lines = []
    lines.append("## 问题统计\n")
    
    # 总体统计
    lines.append("### all_problems3/testing\n")
    if testing_stats:
        lines.append(f"- **总问题数**: {testing_stats['total']}\n")
        
        by_l = defaultdict(int)
        by_c = defaultdict(int)
        by_config = defaultdict(int)
        
        for file_info in testing_stats['files']:
            l = file_info['l']
            c = file_info['c']
            by_l[l] += 1
            by_c[c] += 1
            by_config[(l, c)] += 1
        
        if by_l:
            lines.append("\n#### 按位置数量分布\n")
            lines.append("| 位置数 (l) | 问题数 | 占比 |\n")
            lines.append("|------------|--------|------|\n")
            for l in sorted(by_l.keys()):
                count = by_l[l]
                pct = count / testing_stats['total'] * 100
                lines.append(f"| {l} | {count} | {pct:.1f}% |\n")
        
        if by_c:
            lines.append("\n#### 按汽车数量分布\n")
            lines.append("| 汽车数 (c) | 问题数 | 占比 |\n")
            lines.append("|------------|--------|------|\n")
            for c in sorted(by_c.keys()):
                count = by_c[c]
                pct = count / testing_stats['total'] * 100
                lines.append(f"| {c} | {count} | {pct:.1f}% |\n")
        
        if by_config:
            lines.append("\n#### 按完整配置分布\n")
            lines.append("| 位置数 (l) | 汽车数 (c) | 问题数 | 占比 |\n")
            lines.append("|------------|------------|--------|------|\n")
            for (l, c), count in sorted(by_config.items(), key=lambda x: (-x[1], x[0])):
                pct = count / testing_stats['total'] * 100
                lines.append(f"| {l} | {c} | {count} | {pct:.1f}% |\n")
    else:
        lines.append("- **总问题数**: 0\n")
    
    lines.append("\n### sft_500\n")
    if sft_stats:
        lines.append(f"- **总问题数**: {sft_stats['total']}\n")
        
        by_l = defaultdict(int)
        by_c = defaultdict(int)
        by_config = defaultdict(int)
        
        for file_info in sft_stats['files']:
            l = file_info['l']
            c = file_info['c']
            by_l[l] += 1
            by_c[c] += 1
            by_config[(l, c)] += 1
        
        if by_l:
            lines.append("\n#### 按位置数量分布\n")
            lines.append("| 位置数 (l) | 问题数 | 占比 |\n")
            lines.append("|------------|--------|------|\n")
            for l in sorted(by_l.keys()):
                count = by_l[l]
                pct = count / sft_stats['total'] * 100
                lines.append(f"| {l} | {count} | {pct:.1f}% |\n")
        
        if by_c:
            lines.append("\n#### 按汽车数量分布\n")
            lines.append("| 汽车数 (c) | 问题数 | 占比 |\n")
            lines.append("|------------|--------|------|\n")
            for c in sorted(by_c.keys()):
                count = by_c[c]
                pct = count / sft_stats['total'] * 100
                lines.append(f"| {c} | {count} | {pct:.1f}% |\n")
        
        if by_config:
            lines.append("\n#### 按完整配置分布\n")
            lines.append("| 位置数 (l) | 汽车数 (c) | 问题数 | 占比 |\n")
            lines.append("|------------|------------|--------|------|\n")
            for (l, c), count in sorted(by_config.items(), key=lambda x: (-x[1], x[0])):
                pct = count / sft_stats['total'] * 100
                lines.append(f"| {l} | {c} | {count} | {pct:.1f}% |\n")
    else:
        lines.append("- **总问题数**: 0\n")
    
    lines.append("\n### 难度分析\n")
    lines.append("问题的难度主要由以下因素决定：\n")
    lines.append("1. **位置数量 (l)**: 位置越多，搜索空间越大\n")
    lines.append("2. **汽车数量 (c)**: 汽车越多，需要运输的任务越多\n")
    
    return ''.join(lines)

def generate_spanner_stats(testing_stats, sft_stats):
    """生成 spanner 统计报告"""
    lines = []
    lines.append("## 问题统计\n")
    
    # 总体统计
    lines.append("### all_problems3/testing\n")
    if testing_stats:
        lines.append(f"- **总问题数**: {testing_stats['total']}\n")
        
        by_s = defaultdict(int)
        by_n = defaultdict(int)
        by_l = defaultdict(int)
        by_config = defaultdict(int)
        
        for file_info in testing_stats['files']:
            s = file_info['s']
            n = file_info['n']
            l = file_info['l']
            by_s[s] += 1
            by_n[n] += 1
            by_l[l] += 1
            by_config[(s, n, l)] += 1
        
        if by_s:
            lines.append("\n#### 按扳手数量分布\n")
            lines.append("| 扳手数 (s) | 问题数 | 占比 |\n")
            lines.append("|------------|--------|------|\n")
            for s in sorted(by_s.keys()):
                count = by_s[s]
                pct = count / testing_stats['total'] * 100
                lines.append(f"| {s} | {count} | {pct:.1f}% |\n")
        
        if by_n:
            lines.append("\n#### 按螺母数量分布\n")
            lines.append("| 螺母数 (n) | 问题数 | 占比 |\n")
            lines.append("|------------|--------|------|\n")
            for n in sorted(by_n.keys()):
                count = by_n[n]
                pct = count / testing_stats['total'] * 100
                lines.append(f"| {n} | {count} | {pct:.1f}% |\n")
        
        if by_l:
            lines.append("\n#### 按位置数量分布\n")
            lines.append("| 位置数 (l) | 问题数 | 占比 |\n")
            lines.append("|------------|--------|------|\n")
            for l in sorted(by_l.keys()):
                count = by_l[l]
                pct = count / testing_stats['total'] * 100
                lines.append(f"| {l} | {count} | {pct:.1f}% |\n")
        
        if by_config:
            lines.append("\n#### 按完整配置分布\n")
            lines.append("| 扳手数 (s) | 螺母数 (n) | 位置数 (l) | 问题数 | 占比 |\n")
            lines.append("|------------|------------|------------|--------|------|\n")
            for (s, n, l), count in sorted(by_config.items(), key=lambda x: (-x[1], x[0])):
                pct = count / testing_stats['total'] * 100
                lines.append(f"| {s} | {n} | {l} | {count} | {pct:.1f}% |\n")
    else:
        lines.append("- **总问题数**: 0\n")
    
    lines.append("\n### sft_500\n")
    if sft_stats:
        lines.append(f"- **总问题数**: {sft_stats['total']}\n")
        
        by_s = defaultdict(int)
        by_n = defaultdict(int)
        by_l = defaultdict(int)
        by_config = defaultdict(int)
        
        for file_info in sft_stats['files']:
            s = file_info['s']
            n = file_info['n']
            l = file_info['l']
            by_s[s] += 1
            by_n[n] += 1
            by_l[l] += 1
            by_config[(s, n, l)] += 1
        
        if by_s:
            lines.append("\n#### 按扳手数量分布\n")
            lines.append("| 扳手数 (s) | 问题数 | 占比 |\n")
            lines.append("|------------|--------|------|\n")
            for s in sorted(by_s.keys()):
                count = by_s[s]
                pct = count / sft_stats['total'] * 100
                lines.append(f"| {s} | {count} | {pct:.1f}% |\n")
        
        if by_n:
            lines.append("\n#### 按螺母数量分布\n")
            lines.append("| 螺母数 (n) | 问题数 | 占比 |\n")
            lines.append("|------------|--------|------|\n")
            for n in sorted(by_n.keys()):
                count = by_n[n]
                pct = count / sft_stats['total'] * 100
                lines.append(f"| {n} | {count} | {pct:.1f}% |\n")
        
        if by_l:
            lines.append("\n#### 按位置数量分布\n")
            lines.append("| 位置数 (l) | 问题数 | 占比 |\n")
            lines.append("|------------|--------|------|\n")
            for l in sorted(by_l.keys()):
                count = by_l[l]
                pct = count / sft_stats['total'] * 100
                lines.append(f"| {l} | {count} | {pct:.1f}% |\n")
        
        if by_config:
            lines.append("\n#### 按完整配置分布\n")
            lines.append("| 扳手数 (s) | 螺母数 (n) | 位置数 (l) | 问题数 | 占比 |\n")
            lines.append("|------------|------------|------------|--------|------|\n")
            for (s, n, l), count in sorted(by_config.items(), key=lambda x: (-x[1], x[0])):
                pct = count / sft_stats['total'] * 100
                lines.append(f"| {s} | {n} | {l} | {count} | {pct:.1f}% |\n")
    else:
        lines.append("- **总问题数**: 0\n")
    
    lines.append("\n### 难度分析\n")
    lines.append("问题的难度主要由以下因素决定：\n")
    lines.append("1. **扳手数量 (s)**: 扳手越多，需要管理的资源越多\n")
    lines.append("2. **螺母数量 (n)**: 螺母越多，需要完成的任务越多\n")
    lines.append("3. **位置数量 (l)**: 位置越多，搜索空间越大\n")
    
    return ''.join(lines)

def generate_grippers_stats(testing_stats, sft_stats):
    """生成 grippers 统计报告"""
    lines = []
    lines.append("## 问题统计\n")
    
    # 总体统计
    lines.append("### all_problems3/testing\n")
    if testing_stats:
        lines.append(f"- **总问题数**: {testing_stats['total']}\n")
        
        by_n = defaultdict(int)
        by_r = defaultdict(int)
        by_o = defaultdict(int)
        by_config = defaultdict(int)
        
        for file_info in testing_stats['files']:
            n = file_info['n']
            r = file_info['r']
            o = file_info['o']
            by_n[n] += 1
            by_r[r] += 1
            by_o[o] += 1
            by_config[(n, r, o)] += 1
        
        if by_n:
            lines.append("\n#### 按机器人数量分布\n")
            lines.append("| 机器人数 (n) | 问题数 | 占比 |\n")
            lines.append("|--------------|--------|------|\n")
            for n in sorted(by_n.keys()):
                count = by_n[n]
                pct = count / testing_stats['total'] * 100
                lines.append(f"| {n} | {count} | {pct:.1f}% |\n")
        
        if by_r:
            lines.append("\n#### 按房间数量分布\n")
            lines.append("| 房间数 (r) | 问题数 | 占比 |\n")
            lines.append("|------------|--------|------|\n")
            for r in sorted(by_r.keys()):
                count = by_r[r]
                pct = count / testing_stats['total'] * 100
                lines.append(f"| {r} | {count} | {pct:.1f}% |\n")
        
        if by_o:
            lines.append("\n#### 按物体数量分布\n")
            lines.append("| 物体数 (o) | 问题数 | 占比 |\n")
            lines.append("|------------|--------|------|\n")
            for o in sorted(by_o.keys()):
                count = by_o[o]
                pct = count / testing_stats['total'] * 100
                lines.append(f"| {o} | {count} | {pct:.1f}% |\n")
        
        if by_config:
            lines.append("\n#### 按完整配置分布\n")
            lines.append("| 机器人数 (n) | 房间数 (r) | 物体数 (o) | 问题数 | 占比 |\n")
            lines.append("|--------------|------------|------------|--------|------|\n")
            for (n, r, o), count in sorted(by_config.items(), key=lambda x: (-x[1], x[0])):
                pct = count / testing_stats['total'] * 100
                lines.append(f"| {n} | {r} | {o} | {count} | {pct:.1f}% |\n")
    else:
        lines.append("- **总问题数**: 0\n")
    
    lines.append("\n### sft_500\n")
    if sft_stats:
        lines.append(f"- **总问题数**: {sft_stats['total']}\n")
        
        by_n = defaultdict(int)
        by_r = defaultdict(int)
        by_o = defaultdict(int)
        by_config = defaultdict(int)
        
        for file_info in sft_stats['files']:
            n = file_info['n']
            r = file_info['r']
            o = file_info['o']
            by_n[n] += 1
            by_r[r] += 1
            by_o[o] += 1
            by_config[(n, r, o)] += 1
        
        if by_n:
            lines.append("\n#### 按机器人数量分布\n")
            lines.append("| 机器人数 (n) | 问题数 | 占比 |\n")
            lines.append("|--------------|--------|------|\n")
            for n in sorted(by_n.keys()):
                count = by_n[n]
                pct = count / sft_stats['total'] * 100
                lines.append(f"| {n} | {count} | {pct:.1f}% |\n")
        
        if by_r:
            lines.append("\n#### 按房间数量分布\n")
            lines.append("| 房间数 (r) | 问题数 | 占比 |\n")
            lines.append("|------------|--------|------|\n")
            for r in sorted(by_r.keys()):
                count = by_r[r]
                pct = count / sft_stats['total'] * 100
                lines.append(f"| {r} | {count} | {pct:.1f}% |\n")
        
        if by_o:
            lines.append("\n#### 按物体数量分布\n")
            lines.append("| 物体数 (o) | 问题数 | 占比 |\n")
            lines.append("|------------|--------|------|\n")
            for o in sorted(by_o.keys()):
                count = by_o[o]
                pct = count / sft_stats['total'] * 100
                lines.append(f"| {o} | {count} | {pct:.1f}% |\n")
        
        if by_config:
            lines.append("\n#### 按完整配置分布\n")
            lines.append("| 机器人数 (n) | 房间数 (r) | 物体数 (o) | 问题数 | 占比 |\n")
            lines.append("|--------------|------------|------------|--------|------|\n")
            for (n, r, o), count in sorted(by_config.items(), key=lambda x: (-x[1], x[0])):
                pct = count / sft_stats['total'] * 100
                lines.append(f"| {n} | {r} | {o} | {count} | {pct:.1f}% |\n")
    else:
        lines.append("- **总问题数**: 0\n")
    
    lines.append("\n### 难度分析\n")
    lines.append("问题的难度主要由以下因素决定：\n")
    lines.append("1. **机器人数量 (n)**: 机器人越多，协调越复杂\n")
    lines.append("2. **房间数量 (r)**: 房间越多，搜索空间越大\n")
    lines.append("3. **物体数量 (o)**: 物体越多，需要搬运的任务越多\n")
    
    return ''.join(lines)

def update_readme(readme_path, new_content):
    """更新 README 文件，在末尾添加新内容"""
    if readme_path.exists():
        with open(readme_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 如果已经有"## 问题统计"部分，先删除它
        if "## 问题统计" in content:
            # 找到问题统计部分并删除
            lines = content.split('\n')
            new_lines = []
            skip = False
            for line in lines:
                if line.strip() == "## 问题统计":
                    skip = True
                elif line.startswith("## ") and skip:
                    skip = False
                    new_lines.append(line)
                elif not skip:
                    new_lines.append(line)
            content = '\n'.join(new_lines)
            # 确保末尾有换行
            if content and not content.endswith('\n'):
                content += '\n'
    else:
        content = ""
    
    # 添加新内容
    content += "\n" + new_content
    
    with open(readme_path, 'w', encoding='utf-8') as f:
        f.write(content)

def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3")
    
    domains = {
        'blocksworld': {
            'parser': parse_blocksworld_filename,
            'stats_gen': generate_blocksworld_stats,
            'readme': base_dir / 'blocksworld' / 'README'
        },
        'ferry': {
            'parser': parse_ferry_filename,
            'stats_gen': generate_ferry_stats,
            'readme': base_dir / 'ferry' / 'README.txt'
        },
        'spanner': {
            'parser': parse_spanner_filename,
            'stats_gen': generate_spanner_stats,
            'readme': base_dir / 'spanner' / 'README.txt'
        },
        'grippers': {
            'parser': parse_grippers_filename,
            'stats_gen': generate_grippers_stats,
            'readme': base_dir / 'grippers' / 'README.txt'
        }
    }
    
    for domain_name, domain_info in domains.items():
        print(f"分析 {domain_name}...")
        
        testing_dir = base_dir / domain_name / 'all_problems3' / 'testing'
        sft_dir = base_dir / domain_name / 'sft_500'
        
        testing_stats = analyze_directory(testing_dir, domain_info['parser'])
        sft_stats = analyze_directory(sft_dir, domain_info['parser'])
        
        stats_content = domain_info['stats_gen'](testing_stats, sft_stats)
        update_readme(domain_info['readme'], stats_content)
        
        print(f"  - testing: {testing_stats['total'] if testing_stats else 0} 个问题")
        print(f"  - sft_500: {sft_stats['total'] if sft_stats else 0} 个问题")
        print(f"  - 已更新 {domain_info['readme']}")

if __name__ == "__main__":
    main()







