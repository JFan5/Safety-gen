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
def _parse_plan_cells(plan_text: str) -> Set[str]:
    """从 .soln 计划中抽取卡车经过/出现的格子集合。"""
    cells: Set[str] = set()
    # move: (move t1 c_from c_to)
    for m in re.finditer(r"\(\s*move\s+t1\s+([^\s()]+)\s+([^\s()]+)\s*\)", plan_text, flags=re.IGNORECASE):
        c1, c2 = m.group(1), m.group(2)
        cells.add(c1)
        cells.add(c2)
    # pick/drop: include the referenced cell
    for m in re.finditer(r"\(\s*(pick-package|drop-package)\s+t1\s+[^\s()]+\s+([^\s()]+)\s*\)", plan_text, flags=re.IGNORECASE):
        cells.add(m.group(2))
    return cells


def generate_delivery_constraints(problem_text: str, plan_text: Optional[str] = None) -> List[str]:
    """
    生成满足以下要求的 PDDL3 约束（不含外层 (:constraints ...)）：
      1) 加入约束后问题仍可解（存在绕行/插入访问的解）。
      2) 约束生效：原有 PDDL2 的解（.soln）不再满足（因缺少某个轨迹要求）。

    实现：
      - 选择一个“路标”格子 w，使其不在原解行经的格子集合中；
      - 插入 (sometime (at t1 w))，强制卡车在某时访问 w；
      - 栅格联通可保证通常可通过绕行满足该约束，从而仍可解。
    """
    info = _parse_delivery(problem_text)
    all_cells  = sorted(info["cells"])

    visited: Set[str] = set()
    if plan_text:
        visited |= _parse_plan_cells(plan_text)
        # 也把初始卡车位置加入访问集，避免选到已满足的状态
        init_block = _extract_block(problem_text, 'init')
        for (x, c) in _atoms(init_block, 'at', 2):
            if x in info["trucks"]:
                visited.add(c)

    # 挑一个原计划未访问过的格子
    waypoint = next((c for c in all_cells if c not in visited), None)

    constraints: List[str] = []
    if waypoint:
        constraints.append(f"(sometime (at t1 {waypoint}))")
        return constraints

    # 兜底：若未找到（极少见，路径覆盖全部格），退化选择任一格，仍插入 sometime（可能无效）。
    # 为保持“仍可解”，不使用 always-not 类约束。
    if all_cells:
        constraints.append(f"(sometime (at t1 {all_cells[0]}))")
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
def convert_problem_to_pddl3(problem_file: str, output_dir: str, plan_file: Optional[str] = None) -> bool:
    """
    将单个 delivery 问题文件转换为 PDDL3（在 problem 里插入 (:constraints ...)）。
    """
    try:
        with open(problem_file, 'r') as f:
            problem_text = f.read()
        plan_text: Optional[str] = None
        if plan_file and os.path.exists(plan_file):
            with open(plan_file, 'r') as pf:
                plan_text = pf.read()

        pddl3_text = insert_constraints(problem_text, generate_delivery_constraints(problem_text, plan_text))

        os.makedirs(output_dir, exist_ok=True)
        out_path = os.path.join(output_dir, os.path.basename(problem_file))
        with open(out_path, 'w') as f:
            f.write(pddl3_text)

        return True
    except Exception as e:
        print(f"转换失败 {problem_file}: {e}")
        return False


def convert_all_problems(input_dir: str, output_dir: str):
    """批量转换目录下的 *.pddl 为带 constraints 的 PDDL3 问题文件（若同名 .soln 存在则利用其阻断原解）。"""
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
        base, _ = os.path.splitext(path)
        plan_path = base + ".soln"
        if convert_problem_to_pddl3(path, output_dir, plan_path):
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
        print("用法: python convert_pddl3.py <输入目录> [输出目录]")
        print("示例: python convert_pddl3.py all_problems/training all_problems/training_pddl3")
        sys.exit(1)

    input_dir = sys.argv[1]
    output_dir = sys.argv[2] if len(sys.argv) > 2 else f"{input_dir}_pddl3"

    convert_all_problems(input_dir, output_dir)
