#!/usr/bin/env python3
"""
Test script for DPO generation pipeline.

This script runs a small-scale test to verify the DPO generation works correctly
before running on the full 500-problem dataset.
"""

import argparse
import json
import sys
from pathlib import Path
import logging

# Add parent directory to path to import the main module
sys.path.insert(0, str(Path(__file__).parent))

logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


def test_file_loading():
    """Test that we can find and load problem files correctly."""
    print("\n" + "="*60)
    print("TEST 1: File Loading")
    print("="*60)

    from generate_dpo_dataset import INPUT_ROOT, SCENARIOS, find_problem_files, load_problem, load_classical_solution

    for scenario in SCENARIOS[:2]:  # Test first 2 scenarios
        scenario_dir = INPUT_ROOT / scenario / "grpo_500"
        print(f"\nScenario: {scenario}")
        print(f"Directory: {scenario_dir}")
        print(f"Exists: {scenario_dir.exists()}")

        if scenario_dir.exists():
            pairs = find_problem_files(scenario_dir)
            print(f"Found {len(pairs)} problem-solution pairs")

            if pairs:
                # Test loading first problem
                problem_path, solution_path = pairs[0]
                print(f"\nTest loading first problem:")
                print(f"  Problem: {problem_path.name}")
                print(f"  Solution: {solution_path.name}")

                problem = load_problem(problem_path, scenario)
                solution = load_classical_solution(solution_path)

                print(f"  Problem ID: {problem.problem_id}")
                print(f"  Problem text length: {len(problem.problem_text)} chars")
                print(f"  Solution text length: {len(solution.text)} chars")
                print(f"  Solution score: {solution.score}")

    print("\n✓ File loading test completed")


def test_unsafe_solution_loading():
    """Test loading unsafe solutions from all_problems directory."""
    print("\n" + "="*60)
    print("TEST 2: Unsafe Solution Loading")
    print("="*60)

    from generate_dpo_dataset import INPUT_ROOT, SCENARIOS, find_problem_files, load_problem, load_unsafe_solution

    for scenario in SCENARIOS[:2]:
        scenario_dir = INPUT_ROOT / scenario / "grpo_500"

        if not scenario_dir.exists():
            continue

        pairs = find_problem_files(scenario_dir)
        if not pairs:
            continue

        print(f"\nScenario: {scenario}")

        # Test first 5 problems
        found_count = 0
        for problem_path, _ in pairs[:5]:
            problem = load_problem(problem_path, scenario)
            unsafe_sol = load_unsafe_solution(problem)

            if unsafe_sol:
                found_count += 1
                print(f"  ✓ Found unsafe solution for {problem.problem_id}")
            else:
                print(f"  ✗ No unsafe solution for {problem.problem_id}")

        print(f"Found {found_count}/5 unsafe solutions")

    print("\n✓ Unsafe solution loading test completed")


def test_prompt_creation():
    """Test prompt generation from problems."""
    print("\n" + "="*60)
    print("TEST 3: Prompt Creation")
    print("="*60)

    from generate_dpo_dataset import INPUT_ROOT, SCENARIOS, find_problem_files, load_problem, create_prompt_from_problem

    scenario_dir = INPUT_ROOT / SCENARIOS[0] / "grpo_500"

    if scenario_dir.exists():
        pairs = find_problem_files(scenario_dir)
        if pairs:
            problem_path, _ = pairs[0]
            problem = load_problem(problem_path, SCENARIOS[0])

            prompt = create_prompt_from_problem(problem.problem_text)

            print(f"Problem ID: {problem.problem_id}")
            print(f"Prompt length: {len(prompt)} chars")
            print("\nPrompt preview (first 500 chars):")
            print("-" * 60)
            print(prompt[:500])
            print("-" * 60)

    print("\n✓ Prompt creation test completed")


