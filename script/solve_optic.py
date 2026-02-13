#!/usr/bin/env python3
"""
Solve benchmark problems using OPTIC solver.
"""
from __future__ import annotations

import csv
import json
import multiprocessing
import os
import shutil
import subprocess
import sys
import time
from concurrent.futures import ProcessPoolExecutor, as_completed
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple

from benchmark_common import (
    DOMAIN_PATHS,
    OPTIC,
    OPTIC_RESULTS_DIRNAME,
    VALIDATOR,
    WORKSPACE_ROOT,
    SolverOutcome,
    cache_dict_to_outcome,
    outcome_to_cache_dict,
    save_solver_cache,
    to_text,
    workspace_str_to_path,
)


def convert_optic_output_to_strips(plan_path: Path) -> bool:
    """Convert OPTIC temporal output to STRIPS format for VAL validation.

    OPTIC outputs plans like:
        Number of literals: 16
        ...
        0.000: (pickup b3)  [0.001]
        0.001: (stack b3 b2)  [0.001]

    VAL expects STRIPS format:
        (pickup b3)
        (stack b3 b2)

    Args:
        plan_path: Path to the plan file to convert (modified in-place)

    Returns:
        True if conversion successful (at least one action found), False otherwise
    """
    if not plan_path.exists():
        return False

    try:
        with plan_path.open("r", encoding="utf-8") as f:
            content = f.read()

        lines = content.split('\n')
        plan_actions = []

        for line in lines:
            line = line.strip()

            # Skip empty lines and comments
            if not line or line.startswith(';'):
                continue

            # Match timestamp format: "0.000: (action args) [0.001]"
            if ':' in line and '(' in line and ')' in line:
                parts = line.split(':', 1)
                if len(parts) == 2:
                    # Check if first part is a timestamp (digits and dots)
                    timestamp_part = parts[0].strip()
                    if timestamp_part.replace('.', '').isdigit():
                        # Extract action from the rest
                        action_part = parts[1].strip()
                        # Find the action between ( and )
                        start = action_part.find('(')
                        end = action_part.find(')')
                        if start != -1 and end != -1 and end > start:
                            action = action_part[start:end+1]  # Include parentheses
                            plan_actions.append(action)

        if not plan_actions:
            return False

        # Write STRIPS format
        with plan_path.open("w", encoding="utf-8") as f:
            for action in plan_actions:
                f.write(action + "\n")

        return True
    except Exception:
        return False


def format_elapsed(outcome: SolverOutcome) -> str:
    """Format elapsed time for CSV output."""
    if outcome.status == "timeout":
        return "timeout"
    if outcome.elapsed_seconds is None:
        return ""
    return f"{outcome.elapsed_seconds:.3f}"


def load_existing_summary(benchmark_dir: Path) -> Dict[str, Set[str]]:
    """Load existing problems from optic_summary.json.
    
    Returns:
        Dictionary mapping scenario names to sets of problem names that already have OPTIC results.
    """
    summary_path = benchmark_dir / "optic_summary.json"
    existing: Dict[str, Set[str]] = {}
    
    if not summary_path.exists():
        return existing
    
    try:
        with summary_path.open("r", encoding="utf-8") as fh:
            data = json.load(fh)
        
        scenarios = data.get("scenarios", {})
        if not isinstance(scenarios, dict):
            return existing
        
        for scenario_name, scenario_data in scenarios.items():
            if not isinstance(scenario_data, dict):
                continue
            
            problems = scenario_data.get("problems", [])
            if not isinstance(problems, list):
                continue
            
            problem_set: Set[str] = set()
            for problem in problems:
                if not isinstance(problem, dict):
                    continue
                
                problem_name = problem.get("problem")
                if not problem_name:
                    continue
                
                optic_data = problem.get("optic")
                # Check if optic data exists and is not None
                if optic_data is not None and isinstance(optic_data, dict):
                    problem_set.add(problem_name)
            
            if problem_set:
                existing[scenario_name] = problem_set
                
    except Exception as exc:
        print(f"Warning: Failed to load existing summary from {summary_path}: {exc}", flush=True)
    
    return existing


