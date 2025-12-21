#!/usr/bin/env python3
"""
GRPO Training Script using Unsloth for PDDL-style planning models.

Dataset format (JSONL per line):
- prompt (str)               : required
- response (str, optional)   : UNUSED for GRPO (model在线生成)
- class_label (str, optional): 作为备份标签
- meta (dict, optional)      : 包含 domain_file / problem_file 等，用于 VAL 校验

Reward Structure (Normalized to [-1, 1] for stable GRPO training):
- plan_format_error: -1.0 (floor)
- safety_constraints_violation: [-0.9, -0.6]
- precondition_violation: [-0.6, -0.3]
- goal_not_satisfied: [-0.3, 0.0]
- success_plans: 1.0 (ceiling)

Usage:
    python train_grpo_unsloth_stl.py --base_model <model_path_or_hub_id> --dataset <ppo_dataset.jsonl> --output_dir <output_path>
"""
import argparse
import json
import logging
import os
import re
import statistics
from pathlib import Path
from typing import Any, Dict, List, Optional
from collections import Counter

import torch
from datasets import Dataset
from unsloth import FastLanguageModel

import wandb  # type: ignore

from trl import GRPOConfig, GRPOTrainer  # type: ignore

from utils import _classify_result, extract_llm_output, validate_solution
from utils_generic_reward import (
    compute_reward_from_validation,
    get_supported_scenarios,
    print_reward_summary,
)

from unsloth import is_bfloat16_supported as _unsloth_bf16_ok

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("grpo_unsloth")
REPO_ROOT = Path(__file__).resolve().parent.parent

# Used to keep GRPO validation consistent with evaluate_llm_solver.py
# Set in main() based on args.base_model.
MODEL_FAMILY_FOR_EXTRACTION = "mistral"

# -----------------------------------------------------------------------------
# Scenario-Agnostic Reward Functions (Using Generic Framework)
# -----------------------------------------------------------------------------
# 使用 utils_generic_reward.py 中的通用框架
# 支持所有场景: blocksworld, ferry, grippers, spanner, delivery, etc.
# 通过解析 VAL validator 输出来计算 reward，无需场景特定逻辑

SUPPORTED_SCENARIOS = get_supported_scenarios()
logger.info(f"Supported scenarios for generic reward: {SUPPORTED_SCENARIOS}")

# This script currently uses the dense, scenario-agnostic reward in
# `script/utils_generic_reward.py` (normalized to [-1, 1]).
REWARD_TYPE = "dense"


# -----------------------------------------------------------------------------
# Validation
# -----------------------------------------------------------------------------
def classify_with_validator(meta: Any, response_text: str) -> tuple[Optional[str], str]:
    """
    Run VAL validation and classify using utils._classify_result.

    Returns:
        (class_label, validation_stdout) tuple
        - class_label: Classification result or None if validation failed
        - validation_stdout: Raw validator output (empty string if failed)
    """
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
    # Align with offline evaluator: strip any non-plan text and keep only trailing "(...)" lines.
    cleaned_plan = extract_llm_output(response_text, family=MODEL_FAMILY_FOR_EXTRACTION)
    _, _, stdout, _, _ = validate_solution(str(domain_path), str(problem_path), cleaned_plan)
    return _classify_result(stdout), stdout


DEBUG_FILE = "reward_debug.log"

# Global variable to store logging_steps for debug printing
LOGGING_STEPS = 10


