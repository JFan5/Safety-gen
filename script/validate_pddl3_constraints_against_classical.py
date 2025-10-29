#!/usr/bin/env python3
import argparse
import os
import re
from pathlib import Path
from typing import Dict, List, Tuple, Optional

SOMETIME_BEFORE_RE = re.compile(r"\(\s*sometime-before\s*\(\s*at\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*\(\s*at\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*\)", re.IGNORECASE)
DEBARK_RE = re.compile(r"^\(\s*debark\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*$", re.IGNORECASE)


def read_text(path: str) -> str:
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


def extract_constraints(problem_text: str) -> List[Tuple[Tuple[str, str], Tuple[str, str]]]:
    # returns list of ((car_a, loc_a), (car_b, loc_b)) for constraints of the form sometime-before (at a la) (at b lb)
    constraints: List[Tuple[Tuple[str, str], Tuple[str, str]]] = []
    for m in SOMETIME_BEFORE_RE.finditer(problem_text):
        a_car, a_loc, b_car, b_loc = m.group(1), m.group(2), m.group(3), m.group(4)
        constraints.append(((a_car, a_loc), (b_car, b_loc)))
    return constraints


def parse_plan_debark_order(soln_path: str) -> List[Tuple[str, str]]:
    order: List[Tuple[str, str]] = []
    seen: set[Tuple[str, str]] = set()
    try:
        with open(soln_path, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                m = DEBARK_RE.match(line)
                if not m:
                    continue
                car, loc = m.group(1), m.group(2)
                key = (car, loc)
                if key not in seen:
                    order.append(key)
                    seen.add(key)
    except FileNotFoundError:
        return []
    return order


def index_map(sequence: List[Tuple[str, str]]) -> Dict[Tuple[str, str], int]:
    return {pair: idx for idx, pair in enumerate(sequence)}


def check_plan_violates_constraints(plan_order: List[Tuple[str, str]], constraints: List[Tuple[Tuple[str, str], Tuple[str, str]]]) -> bool:
    # True if any sometime-before is violated by plan ordering
    pos = index_map(plan_order)
    violated_any = False
    for (a, b) in constraints:
        if a in pos and b in pos:
            # constraint: a before b, violation if b occurs before or at same time as a
            if pos[b] <= pos[a]:
                violated_any = True
        # if either not in plan, treat as non-enforced by this plan; skip
    return violated_any


def main():
    parser = argparse.ArgumentParser(description="Validate that PDDL3 sometime-before constraints invalidate classical plans")
    parser.add_argument("problems_dir", type=str, help="Directory with PDDL3 problems (with :constraints)")
    parser.add_argument("solutions_dir", type=str, help="Directory with classical .soln files")
    args = parser.parse_args()

    problems_dir = Path(args.problems_dir)
    solutions_dir = Path(args.solutions_dir)

    problems = sorted(p for p in problems_dir.glob("*.pddl"))
    if not problems:
        print(f"No problems found in {problems_dir}")
        return

    total = 0
    violated = 0
    missing_sol = 0
    no_constraints = 0

    for problem in problems:
        total += 1
        soln = solutions_dir / (problem.stem + ".soln")
        if not soln.exists():
            missing_sol += 1
            print(f"[MISSING] {soln.name}")
            continue
        constraints = extract_constraints(read_text(str(problem)))
        if not constraints:
            no_constraints += 1
            print(f"[NO-CONSTRAINTS] {problem.name}")
            continue
        order = parse_plan_debark_order(str(soln))
        violated_flag = check_plan_violates_constraints(order, constraints)
        if violated_flag:
            violated += 1
            print(f"[OK] Plan invalidated by constraints: {problem.name}")
        else:
            print(f"[WARN] Plan NOT invalidated: {problem.name}")

    print("-" * 50)
    print(f"Problems checked: {total}")
    print(f"Missing .soln: {missing_sol}")
    print(f"No constraints: {no_constraints}")
    print(f"Invalidated (violated constraints): {violated}")
    if total - missing_sol - no_constraints > 0:
        eff = violated / (total - missing_sol - no_constraints) * 100.0
        print(f"Effective invalidation rate: {eff:.1f}%")


if __name__ == "__main__":
    main()