def load_solved_from_summary(
    benchmark_dir: Path,
    generated: Dict[str, List[Path]],
) -> Dict[Tuple[str, str], SolverOutcome]:
    """Load solved problems from optic_summary.json and convert to SolverOutcome format.
    
    Returns:
        Dictionary mapping (scenario, problem_name) to SolverOutcome for problems that already have results.
    """
    summary_path = benchmark_dir / "optic_summary.json"
    results: Dict[Tuple[str, str], SolverOutcome] = {}
    
    if not summary_path.exists():
        return results
    
    try:
        with summary_path.open("r", encoding="utf-8") as fh:
            data = json.load(fh)
        
        scenarios = data.get("scenarios", {})
        if not isinstance(scenarios, dict):
            return results
        
        for scenario_name, scenario_data in scenarios.items():
            if not isinstance(scenario_data, dict):
                continue
            
            problems = scenario_data.get("problems", [])
            if not isinstance(problems, list):
                continue
            
            for problem in problems:
                if not isinstance(problem, dict):
                    continue
                
                problem_name = problem.get("problem")
                if not problem_name:
                    continue
                
                optic_data = problem.get("optic")
                if optic_data is None or not isinstance(optic_data, dict):
                    continue
                
                # Convert JSON data to SolverOutcome
                status = optic_data.get("status", "unknown")
                validation = optic_data.get("validation", "")
                elapsed_seconds = optic_data.get("elapsed_seconds")
                plan_path_str = optic_data.get("plan_path")
                log_path_str = optic_data.get("log_path")
                notes = optic_data.get("notes", "")
                validation_stdout = optic_data.get("validation_stdout", "")

                plan_path = workspace_str_to_path(plan_path_str) if plan_path_str else None
                log_path = workspace_str_to_path(log_path_str) if log_path_str else None

                outcome = SolverOutcome(
                    status=status,
                    validation=validation,
                    elapsed_seconds=elapsed_seconds,
                    plan_path=plan_path,
                    log_path=log_path,
                    notes=notes,
                    validation_stdout=validation_stdout,
                )
                
                results[(scenario_name, problem_name)] = outcome
                
    except Exception as exc:
        print(f"Warning: Failed to load solved problems from {summary_path}: {exc}", flush=True)
    
    return results


def run_optic_on_problem(
    domain: Path,
    problem: Path,
    plan_path: Path,
    log_path: Path,
    time_limit: float,
) -> SolverOutcome:
    """Run OPTIC on a single problem."""
    plan_path.parent.mkdir(parents=True, exist_ok=True)
    log_path.parent.mkdir(parents=True, exist_ok=True)
    for target in (plan_path, plan_path.with_suffix(".plan.invalid"), log_path):
        if target.exists():
            target.unlink()

    start = time.perf_counter()
    status = "unknown"
    stderr_output = ""
    elapsed: Optional[float] = None

    try:
        with plan_path.open("w", encoding="utf-8") as plan_file:
            proc = subprocess.run(
                [str(OPTIC), "-N", str(domain), str(problem)],
                stdout=plan_file,
                stderr=subprocess.PIPE,
                text=True,
                check=False,
                timeout=time_limit,
            )
        elapsed = time.perf_counter() - start
        stderr_output = to_text(proc.stderr)
        if proc.returncode == 0:
            status = "solved"
        else:
            status = f"error:{proc.returncode}"
            plan_path.unlink(missing_ok=True)
    except subprocess.TimeoutExpired as exc:
        elapsed = time.perf_counter() - start
        stderr_output = (to_text(getattr(exc, 'stderr', None)) or "") + "\n[TIMEOUT]"
        status = "timeout"
        plan_path.unlink(missing_ok=True)

    if stderr_output:
        with log_path.open("a", encoding="utf-8") as fh:
            fh.write(stderr_output if stderr_output.endswith("\n") else stderr_output + "\n")

    validation = ""
    notes = ""
    final_plan_path = plan_path
    val_stdout_text = ""

    if status == "solved":
        # Convert OPTIC temporal format to STRIPS format for VAL validation
        if not convert_optic_output_to_strips(plan_path):
            status = "invalid"
            validation = "invalid"
            notes = "[CONVERTER] Failed to extract plan actions from OPTIC output"
            invalid_plan = plan_path.with_suffix(".plan.invalid")
            if plan_path.exists():
                plan_path.rename(invalid_plan)
                final_plan_path = invalid_plan
        else:
            val_proc = subprocess.run(
                [str(VALIDATOR), "-v", str(domain), str(problem), str(plan_path)],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                check=False,
            )
            val_stdout_text = to_text(val_proc.stdout).strip()
            val_stderr_text = to_text(val_proc.stderr).strip()

            # Always write validation output to log
            with log_path.open("a", encoding="utf-8") as fh:
                if val_stdout_text:
                    fh.write("[VALIDATOR STDOUT]\n" + val_stdout_text + "\n")
                if val_stderr_text:
                    fh.write("[VALIDATOR STDERR]\n" + val_stderr_text + "\n")

            if val_proc.returncode == 0:
                validation = "valid"
            else:
                validation = "invalid"
                status = "invalid"
                notes = "[VALIDATOR]\n" + (val_stderr_text or val_stdout_text)
                invalid_plan = plan_path.with_suffix(".plan.invalid")
                plan_path.rename(invalid_plan)
                final_plan_path = invalid_plan

    return SolverOutcome(
        status=status,
        validation=validation,
        elapsed_seconds=elapsed,
        plan_path=final_plan_path if final_plan_path.exists() else None,
        log_path=log_path if log_path.exists() else None,
        notes=notes,
        validation_stdout=val_stdout_text,
    )


