#!/usr/bin/env python3
"""
Validate solutions produced by classical solvers.

Usage:
  # Default mode: validates all three scenarios (blocksworld, logistics, delivery)
  python validate_classical_solvers.py

  # Custom mode: validate specific scenario
  python validate_classical_solvers.py \
    --domain logistics/domain.pddl \
    --problems_dir logistics/training_problems3 \
    --solutions_dir logistics/training_problems3
"""
import os
import re
import sys
import argparse
import subprocess
import json
from pathlib import Path
from datetime import datetime
from typing import Tuple, Dict, List, Optional, Set

# Add script directory to path for imports
sys.path.insert(0, str(Path(__file__).parent))
from utils.validation import classify_result


def validate_solution(domain_file: str, problem_file: str, solution_file: str, timeout_sec: int = 30) -> Tuple[bool, str, Dict]:
    """Run Validate to check if solution is valid for the problem and domain."""
    execution_info = {
        "stdout": "",
        "stderr": "",
        "returncode": None,
        "timeout": False,
        "exception": None
    }
    
    try:
        cmd = f"Validate -v {domain_file} {problem_file} {solution_file}"
        execution_info["command"] = cmd
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=timeout_sec)
        
        execution_info["returncode"] = result.returncode
        execution_info["stdout"] = result.stdout if result.stdout else ""
        execution_info["stderr"] = result.stderr if result.stderr else ""
        
        if result.returncode == 0:
            output = result.stdout.lower()
            if "plan valid" in output or "plan successfully executed" in output:
                return True, "Plan valid", execution_info
            return False, (result.stdout if result.stdout else "Validation failed"), execution_info
        return False, (result.stderr if result.stderr else "Validation error"), execution_info
    except subprocess.TimeoutExpired:
        execution_info["timeout"] = True
        return False, "Validation timeout", execution_info
    except Exception as e:
        execution_info["exception"] = str(e)
        return False, f"Validation exception: {e}", execution_info


SOMETIME_BEFORE_RE = re.compile(r"\(\s*sometime-before\s*\(\s*at\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*\(\s*at\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*\)", re.IGNORECASE)
ALWAYS_NOT_AT_RE = re.compile(r"\(\s*always\s*\(\s*not\s*\(\s*at\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*\)\s*\)\s*\)", re.IGNORECASE)
DEBARK_RE = re.compile(r"^\(\s*debark\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*$", re.IGNORECASE)
BOARD_RE = re.compile(r"^\(\s*board\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*$", re.IGNORECASE)
SAIL_RE = re.compile(r"^\(\s*sail\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*$", re.IGNORECASE)
INIT_AT_RE = re.compile(r"\(\s*at\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)", re.IGNORECASE)


def _extract_sometime_before(problem_text: str) -> List[Tuple[Tuple[str, str], Tuple[str, str]]]:
    constraints: List[Tuple[Tuple[str, str], Tuple[str, str]]] = []
    for m in SOMETIME_BEFORE_RE.finditer(problem_text):
        a_car, a_loc, b_car, b_loc = m.group(1), m.group(2), m.group(3), m.group(4)
        constraints.append(((a_car, a_loc), (b_car, b_loc)))
    return constraints


def _extract_always_not_at(problem_text: str) -> List[Tuple[str, str]]:
    forbids: List[Tuple[str, str]] = []
    for m in ALWAYS_NOT_AT_RE.finditer(problem_text):
        car, loc = m.group(1), m.group(2)
        forbids.append((car, loc))
    return forbids


def _parse_debark_order(soln_path: str) -> List[Tuple[str, str]]:
    order: List[Tuple[str, str]] = []
    seen: Set[Tuple[str, str]] = set()
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


def _violates_sometime_before(plan_order: List[Tuple[str, str]], constraints: List[Tuple[Tuple[str, str], Tuple[str, str]]]) -> bool:
    positions: Dict[Tuple[str, str], int] = {pair: idx for idx, pair in enumerate(plan_order)}
    for (a, b) in constraints:
        if a in positions and b in positions:
            if positions[b] <= positions[a]:
                return True
    return False


def _extract_init_at(problem_text: str) -> Dict[str, Optional[str]]:
    """Extract initial at(car, loc) facts from the (:init ...) block.

    Returns a mapping from car -> location (or None if unknown).
    """
    lines = problem_text.splitlines()
    collecting = False
    depth = 0
    init_lines: List[str] = []
    for line in lines:
        if not collecting and "(:init" in line:
            collecting = True
            # start counting parentheses from this line
            depth = 0
        if collecting:
            init_lines.append(line)
            depth += line.count("(") - line.count(")")
            if depth <= 0:
                break
    car_to_location: Dict[str, Optional[str]] = {}
    for l in init_lines:
        for m in INIT_AT_RE.finditer(l):
            car, loc = m.group(1), m.group(2)
            car_to_location[car] = loc
    return car_to_location


