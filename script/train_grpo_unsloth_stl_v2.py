#!/usr/bin/env python3
"""
GRPO Training Script V2 with Curriculum Learning & Domain-Balanced Batching.

Key improvements over V1:
1. Multi-domain data loading from /jfan5/grpo_data/five_domain_0109/
2. Difficulty scoring based on problem_file name parsing (n, r, o parameters)
3. Difficulty bucketing within each domain (easy 40%, medium 40%, hard 20%)
4. Curriculum learning schedule based on training progress
5. Batch-level domain balancing using custom IterableDataset

Dataset format (JSONL per line):
- prompt (str)               : required
- response (str, optional)   : UNUSED for GRPO (model generates online)
- class_label (str, optional): fallback label
- meta (dict, optional)      : contains domain_file / problem_file for validation

Reward Structure (same as V1, normalized to [-1, 1]):
- plan_format_error: -1.0
- safety_constraints_violation: [-0.9, -0.6]
- precondition_violation: [-0.6, -0.3]
- goal_not_satisfied: [-0.3, 0.0]
- success_plans: 1.0

Usage:
    # Train on all domains:
    python train_grpo_unsloth_stl_v2.py \
        --base_model <model_path> \
        --data_root /jfan5/grpo_data/five_domain_0109 \
        --output_dir <output_path> \
        --batch_size 8 \
        --max_steps 1000

    # Train on a single domain:
    python train_grpo_unsloth_stl_v2.py \
        --base_model <model_path> \
        --data_root /jfan5/grpo_data/five_domain_0109 \
        --domains blocksworld \
        --output_dir <output_path> \
        --batch_size 8 \
        --max_steps 1000

    # Train on multiple specific domains:
    python train_grpo_unsloth_stl_v2.py \
        --base_model <model_path> \
        --data_root /jfan5/grpo_data/five_domain_0109 \
        --domains blocksworld,ferry,grippers \
        --output_dir <output_path> \
        --batch_size 6 \
        --max_steps 1000
"""
import argparse
import logging
import os
import re
import shutil
from pathlib import Path
from typing import Any, List, Optional

import torch
from datasets import Dataset
from unsloth import FastLanguageModel

import wandb  # type: ignore

from trl import GRPOConfig, GRPOTrainer  # type: ignore

# Import from consolidated utils module
from utils import (
    _classify_result,
    extract_llm_output,
    log_reward_batch_stats,
    validate_solution,
    # Data loading (uses difficulty and curriculum functions internally)
    load_multi_domain_data,
    compute_difficulty_scores_and_buckets,
    generate_curriculum_dataset,
    # Reward
    compute_reward_from_validation,
    get_supported_scenarios,
    print_reward_summary,
)

from unsloth import is_bfloat16_supported as _unsloth_bf16_ok

# Import run management utilities
from utils.run_manager import RunContext, write_config_snapshot
from utils.reward import RewardConfig

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("grpo_unsloth_v2")
REPO_ROOT = Path(__file__).resolve().parent.parent

# Model family for plan extraction
MODEL_FAMILY_FOR_EXTRACTION = "mistral"

# Reward configuration
SUPPORTED_SCENARIOS = get_supported_scenarios()
REWARD_TYPE = "dense"

# Debug logging
DEBUG_FILE = "reward_debug.log"
LOGGING_STEPS = 10
GLOBAL_TOKENIZER = None
PROMPT_LENGTH_FILE = "prompt_lengths.txt"


# =============================================================================
# Reward Function (Same as V1)
# =============================================================================

def classify_with_validator(meta: Any, response_text: str) -> tuple[Optional[str], str]:
    """Run VAL validation and classify using utils._classify_result."""
    if not isinstance(meta, dict):
        return None, ""
    domain_rel = meta.get("domain_file")
    problem_rel = meta.get("problem_file")
    if not domain_rel or not problem_rel:
        return None, ""
    domain_path = REPO_ROOT / domain_rel
    problem_path = REPO_ROOT / problem_rel
    if not domain_path.exists() or not problem_path.exists():
        raise ValueError(f"Domain or problem file does not exist: {domain_path} or {problem_path}")
    cleaned_plan = extract_llm_output(response_text, family=MODEL_FAMILY_FOR_EXTRACTION)
    _, _, stdout, _, _ = validate_solution(str(domain_path), str(problem_path), cleaned_plan)
    return _classify_result(stdout), stdout


