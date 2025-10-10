import re
import os
import glob
import shutil
from typing import Dict, List, Optional, Set, Tuple


# --------- 基础解析工具 ---------
def _extract_block(text: str, key: str) -> Optional[str]:
    """提取 (:key ...) 顶层块，使用括号计数确保闭合。"""
    m = re.search(rf'\(\s*:{re.escape(key)}\b', text, flags=re.IGNORECASE)
    if not m:
        return None
    start = m.start()
    depth = 0
    for i, ch in enumerate(text[start:], start=start):
        if ch == '(':
            depth += 1
        elif ch == ')':
            depth -= 1
            if depth == 0:
                return text[start:i+1]
    return None


def _atoms(block: Optional[str], pred: str, arity: int) -> List[Tuple[str, ...]]:
    """从块中抽取指定谓词（arity 元），返回元组列表。"""
    if not block:
        return []
    # e.g. (at x y) / (empty t1)
    pattern = r'\(\s*' + re.escape(pred) + ''.join([r'\s+([^\s()]+)'] * arity) + r'\s*\)'
    return [tuple(m.groups()) for m in re.finditer(pattern, block, flags=re.IGNORECASE)]


def _parse_typed_objects(objects_block: Optional[str]) -> Dict[str, List[str]]:
    """
    解析 (:objects ...) 中的带类型对象，返回 {type_name: [obj,...]}。
    兼容多行/多段格式： obj1 obj2 - typeA   obj3 - typeB ...
    """
    result: Dict[str, List[str]] = {}
    if not objects_block:
        return result

    # 把内容 token 化（去括号/空白），保留 '-' 与标识符
    tokens = re.findall(r'[^\s()]+', objects_block)

    # 去掉前缀 ':objects'
    if tokens and tokens[0].lower() == ':objects':
        tokens = tokens[1:]

    buf: List[str] = []
    i = 0
    while i < len(tokens):
        tok = tokens[i]
        if tok == '-':
            # buf 里积累的是该类型前的所有对象
            if i + 1 >= len(tokens):
                break  # 异常：'-' 后没有类型名
            typ = tokens[i + 1]
            if buf:
                result.setdefault(typ, []).extend(buf)
            buf = []
            i += 2
        else:
            buf.append(tok)
            i += 1

    # 若最后还有未归类的对象（标准 PDDL 不会出现），忽略或可按需默认类型处理
    return result



# --------- delivery 专用抽取 ---------
def _parse_delivery(problem_text: str):
    objs_block  = _extract_block(problem_text, 'objects')
    init_block  = _extract_block(problem_text, 'init')
    goal_block  = _extract_block(problem_text, 'goal')

    typed_objs = _parse_typed_objects(objs_block)
    cells:    Set[str] = set(typed_objs.get('cell', []))
    trucks:   Set[str] = set(typed_objs.get('truck', []))
    packages: Set[str] = set(typed_objs.get('package', []))

    # 初始位置：at
    init_at = {(x, c) for (x, c) in _atoms(init_block, 'at', 2)}
    # 目标位置（仅对包裹）
    goal_ats = [(x, c) for (x, c) in _atoms(goal_block, 'at', 2) if x in packages]

    # 建立便于查询的映射
    pkg_init: Dict[str, str] = {}
    for (x, c) in init_at:
        if x in packages:
            pkg_init[x] = c

    pkg_goals: Dict[str, Set[str]] = {}
    for (x, c) in goal_ats:
        pkg_goals.setdefault(x, set()).add(c)

    return {
        "cells": cells,
        "trucks": trucks,
        "packages": packages,
        "pkg_init": pkg_init,
        "pkg_goals": pkg_goals,
    }


# --------- 约束生成器（delivery）---------
def generate_delivery_constraints(problem_text: str) -> List[str]:
    """
    为 delivery 问题自动生成一组不与 init/goal 冲突的 PDDL3 约束（不含外层 (:constraints ...)）。
    策略（优先）：
      对每个包裹 p，选择一个 c_avoid，使 c_avoid != init(p) 且 c_avoid 不在 p 的任何目标集合，
      添加 (always (not (at p c_avoid))).
    若所有包裹都找不到可用 c_avoid（极少见），退化为：
      对每个 (truck t, package p) 加 (at-most-once (carrying t p)).
    """
    info = _parse_delivery(problem_text)
    cells     = sorted(info["cells"])
    trucks    = sorted(info["trucks"])
    packages  = sorted(info["packages"])
    pkg_init  = info["pkg_init"]
    pkg_goals = info["pkg_goals"]

    constraints: List[str] = []

    # A) 为每个包裹挑一个不相关格子作为禁止落点
    for p in packages:
        init_c = pkg_init.get(p)
        goals  = pkg_goals.get(p, set())
        # 挑一个既非初始也非目标的格子
        avoid_c = next((c for c in cells if c != init_c and c not in goals), None)
        if avoid_c:
            constraints.append(f"(always (not (at {p} {avoid_c})))")

    if constraints:
        return constraints

    # B) 退化：限制每个包裹最多被拾起一次（通常可满足）
    if trucks and packages:
        for t in trucks:
            for p in packages:
                constraints.append(f"(at-most-once (carrying {t} {p}))")

    return constraints


