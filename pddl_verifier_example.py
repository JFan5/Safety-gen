"""
Example PDDL Verifier Implementation

This file demonstrates how to implement a real PDDL verifier for the DPO generation script.
Replace the placeholder verify_plan() function with one of these implementations.

You can choose different approaches based on your available tools:
1. VAL validator (recommended for correctness)
2. Custom Python parser
3. External planner verification
"""

import re
import subprocess
import tempfile
from pathlib import Path
from typing import Tuple, Optional
import logging

logger = logging.getLogger(__name__)


# ============================================================================
# Approach 1: Using VAL Validator (Recommended)
# ============================================================================

def verify_plan_with_val(problem_text: str, plan_text: str) -> int:
    """
    Verify plan using VAL (the PDDL validator).

    Installation:
        git clone https://github.com/KCL-Planning/VAL.git
        cd VAL
        make
        # Add VAL/bin to PATH or set VAL_PATH below

    Returns:
        100: Valid, optimal, and safe plan
        80: Valid but suboptimal (logic error)
        60: Valid but violates safety constraints
        40: Invalid (precondition violations)
    """
    VAL_PATH = "/usr/local/bin/validate"  # TODO: Set your VAL path

    try:
        # Create temporary files
        with tempfile.TemporaryDirectory() as tmpdir:
            tmpdir = Path(tmpdir)

            # Extract domain from problem (assuming it's embedded)
            domain_text = extract_domain_from_problem(problem_text)
            if not domain_text:
                logger.error("Could not extract domain from problem")
                return 40

            domain_file = tmpdir / "domain.pddl"
            problem_file = tmpdir / "problem.pddl"
            plan_file = tmpdir / "plan.txt"

            domain_file.write_text(domain_text)
            problem_file.write_text(problem_text)
            plan_file.write_text(plan_text)

            # Run VAL validator
            result = subprocess.run(
                [VAL_PATH, str(domain_file), str(problem_file), str(plan_file)],
                capture_output=True,
                text=True,
                timeout=30
            )

            output = result.stdout + result.stderr

            # Parse VAL output
            if "Plan valid" in output or "successfully" in output.lower():
                # Plan is valid, now check quality

                # Check for safety violations
                if has_safety_violation(plan_text, problem_text):
                    return 60

                # Check optimality
                optimal_length = get_optimal_plan_length(problem_text)
                plan_length = count_plan_steps(plan_text)

                if optimal_length and plan_length > optimal_length:
                    return 80  # Suboptimal

                return 100  # Valid and optimal

            elif "precondition" in output.lower() or "not applicable" in output.lower():
                return 40  # Precondition violation

            else:
                # Unknown error, default to invalid
                logger.warning(f"VAL output unclear: {output[:200]}")
                return 40

    except subprocess.TimeoutExpired:
        logger.error("VAL validation timeout")
        return 40
    except Exception as e:
        logger.error(f"VAL validation error: {e}")
        return 40


# ============================================================================
# Approach 2: Custom Python Verification
# ============================================================================

def verify_plan_custom(problem_text: str, plan_text: str) -> int:
    """
    Verify plan using custom Python logic.

    This approach is more flexible but requires implementing PDDL semantics.
    """
    try:
        # Parse problem
        problem = parse_pddl_problem(problem_text)
        if not problem:
            return 40

        # Parse plan
        actions = parse_plan(plan_text)
        if not actions:
            return 40

        # Simulate plan execution
        state = problem['init_state'].copy()
        safety_violated = False

        for i, action in enumerate(actions):
            # Check preconditions
            if not check_preconditions(action, state, problem['domain']):
                logger.debug(f"Precondition violation at step {i}: {action}")
                return 40

            # Check safety constraints
            if violates_safety_constraint(action, state, problem):
                logger.debug(f"Safety violation at step {i}: {action}")
                safety_violated = True

            # Apply effects
            state = apply_effects(action, state, problem['domain'])

        # Check if goal is achieved
        if not goal_achieved(state, problem['goal']):
            logger.debug("Goal not achieved")
            return 40

        # Determine score based on quality
        if safety_violated:
            return 60

        # Check optimality (compare to optimal plan length)
        if is_suboptimal(len(actions), problem):
            return 80

        return 100

    except Exception as e:
        logger.error(f"Custom verification error: {e}")
        return 40


# ============================================================================
# Approach 3: Using External Planner for Comparison
# ============================================================================