def test_verifier():
    """Test the plan verifier on sample data."""
    print("\n" + "="*60)
    print("TEST 4: Plan Verifier")
    print("="*60)

    from generate_dpo_dataset import verify_plan, INPUT_ROOT, SCENARIOS, find_problem_files, load_problem, load_classical_solution

    scenario_dir = INPUT_ROOT / SCENARIOS[0] / "grpo_500"

    if scenario_dir.exists():
        pairs = find_problem_files(scenario_dir)
        if pairs:
            # Test with first problem
            problem_path, solution_path = pairs[0]
            problem = load_problem(problem_path, SCENARIOS[0])
            solution = load_classical_solution(solution_path)

            print(f"Testing verifier on problem: {problem.problem_id}")

            # Test classical solution (should be 100)
            score = verify_plan(str(problem.problem_path), solution.text)
            print(f"Classical solution score: {score}")

            if score != 100:
                print("⚠ WARNING: Classical solution did not score 100!")
                print("This indicates the verifier needs to be implemented/fixed.")

            # Test empty plan (should be low score)
            empty_score = verify_plan(str(problem.problem_path), "")
            print(f"Empty plan score: {empty_score}")

    print("\n✓ Verifier test completed")
    print("\nNOTE: Using VAL validator for plan verification.")
    print("Scores: 100=valid, 80=goal not satisfied, 60=safety violation, 40=precondition/format error")


def test_model_loading(model_path: str):
    """Test loading the SFT model."""
    print("\n" + "="*60)
    print("TEST 5: Model Loading")
    print("="*60)

    import torch
    from vllm import LLM

    print(f"Model path: {model_path}")
    print(f"Path exists: {Path(model_path).exists()}")

    if not Path(model_path).exists():
        print("✗ Model path does not exist!")
        return False

    try:
        print("Loading model with vLLM...")
        llm = LLM(
            model=model_path,
            tensor_parallel_size=1,  # Use single GPU for testing
            trust_remote_code=True
        )
        print("✓ Model loaded successfully!")

        # Test generation
        print("\nTesting sample generation...")
        from vllm import SamplingParams

        sampling_params = SamplingParams(
            temperature=0.7,
            max_tokens=100
        )

        outputs = llm.generate(["Test prompt: generate a simple plan"], sampling_params)
        print(f"Generated text: {outputs[0].outputs[0].text[:200]}...")

        print("\n✓ Model loading and generation test completed")
        return True

    except Exception as e:
        print(f"✗ Model loading failed: {e}")
        return False


