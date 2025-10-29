#!/usr/bin/env python3

"""
Validate a rovers plan (.soln) against key safety LTL constraints derived from
domain preconditions. Reports the first violated constraint if any.

Usage:
  python3 validate_solution.py \
    --domain scenarios/rovers/domain.pddl \
    --problem scenarios/rovers/training_problems/rover1_waypoint3_objective1_camera1_goal1_seed1.pddl \
    --soln scenarios/rovers/training_problems/rover1_waypoint3_objective1_camera1_goal1_seed1.soln
"""

from __future__ import annotations

import argparse
import re
from pathlib import Path
from typing import Dict, List, Set, Tuple


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def parse_init_atoms(problem_file: Path) -> Set[str]:
    """Parse :init block ground atoms and return as strings like pred_a_b."""
    content = read_text(problem_file)
    m = re.search(r"\(:init(.*?)\)\s*\n\s*\(:goal", content, re.DOTALL)
    if not m:
        return set()
    init = m.group(1)
    atoms: Set[str] = set()
    for line in init.splitlines():
        line = line.strip()
        if not line or not line.startswith("("):
            continue
        # e.g. (at rover0 waypoint1)
        parts = line.strip("() ").split()
        if not parts:
            continue
        pred = parts[0]
        args = parts[1:]
        atoms.add("%s_%s" % (pred, "_".join(args)) if args else pred)
    return atoms


def parse_soln(soln_file: Path) -> List[Tuple[str, List[str]]]:
    """Parse plan: returns list of (action, [args...])."""
    steps: List[Tuple[str, List[str]]] = []
    for line in read_text(soln_file).splitlines():
        line = line.strip()
        if not line:
            continue
        assert line.startswith("("), f"Bad soln line: {line}"
        items = line.strip("() ").split()
        act = items[0]
        params = items[1:]
        steps.append((act, params))
    return steps


def atom(pred: str, *args: str) -> str:
    return f"{pred}_{'_'.join(args)}" if args else pred


def required_atoms_for_action(action: str, params: List[str]) -> List[str]:
    """Return list of required ground atoms (subset of safety preconds)."""
    # Map param list by position to domain vars
    if action == "navigate":
        r, y, z = params
        return [
            atom("can_traverse", r, y, z),
            atom("visible", y, z),
            atom("at", r, y),
            atom("available", r),
        ]
    if action == "sample_soil":
        r, s, p = params
        return [
            atom("at", r, p),
            atom("at_soil_sample", p),
            atom("equipped_for_soil_analysis", r),
            atom("store_of", s, r),
            atom("empty", s),
        ]
    if action == "sample_rock":
        r, s, p = params
        return [
            atom("at", r, p),
            atom("at_rock_sample", p),
            atom("equipped_for_rock_analysis", r),
            atom("store_of", s, r),
            atom("empty", s),
        ]
    if action == "drop":
        r, s = params
        return [atom("store_of", s, r), atom("full", s)]
    if action == "calibrate":
        r, i, t, w = params
        return [
            atom("equipped_for_imaging", r),
            atom("calibration_target", i, t),
            atom("at", r, w),
            atom("visible_from", t, w),
            atom("on_board", i, r),
        ]
    if action == "take_image":
        r, p, o, i, m = params
        return [
            atom("calibrated", i, r),
            atom("on_board", i, r),
            atom("equipped_for_imaging", r),
            atom("supports", i, m),
            atom("visible_from", o, p),
            atom("at", r, p),
        ]
    if action == "communicate_soil_data":
        r, l, p, x, y = params
        return [
            atom("at", r, x),
            atom("at_lander", l, y),
            atom("have_soil_analysis", r, p),
            atom("visible", x, y),
            atom("available", r),
            atom("channel_free", l),
        ]
    if action == "communicate_rock_data":
        r, l, p, x, y = params
        return [
            atom("at", r, x),
            atom("at_lander", l, y),
            atom("have_rock_analysis", r, p),
            atom("visible", x, y),
            atom("available", r),
            atom("channel_free", l),
        ]
    if action == "communicate_image_data":
        r, l, o, m, x, y = params
        return [
            atom("at", r, x),
            atom("at_lander", l, y),
            atom("have_image", r, o, m),
            atom("visible", x, y),
            atom("available", r),
            atom("channel_free", l),
        ]
    # Unknown action -> no requirements
    return []


def apply_effects(state: Set[str], action: str, params: List[str]) -> None:
    """Apply simplified effects to the state set (atoms as strings)."""
    if action == "navigate":
        r, y, z = params
        state.discard(atom("at", r, y))
        state.add(atom("at", r, z))
        return
    if action == "sample_soil":
        r, s, p = params
        state.discard(atom("empty", s))
        state.add(atom("full", s))
        state.add(atom("have_soil_analysis", r, p))
        state.discard(atom("at_soil_sample", p))
        return
    if action == "sample_rock":
        r, s, p = params
        state.discard(atom("empty", s))
        state.add(atom("full", s))
        state.add(atom("have_rock_analysis", r, p))
        state.discard(atom("at_rock_sample", p))
        return
    if action == "drop":
        r, s = params
        state.discard(atom("full", s))
        state.add(atom("empty", s))
        return
    if action == "calibrate":
        r, i, t, w = params
        state.add(atom("calibrated", i, r))
        return
    if action == "take_image":
        r, p, o, i, m = params
        state.add(atom("have_image", r, o, m))
        state.discard(atom("calibrated", i, r))
        return
    if action == "communicate_soil_data":
        r, l, p, x, y = params
        state.add(atom("communicated_soil_data", p))
        return
    if action == "communicate_rock_data":
        r, l, p, x, y = params
        state.add(atom("communicated_rock_data", p))
        return
    if action == "communicate_image_data":
        r, l, o, m, x, y = params
        state.add(atom("communicated_image_data", o, m))
        return


def ltl_formula_for(action: str, params: List[str], required_atoms: List[str]) -> str:
    return f"G(do_{action}_{'_'.join(params)} -> (" + " & ".join(required_atoms) + "))"


def validate(domain_file: Path, problem_file: Path, soln_file: Path) -> int:
    # Domain file is currently unused; kept for symmetry and future extensions
    state = parse_init_atoms(problem_file)
    steps = parse_soln(soln_file)

    for idx, (action, params) in enumerate(steps, 1):
        reqs = required_atoms_for_action(action, params)
        missing = [a for a in reqs if a not in state]
        if missing:
            print(f"INVALID at step {idx}: {action}({' '.join(params)})")
            print("Missing preconditions:")
            for m in missing:
                print(f"  - {m}")
            print("Violated constraint:")
            print(f"  {ltl_formula_for(action, params, reqs)}")
            return 1
        apply_effects(state, action, params)

    print("VALID: All safety constraints satisfied by the solution.")
    return 0


def main() -> None:
    ap = argparse.ArgumentParser(description="Validate rovers .soln against safety constraints")
    ap.add_argument("--domain", required=True)
    ap.add_argument("--problem", required=True)
    ap.add_argument("--soln", required=True)
    args = ap.parse_args()

    exit(validate(Path(args.domain), Path(args.problem), Path(args.soln)))


if __name__ == "__main__":
    main()