def grpo_reward_func(
    prompts: List[str],
    completions: List[str],
    meta: Optional[List[Any]] = None,
    class_label: Optional[List[Optional[str]]] = None,
    trainer_state=None,
    **_kwargs,
) -> List[float]:
    """GRPO reward function (same as V1)."""
    n = len(completions)
    if meta is None:
        meta = [None] * n
    if class_label is None:
        class_label = [None] * n

    rewards: List[float] = []
    all_labels: List[str] = []
    all_scenarios: List[str] = []
    reward_methods: List[str] = []
    prompt_lengths: List[int] = []
    completion_lengths: List[int] = []

    # Calculate prompt and completion token lengths
    if GLOBAL_TOKENIZER is not None:
        with open(PROMPT_LENGTH_FILE, "a") as f:
            for prompt in prompts:
                prompt_tokens = GLOBAL_TOKENIZER.encode(prompt, add_special_tokens=False)
                prompt_lengths.append(len(prompt_tokens))
                f.write(f"{len(prompt_tokens)}\n")
        for completion in completions:
            completion_tokens = GLOBAL_TOKENIZER.encode(completion, add_special_tokens=False)
            completion_lengths.append(len(completion_tokens))

    for prompt, completion, m, label in zip(prompts, completions, meta, class_label):
        # Extract scenario
        scenario = "unknown"
        if isinstance(m, dict):
            scenario = m.get("scenario", "unknown")
            if not isinstance(scenario, str):
                scenario = "unknown"
        all_scenarios.append(scenario)

        # Validate and classify
        inferred_label, validation_stdout = classify_with_validator(m, completion)

        # Fallback to dataset label
        if inferred_label is None and isinstance(label, str):
            inferred_label = label

        # Save label
        if inferred_label is not None:
            all_labels.append(inferred_label)
        else:
            inferred_label = "unknown"
            all_labels.append("unknown")

        # Compute reward
        r = -1
        reward_method = "unknown"
        if inferred_label != "unknown":
            # Empty plan hack detection
            if inferred_label == "goal_not_satisfied" and re.search(r"Plan size:\s*0\b", validation_stdout or ""):
                r = -1.0
                reward_method = "empty_plan"
            else:
                # Get problem_file for goal parsing
                problem_file = None
                if isinstance(m, dict) and m.get("problem_file"):
                    problem_file = str(REPO_ROOT / m["problem_file"])

                # Use generic dense reward
                r = compute_reward_from_validation(
                    category=inferred_label,
                    validation_stdout=validation_stdout,
                    problem_file=problem_file,
                )
                reward_method = "dense"
        rewards.append(float(r))
        reward_methods.append(reward_method)

    # Log statistics
    first_completion = completions[0] if completions else ""
    first_meta = meta[0] if meta and len(meta) > 0 else None

    log_reward_batch_stats(
        all_labels=all_labels,
        all_scenarios=all_scenarios,
        rewards=rewards,
        reward_methods=reward_methods,
        trainer_state=trainer_state,
        debug_file=DEBUG_FILE,
        logging_steps=LOGGING_STEPS,
        log_sample_plan=True,
        sample_idx=0,
        sample_completion=first_completion,
        sample_meta=first_meta,
        prompt_lengths=prompt_lengths if prompt_lengths else None,
        completion_lengths=completion_lengths if completion_lengths else None,
    )

    return rewards


# =============================================================================
# Training Function
# =============================================================================