def test_small_generation(model_path: str, num_problems: int = 3):
    """Run DPO generation on a small subset of problems."""
    print("\n" + "="*60)
    print(f"TEST 6: Small-Scale DPO Generation ({num_problems} problems)")
    print("="*60)

    from generate_dpo_dataset import (
        INPUT_ROOT, OUTPUT_ROOT, SCENARIOS,
        find_problem_files, load_problem, load_classical_solution,
        load_unsafe_solution, create_dpo_pairs, save_dpo_pairs
    )
    import torch
    from vllm import LLM

    # Use test output directory
    test_output = OUTPUT_ROOT.parent / "dpo_data_test"
    test_output.mkdir(parents=True, exist_ok=True)

    # Load model
    print("Loading model...")
    llm = LLM(
        model=model_path,
        tensor_parallel_size=1,
        trust_remote_code=True
    )

    # Test on first scenario only
    scenario = SCENARIOS[0]
    scenario_dir = INPUT_ROOT / scenario / "grpo_500"

    if not scenario_dir.exists():
        print(f"✗ Scenario directory not found: {scenario_dir}")
        return

    pairs = find_problem_files(scenario_dir)[:num_problems]
    print(f"Testing with {len(pairs)} problems from {scenario}")

    all_dpo_pairs = []

    for problem_path, solution_path in pairs:
        problem = load_problem(problem_path, scenario)
        classical_solution = load_classical_solution(solution_path)
        unsafe_solution = load_unsafe_solution(problem)

        print(f"\nProcessing {problem.problem_id}:")
        print(f"  - Classical solution: ✓")
        print(f"  - Unsafe solution: {'✓' if unsafe_solution else '✗'}")

        # For testing, create pairs with what we have
        # (In real run, we'd sample score-80 and score-40 from model)
        dpo_pairs = create_dpo_pairs(
            problem=problem,
            classical_solution=classical_solution,
            score_80_solution=None,  # Would be sampled in real run
            score_60_solution=unsafe_solution,
            score_40_solution=None   # Would be sampled in real run
        )

        print(f"  - Generated {len(dpo_pairs)} DPO pairs")
        all_dpo_pairs.extend(dpo_pairs)

    # Save results
    output_file = test_output / f"{scenario}_test.jsonl"
    save_dpo_pairs(all_dpo_pairs, output_file)

    print(f"\n✓ Small-scale generation completed")
    print(f"Total pairs generated: {len(all_dpo_pairs)}")
    print(f"Output saved to: {output_file}")

    # Show sample
    if all_dpo_pairs:
        print("\nSample DPO pair:")
        print("-" * 60)
        sample = all_dpo_pairs[0]
        print(f"Scenario: {sample.scenario}")
        print(f"Problem ID: {sample.problem_id}")
        print(f"Score diff: {sample.score_diff}")
        print(f"Prompt length: {len(sample.prompt)} chars")
        print(f"Chosen length: {len(sample.chosen)} chars")
        print(f"Rejected length: {len(sample.rejected)} chars")
        print("-" * 60)


def run_all_tests(model_path: str = None):
    """Run all tests in sequence."""
    print("\n" + "#"*60)
    print("# DPO Generation Pipeline Tests")
    print("#"*60)

    try:
        # Tests that don't require model
        test_file_loading()
        test_unsafe_solution_loading()
        test_prompt_creation()
        test_verifier()

        # Tests that require model
        if model_path:
            if test_model_loading(model_path):
                response = input("\nRun small-scale generation test? This will take a few minutes (y/n): ")
                if response.lower() == 'y':
                    test_small_generation(model_path)
        else:
            print("\n" + "="*60)
            print("SKIPPING model-dependent tests (no --sft_model_path provided)")
            print("="*60)

        print("\n" + "#"*60)
        print("# All Tests Completed")
        print("#"*60)
        print("\nNext steps:")
        print("1. Review any warnings or failures above")
        print("2. Implement the verify_plan() function in generate_dpo_dataset.py")
        print("3. Update load_unsafe_solution() file matching logic if needed")
        print("4. Run full generation with: python generate_dpo_dataset.py --sft_model_path <path>")

    except Exception as e:
        print(f"\n✗ Test failed with error: {e}")
        import traceback
        traceback.print_exc()


def main():
    parser = argparse.ArgumentParser(description='Test DPO generation pipeline')
    parser.add_argument(
        '--sft_model_path',
        type=str,
        help='Path to SFT model (optional, required for model tests)'
    )
    parser.add_argument(
        '--test',
        type=str,
        choices=['file', 'unsafe', 'prompt', 'verifier', 'model', 'generation', 'all'],
        default='all',
        help='Which test to run'
    )

    args = parser.parse_args()

    if args.test == 'all':
        run_all_tests(args.sft_model_path)
    elif args.test == 'file':
        test_file_loading()
    elif args.test == 'unsafe':
        test_unsafe_solution_loading()
    elif args.test == 'prompt':
        test_prompt_creation()
    elif args.test == 'verifier':
        test_verifier()
    elif args.test == 'model':
        if args.sft_model_path:
            test_model_loading(args.sft_model_path)
        else:
            print("Error: --sft_model_path required for model test")
    elif args.test == 'generation':
        if args.sft_model_path:
            test_small_generation(args.sft_model_path)
        else:
            print("Error: --sft_model_path required for generation test")


if __name__ == "__main__":
    main()
