#!/usr/bin/env python3
"""
GRPO Training Script V2 - With Configurable Reward Function.

This version adds:
1. RewardConfig for parameterized reward computation
2. STRENGTHENED goal_not_satisfied penalty: [-0.8, -0.2] (was [-0.3, 0.0])
3. Training script auto-copy to runs directory for reproducibility
4. Command-line args for reward configuration

Dataset format (JSONL per line):
- prompt (str)               : required
- response (str, optional)   : UNUSED for GRPO (model在线生成)
- class_label (str, optional): 作为备份标签
- meta (dict, optional)      : 包含 domain_file / problem_file 等，用于 VAL 校验

Reward Structure (STRENGTHENED, Normalized to [-1, 1] for stable GRPO training):
- plan_format_error: -1.0 (floor)
- safety_constraints_violation: [-0.9, -0.6]
- precondition_violation: [-0.6, -0.3]
- goal_not_satisfied: [-0.8, -0.2]  <-- STRENGTHENED (was [-0.3, 0.0])
- success_plans: 1.0 (ceiling)

Usage:
    python train_grpo_unsloth_chat_v2.py --base_model <model_path> --dataset <data.jsonl> --output_dir <output>

    # Use original (weaker) reward settings:
    python train_grpo_unsloth_chat_v2.py --use_default_reward ...

    # Custom reward parameters:
    python train_grpo_unsloth_chat_v2.py --goal_not_satisfied_base -0.7 --goal_not_satisfied_scale 0.5 ...
"""
import argparse
import hashlib
import json
import logging
import os
import re
import statistics
import sys
from pathlib import Path
from typing import Any, Dict, List, Optional
from collections import Counter

import torch
from datasets import Dataset
from unsloth import FastLanguageModel

import wandb  # type: ignore

from trl import GRPOConfig, GRPOTrainer  # type: ignore

from utils import (
    classify_result,
    extract_llm_output,
    log_reward_batch_stats,
    validate_solution,
    compute_reward_from_validation,
    get_supported_scenarios,
    print_reward_summary,
    RewardConfig,
)

from unsloth import is_bfloat16_supported as _unsloth_bf16_ok

# Import run management utilities
from utils.run_manager import (
    RunContext,
    update_wandb_url,
)

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("grpo_unsloth_chat_v2")
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
REWARD_TYPE = "dense_v2"  # Indicates strengthened goal_not_satisfied penalty

# Global RewardConfig - set in main() based on command-line args
# Default: STRENGTHENED config with goal_not_satisfied range [-0.8, -0.2]
GLOBAL_REWARD_CONFIG: Optional[RewardConfig] = None


# -----------------------------------------------------------------------------
# Chat Template Formatting
# -----------------------------------------------------------------------------
def get_chat_template_format(model_family: str) -> Dict[str, str]:
    """
    Get chat template format strings for different model families.

    Returns:
        Dict with 'prefix' and 'suffix' keys for wrapping prompts.
    """
    templates = {
        "mistral": {
            "prefix": "<s>[INST] ",
            "suffix": " [/INST]",
        },
        "llama": {
            "prefix": "<|begin_of_text|><|start_header_id|>user<|end_header_id|>\n\n",
            "suffix": "<|eot_id|><|start_header_id|>assistant<|end_header_id|>\n\n",
        },
        "qwen": {
            "prefix": "<|im_start|>user\n",
            "suffix": "<|im_end|>\n<|im_start|>assistant\n",
        },
        # Default fallback (generic instruction format)
        "default": {
            "prefix": "### User:\n",
            "suffix": "\n### Assistant:\n",
        },
    }
    return templates.get(model_family, templates["default"])


def format_prompt_with_chat_template(
    prompt: str,
    model_family: str,
    tokenizer=None,
    use_tokenizer_template: bool = True,
) -> str:
    """
    Wrap a raw prompt with chat template format.

    Args:
        prompt: The raw prompt text
        model_family: Model family string (mistral, llama, qwen, etc.)
        tokenizer: Optional tokenizer to use for apply_chat_template
        use_tokenizer_template: If True and tokenizer has chat_template, use it

    Returns:
        Formatted prompt with chat template wrapper
    """
    # Try using tokenizer's built-in chat_template first
    if use_tokenizer_template and tokenizer is not None:
        try:
            if hasattr(tokenizer, 'chat_template') and tokenizer.chat_template:
                messages = [{"role": "user", "content": prompt}]
                formatted = tokenizer.apply_chat_template(
                    messages,
                    tokenize=False,
                    add_generation_prompt=True,
                )
                return formatted
        except Exception as e:
            logger.warning(f"Failed to use tokenizer chat_template: {e}, falling back to manual format")

    # Fallback to manual formatting
    template = get_chat_template_format(model_family)
    return f"{template['prefix']}{prompt}{template['suffix']}"