def verify_plan_with_planner(problem_text: str, plan_text: str) -> int:
    """
    Verify by comparing against optimal plan from a planner.

    Uses Fast-Downward or another planner to generate optimal plan.
    """
    PLANNER_PATH = "/path/to/fast-downward"  # TODO: Set planner path

    try:
        # First check basic validity
        if not is_syntactically_valid(plan_text):
            return 40

        # Get optimal plan from planner
        optimal_plan = run_planner(problem_text, PLANNER_PATH)

        if not optimal_plan:
            logger.warning("Could not get optimal plan from planner")
            # Fall back to basic checks
            return 100 if is_valid_plan(problem_text, plan_text) else 40

        # Compare plans
        plan_actions = parse_plan(plan_text)

        # Check for safety violations
        if has_safety_violation(plan_text, problem_text):
            return 60

        # Check if solution is valid but suboptimal
        if len(plan_actions) > len(optimal_plan):
            return 80

        # Check if plan is different but same length (potentially different strategy)
        if plan_actions != optimal_plan:
            return 80

        return 100

    except Exception as e:
        logger.error(f"Planner verification error: {e}")
        return 40


# ============================================================================
# Helper Functions (implement based on your PDDL domain)
# ============================================================================

def extract_domain_from_problem(problem_text: str) -> Optional[str]:
    """
    Extract domain definition from problem file if embedded.
    TODO: Implement based on your file structure.
    """
    # Option 1: Domain is in same file
    if "(define (domain" in problem_text:
        # Extract domain section
        start = problem_text.find("(define (domain")
        end = find_matching_paren(problem_text, start)
        return problem_text[start:end+1]

    # Option 2: Domain is in separate file
    # Return path or content of domain file
    return None


def find_matching_paren(text: str, start: int) -> int:
    """Find matching closing parenthesis."""
    count = 0
    for i in range(start, len(text)):
        if text[i] == '(':
            count += 1
        elif text[i] == ')':
            count -= 1
            if count == 0:
                return i
    return len(text) - 1


def has_safety_violation(plan_text: str, problem_text: str) -> bool:
    """
    Check if plan violates domain-specific safety constraints.

    TODO: Implement based on your safety constraints.

    Example for blocksworld:
    - Don't stack more than 3 blocks
    - Don't use certain forbidden actions
    """
    # Example: Check for forbidden action patterns
    forbidden_patterns = [
        r'stack\s+\w+\s+forbidden_block',  # Don't stack on forbidden block
        # Add more patterns
    ]

    for pattern in forbidden_patterns:
        if re.search(pattern, plan_text, re.IGNORECASE):
            return True

    # Example: Check constraint in problem definition
    if "safety-constraint" in problem_text:
        # Parse and check constraint
        pass

    return False


def get_optimal_plan_length(problem_text: str) -> Optional[int]:
    """
    Get optimal plan length if known (e.g., from metadata).

    TODO: Implement based on your data structure.
    """
    # Option 1: Stored in metadata
    # Read from companion .meta file

    # Option 2: Stored in problem comment
    match = re.search(r';\s*optimal[-_]length:\s*(\d+)', problem_text, re.IGNORECASE)
    if match:
        return int(match.group(1))

    return None


def count_plan_steps(plan_text: str) -> int:
    """Count number of actions in plan."""
    actions = parse_plan(plan_text)
    return len(actions)


def parse_plan(plan_text: str) -> list:
    """
    Parse plan text into list of actions.

    Expected format:
        (action-name obj1 obj2 ...)
        (action-name obj3 obj4 ...)
    """
    actions = []
    for line in plan_text.strip().split('\n'):
        line = line.strip()
        # Skip comments and empty lines
        if not line or line.startswith(';'):
            continue
        # Extract action
        if line.startswith('(') and line.endswith(')'):
            actions.append(line)
    return actions


def parse_pddl_problem(problem_text: str) -> Optional[dict]:
    """
    Parse PDDL problem into structured format.

    TODO: Use a proper PDDL parser like pddl-parser or implement custom.

    Returns:
        dict with keys: 'domain', 'init_state', 'goal', etc.
    """
    # Simple regex-based parsing (use proper parser in production!)
    try:
        problem = {}

        # Extract objects
        objects_match = re.search(r'\(:objects(.*?)\)', problem_text, re.DOTALL)
        if objects_match:
            problem['objects'] = objects_match.group(1).strip().split()

        # Extract init state
        init_match = re.search(r'\(:init(.*?)\)(?:\s*\(:goal)', problem_text, re.DOTALL)
        if init_match:
            problem['init_state'] = set(re.findall(r'\([^)]+\)', init_match.group(1)))

        # Extract goal
        goal_match = re.search(r'\(:goal(.*?)\)\s*\)', problem_text, re.DOTALL)
        if goal_match:
            problem['goal'] = goal_match.group(1).strip()

        return problem

    except Exception as e:
        logger.error(f"Problem parsing error: {e}")
        return None


