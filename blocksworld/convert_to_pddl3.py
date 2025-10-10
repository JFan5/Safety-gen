#!/usr/bin/env python3
import os
import glob
import re
from typing import List, Tuple, Optional, Set
import shutil

def _extract_block(text: str, key: str) -> Optional[str]:
    """
    提取 problem.pddl 中像 (:objects ...)、(:init ...)、(:goal ...) 的块（最外层）。
    使用启发式正则：匹配 '(:key' 到其后第一个单独的右括号 ) 之间的内容。
    对于常见 problem.pddl 写法足够；若你的格式非常规，可视需要加强解析。
    """
    # 在忽略大小写的前提下查找起点
    m = re.search(rf'\(\s*:{re.escape(key)}\b', text, flags=re.IGNORECASE)
    if not m:
        return None
    start = m.start()
    # 从起点开始做一个简单的括号计数，找到匹配的右括号
    depth = 0
    for i in range(start, len(text)):
        c = text[i]
        if c == '(':
            depth += 1
        elif c == ')':
            depth -= 1
            if depth == 0:
                return text[start:i+1]
    return None  # 未能成功闭合（格式异常）

def _extract_on_pairs(block_text: str) -> Set[Tuple[str, str]]:
    """从一个块（如 :init 或 :goal）里提取所有形如 (on a b) 的对。"""
    if not block_text:
        return set()
    pairs = set()
    for m in re.finditer(r'\(\s*on\s+([^\s()]+)\s+([^\s()]+)\s*\)', block_text, flags=re.IGNORECASE):
        pairs.add((m.group(1), m.group(2)))
    return pairs

def _extract_objects(objects_block: str) -> List[str]:
    """从 (:objects ...) 块中提取对象标识符列表。"""
    if not objects_block:
        return []
    inner = re.sub(r'^\(\s*:objects', '', objects_block, flags=re.IGNORECASE).rstrip(')')
    # 去掉换行和多余空白
    toks = re.findall(r'[^\s()]+', inner)
    return toks

def generate_safe_constraint(problem_text: str) -> Optional[str]:
    """
    基于 problem.pddl 自动生成一条不与 init/goal 冲突的安全约束（PDDL 3.0 S-expr，不含外层 (:constraints ...)）。
    优先生成：对每个 (on x y) 目标，禁止 (on y x) 的逆。
    若不可行，则选择任一不在 init、且非目标 on 的 (on a b) 禁止之。
    返回值为形如 "(always (not (on b1 b4)))" 的字符串；若无法生成，返回 None。
    """
    objects_block = _extract_block(problem_text, 'objects')
    init_block    = _extract_block(problem_text, 'init')
    goal_block    = _extract_block(problem_text, 'goal')

    objs = _extract_objects(objects_block)
    init_on  = _extract_on_pairs(init_block)
    goal_on  = _extract_on_pairs(goal_block)

    # 1) 尝试对每个目标 (on x y) 生成逆 (on y x) 的禁止约束
    for (x, y) in goal_on:
        rev = (y, x)
        if rev not in init_on:  # 初始不为真，才能用 always not
            return f"(always (not (on {rev[0]} {rev[1]})))"

    # 2) 备选：挑选任一 (a,b) 使得 a!=b，且 (a,b) 不在 init/on-goal 中
    #        这样禁止它不会与目标直接冲突，也不会与初始真值冲突
    all_pairs = [(a, b) for a in objs for b in objs if a != b]
    for a, b in all_pairs:
        if (a, b) not in init_on and (a, b) not in goal_on:
            return f"(always (not (on {a} {b})))"

    # 如果连备选都找不到，返回 None（极少见，意味着所有成对关系要么是初始为真、要么在目标中）
    return None