def _solve_single_problem_worker(args_tuple: Tuple[str, str, str, str, str, str, float]) -> Tuple[str, str, Dict[str, Any]]:
    """Worker function for parallel solving.
    
    Args:
        args_tuple: (scenario, problem_name, domain_path, problem_path, plan_path, log_path, time_limit)
    
    Returns:
        Tuple of (scenario, problem_name, outcome_dict) where outcome_dict can be converted to SolverOutcome
    """
    # Import here to avoid issues with multiprocessing
    import time
    from pathlib import Path
    from benchmark_common import OPTIC, VALIDATOR, to_text
    
    scenario, problem_name, domain_path_str, problem_path_str, plan_path_str, log_path_str, time_limit = args_tuple
    
    domain = Path(domain_path_str)
    problem = Path(problem_path_str)
    plan_path = Path(plan_path_str)
    log_path = Path(log_path_str)
    
    plan_path.parent.mkdir(parents=True, exist_ok=True)
    log_path.parent.mkdir(parents=True, exist_ok=True)
    for target in (plan_path, plan_path.with_suffix(".plan.invalid"), log_path):
        if target.exists():
            target.unlink()
    
    start = time.perf_counter()
    status = "unknown"
    stderr_output = ""
    elapsed: Optional[float] = None
    
    try:
        with plan_path.open("w", encoding="utf-8") as plan_file:
            proc = subprocess.run(
                [str(OPTIC), "-N", str(domain), str(problem)],
                stdout=plan_file,
                stderr=subprocess.PIPE,
                text=True,
                check=False,
                timeout=time_limit,
            )
        elapsed = time.perf_counter() - start
        stderr_output = to_text(proc.stderr)
        if proc.returncode == 0:
            status = "solved"
        else:
            status = f"error:{proc.returncode}"
            plan_path.unlink(missing_ok=True)
    except subprocess.TimeoutExpired:
        elapsed = time.perf_counter() - start
        stderr_output = "\n[TIMEOUT]"
        status = "timeout"
        plan_path.unlink(missing_ok=True)
    
    if stderr_output:
        with log_path.open("a", encoding="utf-8") as fh:
            fh.write(stderr_output if stderr_output.endswith("\n") else stderr_output + "\n")
    
    validation = ""
    notes = ""
    final_plan_path = plan_path
    val_stdout_text = ""

    if status == "solved":
        # Convert OPTIC temporal format to STRIPS format for VAL validation
        # (inline conversion to avoid multiprocessing import issues)
        conversion_ok = False
        try:
            with plan_path.open("r", encoding="utf-8") as f:
                content = f.read()
            lines = content.split('\n')
            plan_actions = []
            for line in lines:
                line = line.strip()
                if not line or line.startswith(';'):
                    continue
                if ':' in line and '(' in line and ')' in line:
                    parts = line.split(':', 1)
                    if len(parts) == 2:
                        timestamp_part = parts[0].strip()
                        if timestamp_part.replace('.', '').isdigit():
                            action_part = parts[1].strip()
                            start = action_part.find('(')
                            end = action_part.find(')')
                            if start != -1 and end != -1 and end > start:
                                action = action_part[start:end+1]
                                plan_actions.append(action)
            if plan_actions:
                with plan_path.open("w", encoding="utf-8") as f:
                    for action in plan_actions:
                        f.write(action + "\n")
                conversion_ok = True
        except Exception:
            pass

        if not conversion_ok:
            status = "invalid"
            validation = "invalid"
            notes = "[CONVERTER] Failed to extract plan actions from OPTIC output"
            invalid_plan = plan_path.with_suffix(".plan.invalid")
            if plan_path.exists():
                plan_path.rename(invalid_plan)
                final_plan_path = invalid_plan
        else:
            val_proc = subprocess.run(
                [str(VALIDATOR), "-v", str(domain), str(problem), str(plan_path)],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                check=False,
            )
            val_stdout_text = to_text(val_proc.stdout).strip()
            val_stderr_text = to_text(val_proc.stderr).strip()

            # Always write validation output to log
            with log_path.open("a", encoding="utf-8") as fh:
                if val_stdout_text:
                    fh.write("[VALIDATOR STDOUT]\n" + val_stdout_text + "\n")
                if val_stderr_text:
                    fh.write("[VALIDATOR STDERR]\n" + val_stderr_text + "\n")

            if val_proc.returncode == 0:
                validation = "valid"
            else:
                validation = "invalid"
                status = "invalid"
                notes = "[VALIDATOR]\n" + (val_stderr_text or val_stdout_text)
                invalid_plan = plan_path.with_suffix(".plan.invalid")
                plan_path.rename(invalid_plan)
                final_plan_path = invalid_plan

    # Return serializable data
    outcome_dict = {
        "status": status,
        "validation": validation,
        "elapsed_seconds": elapsed,
        "plan_path": str(final_plan_path) if final_plan_path.exists() else None,
        "log_path": str(log_path) if log_path.exists() else None,
        "notes": notes,
        "validation_stdout": val_stdout_text,
    }
    
    return (scenario, problem_name, outcome_dict)


