#!/usr/bin/env python3
import os
import re
import argparse
from typing import Dict, List, Tuple, Set, Optional
import pathlib

AT_FERRY_RE = re.compile(r"\(\s*at-ferry\s+([^\s()]+)\s*\)", re.IGNORECASE)

PROBLEM_HEADER_RE = re.compile(r"^\(define\s*\(problem\s+([^\)]+)\)")
OBJECTS_SECTION_RE = re.compile(r"\(\s*:objects(.*?)\)\s*\(\s*:\w+", re.DOTALL | re.IGNORECASE)
INIT_SECTION_RE = re.compile(r"\(\s*:init(.*?)\)\s*\(\s*:\w+", re.DOTALL | re.IGNORECASE)
GOAL_SECTION_RE = re.compile(r"\(\s*:goal(.*?)\)\s*\)\s*$", re.DOTALL | re.IGNORECASE)
REQUIREMENTS_RE = re.compile(r"\(\s*:requirements(.*?)\)", re.DOTALL | re.IGNORECASE)

# Targeted predicate extractors
CAR_RE = re.compile(r"\(\s*car\s+([^\s\(\)]+)\s*\)", re.IGNORECASE)
LOC_RE = re.compile(r"\(\s*location\s+([^\s\(\)]+)\s*\)", re.IGNORECASE)
AT_RE = re.compile(r"\(\s*at\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)", re.IGNORECASE)


def read_file_text(path: str) -> str:
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


def write_text(path: str, text: str) -> None:
    with open(path, "w", encoding="utf-8") as f:
        f.write(text)


def extract_objects(problem_text: str) -> Tuple[Set[str], Set[str]]:
    cars: Set[str] = set()
    locations: Set[str] = set()
    m = OBJECTS_SECTION_RE.search(problem_text)
    if not m:
        return cars, locations
    obj_text = m.group(1)
    # Objects are untyped in this domain; use naming convention
    tokens = [tok for tok in re.split(r"\s+", obj_text) if tok]
    for t in tokens:
        if t.startswith("c"):
            cars.add(t)
        if t.startswith("l"):
            locations.add(t)
    return cars, locations


def extract_init_goal_sections(problem_text: str) -> Tuple[str, str]:
    init_match = INIT_SECTION_RE.search(problem_text)
    goal_match = GOAL_SECTION_RE.search(problem_text)
    if not init_match or not goal_match:
        raise ValueError(":init or :goal section not found")
    return init_match.group(1), goal_match.group(1)


def extract_init_maps(init_text: str) -> Tuple[Dict[str, str], Set[str], Set[str]]:
    cars: Set[str] = set(CAR_RE.findall(init_text))
    locs: Set[str] = set(LOC_RE.findall(init_text))
    car_to_loc: Dict[str, str] = {}
    for car, loc in AT_RE.findall(init_text):
        if car.startswith("c") and loc.startswith("l"):
            car_to_loc[car] = loc
    return car_to_loc, cars, locs


def extract_goal_map(goal_text: str) -> Dict[str, str]:
    car_to_loc: Dict[str, str] = {}
    for car, loc in AT_RE.findall(goal_text):
        if car.startswith("c") and loc.startswith("l"):
            car_to_loc[car] = loc
    return car_to_loc

def extract_ferry_start_and_locations(init_text: str) -> Tuple[Optional[str], Set[str]]:
    """从 :init 中抽取渡轮起点，以及出现过的 location 集（含 (location l) 与 at/at-ferry 中出现的 l）。"""
    ferry_start = None
    m = AT_FERRY_RE.search(init_text)
    if m:
        ferry_start = m.group(1)

    locs: Set[str] = set(LOC_RE.findall(init_text))
    # 把 at/at-ferry 中出现的 loc 也纳入
    for _, l in AT_RE.findall(init_text):
        if l.startswith("l"):
            locs.add(l)
    if ferry_start:
        locs.add(ferry_start)
    return ferry_start, locs


def pick_checkpoint_for_car(all_locations: Set[str], car_init: Optional[str], car_goal: Optional[str],
                            ferry_start: Optional[str]) -> Optional[str]:
    """
    选择一个检查点位置：
      1) 不是 car 的 init，也不是 car 的 goal；
      2) 优先也不是渡轮起点（避免“刚好起点就满足”导致约束失效）。
    若找不到严格满足 1)+2) 的，就退而求其次找 != goal 的；仍找不到则返回 None。
    """
    candidates = [l for l in sorted(all_locations) if l not in {car_init, car_goal}]
    # 优先非 ferry_start
    pref = [l for l in candidates if l != ferry_start]
    if pref:
        return pref[0]
    if candidates:
        return candidates[0]
    # 退而求其次：只要 != goal 也行（避免与目标相同导致 vacuous/不可能）
    fallback = [l for l in sorted(all_locations) if l != car_goal]
    return fallback[0] if fallback else None

