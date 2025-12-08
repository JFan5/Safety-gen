#!/usr/bin/env python3
"""
DPO Dataset Generator for PDDL Tasks

This script generates Direct Preference Optimization (DPO) datasets for PDDL planning tasks.
It creates preference pairs by comparing solutions of different quality scores:
- 100: Classical optimal solution (Ground Truth)
- 80: Logic error (sampled from SFT model)
- 60: Safety constraint violation (from all_problems)
- 40: Precondition violation (sampled from SFT model)
"""

import argparse
import json
import logging
import os
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Tuple
from collections import defaultdict

# Optional imports for model sampling
try:
    import torch
    from vllm import LLM, SamplingParams
    VLLM_AVAILABLE = True
except ImportError:
    VLLM_AVAILABLE = False
    torch = None
    LLM = None
    SamplingParams = None

try:
    from tqdm import tqdm
except ImportError:
    # Fallback if tqdm not available
    def tqdm(iterable, **kwargs):
        return iterable


# ============================================================================
# Configuration
# ============================================================================

SCENARIOS = ['blocksworld', 'grippers', 'spanner', 'ferry']
INPUT_ROOT = Path("/home/ubuntu/Safety-gen/pddl3")
OUTPUT_ROOT = Path("/jfan5/dpo_data-1206")

# Sampling configuration
SAMPLING_CONFIGS = {
    80: {'temperature': 0.7, 'max_retries': 5},
    40: {'temperature': 1.0, 'max_retries': 5}
}

# Logging setup
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


# ============================================================================
# Data Structures
# ============================================================================

@dataclass
class Problem:
    """Represents a PDDL problem instance."""
    scenario: str
    problem_id: str
    problem_text: str
    problem_path: Path


@dataclass
class Solution:
    """Represents a PDDL solution with quality score."""
    text: str
    score: int
    source: str  # 'classical', 'unsafe', 'sampled'


@dataclass
class DPOPair:
    """Represents a DPO training pair."""
    prompt: str
    chosen: str
    rejected: str
    score_diff: str
    scenario: str
    problem_id: str


# ============================================================================
# Verifier (Using VAL Validator)
# ============================================================================

import subprocess
import tempfile
import shutil

def _resolve_validate_path():
    """Find a usable Validate binary."""
    candidates = [
        Path("/users/jfan5/VAL/build/bin/Validate"),
        Path.home() / "VAL/build/linux64/Release/bin/Validate",
        Path.home() / "VAL/build/linux64/debug/bin/Validate",
    ]
    for path in candidates:
        if path.exists():
            return str(path)
    found = shutil.which("Validate")
    if found:
        return found
    return "Validate"


def _classify_result(stdout_text: str) -> str:
    """Classify result based on VAL validation output."""
    text = stdout_text.lower() if stdout_text else ""

    if not text:
        return "plan_format_error"

    # 1) Success
    if "plan valid\n" in text or "successful plans:" in text:
        return "success_plans"

    # 2) Plan format error
    if (
        "bad operator in plan" in text
        or "bad plan description!" in text
        or "no matching action defined" in text
        or "object with unknown type" in text
    ):
        return "plan_format_error"

    # 3) Goal not satisfied
    if "checking goal\ngoal not satisfied" in text:
        return "goal_not_satisfied"

    # 4) Precondition violation
    if "plan failed to execute" in text and "unsatisfied precondition" in text:
        return "precondition_violation"

    # 5) Safety constraints violation (default)
    return "safety_constraints_violation"


def _validate_solution_with_val(domain_file: str, problem_file: str, solution_text: str):
    """使用VAL验证器验证解决方案"""
    # 创建临时文件保存解决方案
    with tempfile.NamedTemporaryFile(mode='w', suffix='.soln', delete=False) as f:
        f.write(solution_text)
        solution_file = f.name

    try:
        # 运行VAL验证器
        val_path = _resolve_validate_path()
        cmd_list = [val_path, "-v", domain_file, problem_file, solution_file]
        result = subprocess.run(cmd_list, capture_output=True, text=True, timeout=30)

        # 返回stdout用于分类
        return result.stdout, result.stderr

    except subprocess.TimeoutExpired:
        return "", "Validation timeout after 30 seconds"
    except Exception as e:
        return "", str(e)
    finally:
        # 清理临时文件
        try:
            os.unlink(solution_file)
        except:
            pass


