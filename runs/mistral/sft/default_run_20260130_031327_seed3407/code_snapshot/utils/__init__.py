"""
Utility modules for evaluation, training, and run management.
"""

# Original validation utilities (from utils.py)
from .validation import (
    extract_llm_output,
    _classify_result,
    validate_solution,
    compute_reward,
    log_reward_batch_stats,
)

# Run registry utilities
from .run_registry import (
    build_model_path_index,
    find_run_by_model_path,
    get_run_id,
    generate_eval_id,
    get_eval_output_dir,
    update_run_evals,
)

# Eval aggregator utilities
from .eval_aggregator import (
    aggregate_scenario_results,
    write_metrics_json,
    write_eval_config,
    aggregate_and_write_metrics,
    print_metrics_summary,
)

# Run manager utilities (training run lifecycle)
from .run_manager import (
    RunContext,
    create_run,
    finalize_run,
    mark_unknown,
    write_atomic_json,
    write_config_snapshot,
    update_wandb_url,
    generate_run_id,
    get_git_info,
    add_run_args,
    extract_run_args,
    LogRedirector,
)

# Difficulty parsing and scoring utilities
from .difficulty import (
    parse_difficulty_from_filename,
    compute_difficulty_score,
    assign_difficulty_bucket,
)

# Curriculum learning schedule utilities
from .curriculum import (
    get_curriculum_weights,
)

# Multi-domain data loading utilities
from .data_loader import (
    load_multi_domain_data,
    compute_difficulty_scores_and_buckets,
    generate_curriculum_dataset,
)

# Generic reward calculation utilities
from .reward import (
    RewardConfig,
    REWARD_ANCHORS,
    REWARD_RANGES,
    get_base_reward,
    parse_plan_size,
    parse_violation_step,
    parse_precondition_violation_step,
    parse_precondition_violation_count,
    parse_safety_violation_count,
    parse_unsatisfied_goals_from_validator,
    parse_solution_length,
    parse_total_goals_from_problem,
    compute_safety_violation_reward,
    compute_precondition_violation_reward,
    compute_goal_satisfaction_reward,
    compute_reward_from_validation,
    compute_reward_from_result,
    compute_rewards_for_results,
    get_reward_statistics,
    get_reward_calculator,
    compute_scenario_reward,
    GenericRewardCalculator,
    get_supported_scenarios,
    print_reward_summary,
    test_reward_computation,
)

# Benchmark output utilities
from .benchmark_output import (
    create_benchmark_run_dir,
    save_run_config,
    extract_size_key,
    compute_level_statistics,
    compute_overall_statistics,
    save_results_with_levels,
    save_summary,
    get_command_string,
    print_benchmark_summary,
    DEFAULT_BENCHMARK_DIR,
)

# Domain-specific utilities
from .domains.blocksworld import (
    # State types
    State,
    ActionStr,
    Trajectory,
    # Core simulation
    normalize_atom,
    parse_action,
    transition,
    simulate_plan,
    # State helpers
    is_on,
    is_on_table,
    # Constraint checking
    check_sometime_before_constraint,
    safety_score_sometime_before,
    precondition_violation_score,
    goal_score,
    # Reward functions
    blocksworld_reward1,
    blocksworld_reward2,
    reward_baseline,
    # PDDL parsing
    parse_blocksworld_pddl,
    parse_plan_from_completion,
    compute_blocksworld_reward_from_meta,
)

__all__ = [
    # benchmark_output
    "create_benchmark_run_dir",
    "save_run_config",
    "extract_size_key",
    "compute_level_statistics",
    "compute_overall_statistics",
    "save_results_with_levels",
    "save_summary",
    "get_command_string",
    "print_benchmark_summary",
    "DEFAULT_BENCHMARK_DIR",
    # validation (original utils.py)
    "extract_llm_output",
    "_classify_result",
    "validate_solution",
    "compute_reward",
    "log_reward_batch_stats",
    # run_registry
    "build_model_path_index",
    "find_run_by_model_path",
    "get_run_id",
    "generate_eval_id",
    "get_eval_output_dir",
    "update_run_evals",
    # eval_aggregator
    "aggregate_scenario_results",
    "write_metrics_json",
    "write_eval_config",
    "aggregate_and_write_metrics",
    "print_metrics_summary",
    # run_manager
    "RunContext",
    "create_run",
    "finalize_run",
    "mark_unknown",
    "write_atomic_json",
    "write_config_snapshot",
    "update_wandb_url",
    "generate_run_id",
    "get_git_info",
    "add_run_args",
    "extract_run_args",
    "LogRedirector",
    # difficulty
    "parse_difficulty_from_filename",
    "compute_difficulty_score",
    "assign_difficulty_bucket",
    # curriculum
    "get_curriculum_weights",
    # data_loader
    "load_multi_domain_data",
    "compute_difficulty_scores_and_buckets",
    "generate_curriculum_dataset",
    # reward
    "RewardConfig",
    "REWARD_ANCHORS",
    "REWARD_RANGES",
    "get_base_reward",
    "parse_plan_size",
    "parse_violation_step",
    "parse_precondition_violation_step",
    "parse_precondition_violation_count",
    "parse_safety_violation_count",
    "parse_unsatisfied_goals_from_validator",
    "parse_solution_length",
    "parse_total_goals_from_problem",
    "compute_safety_violation_reward",
    "compute_precondition_violation_reward",
    "compute_goal_satisfaction_reward",
    "compute_reward_from_validation",
    "compute_reward_from_result",
    "compute_rewards_for_results",
    "get_reward_statistics",
    "get_reward_calculator",
    "compute_scenario_reward",
    "GenericRewardCalculator",
    "get_supported_scenarios",
    "print_reward_summary",
    "test_reward_computation",
    # domains.blocksworld
    "State",
    "ActionStr",
    "Trajectory",
    "normalize_atom",
    "parse_action",
    "transition",
    "simulate_plan",
    "is_on",
    "is_on_table",
    "check_sometime_before_constraint",
    "safety_score_sometime_before",
    "precondition_violation_score",
    "goal_score",
    "blocksworld_reward1",
    "blocksworld_reward2",
    "reward_baseline",
    "parse_blocksworld_pddl",
    "parse_plan_from_completion",
    "compute_blocksworld_reward_from_meta",
]
