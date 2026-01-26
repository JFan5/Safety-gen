#!/usr/bin/env python3
"""
Unified Benchmark Runner for PDDL Planning Solvers.

This script provides a unified interface to run benchmarks with different solvers:
- OPTIC: Traditional temporal planner
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

    # Run all domains
    python script/run_benchmark.py --solver gemini --model gemini-3-pro-preview --domain all
"""

import argparse
import os
import re
import shutil
import sys
import tempfile
import time
import json
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
    DEFAULT_BENCHMARK_DIR,
)

# Domain configurations
DOMAINS = ["blocksworld", "ferry", "spanner", "grippers", "delivery", "grid"]
PDDL3_DIR = Path(__file__).parent.parent / "pddl3"
BENCHMARK_PROBLEMS_DIR = Path(__file__).parent.parent / "benchmark_problems"

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
) -> Dict[str, Any]:
    """
    Run OpenAI API-based benchmark.

    Uses OPENAI_API_KEY environment variable for authentication.

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
        argv = [
            "--benchmark-dir", str(run_dir),
            "--skip-llm",
            "--time-limit", str(time_limit),
            "--problems-dir", str(temp_dir),
        ]
        if max_problems > 0:
            argv.extend(["--problems-per-scenario", str(max_problems)])

        try:
            run_optic_main(argv)
        except Exception as e:
            print(f"OPTIC benchmark error: {e}")
            return {"run_dir": str(run_dir), "error": str(e)}

        # Look for results and convert to standard format
        optic_summary = run_dir / "optic_summary.json"
        if optic_summary.exists():
            with open(optic_summary, "r", encoding="utf-8") as f:
                data = json.load(f)

            # Convert to standard format
            results = []
            for scenario_data in data.get("scenarios", {}).values():
                for problem in scenario_data.get("problems", []):
                    results.append({
                        "problem_name": problem.get("name", ""),
                        "is_valid": problem.get("status") == "success",
                        "solve_time_seconds": problem.get("elapsed_seconds", 0),
                        "category": problem.get("status", "unknown"),
                    })

            level_stats = compute_level_statistics(results, domain)
            overall_stats = compute_overall_statistics(results)

            # Save standardized results
            save_results_with_levels(run_dir, results, domain)
            save_summary(run_dir, overall_stats, level_stats)

            print_benchmark_summary(overall_stats, level_stats)

            return {
                "run_dir": str(run_dir),
                "overall_stats": overall_stats,
                "level_stats": level_stats,
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
        choices=["optic", "gemini", "openai", "llm"],
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
        help=f"Time limit per problem for OPTIC (default: {DEFAULT_TIME_LIMIT}s)",
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
