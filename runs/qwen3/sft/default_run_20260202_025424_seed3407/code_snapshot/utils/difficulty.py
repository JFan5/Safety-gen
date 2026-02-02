"""
Difficulty parsing and scoring utilities for PDDL planning problems.

This module provides functions to:
1. Parse difficulty parameters from problem filenames
2. Compute difficulty scores using domain-specific formulas
3. Assign difficulty buckets (easy/medium/hard) based on percentiles
"""

import re
from pathlib import Path
from typing import Dict


def parse_difficulty_from_filename(problem_file: str, domain: str) -> Dict[str, int]:
    """
    Parse difficulty parameters from problem_file name.

    Different domains use different naming conventions:
    - blocksworld: bw_ops3_n4_seed200074.pddl -> n=blocks
    - ferry: ferry-l4-c2-s122320450.pddl -> l=locations, c=cars
    - grippers: grippers-n1-r4-o3-s299249445.pddl -> n=robots, r=rooms, o=objects
    - spanner: spanner-s3-n2-l4-s1595284416.pddl -> s=spanners, n=nuts, l=locations

    Returns:
        Dict with domain-specific parameters for difficulty calculation
    """
    filename = Path(problem_file).name.lower()

    if 'blocksworld' in domain.lower() or 'bw_' in filename:
        # blocksworld: bw_ops3_n4_seed200074.pddl
        # n = number of blocks
        n_match = re.search(r'_n(\d+)', filename)
        n = int(n_match.group(1)) if n_match else 1
        return {'domain': 'blocksworld', 'n': n}

    elif 'ferry' in domain.lower():
        # ferry: ferry-l4-c2-s122320450.pddl
        # l = locations, c = cars
        l_match = re.search(r'-l(\d+)', filename)
        c_match = re.search(r'-c(\d+)', filename)
        l = int(l_match.group(1)) if l_match else 1
        c = int(c_match.group(1)) if c_match else 1
        return {'domain': 'ferry', 'l': l, 'c': c}

    elif 'grippers' in domain.lower():
        # grippers: grippers-n1-r4-o3-s299249445.pddl
        # n = robots, r = rooms, o = objects
        n_match = re.search(r'-n(\d+)', filename)
        r_match = re.search(r'-r(\d+)', filename)
        o_match = re.search(r'-o(\d+)', filename)
        n = int(n_match.group(1)) if n_match else 1
        r = int(r_match.group(1)) if r_match else 1
        o = int(o_match.group(1)) if o_match else 1
        return {'domain': 'grippers', 'n': n, 'r': r, 'o': o}

    elif 'spanner' in domain.lower():
        # spanner: spanner-s3-n2-l4-s1595284416.pddl
        # s = spanners, n = nuts, l = locations
        s_match = re.search(r'spanner-s(\d+)', filename)
        n_match = re.search(r'-n(\d+)', filename)
        l_match = re.search(r'-l(\d+)', filename)
        s = int(s_match.group(1)) if s_match else 1
        n = int(n_match.group(1)) if n_match else 1
        l = int(l_match.group(1)) if l_match else 1
        return {'domain': 'spanner', 's': s, 'n': n, 'l': l}

    elif 'delivery' in domain.lower():
        # delivery: delivery-s2-p1-seed... -> s=locations, p=packages
        s_match = re.search(r'-s(\d+)', filename)
        p_match = re.search(r'-p(\d+)', filename)
        s = int(s_match.group(1)) if s_match else 1
        p = int(p_match.group(1)) if p_match else 1
        return {'domain': 'delivery', 's': s, 'p': p}

    else:
        # Generic fallback
        n_match = re.search(r'-n(\d+)', filename)
        n = int(n_match.group(1)) if n_match else 1
        return {'domain': 'unknown', 'n': n}


def compute_difficulty_score(params: Dict[str, int]) -> float:
    """
    Compute difficulty score using multiplicative formula.

    Each domain uses product of its key parameters to capture
    combinatorial complexity:

    - blocksworld: n² (state space grows factorially with blocks)
    - ferry: l × c (locations × cars)
    - grippers: n × r × o (robots × rooms × objects)
    - spanner: s × n × l (spanners × nuts × locations)
    - delivery: s × p (locations × packages)

    Returns:
        Difficulty score (higher = more difficult)
    """
    domain = params.get('domain', 'unknown')

    if domain == 'blocksworld':
        # Blocksworld complexity grows very fast with n
        # Using n² to differentiate difficulty levels
        n = params.get('n', 1)
        return float(n * n)

    elif domain == 'ferry':
        # Complexity = locations × cars
        l = params.get('l', 1)
        c = params.get('c', 1)
        return float(l * c)

    elif domain == 'grippers':
        # Complexity = robots × rooms × objects
        n = params.get('n', 1)
        r = params.get('r', 1)
        o = params.get('o', 1)
        return float(n * r * o)

    elif domain == 'spanner':
        # Complexity = spanners × nuts × locations
        s = params.get('s', 1)
        n = params.get('n', 1)
        l = params.get('l', 1)
        return float(s * n * l)

    elif domain == 'delivery':
        # Complexity = locations × packages
        s = params.get('s', 1)
        p = params.get('p', 1)
        return float(s * p)

    else:
        # Fallback
        n = params.get('n', 1)
        return float(n)


def assign_difficulty_bucket(score: float, percentiles: Dict[str, float]) -> str:
    """
    Assign difficulty bucket based on score and domain-specific percentiles.

    Args:
        score: Difficulty score for this sample
        percentiles: Dict with 'p40' and 'p80' thresholds

    Returns:
        'easy', 'medium', or 'hard'
    """
    if score <= percentiles['p40']:
        return 'easy'
    elif score <= percentiles['p80']:
        return 'medium'
    else:
        return 'hard'
