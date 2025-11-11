#!/usr/bin/env python3
"""
Solve benchmark problems using LLM solver.
"""
from __future__ import annotations

import csv
import json
import shutil
import subprocess
import sys
import time
from pathlib import Path
from statistics import mean
from typing import Any, Dict, List, Optional, Tuple

try:
    from evaluate_llm_solver import (  # type: ignore
        FastLanguageModel,
        MODEL_FAMILY_MAP,
        MAX_NEW_TOKENS,
        dtype,
        template_input,
        extract_llm_output,
    )
    import torch  # type: ignore

    HAVE_LLM = True
    load_in_4bit = True
    max_seq_length = 32768
except Exception:
    HAVE_LLM = False
    MAX_NEW_TOKENS = 8000
    load_in_4bit = True
    max_seq_length = 32768

from benchmark_common import (
    DOMAIN_PATHS,
    LLM_RESULTS_DIRNAME,
    PROMPT_PATH,
    VALIDATOR,
    WORKSPACE_ROOT,
    SolverOutcome,
    cache_dict_to_outcome,
    extract_parameter_value,
    outcome_to_cache_dict,
    problem_complexity,
    save_solver_cache,
    to_text,
    workspace_str_to_path,
)


def format_elapsed(outcome: SolverOutcome) -> str:
    """Format elapsed time for CSV output."""
    if outcome.status == "timeout":
        return "timeout"
    if outcome.elapsed_seconds is None:
        return ""
    return f"{outcome.elapsed_seconds:.3f}"


def load_solved_from_summary(
    benchmark_dir: Path,
    generated: Dict[str, List[Path]],
) -> Dict[Tuple[str, str], SolverOutcome]:
    """Load solved problems from llm_summary.json and convert to SolverOutcome format.
    
    Returns:
        Dictionary mapping (scenario, problem_name) to SolverOutcome for problems that already have results.
    """
    summary_path = benchmark_dir / "llm_summary.json"
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
                
                llm_data = problem.get("llm")
                if llm_data is None or not isinstance(llm_data, dict):
                    continue
                
                # Convert JSON data to SolverOutcome
                status = llm_data.get("status", "unknown")
                validation = llm_data.get("validation", "")
                elapsed_seconds = llm_data.get("elapsed_seconds")
                plan_path_str = llm_data.get("plan_path")
                notes = llm_data.get("notes", "")
                
                plan_path = workspace_str_to_path(plan_path_str) if plan_path_str else None
                
                outcome = SolverOutcome(
                    status=status,
                    validation=validation,
                    elapsed_seconds=elapsed_seconds,
                    plan_path=plan_path,
                    log_path=None,  # LLM doesn't use log_path
                    notes=notes,
                )
                
                results[(scenario_name, problem_name)] = outcome
                
    except Exception as exc:
        print(f"Warning: Failed to load solved problems from {summary_path}: {exc}", flush=True)
    
    return results


def read_prompt_template() -> str:
    """Read the prompt template file."""
    if not PROMPT_PATH.exists():
        raise FileNotFoundError(f"Prompt template missing: {PROMPT_PATH}")
    return PROMPT_PATH.read_text(encoding="utf-8")


def determine_model_family(model_path: str, requested_family: str) -> str:
    """Determine model family from model path."""
    if requested_family != "auto":
        return requested_family
    lowered = model_path.lower()
    for model_type, model_family in MODEL_FAMILY_MAP.items():
        if model_type in lowered:
            return model_family
    return "mistral"


