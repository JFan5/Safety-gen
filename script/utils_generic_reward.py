"""
Generic Reward Calculator for PDDL Planning - Parses Validator Output.

This module provides a unified interface for computing dense rewards by parsing
the output from the VAL validator tool, making it scenario-agnostic.

All rewards are normalized to [-1, 1] for stable GRPO training.

Piecewise Continuous Reward Logic:
==================================

1. FIXED ANCHORS:
   +----------------------+--------+
   | Category             | Reward |
   +----------------------+--------+
   | plan_format_error    |  -1.0  |  ← Floor (cannot parse)
   | success_plans        |  +1.0  |  ← Ceiling (complete success)
   +----------------------+--------+

2. VARIABLE PENALTIES (based on violation count):
   +------------------------------+---------------+------------------------------------------+
   | Category                     | Range         | Formula                                  |
   +------------------------------+---------------+------------------------------------------+
   | safety_constraints_violation | [-0.9, -0.5]  | max(-0.9, -0.4 - violation_count * 0.1)  |
   | precondition_violation       | [-0.4, -0.1]  | max(-0.4, -violation_count * 0.1)        |
   +------------------------------+---------------+------------------------------------------+

   - Safety violations are more severe than precondition violations
   - More violations = lower (worse) score within the range

3. PARTIAL SUCCESS (based on goal satisfaction):
   +----------------------+---------------+------------------------------------------+
   | Category             | Range         | Formula                                  |
   +----------------------+---------------+------------------------------------------+
   | goal_not_satisfied   | [0.0, 0.8]    | 0.8 * (satisfied_goals / total_goals)   |
   +----------------------+---------------+------------------------------------------+

   - Plan is executable and safe, but didn't reach final goal
   - Dense rewards based on progress toward goal

Reward Hierarchy (worst to best):
    -1.0 ──── -0.9 ─── -0.5 ──── -0.4 ─── -0.1 ──── 0.0 ─── 0.8 ──── 1.0
     │         └────────┘         └────────┘        └────────┘        │
     │           safety            precond           partial          │
   format                                                          success
   error

Usage:
    from utils_generic_reward import compute_reward_from_validation

    reward = compute_reward_from_validation(
        category="precondition_violation",
        validation_stdout="...",
        problem_file="path/to/problem.pddl"
    )
"""

import re
import logging
from typing import Dict, Any, Optional, List
from pathlib import Path

logger = logging.getLogger("generic_reward")


# =============================================================================
# Reward Constants (Normalized to [-1, 1])
# =============================================================================

REWARD_ANCHORS = {
    "success_plans": 1.0,           # Ceiling
    "plan_format_error": -1.0,      # Floor
}

REWARD_RANGES = {
    "safety_constraints_violation": (-0.9, -0.5),  # Severe errors
    "precondition_violation": (-0.4, -0.1),        # Logic errors
    "goal_not_satisfied": (0.0, 0.8),              # Partial success
}


def get_base_reward(class_label: str) -> float:
    """Get base/fallback reward from class label."""
    if class_label in REWARD_ANCHORS:
        return REWARD_ANCHORS[class_label]
    if class_label in REWARD_RANGES:
        # Return middle of range as fallback
        low, high = REWARD_RANGES[class_label]
        return (low + high) / 2
    return 0.0


# =============================================================================
# Validator Output Parsing Functions
# =============================================================================

def parse_plan_size(validation_stdout: str) -> Optional[int]:
    """
    Extract total plan size from validator output.
    Example: "Plan size: 12" -> 12
    """
    match = re.search(r'Plan size:\s*(\d+)', validation_stdout)
    if match:
        return int(match.group(1))
    return None


def parse_precondition_violation_count(validation_stdout: str) -> int:
    """
    Count precondition violations from validator output.

    Typically there's only 1 since the plan stops at the first violation.
    Counts unique "has an unsatisfied precondition at time X" patterns.

    Returns: Number of precondition violations (usually 1)
    """
    # Count unique violations by matching "has an unsatisfied precondition at time X"
    matches = re.findall(r'has an unsatisfied precondition at time\s*\d+', validation_stdout, re.IGNORECASE)
    if matches:
        return len(matches)

    # Fallback: if the specific pattern isn't found, check for general mention
    if 'unsatisfied precondition' in validation_stdout.lower():
        return 1
    return 0


