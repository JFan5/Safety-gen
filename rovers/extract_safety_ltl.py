#!/usr/bin/env python3

"""
Extract key safety-related constraints from the Rovers domain preconditions
and translate them to simple LTL formulas.

This script mimics the style of scenarios/gripper/play_spot_auto.py but focuses
on the most critical safety preconditions in the Rovers domain.

For each action instance (based on objects in the problem), it emits a formula:
  G(do_<actionName>_<params> -> (pre1 & pre2 & ...))

Only a curated subset of preconditions is included per action to keep formulas
focused on safety (e.g., visibility, traversability, availability, storage state).
"""

from __future__ import annotations

import argparse
import itertools
import re
from pathlib import Path
from typing import Dict, List, Optional, Tuple


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def parse_typed_objects_from_objects_block(objects_block: str) -> Dict[str, List[str]]:
    """Parse typed objects from the (:objects ...) block.

    Expected PDDL style like:
      a b c - rover
      w1 w2 - waypoint
      ...

    Returns: {type_name: [obj1, obj2, ...]}
    """
    tokens = objects_block.replace("\n", " ").split()
    typed: Dict[str, List[str]] = {}
    cur_objs: List[str] = []
    i = 0
    while i < len(tokens):
        if tokens[i] == "-" and i + 1 < len(tokens):
            t = tokens[i + 1].lower()
            typed.setdefault(t, []).extend(cur_objs)
            cur_objs = []
            i += 2
            continue
        # regular identifier
        cur_objs.append(tokens[i])
        i += 1
    return typed


def parse_problem_typed_objects(problem_file: Path) -> Dict[str, List[str]]:
    """Extract typed objects by reading the (:objects ...) block from problem."""
    content = read_text(problem_file)
    m = re.search(r"\(:objects\s+(.*?)\)\s*\n", content, re.DOTALL)
    if not m:
        return {}
    return parse_typed_objects_from_objects_block(m.group(1))


def parse_action_blocks(domain_text: str) -> List[str]:
    """Return raw text blocks for each (:action ...) in the domain file."""
    blocks: List[str] = []
    i = 0
    while True:
        start = domain_text.find("(:action", i)
        if start == -1:
            break
        depth = 0
        j = start
        while j < len(domain_text):
            if domain_text[j] == "(":
                depth += 1
            elif domain_text[j] == ")":
                depth -= 1
                if depth == 0:
                    blocks.append(domain_text[start : j + 1])
                    i = j + 1
                    break
            j += 1
        else:
            break
    return blocks


def parse_action_signature(action_block: str) -> Tuple[str, List[str]]:
    """Return (action_name, param_vars) where param_vars are like ['?r','?p',...]"""
    name_m = re.search(r"\(:action\s+(\w+)", action_block)
    name = name_m.group(1) if name_m else "unknown"
    params_m = re.search(r":parameters\s*\((.*?)\)", action_block, re.DOTALL)
    params_vars: List[str] = []
    if params_m:
        params_str = params_m.group(1)
        params_vars = [p for p in params_str.split() if p.startswith("?")]
    return name, params_vars


def extract_preconditions(action_block: str) -> List[str]:
    """Extract flat list of top-level precondition s-exprs from :precondition.

    Returns each as the inner text without outer parentheses, e.g.,
      "at ?r ?p" for (at ?r ?p)
    """
    pre_m = re.search(r":precondition\s+(.*?)\s*:effect", action_block, re.DOTALL)
    if not pre_m:
        return []
    pre_str = pre_m.group(1).strip()

    # Remove outer (and ...) if present
    if pre_str.startswith("(and"):
        # strip one leading (and ...)
        depth = 0
        start = pre_str.find("(and")
        i = start + 4
        depth = 1
        while i < len(pre_str) and depth > 0:
            if pre_str[i] == "(":
                depth += 1
            elif pre_str[i] == ")":
                depth -= 1
            i += 1
        pre_str = pre_str[start + 4 : i - 1].strip()

    # Split top-level s-exprs
    parts: List[str] = []
    depth = 0
    cur = ""
    for ch in pre_str:
        if ch == "(":
            if depth == 0:
                cur = ""
            else:
                cur += ch
            depth += 1
        elif ch == ")":
            depth -= 1
            if depth == 0:
                if cur.strip():
                    parts.append(cur.strip())
                cur = ""
            else:
                cur += ch
        elif depth > 0:
            cur += ch
    return parts


def pred_head(expr: str) -> str:
    # expr like "at ?r ?p" -> "at"
    return (expr.split() or [""])[0]


def substitute(expr: str, param_map: Dict[str, str]) -> Optional[str]:
    """Substitute ?vars in expr with concrete object names using param_map.
    Returns a safe proposition name joined by underscores.
    """
    parts = expr.split()
    if not parts:
        return None
    name = parts[0].replace("-", "_")
    args = [param_map.get(p.lstrip("?"), p.lstrip("?")) for p in parts[1:]]
    if args:
        return f"{name}_{'_'.join(args)}"
    return name


