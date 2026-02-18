#!/usr/bin/env python3
"""
Unified Benchmark Runner for PDDL Planning Solvers.

This script provides a unified interface to run benchmarks with different solvers:
- OPTIC: Traditional temporal planner
- Downward: Fast Downward classical planner
- Gemini: Google Gemini API-based solver
- OpenAI: OpenAI ChatGPT API-based solver (uses OPENAI_API_KEY env var)
- LLM: Local LLM-based solver

Results are saved to runs/benchmark/{solver}/{domain}_{timestamp}/
with standardized JSON output including level-based statistics.

Usage:
    # OPTIC benchmark
    python script/run_benchmark.py --solver optic --domain blocksworld

    # Gemini benchmark
    python script/run_benchmark.py --solver gemini --model gemini-3-pro-preview --domain blocksworld

    # OpenAI/ChatGPT benchmark (requires OPENAI_API_KEY environment variable)
    python script/run_benchmark.py --solver openai --model gpt-4 --domain blocksworld
    python script/run_benchmark.py --solver openai --model gpt-5 --domain all

    # Local LLM benchmark
    python script/run_benchmark.py --solver llm --model /path/to/model --family qwen --domain blocksworld

    # Fast Downward benchmark
    python script/run_benchmark.py --solver downward --domain blocksworld --time-limit 30

    # Run all domains
    python script/run_benchmark.py --solver gemini --model gemini-3-pro-preview --domain all
"""

import argparse
import os
import re
import shutil
import subprocess
import sys
import tempfile
import time
import json
import yaml
from collections import defaultdict
from pathlib import Path
from datetime import datetime
from typing import Optional, List, Dict, Any

# Add script directory to path
SCRIPT_DIR = Path(__file__).parent
sys.path.insert(0, str(SCRIPT_DIR))

from utils.benchmark_output import (
    create_benchmark_run_dir,
    save_run_config,
    compute_level_statistics,
    compute_overall_statistics,
    save_results_with_levels,
    save_summary,
    get_command_string,
    print_benchmark_summary,
    extract_size_key,
    DEFAULT_BENCHMARK_DIR,
)
from utils.validation import classify_result, validate_solution

# Domain configurations
DOMAINS = ["blocksworld", "ferry", "spanner", "grippers", "delivery", "grid"]
PDDL3_DIR = Path(__file__).parent.parent / "pddl3"
BENCHMARK_PROBLEMS_DIR = Path(__file__).parent.parent / "benchmark_problems"
DOWNWARD_PATH = Path("/home/jfan5/downward/fast-downward.py")

# Default settings
DEFAULT_TEMPERATURE = 0.6
DEFAULT_MAX_PROBLEMS = 0  # 0 means all
DEFAULT_BATCH_SIZE = 8
DEFAULT_TIME_LIMIT = 100


def extract_difficulty_config(filename: str, domain: str) -> str:
    """
    Extract difficulty configuration from filename (excluding seed).

    Args:
        filename: The filename (e.g., 'bw_ops3_n03_seed3001.pddl')
        domain: The domain name

    Returns:
        The difficulty configuration key (e.g., 'bw_ops3_n03')
    """
    name = Path(filename).stem

    if domain == "blocksworld":
        # bw_ops3_n03_seed3001 -> bw_ops3_n03
        match = re.match(r'(bw_ops\d+_n\d+)_seed', name)
        return match.group(1) if match else name

    elif domain == "ferry":
        # ferry-l03-c02-s3001 -> ferry-l03-c02
        match = re.match(r'(ferry-l\d+-c\d+)-s', name)
        return match.group(1) if match else name

    elif domain == "spanner":
        # spanner-s10-n9-l15-s10001 -> spanner-s10-n9-l15
        match = re.match(r'(spanner-s\d+-n\d+-l\d+)-s', name)
        return match.group(1) if match else name

    elif domain == "grippers":
        # grippers-n1-r10-o8-s8001 -> grippers-n1-r10-o8
        match = re.match(r'(grippers-n\d+-r\d+-o\d+)-s', name)
        return match.group(1) if match else name

    elif domain == "delivery":
        # delivery_size10_packages1_seed10001 -> delivery_size10_packages1
        match = re.match(r'(delivery_size\d+_packages\d+)_seed', name)
        return match.group(1) if match else name

    elif domain == "grid":
        # grid_x10_y10_sh3_k6_l6_s10001 -> grid_x10_y10_sh3_k6_l6
        match = re.match(r'(grid_x\d+_y\d+_sh\d+_k\d+_l\d+)_s', name)
        return match.group(1) if match else name

    else:
        # Unknown domain - return full name
        return name


def select_benchmark_problems(problems_dir: Path, domain: str) -> List[Path]:
    """
    Select one problem per difficulty configuration.

    Args:
        problems_dir: Directory containing problem files
        domain: The domain name

    Returns:
        List of selected problem paths (one per difficulty level)
    """
    all_problems = sorted(problems_dir.glob("*.pddl"))

    # Group by difficulty config
    config_groups = defaultdict(list)
    for p in all_problems:
        config = extract_difficulty_config(p.name, domain)
        config_groups[config].append(p)

    # Select first from each group (sorted by name)
    selected = []
    for config in sorted(config_groups.keys()):
        problems = sorted(config_groups[config])
        selected.append(problems[0])  # Pick first seed (alphabetically)

    return selected


def get_domain_files(domain: str) -> tuple[Path, Path]:
    """Get domain file and problems directory for a domain."""
    # Domain file comes from pddl3
    domain_file = PDDL3_DIR / domain / "domain3.pddl"
    # Problems come from benchmark_problems
    problems_dir = BENCHMARK_PROBLEMS_DIR / domain
    return domain_file, problems_dir