def _simulate_at_holds(problem_text: str, soln_path: str) -> Tuple[Dict[Tuple[str, str], int], Dict[Tuple[str, str], int]]:
    """Simulate plan to compute when at(car, loc) holds across state indices.

    Returns two dicts:
      - earliest_holds[(car, loc)] = smallest state index where it holds
      - latest_holds[(car, loc)] = largest state index where it holds

    State index 0 corresponds to the initial state. After each action we advance
    the index by 1 and record resulting holdings.
    """
    car_to_location = _extract_init_at(problem_text)
    # Ensure we also track cars that appear only in the plan
    cars_seen: Set[str] = set(car_to_location.keys())

    # Helper to record holdings for current state index
    earliest: Dict[Tuple[str, str], int] = {}
    latest: Dict[Tuple[str, str], int] = {}

    def record_state(state_index: int):
        for car, loc in car_to_location.items():
            if loc is None:
                continue
            key = (car, loc)
            if key not in earliest:
                earliest[key] = state_index
            latest[key] = state_index

    # Record initial state
    current_index = 0
    record_state(current_index)

    # Step through actions in solution
    try:
        with open(soln_path, "r", encoding="utf-8") as f:
            for raw_line in f:
                line = raw_line.strip()
                if not line:
                    continue
                # Board: car leaves current location (no longer at any location)
                m = BOARD_RE.match(line)
                if m:
                    car, _loc = m.group(1), m.group(2)
                    cars_seen.add(car)
                    # Car is no longer at any location while onboard
                    if car in car_to_location:
                        car_to_location[car] = None
                    else:
                        car_to_location[car] = None
                    current_index += 1
                    record_state(current_index)
                    continue
                # Debark: car is now at the given location
                m = DEBARK_RE.match(line)
                if m:
                    car, loc = m.group(1), m.group(2)
                    cars_seen.add(car)
                    car_to_location[car] = loc
                    current_index += 1
                    record_state(current_index)
                    continue
                # Sail does not change at(car, loc) facts for cars already debarked/boarded
                if SAIL_RE.match(line):
                    current_index += 1
                    record_state(current_index)
                    continue
                # Unknown action: still advance state index to keep alignment with validator's step count
                current_index += 1
                record_state(current_index)
    except FileNotFoundError:
        # If solution missing, return initial holdings only
        pass

    return earliest, latest


def _violates_sometime_before_intervals(earliest: Dict[Tuple[str, str], int], latest: Dict[Tuple[str, str], int], constraints: List[Tuple[Tuple[str, str], Tuple[str, str]]]) -> bool:
    """Check sometime-before using non-strict interval semantics.

    Interprets the constraint as: if B ever holds, then there must exist a time
    point t1 where A holds and a time point t2 where B holds with t1 <= t2.
    If B never holds, the constraint is vacuously satisfied.
    """
    for (a, b) in constraints:
        a_key = (a[0], a[1])
        b_key = (b[0], b[1])
        if b_key not in earliest:
            # B never holds -> vacuously satisfied
            continue
        if a_key not in earliest:
            return True
        # Need some time where B holds not earlier than earliest A
        if latest.get(b_key, -1) < earliest[a_key]:
            return True
    return False


def _violates_always_not_at_intervals(earliest: Dict[Tuple[str, str], int], forbids: List[Tuple[str, str]]) -> bool:
    """Check always-not using simulated holdings: forbidden at(car, loc) must never hold."""
    if not forbids:
        return False
    for pair in forbids:
        if pair in earliest:
            return True
    return False

def _violates_always_not_at(plan_order: List[Tuple[str, str]], forbids: List[Tuple[str, str]]) -> bool:
    if not forbids:
        return False
    forbidden = set(forbids)
    for step in plan_order:
        if step in forbidden:
            return True
    return False


