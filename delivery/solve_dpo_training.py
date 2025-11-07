#!/usr/bin/env python3
"""Solve delivery DPO training problems by simple search.

The problems use the STRIPS delivery domain with optional PDDL3 constraints
of the form:

    (always (not (and (last t1 c_i_j) (at t1 c_k_l))))

These constraints forbid traversing specific directed edges.  The script
parses each problem instance, constructs the directed adjacency graph with
the forbidden edges removed, and delivers each package in a simple sequence
using breadth-first search for routing.
"""

from __future__ import annotations

import argparse
import re
from collections import deque
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Sequence, Tuple


@dataclass
class ProblemInstance:
    path: Path
    truck: str
    truck_start: str
    graph: Dict[str, List[str]]
    forbidden: set[Tuple[str, str]]
    package_starts: Dict[str, str]
    package_goals: Dict[str, str]


def strip_comments(text: str) -> str:
    """Remove PDDL comments."""
    cleaned: List[str] = []
    for line in text.splitlines():
        if ";" in line:
            line = line.split(";", 1)[0]
        cleaned.append(line)
    return "\n".join(cleaned)


def extract_block(text: str, token: str) -> Optional[str]:
    """Extract the balanced parenthesis block that starts with token."""
    if token not in text:
        return None
    start = text.index(token)
    depth = 0
    block_chars: List[str] = []
    for ch in text[start:]:
        block_chars.append(ch)
        if ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
            if depth == 0:
                break
    return "".join(block_chars)


def parse_problem(path: Path) -> ProblemInstance:
    text = strip_comments(path.read_text())
    init_block = extract_block(text, "(:init")
    goal_block = extract_block(text, "(:goal")
    constraints_block = extract_block(text, "(:constraints")
    if init_block is None or goal_block is None:
        raise ValueError(f"Failed to parse init/goal for {path}")

    adjacencies = re.findall(r"\(adjacent\s+(\S+)\s+(\S+)\)", init_block)
    init_at = re.findall(r"\(at\s+(\S+)\s+(\S+)\)", init_block)
    init_empty = re.findall(r"\(empty\s+(\S+)\)", init_block)
    init_carrying = re.findall(r"\(carrying\s+(\S+)\s+(\S+)\)", init_block)
    if init_carrying:
        raise ValueError(f"Unexpected carrying fact in {path}")
    if not init_empty:
        raise ValueError(f"Truck not empty in {path}")

    graph: Dict[str, set[str]] = {}
    for frm, to in adjacencies:
        graph.setdefault(frm, set()).add(to)

    truck_name: Optional[str] = None
    package_starts: Dict[str, str] = {}
    truck_start: Optional[str] = None
    for obj, cell in init_at:
        clean_cell = cell.rstrip(")")
        if obj.startswith("t"):
            truck_name = obj
            truck_start = clean_cell
        elif obj.startswith("p"):
            package_starts[obj] = clean_cell
        else:
            # Skip any other objects (should not happen)
            pass
    if truck_name is None or truck_start is None:
        raise ValueError(f"No truck found in {path}")

    goal_ats = re.findall(r"\(at\s+([^\s\)]+)\s+([^\s\)]+)\)", goal_block)
    package_goals: Dict[str, str] = {}
    for obj, cell in goal_ats:
        if not obj.startswith("p"):
            continue
        package_goals[obj] = cell.rstrip(")")

    forbidden: set[Tuple[str, str]] = set()
    if constraints_block:
        for frm, to in re.findall(
            r"\(last\s+\S+\s+([^\s\)]+)\)\s*\(at\s+\S+\s+([^\s\)]+)\)", constraints_block
        ):
            forbidden.add((frm.rstrip(")"), to.rstrip(")")))

    # Apply forbidden edges to graph
    graph_clean: Dict[str, List[str]] = {}
    for frm, neighbours in graph.items():
        filtered = [to for to in sorted(neighbours) if (frm, to) not in forbidden]
        graph_clean[frm] = filtered

    return ProblemInstance(
        path=path,
        truck=truck_name,
        truck_start=truck_start,
        graph=graph_clean,
        forbidden=forbidden,
        package_starts=package_starts,
        package_goals=package_goals,
    )


def natural_key(name: str) -> List[object]:
    parts = re.split(r"(\d+)", name)
    key: List[object] = []
    for part in parts:
        if part.isdigit():
            key.append(int(part))
        elif part:
            key.append(part)
    return key


def shortest_path(graph: Dict[str, List[str]], start: str, goal: str) -> Optional[List[str]]:
    if start == goal:
        return [start]
    queue = deque([start])
    parents: Dict[str, Optional[str]] = {start: None}
    while queue:
        node = queue.popleft()
        for neighbour in graph.get(node, []):
            if neighbour in parents:
                continue
            parents[neighbour] = node
            if neighbour == goal:
                path: List[str] = [goal]
                cur = node
                while cur is not None:
                    path.append(cur)
                    cur = parents[cur]
                path.reverse()
                return path
            queue.append(neighbour)
    return None


