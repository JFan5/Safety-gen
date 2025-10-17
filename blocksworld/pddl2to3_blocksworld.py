
import os
import re
import sys
from typing import List, Tuple, Dict, Optional

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
        self.on = set(init.get("on", set()))
        self.on_table = set(init.get("on-table", set()))
        self.clear = set(init.get("clear", set()))
        self.arm_empty = (len(init.get("arm-empty", set())) > 0)
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

def pick_constraint(goals, achieved):
    pairs = []
    for i in range(len(goals)):
        for j in range(len(goals)):
            if i == j: continue
            A, B = goals[i], goals[j]
            ta, tb = achieved.get(A), achieved.get(B)
            if ta is not None and tb is not None and ta < tb:
                pairs.append((A, B, ta, tb))
    if pairs:
        pairs.sort(key=lambda x: (x[3]-x[2], x[2]))
        A, B, *_ = pairs[-1]
        return A, B
    # 没有严格先后时，若至少两个不同目标，选择任意一对；否则跳过（不插入约束）
    if len(goals) >= 2:
        return goals[0], goals[1]
    return None

def lit_to_str(lit: Literal) -> str:
    pred, args = lit
    if len(args) == 0:
        return f"({pred})"
    return f"({pred} {' '.join(args)})"

def inject_constraints(problem_raw: str, A: Literal, B: Literal) -> str:
    s = problem_raw.strip()
    # 不在 problem 顶层插入/修改 :requirements，保持与 convert_pddl3 一致

    if A[0] == "arm-empty" and A[1] == tuple():
        cons = f"(sometime-before {lit_to_str(B)} (arm-empty))"
    else:
        cons = f"(sometime-before {lit_to_str(B)} {lit_to_str(A)})"

    if re.search(r"\(:constraints\s*\(", s, flags=re.IGNORECASE|re.DOTALL):
        s = re.sub(r"\(:constraints\s*\((.*?)\)\s*\)",
                   lambda m: f"(:constraints ({m.group(1)} {cons}))",
                   s, flags=re.IGNORECASE|re.DOTALL, count=1)
    else:
        s = s.rstrip(")")
        s += f"\n(:constraints\n  {cons}\n)\n)"
    return s

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
        print(f"[WARN] No solution file for {problem_fp}; using empty plan (fallback constraint).", file=sys.stderr)

    achieved = first_achievements(objects, init, plan, goals)
    picked = pick_constraint(goals, achieved)
    if not picked:
        # 无可插入的约束，跳过
        return None
    A, B = picked
    new_prob = inject_constraints(prob_raw, A, B)

    os.makedirs(output_dir, exist_ok=True)
    out_fp = os.path.join(output_dir, os.path.basename(problem_fp))
    write_text(out_fp, new_prob)
    return out_fp

def find_solution_fp(problem_fp: str) -> Optional[str]:
    base, _ = os.path.splitext(problem_fp)
    for ext in (".soln", ".sol", ".plan", ".solution", ".txt"):
        cand = base + ext
        if os.path.exists(cand):
            return cand
    return None

def convert_all_problems(input_dir: str, output_dir: str) -> None:
    # 清空并创建输出目录（与 convert_pddl3 对齐）
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
        # 避免误处理 domain 文件（若存在）
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
            print("✗ 失败")
            fail += 1

    print("-" * 50)
    print("转换完成!")
    print(f"成功: {ok} 个")
    print(f"失败: {fail} 个")
    if ok + fail > 0:
        print(f"成功率: {ok/(ok+fail)*100:.1f}%")


def main(argv: List[str]) -> None:
    # 与 convert_pddl3 一致：支持 <输入目录> [输出目录]，无参数时使用默认
    problems_dir = argv[1] if len(argv) > 1 else "problems"
    output_dir   = argv[2] if len(argv) > 2 else "problems_pddl3"
    convert_all_problems(problems_dir, output_dir)

if __name__ == "__main__":
    main(sys.argv)