def run_gemini_benchmark(
    domain: str,
    model: str,
    temperature: float,
    max_problems: int,
    one_shot: bool,
    max_workers: int,
    output_dir: Path,
) -> Dict[str, Any]:
    """
    Run Gemini API-based benchmark.

    Returns:
        Dictionary with results and statistics
    """
    from evaluate_gemini_solver import (
        test_gemini_model_on_testing_data,
        GEMINI_MODEL_CONFIG,
    )

    domain_file, problems_dir = get_domain_files(domain)

    if not domain_file.exists():
        raise FileNotFoundError(f"Domain file not found: {domain_file}")
    if not problems_dir.exists():
        raise FileNotFoundError(f"Problems directory not found: {problems_dir}")

    # Select one problem per difficulty level
    selected_problems = select_benchmark_problems(problems_dir, domain)
    print(f"Selected {len(selected_problems)} problems (one per difficulty level)")

    # Create temp directory with symlinks to selected problems
    temp_dir = Path(tempfile.mkdtemp(prefix=f"benchmark_{domain}_"))
    try:
        for p in selected_problems:
            (temp_dir / p.name).symlink_to(p)

        # Create output directory
        run_dir = create_benchmark_run_dir(
            solver_type="gemini",
            domain=domain,
            model=model,
            output_dir=output_dir,
        )

        # Save run config
        config = {
            "model": model,
            "domain": domain,
            "domain_file": str(domain_file),
            "problems_dir": str(problems_dir),
            "selected_problems_count": len(selected_problems),
            "temperature": temperature,
            "max_problems": max_problems,
            "one_shot": one_shot,
            "max_workers": max_workers,
        }
        save_run_config(
            run_dir=run_dir,
            command=get_command_string(),
            config=config,
            solver_type="gemini",
            model=model,
            domain=domain,
        )

        # Get actual model name
        model_key = model.lower()
        if model_key in GEMINI_MODEL_CONFIG:
            actual_model_name = GEMINI_MODEL_CONFIG[model_key]["model_name"]
        else:
            actual_model_name = model

        print(f"\n{'='*60}")
        print(f"Running Gemini benchmark")
        print(f"{'='*60}")
        print(f"Model: {actual_model_name}")
        print(f"Domain: {domain}")
        print(f"Problems dir: {problems_dir} (selected {len(selected_problems)} problems)")
        print(f"Output dir: {run_dir}")
        print(f"{'='*60}\n")

        # Run evaluation on temp directory with selected problems
        results_file = run_dir / "results.json"
        test_gemini_model_on_testing_data(
            model_name=actual_model_name,
            api_key=None,  # Use environment variable
            output_file=str(results_file),
            max_problems=max_problems,
            problems_dir=str(temp_dir),
            domain_file=str(domain_file),
            temperature=temperature,
            one_shot=one_shot,
            max_workers=max_workers,
            no_timestamp=True,
        )

        # Load results and add level statistics
        if results_file.exists():
            with open(results_file, "r", encoding="utf-8") as f:
                data = json.load(f)

            # Add solve_time_seconds to each result if not present
            # (Gemini doesn't track per-problem time by default)
            results = data.get("results", [])

            # Compute level statistics
            level_stats = compute_level_statistics(results, domain)
            overall_stats = compute_overall_statistics(results)

            # Update the results file with level statistics
            data["level_statistics"] = level_stats
            data["overall_statistics"] = overall_stats

            with open(results_file, "w", encoding="utf-8") as f:
                json.dump(data, f, indent=2, ensure_ascii=False)

            # Save summary
            category_counts = data.get("category_counts", {})
            save_summary(run_dir, overall_stats, level_stats, category_counts)

            # Print summary
            print_benchmark_summary(overall_stats, level_stats, category_counts)

            return {
                "run_dir": str(run_dir),
                "results_file": str(results_file),
                "overall_stats": overall_stats,
                "level_stats": level_stats,
            }

        return {"run_dir": str(run_dir), "error": "Results file not created"}

    finally:
        # Cleanup temp directory
        shutil.rmtree(temp_dir, ignore_errors=True)


def run_openai_benchmark(
    domain: str,
    model: str,
    temperature: float,
    max_problems: int,
    one_shot: bool,
    max_workers: int,
    output_dir: Path,
    prompt_template: str = None,
) -> Dict[str, Any]:
    """
    Run OpenAI API-based benchmark.

    Uses OPENAI_API_KEY environment variable for authentication.

    Args:
        prompt_template: Path to custom prompt template file (optional)

    Returns:
        Dictionary with results and statistics
    """
    from evaluate_api_llm_solver import (
        test_api_model_on_testing_data,
        API_MODEL_CONFIG,
    )

    domain_file, problems_dir = get_domain_files(domain)

    if not domain_file.exists():
        raise FileNotFoundError(f"Domain file not found: {domain_file}")
    if not problems_dir.exists():
        raise FileNotFoundError(f"Problems directory not found: {problems_dir}")

    # Select one problem per difficulty level
    selected_problems = select_benchmark_problems(problems_dir, domain)
    print(f"Selected {len(selected_problems)} problems (one per difficulty level)")

    # Create temp directory with symlinks to selected problems
    temp_dir = Path(tempfile.mkdtemp(prefix=f"benchmark_{domain}_"))
    try:
        for p in selected_problems:
            (temp_dir / p.name).symlink_to(p)

        # Create output directory
        run_dir = create_benchmark_run_dir(
            solver_type="openai",
            domain=domain,
            model=model,
            output_dir=output_dir,
        )

        # Get model configuration
        model_key = model.lower()
        use_responses_api = False
        reasoning_effort = None
        if model_key in API_MODEL_CONFIG:
            config = API_MODEL_CONFIG[model_key]
            actual_model_name = config['model_name']
            use_responses_api = config.get('use_responses_api', False)
            reasoning_effort = config.get('reasoning_effort', None)
        else:
            actual_model_name = model

        # Save run config
        run_config = {
            "model": model,
            "actual_model_name": actual_model_name,
            "domain": domain,
            "domain_file": str(domain_file),
            "problems_dir": str(problems_dir),
            "selected_problems_count": len(selected_problems),
            "temperature": temperature,
            "max_problems": max_problems,
            "one_shot": one_shot,
            "max_workers": max_workers,
            "use_responses_api": use_responses_api,
            "reasoning_effort": reasoning_effort,
            "prompt_template": prompt_template,
        }
        save_run_config(
            run_dir=run_dir,
            command=get_command_string(),
            config=run_config,
            solver_type="openai",
            model=model,
            domain=domain,
        )

        print(f"\n{'='*60}")
        print(f"Running OpenAI benchmark")
        print(f"{'='*60}")
        print(f"Model: {actual_model_name}")
        print(f"Domain: {domain}")
        print(f"Problems dir: {problems_dir} (selected {len(selected_problems)} problems)")
        print(f"Output dir: {run_dir}")
        if use_responses_api:
            print(f"Using responses API with reasoning_effort={reasoning_effort}")
        if prompt_template:
            print(f"Prompt template: {prompt_template}")
        print(f"{'='*60}\n")

        # Run evaluation on temp directory with selected problems
        results_file = run_dir / "results.json"
        test_api_model_on_testing_data(
            model_name=actual_model_name,
            api_key=None,  # Use OPENAI_API_KEY environment variable
            output_file=str(results_file),
            family='gpt',
            max_problems=max_problems,
            problems_dir=str(temp_dir),
            domain_file=str(domain_file),
            temperature=temperature,
            one_shot=one_shot,
            provider='openai',
            max_workers=max_workers,
            use_responses_api=use_responses_api,
            reasoning_effort=reasoning_effort,
            prompt_template=prompt_template,
        )

        # Load results and add level statistics
        # The API evaluator adds a timestamp to the filename, so find the actual file
        results_files = list(run_dir.glob("results*.json"))
        if results_files:
            # Use the most recent results file
            results_file = max(results_files, key=lambda f: f.stat().st_mtime)
            with open(results_file, "r", encoding="utf-8") as f:
                data = json.load(f)

            results = data.get("results", [])

            # Compute level statistics
            level_stats = compute_level_statistics(results, domain)
            overall_stats = compute_overall_statistics(results)

            # Update the results file with level statistics
            data["level_statistics"] = level_stats
            data["overall_statistics"] = overall_stats

            with open(results_file, "w", encoding="utf-8") as f:
                json.dump(data, f, indent=2, ensure_ascii=False)

            # Save summary
            category_counts = data.get("category_counts", {})
            save_summary(run_dir, overall_stats, level_stats, category_counts)

            # Print summary
            print_benchmark_summary(overall_stats, level_stats, category_counts)

            return {
                "run_dir": str(run_dir),
                "results_file": str(results_file),
                "overall_stats": overall_stats,
                "level_stats": level_stats,
            }

        return {"run_dir": str(run_dir), "error": "Results file not created"}

    finally:
        # Cleanup temp directory
        shutil.rmtree(temp_dir, ignore_errors=True)