def enforce_pddl3_constraints_if_present(problem_text: str, soln_path: str) -> Tuple[bool, Optional[str]]:
    # Quick exit if no constraints block
    if "(:constraints" not in problem_text:
        return True, None
    # Simulate plan to compute when at(car, loc) holds; use interval semantics
    earliest, latest = _simulate_at_holds(problem_text, soln_path)
    sb = _extract_sometime_before(problem_text)
    forbids = _extract_always_not_at(problem_text)

    if _violates_sometime_before_intervals(earliest, latest, sb):
        return False, "Violates PDDL3 sometime-before constraint"
    if _violates_always_not_at_intervals(earliest, forbids):
        return False, "Violates PDDL3 always-not positional constraint"
    return True, None


def main():
    parser = argparse.ArgumentParser(description="Validate solutions in a folder with Validate")
    parser.add_argument("--domain", type=str, help="Path to domain.pddl")
    parser.add_argument("--problems_dir", type=str, help="Directory containing problem .pddl files")
    parser.add_argument("--solutions_dir", type=str, help="Directory containing solution .soln files")
    parser.add_argument("--timeout", type=int, default=30, help="Validate timeout in seconds")
    parser.add_argument(
        "--output",
        type=str,
        help=(
            "Output JSON file path. In default multi-scenario mode, the scenario name will be appended "
            "before the extension to avoid overwriting, unless you include {scenario} in the filename."
        ),
    )
    args = parser.parse_args()

    # Define default scenarios if no arguments provided
    default_scenarios = ["blocksworld", "logistics", "delivery"]
    
    # If no arguments provided, use default scenarios
    if not any([args.domain, args.problems_dir, args.solutions_dir]):
        print("No arguments provided, using default scenarios:")
        for scenario in default_scenarios:
            print(f"  - {scenario}")
        print()
        
        # Process each scenario
        for scenario in default_scenarios:
            validate_scenario(scenario, args.timeout, args.output)
        return
    
    # Original single scenario validation if arguments provided
    if not all([args.domain, args.problems_dir, args.solutions_dir]):
        print("Error: When providing arguments, all three (--domain, --problems_dir, --solutions_dir) are required")
        return
        
    domain_path = Path(args.domain)
    problems_path = Path(args.problems_dir)
    solutions_path = Path(args.solutions_dir)
    
    validate_single_scenario(domain_path, problems_path, solutions_path, args.timeout, None, args.output)


def validate_scenario(scenario_name: str, timeout_sec: int):
    """Validate a single scenario using default paths."""
    print(f"{'='*60}")
    print(f"Validating scenario: {scenario_name}")
    print(f"{'='*60}")
    
    # Construct paths
    scenario_dir = Path(scenario_name)
    domain_path = scenario_dir / "domain.pddl"
    problems_path = scenario_dir / "training_problems3"
    solutions_path = scenario_dir / "training_problems3"
    
    validate_single_scenario(domain_path, problems_path, solutions_path, timeout_sec, scenario_name, output_template)
    print()