def solve_with_optic(
    benchmark_dir: Path,
    generated: Dict[str, List[Path]],
    time_limit: float,
    incremental_write: bool = True,
    results_csv: Optional[Path] = None,
    skip_solved: bool = False,
    cache: Optional[Dict[str, Dict[str, Any]]] = None,
    cache_path: Optional[Path] = None,
    check_summary: bool = True,
    num_workers: Optional[int] = None,
) -> Dict[Tuple[str, str], SolverOutcome]:
    """Solve problems using OPTIC solver with multiprocessing support.
    
    Args:
        benchmark_dir: Directory containing benchmark problems
        generated: Dictionary mapping scenario names to lists of problem paths
        time_limit: Time limit per problem in seconds
        incremental_write: Whether to write results incrementally after each scenario
        results_csv: Path to CSV file for results (optional)
        skip_solved: Whether to skip problems with valid cached results
        cache: Solver cache dictionary
        cache_path: Path to cache file
        check_summary: Whether to check optic_summary.json for existing results and skip them
        num_workers: Number of worker processes (None = use CPU count)
    """
    results: Dict[Tuple[str, str], SolverOutcome] = {}
    
    # Determine number of workers
    if num_workers is None:
        num_workers = max(1, multiprocessing.cpu_count())
    
    # Load existing results from summary if requested
    existing_summary: Dict[Tuple[str, str], SolverOutcome] = {}
    if check_summary:
        existing_summary = load_solved_from_summary(benchmark_dir, generated)
        if existing_summary:
            print(f"Loaded {len(existing_summary)} existing results from optic_summary.json", flush=True)
    
    if incremental_write and results_csv is None:
        results_csv = benchmark_dir / "optic_results.csv"
        if results_csv.exists():
            results_csv.unlink()
    
    optic_cache: Dict[str, Any] = {}
    if cache is not None:
        optic_cache = cache.setdefault("optic", {})

    for scenario, paths in generated.items():
        domain = DOMAIN_PATHS.get(scenario)
        if not domain or not domain.exists():
            raise FileNotFoundError(f"Domain missing for {scenario}: {domain}")

        output_dir = benchmark_dir / scenario / OPTIC_RESULTS_DIRNAME
        if output_dir.exists():
            if not skip_solved:
                shutil.rmtree(output_dir)
        if not output_dir.exists():
            output_dir.mkdir(parents=True, exist_ok=True)

        log_dir = output_dir / "logs"
        log_dir.mkdir(exist_ok=True)

        scenario_cache_modified = False
        
        # Filter out problems that already have results in summary
        problems_to_solve: List[Path] = []
        problems_with_cache: List[Tuple[Path, SolverOutcome]] = []
        
        for problem in paths:
            key = (scenario, problem.name)
            if key in existing_summary:
                # Problem already has result in summary, skip solving and use existing result
                existing_outcome = existing_summary[key]
                results[key] = existing_outcome
                
                # Update cache with existing result for future use
                if cache is not None:
                    cache_key = f"{scenario}/{problem.name}"
                    optic_cache = cache.setdefault("optic", {})
                    optic_cache[cache_key] = outcome_to_cache_dict(existing_outcome, problem)
                    scenario_cache_modified = True
                
                elapsed_str = (
                    f"{existing_outcome.elapsed_seconds:.3f}s"
                    if existing_outcome.elapsed_seconds is not None
                    else "N/A"
                )
                status_str = existing_outcome.status
                validation_str = (
                    f" ({existing_outcome.validation})" if existing_outcome.validation else ""
                )
                print(
                    f"[OPTIC] {scenario}: {problem.name} [from summary, skipped] -> "
                    f"{elapsed_str} - {status_str}{validation_str}",
                    flush=True,
                )
            else:
                # Check cache
                cache_key = f"{scenario}/{problem.name}"
                cached_entry = optic_cache.get(cache_key) if (skip_solved and optic_cache) else None
                if skip_solved and cached_entry and cached_entry.get("validation") == "valid":
                    cached_outcome = cache_dict_to_outcome(cached_entry)
                    plan_path = cached_outcome.plan_path
                    if plan_path and plan_path.exists():
                        problems_with_cache.append((problem, cached_outcome))
                    else:
                        problems_to_solve.append(problem)
                else:
                    problems_to_solve.append(problem)
        
        # Add cached problems to results
        for problem, cached_outcome in problems_with_cache:
            key = (scenario, problem.name)
            results[key] = cached_outcome
            elapsed_str = (
                f"{cached_outcome.elapsed_seconds:.3f}s"
                if cached_outcome.elapsed_seconds is not None
                else "N/A"
            )
            status_str = cached_outcome.status
            validation_str = (
                f" ({cached_outcome.validation})" if cached_outcome.validation else ""
            )
            print(
                f"[OPTIC] {scenario}: {problem.name} [cached] -> "
                f"{elapsed_str} - {status_str}{validation_str}",
                flush=True,
            )
        
        if not problems_to_solve:
            total_skipped = len(paths) - len(problems_with_cache)
            if total_skipped > 0:
                print(f"[OPTIC] {scenario}: All problems already solved (from summary/cache), skipping.", flush=True)
        else:
            print(f"[OPTIC] {scenario}: {len(problems_to_solve)} problems to solve (skipped {len(paths) - len(problems_to_solve)} from summary/cache)", flush=True)
            
            # Prepare tasks for parallel execution
            tasks: List[Tuple[str, str, str, str, str, str, float]] = []
            problem_to_index: Dict[Path, int] = {}
            
            for idx, problem in enumerate(problems_to_solve, start=1):
                problem_to_index[problem] = idx
                plan_path = output_dir / f"{problem.stem}.plan"
                log_path = log_dir / f"{problem.stem}.stderr"
                
                tasks.append((
                    scenario,
                    problem.name,
                    str(domain.resolve()),
                    str(problem.resolve()),
                    str(plan_path.resolve()),
                    str(log_path.resolve()),
                    time_limit,
                ))
            
            # Execute tasks in parallel
            scenario_results: Dict[Tuple[str, str], SolverOutcome] = {}
            total_count = len(tasks)
            
            print(f"[OPTIC] {scenario}: Starting parallel solving with {num_workers} workers...", flush=True)
            
            with ProcessPoolExecutor(max_workers=num_workers) as executor:
                # Submit all tasks
                future_to_task = {
                    executor.submit(_solve_single_problem_worker, task): task
                    for task in tasks
                }
                
                # Process completed tasks as they finish
                completed = 0
                for future in as_completed(future_to_task):
                    completed += 1
                    try:
                        scenario_name, problem_name, outcome_dict = future.result()
                        key = (scenario_name, problem_name)
                        
                        # Convert outcome_dict to SolverOutcome
                        outcome = SolverOutcome(
                            status=outcome_dict["status"],
                            validation=outcome_dict["validation"],
                            elapsed_seconds=outcome_dict["elapsed_seconds"],
                            plan_path=Path(outcome_dict["plan_path"]) if outcome_dict["plan_path"] else None,
                            log_path=Path(outcome_dict["log_path"]) if outcome_dict["log_path"] else None,
                            notes=outcome_dict["notes"],
                            validation_stdout=outcome_dict.get("validation_stdout", ""),
                        )
                        
                        scenario_results[key] = outcome
                        results[key] = outcome
                        
                        # Update cache (cache updates are done in main process, no lock needed)
                        if cache is not None:
                            problem = next(p for p in problems_to_solve if p.name == problem_name)
                            cache_key = f"{scenario}/{problem_name}"
                            optic_cache[cache_key] = outcome_to_cache_dict(outcome, problem)
                            scenario_cache_modified = True
                        
                        # Print result
                        elapsed_str = (
                            f"{outcome.elapsed_seconds:.3f}s"
                            if outcome.elapsed_seconds is not None
                            else "N/A"
                        )
                        status_str = outcome.status
                        validation_str = f" ({outcome.validation})" if outcome.validation else ""
                        # Find problem index
                        try:
                            problem_obj = next(p for p in problems_to_solve if p.name == problem_name)
                            problem_idx = problem_to_index.get(problem_obj, completed)
                        except StopIteration:
                            problem_idx = completed
                        print(
                            f"[OPTIC] {scenario} ({completed}/{total_count}): {problem_name} -> "
                            f"{elapsed_str} - {status_str}{validation_str}",
                            flush=True,
                        )
                    except Exception as exc:
                        task = future_to_task[future]
                        problem_name = task[1]
                        print(f"[OPTIC] {scenario}: {problem_name} failed with error: {exc}", flush=True, file=sys.stderr)

        # Save cache after scenario
        if scenario_cache_modified and cache is not None and cache_path is not None:
            save_solver_cache(cache_path, cache)

        if incremental_write and results_csv is not None:
            # Include all problems (both from summary and newly solved) in CSV
            all_scenario_results = {k: v for k, v in results.items() if k[0] == scenario}
            append_optic_scenario_results(scenario, paths, all_scenario_results, results_csv)
            print(f"[OPTIC] Results for {scenario} written to {results_csv}", flush=True)

    return results