def _read_plan_file(plan_path: Optional[str]) -> str:
    """Read a plan file and return the STRIPS-format plan text."""
    if not plan_path:
        return ""
    # plan_path may be workspace-relative
    p = Path(plan_path)
    if not p.is_absolute():
        p = Path(__file__).parent.parent.parent / plan_path  # WORKSPACE_ROOT
    if p.exists():
        try:
            return p.read_text(encoding="utf-8").strip()
        except Exception:
            return ""
    return ""


def _build_optic_scenario_results(
    optic_summary_data: Dict,
    domain: str,
    domain_file: Path,
    problems_dir: Path,
    time_limit: float,
    start_time: float,
    end_time: float,
) -> Dict[str, Any]:
    """
    Build a scenario JSON matching the reference eval format from OPTIC summary data.

    Returns a dict with header, category counts/rates, size stats, timing, and results array.
    """
    scenario_data = optic_summary_data.get("scenarios", {}).get(domain, {})
    problems_list = scenario_data.get("problems", [])

    results = []
    category_counter: Dict[str, int] = {}
    total_solve_time = 0.0
    size_buckets: Dict[str, Dict[str, Any]] = defaultdict(lambda: {"total": 0, "success": 0})

    for idx, problem in enumerate(problems_list, 1):
        optic_data = problem.get("optic", {}) or {}

        # Classify result
        validation_stdout = optic_data.get("validation_stdout", "")
        if validation_stdout:
            category = classify_result(validation_stdout)
        else:
            val_field = optic_data.get("validation", "")
            if val_field == "valid":
                category = "success_plans"
            elif optic_data.get("status") == "timeout":
                category = "plan_format_error"
            else:
                category = "plan_format_error"

        is_valid = (category == "success_plans")
        category_counter[category] = category_counter.get(category, 0) + 1

        problem_name = Path(problem.get("problem", "")).stem
        size_key = extract_size_key(problem_name, domain)

        elapsed = optic_data.get("elapsed_seconds", 0) or 0
        total_solve_time += elapsed

        # Read actual plan text
        raw_solution = _read_plan_file(optic_data.get("plan_path"))

        if size_key:
            size_buckets[size_key]["total"] += 1
            if is_valid:
                size_buckets[size_key]["success"] += 1

        if is_valid:
            validation_message = "Plan valid"
        elif category == "precondition_violation":
            validation_message = "Validation error: precondition violation"
        elif category == "safety_constraints_violation":
            validation_message = "Validation error: safety constraint violation"
        elif category == "goal_not_satisfied":
            validation_message = "Validation error: goal not satisfied"
        else:
            validation_message = "Validation error: " + optic_data.get("notes", "")

        results.append({
            "index": idx,
            "problem_name": problem_name,
            "size_key": size_key or "unknown",
            "scenario": domain,
            "problem_file": str(problem.get("problem_path", "")),
            "is_valid": is_valid,
            "category": category,
            "validation_message": validation_message,
            "validation_stdout": validation_stdout,
            "raw_solution": raw_solution,
            "generation_error": None,
            "solve_time_seconds": elapsed,
            "optic_status": optic_data.get("status", "unknown"),
        })

    total_tests = len(results)
    success_count = sum(1 for r in results if r["is_valid"])

    # Ensure all standard categories are present
    all_categories = [
        "success_plans", "plan_format_error", "precondition_violation",
        "safety_constraints_violation", "goal_not_satisfied", "generation_error", "others",
    ]
    cat_counts = {c: category_counter.get(c, 0) for c in all_categories}
    cat_rates = {
        c: (v / total_tests * 100) if total_tests > 0 else 0.0
        for c, v in cat_counts.items()
    }

    # Size-stratified success rates
    size_success_rates = {}
    for sk in sorted(size_buckets.keys()):
        b = size_buckets[sk]
        size_success_rates[sk] = {
            "total": b["total"],
            "success": b["success"],
            "success_rate": (b["success"] / b["total"] * 100) if b["total"] > 0 else 0.0,
        }

    wall_time = end_time - start_time if end_time > start_time else total_solve_time
    avg_solve = (total_solve_time / total_tests) if total_tests > 0 else 0.0
    pps = (total_tests / wall_time) if wall_time > 0 else 0.0

    scenario_json = {
        "timestamp": datetime.now().isoformat(),
        "solver": "optic",
        "scenario": domain,
        "domain_file": str(domain_file),
        "problems_dir": str(problems_dir),
        "time_limit": time_limit,
        "total_tests": total_tests,
        "success_count": success_count,
        "success_rate": (success_count / total_tests * 100) if total_tests > 0 else 0.0,
        "category_counts": cat_counts,
        "category_rates": cat_rates,
        "size_success_rates": size_success_rates,
        "timing": {
            "total_time_seconds": round(wall_time, 2),
            "total_solve_time_seconds": round(total_solve_time, 2),
            "avg_solve_time_seconds": round(avg_solve, 3),
            "problems_per_second": round(pps, 3),
        },
        "results": results,
    }

    return scenario_json


