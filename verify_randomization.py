#!/usr/bin/env python3
"""
验证 PDDL 随机化的正确性
"""

import json
import re
from pathlib import Path


def extract_tokens(text, pattern):
    """提取文本中的所有 tokens"""
    return set(re.findall(pattern, text))


def verify_domain(domain_name, randomized_root='data_randomized'):
    """验证单个 domain 的随机化结果"""
    print(f"\n{'='*60}")
    print(f"验证 {domain_name}")
    print('='*60)

    # 加载映射表
    mapping_file = Path(randomized_root) / domain_name / 'mapping.json'
    with open(mapping_file, 'r') as f:
        mapping = json.load(f)

    # 读取随机化后的 domain
    domain_file = Path(randomized_root) / domain_name / 'domain.pddl'
    with open(domain_file, 'r') as f:
        domain_content = f.read()

    # 验证 1: 确保所有旧的 predicate 名都不存在
    old_predicates = set(mapping['predicate_map'].keys())
    # 排除可能是子串的情况，检查完整单词
    found_old_preds = []
    for old_pred in old_predicates:
        if re.search(r'\b' + re.escape(old_pred) + r'\b', domain_content):
            found_old_preds.append(old_pred)

    if found_old_preds:
        print(f"  ⚠️  发现未替换的 predicates: {found_old_preds}")
    else:
        print(f"  ✅ 所有 predicates 已正确替换")

    # 验证 2: 确保所有新的 predicate 名都存在
    new_predicates = set(mapping['predicate_map'].values())
    found_new_preds = []
    for new_pred in new_predicates:
        if re.search(r'\b' + re.escape(new_pred) + r'\b', domain_content):
            found_new_preds.append(new_pred)

    print(f"  ✅ 找到 {len(found_new_preds)}/{len(new_predicates)} 个新 predicates")

    # 验证 3: 确保所有旧的 action 名都不存在
    old_actions = set(mapping['action_map'].keys())
    found_old_actions = []
    for old_action in old_actions:
        if re.search(r'\b' + re.escape(old_action) + r'\b', domain_content):
            found_old_actions.append(old_action)

    if found_old_actions:
        print(f"  ⚠️  发现未替换的 actions: {found_old_actions}")
    else:
        print(f"  ✅ 所有 actions 已正确替换")

    # 验证 4: 读取一个 problem 和 plan，确保一致性
    problems_dir = Path(randomized_root) / domain_name / 'problems'
    problem_files = list(problems_dir.glob('*.pddl'))

    if problem_files:
        problem_file = problem_files[0]
        plan_file = problem_file.with_suffix('.soln')

        with open(problem_file, 'r') as f:
            problem_content = f.read()

        if plan_file.exists():
            with open(plan_file, 'r') as f:
                plan_content = f.read()

            # 检查 problem 中是否有旧的 object 名
            old_objects = set(mapping['object_map'].keys())
            found_old_objs = []
            for old_obj in old_objects:
                if re.search(r'\b' + re.escape(old_obj) + r'\b', problem_content):
                    found_old_objs.append(old_obj)

            if found_old_objs:
                print(f"  ⚠️  在 problem 中发现未替换的 objects: {found_old_objs}")
            else:
                print(f"  ✅ Problem 中所有 objects 已正确替换")

            # 检查 plan 中是否有旧的 action/object 名
            found_old_in_plan = []
            for old_action in old_actions:
                if re.search(r'\b' + re.escape(old_action) + r'\b', plan_content):
                    found_old_in_plan.append(old_action)
            for old_obj in old_objects:
                if re.search(r'\b' + re.escape(old_obj) + r'\b', plan_content):
                    found_old_in_plan.append(old_obj)

            if found_old_in_plan:
                print(f"  ⚠️  在 plan 中发现未替换的符号: {found_old_in_plan}")
            else:
                print(f"  ✅ Plan 中所有符号已正确替换")

    # 验证 5: 检查数据集 JSON
    dataset_file = Path(randomized_root) / f'{domain_name}_dataset.json'
    with open(dataset_file, 'r') as f:
        dataset = json.load(f)

    print(f"  ✅ 数据集包含 {len(dataset)} 条记录")

    # 随机检查一条记录
    if dataset:
        sample = dataset[0]
        required_keys = ['domain', 'problem_id', 'domain_pddl', 'problem_pddl', 'plan']
        missing_keys = [k for k in required_keys if k not in sample]

        if missing_keys:
            print(f"  ⚠️  数据集记录缺少字段: {missing_keys}")
        else:
            print(f"  ✅ 数据集格式正确")

    return True


def verify_mixed_dataset(randomized_root='data_randomized'):
    """验证混合数据集"""
    print(f"\n{'='*60}")
    print("验证混合数据集")
    print('='*60)

    mixed_file = Path(randomized_root) / 'mixed_dataset.json'
    with open(mixed_file, 'r') as f:
        dataset = json.load(f)

    print(f"  ✅ 混合数据集包含 {len(dataset)} 条记录")

    # 统计各 domain 的数量
    from collections import Counter
    domain_counts = Counter(item['domain'] for item in dataset)

    print("  各场景分布:")
    for domain, count in sorted(domain_counts.items()):
        print(f"    {domain}: {count} 条")

    return True


def main():
    print("开始验证 PDDL 随机化结果...")

    domains = ['blocksworld', 'ferry', 'spanner', 'grippers']

    for domain in domains:
        verify_domain(domain)

    verify_mixed_dataset()

    print(f"\n{'='*60}")
    print("验证完成！")
    print('='*60)


if __name__ == '__main__':
    main()
