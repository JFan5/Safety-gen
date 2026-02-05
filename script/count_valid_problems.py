#!/usr/bin/env python3
"""
Count how many problems in each domain meet the requirements:
1. Have solutions that validate successfully
2. Cannot be solved by PDDL2 solutions (PDDL2 solutions don't validate)
3. Solutions are not empty
"""

import subprocess
import sys
from pathlib import Path
from typing import List, Tuple, Optional

# Paths
REPO_ROOT = Path("/home/ubuntu/Safety-gen")
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


def find_matching_pddl2_solution(pddl3_problem: Path, pddl2_training_dir: Path) -> Optional[Path]:
    """Find the corresponding PDDL2 solution file."""
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
    try:
        if not is_valid_solution(pddl2_solution.read_text()):
            return True, "PDDL2 solution is invalid/empty"
    except:
        return True, "PDDL2 solution cannot be read"
    
    # Try to validate PDDL2 solution against PDDL3 problem
    is_valid, output = validate_solution(domain3_file, pddl3_problem, pddl2_solution)
    if not is_valid:
        return True, "PDDL2 solution does not validate for PDDL3 problem"
    else:
        return False, "PDDL2 solution validates successfully"


def count_valid_problems(domain_name: str) -> dict:
    """Count valid problems for a domain."""
    domain3_file = REPO_ROOT / f"pddl3/{domain_name}/domain3.pddl"
    pddl3_training_dir = REPO_ROOT / f"pddl3/{domain_name}/all_problems3/training"
    pddl2_training_dir = REPO_ROOT / f"pddl3/{domain_name}/all_problems/training"
    
    print(f"\n{'='*70}")
    print(f"Processing domain: {domain_name}")
    print(f"{'='*70}")
    
    # Check if directories exist
    if not domain3_file.exists():
        print(f"ERROR: Domain file not found at {domain3_file}")
        return {"error": "Domain file not found"}
    
    if not pddl3_training_dir.exists():
        print(f"ERROR: PDDL3 training directory not found at {pddl3_training_dir}")
        return {"error": "PDDL3 training directory not found"}
    
    # Find all problems with solutions
    print("Finding problems with solutions...")
    problems_with_solutions: List[Tuple[Path, Path]] = []
    for pddl_file in sorted(pddl3_training_dir.glob("*.pddl")):
        soln_file = pddl_file.with_suffix('.soln')
        if soln_file.exists():
            problems_with_solutions.append((pddl_file, soln_file))
    
    print(f"Found {len(problems_with_solutions)} problems with solutions")
    
    # Statistics
    stats = {
        "total_with_solutions": len(problems_with_solutions),
        "valid_solution_format": 0,
        "validates_successfully": 0,
        "pddl2_solution_fails": 0,
        "meets_all_requirements": 0,
        "reasons": {
            "invalid_solution_format": 0,
            "validation_failed": 0,
            "pddl2_solution_works": 0,
        }
    }
    
    # Filter problems
    print("\nFiltering problems...")
    valid_problems: List[Tuple[Path, Path]] = []
    
    for idx, (pddl_file, soln_file) in enumerate(problems_with_solutions):
        if (idx + 1) % 500 == 0:
            print(f"  Processed {idx + 1}/{len(problems_with_solutions)} problems, found {len(valid_problems)} valid so far...")
        
        # Read solution content
        try:
            soln_content = soln_file.read_text()
        except Exception as e:
            stats["reasons"]["invalid_solution_format"] += 1
            continue
        
        # Check if solution is valid (not empty, no invalid patterns)
        if not is_valid_solution(soln_content):
            stats["reasons"]["invalid_solution_format"] += 1
            continue
        
        stats["valid_solution_format"] += 1
        
        # Validate solution
        is_valid, validation_output = validate_solution(domain3_file, pddl_file, soln_file)
        if not is_valid:
            stats["reasons"]["validation_failed"] += 1
            continue
        
        stats["validates_successfully"] += 1
        
        # Check if PDDL2 solution fails
        pddl2_fails, reason = check_pddl2_solution_fails(pddl_file, domain3_file, pddl2_training_dir)
        if not pddl2_fails:
            stats["reasons"]["pddl2_solution_works"] += 1
            continue
        
        stats["pddl2_solution_fails"] += 1
        
        # All checks passed!
        stats["meets_all_requirements"] += 1
        valid_problems.append((pddl_file, soln_file))
    
    print(f"\n{'='*70}")
    print(f"Results for {domain_name}:")
    print(f"{'='*70}")
    print(f"Total problems with solutions:        {stats['total_with_solutions']}")
    print(f"Valid solution format:                {stats['valid_solution_format']}")
    print(f"Validates successfully:                {stats['validates_successfully']}")
    print(f"PDDL2 solution fails:                {stats['pddl2_solution_fails']}")
    print(f"✓ Meets ALL requirements:            {stats['meets_all_requirements']}")
    print(f"\nBreakdown of failures:")
    print(f"  Invalid solution format:            {stats['reasons']['invalid_solution_format']}")
    print(f"  Validation failed:                 {stats['reasons']['validation_failed']}")
    print(f"  PDDL2 solution works:              {stats['reasons']['pddl2_solution_works']}")
    
    return stats


def main():
    """Main function to count valid problems for all domains."""
    domains = ["blocksworld", "ferry", "spanner", "grippers"]
    
    print("=" * 70)
    print("Counting Valid Problems by Requirements")
    print("=" * 70)
    print("\nRequirements:")
    print("  1. Have solutions that validate successfully")
    print("  2. Cannot be solved by PDDL2 solutions")
    print("  3. Solutions are not empty")
    print()
    
    all_stats = {}
    
    for domain in domains:
        stats = count_valid_problems(domain)
        all_stats[domain] = stats
    
    # Summary
    print("\n" + "=" * 70)
    print("SUMMARY")
    print("=" * 70)
    print(f"{'Domain':<15} {'Total':<10} {'Valid Format':<15} {'Validates':<12} {'PDDL2 Fails':<15} {'Meets All':<12}")
    print("-" * 70)
    
    for domain in domains:
        stats = all_stats[domain]
        if "error" not in stats:
            print(f"{domain:<15} {stats['total_with_solutions']:<10} {stats['valid_solution_format']:<15} "
                  f"{stats['validates_successfully']:<12} {stats['pddl2_solution_fails']:<15} "
                  f"{stats['meets_all_requirements']:<12}")
        else:
            print(f"{domain:<15} ERROR: {stats['error']}")
    
    print("-" * 70)
    total_meets_all = sum(s.get('meets_all_requirements', 0) for s in all_stats.values() if 'error' not in s)
    print(f"{'TOTAL':<15} {'':<10} {'':<15} {'':<12} {'':<15} {total_meets_all:<12}")
    print()


if __name__ == "__main__":
    main()

