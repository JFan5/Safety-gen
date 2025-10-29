import os
import re
import glob
import shlex
import shutil
import tempfile
import subprocess
from dataclasses import dataclass
from collections import Counter
from typing import Dict, List, Optional, Set, Tuple

# -----------------------------
# 基础解析工具
# -----------------------------

def _extract_block(text: str, key: str) -> Optional[str]:
    """提取顶层 (:key ...) 块，保证括号配对。"""
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
    """在某个块中提取 (pred a1 ... arity) 的所有匹配。"""
    if not block:
        return []
    pat = r'\(\s*' + re.escape(pred) + ''.join([r'\s+([^\s()]+)'] * arity) + r'\s*\)'
    return [tuple(m.groups()) for m in re.finditer(pat, block, flags=re.IGNORECASE)]

def _insert_constraints(problem_text: str, constraints_exprs: List[str]) -> str:
    """将约束写入 problem（若已有 :constraints 则并入 (and ...)；否则在结尾前注入一个块）。"""
    cblk = _extract_block(problem_text, 'constraints')
    if cblk:
        # 合并为 (and ...)
        hdr_end = cblk.find(')')  # 第一个 ')'，在 ':constraints' 后
        if hdr_end == -1:
            return problem_text
        body = cblk[hdr_end+1:-1].strip()
        parts = []
        if body:
            parts.append(body)
        parts.extend(constraints_exprs)
        new_body = '(and ' + ' '.join(parts) + ')'
        new_cblk = cblk[:hdr_end+1] + '\n  ' + new_body + '\n)'
        return problem_text.replace(cblk, new_cblk)

    # 无约束：新建
    inner = constraints_exprs[0] if len(constraints_exprs) == 1 else f"(and {' '.join(constraints_exprs)})"
    block = f"\n(:constraints\n  {inner}\n)\n"
    last_paren = problem_text.rfind(')')
    if last_paren == -1:
        raise ValueError("problem 结尾缺少 ')'")
    return problem_text[:last_paren] + block + problem_text[last_paren:]


# -----------------------------
# Grid 域解析
# -----------------------------

@dataclass
class GridInstance:
    places: Set[str]
    open_cells: Set[str]
    locked_cells: Set[str]
    conn: Dict[str, Set[str]]                # 无向
    key_pos: Dict[str, str]                  # key -> cell
    key_shape: Dict[str, str]                # key -> shape
    lock_shape: Dict[str, str]               # cell -> shape
    start: Optional[str]                     # 机器人起点
    goals: Dict[str, str]                    # key -> goal cell

def parse_grid_instance(problem_text: str) -> GridInstance:
    init = _extract_block(problem_text, 'init')
    goal = _extract_block(problem_text, 'goal')

    places = {p for (p,) in _atoms(init, 'place', 1)}
    open_cells = {p for (p,) in _atoms(init, 'open', 1)}
    locked_cells = {p for (p,) in _atoms(init, 'locked', 1)}

    # 邻接（无向）
    conn_pairs = _atoms(init, 'conn', 2)
    conn: Dict[str, Set[str]] = {}
    for u, v in conn_pairs:
        conn.setdefault(u, set()).add(v)
        conn.setdefault(v, set()).add(u)

    # 起点
    start = None
    ats_robot = _atoms(init, 'at-robot', 1)
    if ats_robot:
        start = ats_robot[0][0]

    # 钥匙位置与形状
    key_objs = {k for (k,) in _atoms(init, 'key', 1)}
    at_pairs = _atoms(init, 'at', 2)  # (at key cell)
    key_pos = {k: c for (k, c) in at_pairs if k in key_objs}

    key_shape = {k: s for (k, s) in _atoms(init, 'key-shape', 2)}
    lock_shape = {x: s for (x, s) in _atoms(init, 'lock-shape', 2)}

    # 目标 (at key cell)
    goals_raw = _atoms(goal, 'at', 2)
    goals = {k: c for (k, c) in goals_raw if k in key_objs}

    return GridInstance(
        places=places,
        open_cells=open_cells,
        locked_cells=locked_cells,
        conn=conn,
        key_pos=key_pos,
        key_shape=key_shape,
        lock_shape=lock_shape,
        start=start,
        goals=goals
    )


# -----------------------------
# 计划解析（Grid）
# -----------------------------