def run_optic_benchmark(
    domain: str,
    time_limit: float,
    max_problems: int,
    output_dir: Path,
) -> Dict[str, Any]:
    """
    Run OPTIC traditional planner benchmark.

    Returns:
        Dictionary with results and statistics
    """
    # Import OPTIC benchmark modules
    try:
        from benchmark_common import ensure_binaries
        from run_optic_benchmark import run as run_optic_main
    except ImportError:
        print("Error: OPTIC benchmark modules not found.")
        print("Make sure you're running from the script directory.")
        return {"error": "OPTIC modules not found"}

    domain_file, problems_dir = get_domain_files(domain)

    if not domain_file.exists():
        raise FileNotFoundError(f"Domain file not found: {domain_file}")
    if not problems_dir.exists():
        raise FileNotFoundError(f"Problems directory not found: {problems_dir}")

    # Select one problem per difficulty level
    selected_problems = select_benchmark_problems(problems_dir, domain)
    print(f"Selected {len(selected_problems)} problems (one per difficulty level)")

    # Create temp directory with symlinks to selected problems
    temp_dir = Path(tempfile.mkdtemp(prefix=f"benchmark_{domain}_"))
    try:
        for p in selected_problems:
            (temp_dir / p.name).symlink_to(p)

        # Create output directory
        run_dir = create_benchmark_run_dir(
            solver_type="optic",
            domain=domain,
            model=None,
            output_dir=output_dir,
        )

        # Save run config
        config = {
            "domain": domain,
            "domain_file": str(domain_file),
            "problems_dir": str(problems_dir),
            "selected_problems_count": len(selected_problems),
            "time_limit": time_limit,
            "max_problems": max_problems,
        }
        save_run_config(
            run_dir=run_dir,
            command=get_command_string(),
            config=config,
            solver_type="optic",
            model="optic",
            domain=domain,
        )

        print(f"\n{'='*60}")
        print(f"Running OPTIC benchmark")
        print(f"{'='*60}")
        print(f"Domain: {domain}")
        print(f"Problems dir: {problems_dir} (selected {len(selected_problems)} problems)")
        print(f"Time limit: {time_limit}s")
        print(f"Output dir: {run_dir}")
        print(f"{'='*60}\n")

        # Run OPTIC benchmark
        # Note: This uses the existing run_optic_benchmark infrastructure
        domain_start_time = time.time()
        argv = [
            "--benchmark-dir", str(run_dir),
            "--skip-llm",
            "--time-limit", str(time_limit),
            "--problems-dir", str(temp_dir),
            "--domain", domain,
        ]
        if max_problems > 0:
            argv.extend(["--problems-per-scenario", str(max_problems)])

        try:
            run_optic_main(argv)
        except Exception as e:
            print(f"OPTIC benchmark error: {e}")
            return {"run_dir": str(run_dir), "error": str(e)}
        domain_end_time = time.time()

        # Look for results and convert to standard format
        optic_summary = run_dir / "optic_summary.json"
        if optic_summary.exists():
            with open(optic_summary, "r", encoding="utf-8") as f:
                data = json.load(f)

            # Build rich scenario data for unified output
            scenario_json = _build_optic_scenario_results(
                data, domain, domain_file, problems_dir,
                time_limit, domain_start_time, domain_end_time,
            )

            # Convert to standard format for backward compat
            results = []
            category_counts = {}
            for r in scenario_json["results"]:
                cat = r["category"]
                category_counts[cat] = category_counts.get(cat, 0) + 1
                results.append({
                    "problem_name": r["problem_name"],
                    "is_valid": r["is_valid"],
                    "solve_time_seconds": r.get("solve_time_seconds", 0),
                    "category": cat,
                })

            level_stats = compute_level_statistics(results, domain)
            overall_stats = compute_overall_statistics(results)

            # Save standardized results
            save_results_with_levels(run_dir, results, domain)
            save_summary(run_dir, overall_stats, level_stats, category_counts=category_counts)

            print_benchmark_summary(overall_stats, level_stats, category_counts=category_counts)

            return {
                "run_dir": str(run_dir),
                "overall_stats": overall_stats,
                "level_stats": level_stats,
                "scenario_json": scenario_json,
                "domain_file": str(domain_file),
                "problems_dir": str(problems_dir),
            }

        return {"run_dir": str(run_dir)}

    finally:
        # Cleanup temp directory
        shutil.rmtree(temp_dir, ignore_errors=True)


