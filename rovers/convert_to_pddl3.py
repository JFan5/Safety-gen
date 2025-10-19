#!/usr/bin/env python3
"""Convert Rovers PDDL2 problems into PDDL3 problems with solution-aware safety constraints.

规则（按优先级）：
1) R==1: 选择 can_traverse(rover0, A, B)，若解中未用 A->B 或解中次序为 B 先于 A，则加入：
      (sometime-before (at rover0 B) (at rover0 A))
   语义：若两点都访问，B 必须先于 A，从而禁止 A->B 方向；保留 B->A 方向。保证原解不受影响。
2) R>1 且任意两车存在共同访问的 waypoint W（不要求同一时刻）：
      (always (not (and (at ri W) (at rj W))))
   语义：禁止同地同时占据；顺序计划不会受影响（从而保持可解）。
3) R>1 且不存在共同访问点：为某 rover 选择一个其从未访问且也不是初始位置的 waypoint w：
      (always (not (at r w)))
   语义：禁止该 rover 出现在 w；因为解中未用到 w，原解保持可行。

若无 .soln 则降级：R==1 时从 can_traverse 里找任一 (A,B) 并加 sometime-before(B,A)；
R>1 时加一条通用的不同时同地占据约束（对任意 pair ri,rj 和任意 w）。
"""

from __future__ import annotations

import argparse
import hashlib
import random
import re
import shutil
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Sequence, Tuple

# -----------------------------
# 原始静态/支持谓词（部分用于解析）
# -----------------------------
STATIC_PREDS: Dict[str, int] = {
    "visible": 2,
    "visible_from": 2,
    "can_traverse": 3,
    "equipped_for_soil_analysis": 1,
    "equipped_for_rock_analysis": 1,
    "equipped_for_imaging": 1,
    "at_lander": 2,
    "supports": 2,
    "calibration_target": 2,
    "on_board": 2,
    "store_of": 2,
}

SUPPORT_PREDS: Dict[str, int] = {
    "at_soil_sample": 1,
    "at_rock_sample": 1,
}

# -----------------------------
# 基础解析工具
# -----------------------------
def _extract_block(text: str, key: str) -> Optional[str]:
    """Return the full (:key ...) block including parentheses."""
    pattern = rf"\(\s*:{re.escape(key)}\b"
    match = re.search(pattern, text, flags=re.IGNORECASE)
    if not match:
        return None
    start = match.start()
    depth = 0
    for idx in range(start, len(text)):
        char = text[idx]
        if char == "(":
            depth += 1
        elif char == ")":
            depth -= 1
            if depth == 0:
                return text[start : idx + 1]
    return None


def _atoms(block: Optional[str], pred: str, arity: int) -> List[Tuple[str, ...]]:
    """Collect predicate instances from a block using a simple regex."""
    if not block:
        return []
    pattern = r"\(\s*" + re.escape(pred) + "".join([r"\s+([^\s()]+)"] * arity) + r"\s*\)"
    return [tuple(match.groups()) for match in re.finditer(pattern, block, flags=re.IGNORECASE)]


def _parse_typed_objects(objects_block: Optional[str]) -> Dict[str, List[str]]:
    """Parse (:objects ...) into a mapping of lower-case type -> object list."""
    if not objects_block:
        return {}
    tokens = re.findall(r"[^\s()]+", objects_block)
    if tokens and tokens[0].lower() == ":objects":
        tokens = tokens[1:]
    result: Dict[str, List[str]] = {}
    buffer: List[str] = []
    i = 0
    while i < len(tokens):
        tok = tokens[i]
        if tok == "-":
            if i + 1 >= len(tokens):
                break
            typ = tokens[i + 1].lower()
            if buffer:
                result.setdefault(typ, []).extend(buffer)
            buffer = []
            i += 2
        else:
            buffer.append(tok)
            i += 1
    return result


def _format_atom(pred: str, args: Sequence[str]) -> str:
    """Return canonical atom string."""
    if args:
        return f"({pred} {' '.join(args)})"
    return f"({pred})"


def _derive_seed(base_seed: int, problem_path: Path) -> int:
    """Derive a deterministic per-problem seed."""
    h = hashlib.sha256()
    h.update(str(base_seed).encode("utf-8"))
    h.update(str(problem_path).encode("utf-8"))
    return int.from_bytes(h.digest()[:8], "big") & 0xFFFFFFFF

# -----------------------------
# 解决方案（.soln）解析
# -----------------------------
def _read_solution_text(problem_path: Path) -> Optional[str]:
    soln_path = problem_path.with_suffix(".soln")
    if soln_path.exists():
        try:
            return soln_path.read_text(encoding="utf-8")
        except Exception:
            return None
    return None


