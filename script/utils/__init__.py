"""
Utility modules for evaluation and run management.
"""

# Original validation utilities (from utils.py)
from .validation import (
    extract_llm_output,
    _classify_result,
    validate_solution,
    compute_reward,
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

__all__ = [
    # validation (original utils.py)
    "extract_llm_output",
    "_classify_result",
    "validate_solution",
    "compute_reward",
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
]
