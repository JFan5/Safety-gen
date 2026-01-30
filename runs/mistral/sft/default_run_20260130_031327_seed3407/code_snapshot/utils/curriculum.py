"""
Curriculum learning schedule utilities for GRPO training.

This module provides functions to compute curriculum weights
based on training progress.
"""

from typing import Dict


def get_curriculum_weights(step: int, max_steps: int) -> Dict[str, float]:
    """
    Get curriculum learning weights based on training progress.

    Schedule:
    - step_ratio < 0.3:  easy=0.7, medium=0.25, hard=0.05
    - 0.3 <= step_ratio < 0.7:  easy=0.4, medium=0.4, hard=0.2
    - step_ratio >= 0.7:  easy=0.2, medium=0.4, hard=0.4

    Args:
        step: Current training step
        max_steps: Maximum training steps

    Returns:
        Dict with 'easy', 'medium', 'hard' weights
    """
    step_ratio = step / max(max_steps, 1)

    if step_ratio < 0.3:
        return {'easy': 0.7, 'medium': 0.25, 'hard': 0.05}
    elif step_ratio < 0.7:
        return {'easy': 0.4, 'medium': 0.4, 'hard': 0.2}
    else:
        return {'easy': 0.2, 'medium': 0.4, 'hard': 0.4}