def _parse_plan_actions(soln_text: str) -> List[Tuple[str, List[str]]]:
    """Parse lines like (navigate r w1 w2) into list of (name, args)."""
    actions: List[Tuple[str, List[str]]] = []
    # 简单 S 表达式提取（不处理嵌套），足够覆盖 rovers 的动作
    for m in re.finditer(r"\(\s*([a-zA-Z0-9_\-]+)\s*([^()]*)\)", soln_text):
        name = m.group(1).lower()
        args = [tok for tok in re.findall(r"[^\s()]+", m.group(2))]
        if name:
            actions.append((name, args))
    return actions


# -----------------------------
# 基于 problem+solution 的信息抽取
# -----------------------------
def _initial_rover_positions(init_block: str, rovers: List[str]) -> Dict[str, str]:
    """Return initial at positions for each rover from (:init)."""
    at_pairs = _atoms(init_block, "at", 2)  # (at rover waypoint)
    pos: Dict[str, str] = {}
    for r, w in at_pairs:
        if r in rovers:
            pos[r] = w
    return pos


def _visit_info_from_solution(
    actions: List[Tuple[str, List[str]]],
    init_pos: Dict[str, str],
) -> Tuple[Dict[str, List[str]], Dict[str, int], Dict[Tuple[str, str, str], int]]:
    """
    返回：
      - first_visit_order[rover, waypoint] 的首到达序（扁平存成 dict key=f"{r}@{w}"）——为了便于比较顺序；
      - visited_by_rover: 各 rover 访问过的 waypoint 集合（list 供稳定性）；
      - used_edges: 解中使用过的 (navigate rover w_from w_to) 及其首次出现次序。
    """
    # 当前位置信息
    cur_pos = dict(init_pos)
    first_order: Dict[str, int] = {}
    visited_by: Dict[str, List[str]] = {r: [] for r in init_pos.keys()}
    used_edges: Dict[Tuple[str, str, str], int] = {}

    # 初始化：初始点计为访问，次序 0
    step = 0
    for r, w in init_pos.items():
        key = f"{r}@{w}"
        if key not in first_order:
            first_order[key] = step
        if w not in visited_by[r]:
            visited_by[r].append(w)

    # 顺序处理动作
    for name, args in actions:
        step += 1
        if name == "navigate" and len(args) >= 3:
            r, w_from, w_to = args[0], args[1], args[2]
            cur_pos[r] = w_to
            key = f"{r}@{w_to}"
            if key not in first_order:
                first_order[key] = step
            if w_to not in visited_by.setdefault(r, []):
                visited_by[r].append(w_to)
            used_edges.setdefault((r, w_from, w_to), step)
        elif name in ("sample_soil", "sample_rock") and len(args) >= 3:
            r, _, wp = args[0], args[1], args[2]
            key = f"{r}@{wp}"
            if key not in first_order:
                first_order[key] = step
            if wp not in visited_by.setdefault(r, []):
                visited_by[r].append(wp)
        elif name == "take_image" and len(args) >= 5:
            r, wp = args[0], args[1]
            key = f"{r}@{wp}"
            if key not in first_order:
                first_order[key] = step
            if wp not in visited_by.setdefault(r, []):
                visited_by[r].append(wp)
        elif name.startswith("communicate_"):
            # 典型形参末尾两个为 from_wp 和 lander_wp：只把 from_wp 记录为该 rover 访问点
            # 例：(communicate_image_data r general obj mode from_wp lander_wp)
            if len(args) >= 2:
                r = args[0]
                if len(args) >= 3:
                    # 从最后两个参数推测 from_wp、to_wp
                    # 有些编码会是 ... from_wp lander_wp
                    from_wp = args[-2]
                    key = f"{r}@{from_wp}"
                    if key not in first_order:
                        first_order[key] = step
                    if from_wp not in visited_by.setdefault(r, []):
                        visited_by[r].append(from_wp)

    return visited_by, first_order, used_edges


