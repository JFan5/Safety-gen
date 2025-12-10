from typing import List, Set, Tuple, Optional, Any, Dict, Callable
import math
import re
from pathlib import Path

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


def simulate_plan(initial_state: State, planning_sequences: List[ActionStr]) -> Tuple[Trajectory, Optional[str], Optional[int]]:
    """
    执行整个计划：
      - initial_state: 初始状态
      - planning_sequences: 动作字符串列表
    返回：
      - traj: [s0, s1, ..., sT]，总是至少包含初始状态 s0
      - error: None / 'precondition_violation' / 'plan_format_error' / 'unknown_action'
      - violation_step: 违反发生的步骤（从1开始，表示第几个动作），如果没有违反则为 None
    """
    traj: Trajectory = [set(initial_state)]
    current_state = set(initial_state)
    error: Optional[str] = None
    violation_step: Optional[int] = None

    for step_idx, act_str in enumerate(planning_sequences):
        new_state, err = transition(current_state, act_str)
        if err is not None:
            # 出错时，把当前状态再 append 一次，方便后面分析
            error = err
            violation_step = step_idx + 1  # 步骤从1开始计数
            traj.append(set(current_state))
            break
        current_state = new_state
        traj.append(set(current_state))

    return traj, error, violation_step

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


def precondition_violation_score(
    traj: Trajectory,
    violation_step: Optional[int]
) -> float:
    """
    根据 precondition violation 的 violation_step 计算分数。
    
    返回 [-1, 1] 分数：如果没有违反，返回 1.0；越早违反，越接近 -1。
    """
    if violation_step is None:
        # 没有违反
        return 1.0
    else:
        T = max(len(traj) - 1, 1)
        frac = (T - violation_step) / T  # 0~1
        score = 2 * frac - 1   # frac=1 -> 1; frac=0 -> -1
        return float(score)


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


