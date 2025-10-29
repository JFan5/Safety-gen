import re
import os
import glob
import shutil
from typing import Dict, List, Optional, Set, Tuple
# ==== 新增：基于 .soln 封锁一条路径边，同时保证仍可解 ====
from collections import deque

# === 新增：把“禁止跨边”写成 constraints 的构造器 ===
def _choose_truck_name(info) -> Optional[str]:
    trucks = sorted(info["trucks"])
    if not trucks:
        return None
    return "t1" if "t1" in trucks else trucks[0]

def constraints_forbid_edge_transition(problem_text: str,
                                       u: str, v: str,
                                       carrying_only: bool = False) -> List[str]:
    """生成禁止跨过无向边 u<->v 的 PDDL3 约束（基于 last + at）。"""
    info = _parse_delivery(problem_text)
    t = _choose_truck_name(info)
    if not t:
        return []
    if carrying_only:
        cons: List[str] = []
        for p in sorted(info["packages"]):
            cons.append(f"(always (not (and (carrying {t} {p}) (last {t} {u}) (at {t} {v}))))")
            cons.append(f"(always (not (and (carrying {t} {p}) (last {t} {v}) (at {t} {u}))))")
        return cons
    else:
        # 一条并列约束同时禁止 U→V 与 V→U
        return [(
            f"(always (and "
            f"(not (and (last {t} {u}) (at {t} {v}))) "
            f"(not (and (last {t} {v}) (at {t} {u})))"
            f"))"
        )]

# === 复用你已有的选边逻辑（基于解和 BFS） ===
# _choose_edge_to_block(problem_text, plan_text) 已在你代码中给出

# === 替换：convert_problem_to_pddl3（不再改 init，仅写 constraints） ===
def convert_problem_to_pddl3(problem_file: str, output_dir: str, plan_file: Optional[str] = None,
                             carrying_only: bool = False) -> bool:
    """
    将单个 delivery 问题文件转换为 PDDL3：
    1) 若有 .soln，挑一条原解用过且删去仍连通的边 u<->v；
    2) 在 (:constraints ...) 中写入“禁止跨过 u<->v”的约束（基于 last）；
    3) 若没找到安全边，则回退到你原先的 soft 约束策略（仍保证可解）。
    """
    try:
        with open(problem_file, 'r') as f:
            problem_text = f.read()

        plan_text: Optional[str] = None
        if plan_file and os.path.exists(plan_file):
            with open(plan_file, 'r') as pf:
                plan_text = pf.read()

        constraints_exprs: List[str] = []
        if plan_text:
            e = _choose_edge_to_block(problem_text, plan_text)  # 仍然用 BFS 验证可替换路径存在
            if e:
                u, v = e
                print(f"  约束封锁边: {u} <-> {v}")
                constraints_exprs = constraints_forbid_edge_transition(problem_text, u, v,
                                                                       carrying_only=carrying_only)
            else:
                print("  未找到可安全封锁的边，回退到软约束。")

        if not constraints_exprs:
            # 回退：用你之前的 waypoint / 载货禁入格等策略
            constraints_exprs = generate_delivery_constraints(problem_text, plan_text)

        pddl3_text = insert_constraints(problem_text, constraints_exprs)

        os.makedirs(output_dir, exist_ok=True)
        out_path = os.path.join(output_dir, os.path.basename(problem_file))
        with open(out_path, 'w') as f:
            f.write(pddl3_text)

        return True
    except Exception as e:
        print(f"转换失败 {problem_file}: {e}")
        return False


def _truck_start_cell(problem_text: str, info=None) -> Optional[str]:
    """找出卡车起点（优先 t1，否则取字典序最小的一辆）。"""
    if info is None:
        info = _parse_delivery(problem_text)
    trucks = sorted(info["trucks"])
    prefer = "t1" if "t1" in trucks else (trucks[0] if trucks else None)
    init_block = _extract_block(problem_text, 'init')
    for (x, c) in _atoms(init_block, 'at', 2):
        if prefer and x == prefer:
            return c
        if not prefer and x in info["trucks"]:
            return c
    return None


