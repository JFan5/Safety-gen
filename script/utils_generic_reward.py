"""
Generic Reward Calculation Framework for PDDL Planning Scenarios.

This module provides a unified interface for computing dense rewards across
different planning domains (blocksworld, ferry, grippers, spanner, etc.).

Architecture:
    ScenarioRewardCalculator (ABC)
        ├── BlocksworldRewardCalculator
        ├── FerryRewardCalculator
        ├── GrippersRewardCalculator
        └── SpannerRewardCalculator

Usage:
    from utils_generic_reward import get_reward_calculator, compute_scenario_reward

    # Option 1: Use factory function
    calculator = get_reward_calculator("blocksworld")
    reward = calculator.compute_reward(class_label, completion, meta, repo_root)

    # Option 2: Use convenience function
    reward = compute_scenario_reward("ferry", class_label, completion, meta, repo_root)
"""

from abc import ABC, abstractmethod
from typing import Set, List, Dict, Any, Optional, Tuple, Callable
from pathlib import Path
import re
import logging

logger = logging.getLogger("generic_reward")

# Type aliases
State = Set[str]
ActionStr = str
Trajectory = List[State]


# =============================================================================
# Common Utilities
# =============================================================================

def normalize_atom(atom: str) -> str:
    """Normalize atom string by cleaning up whitespace."""
    atom = atom.strip()
    if not atom.startswith("(") or not atom.endswith(")"):
        return atom
    inside = atom[1:-1].strip()
    parts = inside.split()
    return "(" + " ".join(parts) + ")"


