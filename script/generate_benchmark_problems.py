#!/usr/bin/env python3
"""
Generate benchmark problems for various planning scenarios.
"""
from __future__ import annotations

import shutil
import subprocess
import sys
import tempfile
from math import ceil
from pathlib import Path
from typing import Callable, Dict, List, Optional, Tuple

from benchmark_common import (
    DEFAULT_INSTANCES_PER_PARAMETER,
    PROJECT_ROOT,
    SCENARIOS,
    extract_parameter_value,
    run_command,
)

# Scenario directories
BLOCKSWORLD_DIR = PROJECT_ROOT / "blocksworld"
FERRY_DIR = PROJECT_ROOT / "ferry"
GRIPPERS_DIR = PROJECT_ROOT / "grippers"
DELIVERY_DIR = PROJECT_ROOT / "delivery"
SPANNER_DIR = PROJECT_ROOT / "spanner"
GRID_DIR = PROJECT_ROOT / "grid"

# State flags for scenario readiness
_blocksworld_ready = False
_ferry_ready = False
_grippers_ready = False
_delivery_ready = False


def write_problem_file(dest_dir: Path, filename: str, content: str) -> Path:
    """Write problem content to file."""
    dest_dir.mkdir(parents=True, exist_ok=True)
    path = dest_dir / filename
    path.write_text(content, encoding="utf-8")
    return path


def ensure_blocksworld_ready() -> None:
    """Ensure blocksworld generator is ready."""
    global _blocksworld_ready
    if _blocksworld_ready:
        return
    bwstates = BLOCKSWORLD_DIR / "bwstates.1" / "bwstates"
    if not bwstates.exists():
        run_command(["make"], cwd=BLOCKSWORLD_DIR / "bwstates.1")
    two_pddl = BLOCKSWORLD_DIR / "3ops" / "2pddl" / "2pddl"
    if not two_pddl.exists():
        run_command(["make"], cwd=BLOCKSWORLD_DIR / "3ops" / "2pddl")
    _blocksworld_ready = True


def ensure_ferry_ready() -> None:
    """Ensure ferry generator is ready."""
    global _ferry_ready
    if _ferry_ready:
        return
    ferry_bin = FERRY_DIR / "ferry"
    if not ferry_bin.exists():
        run_command(["make"], cwd=FERRY_DIR)
    _ferry_ready = True


def ensure_grippers_ready() -> None:
    """Ensure grippers generator is ready."""
    global _grippers_ready
    if _grippers_ready:
        return
    binary = GRIPPERS_DIR / "grippers"
    if not binary.exists():
        run_command(["make", "grippers"], cwd=GRIPPERS_DIR)
    _grippers_ready = True


def ensure_delivery_ready() -> None:
    """Ensure delivery generator is ready."""
    global _delivery_ready
    if _delivery_ready:
        return
    script = DELIVERY_DIR / "generate_problems.py"
    if not script.exists():
        raise FileNotFoundError(f"Delivery generator script not found: {script}")
    _delivery_ready = True


def generate_blocksworld(parameter: int, instance_idx: int, dest_dir: Path) -> Path:
    """Generate a blocksworld problem."""
    ensure_blocksworld_ready()
    ops = 3
    seed = parameter * 1000 + (instance_idx + 1)
    script = BLOCKSWORLD_DIR / "blocksworld"
    result = run_command([str(script), str(ops), str(parameter), str(seed)], cwd=BLOCKSWORLD_DIR)
    filename = f"bw_ops{ops}_n{parameter:02d}_seed{seed}.pddl"
    return write_problem_file(dest_dir, filename, result.stdout)