def grpo_reward_func(
    prompts: List[str],
    completions: List[str],
    meta: Optional[List[Any]] = None,
    class_label: Optional[List[Optional[str]]] = None,
    trainer_state=None,
    **kwargs,
) -> List[float]:
    """
    GRPO reward function using the generic reward calculator.

    Reward ranges (normalized to [-1, 1]):
    - plan_format_error: -1.0 (floor)
    - safety_constraints_violation: [-0.9, -0.6]
    - precondition_violation: [-0.6, -0.3]
    - goal_not_satisfied: [-0.3, 0.0]
    - success_plans: 1.0 (ceiling)
    """
    n = len(completions)
    if meta is None:
        meta = [None] * n
    if class_label is None:
        class_label = [None] * n

    rewards: List[float] = []
    all_labels: List[str] = []
    all_scenarios: List[str] = []  # 收集场景信息
    reward_methods: List[str] = []  # 收集 reward 计算方法

    # ---------- debug: 打开文件，只 append ----------
    if not os.path.exists(DEBUG_FILE):
        with open(DEBUG_FILE, "w") as f:
            f.write("=== GRPO REWARD DEBUG LOG ===\n")

    for i, (prompt, completion, m, label) in enumerate(
        zip(prompts, completions, meta, class_label)
    ):
        # 提取场景信息
        scenario = "unknown"
        if isinstance(m, dict):
            scenario = m.get("scenario", "unknown")
            if not isinstance(scenario, str):
                scenario = "unknown"
        all_scenarios.append(scenario)

        # ---------- debug: 打印每个生成的 plan（按 logging_steps 间隔，每个 batch 只打印第一个样本） ----------
        should_log = (
            trainer_state is not None
            and trainer_state.global_step % LOGGING_STEPS == 0
            and i == 0  # 只在每个 batch 的第一个样本时打印，避免重复
        )
        if should_log:
            step_str = str(trainer_state.global_step)
            problem_rel = m.get("problem_file") if isinstance(m, dict) else None
            problem_rel = problem_rel if isinstance(problem_rel, str) else ""
            print("\n" + "=" * 80)
            print(f"[REWARD] step={step_str} sample_idx={i} scenario={scenario} problem_file={problem_rel}")
            print("[REWARD] completion(plan):")
            print(completion)
            print("=" * 80 + "\n")

        # 1. validator 推断 label 和获取 validation_stdout
        inferred_label, validation_stdout = classify_with_validator(m, completion)

        # 2. fallback：使用数据集原始 label
        if inferred_label is None and isinstance(label, str):
            inferred_label = label

        # 3. 保存 label
        if inferred_label is not None:
            all_labels.append(inferred_label)
        else:
            inferred_label = "unknown"
            all_labels.append("unknown")

        # 4. 计算 reward - 使用通用 dense reward 函数
        r = -1
        reward_method = "unknown"
        if inferred_label != "unknown":
            # 特判：goal_not_satisfied + 空计划（Plan size: 0）视为 reward hacking
            # 直接给最大惩罚（与 plan_format_error 同档）：-1.0
            if inferred_label == "goal_not_satisfied" and re.search(r"Plan size:\s*0\b", validation_stdout or ""):
                r = -1.0
                reward_method = "empty_plan"
            else:
                # 获取 problem_file 路径用于解析 goal 信息
                problem_file = None
                if isinstance(m, dict) and m.get("problem_file"):
                    problem_file = str(REPO_ROOT / m["problem_file"])

                # 使用通用 reward 计算（解析 validation_stdout）
                r = compute_reward_from_validation(
                    category=inferred_label,
                    validation_stdout=validation_stdout,
                    problem_file=problem_file,
                )
                reward_method = "dense"
        rewards.append(float(r))
        reward_methods.append(reward_method)


    # ============ 统计并 wandb.log ============
    if all_labels:
        counts = Counter(all_labels)
        total = len(all_labels)

        log_dict = {"stats/total_samples": total}

        for category in [
            "success_plans",
            "goal_not_satisfied",
            "plan_format_error",
            "precondition_violation",
            "safety_constraints_violation",
            "unknown",
        ]:
            c = counts.get(category, 0)
            log_dict[f"stats/count_{category}"] = c
            log_dict[f"stats/rate_{category}"] = c / total

        # 统计场景分布
        if all_scenarios:
            scenario_counts = Counter(all_scenarios)
            # 记录主要场景（出现最多的场景）
            main_scenario = scenario_counts.most_common(1)[0][0] if scenario_counts else "unknown"
            log_dict["batch/main_scenario"] = main_scenario
            
            # 记录场景分布（每个场景的数量和比例）
            for scenario_name, count in scenario_counts.items():
                log_dict[f"batch/scenario_count_{scenario_name}"] = count
                log_dict[f"batch/scenario_rate_{scenario_name}"] = count / total

        # 计算整个 batch 的 reward 的 mean 和 std
        if rewards:
            reward_mean = statistics.mean(rewards)
            reward_std = statistics.stdev(rewards) if len(rewards) > 1 else 0.0
            log_dict["stats/reward_mean"] = reward_mean
            log_dict["stats/reward_std"] = reward_std

            # 统计 reward 方法使用情况
            if reward_methods:
                method_counts = Counter(reward_methods)
                for method, count in method_counts.items():
                    log_dict[f"reward_method/count_{method}"] = count
                    log_dict[f"reward_method/rate_{method}"] = count / total

            # ============ 强制打印（stdout + 文件）- 整个 batch 的统计 ============
            main_scenario_str = log_dict.get("batch/main_scenario", "unknown")
            main_reward_method = Counter(reward_methods).most_common(1)[0][0] if reward_methods else "default"
            msg = (
                f"[STEP {trainer_state.global_step if trainer_state else '?'}] "
                f"scenario={main_scenario_str}, "
                f"reward_method={main_reward_method}, "
                f"batch_reward_mean={reward_mean:.4f}, batch_reward_std={reward_std:.4f}\n"
            )
            # 写到文件：永远有效
            with open(DEBUG_FILE, "a") as f:
                f.write(msg)
            # 按 logging_steps 间隔打印到 stdout
            should_log_stats = (
                trainer_state is not None
                and trainer_state.global_step % LOGGING_STEPS == 0
            )
            if should_log_stats:
                print(msg, end="")  # msg 已经包含了换行符

        # wandb 强制 log（确保打印）
        if wandb is not None:
            wandb.log(log_dict)

        # 同步写到 debug 文件
        with open(DEBUG_FILE, "a") as f:
            f.write(f"stats={log_dict}\n")

    return rewards


