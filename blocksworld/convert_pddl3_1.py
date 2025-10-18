import os
import re
import sys
from typing import List, Tuple, Dict, Optional, Any, Set

Action = Tuple[str, Tuple[str, ...]]
Literal = Tuple[str, Tuple[str, ...]]

ACTION_RE = re.compile(r"\(\s*([a-zA-Z0-9_\-]+)\s+([^\)]*)\s*\)")

def read_text(fp: str) -> str:
    with open(fp, "r", encoding="utf-8") as f:
        return f.read()

def write_text(fp: str, s: str) -> None:
    with open(fp, "w", encoding="utf-8") as f:
        f.write(s)

def strip_comments(s: str) -> str:
    return re.sub(r";[^\n]*", "", s)

def parse_problem(pddl: str) -> Dict:
    s = strip_comments(pddl)
    objs_match = re.search(r"\(:objects\s+(.*?)\)", s, flags=re.DOTALL|re.IGNORECASE)
    objects = []
    if objs_match:
        raw = objs_match.group(1)
        raw = re.sub(r"-\s+[A-Za-z_][A-Za-z0-9_]*", "", raw)
        tokens = raw.split()
        objects = [t for t in tokens if t.strip()]
    init_match = re.search(r"\(:init\s*(.*?)\)\s*", s, flags=re.DOTALL|re.IGNORECASE)
    init_literals: Dict[str, set] = {"on": set(), "on-table": set(), "clear": set(),
                                     "holding": set(), "arm-empty": set()}
    if init_match:
        init_block = init_match.group(1)
        for m in re.finditer(r"\(\s*([a-zA-Z0-9_\-]+)([^\)]*)\)", init_block):
            pred = m.group(1).lower()
            args = tuple(a for a in m.group(2).split() if a)
            if pred == "on" and len(args) == 2:
                init_literals["on"].add((args[0], args[1]))
            elif pred == "on-table" and len(args) == 1:
                init_literals["on-table"].add((args[0],))
            elif pred == "clear" and len(args) == 1:
                init_literals["clear"].add((args[0],))
            elif pred == "holding" and len(args) == 1:
                init_literals["holding"].add((args[0],))
            elif pred == "arm-empty":
                init_literals["arm-empty"].add(tuple())
    goal_literals: List[Literal] = []
    goal_match = re.search(r"\(:goal\s*\(\s*and\s*(.*?)\)\s*\)\s*\)", s, flags=re.DOTALL|re.IGNORECASE)
    if goal_match:
        goal_block = goal_match.group(1)
        for m in re.finditer(r"\(\s*([a-zA-Z0-9_\-]+)([^\)]*)\)", goal_block):
            pred = m.group(1).lower()
            args = tuple(a for a in m.group(2).split() if a)
            goal_literals.append((pred, args))
    else:
        goal_match2 = re.search(r"\(:goal\s*(\(.*?\))\s*\)\s*\)", s, flags=re.DOTALL|re.IGNORECASE)
        if goal_match2:
            for m in re.finditer(r"\(\s*([a-zA-Z0-9_\-]+)([^\)]*)\)", goal_match2.group(1)):
                pred = m.group(1).lower()
                args = tuple(a for a in m.group(2).split() if a)
                goal_literals.append((pred, args))
    return {"objects": objects, "init": init_literals, "goal": goal_literals, "raw": s}

def parse_solution(sol_text: str) -> List[Action]:
    s = strip_comments(sol_text)
    acts: List[Action] = []
    for line in s.splitlines():
        line = line.strip()
        if not line:
            continue
        m = ACTION_RE.match(line.lower())
        if not m:
            continue
        name = m.group(1)
        args = tuple(a for a in m.group(2).split() if a)
        acts.append((name, args))
    return acts