def generate_ferry(parameter: int, instance_idx: int, dest_dir: Path) -> Path:
    """Generate a ferry problem."""
    ensure_ferry_ready()
    locations = parameter
    cars = max(2, min(locations, locations // 2 + 1))
    seed = parameter * 1000 + (instance_idx + 1)
    ferry_bin = FERRY_DIR / "ferry"
    result = run_command(
        [str(ferry_bin), "-l", str(locations), "-c", str(cars), "-s", str(seed)],
        cwd=FERRY_DIR,
    )
    filename = f"ferry-l{locations:02d}-c{cars:02d}-s{seed}.pddl"
    return write_problem_file(dest_dir, filename, result.stdout)


def generate_grippers(parameter: int, instance_idx: int, dest_dir: Path) -> Path:
    """Generate a grippers problem."""
    ensure_grippers_ready()
    objects = max(1, parameter)
    robots = min(3, max(1, objects // 10 + 1))
    rooms = max(objects + 2, robots + 2)
    seed = parameter * 1000 + (instance_idx + 1)
    binary = GRIPPERS_DIR / "grippers"
    result = run_command(
        [
            str(binary),
            "-n",
            str(robots),
            "-r",
            str(rooms),
            "-o",
            str(objects),
            "-s",
            str(seed),
        ],
        cwd=GRIPPERS_DIR,
    )
    filename = f"grippers-n{robots}-r{rooms}-o{objects}-s{seed}.pddl"
    return write_problem_file(dest_dir, filename, result.stdout)


def generate_grid(parameter: int, instance_idx: int, dest_dir: Path) -> Path:
    """Generate a grid problem."""
    width = max(3, parameter)
    height = max(3, parameter)
    shapes = max(2, min(6, parameter // 5 + 1))
    keys = max(shapes * 2, shapes + 1)
    locks = max(shapes * 2, shapes + 1)
    total_positions = width * height
    if locks >= total_positions:
        locks = total_positions - 1
    seed = parameter * 1000 + (instance_idx + 1)
    script = GRID_DIR / "generate.py"
    cmd = [
        sys.executable,
        str(script),
        str(width),
        str(height),
        "--shapes",
        str(shapes),
        "--keys",
        str(keys),
        "--locks",
        str(locks),
        "--seed",
        str(seed),
    ]
    result = run_command(cmd, cwd=GRID_DIR)
    filename = f"grid_x{width}_y{height}_sh{shapes}_k{keys}_l{locks}_s{seed}.pddl"
    return write_problem_file(dest_dir, filename, result.stdout)


def generate_delivery(parameter: int, instance_idx: int, dest_dir: Path) -> Path:
    """Generate a delivery problem."""
    ensure_delivery_ready()
    grid_size = max(3, parameter)
    max_packages = max(1, min(8, grid_size // 2))
    seed = parameter * 1000 + (instance_idx + 1)
    
    script = DELIVERY_DIR / "generate_problems.py"
    domain_file = DELIVERY_DIR / "domain.pddl"
    if not domain_file.exists():
        raise FileNotFoundError(f"Domain file not found: {domain_file}")
    
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_output = Path(temp_dir) / "output"
        
        cmd = [
            sys.executable,
            str(script),
            "--domain", str(domain_file),
            "--output", str(temp_output),
            "--num", "1",
            "--min_size", str(grid_size),
            "--max_size", str(grid_size),
            "--max_nr_packages", str(max_packages),
            "--seed", str(seed),
        ]
        run_command(cmd, cwd=DELIVERY_DIR)
        
        pddl_files = list(temp_output.glob("*.pddl"))
        if not pddl_files:
            raise FileNotFoundError(f"Failed to generate delivery problem in {temp_output}")
        
        generated_file = pddl_files[0]
        problem_content = generated_file.read_text(encoding="utf-8")
        package_count = problem_content.count(" - package")
        
        dest_dir.mkdir(parents=True, exist_ok=True)
        filename = f"delivery_size{grid_size}_packages{package_count}_seed{seed}.pddl"
        dest_file = dest_dir / filename
        shutil.copy(generated_file, dest_file)
        
        return dest_file


def generate_spanner(parameter: int, instance_idx: int, dest_dir: Path) -> Path:
    """Generate a spanner problem."""
    spanners = max(2, parameter)
    nuts = max(1, min(spanners, spanners - 1))
    locations = max(spanners + 2, spanners + spanners // 2)
    seed = parameter * 1000 + (instance_idx + 1)
    script = SPANNER_DIR / "spanner-generator.py"
    cmd = [
        sys.executable,
        str(script),
        str(spanners),
        str(nuts),
        str(locations),
        "--seed",
        str(seed),
        "--problem-name",
        f"spanner-{spanners}-{nuts}-{locations}-{seed}",
    ]
    result = run_command(cmd, cwd=SPANNER_DIR)
    filename = f"spanner-s{spanners}-n{nuts}-l{locations}-s{seed}.pddl"
    return write_problem_file(dest_dir, filename, result.stdout)


SCENARIO_PARAMETER_VALUES: Dict[str, List[int]] = {
    "blocksworld": list(range(3, 51)),
    "ferry": list(range(3, 51)),
    "grippers": list(range(3, 51)),
    "grid": list(range(3, 51)),
    "delivery": list(range(3, 51)),
    "spanner": list(range(3, 51)),
}

SCENARIO_GENERATORS: Dict[str, Callable[[int, int, Path], Path]] = {
    "blocksworld": generate_blocksworld,
    "ferry": generate_ferry,
    "grippers": generate_grippers,
    "grid": generate_grid,
    "delivery": generate_delivery,
    "spanner": generate_spanner,
}


def generate_complex_problems(
    benchmark_dir: Path,
    problems_per_scenario: int,
    instances_per_parameter: int,
    scenarios: Optional[Tuple[str, ...]] = None,
) -> Dict[str, List[Path]]:
    """Generate problems for all scenarios.
    
    Args:
        benchmark_dir: Directory to store generated problems
        problems_per_scenario: Maximum number of problems per scenario (0 means no limit)
        instances_per_parameter: Number of instances per parameter value
        scenarios: Optional list of scenarios to generate (default: all scenarios)
    
    Returns:
        Dictionary mapping scenario names to lists of problem file paths
    """
    generated: Dict[str, List[Path]] = {}
    benchmark_dir.mkdir(parents=True, exist_ok=True)

    scenarios_to_generate = scenarios if scenarios is not None else SCENARIOS

    for scenario in scenarios_to_generate:
        generator = SCENARIO_GENERATORS.get(scenario)
        if generator is None:
            raise ValueError(f"No generator defined for scenario: {scenario}")

        parameter_values = SCENARIO_PARAMETER_VALUES.get(scenario, [])
        if not parameter_values:
            raise ValueError(f"No parameter values configured for {scenario}")

        if instances_per_parameter <= 0:
            raise ValueError("--instances-per-parameter must be >= 1 for generation mode")

        if problems_per_scenario > 0:
            params_needed = ceil(problems_per_scenario / instances_per_parameter)
            parameter_values = parameter_values[:params_needed]

        dest_dir = benchmark_dir / scenario
        if dest_dir.exists():
            shutil.rmtree(dest_dir)
        dest_dir.mkdir(parents=True, exist_ok=True)

        generated_paths: List[Path] = []
        for param in parameter_values:
            for instance_idx in range(instances_per_parameter):
                path = generator(param, instance_idx, dest_dir)
                generated_paths.append(path)

        generated[scenario] = generated_paths

    return generated


def load_existing_problems(
    benchmark_dir: Path,
    instances_per_parameter: Optional[int] = None,
) -> Dict[str, List[Path]]:
    """Load existing problem files from benchmark directory.
    
    Args:
        benchmark_dir: Directory containing problem files
        instances_per_parameter: If specified, limit to this many instances per parameter value.
                                If None, load all problems.
    
    Returns:
        Dictionary mapping scenario names to lists of problem file paths
    """
    generated: Dict[str, List[Path]] = {}
    benchmark_dir.mkdir(parents=True, exist_ok=True)

    for scenario in SCENARIOS:
        scenario_dir = benchmark_dir / scenario
        if not scenario_dir.exists():
            print(f"Warning: Scenario directory not found: {scenario_dir}", flush=True)
            generated[scenario] = []
            continue

        # Find all .pddl files in the scenario directory (excluding subdirectories)
        pddl_files = [
            f for f in scenario_dir.iterdir()
            if f.is_file() and f.suffix == ".pddl"
        ]
        
        pddl_files.sort(key=lambda p: p.name)
        
        if not pddl_files:
            print(f"Warning: No problem files found in {scenario_dir}", flush=True)
            generated[scenario] = []
            continue
        
        # If instances_per_parameter is specified, filter to limit instances per parameter
        if instances_per_parameter is not None and instances_per_parameter > 0:
            # Group problems by parameter value
            param_groups: Dict[int, List[Path]] = {}
            for problem_path in pddl_files:
                param = extract_parameter_value(scenario, problem_path)
                if param is not None:
                    if param not in param_groups:
                        param_groups[param] = []
                    param_groups[param].append(problem_path)
                else:
                    # If parameter cannot be extracted, put in special group with key -1
                    if -1 not in param_groups:
                        param_groups[-1] = []
                    param_groups[-1].append(problem_path)
            
            # For each parameter value, keep only the first instances_per_parameter problems
            filtered_files: List[Path] = []
            for param in sorted(param_groups.keys()):
                if param == -1:
                    # For problems without parameter, keep all
                    filtered_files.extend(param_groups[param])
                else:
                    # Keep only the first instances_per_parameter problems for this parameter
                    filtered_files.extend(param_groups[param][:instances_per_parameter])
            
            filtered_files.sort(key=lambda p: p.name)
            generated[scenario] = filtered_files
            print(f"Loaded {len(filtered_files)} existing problems for {scenario} (limited to {instances_per_parameter} per parameter)", flush=True)
        else:
            # Load all problems
            generated[scenario] = pddl_files
            print(f"Loaded {len(pddl_files)} existing problems for {scenario}", flush=True)

    total_problems = sum(len(problems) for problems in generated.values())
    print(f"Total loaded problems: {total_problems}", flush=True)
    return generated


def filter_one_per_parameter(
    generated: Dict[str, List[Path]],
) -> Dict[str, List[Path]]:
    """Filter problems to keep only one problem per parameter value for each scenario.
    
    Args:
        generated: Dictionary mapping scenario names to lists of problem paths
    
    Returns:
        Filtered dictionary with one problem per parameter value
    """
    filtered: Dict[str, List[Path]] = {}
    
    for scenario, problem_paths in generated.items():
        # Group problems by parameter value
        param_groups: Dict[int, List[Path]] = {}
        for problem_path in problem_paths:
            param = extract_parameter_value(scenario, problem_path)
            if param is not None:
                if param not in param_groups:
                    param_groups[param] = []
                param_groups[param].append(problem_path)
            else:
                # If parameter cannot be extracted, keep the problem
                # (put it in a special group with key -1)
                if -1 not in param_groups:
                    param_groups[-1] = []
                param_groups[-1].append(problem_path)
        
        # Keep only the first problem for each parameter value
        filtered_paths: List[Path] = []
        for param in sorted(param_groups.keys()):
            if param == -1:
                # For problems without parameter, keep all
                filtered_paths.extend(param_groups[param])
            else:
                # For each parameter value, keep only the first problem
                filtered_paths.append(param_groups[param][0])
        
        filtered[scenario] = filtered_paths
    
    return filtered


def main():
    """Command-line interface for problem generation."""
    import argparse
    
    parser = argparse.ArgumentParser(description="Generate benchmark problems.")
    parser.add_argument(
        "--benchmark-dir",
        type=Path,
        default=PROJECT_ROOT / "benchmark_problems",
        help="Directory to store generated benchmark problems.",
    )
    parser.add_argument(
        "--problems-per-scenario",
        type=int,
        default=0,
        help="Maximum number of problems per scenario (0 means no limit).",
    )
    parser.add_argument(
        "--instances-per-parameter",
        type=int,
        default=DEFAULT_INSTANCES_PER_PARAMETER,
        help="Number of instances per parameter value.",
    )
    parser.add_argument(
        "--scenarios",
        nargs="*",
        help="Specific scenarios to generate (default: all scenarios).",
    )
    
    args = parser.parse_args()
    
    # Filter scenarios if specified
    scenarios_to_generate = None
    if args.scenarios:
        scenario_set = {s.lower() for s in args.scenarios}
        scenarios_to_generate = tuple(s for s in SCENARIOS if s.lower() in scenario_set)
        if not scenarios_to_generate:
            print(f"Error: No valid scenarios found. Available: {SCENARIOS}", file=sys.stderr)
            sys.exit(1)
    
    generated = generate_complex_problems(
        args.benchmark_dir,
        args.problems_per_scenario,
        args.instances_per_parameter,
        scenarios=scenarios_to_generate,
    )
    total = sum(len(problems) for problems in generated.values())
    print(f"\nSuccessfully generated {total} problems across {len(generated)} scenarios.")
    for scenario, problems in generated.items():
        print(f"  - {scenario}: {len(problems)} problems")


if __name__ == "__main__":
    main()