def append_optic_scenario_results(
    scenario: str,
    problem_paths: List[Path],
    optic_results: Dict[Tuple[str, str], SolverOutcome],
    results_csv: Path,
) -> None:
    """Append OPTIC results for a single scenario to CSV file."""
    fieldnames = [
        "scenario",
        "problem",
        "optic_status",
        "optic_validation",
        "optic_elapsed",
        "optic_plan_path",
        "optic_log_path",
        "optic_notes",
    ]

    file_exists = results_csv.exists()
    
    with results_csv.open("a", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=fieldnames)
        
        if not file_exists:
            writer.writeheader()

        for problem_path in problem_paths:
            key = (scenario, problem_path.name)
            optic_out = optic_results.get(key, SolverOutcome())
            
            optic_plan_path = ""
            if optic_out.plan_path and optic_out.plan_path.exists():
                try:
                    optic_plan_path = str(optic_out.plan_path.resolve().relative_to(WORKSPACE_ROOT))
                except ValueError:
                    optic_plan_path = str(optic_out.plan_path.resolve())
            
            optic_log_path = ""
            if optic_out.log_path and optic_out.log_path.exists():
                try:
                    optic_log_path = str(optic_out.log_path.resolve().relative_to(WORKSPACE_ROOT))
                except ValueError:
                    optic_log_path = str(optic_out.log_path.resolve())
            
            writer.writerow({
                "scenario": scenario,
                "problem": problem_path.name,
                "optic_status": optic_out.status,
                "optic_validation": optic_out.validation,
                "optic_elapsed": format_elapsed(optic_out),
                "optic_plan_path": optic_plan_path,
                "optic_log_path": optic_log_path,
                "optic_notes": optic_out.notes or "",
            })