def sometime_before_formula(car_a: str, loc_a: str, car_b: str, loc_b: str) -> str:
    return f"(sometime-before (at {car_a} {loc_a}) (at {car_b} {loc_b}))"


def always_allowed_ports_formula(car: str, allowed_locs: Set[str]) -> str:
    # Encode as: (always (or (not (at c l1)) (not (at c l2)) ... (at c allowed1) (at c allowed2) ...))
    # But better: forbid non-allowed ports with always (not (at c lx)) for each lx not in allowed.
    disallow_parts = []
    for loc in sorted(allowed_locs["all"] - allowed_locs["allowed"]):
        disallow_parts.append(f"(always (not (at {car} {loc})))")
    return "\n".join(disallow_parts)


def _find_matching_solution_file(input_path: Optional[str]) -> Optional[str]:
    if not input_path:
        return None
    basename = os.path.splitext(os.path.basename(input_path))[0] + ".soln"
    # 1) Same directory as input
    candidate = os.path.join(os.path.dirname(input_path), basename)
    if os.path.exists(candidate):
        return candidate
    # 2) Known ferry all_problems/training directory (absolute)
    repo_root = pathlib.Path(__file__).resolve().parents[1]  # project root candidate
    abs_candidate = os.path.join(str(repo_root), "ferry", "all_problems", "training", basename)
    if os.path.exists(abs_candidate):
        return abs_candidate
    # 3) Environment override
    soln_dir = os.environ.get("FERRY_SOLN_DIR")
    if soln_dir:
        env_candidate = os.path.join(soln_dir, basename)
        if os.path.exists(env_candidate):
            return env_candidate
    return None


