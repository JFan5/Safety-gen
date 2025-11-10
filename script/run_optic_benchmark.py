#!/usr/bin/env python3
"""
Benchmark OPTIC against an LLM solver on automatically generated problem suites.
"""
import argparse
import csv
import json
import re
import shutil
import subprocess
import sys
import time
from dataclasses import dataclass
from pathlib import Path
from statistics import mean
from typing import Callable, Dict, Iterable, List, Optional, Tuple, Union

from math import ceil

import random

PROJECT_ROOT = Path(__file__).resolve().parents[1]
WORKSPACE_ROOT = Path(__file__).resolve().parents[2]
OPTIC = WORKSPACE_ROOT / "optic" / "release" / "optic" / "optic-clp"
VALIDATOR = WORKSPACE_ROOT / "VAL" / "build" / "linux64" / "debug" / "bin" / "Validate"
PROMPT_PATH = PROJECT_ROOT / "prompt.txt"

SCENARIOS: Tuple[str, ...] = (
    "blocksworld",
    "grippers",
    "ferry",
    "grid",
    "delivery",
)

DOMAIN_PATHS: Dict[str, Path] = {
    name: PROJECT_ROOT / name / "domain3.pddl" for name in SCENARIOS
}

DEFAULT_PROBLEM_COUNT = 0  # 0 means no upper limit (use all parameter levels)
DEFAULT_TIME_LIMIT = 100
OPTIC_RESULTS_DIRNAME = "optic_results"
LLM_RESULTS_DIRNAME = "llm_results"
DEFAULT_INSTANCES_PER_PARAMETER = 2

try:
    from evaluate_llm_solver import (  # type: ignore
        FastLanguageModel,
        MODEL_FAMILY_MAP,
        MAX_NEW_TOKENS,
        dtype,
        load_in_4bit,
        max_seq_length,
        template_input,
        extract_llm_output,
    )
    import torch  # type: ignore

    HAVE_LLM = True
except Exception:
    HAVE_LLM = False


@dataclass
class SolverOutcome:
    status: str = "unknown"
    validation: str = ""
    elapsed_seconds: Optional[float] = None
    plan_path: Optional[Path] = None
    log_path: Optional[Path] = None
    notes: str = ""

def to_text(value: Optional[Union[str, bytes]]) -> str:
    if value is None:
        return ""
    if isinstance(value, bytes):
        return value.decode("utf-8", errors="ignore")
    return value


def path_to_workspace_str(path: Optional[Path]) -> Optional[str]:
    if not path or not path.exists():
        return None
    try:
        return str(path.resolve().relative_to(WORKSPACE_ROOT))
    except ValueError:
        return str(path.resolve())


def run_command(cmd: List[str], cwd: Optional[Path] = None, timeout: Optional[int] = None) -> subprocess.CompletedProcess:
    return subprocess.run(
        cmd,
        cwd=str(cwd) if cwd else None,
        check=True,
        capture_output=True,
        text=True,
        timeout=timeout,
    )


def write_problem_file(dest_dir: Path, filename: str, content: str) -> Path:
    dest_dir.mkdir(parents=True, exist_ok=True)
    path = dest_dir / filename
    path.write_text(content, encoding="utf-8")
    return path


# --- Scenario-specific generation helpers -------------------------------------------------------

BLOCKSWORLD_DIR = PROJECT_ROOT / "blocksworld"
FERRY_DIR = PROJECT_ROOT / "ferry"
GRIPPERS_DIR = PROJECT_ROOT / "grippers"
DELIVERY_DIR = PROJECT_ROOT / "delivery"
SPANNER_DIR = PROJECT_ROOT / "spanner"

_blocksworld_ready = False
_ferry_ready = False
_grippers_ready = False
_delivery_ready = False


def ensure_blocksworld_ready() -> None:
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
    global _ferry_ready
    if _ferry_ready:
        return
    ferry_bin = FERRY_DIR / "ferry"
    if not ferry_bin.exists():
        run_command(["make"], cwd=FERRY_DIR)
    _ferry_ready = True


def ensure_grippers_ready() -> None:
    global _grippers_ready
    if _grippers_ready:
        return
    binary = GRIPPERS_DIR / "grippers"
    if not binary.exists():
        run_command(["make", "grippers"], cwd=GRIPPERS_DIR)
    _grippers_ready = True