def load_llm_model(model_path: str, family: str):
    """Load LLM model using unsloth FastLanguageModel with error handling."""
    try:
        model, tokenizer = FastLanguageModel.from_pretrained(
            model_name=model_path,
            max_seq_length=max_seq_length,
            dtype=dtype,
            load_in_4bit=load_in_4bit,
        )
    except ValueError as e:
        if "GPU RAM" in str(e):
            print("GPU RAM insufficient, trying with CPU offload...")
            try:
                model, tokenizer = FastLanguageModel.from_pretrained(
                    model_name=model_path,
                    max_seq_length=max_seq_length,
                    dtype=dtype,
                    load_in_4bit=load_in_4bit,
                    llm_int8_enable_fp32_cpu_offload=True,
                    device_map="auto"
                )
            except Exception as e2:
                print("CPU offload failed, trying 8-bit quantization...")
                model, tokenizer = FastLanguageModel.from_pretrained(
                    model_name=model_path,
                    max_seq_length=max_seq_length,
                    dtype=dtype,
                    load_in_8bit=True,
                    device_map="auto"
                )
        else:
            raise e
    FastLanguageModel.for_inference(model)
    return model, tokenizer


def build_llm_prompt(prompt_template: str, domain_content: str, problem_content: str) -> str:
    """Build LLM prompt from template and problem."""
    return prompt_template.format(domain_content=domain_content, problem_content=problem_content)


def validate_plan_with_val(domain: Path, problem: Path, plan_path: Path) -> Tuple[str, str]:
    """Validate a plan using VAL."""
    proc = subprocess.run(
        [str(VALIDATOR), str(domain), str(problem), str(plan_path)],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        check=False,
    )
    if proc.returncode == 0:
        return "valid", ""
    stderr_txt = to_text(proc.stderr).strip()
    stdout_txt = to_text(proc.stdout).strip()
    return "invalid", stderr_txt or stdout_txt


