#!/usr/bin/env python3
"""
Select 500 problems from all_problems3/training that meet the following criteria:
1. Have solutions that validate successfully
2. Cannot be solved by PDDL2 solutions (PDDL2 solutions don't validate)
3. Solutions are not empty
"""

import argparse
import subprocess
import sys
from pathlib import Path
from typing import List, Tuple, Optional

# Paths
REPO_ROOT = Path(__file__).resolve().parent
VALIDATE_TOOL = Path("/home/ubuntu/VAL/build/linux64/Release/bin/Validate")

# Invalid solution patterns (these should not appear in solution files)
INVALID_PATTERNS = [
    "Constructing lookup tables",
    "Plan size:",
    "Plan invalid",
    "Goal not satisfied",
    "Checking plan:",
    "Plan to validate:",
    "Plan executed successfully",
    "Plan Repair Advice:",
    "Failed plans:",
    "Solution Found",
    "States evaluated:",
    "Cost:",
    "Time",
    "The empty plan is optimal",
    "Plan Validation details",
    "Successful plans:",
    "Failed plans:",
]


def is_valid_solution(content: str) -> bool:
    """Check if solution content is valid (not empty and doesn't contain invalid patterns)."""
    if not content or not content.strip():
        return False
    
    # Check for invalid patterns
    content_lower = content.lower()
    for pattern in INVALID_PATTERNS:
        if pattern.lower() in content_lower:
            return False
    
    # Check if it contains actual plan actions (should have parentheses)
    lines = [line.strip() for line in content.strip().split('\n') if line.strip()]
    if not lines:
        return False
    
    # Check if at least one line looks like a plan action (starts with '(')
    has_action = any(line.startswith('(') for line in lines)
    if not has_action:
        return False
    
    return True


def validate_solution(domain_file: Path, problem_file: Path, solution_file: Path) -> Tuple[bool, str]:
    """Validate a solution using the Validate tool."""
    try:
        result = subprocess.run(
            [str(VALIDATE_TOOL), "-v", str(domain_file), str(problem_file), str(solution_file)],
            capture_output=True,
            text=True,
            timeout=30
        )
        stdout = result.stdout
        stderr = result.stderr
        full_output = stdout + stderr
        
        # Check if validation was successful
        # Successful validation contains "Plan valid" and "Successful plans"
        # Failed validation contains "Plan invalid", "Failed plans", or "Plan failed to execute"
        if "Plan valid" in full_output and "Successful plans" in full_output:
            return True, full_output
        elif "Plan invalid" in full_output or "Failed plans" in full_output or "Plan failed to execute" in full_output:
            return False, full_output
        else:
            # Unknown state, treat as failure
            return False, full_output
    except subprocess.TimeoutExpired:
        return False, "Validation timeout"
    except Exception as e:
        return False, f"Validation error: {str(e)}"


def find_matching_pddl2_problem(pddl3_problem: Path) -> Optional[Path]:
    """Find the corresponding PDDL2 problem file."""
    # PDDL3 problem name should match PDDL2 problem name
    problem_name = pddl3_problem.name
    pddl2_problem = PDDL2_TRAINING_DIR / problem_name
    if pddl2_problem.exists():
        return pddl2_problem
    return None


def find_matching_pddl2_solution(pddl3_problem: Path, pddl2_training_dir: Path) -> Optional[Path]:
    """Find the corresponding PDDL2 solution file."""
    # Solution file name
    problem_name = pddl3_problem.stem  # without .pddl
    pddl2_solution = pddl2_training_dir / f"{problem_name}.soln"
    if pddl2_solution.exists():
        return pddl2_solution
    return None


def check_pddl2_solution_fails(pddl3_problem: Path, domain3_file: Path, pddl2_training_dir: Path) -> Tuple[bool, str]:
    """
    Check if PDDL2 solution fails to validate for the PDDL3 problem.
    Returns (fails, reason)
    """
    pddl2_solution = find_matching_pddl2_solution(pddl3_problem, pddl2_training_dir)
    if pddl2_solution is None:
        # No PDDL2 solution exists, so it "fails" (can't solve it)
        return True, "No PDDL2 solution exists"
    
    # Check if PDDL2 solution is valid
    if not is_valid_solution(pddl2_solution.read_text()):
        return True, "PDDL2 solution is invalid/empty"
    
    # Try to validate PDDL2 solution against PDDL3 problem
    is_valid, output = validate_solution(domain3_file, pddl3_problem, pddl2_solution)
    if not is_valid:
        return True, "PDDL2 solution does not validate for PDDL3 problem"
    else:
        return False, "PDDL2 solution validates successfully"


