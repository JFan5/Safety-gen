# convert_pddl3.py
import os
import re
import sys
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Set

PROBLEM_SUFFIXES = (".pddl", ".problem")
PLAN_CANDIDATE_SUFFIXES = (".plan", ".sol", ".solution", ".soln", ".txt")

# ---------- 基础解析工具 ----------

def _extract_section_body(pddl: str, head: str) -> str:
    """
    以括号配平的方式抽取 (:head ... ) 的内部 body（不含 (:head 和最后的 ) ）
    大小写不敏感；找不到则返回空串。
    """
    low = pddl.lower()
    key = f"(:{head}".lower()
    start = low.find(key)
    if start == -1:
        return ""
    # 定位到 '(:head'
    i = start
    depth = 0
    end = None
    while i < len(pddl):
        ch = pddl[i]
        if ch == '(':
            depth += 1
        elif ch == ')':
            depth -= 1
            if depth == 0:
                end = i
                break
        i += 1
    if end is None:
        return ""
    # 去掉前缀 "(:head"
    body = pddl[start:end+1]
    body = body[len(f"(:{head}"): -1].strip()
    return body

def _tokenize_names_by_type(objects_body: str, type_name: str) -> List[str]:
    """
    从 :objects 的 body 中抽取特定类型的对象名列表（紧邻 '- type_name' 左侧的所有名字）。
    """
    names: List[str] = []
    # 去注释、压平
    ob = re.sub(r";.*", "", objects_body)
    ob = " ".join(ob.split())
    pattern = re.compile(rf"([^\-]+?)\-\s*{re.escape(type_name)}(?:\s|$)", re.I)
    for m in pattern.finditer(ob):
        left = m.group(1).strip()
        if left:
            names.extend(left.split())
    return names

def _sort_robot_names(robots: List[str]) -> List[str]:
    """
    只保留并按数字后缀排序 robot 名（robot1, robot2, ...）
    """
    def key_fn(r: str):
        m = re.match(r"robot(\d+)$", r, flags=re.I)
        return (int(m.group(1)) if m else float("inf"), r.lower())
    # 过滤
    filtered = [r for r in robots if re.match(r"^robot\d+$", r, flags=re.I)]
    # 去重（保持最小写一致性）
    seen = set()
    uniq: List[str] = []
    for r in filtered:
        rl = r.lower()
        if rl not in seen:
            seen.add(rl)
            uniq.append(r)
    return sorted(uniq, key=key_fn)

def _rooms_from_init(init_body: str) -> Set[str]:
    """
    从 :init 提取出现过的房间名（at-robby / at ball）
    """
    rooms: Set[str] = set()
    for _r, rm in re.findall(r"\(at-robby\s+(\S+)\s+(\S+)\)", init_body, flags=re.I):
        rooms.add(rm)
    for _b, rm in re.findall(r"\(at\s+(\S+)\s+(\S+)\)", init_body, flags=re.I):
        rooms.add(rm)
    return rooms

def parse_problem(pddl: str) -> Dict:
    """
    解析 robots / rooms / grippers / 初始位置 / 每机器人拥有的夹爪
    - robots: 仅保留 ^robot\\d+$
    - rooms: 先从 :objects 中取，再并上 :init 中出现的房间
    """
    objects_body = _extract_section_body(pddl, "objects")
    init_body = _extract_section_body(pddl, "init")

    robots_from_obj = _tokenize_names_by_type(objects_body, "robot")
    rooms_from_obj  = _tokenize_names_by_type(objects_body, "room")
    grippers_from_obj = _tokenize_names_by_type(objects_body, "gripper")

    # 机器人：按 robot\\d+ 过滤与排序；若 :objects 里没有，全文兜底提取
    robots = _sort_robot_names(robots_from_obj)
    if not robots:
        robots = _sort_robot_names(list({m.group(0) for m in re.finditer(r"robot\d+", pddl, flags=re.I)}))

    # 初始位置
    at_robby: Dict[str, str] = {}
    if init_body:
        for r, rm in re.findall(r"\(at-robby\s+(\S+)\s+(\S+)\)", init_body, flags=re.I):
            at_robby[r] = rm

    # 夹爪（根据 init 的 (free robot gripper) 归属）
    robot_grippers: Dict[str, List[str]] = {}
    if init_body:
        for r, g in re.findall(r"\(free\s+(\S+)\s+(\S+)\)", init_body, flags=re.I):
            robot_grippers.setdefault(r, []).append(g)

    # 房间集合：:objects ∪ :init
    rooms_init = _rooms_from_init(init_body)
    room_set = set(rooms_from_obj) | rooms_init

    return {
        "robots": robots,
        "rooms_all": list(room_set),
        "rooms_declared": rooms_from_obj,
        "rooms_from_init": rooms_init,
        "grippers": grippers_from_obj,
        "at_robby": at_robby,
        "robot_grippers": robot_grippers,
    }