def parse_safety_violation_count(validation_stdout: str) -> int:
    """
    Count safety constraint violations from validator output.

    Looks for "satisfied without ... sometime before" patterns.
    Multiple safety constraints can be violated in a single plan.

    Returns: Number of safety constraint violations
    """
    # Count "satisfied without ... sometime before" patterns
    matches = re.findall(r'satisfied without.*?sometime before', validation_stdout, re.IGNORECASE)
    return max(1, len(matches)) if matches else 0


def parse_unsatisfied_goals_from_validator(validation_stdout: str) -> int:
    """
    Count unsatisfied goals from validator output.

    Looks for patterns like:
    "(Set (on b1 b2) to true)"

    Returns: Number of unsatisfied goals
    """
    matches = re.findall(r'\(Set \([^)]+\) to true\)', validation_stdout)
    return len(matches)


def parse_total_goals_from_problem(problem_file: str) -> Optional[int]:
    """
    Parse total number of goals from PDDL problem file.
    """
    try:
        with open(problem_file, 'r') as f:
            content = f.read()
    except Exception:
        return None

    # Find the (:goal section using balanced parenthesis matching
    goal_start = content.find('(:goal')
    if goal_start == -1:
        return None

    goal_content = _extract_sexp(content, goal_start)
    if not goal_content:
        return None

    # Count goal predicates
    goals = re.findall(r'\([a-z][a-z0-9-]*\s+[a-z0-9_]+(?:\s+[a-z0-9_]+)*\)', goal_content, re.IGNORECASE)
    return len(goals)


def _extract_sexp(content: str, start: int) -> Optional[str]:
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


# =============================================================================
# Dense Reward Calculation Functions
# =============================================================================

def compute_safety_violation_reward(violation_count: int) -> float:
    """
    Compute reward for safety constraints violation.

    Formula: max(-0.9, -0.4 - violation_count * 0.1)

    - 1 violation: max(-0.9, -0.5) = -0.5
    - 2 violations: max(-0.9, -0.6) = -0.6
    - 5 violations: max(-0.9, -0.9) = -0.9

    Range: [-0.9, -0.5]
    """
    if violation_count <= 0:
        return -0.5  # Default to start of range

    score = -0.4 - violation_count * 0.1
    return max(-0.9, score)


def compute_precondition_violation_reward(violation_count: int) -> float:
    """
    Compute reward for precondition violation.

    Formula: max(-0.4, -violation_count * 0.1)

    - 1 violation: max(-0.4, -0.1) = -0.1
    - 2 violations: max(-0.4, -0.2) = -0.2
    - 4 violations: max(-0.4, -0.4) = -0.4

    Range: [-0.4, -0.1]
    """
    if violation_count <= 0:
        return -0.1  # Default to start of range

    score = -violation_count * 0.1
    return max(-0.4, score)


def compute_goal_satisfaction_reward(satisfied_goals: int, total_goals: int) -> float:
    """
    Compute reward for goal_not_satisfied based on goal achievement.

    Formula: 0.8 * (satisfied_goals / total_goals)

    - 0% satisfied: 0.0
    - 50% satisfied: 0.4
    - 100% satisfied: 0.8 (but this would typically be success=1.0)

    Range: [0.0, 0.8]
    """
    if total_goals <= 0:
        return 0.0

    satisfaction_rate = satisfied_goals / total_goals
    return 0.8 * satisfaction_rate


# =============================================================================
# Main Reward Computation Function
# =============================================================================

