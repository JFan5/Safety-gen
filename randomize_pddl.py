#!/usr/bin/env python3
"""
PDDL Randomization Script
对 PDDL domain/problem/plan 进行符号随机化（predicate/action/object 重命名）
生成用于 LLM 训练的随机化数据集
"""

import argparse
import json
import os
import re
import random
from pathlib import Path
from typing import Dict, List, Tuple, Set
from collections import defaultdict


class PDDLRandomizer:
    """PDDL 文件随机化器"""

    def __init__(self, seed: int = 42):
        self.seed = seed
        random.seed(seed)

    def parse_predicates(self, domain_content: str) -> Dict[str, int]:
        """
        从 domain 文件中解析所有 predicates 及其 arity

        Returns:
            Dict[predicate_name, arity]
        """
        predicates = {}

        # 匹配 (:predicates ...) 块，使用括号平衡匹配
        # 首先找到 (:predicates 的位置
        start_pattern = r'\(:predicates\s+'
        start_match = re.search(start_pattern, domain_content, re.IGNORECASE)

        if start_match:
            start_pos = start_match.end()
            # 从这个位置开始，找到匹配的闭合括号
            depth = 1  # 已经有一个开括号（:predicates 的）
            i = start_pos

            while i < len(domain_content) and depth > 0:
                if domain_content[i] == '(':
                    depth += 1
                elif domain_content[i] == ')':
                    depth -= 1
                i += 1

            if depth == 0:
                pred_block = domain_content[start_pos:i-1]

                # 匹配每个 predicate 定义，例如 (on ?x ?y) 或 (clear ?x)
                # 支持连字符：[\w-]+
                pred_defs = re.findall(r'\(([\w-]+)([^)]*)\)', pred_block)

                for pred_name, params in pred_defs:
                    # 统计参数个数（以 ? 开头的变量）
                    arity = len(re.findall(r'\?', params))
                    predicates[pred_name] = arity

        return predicates

    def parse_actions(self, domain_content: str) -> List[str]:
        """
        从 domain 文件中解析所有 action 名称

        Returns:
            List[action_name]
        """
        actions = []

        # 匹配 (:action name ...)
        # 支持连字符：[\w-]+
        action_pattern = r'\(:action\s+([\w-]+)'
        matches = re.findall(action_pattern, domain_content, re.IGNORECASE)

        actions = list(set(matches))  # 去重
        return actions

    def parse_objects(self, problem_content: str) -> List[str]:
        """
        从 problem 文件中解析所有 objects

        Returns:
            List[object_name]
        """
        objects = []

        # 匹配 (:objects ...) 块
        obj_pattern = r'\(:objects\s+(.*?)\)'
        match = re.search(obj_pattern, problem_content, re.DOTALL | re.IGNORECASE)

        if match:
            obj_block = match.group(1)
            # 提取所有非类型标记的 object（排除 - 和类型名）
            # 支持类型化和非类型化格式
            # 例如: obj1 obj2 - type1 obj3 - type2
            tokens = obj_block.split()

            skip_next = False
            for token in tokens:
                if skip_next:
                    skip_next = False
                    continue
                if token == '-':
                    skip_next = True
                    continue
                # 排除注释和特殊字符
                if token and not token.startswith(';') and re.match(r'^[a-zA-Z0-9_-]+$', token):
                    objects.append(token)

        return objects

    def collect_all_objects_from_domain(self, problem_files: List[Path]) -> Set[str]:
        """
        收集一个 domain 下所有 problem 文件中出现的所有 objects

        Returns:
            Set[object_name]
        """
        all_objects = set()

        for problem_file in problem_files:
            with open(problem_file, 'r', encoding='utf-8') as f:
                content = f.read()
                objects = self.parse_objects(content)
                all_objects.update(objects)

        return all_objects

    def generate_mappings(self, predicates: Dict[str, int], actions: List[str],
                         objects: Set[str]) -> Tuple[Dict, Dict, Dict]:
        """
        生成随机映射表

        Returns:
            (predicate_map, action_map, object_map)
        """
        # Predicate 映射: p1, p2, p3, ...
        pred_list = list(predicates.keys())
        random.shuffle(pred_list)
        predicate_map = {pred: f"p{i+1}" for i, pred in enumerate(pred_list)}

        # Action 映射: a1, a2, a3, ...
        action_list = list(actions)
        random.shuffle(action_list)
        action_map = {act: f"a{i+1}" for i, act in enumerate(action_list)}

        # Object 映射: o1, o2, o3, ...
        obj_list = list(objects)
        random.shuffle(obj_list)
        object_map = {obj: f"o{i+1}" for i, obj in enumerate(obj_list)}

        return predicate_map, action_map, object_map

    def replace_tokens(self, text: str, token_map: Dict[str, str],
                      preserve_variables: bool = True) -> str:
        """
        在文本中替换 tokens

        Args:
            text: 原始文本
            token_map: 映射表 {old_token: new_token}
            preserve_variables: 是否保留变量（?x 这种）

        Returns:
            替换后的文本
        """
        # 按照 token 长度降序排序，避免部分匹配问题
        sorted_tokens = sorted(token_map.items(), key=lambda x: len(x[0]), reverse=True)

        for old_token, new_token in sorted_tokens:
            # 使用词边界匹配，确保完整匹配
            # 不匹配变量（? 开头）
            if preserve_variables:
                pattern = r'\b' + re.escape(old_token) + r'\b'
            else:
                pattern = r'(?<!\?)\b' + re.escape(old_token) + r'\b'

            text = re.sub(pattern, new_token, text)

        return text

    def randomize_domain(self, domain_content: str, predicate_map: Dict,
                        action_map: Dict) -> str:
        """
        随机化 domain 文件内容
        """
        # 替换 predicates
        domain_content = self.replace_tokens(domain_content, predicate_map)

        # 替换 actions
        domain_content = self.replace_tokens(domain_content, action_map)

        return domain_content

    def randomize_problem(self, problem_content: str, predicate_map: Dict,
                         object_map: Dict) -> str:
        """
        随机化 problem 文件内容
        """
        # 替换 predicates
        problem_content = self.replace_tokens(problem_content, predicate_map)

        # 替换 objects
        problem_content = self.replace_tokens(problem_content, object_map)

        return problem_content

    def randomize_plan(self, plan_content: str, action_map: Dict,
                      object_map: Dict) -> str:
        """
        随机化 plan 文件内容

        支持两种格式：
        1. 带行号：0: (action obj1 obj2)
        2. 无行号：(action obj1 obj2)
        """
        lines = plan_content.strip().split('\n')
        new_lines = []

        for line in lines:
            line = line.strip()
            if not line or line.startswith(';'):
                new_lines.append(line)
                continue

            # 检查是否有行号前缀
            prefix_match = re.match(r'^(\d+:\s*)', line)
            prefix = prefix_match.group(1) if prefix_match else ''
            action_part = line[len(prefix):] if prefix else line

            # 替换 actions
            action_part = self.replace_tokens(action_part, action_map)

            # 替换 objects
            action_part = self.replace_tokens(action_part, object_map)

            new_lines.append(prefix + action_part)

        return '\n'.join(new_lines)

    def process_domain(self, domain_dir: Path, output_dir: Path, domain_name: str) -> Dict:
        """
        处理一个 domain（包括其下的所有 problems 和 plans）

        Returns:
            包含数据集条目的字典列表
        """
        print(f"\n处理 domain: {domain_name}")

        # 读取 domain 文件
        domain_file = domain_dir / 'domain3.pddl'
        if not domain_file.exists():
            print(f"  警告: domain 文件不存在: {domain_file}")
            return []

        with open(domain_file, 'r', encoding='utf-8') as f:
            domain_content = f.read()

        # 解析 domain
        predicates = self.parse_predicates(domain_content)
        actions = self.parse_actions(domain_content)

        print(f"  发现 {len(predicates)} 个 predicates, {len(actions)} 个 actions")

        # 收集所有 problem 文件
        sft_dir = domain_dir / 'sft_500'
        if not sft_dir.exists():
            print(f"  警告: SFT 目录不存在: {sft_dir}")
            return []

        problem_files = sorted(sft_dir.glob('*.pddl'))
        print(f"  发现 {len(problem_files)} 个 problem 文件")

        # 收集所有 objects
        all_objects = self.collect_all_objects_from_domain(problem_files)
        print(f"  发现 {len(all_objects)} 个唯一 objects")

        # 生成映射表
        predicate_map, action_map, object_map = self.generate_mappings(
            predicates, actions, all_objects
        )

        # 创建输出目录
        domain_output_dir = output_dir / domain_name
        domain_output_dir.mkdir(parents=True, exist_ok=True)

        # 保存映射表
        mapping = {
            'predicate_map': predicate_map,
            'action_map': action_map,
            'object_map': object_map
        }
        mapping_file = domain_output_dir / 'mapping.json'
        with open(mapping_file, 'w', encoding='utf-8') as f:
            json.dump(mapping, f, indent=2, ensure_ascii=False)
        print(f"  保存映射表到: {mapping_file}")

        # 随机化并保存 domain 文件
        randomized_domain = self.randomize_domain(domain_content, predicate_map, action_map)
        new_domain_file = domain_output_dir / 'domain.pddl'
        with open(new_domain_file, 'w', encoding='utf-8') as f:
            f.write(randomized_domain)

        # 处理所有 problems 和 plans
        dataset_entries = []
        problems_output_dir = domain_output_dir / 'problems'
        problems_output_dir.mkdir(exist_ok=True)

        for problem_file in problem_files:
            # 读取 problem
            with open(problem_file, 'r', encoding='utf-8') as f:
                problem_content = f.read()

            # 查找对应的 plan 文件
            # 假设 plan 文件名为 problem_file.soln 或 problem_name.soln
            plan_file = problem_file.with_suffix('.soln')
            if not plan_file.exists():
                plan_file = problem_file.parent / (problem_file.stem + '.soln')

            if not plan_file.exists():
                # 尝试其他可能的命名（.solution）
                plan_file = problem_file.with_suffix('.solution')

            if not plan_file.exists():
                plan_file = problem_file.parent / (problem_file.stem + '.solution')

            if not plan_file.exists():
                print(f"  警告: 找不到 plan 文件: {problem_file.name}")
                continue

            with open(plan_file, 'r', encoding='utf-8') as f:
                plan_content = f.read()

            # 随机化
            randomized_problem = self.randomize_problem(
                problem_content, predicate_map, object_map
            )
            randomized_plan = self.randomize_plan(plan_content, action_map, object_map)

            # 保存随机化后的文件
            new_problem_file = problems_output_dir / problem_file.name
            new_plan_file = problems_output_dir / (problem_file.stem + '.soln')

            with open(new_problem_file, 'w', encoding='utf-8') as f:
                f.write(randomized_problem)

            with open(new_plan_file, 'w', encoding='utf-8') as f:
                f.write(randomized_plan)

            # 添加到数据集
            dataset_entries.append({
                'domain': domain_name,
                'problem_id': problem_file.stem,
                'domain_pddl': randomized_domain,
                'problem_pddl': randomized_problem,
                'plan': randomized_plan
            })

        print(f"  成功处理 {len(dataset_entries)} 个 problem-plan 对")

        return dataset_entries

    def create_sft_dataset(self, dataset_entries: List[Dict], output_file: Path):
        """
        创建 SFT 格式的数据集 JSON 文件

        格式：每条数据包含 domain, problem, plan
        """
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(dataset_entries, f, indent=2, ensure_ascii=False)

        print(f"\n保存数据集到: {output_file} ({len(dataset_entries)} 条)")