# ---------- plan 解析 & 模拟 ----------

def find_plan_file(problem_path: Path) -> Optional[Path]:
    stem = problem_path.stem
    parent = problem_path.parent
    # 同名不同后缀
    for suf in PLAN_CANDIDATE_SUFFIXES:
        p = parent / f"{stem}{suf}"
        if p.exists():
            return p
    # 常见子目录
    for sub in ("plans", "solutions"):
        p = parent / sub / f"{stem}.plan"
        if p.exists():
            return p
    return None

def parse_plan(plan_text: str) -> List[Tuple[str, List[str]]]:
    actions: List[Tuple[str, List[str]]] = []
    for line in plan_text.splitlines():
        line = line.strip()
        if not line or line.startswith(";"):
            continue
        m = re.match(r"\((\S+)(?:\s+(.*?))?\)", line)
        if not m:
            continue
        name = m.group(1).lower()
        args = m.group(2).split() if m.group(2) else []
        actions.append((name, args))
    return actions

def initial_conflict(at_robby: Dict[str, str], robots_ordered: List[str]) -> bool:
    if len(robots_ordered) < 2:
        return False
    r1, r2 = robots_ordered[:2]
    return at_robby.get(r1) and at_robby.get(r1) == at_robby.get(r2)

def simult_rooms_along_plan(at_robby_init: Dict[str, str],
                            robots_ordered: List[str],
                            actions: List[Tuple[str, List[str]]]) -> Set[str]:
    """
    顺序回放 plan，仅用 move 更新位置。
    返回出现过“两机器人同时在同一房间”的房间集合（不依赖固定房间名）。
    """
    rooms_simult: Set[str] = set()
    if len(robots_ordered) < 2:
        return rooms_simult
    r1, r2 = robots_ordered[:2]
    pos = dict(at_robby_init)  # robot -> room

    def check_and_record():
        if pos.get(r1) and pos.get(r1) == pos.get(r2):
            rooms_simult.add(pos[r1])

    # 初始检查
    check_and_record()

    # 回放
    for name, args in actions:
        if name == "move" and len(args) >= 3:
            rob, _from, _to = args[0], args[1], args[2]
            if rob in (r1, r2):
                pos[rob] = _to
        # 每步后检查
        check_and_record()
    return rooms_simult

# ---------- 约束生成 ----------

def _select_gripper_used_in_plan(problem_info: Dict, actions: List[Tuple[str, List[str]]]) -> Optional[str]:
    # 统计 plan 中出现频率最高的 gripper
    all_grippers: List[str] = []
    all_grippers.extend(problem_info.get("grippers", []))
    for lst in problem_info.get("robot_grippers", {}).values():
        for g in lst:
            if g not in all_grippers:
                all_grippers.append(g)
    if not all_grippers or not actions:
        return None
    lower_to_orig = {g.lower(): g for g in all_grippers}
    cnt: Dict[str, int] = {g: 0 for g in all_grippers}
    for _n, args in actions:
        for a in args:
            g = lower_to_orig.get(a.lower())
            if g:
                cnt[g] += 1
    best, bestc = None, 0
    for g, c in cnt.items():
        if c > bestc:
            best, bestc = g, c
    return best if bestc > 0 else None