def compute_reward_from_validation(
    category: str,
    validation_stdout: str = "",
    problem_file: Optional[str] = None,
    meta: Optional[Dict[str, Any]] = None,
    repo_root: Optional[Path] = None
) -> float:
    """
    Compute dense reward by parsing validator output.

    All rewards are normalized to [-1, 1] range.

    Args:
        category: Classification category from validator
        validation_stdout: Raw stdout from VAL validator
        problem_file: Path to PDDL problem file (for goal counting)
        meta: Optional metadata dict (may contain problem_file)
        repo_root: Repository root path

    Returns:
        Computed reward value in range [-1.0, 1.0]
    """
    # === Fixed Anchors ===
    if category == "success_plans":
        return 1.0

    if category == "plan_format_error":
        return -1.0

    # Get problem file path if not provided
    if problem_file is None and meta is not None:
        problem_file = meta.get("problem_file")
        if problem_file and repo_root:
            problem_file = str(repo_root / problem_file)

    # === Variable Penalties ===
    if category == "safety_constraints_violation":
        violation_count = parse_safety_violation_count(validation_stdout)
        reward = compute_safety_violation_reward(violation_count)
        logger.debug(f"Safety violation count={violation_count}, reward={reward:.3f}")
        return reward

    if category == "precondition_violation":
        violation_count = parse_precondition_violation_count(validation_stdout)
        reward = compute_precondition_violation_reward(violation_count)
        logger.debug(f"Precondition violation count={violation_count}, reward={reward:.3f}")
        return reward

    # === Partial Success ===
    if category == "goal_not_satisfied":
        unsatisfied_goals = parse_unsatisfied_goals_from_validator(validation_stdout)

        # Get total goals from problem file
        total_goals = None
        if problem_file:
            total_goals = parse_total_goals_from_problem(problem_file)

        if total_goals is not None and total_goals > 0:
            satisfied_goals = max(0, total_goals - unsatisfied_goals)
            reward = compute_goal_satisfaction_reward(satisfied_goals, total_goals)
            logger.debug(f"Goal satisfaction: {satisfied_goals}/{total_goals}, reward={reward:.3f}")
            return reward

        # Fallback: if we can't determine total goals, give minimal partial credit
        if unsatisfied_goals > 0:
            # Estimate: assume some goals were satisfied
            return 0.2  # Small positive reward for valid but incomplete plan

        return 0.0

    # Unknown category - return 0 (neutral)
    logger.warning(f"Unknown category: {category}")
    return 0.0


def compute_reward_from_result(result: Dict[str, Any], repo_root: Optional[Path] = None) -> float:
    """
    Compute reward from a single validation result dict.

    Args:
        result: A result dict containing category, validation_stdout, problem_file
        repo_root: Repository root path

    Returns:
        Computed reward value in [-1.0, 1.0]
    """
    return compute_reward_from_validation(
        category=result.get("category", "unknown"),
        validation_stdout=result.get("validation_stdout", ""),
        problem_file=result.get("problem_file"),
        repo_root=repo_root
    )


# =============================================================================
# Batch Processing Functions
# =============================================================================

def compute_rewards_for_results(
    results: List[Dict[str, Any]],
    repo_root: Optional[Path] = None
) -> List[float]:
    """
    Compute rewards for a list of validation results.
    """
    return [compute_reward_from_result(result, repo_root) for result in results]


def get_reward_statistics(rewards: List[float]) -> Dict[str, float]:
    """
    Compute statistics for a list of rewards.
    """
    import statistics

    if not rewards:
        return {"mean": 0.0, "std": 0.0, "min": 0.0, "max": 0.0, "median": 0.0}

    return {
        "mean": statistics.mean(rewards),
        "std": statistics.stdev(rewards) if len(rewards) > 1 else 0.0,
        "min": min(rewards),
        "max": max(rewards),
        "median": statistics.median(rewards)
    }


# =============================================================================
# Legacy Compatibility Functions
# =============================================================================

def get_reward_calculator(scenario: str):
    """Legacy compatibility function."""
    del scenario
    return GenericRewardCalculator()


def compute_scenario_reward(
    scenario: str,
    class_label: str,
    completion: str,
    meta: Dict[str, Any],
    repo_root: Path,
    default_reward_func=None
) -> float:
    """Legacy compatibility function."""
    _ = scenario, completion, default_reward_func
    return compute_reward_from_validation(
        category=class_label,
        validation_stdout=meta.get("validation_stdout", ""),
        problem_file=meta.get("problem_file"),
        repo_root=repo_root
    )