def _plan_edges(plan_text: str) -> List[Tuple[str, str]]:
    """抽取计划中出现过的所有 move 边（有向），作为 (from, to) 序列。"""
    if not plan_text:
        return []
    edges: List[Tuple[str, str]] = []
    # 允许卡车名任意，大小写不敏感
    for m in re.finditer(r'\(\s*move\s+[^\s()]+\s+([^\s()]+)\s+([^\s()]+)\s*\)', plan_text, flags=re.IGNORECASE):
        frm, to = m.group(1), m.group(2)
        edges.append((frm, to))
    return edges


def _plan_edges_while_carrying(plan_text: str) -> Set[frozenset]:
    """只收集“载货期间”的无向边集合。"""
    if not plan_text:
        return set()
    edges: Set[frozenset] = set()
    carrying = False
    for line in plan_text.splitlines():
        line = line.strip()
        if not line:
            continue
        if re.match(r'\(\s*pick-package\b', line, flags=re.IGNORECASE):
            carrying = True
            continue
        if re.match(r'\(\s*drop-package\b', line, flags=re.IGNORECASE):
            carrying = False
            continue
        m = re.match(r'\(\s*move\s+[^\s()]+\s+([^\s()]+)\s+([^\s()]+)\s*\)', line, flags=re.IGNORECASE)
        if m and carrying:
            frm, to = m.group(1), m.group(2)
            edges.add(frozenset((frm, to)))
    return edges


def _required_cells_for_feasibility(problem_text: str, info=None) -> Set[str]:
    """可解性判定所需同时可达的点集合：truck 起点 + 所有包裹起点 + 所有（合取式）目标格。"""
    if info is None:
        info = _parse_delivery(problem_text)
    required: Set[str] = set()
    t0 = _truck_start_cell(problem_text, info)
    if t0:
        required.add(t0)
    required.update(info["pkg_init"].values())
    for s in info["pkg_goals"].values():
        required.update(s)
    return required


def _reachable_after_removing_edge(G: Dict[str, Set[str]],
                                   start: Optional[str],
                                   banned: Optional[frozenset]) -> Set[str]:
    """在删去 banned 边后，从 start 的可达集合。"""
    vis: Set[str] = set()
    if not start:
        return vis
    dq = deque([start])
    vis.add(start)
    while dq:
        u = dq.popleft()
        for v in G.get(u, []):
            if banned and frozenset((u, v)) == banned:
                continue
            if v not in vis:
                vis.add(v)
                dq.append(v)
    return vis


def _choose_edge_to_block(problem_text: str, plan_text: str) -> Optional[Tuple[str, str]]:
    """
    在原解的路径里选一条“删去后仍可解”的边：
    1) 优先选“载货期间”的边；若无，再考虑全部 move 边；
    2) 用 BFS 判定删边后所有必要格是否仍与卡车起点连通。
    """
    if not plan_text:
        return None
    info = _parse_delivery(problem_text)
    init_block = _extract_block(problem_text, 'init')
    G = _adj_map(init_block)
    start = _truck_start_cell(problem_text, info)
    required = _required_cells_for_feasibility(problem_text, info)

    # 候选池：载货边优先；其后补全为所有 plan 边
    pool: List[Tuple[str, str]] = []
    seen: Set[Tuple[str, str]] = set()

    for e in _plan_edges_while_carrying(plan_text):
        u, v = tuple(e)
        key = tuple(sorted((u, v)))
        if key not in seen:
            pool.append(key)
            seen.add(key)

    for frm, to in _plan_edges(plan_text):
        key = tuple(sorted((frm, to)))
        if key not in seen:
            pool.append(key)
            seen.add(key)

    for u, v in pool:
        # 必须原图中确有此无向边
        if u not in G or v not in G or v not in G[u]:
            continue
        vis = _reachable_after_removing_edge(G, start, frozenset((u, v)))
        if required.issubset(vis):
            return (u, v)
    return None