# -----------------------------
# 依据三条规则生成约束
# -----------------------------
def generate_rovers_constraints(
    problem_text: str,
    solution_text: Optional[str],
    rng: random.Random,
    min_constraints: int = 1,
    max_constraints: int = 5,
) -> List[str]:
    """
    生成满足“同时有解”的 PDDL3 约束，严格遵循题主三条类型：
      1) R==1: sometime-before 禁止 A->B
      2) R>1 和存在共同访问点: 不允许同地同时占据
      3) R>1 且不存在共同访问点: 不允许某 rover 出现在未出现过的 w
    """
    objects_block = _extract_block(problem_text, "objects")
    init_block = _extract_block(problem_text, "init")
    if not init_block:
        raise ValueError("未找到 (:init ...) 块，无法生成约束")

    typed_objects = {k: v for k, v in _parse_typed_objects(objects_block).items()}
    rovers = typed_objects.get("rover", [])
    waypoints = typed_objects.get("waypoint", [])
    if not rovers or not waypoints:
        raise ValueError("未识别到 rovers 或 waypoints")

    # 静态图与其它静态
    can_traverse_triples = _atoms(init_block, "can_traverse", 3)

    # 解析解（若存在）
    actions: List[Tuple[str, List[str]]] = []
    if solution_text:
        actions = _parse_plan_actions(solution_text)

    init_pos = _initial_rover_positions(init_block, rovers)
    if not init_pos:
        # 兜底：若没有 at(rover, w)（理论上不应发生）
        init_pos = {r: waypoints[0] for r in rovers}

    visited_by, first_order, used_edges = _visit_info_from_solution(actions, init_pos)

    constraints: List[str] = []

    # -----------------
    # 规则 1：单车
    # -----------------
    if len(rovers) == 1:
        r = rovers[0]
        # 构建一个不会使现有解失效的 (A,B)：解中未出现 A->B，且 (B 先于 A) 或至少有一者未出现
        # 优先选用图上存在的 can_traverse(r, A, B)
        safe_pairs: List[Tuple[str, str]] = []
        # 用首到达序比较
        def first_time(rover: str, wp: str) -> Optional[int]:
            return first_order.get(f"{rover}@{wp}")

        for rv, A, B in can_traverse_triples:
            if rv != r:
                continue
            tA, tB = first_time(r, A), first_time(r, B)
            used = ((r, A, B) in used_edges)
            # 条件：不在解中用 A->B，且 (B 未访问) 或 (A 未访问) 或 (tB < tA)
            if not used and ((tB is None) or (tA is None) or (tB < tA)):
                safe_pairs.append((A, B))

        # 若没找到“完全安全”对，放宽到“解未用 A->B”的都可
        if not safe_pairs:
            for rv, A, B in can_traverse_triples:
                if rv == r and (r, A, B) not in used_edges:
                    safe_pairs.append((A, B))

        if not safe_pairs and can_traverse_triples:
            # 再兜底：随便挑一条边（仍然用 sometime-before(B,A)，可能使解无效，但尽力而为）
            rv, A, B = random.choice(can_traverse_triples)
            if rv == r:
                safe_pairs = [(A, B)]

        if safe_pairs:
            A, B = rng.choice(safe_pairs)
            constraints.append(f"(sometime-before (at {r} {B}) (at {r} {A}))")

    # -----------------
    # 规则 2/3：多车
    # -----------------
    else:
        # 计算两两共同访问点
        common_points: List[Tuple[str, str, str]] = []  # (ri, rj, w)
        rover_list = list(rovers)
        for i in range(len(rover_list)):
            for j in range(i + 1, len(rover_list)):
                ri, rj = rover_list[i], rover_list[j]
                si = set(visited_by.get(ri, []))
                sj = set(visited_by.get(rj, []))
                for w in sorted(si.intersection(sj)):
                    common_points.append((ri, rj, w))

        if common_points:
            # 规则 2：若解中出现过“同一地点被多车访问”——插入“同地互斥（同时）”约束
            # 不必对所有 w 都加，遵守 max_constraints；若想更强，可对所有 common w 添加
            rng.shuffle(common_points)
            for (ri, rj, w) in common_points:
                constraints.append(f"(always (not (and (at {ri} {w}) (at {rj} {w}))))")
                if len(constraints) >= max_constraints:
                    break
        else:
            # 规则 3：不存在共同访问点 -> 为某 rover 选择一个其从未出现且不是其初始位置的 w
            # 选择“影响最小”的禁入点：优先挑选没人访问过的 w；否则挑选距离该 rover 轨迹较远的 w（这里用“未访问”）
            candidates: List[Tuple[str, str]] = []
            for r in rovers:
                visited = set(visited_by.get(r, []))
                start_w = init_pos.get(r)
                for w in waypoints:
                    if w != start_w and w not in visited:
                        candidates.append((r, w))
            if not candidates:
                # 再兜底：即使所有 rover 都覆盖了所有点，仍选一个“非起点”的 (r,w) 禁止之（这可能使原解无效）
                for r in rovers:
                    for w in waypoints:
                        if w != init_pos.get(r):
                            candidates.append((r, w))
            if candidates:
                r, w = rng.choice(candidates)
                constraints.append(f"(always (not (at {r} {w})))")

    # 截断/抽样到 [min, max]
    if not constraints:
        # 最后兜底，至少来一条“无害”的真约束（对现状不施加额外限制）——为了语法完整性，我们用 at end 的起点保持：
        # 这里保守起见不再合成“真谓词”，而是返回空约束列表，让插入函数跳过。
        pass

    if constraints:
        if len(constraints) > max_constraints:
            constraints = rng.sample(constraints, max_constraints)
        elif len(constraints) < min_constraints:
            # 不额外补随机约束，避免偏离三条规则；保留已有的（低于 min 也允许）
            pass

    return constraints