def solve_with_llm(
    benchmark_dir: Path,
    generated: Dict[str, List[Path]],
    model_path: str,
    family: str,
    max_new_tokens: int,
    hardest_only: bool,
    incremental_write: bool = True,
    results_csv: Optional[Path] = None,
    skip_solved: bool = False,
    cache: Optional[Dict[str, Dict[str, Any]]] = None,
    cache_path: Optional[Path] = None,
    check_summary: bool = True,
) -> Dict[Tuple[str, str], SolverOutcome]:
    """Solve problems using LLM solver.
    
    Args:
        benchmark_dir: Directory containing benchmark problems
        generated: Dictionary mapping scenario names to lists of problem paths
        model_path: Path to LLM model
        family: Model family for tokenizer templating
        max_new_tokens: Maximum number of tokens to generate
        hardest_only: Whether to only solve the hardest problem per scenario
        incremental_write: Whether to write results incrementally after each scenario
        results_csv: Path to CSV file for results (optional)
        skip_solved: Whether to skip problems with valid cached results
        cache: Solver cache dictionary
        cache_path: Path to cache file
        check_summary: Whether to check llm_summary.json for existing results and skip them
    """
    if not HAVE_LLM:
        raise RuntimeError("LLM dependencies are unavailable; install requirements to enable this feature.")

    results: Dict[Tuple[str, str], SolverOutcome] = {}
    
    # Load existing results from summary if requested
    existing_summary: Dict[Tuple[str, str], SolverOutcome] = {}
    if check_summary:
        existing_summary = load_solved_from_summary(benchmark_dir, generated)
        if existing_summary:
            print(f"Loaded {len(existing_summary)} existing results from llm_summary.json", flush=True)
    
    if incremental_write and results_csv is None:
        results_csv = benchmark_dir / "llm_results.csv"
        if results_csv.exists():
            results_csv.unlink()

    llm_cache: Dict[str, Any] = {}
    if cache is not None:
        llm_cache = cache.setdefault("llm", {})
    
    # Load model only if we have problems to solve (not all from summary)
    need_model = False
    for scenario, paths in generated.items():
        for problem in paths:
            key = (scenario, problem.name)
            if key not in existing_summary:
                need_model = True
                break
        if need_model:
            break
    
    if need_model:
        prompt_template = read_prompt_template()
        model_family = determine_model_family(model_path, family)
        model, tokenizer = load_llm_model(model_path, model_family)
    else:
        prompt_template = ""
        model = None
        tokenizer = None
        model_family = ""  # Set a default value
        print("[LLM] All problems already solved (from summary), skipping model loading.", flush=True)

    for scenario, problem_paths in generated.items():
        domain_path = DOMAIN_PATHS.get(scenario)
        if not domain_path or not domain_path.exists():
            raise FileNotFoundError(f"Domain missing for {scenario}: {domain_path}")
        domain_content = domain_path.read_text(encoding="utf-8")

        results_dir = benchmark_dir / scenario / LLM_RESULTS_DIRNAME
        if results_dir.exists():
            if not skip_solved:
                shutil.rmtree(results_dir)
        if not results_dir.exists():
            results_dir.mkdir(parents=True, exist_ok=True)

        selected_paths = list(problem_paths)
        if scenario == "blocksworld":
            def blocksworld_sort_key(candidate: Path) -> Tuple[int, int, int, int, int, int]:
                param = extract_parameter_value(scenario, candidate)
                complexity = problem_complexity(candidate)
                return (
                    param if param is not None else sys.maxsize,
                    complexity[0],
                    complexity[1],
                    complexity[2],
                    complexity[3],
                    complexity[4],
                )

            selected_paths.sort(key=blocksworld_sort_key)
        elif hardest_only and problem_paths:
            best_path: Optional[Path] = None
            best_key: Optional[Tuple[int, int, int, int, int, int]] = None
            for candidate in problem_paths:
                param = extract_parameter_value(scenario, candidate)
                complexity = problem_complexity(candidate)
                key = (
                    param if param is not None else -1,
                    complexity[0],
                    complexity[1],
                    complexity[2],
                    complexity[3],
                    complexity[4],
                )
                if best_key is None or key > best_key:
                    best_key = key
                    best_path = candidate
            selected_paths = [best_path] if best_path else []

        scenario_success = 0
        scenario_elapsed: List[float] = []
        scenario_cache_modified = False
        
        # Filter out problems that already have results in summary
        problems_to_solve: List[Path] = []
        problems_with_cache: List[Tuple[Path, SolverOutcome]] = []
        
        for problem_path in selected_paths:
            key = (scenario, problem_path.name)
            if key in existing_summary:
                # Problem already has result in summary, skip solving and use existing result
                existing_outcome = existing_summary[key]
                results[key] = existing_outcome
                
                # Update cache with existing result for future use
                if cache is not None:
                    cache_key = f"{scenario}/{problem_path.name}"
                    llm_cache = cache.setdefault("llm", {})
                    llm_cache[cache_key] = outcome_to_cache_dict(existing_outcome, problem_path)
                    scenario_cache_modified = True
                
                # Update success statistics
                if existing_outcome.validation == "valid":
                    scenario_success += 1
                    if existing_outcome.elapsed_seconds is not None:
                        scenario_elapsed.append(existing_outcome.elapsed_seconds)
                
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
                    f"[LLM] {scenario}: {problem_path.name} [from summary, skipped] -> "
                    f"{elapsed_str} - {status_str}{validation_str}",
                    flush=True,
                )
            else:
                # Check cache
                cache_key = f"{scenario}/{problem_path.name}"
                cached_entry = llm_cache.get(cache_key) if (skip_solved and llm_cache) else None
                if skip_solved and cached_entry and cached_entry.get("validation") == "valid":
                    cached_outcome = cache_dict_to_outcome(cached_entry)
                    plan_path = cached_outcome.plan_path
                    if plan_path and plan_path.exists():
                        problems_with_cache.append((problem_path, cached_outcome))
                    else:
                        problems_to_solve.append(problem_path)
                else:
                    problems_to_solve.append(problem_path)
        
        # Add cached problems to results
        for problem_path, cached_outcome in problems_with_cache:
            key = (scenario, problem_path.name)
            results[key] = cached_outcome
            if cached_outcome.validation == "valid":
                scenario_success += 1
                if cached_outcome.elapsed_seconds is not None:
                    scenario_elapsed.append(cached_outcome.elapsed_seconds)
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
                f"[LLM] {scenario}: {problem_path.name} [cached] -> "
                f"{elapsed_str} - {status_str}{validation_str}",
                flush=True,
            )
        
        if not problems_to_solve:
            total_skipped = len(selected_paths) - len(problems_with_cache)
            if total_skipped > 0:
                print(f"[LLM] {scenario}: All problems already solved (from summary/cache), skipping.", flush=True)
        else:
            print(f"[LLM] {scenario}: {len(problems_to_solve)} problems to solve (skipped {len(selected_paths) - len(problems_to_solve)} from summary/cache)", flush=True)

        for idx, problem_path in enumerate(problems_to_solve, start=1):
            print(f"[LLM] {scenario} ({idx}/{len(problems_to_solve)}): {problem_path.name}", flush=True)
            
            if model is None or tokenizer is None:
                raise RuntimeError("Model not loaded but problems need solving. This should not happen.")

            problem_content = problem_path.read_text(encoding="utf-8")
            prompt = build_llm_prompt(prompt_template, domain_content, problem_content)

            cfg = {
                "do_sample": True,
                "temperature": 0.1,
                "top_p": 0.9,
            }

            plan_path = results_dir / f"{problem_path.stem}.plan"
            notes = ""
            status = "generated"
            elapsed: Optional[float] = None
            raw_output = ""
            llm_output = ""

            start = time.perf_counter()
            try:
                try:
                    inputs = tokenizer.apply_chat_template(
                        template_input(prompt),
                        tokenize=True,
                        add_generation_prompt=True,
                        return_tensors="pt",
                        enable_thinking=False,
                    )
                except (TypeError, AttributeError, ValueError):
                    try:
                        inputs = tokenizer.apply_chat_template(
                            template_input(prompt, rich=True),
                            tokenize=True,
                            add_generation_prompt=True,
                            return_tensors="pt",
                            enable_thinking=False,
                        )
                    except Exception:
                        inputs = tokenizer(prompt, return_tensors="pt", padding=True, truncation=True, max_length=max_seq_length)
                        inputs = inputs["input_ids"]
                
                device = getattr(model, "device", None)
                if device is None:
                    try:
                        device = next(model.parameters()).device
                    except StopIteration:
                        device = None
                if device is not None:
                    inputs = inputs.to(device)

                pad_token_id = tokenizer.pad_token_id
                if pad_token_id is None:
                    pad_token_id = tokenizer.eos_token_id
                
                generation = model.generate(
                    input_ids=inputs,
                    max_new_tokens=max_new_tokens,
                    pad_token_id=pad_token_id,
                    **cfg
                )
                raw_output = tokenizer.batch_decode(generation, skip_special_tokens=False)[0]
                llm_output = extract_llm_output(raw_output, model_family)
            except torch.cuda.OutOfMemoryError as exc:
                torch.cuda.empty_cache()
                status = "generation_error"
                notes = f"CUDA OOM: {exc}"
            except RuntimeError as exc:
                if "out of memory" in str(exc).lower():
                    torch.cuda.empty_cache()
                status = "generation_error"
                notes = f"Runtime error: {exc}"
            except Exception as exc:  # noqa: BLE001
                status = "generation_error"
                notes = f"Generation error: {exc}"
            finally:
                elapsed = time.perf_counter() - start

            plan_path.write_text(llm_output, encoding="utf-8")

            validation = ""
            if status == "generation_error":
                validation = ""
            elif not llm_output.strip():
                status = "empty"
                validation = ""
            else:
                val_status, val_notes = validate_plan_with_val(domain_path, problem_path, plan_path)
                validation = val_status
                if val_status != "valid":
                    status = "invalid"
                    if val_notes:
                        notes = val_notes
                else:
                    scenario_success += 1
                    if elapsed is not None:
                        scenario_elapsed.append(elapsed)

            outcome = SolverOutcome(
                status=status,
                validation=validation,
                elapsed_seconds=elapsed,
                plan_path=plan_path,
                notes=notes if notes else raw_output[:500],
            )
            results[(scenario, problem_path.name)] = outcome

            if cache is not None:
                cache_key = f"{scenario}/{problem_path.name}"
                llm_cache[cache_key] = outcome_to_cache_dict(outcome, problem_path)
                scenario_cache_modified = True

        if scenario == "blocksworld":
            success_rate = (scenario_success / len(selected_paths) * 100.0) if selected_paths else 0.0
            avg_elapsed = mean(scenario_elapsed) if scenario_elapsed else None
            if avg_elapsed is not None:
                avg_message = f"{avg_elapsed:.3f}s"
            else:
                avg_message = "N/A"
            print(
                "[LLM][blocksworld] Solved "
                f"{scenario_success}/{len(selected_paths)} problems "
                f"({success_rate:.2f}% success rate), avg time {avg_message}",
                flush=True,
            )
        
        # Save cache after scenario
        if scenario_cache_modified and cache is not None and cache_path is not None:
            save_solver_cache(cache_path, cache)

        if incremental_write and results_csv is not None:
            # Include all problems (both from summary and newly solved) in CSV
            all_scenario_results = {k: v for k, v in results.items() if k[0] == scenario}
            append_llm_scenario_results(scenario, selected_paths, all_scenario_results, results_csv)
            print(f"[LLM] Results for {scenario} written to {results_csv}", flush=True)

    return results


