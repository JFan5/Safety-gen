#!/usr/bin/env python3
"""
重新生成 spanner 的 sft_500_new 数据集。

要求：
1. 从 all_problems3/training 中挑选
2. 均匀分布，包含各种难度的问题
3. 总数500个（如果可用）
4. 不能被 all_problems 中的 solution 求解
5. 如果无法找到满足数量的，不用强行，并汇报结果
"""

import json
import re
import shutil
import random
from collections import defaultdict
from pathlib import Path
from typing import Dict, List, Optional, Tuple


def parse_spanner(filename: str) -> Optional[Dict]:
    """解析 spanner 文件名: spanner-s{number}-n{number}-l{number}-s{number}.pddl"""
    m = re.match(r"spanner-s(\d+)-n(\d+)-l(\d+)-s\d+\.pddl$", filename)
    if not m:
        return None
    return {"s": int(m.group(1)), "n": int(m.group(2)), "l": int(m.group(3))}


def load_invalid_problems(validation_json: Path) -> set:
    """从验证 JSON 中加载所有不能被旧解求解的问题"""
    if not validation_json.exists():
        return set()
    
    data = json.loads(validation_json.read_text(encoding='utf-8'))
    results = data.get('results', [])
    
    invalid_problems = set()
    valid_problems = set()
    
    for entry in results:
        problem_name = entry.get('problem_name', '')
        status = entry.get('status', '')
        
        if not problem_name:
            continue
        
        if status == 'valid':
            valid_problems.add(problem_name)
        elif status == 'invalid':
            invalid_problems.add(problem_name)
    
    # 返回所有 invalid 的问题（即不能被旧解求解的）
    return invalid_problems - valid_problems


def get_difficulty_key(params: Dict) -> Tuple:
    """根据参数生成难度键"""
    return (params.get('s'), params.get('n'), params.get('l'))


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


def regenerate_spanner_sft_500_new(base_dir: Path, target_count: int = 500):
    """为 spanner 重新生成 sft_500_new"""
    scenario = 'spanner'
    
    print(f"\n{'='*80}")
    print(f"重新生成场景: {scenario}")
    print(f"{'='*80}")
    
    # 路径
    training_dir = base_dir / scenario / "all_problems3" / "training"
    validation_json = base_dir / f"{scenario}_all_problems_solutions_for_pddl3.json"
    output_dir = base_dir / scenario / "sft_500_new"
    
    if not training_dir.exists():
        print(f"  跳过: {training_dir} 不存在")
        return None
    
    if not validation_json.exists():
        print(f"  跳过: 验证文件不存在 {validation_json}")
        return None
    
    # 加载不能被旧解求解的问题
    invalid_problems = load_invalid_problems(validation_json)
    print(f"  不能被 all_problems 中的解求解的问题总数: {len(invalid_problems)}")
    
    if len(invalid_problems) == 0:
        print(f"  警告: 没有找到不能被旧解求解的问题！")
        return None
    
    # 从 training 目录中找出所有问题，并按难度分组
    problems_by_config = defaultdict(list)
    all_training_problems = {}
    
    for pddl_file in training_dir.glob("*.pddl"):
        problem_name = pddl_file.name
        
        # 只考虑不能被旧解求解的问题
        if problem_name not in invalid_problems:
            continue
        
        params = parse_spanner(problem_name)
        if not params:
            continue
        
        config_key = get_difficulty_key(params)
        problems_by_config[config_key].append(problem_name)
        all_training_problems[problem_name] = pddl_file
    
    print(f"  按难度配置分组后的问题数: {len(all_training_problems)}")
    print(f"  难度配置数: {len(problems_by_config)}")
    
    # 显示每个配置的问题数
    print(f"\n  各配置的问题数:")
    for config, problems in sorted(problems_by_config.items()):
        print(f"    {config}: {len(problems)}")
    
    # 均匀采样
    actual_target = min(target_count, len(all_training_problems))
    selected_problems = sample_uniformly(problems_by_config, actual_target)
    
    print(f"\n  目标采样数: {target_count}")
    print(f"  实际采样数: {len(selected_problems)}")
    
    if len(selected_problems) < target_count:
        print(f"  警告: 无法达到目标数量 {target_count}，实际采样 {len(selected_problems)} 个")
    
    # 删除旧的 sft_500_new 目录（如果存在）
    if output_dir.exists():
        print(f"\n  删除旧的 sft_500_new 目录...")
        shutil.rmtree(output_dir)
    
    # 创建输出目录
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # 复制选中的问题和对应的解
    copied_count = 0
    copied_solutions = 0
    
    for problem_name in selected_problems:
        src_pddl = all_training_problems.get(problem_name)
        if not src_pddl or not src_pddl.exists():
            continue
        
        # 复制 .pddl 文件
        dst_pddl = output_dir / problem_name
        shutil.copy2(src_pddl, dst_pddl)
        copied_count += 1
        
        # 复制对应的 .soln 文件（如果存在）
        src_soln = training_dir / f"{problem_name[:-5]}.soln"
        if src_soln.exists():
            dst_soln = output_dir / src_soln.name
            shutil.copy2(src_soln, dst_soln)
            copied_solutions += 1
    
    print(f"\n  已复制: {copied_count} 个问题文件, {copied_solutions} 个解文件")
    
    # 统计采样后的分布
    sampled_by_config = defaultdict(int)
    for problem_name in selected_problems:
        params = parse_spanner(problem_name)
        if params:
            config_key = get_difficulty_key(params)
            sampled_by_config[config_key] += 1
    
    print(f"\n  采样后的配置分布:")
    for config, count in sorted(sampled_by_config.items()):
        print(f"    {config}: {count}")
    
    return {
        'scenario': scenario,
        'target_count': target_count,
        'actual_count': len(selected_problems),
        'copied_problems': copied_count,
        'copied_solutions': copied_solutions,
        'total_invalid': len(invalid_problems),
        'configs_count': len(problems_by_config),
        'sampled_distribution': {str(k): v for k, v in sampled_by_config.items()}
    }


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3")
    
    # 设置随机种子以保证可重复性
    random.seed(42)
    
    result = regenerate_spanner_sft_500_new(base_dir, target_count=500)
    
    if result:
        print(f"\n{'='*80}")
        print("生成结果")
        print(f"{'='*80}")
        print(f"场景: {result['scenario']}")
        print(f"目标数量: {result['target_count']}")
        print(f"实际数量: {result['actual_count']}")
        print(f"复制的问题数: {result['copied_problems']}")
        print(f"复制的解数: {result['copied_solutions']}")
        print(f"无效问题总数: {result['total_invalid']}")
        print(f"配置数: {result['configs_count']}")
        print(f"\n采样后的配置分布:")
        for config, count in sorted(result['sampled_distribution'].items()):
            print(f"  {config}: {count}")


if __name__ == "__main__":
    main()

