# This script generates safety constraints for Blocksworld problems (PDDL 3.0 style)
# and injects them into each problem file. It writes out modified files alongside
# the originals with a suffix "_constrained.pddl".
#
# Usage inside this notebook context:
# - Edit the `INPUT_DIR` to point to your folder with 300 problem files, or
# - Call `inject_constraints_into_problem_str(problem_str)` directly with a PDDL string.
#
# Notes:
# - The constraints are written using PDDL 3.0 `:constraints` and should be
#   solvable by planners that support trajectory constraints (e.g., OPTIC/POPF variants).
# - If your planner doesn't support `:constraints`, switch `MODE` to "soft"
#   to only add a comment without changing solvability.
#
# - The script avoids `=` equality to stay compatible with domains without :equality.
# - If you *do* have :equality in your domain, set `USE_EQUALITY = True` to enable
#   tighter constraints that use (= ...).
from pathlib import Path
import re
from typing import List, Optional

# ---- Configuration ----
# Path to your problems directory (edit if you want to batch-run immediately).
INPUT_DIR = None  # e.g., Path("/mnt/data/blocksworld_problems")
OUTPUT_SUFFIX = "_constrained.pddl"

# If your solver supports PDDL3 constraints, keep this "pddl3".
# If not, set to "soft" to just insert a comment (no semantic change).
MODE = "pddl3"  # "pddl3" or "soft"

# Toggle to allow using (= ...) if your domain declares :equality.
USE_EQUALITY = False


def generate_blocksworld_constraints(use_equality: bool = False) -> str:
    """
    Return a PDDL 3.0 `:constraints` block with several generic safety constraints
    for Blocksworld. These are trajectory constraints that hold "always".

    The constraints avoid equality by default to remain compatible with basic domains.
    If `use_equality` is True, extra tighter constraints that rely on (= ...) are included.
    """
    # Base constraints (no equality):
    # 1) No block sits on itself, ever.
    c1 = "(always (forall (?x) (not (on ?x ?x))))"
    # 2) A block cannot be both on-table and on some other block at the same time.
    c2 = "(always (forall (?x ?y) (not (and (on-table ?x) (on ?x ?y)))))"
    # 3) No two blocks are mutually on each other at the same time (no 2-cycles).
    #    Using De Morgan form to avoid implication: ¬(on x y ∧ on y x)
    c3 = "(always (forall (?x ?y) (not (and (on ?x ?y) (on ?y ?x)))))"
    # 4) Arm exclusivity: you cannot be arm-empty while also holding something.
    #    ¬(arm-empty ∧ ∃x holding x)
    c4 = "(always (not (and (arm-empty) (exists (?x) (holding ?x)))))"

    constraints = [c1, c2, c3, c4]

    if use_equality:
        # 5) Each block may be on at most one support at a time:
        #    ∀x ∀y ∀z: (on x y ∧ on x z) -> (y = z)
        #    Written in CNF-friendly PDDL: ∀x∀y∀z (or (not (on x y)) (not (on x z)) (= y z))
        c5 = "(always (forall (?x ?y ?z) (or (not (on ?x ?y)) (not (on ?x ?z)) (= ?y ?z))))"
        # 6) Each block may have at most one block on top:
        #    ∀y ∀x ∀z: (on x y ∧ on z y) -> (x = z)
        c6 = "(always (forall (?y ?x ?z) (or (not (on ?x ?y)) (not (on ?z ?y)) (= ?x ?z))))"
        constraints.extend([c5, c6])

    joined = "\n  ".join(constraints)
    return f"(:constraints\n  {joined}\n)"


def inject_constraints_into_problem_str(problem_str: str,
                                        mode: str = "pddl3",
                                        use_equality: bool = False) -> str:
    """
    Insert a :constraints block into a PDDL problem string.
    - If a constraints block already exists, it will be replaced.
    - By default, inserts the block just before the :goal section to avoid
      confusing parsers that expect a specific item order.
    """
    if mode not in ("pddl3", "soft"):
        raise ValueError("mode must be 'pddl3' or 'soft'")

    # Normalize line endings
    s = problem_str

    # Build constraints block (or a harmless comment if mode == "soft")
    if mode == "pddl3":
        constraints_block = generate_blocksworld_constraints(use_equality=use_equality)
    else:
        constraints_block = ";; (constraints omitted – planner doesn't support PDDL3 :constraints)"

    # Regex to detect an existing (:constraints ... ) and replace it.
    # This is a balanced-parentheses problem; we use a heuristic that works for typical PDDL files:
    constraints_pattern = re.compile(r"\(\s*:constraints\b.*?\)", re.IGNORECASE | re.DOTALL)
    if constraints_pattern.search(s):
        s = constraints_pattern.sub(constraints_block, s)
        return s

    # If no constraints present, insert just before :goal.
    goal_idx = s.lower().find("(:goal")
    if goal_idx != -1 and mode == "pddl3":
        return s[:goal_idx].rstrip() + "\n" + constraints_block + "\n" + s[goal_idx:]
    elif goal_idx != -1 and mode == "soft":
        # Insert a comment before goal for "soft" mode
        return s[:goal_idx].rstrip() + "\n" + constraints_block + "\n" + s[goal_idx:]
    else:
        # If there's no :goal (rare), append at the end, before last ')'
        last_paren = s.rfind(")")
        if last_paren == -1:
            # Fallback: just append
            return s + "\n" + constraints_block + "\n"
        return s[:last_paren] + "\n" + constraints_block + "\n" + s[last_paren:]


def inject_constraints_into_files(input_dir: Path,
                                  pattern: str = "*.pddl",
                                  mode: str = "pddl3",
                                  use_equality: bool = False) -> List[Path]:
    """
    Batch process all PDDL problem files in `input_dir` matching `pattern`,
    writing out new files with the configured OUTPUT_SUFFIX.
    Returns the list of written file paths.
    """
    written = []
    for p in sorted(input_dir.glob(pattern)):
        text = p.read_text(encoding="utf-8")
        updated = inject_constraints_into_problem_str(text, mode=mode, use_equality=use_equality)
        out_path = p.with_name(p.stem + OUTPUT_SUFFIX)
        out_path.write_text(updated, encoding="utf-8")
        written.append(out_path)
    return written


# --- Demo on the user's provided problem string ---
example_problem = """(define (problem BW-rand-5)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 )
(:init
(arm-empty)
(on b1 b4)
(on b2 b3)
(on-table b3)
(on b4 b5)
(on-table b5)
(clear b1)
(clear b2)
)
(:goal
(and
(on b1 b3)
(on b2 b5)
(on b4 b2)
(on b5 b1))
)
)"""

updated_example = inject_constraints_into_problem_str(example_problem, mode=MODE, use_equality=USE_EQUALITY)

print(updated_example)
