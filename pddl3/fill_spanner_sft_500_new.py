#!/usr/bin/env python3
"""
将 spanner 的 sft_500_new 填充到 500 个问题。

要求：
1. 尽可能均匀分布
2. 从 all_problems3/training 中挑选
3. 优先选择不能被旧解求解的问题，如果不够则从所有问题中补充
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
        problem_path = entry.get('problem_path', '')
        status = entry.get('status', '')
        
        if not problem_path:
            continue
        
        problem_name = Path(problem_path).name
        
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


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3")
    scenario = "spanner"
    
    print(f"\n{'='*80}")
    print(f"填充 {scenario} 的 sft_500_new 到 500 个问题")
    print(f"{'='*80}\n")
    
    # 路径
    training_dir = base_dir / scenario / "all_problems3" / "training"
    validation_json = base_dir / f"{scenario}_training_old_vs_new.json"
    output_dir = base_dir / scenario / "sft_500_new"
    
    if not training_dir.exists():
        print(f"  错误: {training_dir} 不存在")
        return
    
    # 加载不能被旧解求解的问题
    invalid_problems = load_invalid_problems(validation_json)
    print(f"  不能被旧解求解的问题总数: {len(invalid_problems)}")
    
    # 收集所有有解决方案的问题，按是否可被旧解求解分类
    invalid_by_config = defaultdict(list)  # 不能被旧解求解的问题
    all_by_config = defaultdict(list)      # 所有问题
    invalid_problems_set = set()
    all_problems_dict = {}
    
    for pddl_file in training_dir.glob("*.pddl"):
        problem_name = pddl_file.name
        
        # 只考虑有解决方案的问题
        soln_file = training_dir / f"{problem_name[:-5]}.soln"
        if not soln_file.exists():
            continue
        
        params = parse_spanner(problem_name)
        if not params:
            continue
        
        config_key = get_difficulty_key(params)
        all_by_config[config_key].append(problem_name)
        all_problems_dict[problem_name] = pddl_file
        
        # 如果是不能被旧解求解的问题，也加入 invalid_by_config
        if problem_name in invalid_problems:
            invalid_by_config[config_key].append(problem_name)
            invalid_problems_set.add(problem_name)
    
    print(f"  所有有解决方案的问题总数: {len(all_problems_dict)}")
    print(f"  不能被旧解求解且有解决方案的问题数: {len(invalid_problems_set)}")
    print(f"  难度配置数（不能被旧解求解）: {len(invalid_by_config)}")
    print(f"  难度配置数（所有问题）: {len(all_by_config)}")
    
    # 显示各配置的问题数
    print(f"\n  各配置的问题数（不能被旧解求解）:")
    for config, problems in sorted(invalid_by_config.items()):
        print(f"    {config}: {len(problems)}")
    
    print(f"\n  各配置的问题数（所有问题）:")
    for config, problems in sorted(all_by_config.items()):
        print(f"    {config}: {len(problems)}")
    
    target_count = 500
    
    # 首先尝试从不能被旧解求解的问题中采样
    if len(invalid_problems_set) >= target_count:
        # 如果足够，只从不能被旧解求解的问题中采样
        print(f"\n  从不能被旧解求解的问题中采样 {target_count} 个...")
        selected_problems = sample_uniformly(invalid_by_config, target_count)
        selected_from_invalid = True
    else:
        # 如果不够，先选择所有不能被旧解求解的问题，然后从所有问题中补充
        print(f"\n  不能被旧解求解的问题只有 {len(invalid_problems_set)} 个，需要补充...")
        selected_problems = list(invalid_problems_set)
        
        # 从剩余的问题中均匀补充
        remaining_by_config = defaultdict(list)
        for config, problems in all_by_config.items():
            remaining = [p for p in problems if p not in selected_problems]
            if remaining:
                remaining_by_config[config] = remaining
        
        needed = target_count - len(selected_problems)
        print(f"  需要补充 {needed} 个问题...")
        
        if remaining_by_config:
            additional = sample_uniformly(remaining_by_config, needed)
            selected_problems.extend(additional)
        
        selected_from_invalid = False
    
    # 验证所有选中的问题都有解决方案
    final_selected = []
    for problem_name in selected_problems:
        soln_file = training_dir / f"{problem_name[:-5]}.soln"
        if soln_file.exists():
            final_selected.append(problem_name)
    
    selected_problems = final_selected[:target_count]
    
    print(f"\n  目标采样数: {target_count}")
    print(f"  最终采样数: {len(selected_problems)}")
    
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
    invalid_count = 0
    for problem_name in selected_problems:
        params = parse_spanner(problem_name)
        if params:
            config_key = get_difficulty_key(params)
            sampled_by_config[config_key] += 1
            if problem_name in invalid_problems_set:
                invalid_count += 1
    
    print(f"\n  采样后的配置分布:")
    for config, count in sorted(sampled_by_config.items()):
        print(f"    {config}: {count}")
    
    print(f"\n  不能被旧解求解的问题数: {invalid_count}/{len(selected_problems)}")
    
    # 将 tuple key 转换为字符串以便 JSON 序列化
    sampled_distribution_str = {str(k): v for k, v in sampled_by_config.items()}
    
    result = {
        'scenario': scenario,
        'target_count': target_count,
        'actual_count': len(selected_problems),
        'copied_problems': copied_count,
        'copied_solutions': copied_solutions,
        'invalid_count': invalid_count,
        'total_invalid': len(invalid_problems_set),
        'configs_count': len(sampled_by_config),
        'sampled_distribution': sampled_distribution_str
    }
    
    # 保存结果到 JSON
    summary_file = base_dir / f"{scenario}_sft_500_new_filled.json"
    with summary_file.open('w', encoding='utf-8') as f:
        json.dump(result, f, indent=2, ensure_ascii=False)
    
    print(f"\n详细结果已保存到: {summary_file}")


if __name__ == "__main__":
    # 设置随机种子以保证可重复性
    random.seed(42)
    main()