# -----------------------------------------------------------------------------
# Validation
# -----------------------------------------------------------------------------
def classify_with_validator(meta: Any, response_text: str) -> tuple[Optional[str], str]:
    """
    Run VAL validation and classify using utils.classify_result.

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
    return classify_result(stdout), stdout


DEBUG_FILE = "reward_debug.log"

# Global variable to store logging_steps for debug printing
LOGGING_STEPS = 10

# Global tokenizer reference for token length statistics
GLOBAL_TOKENIZER = None

# File to store prompt token lengths
PROMPT_LENGTH_FILE = "prompt_lengths.txt"

# Global counter for generation diagnostics
GENERATION_CALL_COUNT = 0
NUM_GENERATIONS_GLOBAL = 4  # Will be set from args


def grpo_reward_func(
    prompts: List[str],
    completions: List[str],
    meta: Optional[List[Any]] = None,
    class_label: Optional[List[Optional[str]]] = None,
    trainer_state=None,
    **kwargs,
) -> List[float]:
    """
    GRPO reward function using the generic reward calculator with RewardConfig.

    STRENGTHENED reward ranges (normalized to [-1, 1]):
    - plan_format_error: -1.0 (floor)
    - safety_constraints_violation: [-0.9, -0.6]
    - precondition_violation: [-0.6, -0.3]
    - goal_not_satisfied: [-0.8, -0.2]  <-- STRENGTHENED (was [-0.3, 0.0])
    - success_plans: 1.0 (ceiling)

    Uses GLOBAL_REWARD_CONFIG for parameterized reward computation.
    """
    global GLOBAL_REWARD_CONFIG, GENERATION_CALL_COUNT, NUM_GENERATIONS_GLOBAL
    config = GLOBAL_REWARD_CONFIG if GLOBAL_REWARD_CONFIG is not None else RewardConfig()
    n = len(completions)

    # ============ Generation Diagnostics: Identical Completions Check ============
    # Check if completions within each GRPO group (same prompt) are identical
    GENERATION_CALL_COUNT += 1
    k = NUM_GENERATIONS_GLOBAL  # num_generations per prompt

    # Only print diagnostics every LOGGING_STEPS to avoid flooding
    should_print_diagnostics = (GENERATION_CALL_COUNT % LOGGING_STEPS == 1)

    if n > 0 and k > 0:
        n_groups = n // k if k > 0 else n
        identical_groups = 0
        total_groups_checked = 0

        for g in range(n_groups):
            start_idx = g * k
            end_idx = min(start_idx + k, n)
            group_completions = completions[start_idx:end_idx]

            if len(group_completions) >= 2:
                # Compute hashes of completions in this group
                hashes = [hashlib.md5(c.encode('utf-8')).hexdigest() for c in group_completions]
                unique_hashes = set(hashes)
                total_groups_checked += 1

                if len(unique_hashes) == 1:
                    identical_groups += 1

        # Warn if any groups have identical completions
        if identical_groups > 0:
            identical_rate = identical_groups / total_groups_checked if total_groups_checked > 0 else 0
            logger.warning(
                f"[GENERATION_DIAG] call={GENERATION_CALL_COUNT} | "
                f"identical_groups={identical_groups}/{total_groups_checked} ({identical_rate:.1%}) | "
                f"WARNING: completions identical within group; check do_sample/seed/cache"
            )
            # Print sample of identical completions for debugging
            if should_print_diagnostics and identical_groups > 0:
                # Find first identical group and print samples
                for g in range(min(n_groups, 3)):  # Check first 3 groups
                    start_idx = g * k
                    end_idx = min(start_idx + k, n)
                    group_completions = completions[start_idx:end_idx]
                    if len(group_completions) >= 2:
                        hashes = [hashlib.md5(c.encode('utf-8')).hexdigest() for c in group_completions]
                        if len(set(hashes)) == 1:
                            logger.warning(f"  [IDENTICAL_GROUP] group={g} | k={len(group_completions)} | hash={hashes[0][:8]}")
                            # Print first 200 chars of the completion
                            sample = group_completions[0][:200].replace('\n', '\\n')
                            logger.warning(f"  [SAMPLE] {sample}...")
                            break
        elif should_print_diagnostics:
            # Log normal status periodically
            logger.info(
                f"[GENERATION_DIAG] call={GENERATION_CALL_COUNT} | "
                f"n={n} | k={k} | groups={total_groups_checked} | all_diverse=True"
            )
    if meta is None:
        meta = [None] * n
    if class_label is None:
        class_label = [None] * n

    rewards: List[float] = []
    all_labels: List[str] = []
    all_scenarios: List[str] = []  # 收集场景信息
    reward_methods: List[str] = []  # 收集 reward 计算方法

    # Write prompt token lengths to file
    if GLOBAL_TOKENIZER is not None:
        with open(PROMPT_LENGTH_FILE, "a") as f:
            for prompt in prompts:
                prompt_tokens = GLOBAL_TOKENIZER.encode(prompt, add_special_tokens=False)
                f.write(f"{len(prompt_tokens)}\n")

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

        # 单个样本的打印将在 log_reward_batch_stats 中统一处理

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

        # 4. 计算 reward - 使用通用 dense reward 函数 (with RewardConfig)
        r = -1
        reward_method = "unknown"
        if inferred_label != "unknown":
            # 特判：goal_not_satisfied + 空计划（Plan size: 0）视为 reward hacking
            # 直接给最大惩罚（与 plan_format_error 同档）
            if inferred_label == "goal_not_satisfied" and re.search(r"Plan size:\s*0\b", validation_stdout or ""):
                r = config.empty_plan_reward  # Use config value instead of hardcoded -1.0
                reward_method = "empty_plan"
            else:
                # 获取 problem_file 路径用于解析 goal 信息
                problem_file = None
                if isinstance(m, dict) and m.get("problem_file"):
                    problem_file = str(REPO_ROOT / m["problem_file"])

                # 使用通用 reward 计算（解析 validation_stdout）with RewardConfig
                r = compute_reward_from_validation(
                    category=inferred_label,
                    validation_stdout=validation_stdout,
                    problem_file=problem_file,
                    config=config,  # Pass RewardConfig
                )
                reward_method = "dense_v2"
        rewards.append(float(r))
        reward_methods.append(reward_method)


    # ============ 统计并打印（使用统一方法） ============
    # 获取第一个样本的信息用于打印（如果需要）
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
        log_sample_plan=True,  # train_grpo_unsloth_stl 需要打印样本 plan
        sample_idx=0,
        sample_completion=first_completion,
        sample_meta=first_meta,
    )

    return rewards


def load_grpo_dataset(
    dataset_path: str,
    prompt_field: str,
    response_field: Optional[str],
    class_label_field: str,
    model_family: str = "mistral",
    tokenizer=None,
    apply_chat_template: bool = True,
) -> Dataset:
    """
    Load GRPO dataset from JSONL file with optional chat template formatting.

    Args:
        dataset_path: Path to the JSONL dataset file
        prompt_field: Field name for prompts in the dataset
        response_field: Field name for optional responses
        class_label_field: Field name for class labels
        model_family: Model family for chat template format (mistral, llama, qwen)
        tokenizer: Tokenizer for applying chat template
        apply_chat_template: Whether to wrap prompts with chat template
    """
    logger.info(f"Loading GRPO dataset from {dataset_path}")
    if apply_chat_template:
        logger.info(f"Chat template will be applied using model_family='{model_family}'")

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

            # Apply chat template to the prompt
            if apply_chat_template:
                formatted_prompt = format_prompt_with_chat_template(
                    prompt=prompt,
                    model_family=model_family,
                    tokenizer=tokenizer,
                    use_tokenizer_template=True,
                )
            else:
                formatted_prompt = prompt

            entry: Dict[str, Any] = {"prompt": formatted_prompt}

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

    # Print sample of formatted prompts for verification
    if apply_chat_template and data:
        logger.info("=" * 60)
        logger.info("Sample formatted prompt (first entry):")
        logger.info("-" * 60)
        sample_prompt = data[0]["prompt"]
        # Print first 500 chars
        if len(sample_prompt) > 500:
            logger.info(sample_prompt[:500] + "...")
        else:
            logger.info(sample_prompt)
        logger.info("=" * 60)

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
# Training Function
# -----------------------------------------------------------------------------
def run_training(args, run_ctx=None):
    """Core training logic.

    Args:
        args: Command line arguments
        run_ctx: Optional RunContext for updating wandb URL
    """
    # Set global logging_steps for reward function
    global LOGGING_STEPS, NUM_GENERATIONS_GLOBAL
    LOGGING_STEPS = args.logging_steps
    NUM_GENERATIONS_GLOBAL = args.num_generations

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

    # 模型类型（用于日志提示和chat template）
    model_name = args.base_model
    if "llama" in model_name.lower():
        model_type = "llama"
    elif "mistral" in model_name.lower() or "mixtral" in model_name.lower():
        model_type = "mistral"
    elif "qwen" in model_name.lower():
        model_type = "qwen"
    else:
        model_type = "mistral"  # default to mistral format
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

    # Set global tokenizer for token length statistics
    global GLOBAL_TOKENIZER
    GLOBAL_TOKENIZER = tokenizer

    # Initialize prompt length file
    with open(PROMPT_LENGTH_FILE, "w") as f:
        f.write("# Prompt token lengths (one per line)\n")

    # 加载数据（应用 chat template）
    dataset = load_grpo_dataset(
        args.dataset,
        prompt_field=args.prompt_field,
        response_field=args.response_field,
        class_label_field=args.class_label_field,
        model_family=model_type,
        tokenizer=tokenizer,
        apply_chat_template=not args.no_chat_template,
    )
    logger.info(f"Training dataset size: {len(dataset)}; columns: {dataset.column_names}")

    # ============ 打印 Reward Function 配置信息 ============
    print("=" * 70)
    print("Reward Function Configuration:")
    print(f"  Reward Type: {REWARD_TYPE}")
    print("  Using dense reward: Generic reward calculator (normalized to [-1, 1])")
    print("  Supported scenarios:", SUPPORTED_SCENARIOS)
    print(f"  Chat Template: {'Enabled' if not args.no_chat_template else 'Disabled'}")
    print(f"  Model Family: {model_type}")
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
                "chat_template_enabled": not args.no_chat_template,
            }
        )
        # Update wandb URL in run.json immediately after init
        if run_ctx is not None and wandb.run is not None:
            wandb_url = wandb.run.get_url()
            if wandb_url:
                run_ctx.update_wandb_url(wandb_url)
                logger.info(f"[run_manager] Updated wandb URL: {wandb_url}")

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
        save_total_limit=3,
        do_eval=False,
    )

    # ============ Print Generation Config for Diagnostics ============
    print("=" * 70)
    print("[GENERATION_CONFIG] TRL GRPOConfig generation parameters:")
    print(f"  num_generations (k):     {grpo_config.num_generations}")
    print(f"  temperature:             {grpo_config.temperature}")
    print(f"  top_p:                   {grpo_config.top_p}")
    print(f"  top_k:                   {grpo_config.top_k}")
    print(f"  max_completion_length:   {grpo_config.max_completion_length}")
    print(f"  max_prompt_length:       {grpo_config.max_prompt_length}")
    print(f"  beta (KL penalty):       {grpo_config.beta}")
    # Note: TRL's GRPOTrainer uses do_sample=True internally when temperature > 0
    # Check if do_sample is explicitly set in config
    do_sample_note = "inferred True (temp>0)" if grpo_config.temperature > 0 else "inferred False (temp=0)"
    if hasattr(grpo_config, 'do_sample'):
        do_sample_note = str(grpo_config.do_sample)
    print(f"  do_sample:               {do_sample_note}")
    print("")
    print("[GENERATION_CONFIG] Diagnostic settings:")
    print(f"  logging_steps:           {LOGGING_STEPS}")
    print(f"  Identical completion check: ENABLED (per GRPO group)")
    print("=" * 70)

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

    return args.output_dir


def main():
    """Main entry point with run tracking and configurable reward function."""
    global GLOBAL_REWARD_CONFIG

    parser = argparse.ArgumentParser(
        description="GRPO Training V2 - With configurable reward function for PDDL planning",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Reward Configuration Examples:
  # Use strengthened (default) reward settings:
  python train_grpo_unsloth_chat_v2.py --base_model <model> --dataset <data> --output_dir <out>

  # Use original (weaker) reward settings:
  python train_grpo_unsloth_chat_v2.py --use_default_reward ...

  # Custom reward parameters:
  python train_grpo_unsloth_chat_v2.py --goal_not_satisfied_base -0.7 --goal_not_satisfied_scale 0.5 ...
        """
    )

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
    parser.add_argument("--beta", type=float, default=0.02, help="KL penalty coefficient (beta)")

    # Generation
    parser.add_argument("--max_prompt_length", type=int, default=2048, help="Maximum prompt length")
    parser.add_argument("--max_new_tokens", type=int, default=512, help="Max completion length for GRPO")
    parser.add_argument("--temperature", type=float, default=0.8, help="Sampling temperature")
    parser.add_argument("--top_p", type=float, default=0.9, help="Top-p nucleus sampling")
    parser.add_argument("--top_k", type=int, default=50, help="Top-k sampling")

    # Logging / saving
    parser.add_argument("--save_steps", type=int, default=50, help="Save checkpoint every N steps")
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
    parser.add_argument("--no_4bit", action="store_true", help="Disable 4-bit quantization")
    parser.add_argument("--use_gradient_checkpointing", action="store_true", help="Enable gradient checkpointing")
    parser.add_argument("--dataloader_num_workers", type=int, default=0, help="(Unused by GRPOTrainer)")

    # Chat template options
    parser.add_argument("--no_chat_template", action="store_true",
                       help="Disable chat template wrapping (use raw prompts)")

    # Run management arguments
    parser.add_argument("--runs_root", type=str, default="./runs",
                       help="Root directory for runs (default: ./runs)")
    parser.add_argument("--seed", type=int, default=3407,
                       help="Random seed (default: 3407)")
    parser.add_argument("--no_run_tracking", action="store_true",
                       help="Disable run tracking (don't create run directory)")

    # =========================================================================
    # Reward Configuration Arguments (NEW in V2)
    # =========================================================================
    reward_group = parser.add_argument_group("Reward Configuration (V2)")
    reward_group.add_argument("--use_default_reward", action="store_true",
                             help="Use ORIGINAL reward settings (goal_not_satisfied: [-0.3, 0.0]). "
                                  "Default is STRENGTHENED ([-0.8, -0.2]).")
    reward_group.add_argument("--goal_not_satisfied_base", type=float, default=-0.8,
                             help="Base reward for goal_not_satisfied (default: -0.8, original: -0.3)")
    reward_group.add_argument("--goal_not_satisfied_scale", type=float, default=0.6,
                             help="Scale factor for goal_not_satisfied (default: 0.6, original: 0.3)")
    reward_group.add_argument("--goal_fallback", type=float, default=-0.5,
                             help="Fallback reward when goal count unknown but unsatisfied>0 (default: -0.5)")
    reward_group.add_argument("--goal_no_info_fallback", type=float, default=-0.8,
                             help="Fallback reward when no goal info available (default: -0.8)")

    args = parser.parse_args()

    # =========================================================================
    # Initialize GLOBAL_REWARD_CONFIG based on args
    # =========================================================================
    if args.use_default_reward:
        GLOBAL_REWARD_CONFIG = RewardConfig.default()
        logger.info("Using ORIGINAL reward config (goal_not_satisfied: [-0.3, 0.0])")
    else:
        GLOBAL_REWARD_CONFIG = RewardConfig(
            goal_not_satisfied_base=args.goal_not_satisfied_base,
            goal_not_satisfied_scale=args.goal_not_satisfied_scale,
            goal_fallback=args.goal_fallback,
            goal_no_info_fallback=args.goal_no_info_fallback,
        )
        goal_range = GLOBAL_REWARD_CONFIG.get_goal_range()
        logger.info(f"Using STRENGTHENED reward config (goal_not_satisfied: [{goal_range[0]}, {goal_range[1]}])")

    # Print reward summary
    print_reward_summary(GLOBAL_REWARD_CONFIG)

    if args.no_run_tracking:
        # Run without tracking
        run_training(args)
    else:
        # Run with tracking
        with RunContext(
            method="grpo",
            args=args,
            runs_root=args.runs_root,
            run_name=args.run_name,
            seed=args.seed,
            base_model=args.base_model,
            dataset=args.dataset,
            output_dir=args.output_dir,
            wandb_project=args.wandb_project,
            wandb_run_name=args.run_name,
            extra_metadata={
                "reward_type": REWARD_TYPE,
                "reward_config": GLOBAL_REWARD_CONFIG.to_dict(),  # Save reward config for reproducibility
                "beta": args.beta,
                "temperature": args.temperature,
                "max_steps": args.max_steps,
                "num_generations": args.num_generations,
                "chat_template_enabled": not args.no_chat_template,
            },
            redirect_logs=True,
            training_script=__file__,  # Copy this script to runs dir for reproducibility
        ) as run_ctx:
            # Pass run_ctx to run_training so wandb URL can be saved immediately after init
            run_training(args, run_ctx=run_ctx)


if __name__ == "__main__":
    main()