def _parse_plan_goal_order(soln_path: str, goal_map: Dict[str, str]) -> List[Tuple[str, str]]:
    achieved_order: List[Tuple[str, str]] = []
    seen: Set[str] = set()
    debark_re = re.compile(r"^\(\s*debark\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*$", re.IGNORECASE)
    try:
        with open(soln_path, 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                m = debark_re.match(line)
                if not m:
                    continue
                car, loc = m.group(1), m.group(2)
                goal_loc = goal_map.get(car)
                if goal_loc and goal_loc == loc and car not in seen:
                    achieved_order.append((car, loc))
                    seen.add(car)
    except Exception:
        return []
    return achieved_order


def _build_plan_informed_constraints(init_map: Dict[str, str], goal_map: Dict[str, str], soln_path: Optional[str]) -> List[str]:
    if not soln_path or not os.path.exists(soln_path):
        return []
    achieved = _parse_plan_goal_order(soln_path, goal_map)
    # Filter to movable cars only
    movable: List[Tuple[str, str]] = [t for t in achieved if goal_map.get(t[0]) != init_map.get(t[0])]
    if len(movable) < 2:
        return []
    constraints: List[str] = []
    # Reverse adjacent order across the entire sequence: for (g0,g1,...,gk), add g1 before g0, g2 before g1, ...
    for i in range(len(movable) - 1):
        car_prev, loc_prev = movable[i]
        car_next, loc_next = movable[i + 1]
        # Skip vacuous/unsat cases where RHS already true in init
        if init_map.get(car_prev) == loc_prev or init_map.get(car_next) == loc_next:
            continue
        constraints.append(sometime_before_formula(car_next, loc_next, car_prev, loc_prev))
    # Deduplicate while preserving order
    seen_c = set()
    deduped: List[str] = []
    for c in constraints:
        if c not in seen_c:
            seen_c.add(c)
            deduped.append(c)
    return deduped


def build_constraints(problem_text: str, init_text: str, goal_text: str, input_path: Optional[str]) -> List[str]:
    """
    检查点先行（checkpoint-first）：
      对每一辆需要移动的车 c（init(c) != goal(c)），生成：
        (sometime-before (at-ferry Lchk) (at c goal(c)))
      其中 Lchk 自动从所有位置中选择（既不等于 init(c)，也不等于 goal(c)，并尽量不等于渡轮起点）。
    """
    # 解析 init / goal
    init_map, cars_init, _locs_from_init = extract_init_maps(init_text)
    goal_map = extract_goal_map(goal_text)

    # 汇总对象区里的位置（若有）
    cars_objs, locs_objs = extract_objects(problem_text)

    # 汇总所有位置：来自 objects、init 声明、at/at-ferry 出现过的
    ferry_start, locs_seen = extract_ferry_start_and_locations(init_text)
    all_locations: Set[str] = set(locs_objs) | set(_locs_from_init) | set(locs_seen)

    # 汇总所有车：来自 objects、init、goal
    cars: Set[str] = set(cars_objs) | set(cars_init) | set(goal_map.keys())

    constraints: List[str] = []

    for car in sorted(cars):
        g = goal_map.get(car)
        i = init_map.get(car)
        # 只对“确实需要移动”的车加约束
        if not g or i == g:
            continue
        # 选检查点
        chk = pick_checkpoint_for_car(all_locations, i, g, ferry_start)
        if not chk or chk == g:
            # 找不到合适检查点就跳过该车（不产生不满足/不可解的 vacuous 约束）
            continue
        # 插入检查点先行
        constraints.append(f"(sometime-before  (at {car} {g}) (at-ferry {chk}))")

    # 去重（不同车可能挑到同一检查点）
    dedup: List[str] = []
    seen: Set[str] = set()
    for c in constraints:
        if c not in seen:
            seen.add(c)
            dedup.append(c)

    return dedup



def insert_constraints(problem_text: str, constraints: List[str]) -> str:
    if not constraints:
        return problem_text
    if len(constraints) == 1:
        constraints_block = "\n(:constraints\n  " + constraints[0] + "\n)\n"
    else:
        inner = "\n    ".join(constraints)
        constraints_block = "\n(:constraints\n  (and\n    " + inner + "\n  )\n)\n"
    return re.sub(r"\)\s*$", constraints_block + ")", problem_text, count=1)


def remove_constraints_blocks(problem_text: str) -> str:
    # Remove all top-level (:constraints ... ) blocks by scanning paren depth
    text = problem_text
    result_parts: List[str] = []
    i = 0
    n = len(text)
    while i < n:
        idx = text.find("(:constraints", i)
        if idx == -1:
            result_parts.append(text[i:])
            break
        # append text before constraints block
        result_parts.append(text[i:idx])
        # scan forward to find matching closing paren of the constraints block
        depth = 0
        j = idx
        in_block = False
        while j < n:
            ch = text[j]
            if ch == '(':
                depth += 1
                # entering constraints block
                if not in_block:
                    in_block = True
            elif ch == ')':
                depth -= 1
                if in_block and depth == 0:
                    j += 1  # include this closing paren
                    break
            j += 1
        # skip the constraints block
        i = j
    return ''.join(result_parts)


def augment_problem_text(problem_text: str, input_path: Optional[str] = None) -> str:
    # Always strip existing constraints before extracting sections to avoid mis-parsing
    base_text = remove_constraints_blocks(problem_text)
    init_text, goal_text = extract_init_goal_sections(base_text)
    constraints = build_constraints(base_text, init_text, goal_text, input_path)
    if not constraints:
        return base_text
    augmented = insert_constraints(base_text, constraints)
    return augmented


def process_file(input_path: str, output_path: str) -> None:
    text = read_file_text(input_path)
    augmented = augment_problem_text(text, input_path)
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    write_text(output_path, augmented)


def process_dir(input_dir: str, output_dir: str) -> None:
    os.makedirs(output_dir, exist_ok=True)
    for name in os.listdir(input_dir):
        if not name.endswith(".pddl"):
            continue
        src = os.path.join(input_dir, name)
        dst = os.path.join(output_dir, name)
        process_file(src, dst)


def main():
    parser = argparse.ArgumentParser(description="Augment ferry PDDL problems with PDDL3 constraints inferred from init/goal")
    parser.add_argument("input", help="Input .pddl file or directory")
    parser.add_argument("output", help="Output file or directory")
    args = parser.parse_args()

    if os.path.isdir(args.input):
        process_dir(args.input, args.output)
    else:
        out_is_dir = False
        if os.path.isdir(args.output):
            out_is_dir = True
        elif not os.path.exists(args.output):
            _, ext = os.path.splitext(args.output)
            if ext.lower() != ".pddl":
                out_is_dir = True
        if out_is_dir:
            os.makedirs(args.output, exist_ok=True)
            basename = os.path.basename(args.input)
            out_path = os.path.join(args.output, basename)
            process_file(args.input, out_path)
        else:
            process_file(args.input, args.output)

if __name__ == "__main__":
    main()