# -----------------------------
# 将约束写回 problem
# -----------------------------
def insert_constraints(problem_text: str, constraints: Sequence[str]) -> str:
    """Insert a (:constraints ...) block before the final right parenthesis."""
    if re.search(r"\(\s*:constraints\b", problem_text, flags=re.IGNORECASE):
        return problem_text
    if not constraints:
        return problem_text

    indent = "  "
    if len(constraints) == 1:
        inner = f"{indent}  {constraints[0]}"
    else:
        inner_lines = "\n".join(f"{indent}    {c}" for c in constraints)
        inner = f"{indent}  (and\n{inner_lines}\n{indent}  )"
    block = f"\n{indent}(:constraints\n{inner}\n{indent})\n"

    last_paren = problem_text.rfind(")")
    if last_paren == -1:
        raise ValueError("问题文件缺少结尾括号")
    return problem_text[:last_paren] + block + problem_text[last_paren:]


# -----------------------------
# 单文件/目录转化
# -----------------------------
def convert_problem_to_pddl3(
    problem_path: Path,
    output_path: Path,
    base_seed: int,
    min_constraints: int,
    max_constraints: int,
) -> bool:
    """Convert a single problem file."""
    try:
        text = problem_path.read_text(encoding="utf-8")
        soln_text = _read_solution_text(problem_path)
        rng = random.Random(_derive_seed(base_seed, problem_path))
        constraints = generate_rovers_constraints(text, soln_text, rng, min_constraints, max_constraints)
        converted = insert_constraints(text, constraints)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(converted, encoding="utf-8")
        return True
    except Exception as exc:  # noqa: BLE001
        print(f"转换失败 {problem_path}: {exc}")
        return False




def convert_directory(
    input_dir: Path,
    output_dir: Path,
    base_seed: int,
    min_constraints: int,
    max_constraints: int,
    pattern: str = "*.pddl",
    clean_output: bool = True,
) -> None:
    """Convert every *.pddl under input_dir into output_dir."""
    if not input_dir.exists():
        raise FileNotFoundError(f"输入目录不存在: {input_dir}")
    if clean_output and output_dir.exists():
        shutil.rmtree(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    files = sorted(Path(input_dir).glob(pattern))
    if not files:
        print(f"在 {input_dir} 下未找到匹配 {pattern} 的问题文件")
        return

    total = len(files)
    success = 0
    for idx, path in enumerate(files, 1):
        rel = path.name
        print(f"[{idx}/{total}] 转换 {rel} ... ", end="")
        ok = convert_problem_to_pddl3(
            path,
            output_dir / rel,
            base_seed,
            min_constraints,
            max_constraints,
        )
        if ok:
            success += 1
            print("✓")
        else:
            print("✗")
    print(f"完成：成功 {success}/{total}")


# -----------------------------
# CLI
# -----------------------------
def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="将 rovers PDDL2 问题扩展为带 PDDL3 轨迹安全约束（基于 problem+solution）的版本。"
    )
    parser.add_argument("input", help="输入 problem 文件或目录")
    parser.add_argument(
        "output",
        nargs="?",
        help="输出文件或目录（省略则对文件追加 .pddl3，对目录追加 _pddl3）",
    )
    parser.add_argument("--seed", type=int, default=0, help="全局随机种子（默认0）")
    parser.add_argument("--min", type=int, default=1, dest="min_constraints", help="每个问题最少约束条数")
    parser.add_argument("--max", type=int, default=3, dest="max_constraints", help="每个问题最多约束条数")
    parser.add_argument("--pattern", default="*.pddl", help="目录转换时匹配的文件模式")
    
    parser.add_argument(
        "--no-clean",
        action="store_true",
        help="保留已存在的输出目录内容",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    input_path = Path(args.input)
    output_arg = Path(args.output) if args.output else None
    min_constraints = max(1, args.min_constraints)
    max_constraints = max(min_constraints, args.max_constraints)

    if input_path.is_file():
        output_path = output_arg if output_arg else input_path.with_suffix(".pddl3")
        convert_problem_to_pddl3(
            input_path,
            output_path,
            args.seed,
            min_constraints,
            max_constraints,
        )
        print(f"已生成 {output_path}")
    else:
        if not input_path.exists():
            raise FileNotFoundError(f"输入路径不存在: {input_path}")
        output_dir = output_arg if output_arg else input_path.parent / f"{input_path.name}_pddl3"
        convert_directory(
            input_path,
            output_dir,
            args.seed,
            min_constraints,
            max_constraints,
            pattern=args.pattern,
            clean_output=not args.no_clean,
        )


if __name__ == "__main__":
    main()