def insert_constraints(problem_text: str, constraint_expr: Optional[str] = None) -> str:
    """
    将自动生成或指定的约束插入 problem.pddl 文本，形成 (:constraints ...) 段。
    - 若 constraint_expr 为 None：自动生成一条不冲突的安全约束。
    - 若已存在 (:constraints ...)：当前版本**不修改**原文，直接返回（避免合并多个 constraints 块的复杂性）。
      （需要合并时，可根据你的规划器语法实现对现有块的 AST 级合并）
    """
    # 已有 constraints 则直接返回（保守处理）
    if re.search(r'\(\s*:constraints\b', problem_text, flags=re.IGNORECASE):
        return problem_text

    # 自动生成约束
    if constraint_expr is None:
        constraint_expr = generate_safe_constraint(problem_text)
        if constraint_expr is None:
            raise ValueError("无法自动生成与 init/goal 兼容的安全约束。请提供自定义 constraint_expr。")

    # 估计缩进
    last_newline = problem_text.rfind('\n')
    indent = ""
    if last_newline != -1:
        tail = problem_text[last_newline+1:]
        m = re.match(r'(\s*)', tail)
        indent = m.group(1) if m else ""
    if not indent:
        indent = "  "

    constraints_block = (
        f"\n{indent}(:constraints\n"
        f"{indent}  {constraint_expr}\n"
        f"{indent})\n"
    )

    # 在 problem 顶层最后一个 ')' 前插入
    last_paren = problem_text.rfind(')')
    if last_paren == -1:
        raise ValueError("未找到 problem 的收尾右括号 ')'")
    return problem_text[:last_paren] + constraints_block + problem_text[last_paren:]

def convert_problem_to_pddl3(problem_file: str, output_dir: str = "problems_pddl3") -> bool:
    """
    将单个问题文件转换为PDDL3格式
    
    Args:
        problem_file: 输入问题文件路径
        output_dir: 输出目录
    
    Returns:
        bool: 是否成功转换
    """
    try:
        # 读取原始问题文件
        with open(problem_file, 'r') as f:
            problem_text = f.read()
        
        # 转换为PDDL3格式
        pddl3_text = insert_constraints(problem_text)
        
        # 生成输出文件名
        base_name = os.path.basename(problem_file)
        output_file = os.path.join(output_dir, base_name)
        
        # 写入PDDL3问题文件
        with open(output_file, 'w') as f:
            f.write(pddl3_text)
        
        return True
        
    except Exception as e:
        print(f"转换失败 {problem_file}: {e}")
        return False

def convert_all_problems(problems_dir: str = "problems", output_dir: str = "problems_pddl3"):
    """
    转换problems文件夹中的所有问题为PDDL3格式
    
    Args:
        problems_dir: 输入问题文件夹
        output_dir: 输出文件夹
    """
    # 清空并创建输出目录
    if os.path.exists(output_dir):
        shutil.rmtree(output_dir)
    os.makedirs(output_dir, exist_ok=True)
    
    # 获取所有PDDL问题文件
    problem_files = glob.glob(os.path.join(problems_dir, "*.pddl"))
    
    if not problem_files:
        print(f"在 {problems_dir} 文件夹中没有找到PDDL问题文件")
        return
    
    print(f"找到 {len(problem_files)} 个问题文件")
    print(f"开始转换为PDDL3格式...")
    print(f"输出目录: {output_dir}")
    print("-" * 50)
    
    successful = 0
    failed = 0
    
    for i, problem_file in enumerate(problem_files, 1):
        print(f"[{i}/{len(problem_files)}] 转换: {os.path.basename(problem_file)} ", end="")
        
        if convert_problem_to_pddl3(problem_file, output_dir):
            print("✓ 成功")
            successful += 1
        else:
            print("✗ 失败")
            failed += 1
    
    print("-" * 50)
    print(f"转换完成!")
    print(f"成功: {successful} 个")
    print(f"失败: {failed} 个")
    if successful + failed > 0:
        print(f"成功率: {successful/(successful+failed)*100:.1f}%")

if __name__ == "__main__":
    import sys
    
    # 可以通过命令行参数指定输入和输出目录
    problems_dir = sys.argv[1] if len(sys.argv) > 1 else "problems"
    output_dir = sys.argv[2] if len(sys.argv) > 2 else "problems_pddl3"
    
    convert_all_problems(problems_dir, output_dir)