def append_llm_scenario_results(
    scenario: str,
    problem_paths: List[Path],
    llm_results: Dict[Tuple[str, str], SolverOutcome],
    results_csv: Path,
) -> None:
    """Append LLM results for a single scenario to CSV file."""
    fieldnames = [
        "scenario",
        "problem",
        "llm_status",
        "llm_validation",
        "llm_elapsed",
        "llm_plan_path",
        "llm_notes",
    ]

    file_exists = results_csv.exists()
    
    with results_csv.open("a", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=fieldnames)
        
        if not file_exists:
            writer.writeheader()

        for problem_path in problem_paths:
            key = (scenario, problem_path.name)
            llm_out = llm_results.get(key, SolverOutcome())
            
            llm_plan_path = ""
            if llm_out.plan_path and llm_out.plan_path.exists():
                try:
                    llm_plan_path = str(llm_out.plan_path.resolve().relative_to(WORKSPACE_ROOT))
                except ValueError:
                    llm_plan_path = str(llm_out.plan_path.resolve())
            
            writer.writerow({
                "scenario": scenario,
                "problem": problem_path.name,
                "llm_status": llm_out.status,
                "llm_validation": llm_out.validation,
                "llm_elapsed": format_elapsed(llm_out),
                "llm_plan_path": llm_plan_path,
                "llm_notes": llm_out.notes or "",
            })