def run_training(args, run_ctx=None):
    """Core training logic with V2 data loading."""
    global LOGGING_STEPS
    LOGGING_STEPS = args.logging_steps

    # === Save config snapshot with reward and curriculum parameters ===
    if run_ctx is not None:
        reward_cfg = RewardConfig()
        extra_config = {
            "reward_config": {
                "success_reward": reward_cfg.success_reward,
                "format_error_reward": reward_cfg.format_error_reward,
                "empty_plan_reward": reward_cfg.empty_plan_reward,
                "safety_violation_base": reward_cfg.safety_violation_base,
                "safety_violation_scale": reward_cfg.safety_violation_scale,
                "precondition_violation_base": reward_cfg.precondition_violation_base,
                "precondition_violation_scale": reward_cfg.precondition_violation_scale,
                "goal_not_satisfied_base": reward_cfg.goal_not_satisfied_base,
                "goal_not_satisfied_scale": reward_cfg.goal_not_satisfied_scale,
                "safety_fallback": reward_cfg.safety_fallback,
                "precondition_fallback": reward_cfg.precondition_fallback,
                "goal_fallback": reward_cfg.goal_fallback,
                "goal_no_info_fallback": reward_cfg.goal_no_info_fallback,
            },
            "curriculum_schedule": {
                "early_phase": {"threshold": 0.3, "weights": {"easy": 0.7, "medium": 0.25, "hard": 0.05}},
                "mid_phase": {"threshold": 0.7, "weights": {"easy": 0.4, "medium": 0.4, "hard": 0.2}},
                "late_phase": {"threshold": 1.0, "weights": {"easy": 0.2, "medium": 0.4, "hard": 0.4}},
            },
        }
        write_config_snapshot(run_ctx.run_dir, args, extra_config)
        logger.info(f"Saved config snapshot with reward and curriculum params to {run_ctx.run_dir}/config_snapshot.yaml")

        # === Save code snapshot for reproducibility ===
        code_snapshot_dir = run_ctx.run_dir / "code_snapshot"
        code_snapshot_dir.mkdir(parents=True, exist_ok=True)

        # Copy main training script
        script_dir = Path(__file__).resolve().parent
        main_script = Path(__file__).resolve()
        shutil.copy2(main_script, code_snapshot_dir / main_script.name)

        # Copy utils directory
        utils_src = script_dir / "utils"
        utils_dst = code_snapshot_dir / "utils"
        if utils_src.exists():
            if utils_dst.exists():
                shutil.rmtree(utils_dst)
            shutil.copytree(
                utils_src,
                utils_dst,
                ignore=shutil.ignore_patterns("__pycache__", "*.pyc", ".git")
            )

        logger.info(f"Saved code snapshot to {code_snapshot_dir}")

    if not os.path.exists(args.data_root):
        raise ValueError(f"Data root does not exist: {args.data_root}")

    # Load in 4-bit by default
    load_in_4bit = not args.no_4bit
    if load_in_4bit:
        logger.info("Loading model in 4-bit quantization (default)")
    else:
        logger.warning("Loading model in full precision (4-bit quantization disabled)")

    # W&B
    use_wandb = (not args.no_wandb) and (wandb is not None)
    if (not args.no_wandb) and (wandb is None):
        logger.warning("wandb is not installed/importable; disabling W&B logging.")
        # 如果没有提供 output_dir，需要先初始化 wandb 获取 run id
    if args.output_dir is None:
        if use_wandb:
            # 从数据集路径中提取数据集名称
            dataset_name = Path(args.data_root).stem if args.data_root else "unknown"
            # 从 base_model 中提取模型短名称
            model_short_name = os.path.basename(args.base_model).replace("/", "_")

            wandb_run_name = args.run_name or f"grpo-unsloth-{model_short_name}"
            wandb.init(
                project=args.wandb_project,
                name=wandb_run_name,
            )
            # 使用 wandb run id 生成唯一的 output_dir
            wandb_id = wandb.run.id  # e.g., "6xq2brly"
            args.output_dir = f"/jfan5/grpo_models/{model_short_name}_{dataset_name}_{wandb_id}"
            logger.info(f"Auto-generated output_dir with wandb id: {args.output_dir}")
        else:
            # 没有 wandb，使用时间戳生成唯一路径
            import time
            timestamp = time.strftime("%Y%m%d_%H%M%S")
            model_short_name = os.path.basename(args.base_model).replace("/", "_")
            dataset_name = Path(args.data_root).stem if args.data_root else "unknown"
            args.output_dir = f"/jfan5/grpo_models/{model_short_name}_{dataset_name}_{timestamp}"
            logger.info(f"Auto-generated output_dir with timestamp: {args.output_dir}")

    os.makedirs(args.output_dir, exist_ok=True)

    # Model type detection
    model_name = args.base_model
    if "llama" in model_name.lower():
        model_type = "llama"
    elif "mistral" in model_name.lower() or "mixtral" in model_name.lower():
        model_type = "mistral/mixtral"
    elif "qwen" in model_name.lower():
        model_type = "qwen"
    else:
        model_type = "auto"
    logger.info(f"Detected/assumed model family: {model_type}")
    global MODEL_FAMILY_FOR_EXTRACTION
    MODEL_FAMILY_FOR_EXTRACTION = "qwen" if model_type == "qwen" else "mistral"

    # Mixed precision
    bf16_ok = bool(_unsloth_bf16_ok()) if _unsloth_bf16_ok is not None else torch.cuda.is_bf16_supported()
    use_fp16 = torch.cuda.is_available() and not bf16_ok

    # Load model
    logger.info(f"Loading model with Unsloth from {args.base_model}")
    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=args.base_model,
        max_seq_length=args.max_prompt_length + args.max_new_tokens,
        dtype=None,
        load_in_4bit=load_in_4bit,
        load_in_8bit=False,
    )

    # Enable training
    gc_flag: Any = "unsloth" if args.use_gradient_checkpointing else False
    FastLanguageModel.for_training(model, use_gradient_checkpointing=gc_flag)

    # Disable KV cache
    if hasattr(model, "config"):
        model.config.use_cache = False

    # Tokenizer setup (LEFT padding for GRPO)
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token
    tokenizer.padding_side = "left"

    # Set global tokenizer
    global GLOBAL_TOKENIZER
    GLOBAL_TOKENIZER = tokenizer

    # Initialize prompt length file
    with open(PROMPT_LENGTH_FILE, "w") as f:
        f.write("# Prompt token lengths (one per line)\n")

    # ========================================================================
    # V2: Load multi-domain data and compute difficulty scores
    # ========================================================================
    logger.info("=" * 70)
    logger.info("V2: Loading multi-domain data with difficulty scoring")
    logger.info("=" * 70)

    # Parse domains argument
    domains_to_load = None
    if hasattr(args, 'domains') and args.domains:
        domains_to_load = [d.strip() for d in args.domains.split(',')]
        logger.info(f"User specified domains: {domains_to_load}")

    domain_data = load_multi_domain_data(args.data_root, domains=domains_to_load)
    logger.info(f"Loaded {len(domain_data)} domains: {sorted(domain_data.keys())}")

    # Compute difficulty scores and buckets
    domain_data = compute_difficulty_scores_and_buckets(domain_data)

    # Validate batch_size
    num_domains = len(domain_data)
    if args.batch_size % num_domains != 0:
        raise ValueError(
            f"batch_size ({args.batch_size}) must be divisible by num_domains ({num_domains}). "
            f"Domains: {sorted(domain_data.keys())}"
        )

    # Generate curriculum dataset (pre-generate all training samples)
    logger.info("Generating curriculum dataset...")
    curriculum_samples = generate_curriculum_dataset(
        domain_data=domain_data,
        batch_size=args.batch_size,
        max_steps=args.max_steps,
        seed=args.seed,
    )

    # Create Dataset from generated samples
    train_dataset = Dataset.from_list(curriculum_samples)

    logger.info(f"Created curriculum dataset:")
    logger.info(f"  - Domains: {sorted(domain_data.keys())}")
    logger.info(f"  - Total samples: {len(curriculum_samples)}")
    logger.info(f"  - Batch size: {args.batch_size}")
    logger.info(f"  - Samples per domain per batch: {args.batch_size // num_domains}")
    logger.info(f"  - Max steps: {args.max_steps}")
    logger.info(f"  - Seed: {args.seed}")
    logger.info(f"  - Dataset columns: {train_dataset.column_names}")

    # Print reward configuration
    print("=" * 70)
    print("Reward Function Configuration:")
    print(f"  Reward Type: {REWARD_TYPE}")
    print("  Using dense reward: Generic reward calculator (normalized to [-1, 1])")
    print("  Supported scenarios:", SUPPORTED_SCENARIOS)
    print_reward_summary()
    print("=" * 70)

    # Initialize W&B
    if use_wandb:
        wandb_run_name = args.run_name or f"grpo-v2-{os.path.basename(args.base_model)}"
        wandb.init(
            project=args.wandb_project,
            name=wandb_run_name,
            config={
                "model_name": args.base_model,
                "model_type": model_type,
                "data_root": args.data_root,
                "domains_arg": args.domains,  # User-specified domains argument
                "output_dir": args.output_dir,
                "max_seq_length": args.max_prompt_length + args.max_new_tokens,
                "load_in_4bit": load_in_4bit,
                "num_domains": num_domains,
                "domains": sorted(domain_data.keys()),  # Actually loaded domains
                "batch_size": args.batch_size,
                "gradient_accumulation_steps": args.gradient_accumulation_steps,
                "learning_rate": args.learning_rate,
                "max_grad_norm": args.max_grad_norm,
                "num_generations": args.num_generations,
                "temperature": args.temperature,
                "top_p": args.top_p,
                "top_k": args.top_k,
                "beta": args.beta,
                "max_steps": args.max_steps,
                "reward_type": REWARD_TYPE,
                "curriculum_learning": True,
                "version": "v2",
            }
        )
        # Update wandb URL in run.json
        if run_ctx is not None and wandb.run is not None:
            wandb_url = wandb.run.get_url()
            if wandb_url:
                run_ctx.update_wandb_url(wandb_url)
                logger.info(f"[run_manager] Updated wandb URL: {wandb_url}")

    # GRPOConfig
    grpo_config = GRPOConfig(
        output_dir=args.output_dir,
        max_steps=args.max_steps,
        per_device_train_batch_size=args.batch_size,
        gradient_accumulation_steps=args.gradient_accumulation_steps,
        learning_rate=args.learning_rate,
        max_grad_norm=args.max_grad_norm,
        bf16=bf16_ok,
        fp16=use_fp16,
        logging_steps=args.logging_steps,
        save_steps=args.save_steps if args.save_steps > 0 else 0,
        save_strategy="steps" if args.save_steps > 0 else "no",
        report_to=["wandb"] if use_wandb else [],
        run_name=args.run_name or f"grpo-v2-{os.path.basename(args.base_model)}",
        remove_unused_columns=False,
        max_prompt_length=args.max_prompt_length,
        max_completion_length=args.max_new_tokens,
        num_generations=args.num_generations,
        temperature=args.temperature,
        top_p=args.top_p,
        top_k=args.top_k,
        beta=args.beta,
        save_total_limit=4,
        do_eval=False,
        shuffle_dataset=False,  # 保持 curriculum 顺序，确保每个 batch domain 均衡
    )

    # Build GRPOTrainer
    trainer = GRPOTrainer(
        model=model,
        args=grpo_config,
        reward_funcs=grpo_reward_func,
        train_dataset=train_dataset,
        processing_class=tokenizer,
    )

    logger.info("Starting GRPO training (V2 with curriculum learning)...")
    trainer.train()

    logger.info(f"Saving final model to {args.output_dir}")
    trainer.save_model(args.output_dir)
    tokenizer.save_pretrained(args.output_dir)

    logger.info("GRPO training V2 completed successfully!")

    return args.output_dir