def build_constraint_one_gripper_unavailable(problem_info: Dict,
                                             actions: Optional[List[Tuple[str, List[str]]]] = None) -> str:
    robots = problem_info["robots"]
    if not robots:
        return ""
    r = robots[0]  # 单机器人场景唯一或按序第一
    robot_grippers = problem_info["robot_grippers"]
    g = _select_gripper_used_in_plan(problem_info, actions or [])
    if g is None:
        # 优先禁左爪
        for cand in robot_grippers.get(r, []):
            if "lgripper" in cand.lower():
                g = cand
                break
    if g is None:
        grs = robot_grippers.get(r, [])
        g = grs[0] if grs else (problem_info["grippers"][0] if problem_info["grippers"] else "lgripper1")
    return f"""(:constraints
  (always (forall (?b - object)
           (not (carry {r} ?b {g}))))
)"""

def build_constraint_no_same_room(problem_info: Dict, rooms_simult: Set[str]) -> str:
    robots = problem_info["robots"]
    if len(robots) < 2 or not rooms_simult:
        return ""
    r1, r2 = robots[:2]
    allowed_rooms = set(problem_info.get("rooms_declared") or problem_info.get("rooms_all") or [])
    filtered = [room for room in sorted(rooms_simult) if room in allowed_rooms]
    if not filtered:
        return ""
    parts = [f"(always (not (and (at-robby {r1} {room}) (at-robby {r2} {room}))))" for room in filtered]
    joined = "\n    ".join(parts)
    return f"""(:constraints
  (and
    {joined}
  )
)"""

def _select_primary_robot(problem_info: Dict, actions: List[Tuple[str, List[str]]]) -> Optional[str]:
    robots = problem_info.get("robots", [])
    if not robots:
        return None
    # 优先 robot1
    for r in robots:
        if r.lower() == "robot1":
            return r
    # 否则按 move 次数最多
    move_counts: Dict[str, int] = {}
    for name, args in actions:
        if name == "move" and len(args) >= 3:
            rob = args[0]
            if rob in robots:
                move_counts[rob] = move_counts.get(rob, 0) + 1
    if move_counts:
        return max(move_counts.items(), key=lambda kv: kv[1])[0]
    # 回退第一个
    return robots[0]

def build_constraint_forbid_room(problem_info: Dict,
                                 actions: Optional[List[Tuple[str, List[str]]]] = None) -> str:
    """
    生成“禁止某机器人进入某房间”的约束：
    - 选择主机器人（优先 robot1，否则按 move 次数最多）。
    - 选房间：优先 plan 中该机器人确实进入过的房间（若存在 'room3' 且 != 初始房间，则优先选择 'room3'），
      且必须 != 该机器人的初始房间；若无 plan，则：
        * 若存在 'room3' 且 != 初始房间，选 'room3'
        * 否则选任意一个 != 初始房间的房间
      若实在选不到，返回空串（外部回退到“禁用夹爪”约束以避免 UNSAT）
    """
    robots = problem_info["robots"]
    if not robots:
        return ""
    actions = actions or []
    r = _select_primary_robot(problem_info, actions)
    if not r:
        r = robots[0]
    init_room = problem_info["at_robby"].get(r, None)

    candidate_rooms: List[str] = []
    # 有 plan：收集主机器人确实到达过的房间（按出现顺序去重）
    seen = set()
    for name, args in actions:
        if name == "move" and len(args) >= 3 and args[0] == r:
            to_room = args[2]
            if to_room not in seen:
                seen.add(to_room)
                candidate_rooms.append(to_room)

    rooms_all = list(problem_info.get("rooms_all", []))
    rooms_declared = set(problem_info.get("rooms_declared", []))
    # 优先 room3（若存在且不等于初始房间）
    if "room3" in rooms_all and init_room != "room3":
        # 确保 room3 在候选前面
        if "room3" in candidate_rooms:
            candidate_rooms.remove("room3")
        candidate_rooms.insert(0, "room3")

    # 无 plan 时追加全部房间作为候选
    if not actions:
        for rm in rooms_all:
            if rm not in candidate_rooms:
                candidate_rooms.append(rm)

    # 仅允许声明过的房间
    if rooms_declared:
        candidate_rooms = [rm for rm in candidate_rooms if rm in rooms_declared]
    # 选出第一个 != 初始房间 的房间
    target_room = None
    for rm in candidate_rooms:
        if rm != init_room:
            target_room = rm
            break

    if not target_room:
        return ""  # 避免起始即冲突，让外层回退到夹爪约束

    return f"""(:constraints
  (always (not (at-robby {r} {target_room})))
)"""

