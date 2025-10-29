#!/usr/bin/env python3
import argparse
import os
import sys
import tempfile
from pathlib import Path
from typing import List, Set, Tuple
import re
import random

# We purposely avoid importing project-local helpers to keep this self-contained
import tarski
from tarski.io import PDDLReader, FstripsWriter
from tarski.model import Model
from tarski.syntax import Constant, land


# Regex utilities for extracting uniqueness signature
AT_RE = re.compile(r"\(\s*at\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)", re.IGNORECASE)
INIT_SECTION_RE = re.compile(r"\(\s*:init(.*?)\)\s*\(\s*:\w+", re.DOTALL | re.IGNORECASE)
GOAL_SECTION_RE = re.compile(r"\(\s*:goal(.*?)\)\s*\)\s*$", re.DOTALL | re.IGNORECASE)


def build_problem_text(domain_file: Path, size: int, nr_packages: int, seed: int) -> str:
    rng = random.Random(seed)

    pddl_reader = PDDLReader(raise_on_error=True)
    pddl_reader.parse_domain(str(domain_file))
    problem = pddl_reader.problem
    language = problem.language
    init: Model = tarski.model.create(language)

    # Cells for a square grid size x size
    cells: List[Constant] = []
    for x in range(size):
        for y in range(size):
            cells.append(language.constant(f"c_{x}_{y}", "cell"))

    # Packages
    packages: List[Constant] = []
    for i in range(1, nr_packages + 1):
        packages.append(language.constant(f"p{i}", "package"))

    # Truck
    truck = language.constant("t1", "truck")

    # Adjacency relations
    adjacent_predicate = language.get_predicate("adjacent")
    for x in range(size):
        for y in range(size):
            current_cell = language.get_constant(f"c_{x}_{y}")
            if x < size - 1:
                init.add(adjacent_predicate, current_cell, language.get_constant(f"c_{x + 1}_{y}"))
            if x > 0:
                init.add(adjacent_predicate, current_cell, language.get_constant(f"c_{x - 1}_{y}"))
            if y < size - 1:
                init.add(adjacent_predicate, current_cell, language.get_constant(f"c_{x}_{y + 1}"))
            if y > 0:
                init.add(adjacent_predicate, current_cell, language.get_constant(f"c_{x}_{y - 1}"))

    # Random positions
    at_predicate = language.get_predicate("at")
    package_cell_names: List[str] = []
    for package in packages:
        cell = rng.choice(cells)
        package_cell_names.append(cell.name)
        init.add(at_predicate, package, cell)

    # Truck position
    truck_cell = rng.choice(cells)
    init.add(at_predicate, truck, truck_cell)

    # Truck is empty
    init.add(language.get_predicate("empty"), truck)

    # Goal: all packages at a chosen goal cell; if all packages start in the same cell,
    # ensure the goal cell is different to avoid trivialities.
    if len(set(package_cell_names)) == 1:
        goal_cell = rng.choice(cells)
        while goal_cell.name == package_cell_names[0]:
            goal_cell = rng.choice(cells)
    else:
        goal_cell = rng.choice(cells)
    goal_atoms = [at_predicate(package, goal_cell) for package in packages]

    problem.name = f"delivery-{size}x{size}-{nr_packages}-{seed}"
    problem.init = init
    problem.goal = land(*goal_atoms)

    # Write to a temporary file, then read back as text
    writer = FstripsWriter(problem)
    with tempfile.NamedTemporaryFile(delete=False, suffix=".pddl") as tmp:
        tmp_path = Path(tmp.name)
    try:
        writer.write_instance(str(tmp_path), constant_objects=[])
        return tmp_path.read_text()
    finally:
        try:
            tmp_path.unlink(missing_ok=True)
        except Exception:
            pass


def signature(problem_text: str, size: int, nr_packages: int) -> Tuple:
    init_m = INIT_SECTION_RE.search(problem_text)
    goal_m = GOAL_SECTION_RE.search(problem_text)
    if not init_m or not goal_m:
        raise ValueError(":init or :goal section not found in problem text")
    init_text = init_m.group(1)
    goal_text = goal_m.group(1)

    package_init_cells: List[str] = []
    truck_cell: str | None = None
    for obj, loc in AT_RE.findall(init_text):
        if obj.startswith("p"):
            package_init_cells.append(loc)
        elif obj.startswith("t"):
            truck_cell = loc

    package_goal_cells: List[str] = []
    for obj, loc in AT_RE.findall(goal_text):
        if obj.startswith("p"):
            package_goal_cells.append(loc)

    package_init_cells_sorted = tuple(sorted(package_init_cells))
    package_goal_cells_sorted = tuple(sorted(package_goal_cells))
    return (size, nr_packages, truck_cell, package_init_cells_sorted, package_goal_cells_sorted)


def seen_from_dir(out_dir: Path, size: int, nr_packages: int) -> Set[Tuple]:
    seen: Set[Tuple] = set()
    if not out_dir.exists():
        return seen
    for p in out_dir.glob("*.pddl"):
        try:
            text = p.read_text()
            sig = signature(text, size, nr_packages)
            seen.add(sig)
        except Exception:
            continue
    return seen


def write_problem(out_dir: Path, text: str, size: int, nr_packages: int, seed: int, index: int) -> Path:
    name = f"delivery-s{size}-p{nr_packages}-seed{seed}.pddl"
    out_path = out_dir / name
    if out_path.exists():
        out_path = out_dir / f"delivery-s{size}-p{nr_packages}-{index:06d}.pddl"
    out_path.write_text(text)
    return out_path


def generate_unique(out_dir: Path, domain_file: Path, count: int, size: int, nr_packages: int, base_seed: int, max_attempts: int = 100000) -> int:
    rng = random.Random(base_seed)
    seen = seen_from_dir(out_dir, size, nr_packages)
    generated = 0
    attempts = 0
    out_dir.mkdir(parents=True, exist_ok=True)

    while generated < count and attempts < max_attempts:
        attempts += 1
        seed = rng.randint(1, 2**31 - 1)
        text = build_problem_text(domain_file, size, nr_packages, seed)
        sig = signature(text, size, nr_packages)
        if sig in seen:
            continue
        seen.add(sig)
        write_problem(out_dir, text, size, nr_packages, seed, generated + 1)
        generated += 1
        if generated % 50 == 0 or generated == count:
            print(f"Generated {generated}/{count} unique problems for size={size}, packages={nr_packages}...")
    return generated


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate unique Delivery problems for a single (size, packages) setup")
    parser.add_argument("--count", type=int, default=100, help="Number of unique problems to generate")
    parser.add_argument("--target-dir", type=str, default="all_problems", help="Output directory")
    parser.add_argument("--size", type=int, default=2, help="Grid size (square grid)")
    parser.add_argument("--packages", type=int, default=1, help="Number of packages")
    parser.add_argument("--seed", type=int, default=20250101, help="Base seed for sampling unique instances")
    parser.add_argument("--domain", type=str, default="domain.pddl", help="Path to delivery domain.pddl")
    args = parser.parse_args()

    domain_file = Path(args.domain).resolve()
    if not domain_file.exists():
        print(f"ERROR: Domain file not found: {domain_file}")
        sys.exit(1)

    out_dir = Path(args.target_dir).resolve()

    try:
        total = generate_unique(out_dir, domain_file, args.count, args.size, args.packages, args.seed)
    except Exception as e:
        print(f"ERROR: generation failed: {e}")
        sys.exit(1)

    print(f"Done. Generated {total} unique problems in {out_dir}")


if __name__ == "__main__":
    main()