def process_domain(domain_name: str, target_count: int = 500):
    """Process a single domain to select problems."""
    # Set up paths for this domain
    domain3_file = REPO_ROOT / f"pddl3/{domain_name}/domain3.pddl"
    pddl3_training_dir = REPO_ROOT / f"pddl3/{domain_name}/all_problems3/training"
    pddl2_training_dir = REPO_ROOT / f"pddl3/{domain_name}/all_problems/training"
    output_dir = REPO_ROOT / f"pddl3/{domain_name}/sft_500"
    
    print(f"\n{'='*60}")
    print(f"Processing domain: {domain_name}")
    print(f"{'='*60}")
    print(f"PDDL3 training dir: {pddl3_training_dir}")
    print(f"PDDL2 training dir: {pddl2_training_dir}")
    print(f"Output dir: {output_dir}")
    print(f"Domain file: {domain3_file}")
    
    # Check if Validate tool exists
    if not VALIDATE_TOOL.exists():
        print(f"ERROR: Validate tool not found at {VALIDATE_TOOL}")
        return False
    
    # Check if domain file exists
    if not domain3_file.exists():
        print(f"ERROR: Domain file not found at {domain3_file}")
        return False
    
    # Check if directories exist
    if not pddl3_training_dir.exists():
        print(f"ERROR: PDDL3 training directory not found at {pddl3_training_dir}")
        return False
    
    # Find all problems with solutions
    print("\nFinding problems with solutions...")
    problems_with_solutions: List[Tuple[Path, Path]] = []
    for pddl_file in sorted(pddl3_training_dir.glob("*.pddl")):
        soln_file = pddl_file.with_suffix('.soln')
        if soln_file.exists():
            problems_with_solutions.append((pddl_file, soln_file))
    
    print(f"Found {len(problems_with_solutions)} problems with solutions")
    
    if len(problems_with_solutions) == 0:
        print("ERROR: No problems with solutions found!")
        return False
    
    # Filter problems
    print("\nFiltering problems...")
    valid_problems: List[Tuple[Path, Path]] = []
    
    for idx, (pddl_file, soln_file) in enumerate(problems_with_solutions):
        if (idx + 1) % 100 == 0:
            print(f"  Processed {idx + 1}/{len(problems_with_solutions)} problems, found {len(valid_problems)} valid so far...")
        
        # Read solution content
        try:
            soln_content = soln_file.read_text()
        except Exception as e:
            print(f"  WARNING: Could not read {soln_file}: {e}")
            continue
        
        # Check if solution is valid (not empty, no invalid patterns)
        if not is_valid_solution(soln_content):
            continue
        
        # Validate solution
        is_valid, validation_output = validate_solution(domain3_file, pddl_file, soln_file)
        if not is_valid:
            continue
        
        # Check if PDDL2 solution fails
        pddl2_fails, reason = check_pddl2_solution_fails(pddl_file, domain3_file, pddl2_training_dir)
        if not pddl2_fails:
            # PDDL2 solution works, skip this problem
            continue
        
        # All checks passed!
        valid_problems.append((pddl_file, soln_file))
        
        # Stop when we have enough
        if len(valid_problems) >= target_count:
            print(f"\nFound {target_count} valid problems! Stopping...")
            break
    
    print(f"\nFound {len(valid_problems)} valid problems")
    
    if len(valid_problems) < target_count:
        print(f"WARNING: Only found {len(valid_problems)} valid problems, less than requested {target_count}")
    
    # Create output directory
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # Copy files
    print(f"\nCopying {len(valid_problems)} problems to {output_dir}...")
    for pddl_file, soln_file in valid_problems:
        # Copy problem file
        output_pddl = output_dir / pddl_file.name
        output_soln = output_dir / soln_file.name
        
        # Read and write to ensure clean copy
        output_pddl.write_text(pddl_file.read_text())
        output_soln.write_text(soln_file.read_text())
    
    print(f"\nDone! Copied {len(valid_problems)} problems to {output_dir}")
    print(f"Files:")
    print(f"  - {len(valid_problems)} .pddl files")
    print(f"  - {len(valid_problems)} .soln files")
    
    return True


def main():
    """Main function to select problems for one or more domains."""
    parser = argparse.ArgumentParser(
        description="Select problems from PDDL3 training that meet validation criteria"
    )
    parser.add_argument(
        "--domain",
        type=str,
        nargs="+",
        default=["blocksworld"],
        help="Domain name(s) to process (default: blocksworld). Can specify multiple: --domain ferry spanner grippers"
    )
    parser.add_argument(
        "--count",
        type=int,
        default=500,
        help="Number of problems to select (default: 500)"
    )
    
    args = parser.parse_args()
    
    print(f"Starting selection process for {len(args.domain)} domain(s)...")
    print(f"Target count per domain: {args.count}")
    
    success_count = 0
    for domain in args.domain:
        if process_domain(domain, args.count):
            success_count += 1
        else:
            print(f"\nFailed to process domain: {domain}")
    
    print(f"\n{'='*60}")
    print(f"Summary: Successfully processed {success_count}/{len(args.domain)} domain(s)")
    print(f"{'='*60}")


if __name__ == "__main__":
    main()

