#!/usr/bin/env python3
"""
Check overlap between sft_500 and all_problems3/testing for multiple domains.
"""

import sys
from pathlib import Path
from collections import defaultdict

REPO_ROOT = Path("/home/ubuntu/Safety-gen")
domains = ["blocksworld", "ferry", "spanner", "grippers"]

def get_problem_names(directory: Path) -> set:
    """Get set of problem file names from a directory."""
    problem_names = set()
    if directory.exists():
        for pddl_file in directory.glob("*.pddl"):
            problem_names.add(pddl_file.name)
    return problem_names

def main():
    print("=" * 80)
    print("Overlap Analysis: sft_500 vs all_problems3/testing")
    print("=" * 80)
    print()
    
    results = []
    
    for domain in domains:
        sft_500_dir = REPO_ROOT / f"pddl3/{domain}/sft_500"
        testing_dir = REPO_ROOT / f"pddl3/{domain}/all_problems3/testing"
        
        # Get problem names
        sft_500_names = get_problem_names(sft_500_dir)
        testing_names = get_problem_names(testing_dir)
        
        # Find overlap
        overlap = sft_500_names & testing_names
        
        # Calculate statistics
        sft_500_count = len(sft_500_names)
        testing_count = len(testing_names)
        overlap_count = len(overlap)
        overlap_percent = (overlap_count / sft_500_count * 100) if sft_500_count > 0 else 0
        
        results.append({
            'domain': domain,
            'sft_500_count': sft_500_count,
            'testing_count': testing_count,
            'overlap_count': overlap_count,
            'overlap_percent': overlap_percent,
            'overlap_files': sorted(list(overlap))
        })
    
    # Print detailed results
    for result in results:
        domain = result['domain']
        print(f"Domain: {domain}")
        print(f"  sft_500 directory:     {REPO_ROOT / 'pddl3' / domain / 'sft_500'}")
        print(f"  testing directory:     {REPO_ROOT / 'pddl3' / domain / 'all_problems3' / 'testing'}")
        print(f"  sft_500 problems:       {result['sft_500_count']}")
        print(f"  testing problems:       {result['testing_count']}")
        print(f"  Overlap:               {result['overlap_count']}")
        print(f"  Overlap percentage:    {result['overlap_percent']:.2f}%")
        
        if result['overlap_count'] > 0:
            print(f"  Overlapping files:")
            for f in result['overlap_files'][:20]:  # Show first 20
                print(f"    - {f}")
            if len(result['overlap_files']) > 20:
                print(f"    ... and {len(result['overlap_files']) - 20} more")
        else:
            print(f"  ✓ No overlap - all sft_500 problems are unique from testing set")
        
        print()
    
    # Summary
    print("=" * 80)
    print("Summary")
    print("=" * 80)
    total_sft_500 = sum(r['sft_500_count'] for r in results)
    total_testing = sum(r['testing_count'] for r in results)
    total_overlap = sum(r['overlap_count'] for r in results)
    
    print(f"Total sft_500 problems across all domains:  {total_sft_500}")
    print(f"Total testing problems across all domains:  {total_testing}")
    print(f"Total overlap:                              {total_overlap}")
    print()
    
    if total_overlap == 0:
        print("✓ SUCCESS: No overlap detected between sft_500 and testing sets!")
        print("  All training problems are distinct from testing problems.")
    else:
        print("⚠ WARNING: Overlap detected!")
        print(f"  {total_overlap} problems appear in both sft_500 and testing sets.")
    
    print()

if __name__ == "__main__":
    main()