def cells_from_plan_counts(plan_text: str) -> Counter:
    """
    统计旧解中出现过的所有“位置”及其出现次数。
    解析以下动作：
      (move from to)
      (pickup curpos key)
      (pickup-and-loose curpos newkey oldkey)
      (putdown curpos key)
      (unlock curpos lockpos key shape)   ; curpos 需要 at-robot
    """
    C = Counter()
    if not plan_text:
        return C

    for line in plan_text.splitlines():
        t = line.strip().lower()
        if not t or t.startswith(';'):
            continue

        # move
        m = re.match(r'\(\s*move\s+([^\s()]+)\s+([^\s()]+)\s*\)', t, re.IGNORECASE)
        if m:
            C[m.group(1)] += 1
            C[m.group(2)] += 1
            continue

        # pickup / putdown / pickup-and-loose
        m = re.match(r'\(\s*pickup(?:-and-loose)?\s+([^\s()]+)\s+[^\s()]+\s*(?:[^\s()]*)\s*\)', t, re.IGNORECASE)
        if m:
            C[m.group(1)] += 1
            continue

        m = re.match(r'\(\s*putdown\s+([^\s()]+)\s+[^\s()]+\s*\)', t, re.IGNORECASE)
        if m:
            C[m.group(1)] += 1
            continue

        # unlock：curpos、lockpos 都出现；curpos 需要 at-robot
        m = re.match(r'\(\s*unlock\s+([^\s()]+)\s+([^\s()]+)\s+[^\s()]+\s+[^\s()]+\s*\)', t, re.IGNORECASE)
        if m:
            C[m.group(1)] += 1  # curpos（一定需要 at-robot）
            C[m.group(2)] += 1  # lockpos（之后可能会进入）
            continue

    return C


# -----------------------------
# 启发式可解性检查（无 planner）
# -----------------------------

def _reachable_open(graph: Dict[str, Set[str]], opens: Set[str], start: Optional[str], banned: str) -> Set[str]:
    if start is None or start not in opens or start == banned:
        return set()
    banned = banned.lower()
    seen: Set[str] = set([start])
    stack = [start]
    while stack:
        u = stack.pop()
        for v in graph.get(u, []):
            if v in seen: continue
            if v not in opens: continue
            if v.lower() == banned: continue
            seen.add(v); stack.append(v)
    return seen

def heuristic_still_solvable(inst: GridInstance, banned_cell: str) -> bool:
    """保守近似：仅基于初始 open 图 + 解锁可邻近条件判定；若 banned 即为某个目标位，直接判不可解。"""
    banned_cell = banned_cell.lower()
    if inst.start is None: return False
    if inst.start.lower() == banned_cell: return False

    # 如果禁入的是任何 goal cell，直接不可解（putdown 需要驻留目标格）
    if banned_cell in {g.lower() for g in inst.goals.values()}:
        return False

    # 起点必须 open
    if inst.start not in inst.open_cells:
        return False

    R = _reachable_open(inst.conn, inst.open_cells - {banned_cell}, inst.start, banned_cell)

    for k, g in inst.goals.items():
        # 钥匙起点必须可达
        kpos = inst.key_pos.get(k)
        if not kpos or kpos not in R:
            return False

        # 目标位：open / locked
        if g in inst.open_cells:
            if g not in R:
                return False
        elif g in inst.locked_cells:
            # 形状匹配 + 能靠近 g 的某个 open 邻居
            s_k = inst.key_shape.get(k)
            s_l = inst.lock_shape.get(g)
            if not s_k or not s_l or s_k != s_l:
                return False
            nghs = [n for n in inst.conn.get(g, []) if n in R]
            if not nghs:
                return False
        else:
            return False

    return True


# -----------------------------
# Planner 检查（可选）
# -----------------------------

def planner_has_solution(domain_file: str,
                         problem_text: str,
                         planner_cmd: str,
                         timeout: int = 30) -> bool:
    """
    运行外部 planner，返回是否“找到解”。planner_cmd 中可用占位：
      {domain} {problem} {plan}
    """
    with tempfile.TemporaryDirectory() as td:
        pb = os.path.join(td, "pb.pddl")
        plan_path = os.path.join(td, "plan.out")
        with open(pb, 'w', encoding='utf-8') as f:
            f.write(problem_text)
        cmd = planner_cmd.format(domain=domain_file, problem=pb, plan=plan_path)
        try:
            proc = subprocess.run(
                cmd if isinstance(cmd, str) else shlex.join(cmd),
                shell=True, capture_output=True, text=True, timeout=timeout
            )
        except subprocess.TimeoutExpired:
            return False

        # 若产生计划文件，或返回码 0 且输出含 found/solution 关键词，就算成功
        if os.path.exists(plan_path) and os.path.getsize(plan_path) > 0:
            return True
        if proc.returncode == 0:
            s = (proc.stdout or "") + "\n" + (proc.stderr or "")
            if re.search(r'found.*plan|solution', s, re.IGNORECASE):
                return True
        return False


# -----------------------------
# 自动选择“危险格”并转换
# -----------------------------