def build_plan(problem: ProblemInstance) -> List[str]:
    truck_pos = problem.truck_start
    packages = dict(problem.package_starts)
    plan: List[str] = []

    for package in sorted(problem.package_goals, key=natural_key):
        goal_cell = problem.package_goals[package]
        current_cell = packages.get(package)
        if current_cell is None:
            raise RuntimeError(f"Package {package} missing from init in {problem.path.name}")
        if current_cell == goal_cell:
            continue

        # Move to package
        path_to_pkg = shortest_path(problem.graph, truck_pos, current_cell)
        if path_to_pkg is None:
            raise RuntimeError(f"No path to package {package} in {problem.path.name}")
        for frm, to in zip(path_to_pkg, path_to_pkg[1:]):
            plan.append(f"(move {problem.truck} {frm} {to})")
        truck_pos = current_cell
        plan.append(f"(pick-package {problem.truck} {package} {truck_pos})")

        # Deliver to goal
        path_to_goal = shortest_path(problem.graph, truck_pos, goal_cell)
        if path_to_goal is None:
            raise RuntimeError(f"No path to goal for {package} in {problem.path.name}")
        for frm, to in zip(path_to_goal, path_to_goal[1:]):
            plan.append(f"(move {problem.truck} {frm} {to})")
        truck_pos = goal_cell
        plan.append(f"(drop-package {problem.truck} {package} {truck_pos})")
        packages[package] = truck_pos

    return plan


def simulate(problem: ProblemInstance, plan: Sequence[str]) -> None:
    truck_pos: Optional[str] = problem.truck_start
    packages = dict(problem.package_starts)
    carrying: Optional[str] = None
    goals = problem.package_goals

    for step, raw in enumerate(plan, 1):
        tokens = raw.strip("()").split()
        if not tokens:
            continue
        action = tokens[0]
        if action == "move":
            _, truck, frm, to = tokens
            if truck != problem.truck:
                raise RuntimeError(f"Unexpected truck {truck} in plan for {problem.path}")
            if truck_pos != frm:
                raise RuntimeError(f"Step {step}: truck not at {frm}")
            if to not in problem.graph.get(frm, []):
                raise RuntimeError(f"Step {step}: illegal move {frm}->{to}")
            if (frm, to) in problem.forbidden:
                raise RuntimeError(f"Step {step}: constraint forbids {frm}->{to}")
            truck_pos = to
        elif action == "pick-package":
            _, truck, package, cell = tokens
            if truck != problem.truck or truck_pos != cell:
                raise RuntimeError(f"Step {step}: invalid pickup location")
            if carrying is not None:
                raise RuntimeError(f"Step {step}: already carrying {carrying}")
            if packages.get(package) != cell:
                raise RuntimeError(f"Step {step}: package {package} not at {cell}")
            carrying = package
            packages[package] = "carried"
        elif action == "drop-package":
            _, truck, package, cell = tokens
            if truck != problem.truck or truck_pos != cell:
                raise RuntimeError(f"Step {step}: invalid drop location")
            if carrying != package:
                raise RuntimeError(f"Step {step}: not carrying {package}")
            packages[package] = cell
            carrying = None
        else:
            raise RuntimeError(f"Unknown action {action} in plan")

    if carrying is not None:
        raise RuntimeError(f"Finished while still carrying {carrying}")
    for package, goal_cell in goals.items():
        if packages.get(package) != goal_cell:
            raise RuntimeError(f"Goal not achieved for {package} in {problem.path}")


def solve_problem(path: Path) -> List[str]:
    problem = parse_problem(path)
    plan = build_plan(problem)
    simulate(problem, plan)
    return plan


def write_solution(problem: Path, plan: Iterable[str]) -> None:
    sol_path = problem.with_suffix(".soln")
    with sol_path.open("w") as fh:
        for action in plan:
            fh.write(f"{action}\n")


def main() -> None:
    parser = argparse.ArgumentParser(description="Solve delivery DPO training problems.")
    parser.add_argument(
        "--problem",
        type=Path,
        help="Solve a single problem (default: solve all in delivery/dpo_training)",
    )
    parser.add_argument(
        "--directory",
        type=Path,
        default=Path(__file__).resolve().parent / "dpo_training",
        help="Directory with PDDL problems",
    )
    args = parser.parse_args()

    if args.problem:
        problems = [args.problem]
    else:
        problems = sorted(args.directory.glob("*.pddl"))
    if not problems:
        raise SystemExit("No PDDL problems found.")

    for idx, problem in enumerate(problems, 1):
        plan = solve_problem(problem)
        write_solution(problem, plan)
        if idx % 50 == 0 or idx == len(problems):
            print(f"Solved {idx}/{len(problems)} problems")


if __name__ == "__main__":
    main()