def ensure_delivery_ready() -> None:
    global _delivery_ready
    if _delivery_ready:
        return
    binary = DELIVERY_DIR / "delivery"
    if not binary.exists():
        run_command(["make"], cwd=DELIVERY_DIR)
    _delivery_ready = True


def generate_blocksworld(parameter: int, instance_idx: int, dest_dir: Path) -> Path:
    ensure_blocksworld_ready()
    ops = 3
    seed = parameter * 1000 + (instance_idx + 1)
    script = BLOCKSWORLD_DIR / "blocksworld"
    result = run_command([str(script), str(ops), str(parameter), str(seed)], cwd=BLOCKSWORLD_DIR)
    filename = f"bw_ops{ops}_n{parameter:02d}_seed{seed}.pddl"
    return write_problem_file(dest_dir, filename, result.stdout)


def generate_ferry(parameter: int, instance_idx: int, dest_dir: Path) -> Path:
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
    ensure_delivery_ready()
    waypoints = max(3, parameter)
    rovers = max(1, min(6, waypoints // 6 + 1))
    objectives = max(1, min(8, waypoints // 2))
    cameras = max(1, min(5, objectives))
    goals = max(1, min(objectives, waypoints // 3 + 1))
    seed = parameter * 1000 + (instance_idx + 1)
    binary = DELIVERY_DIR / "delivery"
    result = run_command(
        [
            str(binary),
            str(seed),
            str(rovers),
            str(waypoints),
            str(objectives),
            str(cameras),
            str(goals),
        ],
        cwd=DELIVERY_DIR,
    )
    filename = (
        f"delivery_waypoint{waypoints}_rovers{rovers}_objective{objectives}_"
        f"camera{cameras}_goal{goals}_seed{seed}.pddl"
    )
    return write_problem_file(dest_dir, filename, result.stdout)


def generate_spanner(parameter: int, instance_idx: int, dest_dir: Path) -> Path:
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
    "blocksworld": list(range(3, 31)),
    "ferry": list(range(3, 31)),
    "grippers": list(range(3, 31)),
    "grid": list(range(3, 31)),
    "delivery": list(range(3, 31)),
    "spanner": list(range(3, 31)),
}

SCENARIO_GENERATORS: Dict[str, Callable[[int, int, Path], Path]] = {
    "blocksworld": generate_blocksworld,
    "ferry": generate_ferry,
    "grippers": generate_grippers,
    "grid": generate_grid,
    "delivery": generate_delivery,
    "spanner": generate_spanner,
}


def ensure_binaries() -> None:
    if not OPTIC.exists():
        raise FileNotFoundError(f"OPTIC binary missing: {OPTIC}")
    if not VALIDATOR.exists():
        raise FileNotFoundError(f"Validate binary missing: {VALIDATOR}")


def read_prompt_template() -> str:
    if not PROMPT_PATH.exists():
        raise FileNotFoundError(f"Prompt template missing: {PROMPT_PATH}")
    return PROMPT_PATH.read_text(encoding="utf-8")


def count_symbols(section: str) -> int:
    tokens = re.split(r"[\s()]+", section.strip())
    return sum(1 for token in tokens if token and token != "-" and not token.startswith(";"))


def problem_complexity(path: Path) -> Tuple[int, int, int, int, int]:
    try:
        text = path.read_text(encoding="utf-8")
    except Exception:
        return (sys.maxsize, sys.maxsize, sys.maxsize, sys.maxsize, sys.maxsize)

    objects_match = re.search(r"\(:objects\s+(.*?)\)", text, re.DOTALL | re.IGNORECASE)
    init_match = re.search(r"\(:init\s+(.*?)\)\s*\(:", text, re.DOTALL | re.IGNORECASE)
    goal_match = re.search(r"\(:goal\s+(.*?)\)", text, re.DOTALL | re.IGNORECASE)

    object_score = count_symbols(objects_match.group(1)) if objects_match else 0
    init_score = count_symbols(init_match.group(1)) if init_match else 0
    goal_score = count_symbols(goal_match.group(1)) if goal_match else 0
    line_count = text.count("\n") + 1
    char_count = len(text)

    return (object_score, init_score, goal_score, line_count, char_count)


def extract_parameter_value(scenario: str, path: Path) -> Optional[int]:
    name = path.stem
    match: Optional[re.Match[str]] = None
    if scenario == "blocksworld":
        match = re.search(r"n(\d+)", name)
    elif scenario == "grippers":
        match = re.search(r"o(\d+)", name)
        if not match:
            match = re.search(r"n(\d+)", name)
    elif scenario == "ferry":
        match = re.search(r"l(\d+)", name)
    elif scenario == "grid":
        match = re.search(r"x(\d+)", name)
    elif scenario == "delivery":
        match = re.search(r"waypoint(\d+)", name)
    elif scenario == "spanner":
        match = re.search(r"s(\d+)", name)
        if not match:
            match = re.search(r"n(\d+)", name)
    return int(match.group(1)) if match else None


def generate_complex_problems(
    benchmark_dir: Path,
    problems_per_scenario: int,
    instances_per_parameter: int,
) -> Dict[str, List[Path]]:
    generated: Dict[str, List[Path]] = {}
    benchmark_dir.mkdir(parents=True, exist_ok=True)

    for scenario in SCENARIOS:
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


def run_optic_on_problem(
    domain: Path,
    problem: Path,
    plan_path: Path,
    log_path: Path,
    time_limit: float,
) -> SolverOutcome:
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
        stderr_output = to_text(exc.stderr) + "\n[TIMEOUT]"
        status = "timeout"
        plan_path.unlink(missing_ok=True)

    if stderr_output:
        with log_path.open("a", encoding="utf-8") as fh:
            fh.write(stderr_output if stderr_output.endswith("\n") else stderr_output + "\n")

    validation = ""
    notes = ""
    final_plan_path = plan_path

    if status == "solved":
        val_proc = subprocess.run(
            [str(VALIDATOR), str(domain), str(problem), str(plan_path)],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            check=False,
        )
        if val_proc.returncode == 0:
            validation = "valid"
        else:
            validation = "invalid"
            status = "invalid"
            notes = "[VALIDATOR]\n" + (to_text(val_proc.stderr).strip() or to_text(val_proc.stdout).strip())
            invalid_plan = plan_path.with_suffix(".plan.invalid")
            plan_path.rename(invalid_plan)
            final_plan_path = invalid_plan
            with log_path.open("a", encoding="utf-8") as fh:
                val_stdout = to_text(val_proc.stdout).strip()
                val_stderr = to_text(val_proc.stderr).strip()
                if val_stdout:
                    fh.write("[VALIDATOR STDOUT]\n" + val_stdout + "\n")
                if val_stderr:
                    fh.write("[VALIDATOR STDERR]\n" + val_stderr + "\n")

    return SolverOutcome(
        status=status,
        validation=validation,
        elapsed_seconds=elapsed,
        plan_path=final_plan_path if final_plan_path.exists() else None,
        log_path=log_path if log_path.exists() else None,
        notes=notes,
    )


def solve_with_optic(
    benchmark_dir: Path,
    generated: Dict[str, List[Path]],
    time_limit: float,
) -> Dict[Tuple[str, str], SolverOutcome]:
    results: Dict[Tuple[str, str], SolverOutcome] = {}
    for scenario, paths in generated.items():
        domain = DOMAIN_PATHS.get(scenario)
        if not domain or not domain.exists():
            raise FileNotFoundError(f"Domain missing for {scenario}: {domain}")

        output_dir = benchmark_dir / scenario / OPTIC_RESULTS_DIRNAME
        if output_dir.exists():
            shutil.rmtree(output_dir)
        output_dir.mkdir(parents=True, exist_ok=True)

        log_dir = output_dir / "logs"
        log_dir.mkdir(exist_ok=True)

        for idx, problem in enumerate(paths, start=1):
            print(f"[OPTIC] {scenario} ({idx}/{len(paths)}): {problem.name}", flush=True)
            plan_path = output_dir / f"{problem.stem}.plan"
            log_path = log_dir / f"{problem.stem}.stderr"
            outcome = run_optic_on_problem(domain, problem, plan_path, log_path, time_limit)
            results[(scenario, problem.name)] = outcome

    return results


def determine_model_family(model_path: str, requested_family: str) -> str:
    if requested_family != "auto":
        return requested_family
    lowered = model_path.lower()
    for model_type, model_family in MODEL_FAMILY_MAP.items():
        if model_type in lowered:
            return model_family
    return "mistral"


def load_llm_model(model_path: str, family: str):
    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=model_path,
        max_seq_length=max_seq_length,
        dtype=dtype,
        load_in_4bit=load_in_4bit,
    )
    FastLanguageModel.for_inference(model)
    return model, tokenizer


def build_llm_prompt(prompt_template: str, domain_content: str, problem_content: str) -> str:
    return prompt_template.format(domain_content=domain_content, problem_content=problem_content)


def validate_plan_with_val(domain: Path, problem: Path, plan_path: Path) -> Tuple[str, str]:
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
) -> Dict[Tuple[str, str], SolverOutcome]:
    if not HAVE_LLM:
        raise RuntimeError("LLM dependencies are unavailable; install requirements to enable this feature.")

    prompt_template = read_prompt_template()
    model_family = determine_model_family(model_path, family)
    model, tokenizer = load_llm_model(model_path, model_family)

    results: Dict[Tuple[str, str], SolverOutcome] = {}

    for scenario, problem_paths in generated.items():
        domain_path = DOMAIN_PATHS.get(scenario)
        if not domain_path or not domain_path.exists():
            raise FileNotFoundError(f"Domain missing for {scenario}: {domain_path}")
        domain_content = domain_path.read_text(encoding="utf-8")

        results_dir = benchmark_dir / scenario / LLM_RESULTS_DIRNAME
        if results_dir.exists():
            shutil.rmtree(results_dir)
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

        for idx, problem_path in enumerate(selected_paths, start=1):
            print(f"[LLM] {scenario} ({idx}/{len(selected_paths)}): {problem_path.name}", flush=True)
            problem_content = problem_path.read_text(encoding="utf-8")
            prompt = build_llm_prompt(prompt_template, domain_content, problem_content)

            cfg = {
                "top_k": random.randint(8, 512),
                "top_p": random.random() * 0.8 + 0.2,
                "temperature": random.random() * 0.8 + 0.2,
                "do_sample": True,
                "penalty_alpha": random.random() * 0.8 + 0.2,
            }

            plan_path = results_dir / f"{problem_path.stem}.plan"
            notes = ""
            status = "generated"
            elapsed: Optional[float] = None
            raw_output = ""
            llm_output = ""

            start = time.perf_counter()
            try:
                inputs = tokenizer.apply_chat_template(
                    template_input(prompt),
                    tokenize=True,
                    add_generation_prompt=True,
                    return_tensors="pt",
                    enable_thinking=False,
                )
                device = getattr(model, "device", None)
                if device is None:
                    try:
                        device = next(model.parameters()).device
                    except StopIteration:
                        device = None
                if device is not None:
                    inputs = inputs.to(device)

                generation = model.generate(input_ids=inputs, max_new_tokens=max_new_tokens, **cfg)
                raw_output = tokenizer.batch_decode(generation)[0]
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

            results[(scenario, problem_path.name)] = SolverOutcome(
                status=status,
                validation=validation,
                elapsed_seconds=elapsed,
                plan_path=plan_path,
                notes=notes if notes else raw_output[:500],
            )

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

    return results


def format_elapsed(outcome: SolverOutcome) -> str:
    if outcome.status == "timeout":
        return "timeout"
    if outcome.elapsed_seconds is None:
        return ""
    return f"{outcome.elapsed_seconds:.3f}"


def merge_results(
    generated: Dict[str, List[Path]],
    optic_results: Dict[Tuple[str, str], SolverOutcome],
    llm_results: Dict[Tuple[str, str], SolverOutcome],
    results_csv: Path,
) -> None:
    fieldnames = [
        "scenario",
        "problem",
        "optic_status",
        "optic_validation",
        "optic_elapsed",
        "optic_plan_path",
        "optic_log_path",
        "optic_notes",
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
                optic_out = optic_results.get(key, SolverOutcome())
                llm_out = llm_results.get(key, SolverOutcome())
                writer.writerow(
                    {
                        "scenario": scenario,
                        "problem": problem_path.name,
                        "optic_status": optic_out.status,
                        "optic_validation": optic_out.validation,
                        "optic_elapsed": format_elapsed(optic_out),
                        "optic_plan_path": str(optic_out.plan_path.resolve().relative_to(WORKSPACE_ROOT))
                        if optic_out.plan_path and optic_out.plan_path.exists()
                        else "",
                        "optic_log_path": str(optic_out.log_path.resolve().relative_to(WORKSPACE_ROOT))
                        if optic_out.log_path and optic_out.log_path.exists()
                        else "",
                        "optic_notes": optic_out.notes,
                        "llm_status": llm_out.status,
                        "llm_validation": llm_out.validation,
                        "llm_elapsed": format_elapsed(llm_out),
                        "llm_plan_path": str(llm_out.plan_path.resolve().relative_to(WORKSPACE_ROOT))
                        if llm_out.plan_path and llm_out.plan_path.exists()
                        else "",
                        "llm_notes": llm_out.notes,
                    }
                )


def _format_rate(numerator: int, denominator: int) -> float:
    return (numerator / denominator * 100.0) if denominator else 0.0


def _format_seconds(value: Optional[float]) -> Optional[float]:
    return round(value, 3) if value is not None else None


def _calculate_metrics(
    scenario: str,
    problems: List[Path],
    results: Dict[Tuple[str, str], SolverOutcome],
    include_missing_as_failure: bool,
) -> Tuple[Dict[str, Union[int, float, Optional[float]]], List[float]]:
    total = len(problems)
    success = 0
    timeout = 0
    failure = 0
    elapsed: List[float] = []

    for problem in problems:
        key = (scenario, problem.name)
        outcome = results.get(key)
        if outcome is None:
            if include_missing_as_failure:
                failure += 1
            continue

        if outcome.validation == "valid":
            success += 1
            if outcome.elapsed_seconds is not None:
                elapsed.append(outcome.elapsed_seconds)
        elif outcome.status == "timeout":
            timeout += 1
        else:
            failure += 1

    metrics: Dict[str, Union[int, float, Optional[float]]] = {
        "total_problems": total,
        "success_count": success,
        "timeout_count": timeout,
        "failure_count": failure if include_missing_as_failure else failure,
        "success_rate_percent": _format_rate(success, total),
        "timeout_rate_percent": _format_rate(timeout, total),
        "failure_rate_percent": _format_rate(failure if include_missing_as_failure else failure, total),
        "avg_elapsed_seconds_success": _format_seconds(mean(elapsed) if elapsed else None),
    }
    return metrics, elapsed


def compute_solver_summary(
    generated: Dict[str, List[Path]],
    results: Dict[Tuple[str, str], SolverOutcome],
    only_present: bool = False,
) -> Dict[str, Dict[str, Union[int, float, Optional[float]]]]:
    summary: Dict[str, Dict[str, Union[int, float, Optional[float]]]] = {}
    total_counts = {
        "total": 0,
        "success": 0,
        "timeout": 0,
        "failure": 0,
        "elapsed": [],  # type: ignore[list-item]
    }

    for scenario, problems in generated.items():
        if only_present:
            considered = [p for p in problems if (scenario, p.name) in results]
        else:
            considered = list(problems)

        metrics, elapsed = _calculate_metrics(
            scenario,
            considered,
            results,
            include_missing_as_failure=not only_present,
        )

        summary[scenario] = metrics

        total_counts["total"] += metrics["total_problems"]  # type: ignore[arg-type]
        total_counts["success"] += metrics["success_count"]  # type: ignore[arg-type]
        total_counts["timeout"] += metrics["timeout_count"]  # type: ignore[arg-type]
        total_counts["failure"] += metrics["failure_count"]  # type: ignore[arg-type]
        total_counts["elapsed"].extend(elapsed)  # type: ignore[arg-type]

    total = total_counts["total"]
    total_metrics: Dict[str, Union[int, float, Optional[float]]] = {
        "total_problems": total,
        "success_count": total_counts["success"],
        "timeout_count": total_counts["timeout"],
        "failure_count": total_counts["failure"],
        "success_rate_percent": _format_rate(total_counts["success"], total),
        "timeout_rate_percent": _format_rate(total_counts["timeout"], total),
        "failure_rate_percent": _format_rate(total_counts["failure"], total),
        "avg_elapsed_seconds_success": _format_seconds(
            mean(total_counts["elapsed"]) if total_counts["elapsed"] else None
        ),
    }
    summary["ALL"] = total_metrics
    return summary


def _summary_to_csv_rows(
    solver_name: str, summary: Dict[str, Dict[str, Union[int, float, Optional[float]]]]
) -> List[Dict[str, str]]:
    rows: List[Dict[str, str]] = []
    for scenario, metrics in summary.items():
        rows.append(
            {
                "solver": solver_name,
                "scenario": scenario,
                "total_problems": str(metrics["total_problems"]),
                "success_count": str(metrics["success_count"]),
                "success_rate_percent": f"{metrics['success_rate_percent']:.2f}",
                "timeout_count": str(metrics["timeout_count"]),
                "timeout_rate_percent": f"{metrics['timeout_rate_percent']:.2f}",
                "failure_count": str(metrics["failure_count"]),
                "failure_rate_percent": f"{metrics['failure_rate_percent']:.2f}",
                "avg_elapsed_seconds_success": (
                    f"{metrics['avg_elapsed_seconds_success']:.3f}"
                    if metrics["avg_elapsed_seconds_success"] is not None
                    else ""
                ),
            }
        )
    return rows


def write_summary_csv(
    benchmark_dir: Path,
    optic_summary: Dict[str, Dict[str, Union[int, float, Optional[float]]]],
    llm_summary: Optional[Dict[str, Dict[str, Union[int, float, Optional[float]]]]],
) -> None:
    summary_path = benchmark_dir / "solver_summary.csv"
    fieldnames = [
        "solver",
        "scenario",
        "total_problems",
        "success_count",
        "success_rate_percent",
        "timeout_count",
        "timeout_rate_percent",
        "failure_count",
        "failure_rate_percent",
        "avg_elapsed_seconds_success",
    ]

    rows: List[Dict[str, str]] = []
    rows.extend(_summary_to_csv_rows("optic", optic_summary))
    if llm_summary:
        rows.extend(_summary_to_csv_rows("llm", llm_summary))

    with summary_path.open("w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def outcome_to_json(outcome: Optional[SolverOutcome]) -> Optional[Dict[str, Union[str, float, None]]]:
    if outcome is None:
        return None
    return {
        "status": outcome.status,
        "validation": outcome.validation,
        "elapsed_seconds": _format_seconds(outcome.elapsed_seconds),
        "plan_path": path_to_workspace_str(outcome.plan_path),
        "log_path": path_to_workspace_str(outcome.log_path),
        "notes": outcome.notes or "",
    }


def write_summary_json(
    benchmark_dir: Path,
    generated: Dict[str, List[Path]],
    optic_results: Dict[Tuple[str, str], SolverOutcome],
    llm_results: Dict[Tuple[str, str], SolverOutcome],
    optic_summary: Dict[str, Dict[str, Union[int, float, Optional[float]]]],
    llm_summary: Optional[Dict[str, Dict[str, Union[int, float, Optional[float]]]]],
    args: argparse.Namespace,
) -> None:
    summary_path = benchmark_dir / "solver_summary.json"
    data: Dict[str, Union[str, float, Dict[str, Dict[str, Union[int, float, Optional[float], list]]]]] = {}

    scenarios_data: Dict[str, Dict[str, Union[List[Dict[str, Union[str, int, None, Dict[str, Union[str, float, None]]]]], Dict[str, Union[int, float, Optional[float]]], None]]] = {}

    for scenario, problems in generated.items():
        problems_info: List[Dict[str, Union[str, int, None, Dict[str, Union[str, float, None]]]]] = []
        for problem in problems:
            key = (scenario, problem.name)
            problems_info.append(
                {
                    "problem": problem.name,
                    "problem_path": path_to_workspace_str(problem),
                    "parameter_value": extract_parameter_value(scenario, problem),
                    "optic": outcome_to_json(optic_results.get(key)),
                    "llm": outcome_to_json(llm_results.get(key)),
                }
            )

        scenarios_data[scenario] = {
            "problems": problems_info,
            "optic_summary": optic_summary.get(scenario, {}),
            "llm_summary": llm_summary.get(scenario, {}) if llm_summary else None,
        }

    data = {
        "parameters": {
            "instances_per_parameter": args.instances_per_parameter,
            "problems_per_scenario": args.problems_per_scenario,
            "optic_time_limit": args.time_limit,
            "llm_model": args.llm_model,
            "llm_family": args.llm_family,
            "llm_max_new_tokens": args.llm_max_new_tokens,
            "llm_hardest_only": args.llm_hardest_only,
        },
        "scenarios": scenarios_data,
        "optic_summary": optic_summary,
        "llm_summary": llm_summary if llm_summary else None,
    }

    with summary_path.open("w", encoding="utf-8") as fh:
        json.dump(data, fh, indent=2)


def parse_args(argv: Optional[Iterable[str]] = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Run OPTIC and LLM solver benchmarks.")
    parser.add_argument(
        "--benchmark-dir",
        type=Path,
        default=PROJECT_ROOT / "benchmark_problems",
        help="Directory to store generated benchmark problems.",
    )
    parser.add_argument(
        "--problems-per-scenario",
        type=int,
        default=DEFAULT_PROBLEM_COUNT,
        help="Maximum number of problems per scenario (0 means no limit).",
    )
    parser.add_argument(
        "--instances-per-parameter",
        type=int,
        default=DEFAULT_INSTANCES_PER_PARAMETER,
        help="Number of instances to keep for each parameter value (0 means treat all equally).",
    )
    parser.add_argument(
        "--time-limit",
        type=float,
        default=DEFAULT_TIME_LIMIT,
        help="Per-problem time limit (seconds) for OPTIC.",
    )
    parser.add_argument(
        "--results-csv",
        type=Path,
        default=None,
        help="Path for the combined results CSV (defaults to benchmark_dir/solver_comparison.csv).",
    )
    parser.add_argument(
        "--llm-model",
        type=str,
        default=None,
        help="Path or identifier of the LLM model to benchmark.",
    )
    parser.add_argument(
        "--llm-family",
        type=str,
        default="auto",
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
        "--skip-llm",
        action="store_true",
        help="Skip the LLM solver benchmark.",
    )
    parser.add_argument(
        "--llm-hardest-only",
        action="store_true",
        help="Only run the LLM solver on the hardest problem per scenario.",
    )
    return parser.parse_args(argv)


def run(argv: Optional[Iterable[str]] = None) -> None:
    args = parse_args(argv)
    ensure_binaries()

    results_csv = args.results_csv or (args.benchmark_dir / "solver_comparison.csv")

    generated = generate_complex_problems(
        args.benchmark_dir,
        args.problems_per_scenario,
        args.instances_per_parameter,
    )
    optic_results = solve_with_optic(args.benchmark_dir, generated, args.time_limit)

    llm_results: Dict[Tuple[str, str], SolverOutcome] = {}
    if not args.skip_llm:
        if not args.llm_model:
            raise ValueError("LLM model path is required unless --skip-llm is specified.")
        llm_results = solve_with_llm(
            args.benchmark_dir,
            generated,
            args.llm_model,
            args.llm_family,
            args.llm_max_new_tokens,
            args.llm_hardest_only,
        )

    merge_results(generated, optic_results, llm_results, results_csv)
    print(f"Results written to: {results_csv}")
    optic_summary = compute_solver_summary(generated, optic_results, only_present=False)
    llm_summary = (
        compute_solver_summary(generated, llm_results, only_present=True) if llm_results else None
    )
    write_summary_csv(args.benchmark_dir, optic_summary, llm_summary)
    print(f"Summary written to: {args.benchmark_dir / Path('solver_summary.csv')}")
    write_summary_json(
        args.benchmark_dir,
        generated,
        optic_results,
        llm_results,
        optic_summary,
        llm_summary,
        args,
    )
    print(f"JSON summary written to: {args.benchmark_dir / Path('solver_summary.json')}")


def main() -> None:
    try:
        run()
    except Exception as exc:  # noqa: BLE001
        print(exc, file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