def run_llm_benchmark(
    domain: str,
    model: str,
    family: str,
    temperature: float,
    max_problems: int,
    batch_size: int,
    output_dir: Path,
) -> Dict[str, Any]:
    """
    Run local LLM-based benchmark.

    Returns:
        Dictionary with results and statistics
    """
    from evaluate_llm_solver_batch import main as run_llm_batch

    domain_file, problems_dir = get_domain_files(domain)

    if not domain_file.exists():
        raise FileNotFoundError(f"Domain file not found: {domain_file}")
    if not problems_dir.exists():
        raise FileNotFoundError(f"Problems directory not found: {problems_dir}")

    # Select one problem per difficulty level
    selected_problems = select_benchmark_problems(problems_dir, domain)
    print(f"Selected {len(selected_problems)} problems (one per difficulty level)")

    # Create temp directory with symlinks to selected problems
    temp_dir = Path(tempfile.mkdtemp(prefix=f"benchmark_{domain}_"))
    try:
        for p in selected_problems:
            (temp_dir / p.name).symlink_to(p)

        # Create output directory
        model_name = Path(model).name if "/" in model else model
        run_dir = create_benchmark_run_dir(
            solver_type="llm",
            domain=domain,
            model=model_name,
            output_dir=output_dir,
        )

        # Save run config
        config = {
            "model": model,
            "family": family,
            "domain": domain,
            "domain_file": str(domain_file),
            "problems_dir": str(problems_dir),
            "selected_problems_count": len(selected_problems),
            "temperature": temperature,
            "max_problems": max_problems,
            "batch_size": batch_size,
        }
        save_run_config(
            run_dir=run_dir,
            command=get_command_string(),
            config=config,
            solver_type="llm",
            model=model,
            domain=domain,
        )

        print(f"\n{'='*60}")
        print(f"Running LLM benchmark")
        print(f"{'='*60}")
        print(f"Model: {model}")
        print(f"Family: {family}")
        print(f"Domain: {domain}")
        print(f"Problems dir: {problems_dir} (selected {len(selected_problems)} problems)")
        print(f"Output dir: {run_dir}")
        print(f"{'='*60}\n")

        # Run LLM batch evaluation on temp directory with selected problems
        results_file = run_dir / "results.json"
        argv = [
            "--model", model,
            "--family", family,
            "--problems-dir", str(temp_dir),
            "--domain-file", str(domain_file),
            "--output", str(results_file),
            "--batch-size", str(batch_size),
            "--temperature", str(temperature),
        ]
        if max_problems > 0:
            argv.extend(["--max-problems", str(max_problems)])

        try:
            # Run the evaluation
            sys.argv = ["evaluate_llm_solver_batch.py"] + argv
            run_llm_batch()
        except SystemExit:
            pass
        except Exception as e:
            print(f"LLM benchmark error: {e}")
            return {"run_dir": str(run_dir), "error": str(e)}

        # Load and enhance results
        if results_file.exists():
            with open(results_file, "r", encoding="utf-8") as f:
                data = json.load(f)

            results = data.get("results", [])
            level_stats = compute_level_statistics(results, domain)
            overall_stats = compute_overall_statistics(results)

            data["level_statistics"] = level_stats
            data["overall_statistics"] = overall_stats

            with open(results_file, "w", encoding="utf-8") as f:
                json.dump(data, f, indent=2, ensure_ascii=False)

            category_counts = data.get("category_counts", {})
            save_summary(run_dir, overall_stats, level_stats, category_counts)
            print_benchmark_summary(overall_stats, level_stats, category_counts)

            return {
                "run_dir": str(run_dir),
                "results_file": str(results_file),
                "overall_stats": overall_stats,
                "level_stats": level_stats,
            }

        return {"run_dir": str(run_dir)}

    finally:
        # Cleanup temp directory
        shutil.rmtree(temp_dir, ignore_errors=True)


def _solve_single_downward(
    domain_file: Path,
    domain3_file: Path,
    problem_file: Path,
    search_config: str,
    time_limit: float,
) -> Dict[str, Any]:
    """
    Solve a single problem with Fast Downward and validate the plan.

    Args:
        domain_file: PDDL2 domain file (for solving)
        domain3_file: PDDL3 domain file (for validation with safety constraints)
        problem_file: Problem PDDL file
        search_config: Search configuration string (e.g. "astar(lmcut())")
        time_limit: Overall time limit in seconds

    Returns:
        Result dictionary with problem_name, is_valid, category, etc.
    """
    problem_name = problem_file.stem
    start_time = time.time()
    work_dir = tempfile.mkdtemp(prefix=f"fd_{problem_name}_")
    plan_file = os.path.join(work_dir, "sas_plan")

    try:
        cmd = [
            sys.executable, str(DOWNWARD_PATH),
            "--overall-time-limit", str(int(time_limit)),
            "--plan-file", plan_file,
            str(domain_file), str(problem_file),
            "--search", search_config,
        ]
        proc = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=time_limit + 30,
            cwd=work_dir,
        )
        elapsed = time.time() - start_time

        # Check if plan file was created (FD exit code 0 = solution found)
        if not os.path.exists(plan_file):
            return {
                "problem_name": problem_name,
                "is_valid": False,
                "category": "plan_format_error",
                "validation_message": "No plan found (solver returned no solution)",
                "validation_stdout": "",
                "raw_solution": "",
                "solve_time_seconds": round(elapsed, 3),
                "status": "no_solution",
            }

        # Read plan, strip comment lines (starting with ;)
        with open(plan_file, "r", encoding="utf-8") as f:
            raw_lines = f.readlines()
        plan_lines = [l.rstrip() for l in raw_lines if l.strip() and not l.strip().startswith(";")]
        raw_solution = "\n".join(plan_lines)

        # Validate with VAL using domain3 (PDDL3 with safety constraints)
        is_valid, validation_message, val_stdout, val_stderr, val_cmd = validate_solution(
            str(domain3_file), str(problem_file), raw_solution,
        )

        category = classify_result(val_stdout)
        if category == "success_plans":
            is_valid = True
            validation_message = "Plan valid"
        else:
            is_valid = False

        return {
            "problem_name": problem_name,
            "is_valid": is_valid,
            "category": category,
            "validation_message": validation_message,
            "validation_stdout": val_stdout,
            "raw_solution": raw_solution,
            "solve_time_seconds": round(elapsed, 3),
            "status": "ok",
        }

    except subprocess.TimeoutExpired:
        elapsed = time.time() - start_time
        return {
            "problem_name": problem_name,
            "is_valid": False,
            "category": "plan_format_error",
            "validation_message": "Solver timeout",
            "validation_stdout": "",
            "raw_solution": "",
            "solve_time_seconds": round(elapsed, 3),
            "status": "timeout",
        }
    except Exception as e:
        elapsed = time.time() - start_time
        return {
            "problem_name": problem_name,
            "is_valid": False,
            "category": "plan_format_error",
            "validation_message": f"Solver error: {e}",
            "validation_stdout": "",
            "raw_solution": "",
            "solve_time_seconds": round(elapsed, 3),
            "status": "error",
        }
    finally:
        shutil.rmtree(work_dir, ignore_errors=True)