def verify_plan(problem_file: str, plan_text: str, domain_file: str = None) -> int:
    """
    Verify a PDDL plan using VAL validator and return quality score.

    Args:
        problem_file: Path to the PDDL problem file
        plan_text: The proposed plan/solution
        domain_file: Path to the domain file (optional, will be inferred if not provided)

    Returns:
        int: Quality score
            - 100: Perfect classical solution (valid + optimal + safe)
            - 80: Logic error (goal not satisfied)
            - 60: Safety constraint violation
            - 40: Precondition violation or format error
    """
    if not plan_text or not plan_text.strip():
        return 40  # Empty plan

    # Infer domain file if not provided
    if not domain_file:
        problem_path = Path(problem_file)
        # Try same directory first
        domain_file = str(problem_path.parent / "domain.pddl")
        if not Path(domain_file).exists():
            # Try parent directory
            domain_file = str(problem_path.parent.parent / "domain.pddl")
            if not Path(domain_file).exists():
                logger.warning(f"Domain file not found at {domain_file}, using placeholder scoring")
                return 40

    # Validate with VAL
    stdout, stderr = _validate_solution_with_val(domain_file, problem_file, plan_text)

    # Classify result
    category = _classify_result(stdout)

    # Map category to score
    score_map = {
        "success_plans": 100,
        "goal_not_satisfied": 80,
        "safety_constraints_violation": 60,
        "precondition_violation": 40,
        "plan_format_error": 40,
    }

    score = score_map.get(category, 40)

    if score < 100:
        logger.debug(f"Plan classified as {category}, score: {score}")

    return score


# ============================================================================
# File I/O Functions
# ============================================================================

def find_problem_files(scenario_dir: Path) -> List[Tuple[Path, Path]]:
    """
    Find all problem-solution pairs in a scenario directory.

    Args:
        scenario_dir: Path to scenario directory (e.g., pddl3/blocksworld/grpo_500)

    Returns:
        List of (problem_path, solution_path) tuples
    """
    problem_solution_pairs = []

    # Find all .pddl files (problems)
    pddl_files = sorted(scenario_dir.glob("*.pddl"))

    for pddl_file in pddl_files:
        # Look for corresponding .soln file
        soln_file = pddl_file.with_suffix('.soln')
        if soln_file.exists():
            problem_solution_pairs.append((pddl_file, soln_file))
        else:
            logger.warning(f"No solution file found for {pddl_file}")

    logger.info(f"Found {len(problem_solution_pairs)} problem-solution pairs in {scenario_dir}")
    return problem_solution_pairs


def load_problem(problem_path: Path, scenario: str) -> Problem:
    """Load a PDDL problem from file."""
    with open(problem_path, 'r', encoding='utf-8') as f:
        problem_text = f.read()

    problem_id = problem_path.stem
    return Problem(
        scenario=scenario,
        problem_id=problem_id,
        problem_text=problem_text,
        problem_path=problem_path
    )


def load_classical_solution(solution_path: Path) -> Solution:
    """Load the classical (100-score) solution from file."""
    with open(solution_path, 'r', encoding='utf-8') as f:
        solution_text = f.read()

    return Solution(
        text=solution_text,
        score=100,
        source='classical'
    )


def load_unsafe_solution(problem: Problem) -> Optional[Solution]:
    """
    Load unsafe solution (60-score) from all_problems3 directory.

    This function looks for known safety-violating solutions in the all_problems3
    directory and verifies they actually violate safety constraints.

    Args:
        problem: The Problem instance

    Returns:
        Solution object if found and verified as safety violation, None otherwise
    """
    # Try all_problems3 first (PDDL3 with constraints), then all_problems
    for dirname in ["all_problems3", "all_problems"]:
        all_problems_dir = problem.problem_path.parent.parent / dirname

        if not all_problems_dir.exists():
            continue

        # Look for solution with same name as problem
        solution_path = all_problems_dir / f"{problem.problem_id}.soln"

        if solution_path.exists():
            with open(solution_path, 'r', encoding='utf-8') as f:
                solution_text = f.read()

            # Verify this solution actually violates safety constraints
            score = verify_plan(str(problem.problem_path), solution_text)

            if score == 60:  # Safety constraints violation
                logger.debug(f"Found unsafe solution in {dirname}: {solution_path}")
                return Solution(
                    text=solution_text,
                    score=60,
                    source='unsafe'
                )
            else:
                logger.debug(f"Solution in {dirname} has score {score}, not 60 (expected safety violation)")

    logger.debug(f"No unsafe solution found for {problem.problem_id}")
    return None


# ============================================================================
# Model Sampling Functions
# ============================================================================

def create_prompt_from_problem(problem_text: str) -> str:
    """
    Create a prompt for the SFT model from a PDDL problem.

    TODO: Adjust this based on how your SFT model was trained.
    This is a simple template - modify as needed.
    """
    prompt = f"""You are a PDDL planner. Given the following problem, generate a valid plan.

Problem:
{problem_text}

Plan:
"""
    return prompt


