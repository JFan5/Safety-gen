from typing import List, Set, Tuple, Optional, Any, Dict

State = Set[str]          # 一个状态：很多原子命题的集合
ActionStr = str           # "(stack b1 b2)" 这种
Trajectory = List[State]  # [s0, s1, ..., sT]

# ---------- 一些小工具 ----------

def normalize_atom(atom: str) -> str:
    """简单清理一下原子字符串的空格，比如 '(on  b1   b2)' -> '(on b1 b2)'"""
    atom = atom.strip()
    if not atom.startswith("(") or not atom.endswith(")"):
        return atom
    inside = atom[1:-1].strip()
    parts = inside.split()
    return "(" + " ".join(parts) + ")"


def parse_action(action_str: str) -> Tuple[str, List[str]]:
    """
    把 '(stack b1 b2)' 解析成 ('stack', ['b1', 'b2'])
    如果你的 plan 里有行号 '0: (stack b1 b2)'，先把 '0:' 去掉。
    """
    s = action_str.strip()
    # 去掉前面的行号，比如 '0:' 这种
    if ":" in s.split()[0]:
        # 形如 '0:' 或 '10:'
        s = s.split(":", 1)[1].strip()

    if not s.startswith("(") or not s.endswith(")"):
        raise ValueError(f"Invalid action format: {action_str!r}")

    inside = s[1:-1].strip()
    parts = inside.split()
    if len(parts) == 0:
        raise ValueError(f"Empty action: {action_str!r}")

    name = parts[0]
    args = parts[1:]
    return name, args


# ---------- Blocksworld action schema ----------

# 这里直接把你 domain 里的 pre/effect 翻译成模板字符串
# {ob}, {underob} 会用具体参数替换
ACTIONS: Dict[str, Dict[str, List[str]]] = {
    "pickup": {
        "pre": [
            "(clear {ob})",
            "(on-table {ob})",
            "(arm-empty)",
        ],
        "add": [
            "(holding {ob})",
        ],
        "del": [
            "(clear {ob})",
            "(on-table {ob})",
            "(arm-empty)",
        ],
    },
    "putdown": {
        "pre": [
            "(holding {ob})",
        ],
        "add": [
            "(clear {ob})",
            "(arm-empty)",
            "(on-table {ob})",
        ],
        "del": [
            "(holding {ob})",
        ],
    },
    "stack": {
        "pre": [
            "(clear {underob})",
            "(holding {ob})",
        ],
        "add": [
            "(arm-empty)",
            "(clear {ob})",
            "(on {ob} {underob})",
        ],
        "del": [
            "(clear {underob})",
            "(holding {ob})",
        ],
    },
    "unstack": {
        "pre": [
            "(on {ob} {underob})",
            "(clear {ob})",
            "(arm-empty)",
        ],
        "add": [
            "(holding {ob})",
            "(clear {underob})",
        ],
        "del": [
            "(on {ob} {underob})",
            "(clear {ob})",
            "(arm-empty)",
        ],
    },
}


def instantiate(template_atoms: List[str], **kwargs) -> List[str]:
    """把 '(clear {ob})' 用 ob='b1' 替换成 '(clear b1)'，并做 normalize。"""
    out = []
    for t in template_atoms:
        atom = t.format(**kwargs)
        out.append(normalize_atom(atom))
    return out


def transition(state: State, action_str: ActionStr) -> Tuple[Optional[State], Optional[str]]:
    """
    状态转移：
      - state: 当前状态（一堆原子命题）
      - action_str: 形如 '(stack b1 b2)' 的动作

    返回：
      - new_state: 下一个状态；如果 precondition 不满足，返回 None
      - error: None 或 'precondition_violation' / 'unknown_action'
    """
    try:
        name, args = parse_action(action_str)
    except ValueError:
        return None, "plan_format_error"

    if name not in ACTIONS:
        return None, "unknown_action"

    schema = ACTIONS[name]

    # 参数映射：pickup 只有 ob，一个参数；stack/unstack 有 ob, underob
    if name in ["pickup", "putdown"]:
        if len(args) != 1:
            return None, "plan_format_error"
        ob = args[0]
        params = {"ob": ob}
    else:  # stack/unstack
        if len(args) != 2:
            return None, "plan_format_error"
        ob, underob = args
        params = {"ob": ob, "underob": underob}

    # 1. 检查前置条件
    pre_atoms = instantiate(schema["pre"], **params)
    for p in pre_atoms:
        if p not in state:
            return None, "precondition_violation"

    # 2. 应用 add / del
    new_state: State = set(state)
    del_atoms = instantiate(schema["del"], **params)
    add_atoms = instantiate(schema["add"], **params)

    for d in del_atoms:
        if d in new_state:
            new_state.remove(d)
    for a in add_atoms:
        new_state.add(a)

    return new_state, None