# =============================================================================
# Main Entry Point
# =============================================================================

def main():
    """Main entry point with run tracking."""
    parser = argparse.ArgumentParser(
        description="Train a model using GRPO V2 with curriculum learning and domain balancing"
    )

    # Required
    parser.add_argument("--base_model", required=True, help="Path or HF Hub ID of the base (SFT) model")
    parser.add_argument(
        "--data_root",
        required=True,
        help="Root directory containing domain JSONL files (e.g., /jfan5/grpo_data/five_domain_0109)"
    )
    parser.add_argument(
        "--domains",
        type=str,
        default=None,
        help="Comma-separated list of domains to train on (e.g., 'blocksworld' or 'blocksworld,ferry'). "
             "If not specified, all available domains will be used. "
             "Valid domains: blocksworld, ferry, grippers, spanner, delivery"
    )
    parser.add_argument("--output_dir", default=None, help="Output directory for trained model (auto-generated with wandb id if not provided)")

    # Training parameters
    parser.add_argument("--batch_size", type=int, default=8, help="Total batch size (must be divisible by num_domains)")
    parser.add_argument("--learning_rate", type=float, default=1e-5, help="Learning rate")
    parser.add_argument("--gradient_accumulation_steps", type=int, default=1, help="Gradient accumulation steps")
    parser.add_argument("--max_grad_norm", type=float, default=1.0, help="Gradient clipping")
    parser.add_argument("--num_generations", type=int, default=4, help="Number of completions per prompt")
    parser.add_argument("--beta", type=float, default=0.02, help="KL penalty coefficient")
    # Generation
    parser.add_argument("--max_prompt_length", type=int, default=1576, help="Maximum prompt length")
    parser.add_argument("--max_new_tokens", type=int, default=512, help="Max completion length (increased from 256 for longer plans)")
    parser.add_argument("--temperature", type=float, default=0.8, help="Sampling temperature")
    parser.add_argument("--top_p", type=float, default=0.9, help="Top-p nucleus sampling")
    parser.add_argument("--top_k", type=int, default=50, help="Top-k sampling")

    # Logging / saving
    parser.add_argument("--save_steps", type=int, default=50, help="Save checkpoint every N steps")
    parser.add_argument("--logging_steps", type=int, default=10, help="Log every N steps")
    parser.add_argument("--no_wandb", action="store_true", help="Disable Weights & Biases logging")
    parser.add_argument("--max_steps", type=int, default=1000, help="Maximum number of training steps")
    parser.add_argument("--wandb_project", default="pddl-grpo-training-v2", help="W&B project name")
    parser.add_argument("--run_name", default=None, help="Run name for logging")

    # Model options
    parser.add_argument("--no_4bit", action="store_true", help="Disable 4-bit quantization")
    parser.add_argument("--use_gradient_checkpointing", action="store_true", help="Enable gradient checkpointing")

    # Run management
    parser.add_argument("--runs_root", type=str, default="./runs", help="Root directory for runs")
    parser.add_argument("--seed", type=int, default=3407, help="Random seed")
    parser.add_argument("--no_run_tracking", action="store_true", help="Disable run tracking")
    parser.add_argument(
        "--no_model_subfolder",
        action="store_true",
        help="Use old directory structure runs/{method}/{run_id} instead of runs/{model_type}/{method}/{run_id}"
    )

    args = parser.parse_args()

    if args.no_run_tracking:
        run_training(args)
    else:
        with RunContext(
            method="grpo",
            args=args,
            runs_root=args.runs_root,
            run_name=args.run_name,
            seed=args.seed,
            base_model=args.base_model,
            dataset=args.data_root,
            output_dir=args.output_dir,
            wandb_project=args.wandb_project,
            wandb_run_name=args.run_name,
            extra_metadata={
                "reward_type": REWARD_TYPE,
                "beta": args.beta,
                "temperature": args.temperature,
                "max_steps": args.max_steps,
                "num_generations": args.num_generations,
                "curriculum_learning": True,
                "version": "v2",
                "domains": args.domains,  # User-specified domains
            },
            redirect_logs=True,
            use_model_subfolder=not args.no_model_subfolder,
        ) as run_ctx:
            run_training(args, run_ctx=run_ctx)


if __name__ == "__main__":
    main()