def load_grpo_dataset(
    dataset_path: str,
    prompt_field: str,
    response_field: Optional[str],
    class_label_field: str,
) -> Dataset:
    """Load GRPO dataset from JSONL file."""
    logger.info(f"Loading GRPO dataset from {dataset_path}")

    data: List[Dict[str, Any]] = []
    invalid_count = 0
    with open(dataset_path, "r", encoding="utf-8") as f:
        for line_num, line in enumerate(f, 1):
            if not line.strip():
                continue
            record = json.loads(line)

            prompt = record.get(prompt_field, "")
            if not prompt or not isinstance(prompt, str):
                invalid_count += 1
                logger.warning(f"Line {line_num}: Missing or invalid '{prompt_field}' field, skipping")
                continue

            entry: Dict[str, Any] = {"prompt": prompt}

            # 可选：预存的 response（GRPO 实际不会用，但你可以将来用在 reward 里）
            if response_field and isinstance(record.get(response_field), str):
                entry["response"] = record[response_field]

            # 可选：已有的 class_label（作为 fallback）
            if isinstance(record.get(class_label_field), str):
                entry["class_label"] = record[class_label_field]

            # PDDL 校验用 meta
            if isinstance(record.get("meta"), dict):
                entry["meta"] = record["meta"]

            data.append(entry)

    logger.info(f"Loaded {len(data)} GRPO samples (skipped {invalid_count} invalid records)")
    if len(data) == 0:
        raise ValueError("No valid GRPO samples found in dataset!")

    # 按照 meta 中的 scenario 排序，确保每个 batch 都是单一场景
    def get_scenario(entry: Dict[str, Any]) -> str:
        """从 entry 的 meta 中提取 scenario，如果没有则返回 'unknown'"""
        meta = entry.get("meta")
        if isinstance(meta, dict):
            scenario = meta.get("scenario", "unknown")
            if isinstance(scenario, str):
                return scenario
        return "unknown"

    # 按 scenario 排序
    data_sorted = sorted(data, key=get_scenario)
    
    # 统计各场景的数量
    scenario_counts = {}
    for entry in data_sorted:
        scenario = get_scenario(entry)
        scenario_counts[scenario] = scenario_counts.get(scenario, 0) + 1
    
    logger.info(f"Dataset sorted by scenario. Scenario distribution: {scenario_counts}")

    ds = Dataset.from_list(data_sorted)
    required = {"prompt"}
    missing = required - set(ds.column_names)
    if missing:
        raise ValueError(
            f"GRPO dataset missing required columns: {missing}; need: {sorted(list(required))}"
        )
    return ds