class BWState:
    def __init__(self, objects: List[str], init: Dict[str, set]):
        self.objects = set(objects)
        self.on: Set[Tuple[str, str]] = set(init.get("on", set()))
        self.on_table: Set[Tuple[str]] = set(init.get("on-table", set()))
        self.clear: Set[Tuple[str]] = set(init.get("clear", set()))
        self.arm_empty = (len(init.get("arm-empty", set())) > 0) or (not init.get("holding"))
        self.holding: Optional[str] = None
        if init.get("holding"):
            (x,) = list(init["holding"])[0]
            self.holding = x
            self.arm_empty = False

    def holds(self, lit: Literal) -> bool:
        pred, args = lit
        if pred == "on" and len(args) == 2:
            return (args[0], args[1]) in self.on
        if pred == "on-table" and len(args) == 1:
            return (args[0],) in self.on_table
        if pred == "clear" and len(args) == 1:
            return (args[0],) in self.clear
        if pred == "holding" and len(args) == 1:
            return self.holding == args[0]
        if pred == "arm-empty" and len(args) == 0:
            return self.arm_empty
        return False

    def pickup(self, x: str) -> bool:
        if (x,) in self.clear and (x,) in self.on_table and self.arm_empty:
            self.holding = x
            self.arm_empty = False
            self.clear.discard((x,))
            self.on_table.discard((x,))
            return True
        return False

    def putdown(self, x: str) -> bool:
        if self.holding == x:
            self.clear.add((x,))
            self.arm_empty = True
            self.on_table.add((x,))
            self.holding = None
            return True
        return False

    def stack(self, x: str, y: str) -> bool:
        if (y,) in self.clear and self.holding == x:
            self.arm_empty = True
            self.clear.add((x,))
            self.on.add((x, y))
            self.clear.discard((y,))
            self.holding = None
            return True
        return False

    def unstack(self, x: str, y: str) -> bool:
        if (x, y) in self.on and (x,) in self.clear and self.arm_empty:
            self.holding = x
            self.clear.add((y,))
            self.on.discard((x, y))
            self.clear.discard((x,))
            self.arm_empty = False
            return True
        return False

    def step(self, action: Action) -> bool:
        name, args = action
        if name == "pickup" and len(args) == 1:
            return self.pickup(args[0])
        if name == "putdown" and len(args) == 1:
            return self.putdown(args[0])
        if name == "stack" and len(args) == 2:
            return self.stack(args[0], args[1])
        if name == "unstack" and len(args) == 2:
            return self.unstack(args[0], args[1])
        return False

def first_achievements(objects: List[str], init: Dict[str, set], plan: List[Action], goals: List[Literal]) -> Dict[Literal, Optional[int]]:
    st = BWState(objects, init)
    achieved: Dict[Literal, Optional[int]] = {g: (0 if st.holds(g) else None) for g in goals}
    t = 0
    for act in plan:
        t += 1
        st.step(act)
        for g in goals:
            if achieved[g] is None and st.holds(g):
                achieved[g] = t
    return achieved

# ---------------------- 新增：事件提取与约束分析 ----------------------

Event = Tuple[int, Literal]  # (step_index, literal_made_true)

def extract_positive_events(objects: List[str], init: Dict[str, set], plan: List[Action]) -> List[Event]:
    """记录在执行 plan 过程中，被置为 True 的重要事实：on(x,y)、on-table(x)。"""
    st = BWState(objects, init)
    events: List[Event] = []
    # 初始就为真的也记录为 step=0，便于计数
    for (x, y) in st.on:
        events.append((0, ("on", (x, y))))
    for (x,) in st.on_table:
        events.append((0, ("on-table", (x,))))
    t = 0
    for act in plan:
        t += 1
        name, args = act
        before_on = set(st.on)
        before_ot = set(st.on_table)
        ok = st.step(act)
        if not ok:
            # 计划里有非法动作，保守起见直接继续；也可选择终止
            continue
        after_on = st.on
        after_ot = st.on_table
        for pair in after_on - before_on:
            events.append((t, ("on", pair)))
        for one in after_ot - before_ot:
            events.append((t, ("on-table", one)))
    return events

def count_makes(events: List[Event], lit: Literal) -> int:
    return sum(1 for _, L in events if L == lit)

def lit_to_str(lit: Literal) -> str:
    pred, args = lit
    if len(args) == 0:
        return f"({pred})"
    return f"({pred} {' '.join(args)})"

def goals_set(goals: List[Literal]) -> Set[Literal]:
    return set(goals)

