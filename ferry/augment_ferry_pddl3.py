#!/usr/bin/env python3
import os
import re
import argparse
from typing import Dict, List, Tuple, Set

PROBLEM_HEADER_RE = re.compile(r"^\(define\s*\(problem\s+([^\)]+)\)")
OBJECTS_SECTION_RE = re.compile(r"\(\s*:objects(.*?)\)\s*\(\s*:\w+", re.DOTALL | re.IGNORECASE)
INIT_SECTION_RE = re.compile(r"\(\s*:init(.*?)\)\s*\(\s*:\w+", re.DOTALL | re.IGNORECASE)
GOAL_SECTION_RE = re.compile(r"\(\s*:goal(.*?)\)\s*\)\s*$", re.DOTALL | re.IGNORECASE)
REQUIREMENTS_RE = re.compile(r"\(\s*:requirements(.*?)\)", re.DOTALL | re.IGNORECASE)

# Targeted predicate extractors
CAR_RE = re.compile(r"\(\s*car\s+([^\s\(\)]+)\s*\)", re.IGNORECASE)
LOC_RE = re.compile(r"\(\s*location\s+([^\s\(\)]+)\s*\)", re.IGNORECASE)
AT_RE = re.compile(r"\(\s*at\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)", re.IGNORECASE)


def read_file_text(path: str) -> str:
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


def write_text(path: str, text: str) -> None:
    with open(path, "w", encoding="utf-8") as f:
        f.write(text)


def extract_objects(problem_text: str) -> Tuple[Set[str], Set[str]]:
    cars: Set[str] = set()
    locations: Set[str] = set()
    m = OBJECTS_SECTION_RE.search(problem_text)
    if not m:
        return cars, locations
    obj_text = m.group(1)
    # Objects are untyped in this domain; use naming convention
    tokens = [tok for tok in re.split(r"\s+", obj_text) if tok]
    for t in tokens:
        if t.startswith("c"):
            cars.add(t)
        if t.startswith("l"):
            locations.add(t)
    return cars, locations


def extract_init_goal_sections(problem_text: str) -> Tuple[str, str]:
    init_match = INIT_SECTION_RE.search(problem_text)
    goal_match = GOAL_SECTION_RE.search(problem_text)
    if not init_match or not goal_match:
        raise ValueError(":init or :goal section not found")
    return init_match.group(1), goal_match.group(1)


def extract_init_maps(init_text: str) -> Tuple[Dict[str, str], Set[str], Set[str]]:
    cars: Set[str] = set(CAR_RE.findall(init_text))
    locs: Set[str] = set(LOC_RE.findall(init_text))
    car_to_loc: Dict[str, str] = {}
    for car, loc in AT_RE.findall(init_text):
        if car.startswith("c") and loc.startswith("l"):
            car_to_loc[car] = loc
    return car_to_loc, cars, locs


def extract_goal_map(goal_text: str) -> Dict[str, str]:
    car_to_loc: Dict[str, str] = {}
    for car, loc in AT_RE.findall(goal_text):
        if car.startswith("c") and loc.startswith("l"):
            car_to_loc[car] = loc
    return car_to_loc


def sometime_before_formula(car_a: str, loc_a: str, car_b: str, loc_b: str) -> str:
    return f"(sometime-before (at {car_a} {loc_a}) (at {car_b} {loc_b}))"


def always_allowed_ports_formula(car: str, allowed_locs: Set[str]) -> str:
    # Encode as: (always (or (not (at c l1)) (not (at c l2)) ... (at c allowed1) (at c allowed2) ...))
    # But better: forbid non-allowed ports with always (not (at c lx)) for each lx not in allowed.
    disallow_parts = []
    for loc in sorted(allowed_locs["all"] - allowed_locs["allowed"]):
        disallow_parts.append(f"(always (not (at {car} {loc})))")
    return "\n".join(disallow_parts)


def build_constraints(problem_text: str, init_text: str, goal_text: str) -> List[str]:
    init_map, cars_init, locs_init = extract_init_maps(init_text)
    goal_map = extract_goal_map(goal_text)
    cars_objs, locs_objs = extract_objects(problem_text)

    cars: Set[str] = set(cars_objs) | set(cars_init) | set(goal_map.keys())
    locations: Set[str] = set(locs_objs) | set(locs_init) | set(goal_map.values())

    constraints: List[str] = []

    # Ordering among cars sharing an origin (chain by id)
    origin_to_cars: Dict[str, List[str]] = {}
    for car in cars:
        origin = init_map.get(car)
        if origin:
            origin_to_cars.setdefault(origin, []).append(car)
    for origin, cars_at_origin in origin_to_cars.items():
        cars_at_origin_sorted = sorted(cars_at_origin)
        for i in range(len(cars_at_origin_sorted) - 1):
            a = cars_at_origin_sorted[i]
            b = cars_at_origin_sorted[i + 1]
            ga = goal_map.get(a)
            gb = goal_map.get(b)
            if ga and gb and ga != gb:
                constraints.append(sometime_before_formula(a, ga, b, gb))

    # Restrict cars to origin/goal only
    for car in sorted(cars):
        allowed = set()
        if init_map.get(car):
            allowed.add(init_map[car])
        if goal_map.get(car):
            allowed.add(goal_map[car])
        if not allowed:
            continue
        for loc in sorted(locations):
            if loc not in allowed:
                constraints.append(f"(always (not (at {car} {loc})))")

    return constraints


def insert_constraints(problem_text: str, constraints: List[str]) -> str:
    if not constraints:
        return problem_text
    if len(constraints) == 1:
        constraints_block = "\n(:constraints\n  " + constraints[0] + "\n)\n"
    else:
        inner = "\n    ".join(constraints)
        constraints_block = "\n(:constraints\n  (and\n    " + inner + "\n  )\n)\n"
    return re.sub(r"\)\s*$", constraints_block + ")", problem_text, count=1)


def augment_problem_text(problem_text: str) -> str:
    init_text, goal_text = extract_init_goal_sections(problem_text)
    constraints = build_constraints(problem_text, init_text, goal_text)
    if not constraints:
        return problem_text
    augmented = insert_constraints(problem_text, constraints)
    return augmented


def process_file(input_path: str, output_path: str) -> None:
    text = read_file_text(input_path)
    augmented = augment_problem_text(text)
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    write_text(output_path, augmented)


def process_dir(input_dir: str, output_dir: str) -> None:
    os.makedirs(output_dir, exist_ok=True)
    for name in os.listdir(input_dir):
        if not name.endswith(".pddl"):
            continue
        src = os.path.join(input_dir, name)
        dst = os.path.join(output_dir, name)
        process_file(src, dst)


def main():
    parser = argparse.ArgumentParser(description="Augment ferry PDDL problems with PDDL3 constraints inferred from init/goal")
    parser.add_argument("input", help="Input .pddl file or directory")
    parser.add_argument("output", help="Output file or directory")
    args = parser.parse_args()

    if os.path.isdir(args.input):
        process_dir(args.input, args.output)
    else:
        out_is_dir = False
        if os.path.isdir(args.output):
            out_is_dir = True
        elif not os.path.exists(args.output):
            _, ext = os.path.splitext(args.output)
            if ext.lower() != ".pddl":
                out_is_dir = True
        if out_is_dir:
            os.makedirs(args.output, exist_ok=True)
            basename = os.path.basename(args.input)
            out_path = os.path.join(args.output, basename)
            process_file(args.input, out_path)
        else:
            process_file(args.input, args.output)

if __name__ == "__main__":
    main()
