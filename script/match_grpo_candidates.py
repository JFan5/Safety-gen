#!/usr/bin/env python3
"""
脚本用于匹配scenario下的grpo_training文件夹和candidate.json的problem

用法:
    python script/match_grpo_candidates.py <scenario> <candidate.json路径>

例如:
    python script/match_grpo_candidates.py spanner /home/ubuntu/Safety-gen/data/grpo/gpt_multi_pddl3_500/spanner/pddl3/candidates.jsonl
"""

import json
import os
import sys
from pathlib import Path
from typing import Set


def get_grpo_training_problems(scenario: str, base_dir: str = "/home/ubuntu/Safety-gen") -> Set[str]:
    """
    从scenario的grpo_training文件夹中获取所有problem名称
    
    Args:
        scenario: scenario名称，如"spanner", "blocksworld"等
        base_dir: 基础目录路径
        
    Returns:
        problem名称的集合（不包含.pddl扩展名）
    """
    grpo_training_dir = Path(base_dir) / scenario / "grpo_training"
    
    if not grpo_training_dir.exists():
        raise FileNotFoundError(f"grpo_training文件夹不存在: {grpo_training_dir}")
    
    problems = set()
    for pddl_file in grpo_training_dir.glob("*.pddl"):
        # 获取文件名（不包含扩展名）作为problem名称
        problem_name = pddl_file.stem
        problems.add(problem_name)
    
    return problems


def get_candidate_problems(candidate_file: str) -> Set[str]:
    """
    从candidate.json或candidates.jsonl文件中获取所有problem名称
    
    Args:
        candidate_file: candidate文件路径
        
    Returns:
        problem名称的集合
    """
    candidate_path = Path(candidate_file)
    
    if not candidate_path.exists():
        raise FileNotFoundError(f"candidate文件不存在: {candidate_file}")
    
    problems = set()
    
    # 判断文件扩展名，支持.json和.jsonl
    if candidate_path.suffix == ".jsonl" or candidate_path.name.endswith(".jsonl"):
        # 读取JSONL文件（每行一个JSON对象）
        with open(candidate_path, 'r', encoding='utf-8') as f:
            for line_num, line in enumerate(f, 1):
                line = line.strip()
                if not line:
                    continue
                try:
                    data = json.loads(line)
                    # 尝试从不同可能的字段获取problem_name
                    problem_name = None
                    if "problem_name" in data:
                        problem_name = data["problem_name"]
                    elif "problem_key" in data:
                        # problem_key格式可能是 "scenario/problem_name"
                        problem_key = data["problem_key"]
                        if isinstance(problem_key, str) and "/" in problem_key:
                            problem_name = problem_key.split("/")[-1]
                        else:
                            problem_name = str(problem_key)
                    elif "problem_file" in data:
                        # 从problem_file路径中提取problem名称
                        problem_file = data["problem_file"]
                        if isinstance(problem_file, str):
                            problem_name = Path(problem_file).stem
                    
                    if problem_name:
                        problems.add(problem_name)
                    else:
                        print(f"警告: 第{line_num}行无法提取problem_name: {list(data.keys())[:5]}", file=sys.stderr)
                except json.JSONDecodeError as e:
                    print(f"警告: 第{line_num}行无法解析JSON: {line[:50]}... 错误: {e}", file=sys.stderr)
    elif candidate_path.suffix == ".json" or candidate_path.name.endswith(".json"):
        # 读取JSON文件（可能是列表或字典）
        with open(candidate_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
            
            if isinstance(data, list):
                # 如果是列表，遍历每个元素
                for item in data:
                    problem_name = item.get("problem_name") or (item.get("problem_key", "").split("/")[-1] if item.get("problem_key") else None)
                    if problem_name:
                        problems.add(problem_name)
            elif isinstance(data, dict):
                # 如果是字典，可能包含problem列表或单个problem
                if "problem_name" in data:
                    problems.add(data["problem_name"])
                elif "problems" in data and isinstance(data["problems"], list):
                    for item in data["problems"]:
                        problem_name = item.get("problem_name") or (item.get("problem_key", "").split("/")[-1] if item.get("problem_key") else None)
                        if problem_name:
                            problems.add(problem_name)
    else:
        raise ValueError(f"不支持的文件格式: {candidate_path.suffix}，支持.json和.jsonl")
    
    return problems


def main():
    if len(sys.argv) != 3:
        print("用法: python script/match_grpo_candidates.py <scenario> <candidate.json路径>", file=sys.stderr)
        sys.exit(1)
    
    scenario = sys.argv[1]
    candidate_file = sys.argv[2]
    
    try:
        # 获取grpo_training中的problems
        print(f"正在读取scenario '{scenario}' 的grpo_training文件夹...")
        grpo_problems = get_grpo_training_problems(scenario)
        print(f"grpo_training中找到 {len(grpo_problems)} 个problem文件")
        
        # 获取candidate.json中的problems
        print(f"正在读取candidate文件: {candidate_file}...")
        candidate_problems = get_candidate_problems(candidate_file)
        print(f"candidate文件中找到 {len(candidate_problems)} 个problem")
        
        # 计算匹配
        matched = grpo_problems & candidate_problems
        missing_in_candidate = grpo_problems - candidate_problems
        extra_in_candidate = candidate_problems - grpo_problems
        
        # 输出结果
        print("\n" + "="*60)
        print("匹配结果统计")
        print("="*60)
        print(f"grpo_training中的problem总数: {len(grpo_problems)}")
        print(f"candidate文件中的problem总数: {len(candidate_problems)}")
        print(f"匹配的problem数量: {len(matched)}")
        print(f"candidate.json缺失的problem数量: {len(missing_in_candidate)}")
        print(f"candidate.json中多出的problem数量: {len(extra_in_candidate)}")
        print("="*60)
        
        # 如果需要，显示缺失的problem列表
        if missing_in_candidate:
            print(f"\n缺失的problem列表（前20个）:")
            for i, problem in enumerate(sorted(missing_in_candidate)[:20], 1):
                print(f"  {i}. {problem}")
            if len(missing_in_candidate) > 20:
                print(f"  ... 还有 {len(missing_in_candidate) - 20} 个")
        
        # 如果需要，显示多出的problem列表
        if extra_in_candidate:
            print(f"\ncandidate文件中多出的problem列表（前20个）:")
            for i, problem in enumerate(sorted(extra_in_candidate)[:20], 1):
                print(f"  {i}. {problem}")
            if len(extra_in_candidate) > 20:
                print(f"  ... 还有 {len(extra_in_candidate) - 20} 个")
        
    except Exception as e:
        print(f"错误: {e}", file=sys.stderr)
        import traceback
        traceback.print_exc()
        sys.exit(1)


if __name__ == "__main__":
    main()