def sample_solutions_with_vllm(
    llm: LLM,
    problems: List[Problem],
    target_score: int,
    max_retries: int = 5
) -> Dict[str, Optional[Solution]]:
    """
    Sample solutions from the SFT model targeting a specific quality score.

    Args:
        llm: vLLM model instance
        problems: List of problems to sample for
        target_score: Target quality score (80 or 40)
        max_retries: Maximum number of sampling attempts per problem

    Returns:
        Dictionary mapping problem_id to Solution (or None if not found)
    """
    config = SAMPLING_CONFIGS[target_score]
    results = {}

    logger.info(f"Sampling solutions for score {target_score} with temperature {config['temperature']}")

    for problem in tqdm(problems, desc=f"Sampling score-{target_score}"):
        found = False

        for attempt in range(max_retries):
            # Create prompt
            prompt = create_prompt_from_problem(problem.problem_text)

            # Sample from model
            sampling_params = SamplingParams(
                temperature=config['temperature'],
                max_tokens=2048,
                top_p=0.95,
                n=1  # Generate 1 sample per call
            )

            outputs = llm.generate([prompt], sampling_params)
            generated_text = outputs[0].outputs[0].text

            # Verify the generated solution
            score = verify_plan(str(problem.problem_path), generated_text)

            if score == target_score:
                results[problem.problem_id] = Solution(
                    text=generated_text,
                    score=target_score,
                    source='sampled'
                )
                found = True
                logger.debug(f"Found score-{target_score} solution for {problem.problem_id} at attempt {attempt + 1}")
                break

        if not found:
            results[problem.problem_id] = None
            logger.debug(f"Could not find score-{target_score} solution for {problem.problem_id} after {max_retries} attempts")

    success_rate = sum(1 for v in results.values() if v is not None) / len(results)
    logger.info(f"Score-{target_score} sampling success rate: {success_rate:.2%}")

    return results


# ============================================================================
# DPO Pair Generation
# ============================================================================

def create_dpo_pairs(
    problem: Problem,
    classical_solution: Solution,
    score_80_solution: Optional[Solution],
    score_60_solution: Optional[Solution],
    score_40_solution: Optional[Solution]
) -> List[DPOPair]:
    """
    Create DPO pairs with priority: 100 vs 80 > 100 vs 60 > 100 vs 40.

    Args:
        problem: The PDDL problem
        classical_solution: The 100-score solution (chosen)
        score_80_solution: Logic error solution (rejected)
        score_60_solution: Safety violation solution (rejected)
        score_40_solution: Precondition violation solution (rejected)

    Returns:
        List of DPOPair objects
    """
    pairs = []
    prompt = create_prompt_from_problem(problem.problem_text)

    # Priority 1: 100 vs 80
    if score_80_solution:
        pairs.append(DPOPair(
            prompt=prompt,
            chosen=classical_solution.text,
            rejected=score_80_solution.text,
            score_diff="100-80",
            scenario=problem.scenario,
            problem_id=problem.problem_id
        ))

    # Priority 2: 100 vs 60
    if score_60_solution:
        pairs.append(DPOPair(
            prompt=prompt,
            chosen=classical_solution.text,
            rejected=score_60_solution.text,
            score_diff="100-60",
            scenario=problem.scenario,
            problem_id=problem.problem_id
        ))

    # Priority 3: 100 vs 40
    if score_40_solution:
        pairs.append(DPOPair(
            prompt=prompt,
            chosen=classical_solution.text,
            rejected=score_40_solution.text,
            score_diff="100-40",
            scenario=problem.scenario,
            problem_id=problem.problem_id
        ))

    return pairs


# ============================================================================
# Main Processing Pipeline
# ============================================================================

