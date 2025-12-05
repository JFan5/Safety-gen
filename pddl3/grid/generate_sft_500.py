#!/usr/bin/env python3
"""
为 grid 场景生成 sft_500 数据集。

要求：
1. 从 all_problems3/training 中挑选
2. 均匀分布，包含各种难度的问题
3. 总数500个（如果可用）
4. 所有问题都有解决方案
"""

import json
import re
import shutil
import random
from collections import defaultdict
from pathlib import Path
from typing import Dict, List, Optional, Tuple


def parse_grid(filename: str) -> Optional[Dict]:
    """解析 grid 文件名: grid_x{number}_y{number}_sh{number}_k{number}_l{number}_seed{number}_strips_{number}.pddl"""
    m = re.match(r"grid_x(\d+)_y(\d+)_sh(\d+)_k(\d+)_l(\d+)_seed\d+_strips_\d+\.pddl$", filename)
    if not m:
        return None
    return {
        "x": int(m.group(1)),
        "y": int(m.group(2)),
        "sh": int(m.group(3)),
        "k": int(m.group(4)),
        "l": int(m.group(5))
    }


def get_difficulty_key(params: Dict) -> Tuple:
    """根据参数生成难度键"""
    return (params.get('x'), params.get('y'), params.get('sh'), params.get('k'), params.get('l'))


def get_complexity(config: Tuple) -> int:
    """计算配置的复杂度：网格大小 + shapes + keys + locks"""
    x, y, sh, k, l = config
    return x * y + sh + k + l