# -----------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------
def main():
    parser = argparse.ArgumentParser(description="Train a model using GRPO with Unsloth on PDDL planning data")

    # Required
    parser.add_argument("--base_model", required=True, help="Path or HF Hub ID of the base (SFT) model")
    parser.add_argument("--dataset", required=True, help="Path to dataset JSONL file (prompts + meta etc.)")
    parser.add_argument("--output_dir", required=True, help="Output directory for trained model")

    # Training / GRPO 基本参数
    parser.add_argument("--num_epochs", type=float, default=1.0, help="Number of GRPO training epochs")
    parser.add_argument("--batch_size", type=int, default=4, help="per_device_train_batch_size for GRPO")
    parser.add_argument("--learning_rate", type=float, default=1e-5, help="Learning rate")
    parser.add_argument("--gradient_accumulation_steps", type=int, default=1, help="Gradient accumulation steps")
    parser.add_argument("--max_grad_norm", type=float, default=1.0, help="Gradient clipping")
    parser.add_argument("--num_generations", type=int, default=4, help="G: number of completions per prompt")
    parser.add_argument("--beta", type=float, default=0.02, help="KL penalty coefficient (beta). Lower values reduce KL penalty in loss. If loss is too high due to large KL divergence, try reducing this (e.g., 0.001, 0.01)")

    # Generation
    parser.add_argument("--max_prompt_length", type=int, default=5000, help="Maximum prompt length")
    parser.add_argument("--max_new_tokens", type=int, default=1024, help="Max completion length for GRPO")
    parser.add_argument("--temperature", type=float, default=0.6, help="Sampling temperature")
    parser.add_argument("--top_p", type=float, default=0.9, help="Top-p nucleus sampling")
    parser.add_argument("--top_k", type=int, default=50, help="Top-k sampling")

    # Logging / saving
    parser.add_argument("--save_steps", type=int, default=50, help="Save checkpoint every N steps (0 to disable)")
    parser.add_argument("--logging_steps", type=int, default=10, help="Log every N steps")
    parser.add_argument("--no_wandb", action="store_true", help="Disable Weights & Biases logging")
    parser.add_argument("--max_steps", type=int, default=1000, help="Maximum number of training steps")
    parser.add_argument("--wandb_project", default="pddl-grpo-training", help="W&B project name")
    parser.add_argument("--run_name", default=None, help="Run name for logging")

    # Dataset field names
    parser.add_argument("--prompt_field", default="prompt", help="Field name for prompts")
    parser.add_argument("--response_field", default="response", help="Field name for optional stored responses")
    parser.add_argument("--class_label_field", default="class_label", help="Field name for reward class labels")

    # Model options
    parser.add_argument("--no_4bit", action="store_true", help="Disable 4-bit quantization (default is 4-bit on)")
    parser.add_argument("--use_gradient_checkpointing", action="store_true", help="Enable Unsloth gradient checkpointing")
    parser.add_argument("--dataloader_num_workers", type=int, default=0, help="(Unused by GRPOTrainer, kept for compat)")

    args = parser.parse_args()

    # Set global logging_steps for reward function
    global LOGGING_STEPS
    LOGGING_STEPS = args.logging_steps

    if not os.path.exists(args.dataset):
        raise ValueError(f"Dataset path does not exist: {args.dataset}")

    os.makedirs(args.output_dir, exist_ok=True)

    # 默认使用 4-bit 量化（除非明确禁用）
    load_in_4bit = not args.no_4bit
    if load_in_4bit:
        logger.info("Loading model in 4-bit quantization (default)")
    else:
        logger.warning("Loading model in full precision (4-bit quantization disabled)")

    # W&B（默认启用，通过 GRPOConfig.report_to 集成，不手动 wandb.init）
    use_wandb = (not args.no_wandb) and (wandb is not None)
    if (not args.no_wandb) and (wandb is None):
        logger.warning("wandb is not installed/importable; disabling W&B logging.")

    # 模型类型（用于日志提示）
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

    # 选择混精度：优先 bf16，不支持则用 fp16（仅 CUDA）
    bf16_ok = bool(_unsloth_bf16_ok()) if _unsloth_bf16_ok is not None else torch.cuda.is_bf16_supported()
    use_fp16 = torch.cuda.is_available() and not bf16_ok

    # 加载模型（注意：不要把 use_gradient_checkpointing 传到 from_pretrained）
    logger.info(f"Loading model with Unsloth from {args.base_model}")
    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=args.base_model,
        max_seq_length=args.max_prompt_length + args.max_new_tokens,
        dtype=None,  # auto
        load_in_4bit=load_in_4bit,
        load_in_8bit=False,
    )

    # 训练前设置（Unsloth 的 GC 建议用字符串 "unsloth"）
    gc_flag: Any = "unsloth" if args.use_gradient_checkpointing else False
    FastLanguageModel.for_training(model, use_gradient_checkpointing=gc_flag)

    # 禁用 KV cache，避免显存波动
    if hasattr(model, "config"):
        model.config.use_cache = False

    # tokenizer pad token + **GRPO 要求左侧 padding**
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token
    tokenizer.padding_side = "left"

    # 加载数据（只保留 prompt / response / class_label / meta）
    dataset = load_grpo_dataset(
        args.dataset,
        prompt_field=args.prompt_field,
        response_field=args.response_field,
        class_label_field=args.class_label_field,
    )
    logger.info(f"Training dataset size: {len(dataset)}; columns: {dataset.column_names}")
    
    # ============ 打印 Reward Function 配置信息 ============
    print("=" * 70)
    print("Reward Function Configuration:")
    print(f"  Reward Type: {REWARD_TYPE}")
    print("  Using dense reward: Generic reward calculator (normalized to [-1, 1])")
    print("  Supported scenarios:", SUPPORTED_SCENARIOS)
    print_reward_summary()
    print("=" * 70)
    
    # 使用整个数据集作为训练集（不进行 train/test split）
    # 数据集已经在 load_grpo_dataset 中按 scenario 排序，确保每个 batch 都是单一场景
    train_dataset = dataset
    
    # 验证排序后的场景分布
    def get_scenario_from_row(row):
        """从 dataset row 中提取 scenario"""
        meta = row.get("meta")
        if isinstance(meta, dict):
            scenario = meta.get("scenario", "unknown")
            if isinstance(scenario, str):
                return scenario
        return "unknown"
    
    train_scenarios = [get_scenario_from_row(train_dataset[i]) for i in range(min(100, len(train_dataset)))]
    logger.info(f"First 100 train samples scenarios: {Counter(train_scenarios)}")

    # 手动初始化 wandb（参考 pddl_finetune.py）
    if use_wandb:
        # 从数据集路径中提取数据集名称（文件名，不含扩展名）
        dataset_name = Path(args.dataset).stem if args.dataset else "unknown"
        
        wandb_run_name = args.run_name or f"grpo-unsloth-{os.path.basename(args.base_model)}"
        wandb.init(
            project=args.wandb_project,
            name=wandb_run_name,
            config={
                "model_name": args.base_model,
                "model_type": model_type,
                "dataset": args.dataset,
                "dataset_name": dataset_name,
                "output_dir": args.output_dir,
                "max_seq_length": args.max_prompt_length + args.max_new_tokens,
                "load_in_4bit": load_in_4bit,
                "dataset_size": len(dataset),
                "train_size": len(train_dataset),
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
                    "reward_type": REWARD_TYPE,  # dense reward normalized to [-1, 1]
                }
        )

    # GRPOConfig：对应原来 PPOConfig 的超参
    # 注意：如果 loss 过大（通常由 KL 散度过大导致），可以尝试：
    # 1. 降低 beta（减小 KL 惩罚，如 --beta 0.001 或 0.01）
    # 2. 降低学习率（让模型更新更温和，减少 KL 散度）
    # 3. 增加 max_grad_norm（允许更大的梯度，但需谨慎）
    grpo_config = GRPOConfig(
        output_dir=args.output_dir,

        # 用 max_steps 控制总训练量
        max_steps=args.max_steps,        # 比如 5000

        per_device_train_batch_size=args.batch_size,
        gradient_accumulation_steps=args.gradient_accumulation_steps,
        learning_rate=args.learning_rate,  # 如果 loss 过大，可以降低学习率（如 5e-6）
        max_grad_norm=args.max_grad_norm,  # 梯度裁剪，防止梯度爆炸
        bf16=bf16_ok,
        fp16=use_fp16,

        logging_steps=args.logging_steps,
        save_steps=args.save_steps if args.save_steps > 0 else 0,
        save_strategy="steps" if args.save_steps > 0 else "no",

        report_to=["wandb"] if use_wandb else [],
        run_name=args.run_name or f"grpo-unsloth-{os.path.basename(args.base_model)}",

        # Data / generation 相关
        remove_unused_columns=False,
        max_prompt_length=args.max_prompt_length,
        max_completion_length=args.max_new_tokens,
        num_generations=args.num_generations,
        temperature=args.temperature,
        top_p=args.top_p,
        top_k=args.top_k,
        beta=args.beta,  # KL penalty coefficient. Lower if loss is too high due to large KL divergence
        save_total_limit=2,
        do_eval=False,
    )

    # 构建 GRPOTrainer
    trainer = GRPOTrainer(
        model=model,
        args=grpo_config,
        reward_funcs=grpo_reward_func,
        train_dataset=train_dataset,
        processing_class=tokenizer,
    )

    logger.info("Starting GRPO training...")
    trainer.train()

    logger.info(f"Saving final model to {args.output_dir}")
    trainer.save_model(args.output_dir)
    tokenizer.save_pretrained(args.output_dir)

    logger.info("GRPO training completed successfully!")


if __name__ == "__main__":
    main()