def blocksworld_reward1(
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
      - 轨迹级 dense reward：safety_score + goal_score（部分类别使用）
    
    注意：
      - success_plans 和 plan_format_error 固定返回 base_r，不加任何 dense
    """
    base_reward_table = {
        "success_plans": 1.0,
        "goal_not_satisfied": 0.0,
        "plan_format_error": -0.3,
        "precondition_violation": -0.6,
        "safety_constraints_violation": -1.0,
    }

    base_r = base_reward_table.get(class_label, -0.2)

    # 1. 明显不合格的几类：直接用 base_r，不去跑 simulate（节省时间）
    if class_label == "plan_format_error":
        return float(base_r)
    
    # 2. success_plans 固定返回 base_r，不加任何 dense
    if class_label == "success_plans":
        return float(base_r)

    # 3. 执行计划，拿到轨迹 + 自动机发现的错误类型 + violation_step
    traj, exec_error, violation_step = simulate_plan(initial_state, planning_sequences)

    # 如果执行中发现 precondition_violation，而 class_label 没标出来，可以纠正一下
    if exec_error == "precondition_violation" and class_label not in [
        "precondition_violation",
        "safety_constraints_violation",
    ]:
        # 更新 class_label 和 base_r
        class_label = "precondition_violation"
        base_r = base_reward_table["precondition_violation"]

    if not traj:
        return float(base_r)

    last_state = traj[-1]

    # 3. 计算 dense 部分：根据 class_label 决定使用哪些分数
    s_score = safety_score_sometime_before(traj, constraint_first, constraint_second)
    g_score = goal_score(last_state, goal_state)
    # 对于 precondition violation score，如果 class_label 或 exec_error 是 precondition_violation，使用 violation_step
    use_precondition_score = (class_label == "precondition_violation" or exec_error == "precondition_violation")
    p_score = precondition_violation_score(traj, violation_step if use_precondition_score else None)
    
    # 根据不同的 class_label 使用不同的 dense 计算方式
    if class_label == "safety_constraints_violation":
        # 对于 safety constraints violation：只使用 safety score，删掉 goal score
        dense = s_score
    elif class_label == "goal_not_satisfied":
        # 对于 goal not satisfied：只使用 goal score，删掉 safety score
        dense = g_score
    elif class_label == "precondition_violation":
        # 对于 precondition violation：只使用 precondition violation score（根据 violation_step）
        dense = p_score
    else:
        raise ValueError(f"Unknown class_label: {class_label}")

    # 4. 用 alpha 调节 dense 对整体 reward 的影响力
    alpha = 0.3
    final_r = base_r + alpha * dense

    # 可选：clip 一下避免太大
    final_r = max(-1.5, min(1.5, final_r))

    return float(final_r)


def reward_baseline(class_label: str) -> float:
    """
    Baseline reward function：只根据 class_label 返回固定的 reward 值。
    不使用任何 dense reward（goal percentage, safety score 等）。

    这是最简单的 reward 计算方式，适合作为 baseline 比较。

    Args:
        class_label: 分类标签

    Returns:
        固定的 reward 值
    """
    reward_table = {
        "success_plans": 1.0,               # 完整达成目标，最高奖励
        "goal_not_satisfied": 0.0,          # 计划是合法的，但没达到目标
        "plan_format_error": -0.3,          # 语法格式错误（括号、关键字等）
        "precondition_violation": -0.6,     # 动作在当前 state 下不可执行
        "safety_constraints_violation": -1.0  # 违反安全约束，最严重
    }

    if class_label not in reward_table:
        # 未知标签返回 0
        return 0.0

    return reward_table[class_label]


# -----------------------------------------------------------------------------
# Blocksworld Reward with Trajectory-Level RM Rewards
# -----------------------------------------------------------------------------

def _normalize_traj_sum(traj_sum: float) -> float:
    """
    Squash a trajectory reward sum into the range [-1, 1] using tanh.

    Args:
        traj_sum: The raw sum of per-step RM rewards.

    Returns:
        A value in [-1, 1].
    """
    return math.tanh(traj_sum)


def blocksworld_reward2(
    class_label: str,
    step_rm_rewards: List[float],
    alpha: float = 0.8,
) -> float:
    """
    Compute a final scalar reward for a BlocksWorld plan by mixing the
    baseline classifier reward with trajectory-level Reward Machine (RM) rewards.

    This function combines two reward signals:
    1. **Coarse-grained baseline reward**: Obtained from `reward_baseline(class_label)`,
       which provides a fixed reward based on the final verifier classification
       (e.g., success, goal not satisfied, format error, precondition violation,
       or safety constraint violation).
    2. **Trajectory-level RM rewards**: A list of per-step rewards from a Reward
       Machine that captures fine-grained progress along the generated plan.

    The final reward is a linear mixture of these two signals, suitable for use
    as the GRPO reward for training.

    Args:
        class_label: The final classification label for the plan from the verifier.
                     Valid values include:
                     - "success_plans": Plan achieves the goal successfully.
                     - "goal_not_satisfied": Plan is valid but doesn't achieve goal.
                     - "plan_format_error": Plan has syntax/format errors.
                     - "precondition_violation": An action's preconditions not met.
                     - "safety_constraints_violation": Plan violates safety constraints.
        step_rm_rewards: A list of per-step RM rewards along the generated trajectory.
                         Each element represents the reward for a single action step.
                         Can be empty if no trajectory information is available.
        alpha: Mixing coefficient in [0, 1]. Controls the balance between:
               - Higher alpha (closer to 1): More weight on baseline classifier reward.
               - Lower alpha (closer to 0): More weight on trajectory RM reward.
               Default is 0.8 (80% baseline, 20% trajectory).

    Returns:
        A single scalar reward in [-1.0, 1.0] to be used as the GRPO reward
        for this trajectory.

    Example:
        >>> # A successful plan with positive trajectory rewards
        >>> blocksworld_reward2("success_plans", [0.5, 0.5, 0.5], alpha=0.8)
        0.892  # 0.8 * 1.0 + 0.2 * tanh(1.5)

        >>> # Safety violation - trajectory rewards are ignored
        >>> blocksworld_reward2("safety_constraints_violation", [0.5, 0.5], alpha=0.8)
        -1.0  # Returns baseline reward directly
    """
    # Get baseline reward from the existing classifier
    base_reward = reward_baseline(class_label)

    # Safety constraint violation is treated as a hard constraint.
    # We ignore trajectory rewards and return the baseline penalty directly.
    if class_label == "safety_constraints_violation":
        return base_reward

    # Compute trajectory-level reward term
    if not step_rm_rewards:
        # No trajectory information available, use 0 as neutral
        traj_score = 0.0
    else:
        # Sum up per-step rewards and normalize to [-1, 1]
        traj_sum = sum(step_rm_rewards)
        traj_score = _normalize_traj_sum(traj_sum)

    # Linear mixture of baseline reward and trajectory score
    # Both base_reward and traj_score are in [-1, 1]
    mixed = alpha * base_reward + (1.0 - alpha) * traj_score

    # Clip to ensure the result stays in [-1.0, 1.0]
    mixed = max(-1.0, min(1.0, mixed))

    return mixed


# -----------------------------------------------------------------------------
# PDDL Parsing for Blocksworld
# -----------------------------------------------------------------------------
def parse_blocksworld_pddl(problem_file: str) -> Optional[Dict[str, Any]]:
    """
    解析 blocksworld PDDL 文件，提取初始状态、目标状态和约束
    
    返回: {
        "initial_state": Set[str],
        "goal_state": Set[str],
        "constraint_first": Optional[str],
        "constraint_second": Optional[str]
    }
    """
    try:
        with open(problem_file, 'r') as f:
            content = f.read()
    except Exception as e:
        return None
    
    result = {
        "initial_state": set(),
        "goal_state": set(),
        "constraint_first": None,
        "constraint_second": None
    }
    
    # 提取初始状态 (:init ...)
    init_match = re.search(r'\(:init\s+(.*?)\)\s*\(:goal', content, re.DOTALL)
    if init_match:
        init_content = init_match.group(1)
        # 提取所有原子命题
        atoms = re.findall(r'\([^)]+\)', init_content)
        result["initial_state"] = {atom.strip() for atom in atoms}
    
    # 提取目标状态 (:goal ...)
    goal_match = re.search(r'\(:goal\s+\(and\s+(.*?)\)\s*\)', content, re.DOTALL)
    if goal_match:
        goal_content = goal_match.group(1)
        atoms = re.findall(r'\([^)]+\)', goal_content)
        result["goal_state"] = {atom.strip() for atom in atoms}
    else:
        # 尝试匹配单个目标（没有 and）
        goal_match_single = re.search(r'\(:goal\s+\(([^)]+)\)\s*\)', content, re.DOTALL)
        if goal_match_single:
            goal_atom = f"({goal_match_single.group(1).strip()})"
            result["goal_state"] = {goal_atom}
    
    # 提取约束 (:constraints ...)
    # 匹配 sometime-before 约束
    constraint_match = re.search(
        r'\(:constraints\s+\(sometime-before\s+\(([^)]+)\)\s+\(([^)]+)\)\s*\)\s*\)',
        content, re.DOTALL
    )
    if constraint_match:
        result["constraint_first"] = f"({constraint_match.group(1).strip()})"
        result["constraint_second"] = f"({constraint_match.group(2).strip()})"
    
    return result


def parse_plan_from_completion(completion: str) -> List[ActionStr]:
    """
    从 completion 文本中解析出计划序列
    
    返回: List[ActionStr] 例如 ["(pickup b1)", "(stack b1 b2)"]
    """
    # 提取所有动作（格式: (action_name ...)）
    actions = re.findall(r'\([^)]+\)', completion)
    # 过滤掉明显不是动作的行（比如注释、说明等）
    valid_actions = []
    for action in actions:
        action = action.strip()
        # blocksworld 的动作: pickup, putdown, stack, unstack
        if any(action.startswith(f"({op}") for op in ["pickup", "putdown", "stack", "unstack"]):
            valid_actions.append(action)
    return valid_actions


def compute_blocksworld_reward_from_meta(
    class_label: str,
    completion: str,
    meta: Dict[str, Any],
    repo_root: Path,
    default_reward_func: Callable[[str], float],
) -> float:
    """
    Blocksworld 场景的详细 reward 计算函数
    
    Args:
        class_label: 分类标签
        completion: 模型生成的计划文本
        meta: 包含 problem_file 等信息的字典
        repo_root: 项目根目录路径
        default_reward_func: 默认的 reward 计算函数，签名 (class_label: str) -> float
    
    Returns:
        计算得到的 reward 值
    """
    try:
        problem_file = meta.get("problem_file")
        if not problem_file:
            # 没有 problem_file，回退到简单奖励
            return default_reward_func(class_label) if class_label != "unknown" else 0.0
        
        problem_path = repo_root / problem_file
        if not problem_path.exists():
            # 文件不存在，回退到简单奖励
            return default_reward_func(class_label) if class_label != "unknown" else 0.0
        
        # 解析 PDDL 文件
        pddl_info = parse_blocksworld_pddl(str(problem_path))
        if not pddl_info:
            # PDDL 解析失败，回退到简单奖励
            return default_reward_func(class_label) if class_label != "unknown" else 0.0
        
        # 解析计划
        planning_sequences = parse_plan_from_completion(completion)
        if not planning_sequences:
            # 无法解析计划，回退到简单奖励
            return default_reward_func(class_label) if class_label != "unknown" else 0.0
        
        # 规范化状态原子
        initial_state: State = {normalize_atom(atom) for atom in pddl_info["initial_state"]}
        goal_state: State = {normalize_atom(atom) for atom in pddl_info["goal_state"]}
        
        constraint_first = pddl_info.get("constraint_first")
        constraint_second = pddl_info.get("constraint_second")
        
        if constraint_first and constraint_second:
            constraint_first = normalize_atom(constraint_first)
            constraint_second = normalize_atom(constraint_second)
        
        # 使用 blocksworld_reward1 计算奖励
        class_label_for_reward = class_label if class_label != "unknown" else "goal_not_satisfied"

        r = blocksworld_reward1(
            class_label_for_reward,
            planning_sequences,
            initial_state,
            goal_state,
            constraint_first=constraint_first,
            constraint_second=constraint_second,
        )
        
        return float(r)
    except Exception as e:
        # 任何错误都回退到简单奖励
        try:
            return default_reward_func(class_label) if class_label != "unknown" else 0.0
        except:
            return 0.0