def inject_constraints(problem_text: str, constraints_text: str) -> str:
    if not constraints_text.strip():
        return problem_text
    stripped = problem_text.rstrip()
    idx = stripped.rfind(")")
    if idx == -1:
        return stripped + "\n" + constraints_text + "\n"
    return stripped[:idx] + "\n" + constraints_text + "\n" + stripped[idx:]

# ---------- 主流程 ----------

def process_problem(problem_path: Path, out_path: Path):
    text = problem_path.read_text(encoding="utf-8")
    info = parse_problem(text)
    robots = info["robots"]

    # 解析 plan（若存在）
    actions: List[Tuple[str, List[str]]] = []
    plan_path = find_plan_file(problem_path)
    if plan_path and plan_path.exists():
        try:
            actions = parse_plan(plan_path.read_text(encoding="utf-8"))
        except Exception:
            actions = []

    # 规则分支
    if len(robots) <= 1:
        # 只有 1 台 robot -> 约束 1
        cons = build_constraint_one_gripper_unavailable(info, actions)
    elif len(robots) == 2:
        # 两台 robot
        if not initial_conflict(info["at_robby"], robots):
            # 检查 plan 是否出现过同时同房
            rooms_simult = simult_rooms_along_plan(info["at_robby"], robots, actions)
            if rooms_simult:
                # 约束 2：仅禁止在这些“确实发生过同时同房”的房间里同时存在
                cons = build_constraint_no_same_room(info, rooms_simult)
            else:
                # 约束 3：禁止主机器人进入某房间（避开其初始房间）
                cons = build_constraint_forbid_room(info, actions)
                if not cons:
                    # 若会起始冲突或选不到合适房间，则回退到约束 1
                    cons = build_constraint_one_gripper_unavailable(info, actions)
        else:
            # 初始即同房 -> 不加会立即冲突的“并房”约束，转用约束 3
            cons = build_constraint_forbid_room(info, actions)
            if not cons:
                cons = build_constraint_one_gripper_unavailable(info, actions)
    else:
        # >2 台：未指定，默认用约束 3（避开初始房间），不行则回退到约束 1
        cons = build_constraint_forbid_room(info, actions)
        if not cons:
            cons = build_constraint_one_gripper_unavailable(info, actions)

    out_text = inject_constraints(text, cons)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(out_text, encoding="utf-8")

def convert_all_problems(input_dir: str, output_dir: str):
    in_dir = Path(input_dir)
    out_dir = Path(output_dir)
    if not in_dir.exists():
        print(f"输入目录不存在: {in_dir}")
        sys.exit(2)

    problems = [p for p in in_dir.rglob("*") if p.suffix.lower() in PROBLEM_SUFFIXES]
    if not problems:
        print("未在输入目录下找到 .pddl/.problem 文件")
        return

    for p in problems:
        rel = p.relative_to(in_dir)
        out_p = out_dir / rel
        try:
            process_problem(p, out_p)
            print(f"[OK] {rel} -> {out_p}")
        except Exception as e:
            print(f"[ERR] {rel}: {e}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("用法: python convert_pddl3.py <输入目录> [输出目录]")
        print("示例: python convert_pddl3.py all_problems/training all_problems/training_pddl3")
        sys.exit(1)

    input_dir = sys.argv[1]
    output_dir = sys.argv[2] if len(sys.argv) > 2 else f"{input_dir}_pddl3"
    convert_all_problems(input_dir, output_dir)
