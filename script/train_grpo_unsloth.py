#!/usr/bin/env python3
"""
GRPO Training Script using Unsloth for PDDL-style planning models.

Dataset format (JSONL per line):
- prompt (str)               : required
- response (str, optional)   : UNUSED for GRPO (model在线生成)
- class_label (str, optional): one of compute_reward keys; 作为备份标签
- meta (dict, optional)      : 包含 domain_file / problem_file 等，用于 VAL 校验

Usage:
    python train_grpo_unsloth.py --base_model <model_path_or_hub_id> --dataset <ppo_dataset.jsonl> --output_dir <output_path>
"""
import unsloth
import argparse
import json
import logging
import os
from pathlib import Path
from typing import Any, Dict, List, Optional

import torch
from datasets import Dataset
from trl import GRPOConfig, GRPOTrainer

from unsloth import FastLanguageModel
from utils import _classify_result, validate_solution

# Fix for torch._dynamo recompile limit error
# Increase cache size limit to handle dynamic shapes in GRPO training
try:
    import torch._dynamo
    torch._dynamo.config.cache_size_limit = 128  # Increase from default (usually 64)
    torch._dynamo.config.accumulated_cache_size_limit = 512  # Increase accumulated cache
except Exception:
    pass  # If dynamo is not available, continue without modification

try:
    # Prefer Unsloth's helper if available
    from unsloth import is_bfloat16_supported as _unsloth_bf16_ok
except Exception:
    _unsloth_bf16_ok = None

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("grpo_unsloth")
REPO_ROOT = Path(__file__).resolve().parent.parent


# -----------------------------------------------------------------------------
# Reward
# -----------------------------------------------------------------------------
def compute_reward(class_label: str) -> float:
    reward_table = {
        "success_plans": 2,
        "goal_not_satisfied": -0.5,
        "precondition_violation": -1,
        "plan_format_error": -0.5,
        "safety_constraints_violation": -2,
    }
    if class_label not in reward_table:
        raise ValueError(f"Unknown class_label='{class_label}'. Expected one of {list(reward_table)}")
    return reward_table[class_label]


def classify_with_validator(meta: Any, response_text: str) -> Optional[str]:
    """Run VAL validation and classify using utils._classify_result."""
    if not isinstance(meta, dict):
        return None
    domain_rel = meta.get("domain_file")
    problem_rel = meta.get("problem_file")
    if not domain_rel or not problem_rel:
        return None
    domain_path = REPO_ROOT / domain_rel
    problem_path = REPO_ROOT / problem_rel
    if not domain_path.exists() or not problem_path.exists():
        return None
    try:
        _, _, stdout, _, _ = validate_solution(str(domain_path), str(problem_path), response_text)
        return _classify_result(stdout)
    except Exception as exc:  # pragma: no cover - defensive
        logger.warning(f"Validation failed for {problem_rel}: {exc}")
        return None


def grpo_reward_func(
    prompts: List[str],
    completions: List[str],
    meta: Optional[List[Any]] = None,
    class_label: Optional[List[Optional[str]]] = None,
    trainer_state=None,
    **kwargs,
) -> List[float]:
    """
    GRPO 自定义 reward 函数。

    TRL 会把：
      - prompts        : 当前 batch 的 prompt 列表
      - completions    : 当前 batch 每个生成的 completion（已经 decode 好的 str）
      - meta           : 来自 dataset 的 'meta' 列
      - class_label    : 来自 dataset 的 'class_label' 列
    作为 kwargs 传进来。
    返回值必须是 len(completions) 个 float。
    """
    n = len(completions)
    if meta is None:
        meta = [None] * n
    if class_label is None:
        class_label = [None] * n

    rewards: List[float] = []

    for i, (prompt, completion, m, label) in enumerate(
        zip(prompts, completions, meta, class_label)
    ):
        # 1. 优先用 VAL 校验得到 label
        inferred_label = classify_with_validator(m, completion)

        # 2. 如果 VAL 没给出结果，退回到数据集原来的 class_label
        if not inferred_label and isinstance(label, str):
            inferred_label = label

        # 3. 转成 reward
        if inferred_label:
            r = compute_reward(inferred_label)
        else:
            # 完全无法分类时给 0 分（你可以按需改成小负数）
            r = 0.0

        rewards.append(float(r))

        if i == 0:  # 偶尔打印一个样本，避免太多日志
            logger.debug(
                f"[GRPO reward] label={inferred_label!r}, reward={r:.3f}, "
                f"completion_snippet={completion[:80]!r}"
            )

    return rewards


# -----------------------------------------------------------------------------
# Data loader
# -----------------------------------------------------------------------------
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
            try:
                record = json.loads(line)
            except json.JSONDecodeError as e:
                invalid_count += 1
                logger.warning(f"Line {line_num}: JSON decode error: {e}, skipping")
                continue

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

    ds = Dataset.from_list(data)
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
    parser.add_argument("--eval_steps", type=int, default=200, help="Evaluate every N steps (0 to disable)")
    parser.add_argument("--eval_strategy", type=str, default="steps", help="Evaluation strategy")

    # Generation
    parser.add_argument("--max_prompt_length", type=int, default=4096, help="Maximum prompt length")
    parser.add_argument("--max_new_tokens", type=int, default=256, help="Max completion length for GRPO")
    parser.add_argument("--temperature", type=float, default=0.8, help="Sampling temperature")
    parser.add_argument("--top_p", type=float, default=0.9, help="Top-p nucleus sampling")
    parser.add_argument("--top_k", type=int, default=50, help="Top-k sampling")

    # Logging / saving
    parser.add_argument("--save_steps", type=int, default=500, help="Save checkpoint every N steps (0 to disable)")
    parser.add_argument("--logging_steps", type=int, default=10, help="Log every N steps")
    parser.add_argument("--no_wandb", action="store_true", help="Disable Weights & Biases logging")
    parser.add_argument("--max_steps", type=int, default=3000, help="Maximum number of training steps")
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
    use_wandb = not args.no_wandb

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
    split = dataset.train_test_split(test_size=0.1, seed=42, shuffle=True)
    train_dataset, eval_dataset = split["train"], split["test"]
    logger.info(f"Training dataset size: {len(train_dataset)}")
    logger.info(f"Evaluation dataset size: {len(eval_dataset)}")

    # GRPOConfig：对应原来 PPOConfig 的超参
    grpo_config = GRPOConfig(
        output_dir=args.output_dir,

        # 用 max_steps 控制总训练量
        max_steps=args.max_steps,        # 比如 5000

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
        run_name=args.run_name or f"grpo-unsloth-{os.path.basename(args.base_model)}",

        # Data / generation 相关
        remove_unused_columns=False,
        max_prompt_length=args.max_prompt_length,
        max_completion_length=args.max_new_tokens,
        num_generations=args.num_generations,
        temperature=args.temperature,
        top_p=args.top_p,
        top_k=args.top_k,
        beta=0.02,
        save_total_limit=2,
    )

    # 构建 GRPOTrainer
    trainer = GRPOTrainer(
        model=model,
        args=grpo_config,
        reward_funcs=grpo_reward_func,
        train_dataset=train_dataset,
        processing_class=tokenizer,
        eval_dataset=eval_dataset,
        eval_strategy=args.eval_strategy,
        eval_steps=args.eval_steps,
    )

    logger.info("Starting GRPO training...")
    trainer.train()

    logger.info(f"Saving final model to {args.output_dir}")
    trainer.save_model(args.output_dir)
    tokenizer.save_pretrained(args.output_dir)

    logger.info("GRPO training completed successfully!")


if __name__ == "__main__":
    main()