def write_llm_results(
    generated: Dict[str, List[Path]],
    llm_results: Dict[Tuple[str, str], SolverOutcome],
    results_csv: Path,
) -> None:
    """Write all LLM results to CSV file."""
    fieldnames = [
        "scenario",
        "problem",
        "llm_status",
        "llm_validation",
        "llm_elapsed",
        "llm_plan_path",
        "llm_notes",
    ]

    with results_csv.open("w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=fieldnames)
        writer.writeheader()

        for scenario, problems in generated.items():
            for problem_path in problems:
                key = (scenario, problem_path.name)
                llm_out = llm_results.get(key, SolverOutcome())
                
                llm_plan_path = ""
                if llm_out.plan_path and llm_out.plan_path.exists():
                    try:
                        llm_plan_path = str(llm_out.plan_path.resolve().relative_to(WORKSPACE_ROOT))
                    except ValueError:
                        llm_plan_path = str(llm_out.plan_path.resolve())
                
                writer.writerow({
                    "scenario": scenario,
                    "problem": problem_path.name,
                    "llm_status": llm_out.status,
                    "llm_validation": llm_out.validation,
                    "llm_elapsed": format_elapsed(llm_out),
                    "llm_plan_path": llm_plan_path,
                    "llm_notes": llm_out.notes or "",
                })


def main():
    """Command-line interface for LLM solver."""
    import argparse
    from benchmark_common import PROJECT_ROOT, CACHE_FILENAME
    from benchmark_common import ensure_binaries, load_solver_cache, save_solver_cache
    from generate_benchmark_problems import load_existing_problems
    from solve_results import compute_solver_summary, write_summary_csv, write_summary_json
    
    parser = argparse.ArgumentParser(description="Solve benchmark problems using LLM.")
    parser.add_argument(
        "--benchmark-dir",
        type=Path,
        default=PROJECT_ROOT / "benchmark_problems",
        help="Directory containing benchmark problems.",
    )
    parser.add_argument(
        "--llm-model",
        type=str,
        default="unsloth/gpt-oss-20b-unsloth-bnb-4bit",
        help="LLM model to use.",
    )
    parser.add_argument(
        "--llm-family",
        type=str,
        default="gpt",
        choices=["auto", "mistral", "llama", "phi", "qwen", "gemma", "gpt"],
        help="Model family for tokenizer templating.",
    )
    parser.add_argument(
        "--llm-max-new-tokens",
        type=int,
        default=MAX_NEW_TOKENS if HAVE_LLM else 8000,
        help="Maximum number of tokens generated by the LLM solver.",
    )
    parser.add_argument(
        "--llm-hardest-only",
        action="store_true",
        help="Only run the LLM solver on the hardest problem per scenario.",
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
        help="Limit to this many instances per parameter value when loading problems. "
             "If not specified, will try to read from llm_summary.json, otherwise defaults to 1.",
    )
    parser.add_argument(
        "--check-summary",
        action="store_true",
        default=True,
        help="Check llm_summary.json for existing results and skip them (default: True).",
    )
    parser.add_argument(
        "--no-check-summary",
        dest="check_summary",
        action="store_false",
        help="Do not check llm_summary.json for existing results.",
    )
    
    args = parser.parse_args()
    
    if not HAVE_LLM:
        print("Error: LLM dependencies are unavailable.", file=sys.stderr)
        sys.exit(1)
    
    # Check required binaries
    ensure_binaries(check_optic=False, check_validator=True)
    
    # Load cache
    cache_path = args.benchmark_dir / CACHE_FILENAME
    cache = load_solver_cache(cache_path)
    
    # Determine instances_per_parameter: use argument if provided, otherwise try to infer from summary
    instances_per_parameter = args.instances_per_parameter
    if instances_per_parameter is None:
        # Try to infer from llm_summary.json by checking actual problem counts per parameter
        llm_summary_path = args.benchmark_dir / "llm_summary.json"
        if llm_summary_path.exists():
            try:
                with llm_summary_path.open("r", encoding="utf-8") as fh:
                    summary_data = json.load(fh)
                
                # First, try to read from parameters section
                params = summary_data.get("parameters", {})
                instances_from_params = params.get("instances_per_parameter")
                
                # Second, infer from actual problem counts in scenarios
                scenarios = summary_data.get("scenarios", {})
                inferred_instances = None
                for scenario_name, scenario_data in scenarios.items():
                    if not isinstance(scenario_data, dict):
                        continue
                    problems = scenario_data.get("problems", [])
                    if not isinstance(problems, list) or not problems:
                        continue
                    
                    # Count problems per parameter value
                    from benchmark_common import extract_parameter_value
                    param_counts: Dict[int, int] = {}
                    for problem in problems:
                        if not isinstance(problem, dict):
                            continue
                        # Check if problem has LLM results
                        llm_data = problem.get("llm")
                        if llm_data is None or not isinstance(llm_data, dict):
                            continue
                        if llm_data.get("elapsed_seconds") is None:
                            continue
                        
                        # Extract parameter value from problem name
                        problem_name = problem.get("problem", "")
                        if problem_name:
                            problem_path = args.benchmark_dir / scenario_name / problem_name
                            if problem_path.exists():
                                param = extract_parameter_value(scenario_name, problem_path)
                                if param is not None:
                                    param_counts[param] = param_counts.get(param, 0) + 1
                    
                    # Find the maximum count per parameter (should be consistent)
                    if param_counts:
                        max_count = max(param_counts.values())
                        if inferred_instances is None:
                            inferred_instances = max_count
                        else:
                            # Use the minimum to be conservative
                            inferred_instances = min(inferred_instances, max_count)
                
                # Prefer inferred value if it's different from params (params might be outdated)
                if inferred_instances is not None:
                    instances_per_parameter = inferred_instances
                    if instances_from_params is not None and instances_from_params != inferred_instances:
                        print(f"Note: llm_summary.json parameters section says instances_per_parameter={instances_from_params}, "
                              f"but actual data shows {inferred_instances} problem(s) per parameter. Using {inferred_instances}.", flush=True)
                    else:
                        print(f"Using instances_per_parameter={instances_per_parameter} inferred from llm_summary.json", flush=True)
                elif instances_from_params is not None:
                    instances_per_parameter = instances_from_params
                    print(f"Using instances_per_parameter={instances_per_parameter} from llm_summary.json", flush=True)
            except Exception as exc:
                print(f"Warning: Failed to read instances_per_parameter from {llm_summary_path}: {exc}", flush=True)
        
        # If still None, default to 1
        if instances_per_parameter is None:
            instances_per_parameter = 1
            print(f"Using default instances_per_parameter={instances_per_parameter}", flush=True)
    
    # Load existing problems
    print("Loading existing problems...", flush=True)
    generated = load_existing_problems(
        args.benchmark_dir,
        instances_per_parameter=instances_per_parameter,
    )
    total_problems = sum(len(problems) for problems in generated.values())
    if total_problems == 0:
        print(f"Error: No problems found in {args.benchmark_dir}", file=sys.stderr)
        sys.exit(1)
    
    print(f"Loaded {total_problems} problems across {len(generated)} scenarios.")
    
    # Run LLM solver
    llm_csv = args.benchmark_dir / "llm_results.csv"
    llm_results = solve_with_llm(
        args.benchmark_dir,
        generated,
        args.llm_model,
        args.llm_family,
        args.llm_max_new_tokens,
        args.llm_hardest_only,
        incremental_write=True,
        results_csv=llm_csv,
        skip_solved=args.skip_solved,
        cache=cache,
        cache_path=cache_path,
        check_summary=args.check_summary,
    )
    
    # Write summary
    llm_summary = compute_solver_summary(generated, llm_results, only_present=True)
    write_summary_csv(args.benchmark_dir, {}, llm_summary)
    print(f"Summary written to: {args.benchmark_dir / 'solver_summary.csv'}")
    
    write_summary_json(
        args.benchmark_dir,
        generated,
        {},
        llm_results,
        {},
        llm_summary,
        instances_per_parameter,
        0,
        100.0,  # time_limit (not applicable for LLM)
        args.llm_model,
        args.llm_family,
        args.llm_max_new_tokens,
        args.llm_hardest_only,
        "llm_summary.json",
    )
    print(f"LLM JSON summary written to: {args.benchmark_dir / 'llm_summary.json'}")
    
    if cache is not None:
        save_solver_cache(cache_path, cache)
    
    print("LLM solving completed.")


if __name__ == "__main__":
    import sys
    main()