# --------- 插入器（自动包 and）---------
def insert_constraints(problem_text: str,
                       constraints_exprs: Optional[List[str]] = None) -> str:
    """
    将若干条约束表达式插入 problem 文本为 (:constraints ...)。若已有约束块则不改动。
    自动在多条约束时用 (and ...) 包裹。
    """
    if re.search(r'\(\s*:constraints\b', problem_text, flags=re.IGNORECASE):
        return problem_text

    if constraints_exprs is None:
        constraints_exprs = generate_delivery_constraints(problem_text)

    if not constraints_exprs:
        raise ValueError("无法自动生成与 init/goal 兼容的安全约束。")

    # 估计缩进
    last_newline = problem_text.rfind('\n')
    indent = ""
    if last_newline != -1:
        tail = problem_text[last_newline+1:]
        m = re.match(r'(\s*)', tail)
        indent = m.group(1) if m else ""
    if not indent:
        indent = "  "

    # 多条约束 -> (and ...)
    if len(constraints_exprs) == 1:
        inner = f"{indent}  {constraints_exprs[0]}"
    else:
        inner_lines = "\n".join(f"{indent}    {c}" for c in constraints_exprs)
        inner = f"{indent}  (and\n{inner_lines}\n{indent}  )"

    block = f"\n{indent}(:constraints\n{inner}\n{indent})\n"

    last_paren = problem_text.rfind(')')
    if last_paren == -1:
        raise ValueError("未找到 problem 的收尾右括号 ')'.")
    return problem_text[:last_paren] + block + problem_text[last_paren:]


# --------- 转换函数 ---------
def convert_problem_to_pddl3(problem_file: str, output_dir: str) -> bool:
    """
    将单个 delivery 问题文件转换为 PDDL3（在 problem 里插入 (:constraints ...)）。
    """
    try:
        with open(problem_file, 'r') as f:
            problem_text = f.read()

        pddl3_text = insert_constraints(problem_text)

        os.makedirs(output_dir, exist_ok=True)
        out_path = os.path.join(output_dir, os.path.basename(problem_file))
        with open(out_path, 'w') as f:
            f.write(pddl3_text)

        return True
    except Exception as e:
        print(f"转换失败 {problem_file}: {e}")
        return False


def convert_all_problems(input_dir: str, output_dir: str):
    """批量转换目录下的 *.pddl 为带 constraints 的 PDDL3 问题文件。"""
    if not os.path.exists(input_dir):
        print(f"错误: 输入目录 {input_dir} 不存在")
        return

    # 清空目标目录
    if os.path.exists(output_dir):
        shutil.rmtree(output_dir)
    os.makedirs(output_dir, exist_ok=True)
    files = glob.glob(os.path.join(input_dir, "*.pddl"))
    if not files:
        print(f"在 {input_dir} 中未找到 .pddl 文件")
        return

    ok, fail = 0, 0
    for i, path in enumerate(files, 1):
        print(f"[{i}/{len(files)}] {os.path.basename(path)} ... ", end="")
        if convert_problem_to_pddl3(path, output_dir):
            print("✓")
            ok += 1
        else:
            print("✗")
            fail += 1
    print(f"完成：成功 {ok}，失败 {fail}")


# ----------------- CLI -----------------
if __name__ == "__main__":
    import sys

    if len(sys.argv) < 2:
        print("用法: python transfer_to_pddl3.py <输入目录> [输出目录]")
        print("示例: python transfer_to_pddl3.py problems problems_pddl3")
        print("       python transfer_to_pddl3.py A A_pddl3")
        sys.exit(1)

    input_dir = sys.argv[1]
    output_dir = sys.argv[2] if len(sys.argv) > 2 else f"{input_dir}_pddl3"

    convert_all_problems(input_dir, output_dir)