def process_scenario(
    scenario: str,
    llm: LLM
) -> Tuple[List[DPOPair], Dict]:
    """
    Process a single scenario to generate DPO pairs.

    Args:
        scenario: Scenario name (e.g., 'blocksworld')
        llm: vLLM model instance

    Returns:
        Tuple of (dpo_pairs, statistics)
    """
    logger.info(f"Processing scenario: {scenario}")

    scenario_dir = INPUT_ROOT / scenario / "grpo_500"
    if not scenario_dir.exists():
        logger.error(f"Scenario directory not found: {scenario_dir}")
        return [], {}

    # Find all problem-solution pairs
    problem_solution_pairs = find_problem_files(scenario_dir)

    if not problem_solution_pairs:
        logger.warning(f"No problem-solution pairs found in {scenario_dir}")
        return [], {}

    # Load problems and classical solutions
    problems = []
    classical_solutions = {}

    for problem_path, solution_path in problem_solution_pairs:
        problem = load_problem(problem_path, scenario)
        classical_solution = load_classical_solution(solution_path)

        problems.append(problem)
        classical_solutions[problem.problem_id] = classical_solution

    logger.info(f"Loaded {len(problems)} problems with classical solutions")

    # Load unsafe solutions (60-score)
    unsafe_solutions = {}
    for problem in problems:
        unsafe_sol = load_unsafe_solution(problem)
        unsafe_solutions[problem.problem_id] = unsafe_sol

    unsafe_count = sum(1 for v in unsafe_solutions.values() if v is not None)
    logger.info(f"Found {unsafe_count} unsafe solutions (score-60)")

    # Sample score-80 solutions
    score_80_solutions = sample_solutions_with_vllm(llm, problems, target_score=80)

    # Sample score-40 solutions
    score_40_solutions = sample_solutions_with_vllm(llm, problems, target_score=40)

    # Generate DPO pairs
    all_pairs = []
    stats = defaultdict(int)

    for problem in problems:
        pid = problem.problem_id

        pairs = create_dpo_pairs(
            problem=problem,
            classical_solution=classical_solutions[pid],
            score_80_solution=score_80_solutions.get(pid),
            score_60_solution=unsafe_solutions.get(pid),
            score_40_solution=score_40_solutions.get(pid)
        )

        all_pairs.extend(pairs)

        # Update statistics
        for pair in pairs:
            stats[f"pairs_{pair.score_diff}"] += 1

    stats['total_pairs'] = len(all_pairs)
    stats['total_problems'] = len(problems)

    logger.info(f"Generated {len(all_pairs)} DPO pairs for {scenario}")
    logger.info(f"Statistics: {dict(stats)}")

    return all_pairs, dict(stats)


def save_dpo_pairs(
    pairs: List[DPOPair],
    output_path: Path
) -> None:
    """Save DPO pairs to JSONL file."""
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with open(output_path, 'w', encoding='utf-8') as f:
        for pair in pairs:
            record = {
                'prompt': pair.prompt,
                'chosen': pair.chosen,
                'rejected': pair.rejected,
                'score_diff': pair.score_diff,
                'scenario': pair.scenario,
                'problem_id': pair.problem_id
            }
            f.write(json.dumps(record, ensure_ascii=False) + '\n')

    logger.info(f"Saved {len(pairs)} pairs to {output_path}")


def main():
    """Main execution pipeline."""
    parser = argparse.ArgumentParser(
        description='Generate DPO dataset for PDDL tasks'
    )
    parser.add_argument(
        '--sft_model_path',
        type=str,
        required=True,
        help='Path to the SFT model for sampling'
    )

    args = parser.parse_args()

    # Check if vLLM is available
    if not VLLM_AVAILABLE:
        logger.error("vLLM is not installed. Please install it:")
        logger.error("  pip install vllm")
        return

    # Validate paths
    if not Path(args.sft_model_path).exists():
        logger.error(f"Model path not found: {args.sft_model_path}")
        return

    # Create output directory
    OUTPUT_ROOT.mkdir(parents=True, exist_ok=True)

    # Initialize vLLM model
    logger.info(f"Loading model from {args.sft_model_path}")
    llm = LLM(
        model=args.sft_model_path,
        tensor_parallel_size=torch.cuda.device_count() if torch.cuda.is_available() else 1,
        trust_remote_code=True
    )
    logger.info("Model loaded successfully")

    # Process each scenario
    all_scenarios_pairs = []
    all_statistics = {}

    for scenario in SCENARIOS:
        pairs, stats = process_scenario(scenario, llm)

        if pairs:
            # Save scenario-specific file
            scenario_output = OUTPUT_ROOT / f"{scenario}_dpo.jsonl"
            save_dpo_pairs(pairs, scenario_output)

            # Accumulate for merged file
            all_scenarios_pairs.extend(pairs)
            all_statistics[scenario] = stats

    # Save merged file
    if all_scenarios_pairs:
        merged_output = OUTPUT_ROOT / "all_scenarios_merged.jsonl"
        save_dpo_pairs(all_scenarios_pairs, merged_output)
        logger.info(f"Saved merged dataset with {len(all_scenarios_pairs)} total pairs")

    # Save statistics
    stats_output = OUTPUT_ROOT / "stats.json"
    with open(stats_output, 'w', encoding='utf-8') as f:
        json.dump(all_statistics, f, indent=2, ensure_ascii=False)

    logger.info(f"Statistics saved to {stats_output}")

    # Print summary
    logger.info("\n" + "="*60)
    logger.info("GENERATION COMPLETE")
    logger.info("="*60)
    for scenario, stats in all_statistics.items():
        logger.info(f"\n{scenario}:")
        for key, value in stats.items():
            logger.info(f"  {key}: {value}")
    logger.info(f"\nTotal pairs across all scenarios: {len(all_scenarios_pairs)}")
    logger.info(f"Output directory: {OUTPUT_ROOT}")
    logger.info("="*60 + "\n")


if __name__ == "__main__":
    main()
