"""
Multi-domain data loading utilities for GRPO training.

This module provides functions to:
1. Load data from multiple domain-specific JSONL files
2. Compute difficulty scores and assign buckets
3. Generate curriculum-based training datasets
"""

import json
import logging
from pathlib import Path
from typing import Any, Dict, List, Optional

import numpy as np

from .difficulty import (
    parse_difficulty_from_filename,
    compute_difficulty_score,
    assign_difficulty_bucket,
)
from .curriculum import get_curriculum_weights

logger = logging.getLogger("data_loader")


def load_multi_domain_data(
    data_root: str,
    domains: Optional[List[str]] = None,
) -> Dict[str, List[Dict[str, Any]]]:
    """
    Load data from multiple domain-specific JSONL files.

    Expected files in data_root:
    - blocksworld.jsonl
    - ferry.jsonl
    - grippers.jsonl
    - spanner.jsonl
    - delivery.jsonl (optional)

    Args:
        data_root: Root directory containing JSONL files
        domains: List of domains to load. If None, loads all available domains.

    Returns:
        Dict mapping domain name -> list of samples
    """
    data_root_path = Path(data_root)
    if not data_root_path.exists():
        raise ValueError(f"Data root does not exist: {data_root}")

    domain_data = {}
    all_domains = ['blocksworld', 'ferry', 'grippers', 'spanner', 'delivery']

    # Use specified domains or all domains
    if domains is not None and len(domains) > 0:
        # Validate that all specified domains are valid
        invalid_domains = set(domains) - set(all_domains)
        if invalid_domains:
            raise ValueError(f"Invalid domain(s): {invalid_domains}. Valid domains: {all_domains}")
        expected_domains = domains
        logger.info(f"Loading specified domains: {expected_domains}")
    else:
        expected_domains = all_domains
        logger.info(f"Loading all available domains: {expected_domains}")

    for domain in expected_domains:
        domain_file = data_root_path / f"{domain}.jsonl"
        if not domain_file.exists():
            logger.warning(f"Domain file not found: {domain_file}, skipping {domain}")
            continue

        samples = []
        with open(domain_file, 'r', encoding='utf-8') as f:
            for line_num, line in enumerate(f, 1):
                if not line.strip():
                    continue
                try:
                    record = json.loads(line)

                    # Validate required fields
                    if 'prompt' not in record or not isinstance(record['prompt'], str):
                        logger.warning(f"{domain}.jsonl line {line_num}: missing/invalid 'prompt', skipping")
                        continue

                    if 'meta' not in record or not isinstance(record['meta'], dict):
                        logger.warning(f"{domain}.jsonl line {line_num}: missing/invalid 'meta', skipping")
                        continue

                    # Ensure meta has required fields
                    meta = record['meta']
                    if 'problem_file' not in meta:
                        logger.warning(f"{domain}.jsonl line {line_num}: meta missing 'problem_file', skipping")
                        continue

                    # Add scenario to meta if not present
                    if 'scenario' not in meta:
                        meta['scenario'] = domain

                    samples.append(record)

                except json.JSONDecodeError as e:
                    logger.warning(f"{domain}.jsonl line {line_num}: JSON decode error: {e}")
                    continue

        if samples:
            domain_data[domain] = samples
            logger.info(f"Loaded {len(samples)} samples from {domain}")
        else:
            logger.warning(f"No valid samples loaded from {domain}")

    if not domain_data:
        raise ValueError(f"No valid data loaded from {data_root}")

    return domain_data


def compute_difficulty_scores_and_buckets(
    domain_data: Dict[str, List[Dict[str, Any]]]
) -> Dict[str, List[Dict[str, Any]]]:
    """
    Compute difficulty scores and assign buckets for all samples.

    For each domain:
    1. Parse difficulty parameters from problem_file
    2. Compute difficulty_score using multiplicative formula
    3. Compute percentiles (40th, 80th)
    4. Assign buckets: easy (0-40%), medium (40-80%), hard (80-100%)

    Modifies samples in-place and returns the same dict.
    """
    for domain, samples in domain_data.items():
        scores = []

        # First pass: compute all scores
        for sample in samples:
            problem_file = sample['meta']['problem_file']
            params = parse_difficulty_from_filename(problem_file, domain)
            score = compute_difficulty_score(params)
            sample['difficulty_score'] = score
            sample['difficulty_params'] = params  # Store params for debugging
            sample['domain'] = domain
            scores.append(score)

        # Compute percentiles for this domain
        if len(scores) == 0:
            logger.warning(f"Domain {domain} has no samples with valid scores")
            continue

        p40 = np.percentile(scores, 40)
        p80 = np.percentile(scores, 80)
        percentiles = {'p40': p40, 'p80': p80}

        # Log score distribution
        score_min, score_max = min(scores), max(scores)
        score_mean = np.mean(scores)
        logger.info(
            f"Domain {domain}: scores range=[{score_min:.0f}, {score_max:.0f}], "
            f"mean={score_mean:.1f}, p40={p40:.1f}, p80={p80:.1f}"
        )

        # Second pass: assign buckets
        bucket_counts = {'easy': 0, 'medium': 0, 'hard': 0}
        for sample in samples:
            bucket = assign_difficulty_bucket(sample['difficulty_score'], percentiles)
            sample['difficulty_bucket'] = bucket
            bucket_counts[bucket] += 1

        logger.info(f"Domain {domain}: bucket distribution: {bucket_counts}")

    return domain_data