# Critical safety predicates to include per action
CRITICAL_PREDS: Dict[str, List[str]] = {
    "navigate": ["can_traverse", "visible", "at", "available"],
    "sample_soil": ["at", "at_soil_sample", "equipped_for_soil_analysis", "store_of", "empty"],
    "sample_rock": ["at", "at_rock_sample", "equipped_for_rock_analysis", "store_of", "empty"],
    "drop": ["store_of", "full"],
    "calibrate": ["equipped_for_imaging", "calibration_target", "at", "visible_from", "on_board"],
    "take_image": ["calibrated", "on_board", "equipped_for_imaging", "supports", "visible_from", "at"],
    "communicate_soil_data": ["at", "at_lander", "have_soil_analysis", "visible", "available", "channel_free"],
    "communicate_rock_data": ["at", "at_lander", "have_rock_analysis", "visible", "available", "channel_free"],
    "communicate_image_data": ["at", "at_lander", "have_image", "visible", "available", "channel_free"],
}


# Parameter type signature per action (ordered)
ACTION_PARAM_TYPES: Dict[str, List[str]] = {
    "navigate": ["rover", "waypoint", "waypoint"],
    "sample_soil": ["rover", "store", "waypoint"],
    "sample_rock": ["rover", "store", "waypoint"],
    "drop": ["rover", "store"],
    "calibrate": ["rover", "camera", "objective", "waypoint"],
    "take_image": ["rover", "waypoint", "objective", "camera", "mode"],
    "communicate_soil_data": ["rover", "lander", "waypoint", "waypoint", "waypoint"],
    "communicate_rock_data": ["rover", "lander", "waypoint", "waypoint", "waypoint"],
    "communicate_image_data": ["rover", "lander", "objective", "mode", "waypoint", "waypoint"],
}


def generate_param_combinations(action_name: str, typed_objects: Dict[str, List[str]],
                                param_vars: List[str], max_combos: int = 1000) -> List[List[str]]:
    """Generate concrete parameter lists by type product with small safeguards.

    - Enforces waypoint distinctness for pairs where it makes sense (e.g., navigate y!=z)
    - Caps the total combinations to max_combos for practicality
    """
    types = ACTION_PARAM_TYPES.get(action_name)
    if not types or len(types) != len(param_vars):
        return []

    pools: List[List[str]] = []
    for t in types:
        objs = typed_objects.get(t, [])
        if not objs:
            return []
        pools.append(objs)

    raw = itertools.product(*pools)
    combos: List[List[str]] = []
    for params in raw:
        params = list(params)
        if action_name == "navigate":
            # y != z
            if len(params) >= 3 and params[1] == params[2]:
                continue
        if action_name.startswith("communicate_"):
            # last two waypoints x != y
            if action_name in ("communicate_soil_data", "communicate_rock_data"):
                if len(params) >= 5 and params[-2] == params[-1]:
                    continue
            elif action_name == "communicate_image_data":
                if len(params) >= 6 and params[-2] == params[-1]:
                    continue
        combos.append(params)
        if len(combos) >= max_combos:
            break
    return combos


def build_ltl_formulas(domain_file: Path, problem_file: Path, max_per_action: int = 200) -> List[str]:
    domain_text = read_text(domain_file)
    typed_objects = parse_problem_typed_objects(problem_file)

    blocks = parse_action_blocks(domain_text)
    formulas: List[str] = []

    for block in blocks:
        action_name, param_vars = parse_action_signature(block)
        preconds = extract_preconditions(block)
        if not preconds:
            continue

        # Filter to critical predicates only
        critical = CRITICAL_PREDS.get(action_name)
        if not critical:
            continue
        selected = [p for p in preconds if pred_head(p) in critical]
        if not selected:
            continue

        combos = generate_param_combinations(action_name, typed_objects, param_vars, max_per_action)
        for params in combos:
            # map ?var -> object
            pmap = {param_vars[i].lstrip("?"): params[i] for i in range(len(param_vars))}
            action_atom = f"do_{action_name}_{'_'.join(params)}"
            body_atoms: List[str] = []
            for s in selected:
                atom = substitute(s, pmap)
                if atom:
                    body_atoms.append(atom)
            if not body_atoms:
                continue
            body = " & ".join(body_atoms)
            formulas.append(f"G({action_atom} -> ({body}))")

    return formulas


def main() -> None:
    ap = argparse.ArgumentParser(description="Extract key safety LTL formulas for Rovers")
    ap.add_argument("--domain", default="domain.pddl")
    ap.add_argument("--problem", default=None, help="Problem file to instantiate with objects")
    ap.add_argument("--max-per-action", type=int, default=200, help="Cap formula instances per action")
    args = ap.parse_args()

    domain_file = Path(args.domain).resolve()
    if not domain_file.exists():
        raise SystemExit(f"Domain file not found: {domain_file}")

    if args.problem:
        problem_file = Path(args.problem).resolve()
    else:
        # Try to auto-pick the first problem from training_problems
        scenario_root = domain_file.parent
        tp = list((scenario_root / "training_problems").glob("*.pddl"))
        if not tp:
            raise SystemExit("No problem file provided and no training_problems/*.pddl found")
        problem_file = tp[0]

    formulas = build_ltl_formulas(domain_file, problem_file, args.max_per_action)
    print(f"Extracted {len(formulas)} safety formulas from {domain_file.name} using {problem_file.name}\n")
    for i, f in enumerate(formulas, 1):
        print(f"{i}. {f}")


if __name__ == "__main__":
    main()