def write_optic_results(
    generated: Dict[str, List[Path]],
    optic_results: Dict[Tuple[str, str], SolverOutcome],
    results_csv: Path,
) -> None:
    """Write all OPTIC results to CSV file."""
    fieldnames = [
        "scenario",
        "problem",
        "optic_status",
        "optic_validation",
        "optic_elapsed",
        "optic_plan_path",
        "optic_log_path",
        "optic_notes",
    ]

    with results_csv.open("w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=fieldnames)
        writer.writeheader()

        for scenario, problems in generated.items():
            for problem_path in problems:
                key = (scenario, problem_path.name)
                optic_out = optic_results.get(key, SolverOutcome())
                
                optic_plan_path = ""
                if optic_out.plan_path and optic_out.plan_path.exists():
                    try:
                        optic_plan_path = str(optic_out.plan_path.resolve().relative_to(WORKSPACE_ROOT))
                    except ValueError:
                        optic_plan_path = str(optic_out.plan_path.resolve())
                
                optic_log_path = ""
                if optic_out.log_path and optic_out.log_path.exists():
                    try:
                        optic_log_path = str(optic_out.log_path.resolve().relative_to(WORKSPACE_ROOT))
                    except ValueError:
                        optic_log_path = str(optic_out.log_path.resolve())
                
                writer.writerow({
                    "scenario": scenario,
                    "problem": problem_path.name,
                    "optic_status": optic_out.status,
                    "optic_validation": optic_out.validation,
                    "optic_elapsed": format_elapsed(optic_out),
                    "optic_plan_path": optic_plan_path,
                    "optic_log_path": optic_log_path,
                    "optic_notes": optic_out.notes or "",
                })


def main():
    """Command-line interface for OPTIC solver."""
    import argparse
    from benchmark_common import DEFAULT_TIME_LIMIT, PROJECT_ROOT, CACHE_FILENAME
    from benchmark_common import ensure_binaries, load_solver_cache, save_solver_cache
    from generate_benchmark_problems import load_existing_problems
    from solve_results import compute_solver_summary, write_summary_csv, write_summary_json
    
    parser = argparse.ArgumentParser(description="Solve benchmark problems using OPTIC.")
    parser.add_argument(
        "--benchmark-dir",
        type=Path,
        default=PROJECT_ROOT / "benchmark_problems",
        help="Directory containing benchmark problems.",
    )
    parser.add_argument(
        "--time-limit",
        type=float,
        default=DEFAULT_TIME_LIMIT,
        help="Per-problem time limit (seconds) for OPTIC.",
    )
    parser.add_argument(
        "--skip-solved",
        action="store_true",
        help="Reuse cached solver results when available.",
    )
    parser.add_argument(
        "--instances-per-parameter",
        type=int,
        default=None,
        help="Limit to this many instances per parameter value when loading problems.",
    )
    parser.add_argument(
        "--num-workers",
        type=int,
        default=None,
        help="Number of worker processes for parallel solving (default: CPU count).",
    )
    
    args = parser.parse_args()
    
    # Check required binaries
    ensure_binaries(check_optic=True, check_validator=True)
    
    # Load cache
    cache_path = args.benchmark_dir / CACHE_FILENAME
    cache = load_solver_cache(cache_path)
    
    # Load existing problems
    print("Loading existing problems...", flush=True)
    generated = load_existing_problems(
        args.benchmark_dir,
        instances_per_parameter=args.instances_per_parameter,
    )
    total_problems = sum(len(problems) for problems in generated.values())
    if total_problems == 0:
        print(f"Error: No problems found in {args.benchmark_dir}", file=sys.stderr)
        sys.exit(1)
    
    print(f"Loaded {total_problems} problems across {len(generated)} scenarios.")
    
    # Run OPTIC solver (check_summary is enabled by default to skip already solved problems)
    optic_csv = args.benchmark_dir / "optic_results.csv"
    optic_results = solve_with_optic(
        args.benchmark_dir,
        generated,
        args.time_limit,
        incremental_write=True,
        results_csv=optic_csv,
        skip_solved=args.skip_solved,
        cache=cache,
        cache_path=cache_path,
        check_summary=True,  # Enable summary checking by default
        num_workers=args.num_workers,
    )
    
    # Write summary
    optic_summary = compute_solver_summary(generated, optic_results, only_present=False)
    write_summary_csv(args.benchmark_dir, optic_summary, None)
    print(f"Summary written to: {args.benchmark_dir / 'solver_summary.csv'}")
    
    write_summary_json(
        args.benchmark_dir,
        generated,
        optic_results,
        {},
        optic_summary,
        None,
        args.instances_per_parameter or 2,
        0,
        args.time_limit,
        "",
        "gpt",
        8000,
        False,
        "optic_summary.json",
    )
    print(f"OPTIC JSON summary written to: {args.benchmark_dir / 'optic_summary.json'}")
    
    if cache is not None:
        save_solver_cache(cache_path, cache)
    
    print("OPTIC solving completed.")


if __name__ == "__main__":
    main()