def sample_uniformly(problems_by_config: Dict[Tuple, List[str]], target_count: int) -> List[str]:
    """均匀采样，尽量保证每个配置都有代表"""
    if not problems_by_config:
        return []
    
    # 计算每个配置应该采样多少个
    num_configs = len(problems_by_config)
    base_per_config = target_count // num_configs
    remainder = target_count % num_configs
    
    selected = []
    configs = list(problems_by_config.keys())
    
    # 按复杂度排序配置（从简单到难）
    configs_sorted = sorted(configs, key=get_complexity)
    
    for i, config in enumerate(configs_sorted):
        available = problems_by_config[config]
        if not available:
            continue
        
        # 计算这个配置应该采样多少个
        count_for_this = base_per_config + (1 if i < remainder else 0)
        count_for_this = min(count_for_this, len(available))
        
        # 从这个配置中随机采样
        sampled = random.sample(available, count_for_this)
        selected.extend(sampled)
    
    # 如果还没达到目标数量，从剩余的问题中随机补充
    if len(selected) < target_count:
        remaining = []
        for config, problems in problems_by_config.items():
            remaining.extend([p for p in problems if p not in selected])
        
        if remaining:
            needed = target_count - len(selected)
            additional = random.sample(remaining, min(needed, len(remaining)))
            selected.extend(additional)
    
    return selected[:target_count]


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3/grid")
    
    print(f"\n{'='*80}")
    print(f"生成 grid 的 sft_500 数据集")
    print(f"{'='*80}\n")
    
    # 路径
    training_dir = base_dir / "all_problems3" / "training"
    output_dir = base_dir / "sft_500"
    
    if not training_dir.exists():
        print(f"  错误: {training_dir} 不存在")
        return
    
    # 从 training 目录中找出所有问题，并按难度分组
    # 只选择有解决方案的问题
    problems_by_config = defaultdict(list)
    all_problems_dict = {}
    
    for pddl_file in training_dir.glob("*.pddl"):
        problem_name = pddl_file.name
        
        # 只考虑有解决方案的问题
        soln_file = training_dir / f"{problem_name[:-5]}.soln"
        if not soln_file.exists():
            continue
        
        params = parse_grid(problem_name)
        if not params:
            continue
        
        config_key = get_difficulty_key(params)
        problems_by_config[config_key].append(problem_name)
        all_problems_dict[problem_name] = pddl_file
    
    print(f"  按难度配置分组后的问题数: {len(all_problems_dict)}")
    print(f"  难度配置数: {len(problems_by_config)}")
    
    # 显示每个配置的问题数
    print(f"\n  各配置的问题数:")
    for config, problems in sorted(problems_by_config.items(), key=lambda x: get_complexity(x[0])):
        complexity = get_complexity(config)
        print(f"    {config} (复杂度={complexity}): {len(problems)}")
    
    # 均匀采样
    target_count = 500
    actual_target = min(target_count, len(all_problems_dict))
    selected_problems = sample_uniformly(problems_by_config, actual_target)
    
    print(f"\n  目标采样数: {target_count}")
    print(f"  初步采样数: {len(selected_problems)}")
    
    # 验证所有选中的问题都有解决方案
    final_selected = []
    for problem_name in selected_problems:
        soln_file = training_dir / f"{problem_name[:-5]}.soln"
        if soln_file.exists():
            final_selected.append(problem_name)
    
    # 如果有些问题没有解决方案，从剩余的问题中补充
    if len(final_selected) < target_count:
        remaining = [p for p in all_problems_dict.keys() if p not in final_selected]
        # 再次过滤，只选择有解决方案的
        remaining_with_soln = []
        for p in remaining:
            soln_file = training_dir / f"{p[:-5]}.soln"
            if soln_file.exists():
                remaining_with_soln.append(p)
        
        needed = min(target_count - len(final_selected), len(remaining_with_soln))
        if needed > 0:
            additional = random.sample(remaining_with_soln, needed)
            final_selected.extend(additional)
    
    selected_problems = final_selected[:target_count]
    print(f"  最终采样数（有解决方案）: {len(selected_problems)}")
    
    if len(selected_problems) < target_count:
        print(f"  警告: 无法达到目标数量 {target_count}，实际采样 {len(selected_problems)} 个")
    
    # 删除已存在的输出目录并重新创建
    if output_dir.exists():
        shutil.rmtree(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # 复制选中的问题和对应的解
    copied_count = 0
    copied_solutions = 0
    
    for problem_name in selected_problems:
        src_pddl = all_problems_dict.get(problem_name)
        if not src_pddl or not src_pddl.exists():
            continue
        
        # 检查解决方案是否存在
        src_soln = training_dir / f"{problem_name[:-5]}.soln"
        if not src_soln.exists():
            continue
        
        # 复制 .pddl 文件
        dst_pddl = output_dir / problem_name
        shutil.copy2(src_pddl, dst_pddl)
        copied_count += 1
        
        # 复制对应的 .soln 文件
        dst_soln = output_dir / src_soln.name
        shutil.copy2(src_soln, dst_soln)
        copied_solutions += 1
    
    print(f"\n  已复制: {copied_count} 个问题文件, {copied_solutions} 个解文件")
    
    # 统计采样后的分布
    sampled_by_config = defaultdict(int)
    for problem_name in selected_problems:
        params = parse_grid(problem_name)
        if params:
            config_key = get_difficulty_key(params)
            sampled_by_config[config_key] += 1
    
    print(f"\n  采样后的配置分布:")
    for config, count in sorted(sampled_by_config.items(), key=lambda x: get_complexity(x[0])):
        complexity = get_complexity(config)
        print(f"    {config} (复杂度={complexity}): {count}")
    
    # 将 tuple key 转换为字符串以便 JSON 序列化
    sampled_distribution_str = {str(k): v for k, v in sampled_by_config.items()}
    
    result = {
        'scenario': 'grid',
        'target_count': target_count,
        'actual_count': len(selected_problems),
        'copied_problems': copied_count,
        'copied_solutions': copied_solutions,
        'configs_count': len(problems_by_config),
        'sampled_distribution': sampled_distribution_str
    }
    
    # 保存结果到 JSON
    summary_file = base_dir / "sft_500_summary.json"
    with summary_file.open('w', encoding='utf-8') as f:
        json.dump(result, f, indent=2, ensure_ascii=False)
    
    print(f"\n详细结果已保存到: {summary_file}")


if __name__ == "__main__":
    # 设置随机种子以保证可重复性
    random.seed(42)
    main()

