"""
Blocksworld-specific simulation and reward utilities.

This module provides:
1. State simulation engine for Blocksworld actions
2. Constraint checking (sometime-before)
3. Reward computation functions for GRPO training
4. PDDL parsing utilities
"""

from typing import List, Set, Tuple, Optional, Any, Dict, Callable
import math
import re
from pathlib import Path

State = Set[str]          # A state: set of ground atoms
ActionStr = str           # "(stack b1 b2)" format
Trajectory = List[State]  # [s0, s1, ..., sT]


# ---------- Utility Functions ----------

def normalize_atom(atom: str) -> str:
    """Normalize atom string by cleaning whitespace, e.g., '(on  b1   b2)' -> '(on b1 b2)'"""
    atom = atom.strip()
    if not atom.startswith("(") or not atom.endswith(")"):
        return atom
    inside = atom[1:-1].strip()
    parts = inside.split()
    return "(" + " ".join(parts) + ")"


def parse_action(action_str: str) -> Tuple[str, List[str]]:
    """
    Parse '(stack b1 b2)' into ('stack', ['b1', 'b2']).
    Handles line numbers like '0: (stack b1 b2)'.
    """
    s = action_str.strip()
    # Remove line number prefix like '0:' or '10:'
    if ":" in s.split()[0]:
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


# ---------- Blocksworld Action Schema ----------

# Domain action schemas translated to template strings
# {ob}, {underob} will be replaced with concrete arguments
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
    """Replace '(clear {ob})' with ob='b1' to get '(clear b1)', and normalize."""
    out = []
    for t in template_atoms:
        atom = t.format(**kwargs)
        out.append(normalize_atom(atom))
    return out