def simulate_plan(initial_state: State, planning_sequences: List[ActionStr]) -> Tuple[Trajectory, Optional[str]]:
    """
    执行整个计划：
      - initial_state: 初始状态
      - planning_sequences: 动作字符串列表
    返回：
      - traj: [s0, s1, ..., sT]，总是至少包含初始状态 s0
      - error: None / 'precondition_violation' / 'plan_format_error' / 'unknown_action'
    """
    traj: Trajectory = [set(initial_state)]
    current_state = set(initial_state)
    error: Optional[str] = None

    for act_str in planning_sequences:
        new_state, err = transition(current_state, act_str)
        if err is not None:
            # 出错时，把当前状态再 append 一次，方便后面分析
            error = err
            traj.append(set(current_state))
            break
        current_state = new_state
        traj.append(set(current_state))

    return traj, error

def is_on(state: State, x: str, y: str) -> bool:
    return normalize_atom(f"(on {x} {y})") in state

def is_on_table(state: State, x: str) -> bool:
    return normalize_atom(f"(on-table {x})") in state


def check_sometime_before_constraint(
    traj: Trajectory,
    first_atom: str,
    second_atom: str
) -> Tuple[bool, Optional[int]]:
    """
    检查 sometime-before 约束: (sometime-before first_atom second_atom)
    
    语义：在 second_atom 成立之前，first_atom 必须先成立过。
    
    返回:
        - (True, None): 约束满足
        - (False, violation_step): 约束违反，violation_step 是违反发生的步骤
    
    重要：根据 PDDL3 验证器的行为，如果初始状态中 first_atom 已经满足，
    而 second_atom 还没有满足，这应该是违反的，因为 first_atom 没有在轨迹中"发生"，
    而是在初始状态就已经存在了。约束要求的是 first_atom 必须在轨迹中发生，
    而不是在初始状态就已经存在。
    """
    if not traj:
        return True, None
    
    initial_state = traj[0]
    first_seen_in_trajectory = False  # 在轨迹中（不包括初始状态）是否见过 first_atom
    violation_step = None
    
    # 检查初始状态
    first_in_initial = first_atom in initial_state
    second_in_initial = second_atom in initial_state
    
    # 如果初始状态中 first_atom 已经满足，而 second_atom 还没有满足，这是违反的
    # 因为 first_atom 没有在轨迹中发生，而是在初始状态就已经存在了
    if first_in_initial and not second_in_initial:
        # 但是，如果后来 second_atom 成立了，这应该是满足的（因为 first_atom 已经在 second_atom 之前了）
        # 所以我们需要检查整个轨迹
        pass
    elif second_in_initial and not first_in_initial:
        # 如果初始状态中 second_atom 已经满足，而 first_atom 还没有满足，这是违反的
        return False, 0
    
    # 从第二个状态开始检查（跳过初始状态）
    for t in range(1, len(traj)):
        s = traj[t]
        prev_s = traj[t-1]
        
        # 检查 first_atom 是否在当前状态中（且不在前一个状态中，表示"发生"）
        if first_atom in s and first_atom not in prev_s:
            first_seen_in_trajectory = True
        
        # 检查 second_atom 是否在当前状态中（且不在前一个状态中，表示"发生"）
        if second_atom in s and second_atom not in prev_s:
            if not first_seen_in_trajectory and not first_in_initial:
                # second_atom 在轨迹中发生，但 first_atom 还没有在轨迹中发生，且初始状态中也没有 -> 违反
                violation_step = t
                return False, violation_step
    
    # 特殊情况：如果初始状态中 first_atom 已经满足，而 second_atom 还没有满足
    # 且在整个轨迹中 second_atom 从未成立，这应该是违反的
    # 因为约束要求的是 first_atom 必须在轨迹中发生，而不是在初始状态就已经存在
    if first_in_initial and not second_in_initial:
        # 检查 second_atom 是否在轨迹中成立过
        second_ever_seen = any(second_atom in s for s in traj)
        if not second_ever_seen:
            # second_atom 从未成立，但 first_atom 在初始状态就已经存在 -> 违反
            return False, 0
    
    # 没有违反
    return True, None