def _remove_adjacent_edge_in_init(problem_text: str, u: str, v: str) -> str:
    """从 (:init ...) 中移除 (adjacent u v) 与 (adjacent v u) 两条事实。"""
    init_block = _extract_block(problem_text, 'init')
    if not init_block:
        return problem_text
    patt_uv = re.compile(r'\(\s*adjacent\s+' + re.escape(u) + r'\s+' + re.escape(v) + r'\s*\)', flags=re.IGNORECASE)
    patt_vu = re.compile(r'\(\s*adjacent\s+' + re.escape(v) + r'\s+' + re.escape(u) + r'\s*\)', flags=re.IGNORECASE)
    new_init = patt_uv.sub('', init_block)
    new_init = patt_vu.sub('', new_init)
    return problem_text.replace(init_block, new_init)


def _block_one_edge_from_solution(problem_text: str,
                                  plan_text: Optional[str]) -> Tuple[str, Optional[Tuple[str, str]]]:
    """若可行，则删去原解中的一条边并返回新 problem 文本与被删边；否则原样返回。"""
    if not plan_text:
        return problem_text, None
    e = _choose_edge_to_block(problem_text, plan_text)
    if not e:
        return problem_text, None
    u, v = e
    new_problem = _remove_adjacent_edge_in_init(problem_text, u, v)
    return new_problem, (u, v)
# ==== 新增结束 ====




# --------- delivery 扩展：邻接/载货解析（NEW）---------
def _adj_map(init_block: Optional[str]) -> Dict[str, Set[str]]:
    """从 (:init ...) 抽取无向邻接图"""
    edges: Dict[str, Set[str]] = {}
    for (a, b) in _atoms(init_block, 'adjacent', 2):
        edges.setdefault(a, set()).add(b)
    # 对称化（有些生成器已双向写，这里再保险一下）
    undirected: Dict[str, Set[str]] = {}
    for u, vs in edges.items():
        undirected.setdefault(u, set()).update(vs)
        for v in vs:
            undirected.setdefault(v, set()).add(u)
    return undirected


def constraints_no_go_cell(cell: str) -> list[str]:
    return [f"(always (not (at t1 {cell})))"]

def _carrying_cells_from_plan(plan_text: str) -> Set[str]:
    """
    收集“载货时卡车出现过”的所有格子。
    基于 (pick-package ... x) 与 (drop-package ... x) 这两端之间的 move 段。
    """
    if not plan_text:
        return set()
    # 简单解析：抽出三类动作，按顺序重放
    tokens = []
    for line in plan_text.splitlines():
        line = line.strip().lower()
        if not line:
            continue
        m = re.match(r'\(\s*(move)\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s*\)', line)
        if m:
            tokens.append(('move', m.group(2), m.group(3), m.group(4)))
            continue
        m = re.match(r'\(\s*(pick-package)\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s*\)', line)
        if m:
            tokens.append(('pick', m.group(2), m.group(3), m.group(4)))
            continue
        m = re.match(r'\(\s*(drop-package)\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s*\)', line)
        if m:
            tokens.append(('drop', m.group(2), m.group(3), m.group(4)))
            continue

    carrying = False
    carrying_cells: Set[str] = set()
    # 载货期间：包含当下 truck 所在格，后继 move 的 to 格，以及 drop 时的格
    current_cell: Optional[str] = None
    # 尝试从第一条 move 还原卡车起点
    for t in tokens:
        if t[0] == 'move':
            current_cell = t[2]  # from
            break
    # 若 plan 第一条就是 pick，则起点由 pick 的 x 给出
    if current_cell is None:
        for t in tokens:
            if t[0] == 'pick':
                current_cell = t[3]
                break

    for t in tokens:
        if t[0] == 'pick':
            carrying = True
            current_cell = t[3]
            carrying_cells.add(current_cell)
        elif t[0] == 'drop':
            carrying_cells.add(t[3])
            carrying = False
        elif t[0] == 'move':
            # t: ('move', t1, from, to)
            frm, to = t[2], t[3]
            if carrying:
                carrying_cells.add(frm)
                carrying_cells.add(to)
            current_cell = to
    return carrying_cells