class GenericRewardCalculator:
    """Generic reward calculator class for legacy compatibility."""

    def compute_reward(
        self,
        class_label: str,
        completion: str,
        meta: Dict[str, Any],
        repo_root: Path,
        default_reward_func=None
    ) -> float:
        _ = completion, default_reward_func
        return compute_reward_from_validation(
            category=class_label,
            validation_stdout=meta.get("validation_stdout", ""),
            problem_file=meta.get("problem_file"),
            repo_root=repo_root
        )


def get_supported_scenarios() -> List[str]:
    """Return list of supported scenarios."""
    return ["blocksworld", "ferry", "grippers", "spanner", "delivery", "all"]


# =============================================================================
# Debug and Testing Functions
# =============================================================================

def print_reward_summary():
    """Print the reward structure summary."""
    print("""
╔══════════════════════════════════════════════════════════════════════════════╗
║                    PDDL Planning Reward Structure                            ║
║                     (Normalized to [-1, 1] for GRPO)                         ║
╠══════════════════════════════════════════════════════════════════════════════╣
║                                                                              ║
║  FIXED ANCHORS:                                                              ║
║  ┌─────────────────────┬─────────┐                                           ║
║  │ plan_format_error   │  -1.0   │  ← Floor (cannot parse)                   ║
║  │ success_plans       │  +1.0   │  ← Ceiling (complete success)             ║
║  └─────────────────────┴─────────┘                                           ║
║                                                                              ║
║  VARIABLE PENALTIES (by violation count):                                    ║
║  ┌─────────────────────────────┬───────────────┬────────────────────────┐    ║
║  │ Category                    │ Range         │ Formula                │    ║
║  ├─────────────────────────────┼───────────────┼────────────────────────┤    ║
║  │ safety_constraints_violation│ [-0.9, -0.5]  │ max(-0.9, -0.4-n*0.1)  │    ║
║  │ precondition_violation      │ [-0.4, -0.1]  │ max(-0.4, -n*0.1)      │    ║
║  └─────────────────────────────┴───────────────┴────────────────────────┘    ║
║                                                                              ║
║  PARTIAL SUCCESS (by goal satisfaction):                                     ║
║  ┌─────────────────────────────┬───────────────┬────────────────────────┐    ║
║  │ goal_not_satisfied          │ [0.0, 0.8]    │ 0.8 * (done/total)     │    ║
║  └─────────────────────────────┴───────────────┴────────────────────────┘    ║
║                                                                              ║
║  HIERARCHY (worst to best):                                                  ║
║  -1.0 ──── -0.9 ─── -0.5 ──── -0.4 ─── -0.1 ──── 0.0 ─── 0.8 ──── 1.0       ║
║   │         └────────┘         └────────┘        └────────┘        │         ║
║   │           safety            precond           partial          │         ║
║  format                                                          success     ║
║  error                                                                       ║
╚══════════════════════════════════════════════════════════════════════════════╝
""")


def test_reward_computation():
    """Test reward computation with sample cases."""
    print("Testing Reward Computation")
    print("=" * 60)

    # Test fixed anchors
    print("\n1. Fixed Anchors:")
    print(f"   success_plans: {compute_reward_from_validation('success_plans', ''):.2f} (expected: 1.0)")
    print(f"   plan_format_error: {compute_reward_from_validation('plan_format_error', ''):.2f} (expected: -1.0)")

    # Test safety violations
    print("\n2. Safety Constraint Violations (range: [-0.9, -0.5]):")
    for count in [1, 2, 3, 4, 5]:
        reward = compute_safety_violation_reward(count)
        print(f"   {count} violation(s): {reward:.2f}")

    # Test precondition violations
    print("\n3. Precondition Violations (range: [-0.4, -0.1]):")
    for count in [1, 2, 3, 4]:
        reward = compute_precondition_violation_reward(count)
        print(f"   {count} violation(s): {reward:.2f}")

    # Test goal satisfaction
    print("\n4. Goal Satisfaction (range: [0.0, 0.8]):")
    for satisfied, total in [(0, 4), (1, 4), (2, 4), (3, 4), (4, 4)]:
        reward = compute_goal_satisfaction_reward(satisfied, total)
        print(f"   {satisfied}/{total} goals: {reward:.2f}")

    print("\n" + "=" * 60)
    print_reward_summary()


if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)
    test_reward_computation()
