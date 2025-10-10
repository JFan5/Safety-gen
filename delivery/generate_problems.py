import argparse
import os
from pathlib import Path
import random
import shutil

import tarski
from tarski.io import PDDLReader, FstripsWriter
from tarski.model import Model
from tarski.syntax import Constant, land


def generate_single_instance(domain_file: Path, size: int, nr_packages: int, out_dir: Path, index: int, output_name: str | None = None) -> None:
    pddl_reader = PDDLReader(raise_on_error=True)
    pddl_reader.parse_domain(domain_file)
    problem = pddl_reader.problem
    language = problem.language
    init: Model = tarski.model.create(language)

    # Create the cells (square grid)
    cells: list[Constant] = []
    for x in range(size):
        for y in range(size):
            cell = language.constant(f"c_{x}_{y}", "cell")
            cells.append(cell)

    # Create the packages
    packages: list[Constant] = []
    for i in range(1, nr_packages + 1):
        package = language.constant(f"p{i}", "package")
        packages.append(package)

    # Create the truck
    truck = language.constant("t1", "truck")

    # Add the "adjacent" atoms
    adjacent_predicate = language.get_predicate("adjacent")
    for x in range(size):
        for y in range(size):
            current_cell = language.get_constant(f"c_{x}_{y}")
            if x < size - 1:
                right_neighbor = language.get_constant(f"c_{x + 1}_{y}")
                init.add(adjacent_predicate, current_cell, right_neighbor)
            if x > 0:
                left_neighbor = language.get_constant(f"c_{x - 1}_{y}")
                init.add(adjacent_predicate, current_cell, left_neighbor)
            if y < size - 1:
                bottom_neighbor = language.get_constant(f"c_{x}_{y + 1}")
                init.add(adjacent_predicate, current_cell, bottom_neighbor)
            if y > 0:
                top_neighbor = language.get_constant(f"c_{x}_{y - 1}")
                init.add(adjacent_predicate, current_cell, top_neighbor)

    # Randomly sample cells for the packages
    at_predicate = language.get_predicate("at")
    package_cell_names = []
    for package in packages:
        cell = random.choice(cells)
        package_cell_names.append(cell.name)
        init.add(at_predicate, package, cell)

    # Randomly sample a cell for the truck
    cell = random.choice(cells)
    init.add(at_predicate, truck, cell)

    # The truck always starts out empty
    init.add(language.get_predicate("empty"), truck)

    # Create the goal
    # If all packages are in the same cell, ensure this is not the goal cell
    if len(set(package_cell_names)) == 1:
        goal_cell = random.choice(cells)
        while goal_cell.name == package_cell_names[0]:
            goal_cell = random.choice(cells)
    else:
        goal_cell = random.choice(cells)
    goal_atoms = [at_predicate(package, goal_cell) for package in packages]

    problem.name = f"delivery-{size}x{size}-{nr_packages}-{index}"
    problem.init = init
    problem.goal = land(*goal_atoms)

    # Write the problem to a file
    writer = FstripsWriter(problem)
    output_file_name = output_name if output_name else f"instance_s-{size}_p-{nr_packages}_v-{index}.pddl"
    output_file_path = out_dir / output_file_name
    writer.write_instance(str(output_file_path), constant_objects=[])
    print(f"Generated {output_file_path}")


def main():
    parser = argparse.ArgumentParser(description="Generate a specified number of Delivery problems")
    parser.add_argument("--domain", type=str, default="domain.pddl", help="Path to delivery domain.pddl")
    parser.add_argument("--output", type=str, default="output", help="Output folder for generated problems")
    parser.add_argument("--num", type=int, required=True, help="Number of instances to generate")
    parser.add_argument("--min_size", type=int, default=2, help="Minimum grid size (inclusive)")
    parser.add_argument("--max_size", type=int, default=9, help="Maximum grid size (inclusive)")
    parser.add_argument("--max_nr_packages", type=int, default=5, help="Maximum number of packages in an instance")
    parser.add_argument("--seed", type=int, default=None, help="Random seed for reproducibility")
    args = parser.parse_args()

    if args.seed is not None:
        random.seed(args.seed)

    domain_file = Path(args.domain)
    if not domain_file.exists():
        raise FileNotFoundError(f"Domain file not found: {domain_file}")

    out_dir = Path(args.output)
    # 清空输出目录
    if out_dir.exists():
        shutil.rmtree(out_dir)
    os.makedirs(out_dir, exist_ok=True)

    if args.min_size < 2:
        raise ValueError("min_size must be >= 2")
    if args.max_size < args.min_size:
        raise ValueError("max_size must be >= min_size")
    if args.max_nr_packages < 1:
        raise ValueError("max_nr_packages must be >= 1")
    if args.num < 1:
        raise ValueError("num must be >= 1")

    width = max(3, len(str(args.num)))
    for index in range(args.num):
        size = random.randint(args.min_size, args.max_size)
        nr_packages = random.randint(1, args.max_nr_packages)
        seq_name = f"{index + 1:0{width}d}.pddl"
        generate_single_instance(domain_file, size, nr_packages, out_dir, index, output_name=seq_name)


if __name__ == "__main__":
    main()