def generate_curriculum_dataset(
    domain_data: Dict[str, List[Dict[str, Any]]],
    batch_size: int,
    max_steps: int,
    seed: int = 3407,
    num_generations: int = 1,
) -> List[Dict[str, Any]]:
    """
    Pre-generate all training samples with curriculum learning and domain balancing.

    This generates a fixed sequence of samples that:
    - Ensures each batch has equal samples from each domain
    - Follows curriculum learning schedule (easy -> hard over training)
    - Is deterministic given the seed

    Args:
        domain_data: Dict mapping domain -> list of samples
        batch_size: Total batch size
        max_steps: Number of training steps
        seed: Random seed

    Returns:
        List of samples in the order they should be trained
    """
    domains = sorted(domain_data.keys())
    num_domains = len(domains)

    # Calculate prompts per step: GRPO generates num_generations completions per prompt,
    # so each step only needs batch_size/num_generations prompts
    prompts_per_step = batch_size // num_generations

    # Validate prompts_per_step is divisible by num_domains for balanced batching
    if prompts_per_step % num_domains != 0:
        raise ValueError(
            f"prompts_per_step ({prompts_per_step} = batch_size/num_generations = "
            f"{batch_size}/{num_generations}) must be divisible by num_domains ({num_domains}). "
            f"Domains: {domains}"
        )

    samples_per_domain = prompts_per_step // num_domains

    # Organize samples by domain and difficulty bucket
    domain_buckets = {}
    for domain in domains:
        buckets = {'easy': [], 'medium': [], 'hard': []}
        for sample in domain_data[domain]:
            bucket = sample.get('difficulty_bucket', 'medium')
            buckets[bucket].append(sample)
        domain_buckets[domain] = buckets

        logger.info(
            f"Domain {domain}: "
            f"easy={len(buckets['easy'])}, "
            f"medium={len(buckets['medium'])}, "
            f"hard={len(buckets['hard'])}"
        )

    # Initialize RNG
    rng = np.random.RandomState(seed)

    # Generate all samples
    all_samples = []

    for step in range(max_steps):
        # Get curriculum weights for this step
        weights = get_curriculum_weights(step, max_steps)

        # Log curriculum weights periodically
        if step % 100 == 0:
            logger.info(
                f"Step {step}/{max_steps}: "
                f"curriculum weights = {weights}"
            )

        # Generate one batch worth of samples
        batch_samples = []

        for domain in domains:
            buckets = domain_buckets[domain]

            # Sample according to curriculum weights
            for _ in range(samples_per_domain):
                # Choose bucket based on curriculum weights
                bucket = rng.choice(
                    ['easy', 'medium', 'hard'],
                    p=[weights['easy'], weights['medium'], weights['hard']]
                )

                # Get samples from this bucket
                bucket_samples = buckets[bucket]
                if len(bucket_samples) == 0:
                    # Fallback: try other buckets if this one is empty
                    for fallback_bucket in ['medium', 'easy', 'hard']:
                        if len(buckets[fallback_bucket]) > 0:
                            bucket_samples = buckets[fallback_bucket]
                            break

                if len(bucket_samples) == 0:
                    raise ValueError(f"Domain {domain} has no samples in any bucket!")

                # Randomly select one sample from this bucket
                sample = bucket_samples[rng.randint(len(bucket_samples))]
                batch_samples.append(sample)

        # NOTE: Removed shuffle to preserve domain balance within each batch.
        # GRPO trainer will sample exactly prompts_per_step items per step,
        # so keeping domains ordered ensures each batch has equal domain coverage.

        # Add to full sample list
        all_samples.extend(batch_samples)

    logger.info(f"Generated {len(all_samples)} samples for {max_steps} steps")

    return all_samples