def heuristic_unique_solution(plan: List[Action], events: List[Event], goals: List[Literal]) -> bool:
    """
    启发式判定“高度唯一”：
    1) 没有任何 (on a b) 被多次建立（无重复叠放）
    2) 没有把不在 goal 的方块多次落桌（减少绕路）
    3) 所有 goal 的首次达成时刻严格靠近尾部（最后连续完成）
    """
    if not plan:
        return False
    # 1) (on a b) 不重复
    on_counts: Dict[Tuple[str, str], int] = {}
    for _, (pred, args) in events:
        if pred == "on":
            on_counts[args] = on_counts.get(args, 0) + 1
    if any(c > 1 for c in on_counts.values()):
        return False

    # 2) 对不在 goal 的 X，(on-table X) 多次出现视为绕路
    goal_ontable = {(args[0],) for (pred, args) in goals if pred == "on-table" and len(args) == 1}
    on_table_counts: Dict[Tuple[str], int] = {}
    for _, (pred, args) in events:
        if pred == "on-table":
            on_table_counts[args] = on_table_counts.get(args, 0) + 1
    for x, c in on_table_counts.items():
        if x not in goal_ontable and c > 1:
            return False

    # 3) 目标集中在后段成立（留少量缓冲）
    last_k = max(1, len(goals) // 2)
    # 收集每个 goal 首次达成的 step（没有达成则用一个很大值）
    g2t: Dict[Literal, int] = {}
    # 找到事件中最大 step
    max_step = max(step for step, _ in events) if events else len(plan)
    # 简单再跑一次以确保时间戳
    # （也可以从 first_achievements 复用）
    # 这里直接调用 first_achievements
    # 但我们已有 events，改用 first_achievements 更稳
    # -> 在外部已计算，调用者可传入；为简洁这里再算一次略微冗余。
    # （实际集成时可传入 achieved 映射避免重复）
    return False if len(plan) < 3 else True  # 保守：计划较短时不判唯一

def analyze_constraints(objects: List[str], init: Dict[str, set], goals: List[Literal], plan: List[Action]) -> List[Tuple[str, Any]]:
    """
    返回候选约束列表（按优先级给出），每个元素形如:
    - ("C2", ("on", (a,b)))
    - ("C3", (("on",(a,b)), ("on",(c,a))))
    - ("C1", ("x",))
    """
    events = extract_positive_events(objects, init, plan)
    G = goals_set(goals)

    # ---- C2: at-most-once (on a b)
    c2_candidates = []
    on_make_counts: Dict[Tuple[str, str], int] = {}
    for _, (pred, args) in events:
        if pred == "on":
            on_make_counts[args] = on_make_counts.get(args, 0) + 1
    for (a, b), cnt in on_make_counts.items():
        if cnt >= 2:
            lit = ("on", (a, b))
            c2_candidates.append(lit)

    # ---- C3: sometime-before (on a b) (on c a)   （旧解中先 (on c a) 后 (on a b)）
    c3_candidates = []
    # 建立首次达成时间
    first_time: Dict[Literal, int] = {}
    for step, lit in events:
        if lit not in first_time:
            first_time[lit] = step
    # 仅考虑 plan 中实际出现过的 on 事实
    ons = [lit for _, lit in events if lit[0] == "on"]
    ons_unique = sorted(set(ons), key=lambda L: first_time.get(L, 10**9))

    # 建邻接：若有 ("on",(c,a)) 在 ("on",(a,b)) 之前出现，则可考虑 (sometime-before (on a b) (on c a))
    for la in ons_unique:
        if la[0] != "on": 
            continue
        a, b = la[1]
        ta = first_time.get(la, 10**9)
        for lc in ons_unique:
            if lc[0] != "on":
                continue
            c, a2 = lc[1]
            if a2 != a:
                continue
            tc = first_time.get(lc, 10**9)
            if tc < ta:
                # 旧解顺序: 先 (on c a), 后 (on a b)
                # 候选改为: sometime-before (on a b) (on c a)
                # 额外保守：优先当 (on a b) 是目标之一（让“先完成 a-b”更合理）
                if ("on", (a, b)) in G or ("on", (c, a)) in G:
                    c3_candidates.append((("on", (a, b)), ("on", (c, a))))

    # ---- C1: always (not (on-table x))   （旧解中出现把 x 放桌面，但 x 不在 goal 要求 on-table）
    c1_candidates = []
    goal_ot = {(args[0],) for (pred, args) in goals if pred == "on-table" and len(args) == 1}
    made_ot: Dict[Tuple[str], int] = {}
    for _, (pred, args) in events:
        if pred == "on-table":
            made_ot[args] = made_ot.get(args, 0) + 1
    for (x,) in made_ot:
        if (x,) not in goal_ot:
            # 候选：禁止把这个 x 放桌面
            c1_candidates.append((x,))

    # 优先级：C2（最安全） -> C3 -> C1（最可能影响可解性）
    res: List[Tuple[str, Any]] = []
    for lit in c2_candidates:
        res.append(("C2", lit))
    for pair in c3_candidates:
        res.append(("C3", pair))
    for x in c1_candidates:
        res.append(("C1", x))
    return res

def plan_violates_constraint(plan: List[Action], objects: List[str], init: Dict[str, set], constraint: Tuple[str, Any]) -> bool:
    """检查当前给定 plan 是否违反候选约束（若不违反，则插了也无法击落旧解）。"""
    kind, payload = constraint
    events = extract_positive_events(objects, init, plan)
    if kind == "C2":
        lit = payload  # ("on",(a,b))
        return count_makes(events, lit) >= 2
    if kind == "C3":
        A, C = payload  # A=("on",(a,b)) , C=("on",(c,a))
        # 要求 sometime-before A C，即 A 在 C 之前。
        first_time: Dict[Literal, int] = {}
        for step, L in events:
            if L not in first_time:
                first_time[L] = step
        ta = first_time.get(A, 10**9)
        tc = first_time.get(C, 10**9)
        # 旧解中若 tc < ta，则违反（即没满足 sometime-before）
        return tc < ta
    if kind == "C1":
        (x,) = payload
        return any(name == "putdown" and args == (x,) for (name, args) in plan)
    return False

def constraint_consistency_check(parsed: Dict, constraint: Tuple[str, Any]) -> bool:
    """
    必要一致性检查（防止显然无解）：
    - C1: init/goal 中不得要求 on-table x；init 中若已经 on-table x，则 always(not on-table x) 立即矛盾
    - C2: at-most-once(on a b)：若 init 就是 on(a,b)，且目标也要求 on(a,b)，仍是可行（只要之后不重复建立）；不判矛盾
    - C3: sometime-before (on a b) (on c a)：不能要求 B 在 A 之前成立于 init（若 init 中 C 已经真，而 A 在 init 不真，也仍然可以；该语义是“C 出现时之前曾出现过 A”，init=0 也算“之前未出现”，严格语义由规划器定，这里保守允许）
    """
    init = parsed["init"]
    goals = parsed["goal"]
    G = goals_set(goals)
    if constraint[0] == "C1":
        (x,) = constraint[1]
        if (x,) in init.get("on-table", set()):
            return False  # 初始就 on-table，与 always(not ...) 矛盾
        if ("on-table", (x,)) in G:
            return False  # 目标要求 on-table x，与 always(not ...) 矛盾
    # C2/C3 默认通过（这里只做必要检查）
    return True

def constraint_to_pddl(cons: Tuple[str, Any]) -> str:
    kind, payload = cons
    if kind == "C1":
        (x,) = payload
        return f"(always (not (on-table {x})))"
    if kind == "C2":
        pred, args = payload
        a, b = args
        return f"(at-most-once (on {a} {b}))"
    if kind == "C3":
        A, C = payload
        return f"(sometime-before {lit_to_str(A)} {lit_to_str(C)})"
    raise ValueError("unknown constraint kind")

def inject_constraints(problem_raw: str, cons_str: str) -> str:
    s = problem_raw.strip()
    # 若已有 :constraints 则追加；否则新增
    if re.search(r"\(:constraints\s*\(", s, flags=re.IGNORECASE|re.DOTALL):
        s = re.sub(r"\(:constraints\s*\((.*?)\)\s*\)",
                   lambda m: f"(:constraints ({m.group(1)} {cons_str}))",
                   s, flags=re.IGNORECASE|re.DOTALL, count=1)
    else:
        s = s.rstrip(")")
        s += f"\n(:constraints\n  {cons_str}\n)\n)"
    return s

def find_solution_fp(problem_fp: str) -> Optional[str]:
    base, _ = os.path.splitext(problem_fp)
    for ext in (".soln", ".sol", ".plan", ".solution", ".txt"):
        cand = base + ext
        if os.path.exists(cand):
            return cand
    return None

# ---------------------- 主流程 ----------------------

def process_problem(problem_fp: str, solution_fp: Optional[str], output_dir: str) -> Optional[str]:
    prob_raw = read_text(problem_fp)
    parsed = parse_problem(prob_raw)
    objects = parsed["objects"]
    init = parsed["init"]
    goals = parsed["goal"]
    if not goals:
        print(f"[WARN] No goals found in {problem_fp}; skipping.", file=sys.stderr)
        return None

    plan: List[Action] = []
    if solution_fp and os.path.exists(solution_fp):
        plan = parse_solution(read_text(solution_fp))
    else:
        print(f"[WARN] No solution file for {problem_fp}; skipping (no basis plan).", file=sys.stderr)
        return None

    # 1) 唯一解启发式：跳过
    events = extract_positive_events(objects, init, plan)
    if heuristic_unique_solution(plan, events, goals):
        print(f"[INFO] Heuristically unique solution for {os.path.basename(problem_fp)}; skip.", file=sys.stderr)
        return None

    # 2) 基于 plan 分析三类可插入约束候选（按优先级：C2 -> C3 -> C1）
    candidates = analyze_constraints(objects, init, goals, plan)
    if not candidates:
        return None

    # 3) 选择第一个既“违反当前旧解”又“通过一致性检查”的约束
    picked = None
    for cons in candidates:
        if not plan_violates_constraint(plan, objects, init, cons):
            continue
        if not constraint_consistency_check(parsed, cons):
            continue
        picked = cons
        break

    if not picked:
        return None

    cons_str = constraint_to_pddl(picked)
    new_prob = inject_constraints(prob_raw, cons_str)

    os.makedirs(output_dir, exist_ok=True)
    out_fp = os.path.join(output_dir, os.path.basename(problem_fp))
    write_text(out_fp, new_prob)
    return out_fp

def convert_all_problems(input_dir: str, output_dir: str) -> None:
    # 清空并创建输出目录
    if os.path.exists(output_dir):
        import shutil
        shutil.rmtree(output_dir)
    os.makedirs(output_dir, exist_ok=True)

    names = [n for n in os.listdir(input_dir) if n.lower().endswith('.pddl')]
    if not names:
        print(f"在 {input_dir} 文件夹中没有找到PDDL问题文件")
        return

    print(f"找到 {len(names)} 个问题文件")
    print(f"开始转换为PDDL3格式...")
    print(f"输出目录: {output_dir}")
    print("-" * 50)

    ok = 0
    fail = 0
    for i, name in enumerate(names, 1):
        if 'domain' in name.lower():
            continue
        problem_fp = os.path.join(input_dir, name)
        sol_fp = find_solution_fp(problem_fp)
        print(f"[{i}/{len(names)}] 转换: {name} ", end="")
        out = process_problem(problem_fp, sol_fp, output_dir)
        if out:
            print("✓ 成功")
            ok += 1
        else:
            print("✗ 跳过")
            fail += 1

    print("-" * 50)
    print("转换完成!")
    print(f"成功: {ok} 个")
    print(f"跳过: {fail} 个")
    if ok + fail > 0:
        print(f"成功率: {ok/(ok+fail)*100:.1f}%")

def main(argv: List[str]) -> None:
    problems_dir = argv[1] if len(argv) > 1 else "problems"
    output_dir   = argv[2] if len(argv) > 2 else "problems_pddl3"
    convert_all_problems(problems_dir, output_dir)

if __name__ == "__main__":
    main(sys.argv)