def check_preconditions(action: str, state: set, domain: dict) -> bool:
    """
    Check if action preconditions are satisfied in current state.

    TODO: Implement based on your domain definition.
    """
    # Simplified example for blocksworld
    # Parse action: (pick-up block1)
    action_parts = action.strip('()').split()
    action_name = action_parts[0]
    params = action_parts[1:]

    # Define preconditions for each action type
    if action_name == 'pick-up':
        block = params[0]
        # Preconditions: clear(block), on-table(block), handempty
        required = [
            f'(clear {block})',
            f'(on-table {block})',
            '(handempty)'
        ]
        return all(pred in state for pred in required)

    # Add more action types...

    return True  # Default: assume valid


def apply_effects(action: str, state: set, domain: dict) -> set:
    """
    Apply action effects to state.

    TODO: Implement based on your domain definition.
    """
    new_state = state.copy()

    action_parts = action.strip('()').split()
    action_name = action_parts[0]
    params = action_parts[1:]

    # Define effects for each action type
    if action_name == 'pick-up':
        block = params[0]
        # Effects: holding(block), not on-table(block), not clear(block), not handempty
        new_state.add(f'(holding {block})')
        new_state.discard(f'(on-table {block})')
        new_state.discard(f'(clear {block})')
        new_state.discard('(handempty)')

    # Add more action types...

    return new_state


def goal_achieved(state: set, goal: str) -> bool:
    """
    Check if goal is satisfied in current state.

    TODO: Implement goal checking logic.
    """
    # Simple conjunction of predicates
    goal_predicates = re.findall(r'\([^)]+\)', goal)
    return all(pred in state for pred in goal_predicates)


def is_suboptimal(plan_length: int, problem: dict) -> bool:
    """
    Determine if plan is suboptimal.

    TODO: Implement optimality check.
    """
    # Use heuristic or stored optimal length
    optimal_length = problem.get('optimal_length')
    if optimal_length:
        return plan_length > optimal_length
    return False


def violates_safety_constraint(action: str, state: set, problem: dict) -> bool:
    """
    Check if action violates safety constraints.

    TODO: Implement domain-specific safety checks.
    """
    # Example: Check for unsafe state transitions
    return False


def is_syntactically_valid(plan_text: str) -> bool:
    """Check if plan has valid PDDL syntax."""
    actions = parse_plan(plan_text)
    if not actions:
        return False

    # Check each action has proper format
    for action in actions:
        if not (action.startswith('(') and action.endswith(')')):
            return False

    return True


def is_valid_plan(problem_text: str, plan_text: str) -> bool:
    """Basic validity check without full verification."""
    try:
        problem = parse_pddl_problem(problem_text)
        return problem is not None and is_syntactically_valid(plan_text)
    except:
        return False


def run_planner(problem_text: str, planner_path: str) -> Optional[list]:
    """
    Run external planner to get optimal solution.

    TODO: Implement planner invocation.
    """
    # Run Fast-Downward or other planner
    # Parse output plan
    # Return list of actions
    return None


# ============================================================================
# Integration Example
# ============================================================================

def verify_plan(problem_text: str, plan_text: str) -> int:
    """
    Main verification function - replace in generate_dpo_dataset.py

    Choose one of the approaches above or combine them.
    """
    # Recommended: Try VAL first, fall back to custom
    try:
        # Approach 1: Use VAL if available
        return verify_plan_with_val(problem_text, plan_text)
    except FileNotFoundError:
        logger.warning("VAL not found, using custom verification")
        # Approach 2: Use custom verification
        return verify_plan_custom(problem_text, plan_text)


# ============================================================================
# Testing
# ============================================================================

if __name__ == "__main__":
    # Test the verifier with sample data
    sample_problem = """(define (problem blocksworld-01)
        (:domain blocksworld)
        (:objects a b c - block)
        (:init (on-table a) (on-table b) (on c a) (clear b) (clear c) (handempty))
        (:goal (and (on a b) (on b c)))
    )"""

    sample_plan_correct = """(unstack c a)
(put-down c)
(pick-up a)
(stack a b)
(pick-up b)
(stack b c)"""

    sample_plan_wrong = """(pick-up a)
(stack a b)"""

    print("Testing correct plan:")
    score = verify_plan(sample_problem, sample_plan_correct)
    print(f"Score: {score} (expected: 100)")

    print("\nTesting incorrect plan:")
    score = verify_plan(sample_problem, sample_plan_wrong)
    print(f"Score: {score} (expected: 40)")