def transition(state: State, action_str: ActionStr) -> Tuple[Optional[State], Optional[str]]:
    """
    State transition function.
      - state: Current state (set of ground atoms)
      - action_str: Action string like '(stack b1 b2)'

    Returns:
      - new_state: Next state; None if precondition not satisfied
      - error: None or 'precondition_violation' / 'unknown_action' / 'plan_format_error'
    """
    try:
        name, args = parse_action(action_str)
    except ValueError:
        return None, "plan_format_error"

    if name not in ACTIONS:
        return None, "unknown_action"

    schema = ACTIONS[name]

    # Parameter mapping: pickup/putdown have 1 arg; stack/unstack have 2
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

    # 1. Check preconditions
    pre_atoms = instantiate(schema["pre"], **params)
    for p in pre_atoms:
        if p not in state:
            return None, "precondition_violation"

    # 2. Apply add/del effects
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
    Execute entire plan.
      - initial_state: Initial state
      - planning_sequences: List of action strings
    Returns:
      - traj: [s0, s1, ..., sT], always includes at least initial state s0
      - error: None / 'precondition_violation' / 'plan_format_error' / 'unknown_action'
      - violation_step: Step number where violation occurred (1-indexed), None if no violation
    """
    traj: Trajectory = [set(initial_state)]
    current_state = set(initial_state)
    error: Optional[str] = None
    violation_step: Optional[int] = None

    for step_idx, act_str in enumerate(planning_sequences):
        new_state, err = transition(current_state, act_str)
        if err is not None:
            # On error, append current state for analysis
            error = err
            violation_step = step_idx + 1  # 1-indexed
            traj.append(set(current_state))
            break
        current_state = new_state
        traj.append(set(current_state))

    return traj, error, violation_step


def is_on(state: State, x: str, y: str) -> bool:
    return normalize_atom(f"(on {x} {y})") in state


def is_on_table(state: State, x: str) -> bool:
    return normalize_atom(f"(on-table {x})") in state


# ---------- Constraint Checking ----------

def check_sometime_before_constraint(
    traj: Trajectory,
    first_atom: str,
    second_atom: str
) -> Tuple[bool, Optional[int]]:
    """
    Check sometime-before constraint: (sometime-before first_atom second_atom)

    Semantics: first_atom must hold at some point before second_atom holds.

    Returns:
        - (True, None): Constraint satisfied
        - (False, violation_step): Constraint violated at violation_step
    """
    if not traj:
        return True, None

    initial_state = traj[0]
    first_seen_in_trajectory = False
    violation_step = None

    # Check initial state
    first_in_initial = first_atom in initial_state
    second_in_initial = second_atom in initial_state

    if first_in_initial and not second_in_initial:
        pass  # Need to check full trajectory
    elif second_in_initial and not first_in_initial:
        return False, 0

    # Check from second state onwards (skip initial)
    for t in range(1, len(traj)):
        s = traj[t]
        prev_s = traj[t-1]

        # Check if first_atom becomes true
        if first_atom in s and first_atom not in prev_s:
            first_seen_in_trajectory = True

        # Check if second_atom becomes true
        if second_atom in s and second_atom not in prev_s:
            if not first_seen_in_trajectory and not first_in_initial:
                violation_step = t
                return False, violation_step

    # Special case: first_atom in initial but second_atom never becomes true
    if first_in_initial and not second_in_initial:
        second_ever_seen = any(second_atom in s for s in traj)
        if not second_ever_seen:
            return False, 0

    return True, None


def safety_score_sometime_before(
    traj: Trajectory,
    constraint_first: Optional[str] = None,
    constraint_second: Optional[str] = None
) -> float:
    """
    Check sometime-before constraint and return score.

    If constraint_first and constraint_second not provided, uses default
    hardcoded constraint (sometime-before (on b2 b3) (on b1 b2)).

    Returns [-1, 1] score: 1 = no violation; earlier violation = closer to -1.
    """
    if constraint_first is None or constraint_second is None:
        constraint_first = "(on b2 b3)"
        constraint_second = "(on b1 b2)"

    constraint_first = normalize_atom(constraint_first)
    constraint_second = normalize_atom(constraint_second)

    satisfied, violation_step = check_sometime_before_constraint(
        traj, constraint_first, constraint_second
    )

    if satisfied:
        return 1.0
    else:
        T = max(len(traj) - 1, 1)
        frac = (T - violation_step) / T if violation_step is not None else 0.0
        return -(0.5 + 0.5 * frac)


def precondition_violation_score(
    traj: Trajectory,
    violation_step: Optional[int]
) -> float:
    """
    Compute score based on precondition violation step.

    Returns [-1, 1] score: 1.0 if no violation; earlier violation = closer to -1.
    """
    if violation_step is None:
        return 1.0
    else:
        T = max(len(traj) - 1, 1)
        frac = (T - violation_step) / T
        score = 2 * frac - 1
        return float(score)


def goal_score(last_state: State, goal_state: State) -> float:
    """
    Compute goal satisfaction score.

    Checks how many on/on-table atoms from goal_state are satisfied in last_state.
    Returns [-1, 1] score.
    """
    goal_atoms = [
        a for a in goal_state
        if a.startswith("(on ") or a.startswith("(on-table ")
    ]
    if not goal_atoms:
        return 0.0

    satisfied = sum(1 for atom in goal_atoms if atom in last_state)
    frac = satisfied / len(goal_atoms)
    return 2.0 * frac - 1.0


# ---------- Reward Functions ----------

def blocksworld_reward1(
    class_label: str,
    planning_sequences: List[ActionStr],
    initial_state: State,
    goal_state: State,
    constraint_first: Optional[str] = None,
    constraint_second: Optional[str] = None,
) -> float:
    """
    Combined reward function:
      - Discrete label reward (base)
      - Trajectory-level dense reward: safety_score + goal_score (for some categories)

    Note:
      - success_plans and plan_format_error return base_r directly, no dense
    """
    base_reward_table = {
        "success_plans": 1.0,
        "goal_not_satisfied": 0.0,
        "plan_format_error": -0.3,
        "precondition_violation": -0.6,
        "safety_constraints_violation": -1.0,
    }

    base_r = base_reward_table.get(class_label, -0.2)

    # 1. Obvious failures: use base_r directly
    if class_label == "plan_format_error":
        return float(base_r)

    # 2. success_plans: return base_r, no dense
    if class_label == "success_plans":
        return float(base_r)

    # 3. Execute plan, get trajectory + error type + violation_step
    traj, exec_error, violation_step = simulate_plan(initial_state, planning_sequences)

    # Correct label if simulation found precondition violation
    if exec_error == "precondition_violation" and class_label not in [
        "precondition_violation",
        "safety_constraints_violation",
    ]:
        class_label = "precondition_violation"
        base_r = base_reward_table["precondition_violation"]

    if not traj:
        return float(base_r)

    last_state = traj[-1]

    # 3. Compute dense scores
    s_score = safety_score_sometime_before(traj, constraint_first, constraint_second)
    g_score = goal_score(last_state, goal_state)
    use_precondition_score = (class_label == "precondition_violation" or exec_error == "precondition_violation")
    p_score = precondition_violation_score(traj, violation_step if use_precondition_score else None)

    # Select dense based on class_label
    if class_label == "safety_constraints_violation":
        dense = s_score
    elif class_label == "goal_not_satisfied":
        dense = g_score
    elif class_label == "precondition_violation":
        dense = p_score
    else:
        raise ValueError(f"Unknown class_label: {class_label}")

    # 4. Mix base + dense
    alpha = 0.3
    final_r = base_r + alpha * dense
    final_r = max(-1.5, min(1.5, final_r))

    return float(final_r)


def reward_baseline(class_label: str) -> float:
    """
    Baseline reward function: fixed reward based on class_label only.
    No dense reward (goal percentage, safety score, etc.).

    Args:
        class_label: Classification label

    Returns:
        Fixed reward value
    """
    reward_table = {
        "success_plans": 1.0,
        "goal_not_satisfied": 0.0,
        "plan_format_error": -0.3,
        "precondition_violation": -0.6,
        "safety_constraints_violation": -1.0
    }

    if class_label not in reward_table:
        return 0.0

    return reward_table[class_label]


# ---------- Blocksworld Reward with Trajectory-Level RM Rewards ----------

def _normalize_traj_sum(traj_sum: float) -> float:
    """Squash trajectory reward sum into [-1, 1] using tanh."""
    return math.tanh(traj_sum)


def blocksworld_reward2(
    class_label: str,
    step_rm_rewards: List[float],
    alpha: float = 0.8,
) -> float:
    """
    Final scalar reward mixing baseline classifier reward with trajectory RM rewards.

    Args:
        class_label: Final classification label from verifier
        step_rm_rewards: Per-step RM rewards along the generated trajectory
        alpha: Mixing coefficient [0, 1]. Higher = more weight on baseline.

    Returns:
        Scalar reward in [-1.0, 1.0] for GRPO training.
    """
    base_reward = reward_baseline(class_label)

    # Safety constraint violation: ignore trajectory, return baseline directly
    if class_label == "safety_constraints_violation":
        return base_reward

    # Compute trajectory-level reward term
    if not step_rm_rewards:
        traj_score = 0.0
    else:
        traj_sum = sum(step_rm_rewards)
        traj_score = _normalize_traj_sum(traj_sum)

    # Linear mixture
    mixed = alpha * base_reward + (1.0 - alpha) * traj_score
    mixed = max(-1.0, min(1.0, mixed))

    return mixed


# ---------- PDDL Parsing for Blocksworld ----------

def parse_blocksworld_pddl(problem_file: str) -> Optional[Dict[str, Any]]:
    """
    Parse blocksworld PDDL file, extracting initial state, goal state, and constraints.

    Returns: {
        "initial_state": Set[str],
        "goal_state": Set[str],
        "constraint_first": Optional[str],
        "constraint_second": Optional[str]
    }
    """
    try:
        with open(problem_file, 'r') as f:
            content = f.read()
    except Exception:
        return None

    result = {
        "initial_state": set(),
        "goal_state": set(),
        "constraint_first": None,
        "constraint_second": None
    }

    # Extract initial state (:init ...)
    init_match = re.search(r'\(:init\s+(.*?)\)\s*\(:goal', content, re.DOTALL)
    if init_match:
        init_content = init_match.group(1)
        atoms = re.findall(r'\([^)]+\)', init_content)
        result["initial_state"] = {atom.strip() for atom in atoms}

    # Extract goal state (:goal ...)
    goal_match = re.search(r'\(:goal\s+\(and\s+(.*?)\)\s*\)', content, re.DOTALL)
    if goal_match:
        goal_content = goal_match.group(1)
        atoms = re.findall(r'\([^)]+\)', goal_content)
        result["goal_state"] = {atom.strip() for atom in atoms}
    else:
        # Try matching single goal (without and)
        goal_match_single = re.search(r'\(:goal\s+\(([^)]+)\)\s*\)', content, re.DOTALL)
        if goal_match_single:
            goal_atom = f"({goal_match_single.group(1).strip()})"
            result["goal_state"] = {goal_atom}

    # Extract constraints (:constraints ...)
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
    Parse plan sequence from completion text.

    Returns: List[ActionStr] e.g., ["(pickup b1)", "(stack b1 b2)"]
    """
    # Extract all actions (format: (action_name ...))
    actions = re.findall(r'\([^)]+\)', completion)
    # Filter to valid blocksworld actions
    valid_actions = []
    for action in actions:
        action = action.strip()
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
    Blocksworld scenario detailed reward computation.

    Args:
        class_label: Classification label
        completion: Model-generated plan text
        meta: Dict containing problem_file etc.
        repo_root: Project root path
        default_reward_func: Fallback reward function with signature (class_label: str) -> float

    Returns:
        Computed reward value
    """
    try:
        problem_file = meta.get("problem_file")
        if not problem_file:
            return default_reward_func(class_label) if class_label != "unknown" else 0.0

        problem_path = repo_root / problem_file
        if not problem_path.exists():
            return default_reward_func(class_label) if class_label != "unknown" else 0.0

        # Parse PDDL file
        pddl_info = parse_blocksworld_pddl(str(problem_path))
        if not pddl_info:
            return default_reward_func(class_label) if class_label != "unknown" else 0.0

        # Parse plan
        planning_sequences = parse_plan_from_completion(completion)
        if not planning_sequences:
            return default_reward_func(class_label) if class_label != "unknown" else 0.0

        # Normalize state atoms
        initial_state: State = {normalize_atom(atom) for atom in pddl_info["initial_state"]}
        goal_state: State = {normalize_atom(atom) for atom in pddl_info["goal_state"]}

        constraint_first = pddl_info.get("constraint_first")
        constraint_second = pddl_info.get("constraint_second")

        if constraint_first and constraint_second:
            constraint_first = normalize_atom(constraint_first)
            constraint_second = normalize_atom(constraint_second)

        # Compute reward using blocksworld_reward1
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
    except Exception:
        try:
            return default_reward_func(class_label) if class_label != "unknown" else 0.0
        except:
            return 0.0
