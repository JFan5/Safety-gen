#!/usr/bin/env python3
"""
为 delivery 场景生成 grpo_500 数据集。

要求：
1. 从 all_problems3 中挑选
2. 均匀分布，包含各种难度的问题
3. 总数500个（如果可用）
4. 不能和 testing_problem50 重合
5. 尽量不能和 sft_500_new 重合
6. 所有问题都有解决方案
"""

import json
import re
import shutil
import random
from collections import defaultdict
from pathlib import Path
from typing import Dict, List, Optional, Tuple


def parse_delivery(filename: str) -> Optional[Dict]:
    """解析 delivery 文件名: delivery-s{number}-p{number}-seed{number}.pddl"""
    m = re.match(r"delivery-s(\d+)-p(\d+)-seed\d+\.pddl$", filename)
    if not m:
        return None
    return {"s": int(m.group(1)), "p": int(m.group(2))}


def get_difficulty_key(params: Dict) -> Tuple:
    """根据参数生成难度键"""
    return (params.get('s'), params.get('p'))


def get_problem_names(dataset_dir: Path) -> set:
    """获取数据集中的所有问题文件名"""
    if not dataset_dir.exists():
        return set()
    
    return {p.name for p in dataset_dir.glob("*.pddl")}


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
    
    # 随机打乱配置顺序，然后分配
    random.shuffle(configs)
    
    for i, config in enumerate(configs):
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
    base_dir = Path(__file__).resolve().parent
    
    print(f"\n{'='*80}")
    print(f"生成 delivery 的 grpo_500 数据集")
    print(f"{'='*80}\n")
    
    # 路径
    all_problems3_dir = base_dir / "all_problems3"
    testing_problem50_dir = base_dir / "testing_problem50"
    sft_500_new_dir = base_dir / "sft_500_new"
    output_dir = base_dir / "grpo_500"
    
    if not all_problems3_dir.exists():
        print(f"  错误: {all_problems3_dir} 不存在")
        return
    
    # 获取已存在的问题集合
    testing_problem50_names = get_problem_names(testing_problem50_dir)
    sft_500_new_names = get_problem_names(sft_500_new_dir)
    
    print(f"  testing_problem50 问题数: {len(testing_problem50_names)}")
    print(f"  sft_500_new 问题数: {len(sft_500_new_names)}")
    
    # 排除已存在的问题
    excluded_names = testing_problem50_names | sft_500_new_names
    print(f"  需要排除的问题数: {len(excluded_names)}")
    
    # 从 all_problems3 目录中找出所有问题，并按难度分组
    # 只选择有解决方案且不在排除列表中的问题
    problems_by_config = defaultdict(list)
    all_available_problems = {}
    
    for pddl_file in all_problems3_dir.glob("*.pddl"):
        problem_name = pddl_file.name
        
        # 排除已存在的问题
        if problem_name in excluded_names:
            continue
        
        # 只考虑有解决方案的问题
        soln_file = all_problems3_dir / f"{problem_name[:-5]}.soln"
        if not soln_file.exists():
            continue
        
        params = parse_delivery(problem_name)
        if not params:
            continue
        
        config_key = get_difficulty_key(params)
        problems_by_config[config_key].append(problem_name)
        all_available_problems[problem_name] = pddl_file
    
    print(f"  可用问题总数: {len(all_available_problems)}")
    print(f"  难度配置数: {len(problems_by_config)}")
    
    # 显示每个配置的问题数
    print(f"\n  各配置的问题数:")
    for config, problems in sorted(problems_by_config.items()):
        print(f"    {config}: {len(problems)}")
    
    # 均匀采样
    target_count = 500
    actual_target = min(target_count, len(all_available_problems))
    selected_problems = sample_uniformly(problems_by_config, actual_target)
    
    print(f"\n  目标采样数: {target_count}")
    print(f"  初步采样数: {len(selected_problems)}")
    
    # 验证所有选中的问题都有解决方案
    final_selected = []
    for problem_name in selected_problems:
        soln_file = all_problems3_dir / f"{problem_name[:-5]}.soln"
        if soln_file.exists():
            final_selected.append(problem_name)
    
    # 如果有些问题没有解决方案，从剩余的问题中补充
    if len(final_selected) < target_count:
        remaining = [p for p in all_available_problems.keys() if p not in final_selected]
        # 再次过滤，只选择有解决方案的
        remaining_with_soln = []
        for p in remaining:
            soln_file = all_problems3_dir / f"{p[:-5]}.soln"
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
    
    # 验证与已存在数据集的重合度
    selected_set = set(selected_problems)
    overlap_with_testing = selected_set & testing_problem50_names
    overlap_with_sft = selected_set & sft_500_new_names
    
    print(f"\n  与 testing_problem50 重合: {len(overlap_with_testing)} 个问题")
    print(f"  与 sft_500_new 重合: {len(overlap_with_sft)} 个问题")
    
    if overlap_with_testing:
        print(f"  ⚠️  警告: 与 testing_problem50 有重合！")
        for name in list(overlap_with_testing)[:5]:
            print(f"    - {name}")
    
    if overlap_with_sft:
        print(f"  ⚠️  警告: 与 sft_500_new 有重合！")
        for name in list(overlap_with_sft)[:5]:
            print(f"    - {name}")
    
    # 删除已存在的输出目录并重新创建
    if output_dir.exists():
        shutil.rmtree(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # 复制选中的问题和对应的解
    copied_count = 0
    copied_solutions = 0
    
    for problem_name in selected_problems:
        src_pddl = all_available_problems.get(problem_name)
        if not src_pddl or not src_pddl.exists():
            continue
        
        # 检查解决方案是否存在
        src_soln = all_problems3_dir / f"{problem_name[:-5]}.soln"
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
        params = parse_delivery(problem_name)
        if params:
            config_key = get_difficulty_key(params)
            sampled_by_config[config_key] += 1
    
    print(f"\n  采样后的配置分布:")
    for config, count in sorted(sampled_by_config.items()):
        print(f"    {config}: {count}")
    
    # 将 tuple key 转换为字符串以便 JSON 序列化
    sampled_distribution_str = {str(k): v for k, v in sampled_by_config.items()}
    
    result = {
        'scenario': 'delivery',
        'target_count': target_count,
        'actual_count': len(selected_problems),
        'copied_problems': copied_count,
        'copied_solutions': copied_solutions,
        'overlap_with_testing_problem50': len(overlap_with_testing),
        'overlap_with_sft_500_new': len(overlap_with_sft),
        'configs_count': len(problems_by_config),
        'sampled_distribution': sampled_distribution_str
    }
    
    # 保存结果到 JSON
    summary_file = base_dir / "grpo_500_summary.json"
    with summary_file.open('w', encoding='utf-8') as f:
        json.dump(result, f, indent=2, ensure_ascii=False)
    
    print(f"\n详细结果已保存到: {summary_file}")


if __name__ == "__main__":
    # 设置随机种子以保证可重复性
    random.seed(42)
    main()