def safety_score_sometime_before(
    traj: Trajectory,
    constraint_first: Optional[str] = None,
    constraint_second: Optional[str] = None
) -> float:
    """
    检查 sometime-before 约束并返回分数。
    
    如果提供了 constraint_first 和 constraint_second，使用它们；
    否则使用默认的硬编码约束 (sometime-before (on b2 b3) (on b1 b2))。
    
    返回 [-1, 1] 分数：1 = 完全没违反；越早违反，越接近 -1。
    """
    # 如果没有提供约束，使用默认的硬编码约束
    if constraint_first is None or constraint_second is None:
        constraint_first = "(on b2 b3)"
        constraint_second = "(on b1 b2)"
    
    # 规范化原子字符串
    constraint_first = normalize_atom(constraint_first)
    constraint_second = normalize_atom(constraint_second)
    
    # 检查约束
    satisfied, violation_step = check_sometime_before_constraint(
        traj, constraint_first, constraint_second
    )
    
    if satisfied:
        return 1.0
    else:
        # 越早违反，frac 越小；惩罚越大
        T = max(len(traj) - 1, 1)
        frac = (T - violation_step) / T if violation_step is not None else 0.0  # 0~1
        return -(0.5 + 0.5 * frac)       # [-1, -0.5] 左右


def goal_score(last_state: State, goal_state: State) -> float:
    """
    简单把 goal_state 里的 on / on-table 原子当作目标 atom，
    看 last_state 满足了多少个。
    goal_state 也假设是 set[str] 形式。
    返回 [-1,1]
    """
    goal_atoms = [
        a for a in goal_state
        if a.startswith("(on ") or a.startswith("(on-table ")
    ]
    if not goal_atoms:
        return 0.0

    satisfied = sum(1 for atom in goal_atoms if atom in last_state)
    frac = satisfied / len(goal_atoms)   # 0~1
    return 2.0 * frac - 1.0              # 映射到 [-1,1]


def blocksworld_reward(
    class_label: str,
    planning_sequences: List[ActionStr],
    initial_state: State,
    goal_state: State,
    constraint_first: Optional[str] = None,
    constraint_second: Optional[str] = None,
) -> float:
    """
    综合：
      - 离散标签 reward（你之前那套 label）
      - 轨迹级 dense reward：safety_score + goal_score
    """
    base_reward_table = {
        "success_plans": 1.0,
        "goal_not_satisfied": 0.0,
        "plan_format_error": -0.5,
        "precondition_violation": -0.7,
        "safety_constraints_violation": -1.0,
    }

    base_r = base_reward_table.get(class_label, -0.2)

    # 1. 明显不合格的几类：直接用 base_r，不去跑 simulate（节省时间）
    if class_label in ["plan_format_error", "precondition_violation"]:
        return float(base_r)

    # 2. 执行计划，拿到轨迹 + 自动机发现的错误类型
    traj, exec_error = simulate_plan(initial_state, planning_sequences)

    # 如果执行中发现 precondition_violation，而 class_label 没标出来，可以纠正一下
    if exec_error == "precondition_violation" and class_label not in [
        "precondition_violation",
        "safety_constraints_violation",
    ]:
        # 你可以选择覆盖标签，也可以单独统计
        base_r = base_reward_table["precondition_violation"]
        return float(base_r)

    if not traj:
        return float(base_r)

    last_state = traj[-1]

    # 3. 计算 dense 部分：安全 + 目标距离
    s_score = safety_score_sometime_before(traj, constraint_first, constraint_second)
    g_score = goal_score(last_state, goal_state)
    dense = 0.7 * s_score + 0.3 * g_score   # [-1,1] 左右

    # 4. 用 alpha 调节 dense 对整体 reward 的影响力
    alpha = 0.3
    final_r = base_r + alpha * dense

    # 可选：clip 一下避免太大
    final_r = max(-1.5, min(1.5, final_r))

    return float(final_r)