def main():
    parser = argparse.ArgumentParser(
        description='PDDL 符号随机化工具',
        formatter_class=argparse.RawDescriptionHelpFormatter
    )

    parser.add_argument(
        '--input_root',
        type=str,
        default='pddl3',
        help='输入根目录 (默认: pddl3)'
    )

    parser.add_argument(
        '--output_root',
        type=str,
        required=True,
        help='输出根目录'
    )

    parser.add_argument(
        '--domains',
        nargs='+',
        required=True,
        help='要处理的 domain 列表'
    )

    parser.add_argument(
        '--seed',
        type=int,
        default=42,
        help='随机种子 (默认: 42)'
    )

    args = parser.parse_args()

    # 初始化随机化器
    randomizer = PDDLRandomizer(seed=args.seed)

    # 创建输出目录
    output_root = Path(args.output_root)
    output_root.mkdir(parents=True, exist_ok=True)

    # 收集所有数据集条目
    all_entries = []
    domain_datasets = {}

    # 处理每个 domain
    input_root = Path(args.input_root)

    for domain_name in args.domains:
        domain_dir = input_root / domain_name

        if not domain_dir.exists():
            print(f"警告: Domain 目录不存在: {domain_dir}")
            continue

        # 处理 domain
        entries = randomizer.process_domain(domain_dir, output_root, domain_name)

        # 保存单个 domain 的数据集
        if entries:
            domain_dataset_file = output_root / f'{domain_name}_dataset.json'
            randomizer.create_sft_dataset(entries, domain_dataset_file)

            domain_datasets[domain_name] = entries
            all_entries.extend(entries)

    # 保存混合数据集
    if all_entries:
        mixed_dataset_file = output_root / 'mixed_dataset.json'
        randomizer.create_sft_dataset(all_entries, mixed_dataset_file)

        # 打印统计信息
        print("\n" + "="*60)
        print("数据集统计:")
        print("="*60)
        for domain_name, entries in domain_datasets.items():
            print(f"  {domain_name}: {len(entries)} 条")
        print(f"  总计: {len(all_entries)} 条")
        print("="*60)
    else:
        print("\n警告: 没有生成任何数据集条目")


if __name__ == '__main__':
    main()