def run_downward_benchmark(
    domain: str,
    time_limit: float,
    max_problems: int,
    search_config: str,
    output_dir: Path,
) -> Dict[str, Any]:
    """
    Run Fast Downward classical planner benchmark.

    Uses PDDL2 domain for solving and PDDL3 domain for validation (safety constraints).

    Returns:
        Dictionary with results and statistics
    """
    # Domain files: PDDL2 for solving, PDDL3 for validation
    domain_file = PDDL3_DIR / domain / "domain.pddl"
    domain3_file = PDDL3_DIR / domain / "domain3.pddl"
    problems_dir = BENCHMARK_PROBLEMS_DIR / domain

    if not domain_file.exists():
        raise FileNotFoundError(f"PDDL2 domain file not found: {domain_file}")
    if not domain3_file.exists():
        raise FileNotFoundError(f"PDDL3 domain file not found: {domain3_file}")
    if not problems_dir.exists():
        raise FileNotFoundError(f"Problems directory not found: {problems_dir}")

    # Select one problem per difficulty level
    selected_problems = select_benchmark_problems(problems_dir, domain)
    print(f"Selected {len(selected_problems)} problems (one per difficulty level)")

    if max_problems > 0:
        selected_problems = selected_problems[:max_problems]
        print(f"Limited to {len(selected_problems)} problems (--max-problems {max_problems})")

    # Create output directory
    run_dir = create_benchmark_run_dir(
        solver_type="downward",
        domain=domain,
        model=None,
        output_dir=output_dir,
    )

    # Save run config
    config = {
        "domain": domain,
        "domain_file": str(domain_file),
        "domain3_file": str(domain3_file),
        "problems_dir": str(problems_dir),
        "selected_problems_count": len(selected_problems),
        "time_limit": time_limit,
        "max_problems": max_problems,
        "search_config": search_config,
        "downward_path": str(DOWNWARD_PATH),
    }
    save_run_config(
        run_dir=run_dir,
        command=get_command_string(),
        config=config,
        solver_type="downward",
        model="fast-downward",
        domain=domain,
    )

    print(f"\n{'='*60}")
    print(f"Running Fast Downward benchmark")
    print(f"{'='*60}")
    print(f"Domain: {domain}")
    print(f"Solving domain: {domain_file}")
    print(f"Validation domain: {domain3_file}")
    print(f"Search config: {search_config}")
    print(f"Problems dir: {problems_dir} (selected {len(selected_problems)} problems)")
    print(f"Time limit: {time_limit}s")
    print(f"Output dir: {run_dir}")
    print(f"{'='*60}\n")

    # Solve each problem
    domain_start_time = time.time()
    results = []
    category_counts: Dict[str, int] = {}
    total_solve_time = 0.0
    size_buckets: Dict[str, Dict[str, int]] = defaultdict(lambda: {"total": 0, "success": 0})

    for idx, problem_file in enumerate(selected_problems, 1):
        print(f"  [{idx}/{len(selected_problems)}] Solving {problem_file.name} ...", end=" ", flush=True)

        result = _solve_single_downward(
            domain_file=domain_file,
            domain3_file=domain3_file,
            problem_file=problem_file,
            search_config=search_config,
            time_limit=time_limit,
        )

        cat = result["category"]
        status_icon = "OK" if result["is_valid"] else f"FAIL ({cat})"
        print(f"{status_icon} [{result['solve_time_seconds']:.1f}s]")

        category_counts[cat] = category_counts.get(cat, 0) + 1
        total_solve_time += result["solve_time_seconds"]

        size_key = extract_size_key(result["problem_name"], domain)
        if size_key:
            size_buckets[size_key]["total"] += 1
            if result["is_valid"]:
                size_buckets[size_key]["success"] += 1

        results.append({
            "index": idx,
            "problem_name": result["problem_name"],
            "size_key": size_key or "unknown",
            "scenario": domain,
            "problem_file": str(problem_file),
            "is_valid": result["is_valid"],
            "category": result["category"],
            "validation_message": result["validation_message"],
            "validation_stdout": result["validation_stdout"],
            "raw_solution": result["raw_solution"],
            "generation_error": None,
            "solve_time_seconds": result["solve_time_seconds"],
            "downward_status": result["status"],
        })

    domain_end_time = time.time()

    # Build scenario_json (same structure as _build_optic_scenario_results)
    total_tests = len(results)
    success_count = sum(1 for r in results if r["is_valid"])

    all_categories = [
        "success_plans", "plan_format_error", "precondition_violation",
        "safety_constraints_violation", "goal_not_satisfied", "generation_error", "others",
    ]
    cat_counts = {c: category_counts.get(c, 0) for c in all_categories}
    cat_rates = {
        c: (v / total_tests * 100) if total_tests > 0 else 0.0
        for c, v in cat_counts.items()
    }

    size_success_rates = {}
    for sk in sorted(size_buckets.keys()):
        b = size_buckets[sk]
        size_success_rates[sk] = {
            "total": b["total"],
            "success": b["success"],
            "success_rate": (b["success"] / b["total"] * 100) if b["total"] > 0 else 0.0,
        }

    wall_time = domain_end_time - domain_start_time
    avg_solve = (total_solve_time / total_tests) if total_tests > 0 else 0.0
    pps = (total_tests / wall_time) if wall_time > 0 else 0.0

    scenario_json = {
        "timestamp": datetime.now().isoformat(),
        "solver": "downward",
        "scenario": domain,
        "domain_file": str(domain_file),
        "domain3_file": str(domain3_file),
        "problems_dir": str(problems_dir),
        "search_config": search_config,
        "time_limit": time_limit,
        "total_tests": total_tests,
        "success_count": success_count,
        "success_rate": (success_count / total_tests * 100) if total_tests > 0 else 0.0,
        "category_counts": cat_counts,
        "category_rates": cat_rates,
        "size_success_rates": size_success_rates,
        "timing": {
            "total_time_seconds": round(wall_time, 2),
            "total_solve_time_seconds": round(total_solve_time, 2),
            "avg_solve_time_seconds": round(avg_solve, 3),
            "problems_per_second": round(pps, 3),
        },
        "results": results,
    }

    # Convert to standard format for level stats
    std_results = []
    for r in results:
        std_results.append({
            "problem_name": r["problem_name"],
            "is_valid": r["is_valid"],
            "solve_time_seconds": r["solve_time_seconds"],
            "category": r["category"],
        })

    level_stats = compute_level_statistics(std_results, domain)
    overall_stats = compute_overall_statistics(std_results)

    save_results_with_levels(run_dir, std_results, domain)
    save_summary(run_dir, overall_stats, level_stats, category_counts=cat_counts)

    print_benchmark_summary(overall_stats, level_stats, category_counts=cat_counts)

    return {
        "run_dir": str(run_dir),
        "overall_stats": overall_stats,
        "level_stats": level_stats,
        "scenario_json": scenario_json,
        "domain_file": str(domain_file),
        "problems_dir": str(problems_dir),
    }