def validate_single_scenario(
    domain_path: Path,
    problems_path: Path,
    solutions_path: Path,
    timeout_sec: int,
    scenario_name: str = None,
    output_template: Optional[str] = None,
):
    """Validate solutions for a single scenario."""
    if not domain_path.exists():
        print(f"Error: domain not found: {domain_path}")
        return
    if not problems_path.exists():
        print(f"Error: problems_dir not found: {problems_path}")
        return
    if not solutions_path.exists():
        print(f"Error: solutions_dir not found: {solutions_path}")
        return

    # Iterate over problem files (not solutions) to handle different problem/solution directories
    problem_files = sorted([p for p in problems_path.glob("*.pddl")])
    if not problem_files:
        print(f"No .pddl files found in {problems_path}")
        return

    print(f"Domain: {domain_path}")
    print(f"Problems dir: {problems_path}")
    print(f"Solutions dir: {solutions_path}")
    print(f"Found {len(problem_files)} problem files")

    valid = 0
    invalid = 0
    missing = 0

    # Detailed classification counters
    classification_counts = {
        "success_plans": 0,
        "plan_format_error": 0,
        "precondition_violation": 0,
        "safety_constraints_violation": 0,
        "goal_not_satisfied": 0,
        "missing_solution": 0,
        "pddl3_constraint_violation": 0,  # Local PDDL3 check (sometime-before, always-not)
    }

    # Build command string for documentation
    command_str = f"python3 validate_classical_solvers.py --domain {domain_path} --problems_dir {problems_path} --solutions_dir {solutions_path} --timeout {timeout_sec}"

    # Data structure to store validation results (summary first, then metadata, then results)
    validation_results = {
        "summary": {},  # Will be filled after validation
        "command": command_str,
        "metadata": {
            "timestamp": datetime.now().isoformat(),
            "scenario_name": scenario_name or "custom",
            "domain_file": str(domain_path),
            "problems_directory": str(problems_path),
            "solutions_directory": str(solutions_path),
            "timeout_seconds": timeout_sec,
            "total_problems": len(problem_files)
        },
        "results": []
    }

    for i, prob in enumerate(problem_files, 1):
        stem = prob.stem
        solution_file = solutions_path / f"{stem}.soln"
        print(f"[{i}/{len(problem_files)}] {prob.name}")

        result_entry = {
            "problem_file": prob.name,
            "solution_file": f"{stem}.soln",
            "problem_path": str(prob),
            "solution_path": str(solution_file)
        }

        if not solution_file.exists():
            print(f"  ✗ Solution not found: {solution_file.name}")
            missing += 1
            classification_counts["missing_solution"] += 1
            result_entry["status"] = "missing_solution"
            result_entry["classification"] = "missing_solution"
            result_entry["valid"] = False
            result_entry["message"] = f"Solution file not found: {solution_file.name}"
        else:
            ok, msg, execution_info = validate_solution(str(domain_path), str(prob), str(solution_file), timeout_sec=timeout_sec)

            # Classify the result using validation stdout
            stdout_text = execution_info.get("stdout", "")
            classification = classify_result(stdout_text)

            # Enforce PDDL3 constraints locally if present (covers sometime-before and always-not at debark states)
            pddl3_violated = False
            try:
                with open(prob, 'r', encoding='utf-8') as pf:
                    problem_text = pf.read()
                pddl3_ok, pddl3_msg = enforce_pddl3_constraints_if_present(problem_text, str(solution_file))
                if ok and not pddl3_ok:
                    ok = False
                    msg = pddl3_msg or "PDDL3 constraints violated"
                    pddl3_violated = True
                    classification = "pddl3_constraint_violation"
            except Exception as _e:
                # If local enforcement fails, do not mask external validator result
                pass

            result_entry["valid"] = ok
            result_entry["message"] = msg
            result_entry["classification"] = classification
            result_entry["execution_info"] = execution_info

            if ok:
                print("  ✓ Plan valid")
                valid += 1
                result_entry["status"] = "valid"
                classification_counts["success_plans"] += 1
            else:
                print(f"  ✗ Invalid: {msg} [{classification}]")
                invalid += 1
                result_entry["status"] = "invalid"
                # Update classification counts
                if pddl3_violated:
                    classification_counts["pddl3_constraint_violation"] += 1
                elif classification in classification_counts:
                    classification_counts[classification] += 1
                else:
                    classification_counts["plan_format_error"] += 1

        validation_results["results"].append(result_entry)

    total = len(problem_files)

    # Update summary statistics (placed at beginning of JSON)
    validation_results["summary"] = {
        "total_problems": total,
        "valid": valid,
        "invalid": invalid,
        "missing_solutions": missing,
        "success_rate": (valid / total * 100) if total > 0 else 0.0,
        "classification_breakdown": classification_counts
    }
    
    # Save results to JSON file
    if output_template:
        if scenario_name:
            if "{scenario}" in output_template:
                json_output_file = output_template.format(scenario=scenario_name)
            else:
                p = Path(output_template)
                if p.suffix:
                    json_output_file = str(p.with_name(f"{p.stem}_{scenario_name}{p.suffix}"))
                else:
                    json_output_file = f"{output_template}_{scenario_name}.json"
        else:
            json_output_file = output_template
    else:
        if scenario_name:
            json_output_file = f"{scenario_name}_validation_results.json"
        else:
            json_output_file = f"{domain_path.parent.name}_{domain_path.stem}_validation_results.json"
    
    try:
        with open(json_output_file, 'w', encoding='utf-8') as f:
            json.dump(validation_results, f, indent=2, ensure_ascii=False)
        print(f"Results saved to {json_output_file}")
    except Exception as e:
        print(f"Error saving JSON results: {e}")
    
    print("-" * 50)
    print(f"Total problems: {total}")
    print(f"Valid: {valid}")
    print(f"Invalid: {invalid}")
    print(f"Missing solutions: {missing}")
    if total > 0:
        print(f"Success rate: {valid / total * 100:.1f}%")

    # Print detailed classification breakdown
    print("\nClassification breakdown:")
    for cls, count in sorted(classification_counts.items()):
        if count > 0:
            pct = count / total * 100 if total > 0 else 0
            print(f"  {cls}: {count} ({pct:.1f}%)")


if __name__ == "__main__":
    main()