def pick_banned_cell_auto(inst: GridInstance,
                          plan_text: str,
                          max_candidates: int = 16) -> List[str]:
    """
    生成候选禁入格列表（按“出现频次 desc, 度数 desc”排序），并做基本过滤：
      - 排除：起点、所有 goal 位置、所有钥匙初始位置
      - 仅保留：确实在 plan 中出现过、且属于实例的 place
    """
    counts = cells_from_plan_counts(plan_text)
    if not counts:
        return []

    goals_set = set(inst.goals.values())
    key_cells = set(inst.key_pos.values())
    forbid = set()
    if inst.start:
        forbid.add(inst.start)
    forbid |= goals_set
    forbid |= key_cells

    # 仅考虑实例中的 place；去掉禁止集合
    candidates = [c for c in counts.keys() if c in inst.places and c not in forbid]

    # 计算度数
    deg = {c: len(inst.conn.get(c, set())) for c in candidates}

    # 排序：频次 desc -> 度数 desc -> 名字
    candidates.sort(key=lambda c: (counts[c], deg.get(c, 0), c), reverse=True)

    # 限制数量
    return candidates[:max_candidates]


def transform_one_auto(problem_path: str,
                       soln_path: str,
                       out_dir: str,
                       domain_file: Optional[str] = None,
                       planner_cmd: Optional[str] = None,
                       timeout: int = 30,
                       max_candidates: int = 16) -> bool:
    """
    自动挑选一个“危险格”注入约束；若保持可解则写出新 problem 并返回 True；否则跳过 False。
    """
    if not os.path.exists(problem_path) or not os.path.exists(soln_path):
        return False

    ptxt = open(problem_path, 'r', encoding='utf-8').read()
    stxt = open(soln_path, 'r', encoding='utf-8').read()

    inst = parse_grid_instance(ptxt)
    candidate_cells = pick_banned_cell_auto(inst, stxt, max_candidates=max_candidates)
    if not candidate_cells:
        return False

    for cell in candidate_cells:
        cons = [f"(always (not (at-robot {cell})))"]
        ptxt_new = _insert_constraints(ptxt, cons)

        # 检查仍可解
        ok = False
        if domain_file and planner_cmd:
            ok = planner_has_solution(domain_file, ptxt_new, planner_cmd, timeout=timeout)
        else:
            ok = heuristic_still_solvable(inst, cell)

        if ok:
            # 成功：写出并返回
            os.makedirs(out_dir, exist_ok=True)
            out_path = os.path.join(out_dir, os.path.basename(problem_path))
            with open(out_path, 'w', encoding='utf-8') as f:
                f.write(ptxt_new)
            print(f"  ✓ 选用危险格：{cell}")
            return True
        else:
            print(f"  × 放弃候选：{cell}（不可解）")

    # 所有候选均不可用 → 跳过
    return False


# -----------------------------
# 批量入口
# -----------------------------

def main():
    import argparse
    ap = argparse.ArgumentParser(description="Grid：自动注入 PDDL3 安全约束（禁入某一格），确保打掉旧解但仍可解。")
    ap.add_argument("input_dir", help="输入目录（含 *.pddl 与同名 *.soln）")
    ap.add_argument("output_dir", help="输出目录")
    ap.add_argument("--domain", dest="domain_file", default=None, help="域文件（用于 planner 验证）")
    ap.add_argument("--planner-cmd", dest="planner_cmd", default=None,
                    help="外部 planner 命令（可用 {domain} {problem} {plan}）")
    ap.add_argument("--timeout", type=int, default=30, help="planner 超时（秒）")
    ap.add_argument("--max-candidates", type=int, default=16, help="最多尝试多少候选危险格")
    args = ap.parse_args()

    inp = args.input_dir
    outp = args.output_dir
    if os.path.exists(outp):
        shutil.rmtree(outp)
    os.makedirs(outp, exist_ok=True)

    problems = sorted(glob.glob(os.path.join(inp, "*.pddl")))
    if not problems:
        print(f"[!] 未在 {inp} 找到 .pddl")
        return

    kept, skipped = 0, 0
    for i, p in enumerate(problems, 1):
        base, _ = os.path.splitext(p)
        s = base + ".soln"
        tag = os.path.basename(p)
        print(f"[{i}/{len(problems)}] {tag}")
        ok = transform_one_auto(
            p, s, outp,
            domain_file=args.domain_file,
            planner_cmd=args.planner_cmd,
            timeout=args.timeout,
            max_candidates=args.max_candidates
        )
        if ok:
            kept += 1
            print("    -> 保留（已加约束）")
        else:
            skipped += 1
            print("    -> 跳过")
    print(f"完成：保留 {kept}，跳过 {skipped}")

if __name__ == "__main__":
    main()