def _write_unified_eval_output(
    all_results: List[Dict[str, Any]],
    args: argparse.Namespace,
    benchmark_start_time: float,
    benchmark_end_time: float,
) -> Optional[Path]:
    """
    When --domain all, write a unified evaluation directory that mirrors the
    format produced by evaluate_llm_solver_batch:

        runs/benchmark/{solver}/optic_benchmark_{timestamp}/
        ├── eval_config.yaml
        ├── metrics.json
        └── scenarios/
            ├── blocksworld.json
            ├── ferry.json
            └── ...

    Each scenario JSON contains header, category_counts, category_rates,
    size_success_rates, timing, and a full results array with per-problem
    error classification – matching the reference format under
    runs/qwen3/.../eval/solver_batch_*/scenarios/*.json.
    """
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    solver = args.solver
    model_tag = args.model or solver

    # Create unified directory
    unified_dir = (
        args.output_dir / solver / f"{solver}_benchmark_{timestamp}"
    )
    unified_dir.mkdir(parents=True, exist_ok=True)
    scenarios_dir = unified_dir / "scenarios"
    scenarios_dir.mkdir(exist_ok=True)

    # ── eval_config.yaml ──
    eval_config = {
        "eval_type": f"benchmark_{solver}",
        "eval_id": f"{solver}_benchmark_{timestamp}",
        "solver": solver,
        "model": model_tag,
        "domains": [r["domain"] for r in all_results if "domain" in r],
        "time_limit": getattr(args, "time_limit", None),
        "max_problems": args.max_problems,
        "temperature": args.temperature,
        "timestamp": datetime.now().isoformat(),
        "command": get_command_string(),
    }
    with open(unified_dir / "eval_config.yaml", "w", encoding="utf-8") as f:
        yaml.dump(eval_config, f, default_flow_style=False, allow_unicode=True)

    # ── Per-scenario JSONs + aggregate metrics ──
    per_scenario_metrics: Dict[str, Any] = {}
    overall_cat_counts: Dict[str, int] = {}
    overall_total = 0
    overall_success = 0

    for result in all_results:
        domain = result.get("domain", "unknown")
        scenario_json = result.get("scenario_json")

        if scenario_json is None:
            # Build a minimal scenario_json from overall_stats for non-optic solvers
            # or when the optic run didn't produce scenario_json (error case)
            if "error" in result:
                per_scenario_metrics[domain] = {
                    "total_tests": 0,
                    "success_count": 0,
                    "success_rate": 0.0,
                    "error": result["error"],
                }
                continue
            # Skip domains with no scenario data
            continue

        # Write scenario JSON
        with open(scenarios_dir / f"{domain}.json", "w", encoding="utf-8") as f:
            json.dump(scenario_json, f, indent=2, ensure_ascii=False)

        # Collect per-scenario metrics
        cat_counts = scenario_json.get("category_counts", {})
        cat_rates = scenario_json.get("category_rates", {})
        per_scenario_metrics[domain] = {
            "total_tests": scenario_json["total_tests"],
            "success_count": scenario_json["success_count"],
            "success_rate": scenario_json["success_rate"],
            "category_counts": cat_counts,
            "category_rates": cat_rates,
            "size_success_rates": scenario_json.get("size_success_rates", {}),
        }

        overall_total += scenario_json["total_tests"]
        overall_success += scenario_json["success_count"]
        for cat, cnt in cat_counts.items():
            overall_cat_counts[cat] = overall_cat_counts.get(cat, 0) + cnt

    # Ensure all standard categories present in overall
    all_categories = [
        "success_plans", "plan_format_error", "precondition_violation",
        "safety_constraints_violation", "goal_not_satisfied", "generation_error", "others",
    ]
    overall_cat_counts_full = {c: overall_cat_counts.get(c, 0) for c in all_categories}
    overall_cat_rates = {
        c: (v / overall_total * 100) if overall_total > 0 else 0.0
        for c, v in overall_cat_counts_full.items()
    }

    # ── metrics.json ──
    metrics = {
        "eval_id": f"{solver}_benchmark_{timestamp}",
        "timestamp": datetime.now().isoformat(),
        "solver": model_tag,
        "per_scenario": per_scenario_metrics,
        "overall": {
            "total_tests": overall_total,
            "success_count": overall_success,
            "success_rate": (overall_success / overall_total * 100) if overall_total > 0 else 0.0,
            "num_scenarios": len([r for r in all_results if r.get("scenario_json")]),
            "category_counts": overall_cat_counts_full,
            "category_rates": overall_cat_rates,
        },
    }
    with open(unified_dir / "metrics.json", "w", encoding="utf-8") as f:
        json.dump(metrics, f, indent=2, ensure_ascii=False)

    print(f"\n{'='*60}")
    print(f"Unified evaluation output saved to:")
    print(f"  {unified_dir}")
    print(f"  eval_config.yaml  - run configuration")
    print(f"  metrics.json      - aggregate metrics")
    print(f"  scenarios/        - per-domain result JSONs")
    print(f"{'='*60}")

    return unified_dir