def parse_action(action_str: str) -> Tuple[str, List[str]]:
    """
    Parse action string like '(stack b1 b2)' into ('stack', ['b1', 'b2']).
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


def instantiate_templates(templates: List[str], **kwargs) -> List[str]:
    """Instantiate template atoms with given parameters."""
    return [normalize_atom(t.format(**kwargs)) for t in templates]


def violation_penalty(violation_step: int, total_steps: int) -> float:
    """
    Calculate penalty based on violation step.
    Earlier violations get larger penalties.

    Returns: [-1, -0.5] range
    """
    T = max(total_steps, 1)
    frac = (T - violation_step) / T  # 0~1
    return -(0.5 + 0.5 * frac)


# =============================================================================
# Base Reward Table (Common across all scenarios)
# =============================================================================

BASE_REWARD_TABLE = {
    "success_plans": 1.0,
    "goal_not_satisfied": 0.0,
    "plan_format_error": -0.3,
    "precondition_violation": -0.7,
    "safety_constraints_violation": -1.0,
}


def get_base_reward(class_label: str) -> float:
    """Get base reward from class label."""
    return BASE_REWARD_TABLE.get(class_label, -0.2)


# =============================================================================
# Abstract Base Class
# =============================================================================

class ScenarioRewardCalculator(ABC):
    """
    Abstract base class for scenario-specific reward calculators.

    Subclasses must implement:
        - get_action_schema(): Define actions with preconditions and effects
        - parse_pddl(): Parse scenario-specific PDDL problem files
        - parse_plan(): Extract action sequence from model completion
        - get_goal_predicates(): Define which predicates count toward goal satisfaction

    Optional overrides:
        - check_safety_constraints(): Check scenario-specific safety constraints
    """

    # Class-level action schema (override in subclasses)
    ACTION_SCHEMA: Dict[str, Dict[str, List[str]]] = {}

    # Predicates that count toward goal satisfaction
    GOAL_PREDICATES: List[str] = []

    # Valid action names for this scenario
    VALID_ACTIONS: List[str] = []

    def __init__(self):
        self._action_schema = self.get_action_schema()
        self._goal_predicates = self.get_goal_predicates()
        self._valid_actions = list(self._action_schema.keys())

    @abstractmethod
    def get_action_schema(self) -> Dict[str, Dict[str, List[str]]]:
        """
        Return action schema dictionary.

        Format:
            {
                "action_name": {
                    "params": ["param1", "param2"],  # Parameter names
                    "pre": ["(pred {param1})", ...],  # Precondition templates
                    "add": ["(pred {param1})", ...],  # Add effects
                    "del": ["(pred {param1})", ...],  # Delete effects
                }
            }
        """
        pass

    @abstractmethod
    def parse_pddl(self, problem_file: str) -> Optional[Dict[str, Any]]:
        """
        Parse PDDL problem file.

        Returns:
            {
                "initial_state": Set[str],
                "goal_state": Set[str],
                "constraints": Dict[str, Any],  # Scenario-specific constraints
                ...  # Additional scenario-specific info
            }
        """
        pass

    @abstractmethod
    def parse_plan(self, completion: str) -> List[ActionStr]:
        """
        Extract action sequence from model completion.

        Returns: List of action strings like ["(action arg1 arg2)", ...]
        """
        pass

    @abstractmethod
    def get_goal_predicates(self) -> List[str]:
        """
        Return list of predicate prefixes that count toward goal satisfaction.

        Example: ["(on ", "(on-table "] for blocksworld
        """
        pass

    def map_action_params(self, action_name: str, args: List[str]) -> Optional[Dict[str, str]]:
        """
        Map action arguments to parameter names.
        Override if parameter mapping is non-trivial.
        """
        schema = self._action_schema.get(action_name)
        if not schema:
            return None

        param_names = schema.get("params", [])
        if len(args) != len(param_names):
            return None

        return dict(zip(param_names, args))

    def transition(self, state: State, action_str: ActionStr) -> Tuple[Optional[State], Optional[str]]:
        """
        Apply action to state and return new state.

        Returns:
            (new_state, None) if successful
            (None, error_type) if failed
        """
        try:
            name, args = parse_action(action_str)
        except ValueError:
            return None, "plan_format_error"

        if name not in self._action_schema:
            return None, "unknown_action"

        schema = self._action_schema[name]
        params = self.map_action_params(name, args)

        if params is None:
            return None, "plan_format_error"

        # Check preconditions
        pre_atoms = instantiate_templates(schema["pre"], **params)
        for p in pre_atoms:
            if p not in state:
                return None, "precondition_violation"

        # Apply effects
        new_state: State = set(state)
        del_atoms = instantiate_templates(schema.get("del", []), **params)
        add_atoms = instantiate_templates(schema.get("add", []), **params)

        for d in del_atoms:
            new_state.discard(d)
        for a in add_atoms:
            new_state.add(a)

        return new_state, None

    def simulate_plan(
        self,
        initial_state: State,
        actions: List[ActionStr]
    ) -> Tuple[Trajectory, Optional[str], Optional[int]]:
        """
        Execute plan and return trajectory.

        Returns:
            (trajectory, error_type, violation_step)
            - trajectory: [s0, s1, ..., sT]
            - error_type: None or error string
            - violation_step: Step number (1-indexed) where error occurred
        """
        traj: Trajectory = [set(initial_state)]
        current_state = set(initial_state)

        for step_idx, action in enumerate(actions):
            new_state, error = self.transition(current_state, action)
            if error is not None:
                traj.append(set(current_state))
                return traj, error, step_idx + 1
            current_state = new_state
            traj.append(set(current_state))

        return traj, None, None

    def goal_score(self, last_state: State, goal_state: State) -> float:
        """
        Calculate goal satisfaction score.

        Returns: [-1, 1] where 1 means all goals satisfied
        """
        goal_atoms = [
            a for a in goal_state
            if any(a.startswith(prefix) for prefix in self._goal_predicates)
        ]

        if not goal_atoms:
            return 0.0

        satisfied = sum(1 for atom in goal_atoms if atom in last_state)
        frac = satisfied / len(goal_atoms)
        return 2.0 * frac - 1.0  # Map [0,1] to [-1,1]

    def check_safety_constraints(
        self,
        traj: Trajectory,
        constraints: Dict[str, Any]
    ) -> Tuple[bool, Optional[int], float]:
        """
        Check safety constraints on trajectory.

        Returns:
            (satisfied, violation_step, score)
            - satisfied: True if all constraints satisfied
            - violation_step: Step where violation occurred (or None)
            - score: [-1, 1] constraint satisfaction score

        Default implementation handles 'sometime-before' constraints.
        Override for scenario-specific constraints.
        """
        if not constraints:
            return True, None, 1.0

        constraint_type = constraints.get("type")

        if constraint_type == "sometime-before":
            return self._check_sometime_before(
                traj,
                constraints.get("first"),
                constraints.get("second")
            )
        elif constraint_type == "sometime-before-list":
            # Handle multiple sometime-before constraints
            constraint_list = constraints.get("constraints", [])
            all_satisfied = True
            worst_step = None
            total_score = 0.0
            for c in constraint_list:
                sat, step, score = self._check_sometime_before(
                    traj, c.get("first"), c.get("second")
                )
                total_score += score
                if not sat:
                    all_satisfied = False
                    if worst_step is None or (step is not None and step < worst_step):
                        worst_step = step
            avg_score = total_score / len(constraint_list) if constraint_list else 1.0
            return all_satisfied, worst_step, avg_score

        # Unknown constraint type - assume satisfied
        return True, None, 1.0

    def _check_sometime_before(
        self,
        traj: Trajectory,
        first_atom: Optional[str],
        second_atom: Optional[str]
    ) -> Tuple[bool, Optional[int], float]:
        """
        Check sometime-before constraint: first_atom must happen before second_atom.
        """
        if not first_atom or not second_atom or not traj:
            return True, None, 1.0

        first_atom = normalize_atom(first_atom)
        second_atom = normalize_atom(second_atom)

        initial_state = traj[0]
        first_in_initial = first_atom in initial_state
        second_in_initial = second_atom in initial_state

        # If second already holds but first never did -> violation
        if second_in_initial and not first_in_initial:
            return False, 0, -1.0

        first_seen = first_in_initial

        for t in range(1, len(traj)):
            s = traj[t]
            prev_s = traj[t-1]

            # Check if first_atom becomes true
            if first_atom in s and first_atom not in prev_s:
                first_seen = True

            # Check if second_atom becomes true before first was seen
            if second_atom in s and second_atom not in prev_s:
                if not first_seen:
                    T = max(len(traj) - 1, 1)
                    frac = (T - t) / T
                    score = -(0.5 + 0.5 * frac)
                    return False, t, score

        return True, None, 1.0

    def compute_reward(
        self,
        class_label: str,
        completion: str,
        meta: Dict[str, Any],
        repo_root: Path,
        default_reward_func: Optional[Callable[[str], float]] = None
    ) -> float:
        """
        Main entry point for reward computation.

        Args:
            class_label: Classification label from validator
            completion: Model-generated plan text
            meta: Metadata dict containing problem_file etc.
            repo_root: Repository root path
            default_reward_func: Fallback reward function

        Returns:
            Computed reward value
        """
        if default_reward_func is None:
            default_reward_func = get_base_reward

        try:
            # Get problem file path
            problem_file = meta.get("problem_file")
            if not problem_file:
                return default_reward_func(class_label) if class_label != "unknown" else 0.0

            problem_path = repo_root / problem_file
            if not problem_path.exists():
                return default_reward_func(class_label) if class_label != "unknown" else 0.0

            # Parse PDDL
            pddl_info = self.parse_pddl(str(problem_path))
            if not pddl_info:
                return default_reward_func(class_label) if class_label != "unknown" else 0.0

            # Parse plan
            actions = self.parse_plan(completion)
            if not actions:
                return default_reward_func(class_label) if class_label != "unknown" else 0.0

            # Normalize states
            initial_state: State = {normalize_atom(a) for a in pddl_info["initial_state"]}
            goal_state: State = {normalize_atom(a) for a in pddl_info["goal_state"]}
            constraints = pddl_info.get("constraints", {})

            # Compute dense reward
            return self._compute_dense_reward(
                class_label if class_label != "unknown" else "goal_not_satisfied",
                actions,
                initial_state,
                goal_state,
                constraints
            )

        except Exception as e:
            logger.debug(f"Reward computation failed: {e}")
            try:
                return default_reward_func(class_label) if class_label != "unknown" else 0.0
            except:
                return 0.0

    def _compute_dense_reward(
        self,
        class_label: str,
        actions: List[ActionStr],
        initial_state: State,
        goal_state: State,
        constraints: Dict[str, Any]
    ) -> float:
        """
        Compute dense reward combining base reward and trajectory-based scores.
        """
        base_r = get_base_reward(class_label)

        # Quick exit for format errors and success
        if class_label == "plan_format_error":
            return float(base_r)
        if class_label == "success_plans":
            return float(base_r)

        # Simulate plan
        traj, exec_error, violation_step = self.simulate_plan(initial_state, actions)

        # Correct label if simulation found error
        if exec_error == "precondition_violation" and class_label not in [
            "precondition_violation", "safety_constraints_violation"
        ]:
            class_label = "precondition_violation"
            base_r = get_base_reward(class_label)

        if not traj:
            return float(base_r)

        last_state = traj[-1]

        # Compute component scores
        _, _, safety_score = self.check_safety_constraints(traj, constraints)
        g_score = self.goal_score(last_state, goal_state)
        p_score = violation_penalty(violation_step, len(traj) - 1) if violation_step else 1.0

        # Combine scores based on class label
        if class_label == "safety_constraints_violation":
            dense = safety_score
        elif class_label == "goal_not_satisfied":
            dense = g_score
        elif class_label == "precondition_violation":
            dense = p_score
        else:
            dense = 0.7 * safety_score + 0.3 * g_score

        # Final reward with alpha weighting
        alpha = 0.3
        final_r = base_r + alpha * dense

        # Clip to reasonable range
        return float(max(-1.5, min(1.5, final_r)))


# =============================================================================
# Blocksworld Implementation
# =============================================================================

class BlocksworldRewardCalculator(ScenarioRewardCalculator):
    """Reward calculator for Blocksworld domain."""

    def get_action_schema(self) -> Dict[str, Dict[str, List[str]]]:
        return {
            "pickup": {
                "params": ["ob"],
                "pre": ["(clear {ob})", "(on-table {ob})", "(arm-empty)"],
                "add": ["(holding {ob})"],
                "del": ["(clear {ob})", "(on-table {ob})", "(arm-empty)"],
            },
            "putdown": {
                "params": ["ob"],
                "pre": ["(holding {ob})"],
                "add": ["(clear {ob})", "(arm-empty)", "(on-table {ob})"],
                "del": ["(holding {ob})"],
            },
            "stack": {
                "params": ["ob", "underob"],
                "pre": ["(clear {underob})", "(holding {ob})"],
                "add": ["(arm-empty)", "(clear {ob})", "(on {ob} {underob})"],
                "del": ["(clear {underob})", "(holding {ob})"],
            },
            "unstack": {
                "params": ["ob", "underob"],
                "pre": ["(on {ob} {underob})", "(clear {ob})", "(arm-empty)"],
                "add": ["(holding {ob})", "(clear {underob})"],
                "del": ["(on {ob} {underob})", "(clear {ob})", "(arm-empty)"],
            },
        }

    def get_goal_predicates(self) -> List[str]:
        return ["(on ", "(on-table "]

    def parse_pddl(self, problem_file: str) -> Optional[Dict[str, Any]]:
        try:
            with open(problem_file, 'r') as f:
                content = f.read()
        except Exception:
            return None

        result = {
            "initial_state": set(),
            "goal_state": set(),
            "constraints": {}
        }

        # Parse initial state - find content between (:init and )
        # Use balanced parenthesis matching
        init_start = content.find('(:init')
        if init_start != -1:
            init_content = self._extract_sexp(content, init_start)
            if init_content:
                # Extract simple atoms (predicates without nested parens)
                atoms = re.findall(r'\((?:on-table|on|clear|arm-empty|holding)\s+[^()]*\)', init_content)
                # Also match arm-empty without arguments
                if '(arm-empty)' in init_content:
                    atoms.append('(arm-empty)')
                result["initial_state"] = {normalize_atom(a) for a in atoms}

        # Parse goal state
        goal_start = content.find('(:goal')
        if goal_start != -1:
            goal_content = self._extract_sexp(content, goal_start)
            if goal_content:
                # Extract goal atoms
                atoms = re.findall(r'\((?:on-table|on)\s+[^()]+\)', goal_content)
                result["goal_state"] = {normalize_atom(a) for a in atoms}

        # Parse sometime-before constraint
        constraint_match = re.search(
            r'\(sometime-before\s+\(([^)]+)\)\s+\(([^)]+)\)',
            content, re.DOTALL
        )
        if constraint_match:
            result["constraints"] = {
                "type": "sometime-before",
                "first": f"({constraint_match.group(1).strip()})",
                "second": f"({constraint_match.group(2).strip()})"
            }

        return result

    def _extract_sexp(self, content: str, start: int) -> Optional[str]:
        """Extract balanced S-expression starting at given position."""
        if start >= len(content) or content[start] != '(':
            return None
        depth = 0
        for i in range(start, len(content)):
            if content[i] == '(':
                depth += 1
            elif content[i] == ')':
                depth -= 1
                if depth == 0:
                    return content[start:i+1]
        return None

    def parse_plan(self, completion: str) -> List[ActionStr]:
        actions = re.findall(r'\([^)]+\)', completion)
        valid_actions = []
        for action in actions:
            action = action.strip()
            if any(action.startswith(f"({op}") for op in ["pickup", "putdown", "stack", "unstack"]):
                valid_actions.append(action)
        return valid_actions


# =============================================================================
# Ferry Implementation
# =============================================================================

class FerryRewardCalculator(ScenarioRewardCalculator):
    """Reward calculator for Ferry domain."""

    def get_action_schema(self) -> Dict[str, Dict[str, List[str]]]:
        return {
            "sail": {
                "params": ["from", "to"],
                "pre": [
                    "(not-eq {from} {to})",
                    "(location {from})",
                    "(location {to})",
                    "(at-ferry {from})"
                ],
                "add": ["(at-ferry {to})"],
                "del": ["(at-ferry {from})"],
            },
            "board": {
                "params": ["car", "loc"],
                "pre": [
                    "(car {car})",
                    "(location {loc})",
                    "(at {car} {loc})",
                    "(at-ferry {loc})",
                    "(empty-ferry)"
                ],
                "add": ["(on {car})"],
                "del": ["(at {car} {loc})", "(empty-ferry)"],
            },
            "debark": {
                "params": ["car", "loc"],
                "pre": [
                    "(car {car})",
                    "(location {loc})",
                    "(on {car})",
                    "(at-ferry {loc})"
                ],
                "add": ["(at {car} {loc})", "(empty-ferry)"],
                "del": ["(on {car})"],
            },
        }

    def get_goal_predicates(self) -> List[str]:
        return ["(at "]

    def parse_pddl(self, problem_file: str) -> Optional[Dict[str, Any]]:
        try:
            with open(problem_file, 'r') as f:
                content = f.read()
        except Exception:
            return None

        result = {
            "initial_state": set(),
            "goal_state": set(),
            "constraints": {}
        }

        # Parse initial state using balanced parenthesis
        init_start = content.find('(:init')
        if init_start != -1:
            init_content = self._extract_sexp(content, init_start)
            if init_content:
                # Extract atoms - ferry predicates
                atoms = re.findall(
                    r'\((?:location|car|not-eq|at-ferry|at|empty-ferry|on)\s*[^()]*\)',
                    init_content
                )
                # Also match empty-ferry without arguments
                if '(empty-ferry)' in init_content:
                    atoms.append('(empty-ferry)')
                result["initial_state"] = {normalize_atom(a) for a in atoms}

        # Parse goal state
        goal_start = content.find('(:goal')
        if goal_start != -1:
            goal_content = self._extract_sexp(content, goal_start)
            if goal_content:
                atoms = re.findall(r'\(at\s+[^()]+\)', goal_content)
                result["goal_state"] = {normalize_atom(a) for a in atoms}

        # Parse constraints - handle both single and multiple sometime-before
        constraints_start = content.find('(:constraints')
        if constraints_start != -1:
            constraints_content = self._extract_sexp(content, constraints_start)
            if constraints_content:
                # Find all sometime-before constraints
                stb_matches = re.findall(
                    r'\(sometime-before\s+\(([^)]+)\)\s+\(([^)]+)\)',
                    constraints_content
                )
                if len(stb_matches) == 1:
                    result["constraints"] = {
                        "type": "sometime-before",
                        "first": f"({stb_matches[0][0].strip()})",
                        "second": f"({stb_matches[0][1].strip()})"
                    }
                elif len(stb_matches) > 1:
                    result["constraints"] = {
                        "type": "sometime-before-list",
                        "constraints": [
                            {
                                "first": f"({m[0].strip()})",
                                "second": f"({m[1].strip()})"
                            }
                            for m in stb_matches
                        ]
                    }

        return result

    def _extract_sexp(self, content: str, start: int) -> Optional[str]:
        """Extract balanced S-expression starting at given position."""
        if start >= len(content) or content[start] != '(':
            return None
        depth = 0
        for i in range(start, len(content)):
            if content[i] == '(':
                depth += 1
            elif content[i] == ')':
                depth -= 1
                if depth == 0:
                    return content[start:i+1]
        return None

    def parse_plan(self, completion: str) -> List[ActionStr]:
        actions = re.findall(r'\([^)]+\)', completion)
        valid_actions = []
        for action in actions:
            action = action.strip()
            if any(action.startswith(f"({op}") for op in ["sail", "board", "debark"]):
                valid_actions.append(action)
        return valid_actions


# =============================================================================
# Grippers Implementation
# =============================================================================

class GrippersRewardCalculator(ScenarioRewardCalculator):
    """Reward calculator for Grippers domain."""

    def get_action_schema(self) -> Dict[str, Dict[str, List[str]]]:
        return {
            "move": {
                "params": ["r", "from", "to"],
                "pre": ["(at-robby {r} {from})"],
                "add": ["(at-robby {r} {to})"],
                "del": ["(at-robby {r} {from})"],
            },
            "pick": {
                "params": ["r", "obj", "room", "g"],
                "pre": [
                    "(at {obj} {room})",
                    "(at-robby {r} {room})",
                    "(free {r} {g})"
                ],
                "add": ["(carry {r} {obj} {g})"],
                "del": ["(at {obj} {room})", "(free {r} {g})"],
            },
            "drop": {
                "params": ["r", "obj", "room", "g"],
                "pre": [
                    "(carry {r} {obj} {g})",
                    "(at-robby {r} {room})"
                ],
                "add": ["(at {obj} {room})", "(free {r} {g})"],
                "del": ["(carry {r} {obj} {g})"],
            },
        }

    def get_goal_predicates(self) -> List[str]:
        return ["(at "]

    def parse_pddl(self, problem_file: str) -> Optional[Dict[str, Any]]:
        try:
            with open(problem_file, 'r') as f:
                content = f.read()
        except Exception:
            return None

        result = {
            "initial_state": set(),
            "goal_state": set(),
            "constraints": {}
        }

        # Parse initial state using balanced parenthesis
        init_start = content.find('(:init')
        if init_start != -1:
            init_content = self._extract_sexp(content, init_start)
            if init_content:
                # Extract atoms - grippers predicates
                atoms = re.findall(
                    r'\((?:at-robby|at|free|carry)\s+[^()]+\)',
                    init_content
                )
                result["initial_state"] = {normalize_atom(a) for a in atoms}

        # Parse goal state
        goal_start = content.find('(:goal')
        if goal_start != -1:
            goal_content = self._extract_sexp(content, goal_start)
            if goal_content:
                atoms = re.findall(r'\(at\s+[^()]+\)', goal_content)
                result["goal_state"] = {normalize_atom(a) for a in atoms}

        # Parse constraints - handle both single and multiple sometime-before
        constraints_start = content.find('(:constraints')
        if constraints_start != -1:
            constraints_content = self._extract_sexp(content, constraints_start)
            if constraints_content:
                stb_matches = re.findall(
                    r'\(sometime-before\s+\(([^)]+)\)\s+\(([^)]+)\)',
                    constraints_content
                )
                if len(stb_matches) == 1:
                    result["constraints"] = {
                        "type": "sometime-before",
                        "first": f"({stb_matches[0][0].strip()})",
                        "second": f"({stb_matches[0][1].strip()})"
                    }
                elif len(stb_matches) > 1:
                    result["constraints"] = {
                        "type": "sometime-before-list",
                        "constraints": [
                            {
                                "first": f"({m[0].strip()})",
                                "second": f"({m[1].strip()})"
                            }
                            for m in stb_matches
                        ]
                    }

        return result

    def _extract_sexp(self, content: str, start: int) -> Optional[str]:
        """Extract balanced S-expression starting at given position."""
        if start >= len(content) or content[start] != '(':
            return None
        depth = 0
        for i in range(start, len(content)):
            if content[i] == '(':
                depth += 1
            elif content[i] == ')':
                depth -= 1
                if depth == 0:
                    return content[start:i+1]
        return None

    def parse_plan(self, completion: str) -> List[ActionStr]:
        actions = re.findall(r'\([^)]+\)', completion)
        valid_actions = []
        for action in actions:
            action = action.strip()
            if any(action.startswith(f"({op}") for op in ["move", "pick", "drop"]):
                valid_actions.append(action)
        return valid_actions


# =============================================================================
# Spanner Implementation
# =============================================================================

class SpannerRewardCalculator(ScenarioRewardCalculator):
    """Reward calculator for Spanner domain."""

    def get_action_schema(self) -> Dict[str, Dict[str, List[str]]]:
        return {
            "walk": {
                "params": ["start", "end", "m"],
                "pre": [
                    "(at {m} {start})",
                    "(link {start} {end})"
                ],
                "add": ["(at {m} {end})"],
                "del": ["(at {m} {start})"],
            },
            "pickup_spanner": {
                "params": ["l", "s", "m"],
                "pre": [
                    "(at {m} {l})",
                    "(at {s} {l})"
                ],
                "add": ["(carrying {m} {s})"],
                "del": ["(at {s} {l})"],
            },
            "tighten_nut": {
                "params": ["l", "s", "m", "n"],
                "pre": [
                    "(at {m} {l})",
                    "(at {n} {l})",
                    "(carrying {m} {s})",
                    "(useable {s})",
                    "(loose {n})"
                ],
                "add": ["(tightened {n})"],
                "del": ["(loose {n})", "(useable {s})"],
            },
        }

    def get_goal_predicates(self) -> List[str]:
        return ["(tightened "]

    def parse_pddl(self, problem_file: str) -> Optional[Dict[str, Any]]:
        try:
            with open(problem_file, 'r') as f:
                content = f.read()
        except Exception:
            return None

        result = {
            "initial_state": set(),
            "goal_state": set(),
            "constraints": {}
        }

        # Parse initial state using balanced parenthesis
        init_start = content.find('(:init')
        if init_start != -1:
            init_content = self._extract_sexp(content, init_start)
            if init_content:
                # Extract atoms - spanner predicates
                atoms = re.findall(
                    r'\((?:at|carrying|useable|link|tightened|loose)\s+[^()]+\)',
                    init_content
                )
                result["initial_state"] = {normalize_atom(a) for a in atoms}

        # Parse goal state
        goal_start = content.find('(:goal')
        if goal_start != -1:
            goal_content = self._extract_sexp(content, goal_start)
            if goal_content:
                atoms = re.findall(r'\(tightened\s+[^()]+\)', goal_content)
                result["goal_state"] = {normalize_atom(a) for a in atoms}

        # Parse constraints - handle both single and multiple sometime-before
        constraints_start = content.find('(:constraints')
        if constraints_start != -1:
            constraints_content = self._extract_sexp(content, constraints_start)
            if constraints_content:
                stb_matches = re.findall(
                    r'\(sometime-before\s+\(([^)]+)\)\s+\(([^)]+)\)',
                    constraints_content
                )
                if len(stb_matches) == 1:
                    result["constraints"] = {
                        "type": "sometime-before",
                        "first": f"({stb_matches[0][0].strip()})",
                        "second": f"({stb_matches[0][1].strip()})"
                    }
                elif len(stb_matches) > 1:
                    result["constraints"] = {
                        "type": "sometime-before-list",
                        "constraints": [
                            {
                                "first": f"({m[0].strip()})",
                                "second": f"({m[1].strip()})"
                            }
                            for m in stb_matches
                        ]
                    }

        return result

    def _extract_sexp(self, content: str, start: int) -> Optional[str]:
        """Extract balanced S-expression starting at given position."""
        if start >= len(content) or content[start] != '(':
            return None
        depth = 0
        for i in range(start, len(content)):
            if content[i] == '(':
                depth += 1
            elif content[i] == ')':
                depth -= 1
                if depth == 0:
                    return content[start:i+1]
        return None

    def parse_plan(self, completion: str) -> List[ActionStr]:
        actions = re.findall(r'\([^)]+\)', completion)
        valid_actions = []
        for action in actions:
            action = action.strip()
            if any(action.startswith(f"({op}") for op in ["walk", "pickup_spanner", "tighten_nut"]):
                valid_actions.append(action)
        return valid_actions


# =============================================================================
# Factory & Convenience Functions
# =============================================================================

# Registry of available calculators
SCENARIO_CALCULATORS: Dict[str, type] = {
    "blocksworld": BlocksworldRewardCalculator,
    "ferry": FerryRewardCalculator,
    "grippers": GrippersRewardCalculator,
    "spanner": SpannerRewardCalculator,
}

# Cache for calculator instances
_calculator_cache: Dict[str, ScenarioRewardCalculator] = {}


def get_reward_calculator(scenario: str) -> Optional[ScenarioRewardCalculator]:
    """
    Get reward calculator for a scenario.

    Args:
        scenario: Scenario name (e.g., "blocksworld", "ferry")

    Returns:
        Calculator instance or None if scenario not supported
    """
    scenario = scenario.lower()

    if scenario in _calculator_cache:
        return _calculator_cache[scenario]

    calculator_class = SCENARIO_CALCULATORS.get(scenario)
    if calculator_class is None:
        return None

    calculator = calculator_class()
    _calculator_cache[scenario] = calculator
    return calculator


def compute_scenario_reward(
    scenario: str,
    class_label: str,
    completion: str,
    meta: Dict[str, Any],
    repo_root: Path,
    default_reward_func: Optional[Callable[[str], float]] = None
) -> float:
    """
    Convenience function to compute reward for any supported scenario.

    Args:
        scenario: Scenario name
        class_label: Classification label
        completion: Model completion text
        meta: Metadata dictionary
        repo_root: Repository root path
        default_reward_func: Fallback reward function

    Returns:
        Computed reward value
    """
    calculator = get_reward_calculator(scenario)
    if calculator is None:
        # Fallback to base reward
        if default_reward_func:
            return default_reward_func(class_label) if class_label != "unknown" else 0.0
        return get_base_reward(class_label) if class_label != "unknown" else 0.0

    return calculator.compute_reward(
        class_label, completion, meta, repo_root, default_reward_func
    )


def get_supported_scenarios() -> List[str]:
    """Return list of supported scenario names."""
    return list(SCENARIO_CALCULATORS.keys())


def register_scenario_calculator(scenario: str, calculator_class: type):
    """
    Register a new scenario calculator.

    Args:
        scenario: Scenario name
        calculator_class: Calculator class (must inherit from ScenarioRewardCalculator)
    """
    if not issubclass(calculator_class, ScenarioRewardCalculator):
        raise TypeError(f"Calculator must inherit from ScenarioRewardCalculator")

    SCENARIO_CALCULATORS[scenario.lower()] = calculator_class
    # Clear cache for this scenario if it exists
    _calculator_cache.pop(scenario.lower(), None)
    logger.info(f"Registered calculator for scenario: {scenario}")