def _pick_bottleneck_cell_for_carry(problem_text: str, plan_text: str) -> Optional[str]:
    """
    从原计划中挑一个“载货经过”的候选格，要求其邻接度 >= 2（便于改道）。
    选取启发：出现频次最高的载货格（若频次不可得，用集合近似）。
    """
    if not plan_text:
        return None
    init_block = _extract_block(problem_text, 'init')
    G = _adj_map(init_block)
    carrying_cells = _carrying_cells_from_plan(plan_text)
    # 过滤出度 >= 2 的格
    candidates = [c for c in carrying_cells if len(G.get(c, [])) >= 2]
    if not candidates:
        return None
    # 简化：选字典序最小，或你也可以在 _carrying_cells_from_plan 里统计频次
    return sorted(candidates)[0]


def constraints_no_go_while_carrying(cell: str, packages: Set[str]) -> List[str]:
    """
    生成“载货不得进入 cell”的安全约束，逐包裹展开：
      (always (not (and (carrying t1 p) (at t1 cell))))
    这样避免使用 implies/or，兼容性最好。
    """
    cons = []
    for p in sorted(packages):
        cons.append(f"(always (not (and (carrying t1 {p}) (at t1 {cell}))))")
    return cons

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


def _packages_carry_path(plan_text: str) -> Dict[str, Set[str]]:
    tokens = []
    for line in plan_text.splitlines():
        line = line.strip().lower()
        if not line:
            continue
        m = re.match(r'\(\s*(move)\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s*\)', line)
        if m:
            tokens.append(('move', m.group(2), m.group(3), m.group(4))); continue
        m = re.match(r'\(\s*(pick-package)\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s*\)', line)
        if m:
            tokens.append(('pick', m.group(2), m.group(3), m.group(4))); continue
        m = re.match(r'\(\s*(drop-package)\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s*\)', line)
        if m:
            tokens.append(('drop', m.group(2), m.group(3), m.group(4))); continue

    # 这里 token 约定：
    # ('pick', truck, package, cell)
    # ('drop', truck, package, cell)
    # ('move', truck, from, to)
    carrying: Optional[str] = None  # 当前携带的包名
    paths: Dict[str, Set[str]] = {}
    current_cell: Optional[str] = None
    for t in tokens:
        if t[0] == 'move':
            current_cell = t[2]; break
    if current_cell is None:
        for t in tokens:
            if t[0] == 'pick':
                current_cell = t[3]; break

    for t in tokens:
        if t[0] == 'pick':
            p = t[2]
            carrying = p
            current_cell = t[3]
            paths.setdefault(p, set()).add(current_cell)
        elif t[0] == 'drop':
            p = t[2]
            paths.setdefault(p, set()).add(t[3])
            carrying = None
        elif t[0] == 'move' and carrying is not None:
            frm, to = t[2], t[3]
            paths.setdefault(carrying, set()).update([frm, to])
            current_cell = to
    return paths


def generate_delivery_constraints(problem_text: str, plan_text: Optional[str] = None) -> List[str]:
    info = _parse_delivery(problem_text)
    all_cells  = sorted(info["cells"])

    # 策略 A：禁入瓶颈格（最简单、最硬）
    if plan_text:
        bn_cell = _pick_bottleneck_cell_for_carry(problem_text, plan_text)
        if bn_cell:
            return constraints_no_go_cell(bn_cell)

    # 策略 B：兜底 waypoint（保持可解但更弱）
    visited: Set[str] = set()
    if plan_text:
        visited |= _parse_plan_cells(plan_text)
        init_block = _extract_block(problem_text, 'init')
        for (x, c) in _atoms(init_block, 'at', 2):
            if x in info["trucks"]:
                visited.add(c)
    waypoint = next((c for c in all_cells if c not in visited), None)
    if waypoint:
        return [f"(sometime (at t1 {waypoint}))"]

    if all_cells:
        return [f"(sometime (at t1 {all_cells[0]}))"]
    return []

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