def main():
    parser = argparse.ArgumentParser(
        description="Unified Benchmark Runner for PDDL Planning Solvers",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Run Gemini benchmark on blocksworld
  python script/run_benchmark.py --solver gemini --model gemini-3-pro-preview --domain blocksworld

  # Run OpenAI/ChatGPT benchmark (requires OPENAI_API_KEY env var)
  python script/run_benchmark.py --solver openai --model gpt-4 --domain blocksworld
  python script/run_benchmark.py --solver openai --model gpt-5 --domain all

  # Run Fast Downward benchmark
  python script/run_benchmark.py --solver downward --domain blocksworld --time-limit 30

  # Run OPTIC benchmark on all domains
  python script/run_benchmark.py --solver optic --domain all

  # Run local LLM benchmark
  python script/run_benchmark.py --solver llm --model /path/to/model --family qwen --domain ferry
        """,
    )

    parser.add_argument(
        "--solver",
        type=str,
        required=True,
        choices=["optic", "downward", "gemini", "openai", "llm"],
        help="Solver type to benchmark (openai uses OPENAI_API_KEY env var)",
    )
    parser.add_argument(
        "--domain",
        type=str,
        required=True,
        help=f"Domain name ({', '.join(DOMAINS)}) or 'all' for all domains",
    )
    parser.add_argument(
        "--model",
        type=str,
        default=None,
        help="Model path/name (required for gemini, openai, and llm solvers)",
    )
    parser.add_argument(
        "--family",
        type=str,
        default="auto",
        choices=["auto", "mistral", "llama", "qwen", "gpt", "phi", "gemma"],
        help="Model family for tokenizer (llm solver only)",
    )
    parser.add_argument(
        "--temperature",
        type=float,
        default=DEFAULT_TEMPERATURE,
        help=f"Generation temperature (default: {DEFAULT_TEMPERATURE})",
    )
    parser.add_argument(
        "--max-problems",
        type=int,
        default=DEFAULT_MAX_PROBLEMS,
        help=f"Maximum problems to test (0 = all, default: {DEFAULT_MAX_PROBLEMS})",
    )
    parser.add_argument(
        "--batch-size",
        type=int,
        default=DEFAULT_BATCH_SIZE,
        help=f"Batch size for LLM solver (default: {DEFAULT_BATCH_SIZE})",
    )
    parser.add_argument(
        "--time-limit",
        type=float,
        default=DEFAULT_TIME_LIMIT,
        help=f"Time limit per problem in seconds (default: {DEFAULT_TIME_LIMIT}s)",
    )
    parser.add_argument(
        "--search-config",
        type=str,
        default="astar(lmcut())",
        help='Search configuration for downward solver (default: "astar(lmcut())")',
    )
    parser.add_argument(
        "--one-shot",
        action="store_true",
        help="Use one-shot mode with examples (gemini/llm only)",
    )
    parser.add_argument(
        "--max-workers",
        type=int,
        default=5,
        help="Max concurrent workers for API calls (default: 5)",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=DEFAULT_BENCHMARK_DIR,
        help=f"Output directory (default: {DEFAULT_BENCHMARK_DIR})",
    )
    parser.add_argument(
        "--prompt-template",
        type=str,
        default=None,
        help="Path to custom prompt template file (default: prompt.txt or prompt_oneshot.txt)",
    )

    args = parser.parse_args()

    # Validate arguments
    if args.solver in ["gemini", "openai", "llm"] and not args.model:
        parser.error(f"--model is required for {args.solver} solver")

    # Determine domains to run
    if args.domain.lower() == "all":
        domains = DOMAINS
    else:
        if args.domain not in DOMAINS:
            parser.error(f"Unknown domain: {args.domain}. Choose from: {', '.join(DOMAINS)}")
        domains = [args.domain]

    # Run benchmarks
    all_results = []
    benchmark_start_time = time.time()
    for domain in domains:
        print(f"\n{'#'*60}")
        print(f"# Benchmarking domain: {domain}")
        print(f"{'#'*60}")

        try:
            if args.solver == "gemini":
                result = run_gemini_benchmark(
                    domain=domain,
                    model=args.model,
                    temperature=args.temperature,
                    max_problems=args.max_problems,
                    one_shot=args.one_shot,
                    max_workers=args.max_workers,
                    output_dir=args.output_dir,
                )
            elif args.solver == "openai":
                result = run_openai_benchmark(
                    domain=domain,
                    model=args.model,
                    temperature=args.temperature,
                    max_problems=args.max_problems,
                    one_shot=args.one_shot,
                    max_workers=args.max_workers,
                    output_dir=args.output_dir,
                    prompt_template=args.prompt_template,
                )
            elif args.solver == "downward":
                result = run_downward_benchmark(
                    domain=domain,
                    time_limit=args.time_limit,
                    max_problems=args.max_problems,
                    search_config=args.search_config,
                    output_dir=args.output_dir,
                )
            elif args.solver == "optic":
                result = run_optic_benchmark(
                    domain=domain,
                    time_limit=args.time_limit,
                    max_problems=args.max_problems,
                    output_dir=args.output_dir,
                )
            elif args.solver == "llm":
                result = run_llm_benchmark(
                    domain=domain,
                    model=args.model,
                    family=args.family,
                    temperature=args.temperature,
                    max_problems=args.max_problems,
                    batch_size=args.batch_size,
                    output_dir=args.output_dir,
                )
            else:
                result = {"error": f"Unknown solver: {args.solver}"}

            result["domain"] = domain
            all_results.append(result)

        except Exception as e:
            print(f"Error benchmarking {domain}: {e}")
            import traceback
            traceback.print_exc()
            all_results.append({"domain": domain, "error": str(e)})

    benchmark_end_time = time.time()

    # ── Generate unified eval-style output when --domain all ──
    if args.domain.lower() == "all" and len(all_results) > 1:
        _write_unified_eval_output(
            all_results=all_results,
            args=args,
            benchmark_start_time=benchmark_start_time,
            benchmark_end_time=benchmark_end_time,
        )

    # Print final summary
    print(f"\n{'='*60}")
    print("BENCHMARK COMPLETE")
    print(f"{'='*60}")
    for result in all_results:
        domain = result.get("domain", "unknown")
        if "error" in result:
            print(f"  {domain}: ERROR - {result['error']}")
        elif "overall_stats" in result:
            stats = result["overall_stats"]
            print(f"  {domain}: {stats['success_rate']:.1f}% ({stats['success_count']}/{stats['total_problems']})")
        else:
            print(f"  {domain}: Results saved to {result.get('run_dir', 'unknown')}")
    print(f"{'='*60}\n")


if __name__ == "__main__":
    main()
