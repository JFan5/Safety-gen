"""
Domain-specific utilities for PDDL planning.

This subpackage contains domain-specific simulation and reward functions.
"""

from .blocksworld import (
    # State types
    State,
    ActionStr,
    Trajectory,
    # Core simulation
    normalize_atom,
    parse_action,
    transition,
    simulate_plan,
    # State helpers
    is_on,
    is_on_table,
    # Constraint checking
    check_sometime_before_constraint,
    safety_score_sometime_before,
    precondition_violation_score,
    goal_score,
    # Reward functions
    blocksworld_reward1,
    blocksworld_reward2,
    reward_baseline,
    # PDDL parsing
    parse_blocksworld_pddl,
    parse_plan_from_completion,
    compute_blocksworld_reward_from_meta,
)

__all__ = [
    # State types
    "State",
    "ActionStr",
    "Trajectory",
    # Core simulation
    "normalize_atom",
    "parse_action",
    "transition",
    "simulate_plan",
    # State helpers
    "is_on",
    "is_on_table",
    # Constraint checking
    "check_sometime_before_constraint",
    "safety_score_sometime_before",
    "precondition_violation_score",
    "goal_score",
    # Reward functions
    "blocksworld_reward1",
    "blocksworld_reward2",
    "reward_baseline",
    # PDDL parsing
    "parse_blocksworld_pddl",
    "parse_plan_from_completion",
    "compute_blocksworld_reward_from_meta",
]
