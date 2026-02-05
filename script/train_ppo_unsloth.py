#!/usr/bin/env python3
"""
PPO Training Script using Unsloth for PDDL-style planning models.

Dataset format (JSONL per line):
- prompt (str)               : required
- response (str, optional)   : optional warm-start answer; if absent, text is generated
- class_label (str, optional): one of compute_reward keys; reward = compute_reward(class_label)
- reward (float, optional)   : ignored (reward is always derived via compute_reward on class_label)

Usage:
    python train_ppo_unsloth.py --base_model <model_path_or_hub_id> --dataset <ppo_dataset.jsonl> --output_dir <output_path>
"""
import unsloth
import argparse
import json
import logging
import os
from pathlib import Path
from typing import Any, Dict, List, Optional, Union

import torch
from datasets import Dataset
from trl import PPOConfig, PPOTrainer

from unsloth import FastLanguageModel
from utils import (
    classify_result,
    validate_solution,
)

try:
    # Prefer Unsloth's helper if available
    from unsloth import is_bfloat16_supported as _unsloth_bf16_ok
except Exception:
    _unsloth_bf16_ok = None

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("ppo_unsloth")
REPO_ROOT = Path(__file__).resolve().parent.parent
REPO_ROOT = Path(__file__).resolve().parent.parent


# -----------------------------------------------------------------------------
# Reward
# -----------------------------------------------------------------------------
def compute_reward(class_label: str) -> float:
    reward_table = {
        "success_plans": 1.0,
        "goal_not_satisfied": -0.2,
        "precondition_violation": -0.5,
        "plan_format_error": -0.7,
        "safety_constraints_violation": -1.0,
    }
    if class_label not in reward_table:
        raise ValueError(f"Unknown class_label='{class_label}'. Expected one of {list(reward_table)}")
    return reward_table[class_label]


def classify_with_validator(meta: Any, response_text: str) -> Optional[str]:
    """Run VAL validation and classify using utils.classify_result."""
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
        return classify_result(stdout)
    except Exception as exc:  # pragma: no cover - defensive
        logger.warning(f"Validation failed for {problem_rel}: {exc}")
        return None


# -----------------------------------------------------------------------------
# Data loader
# -----------------------------------------------------------------------------
def load_ppo_dataset(
    dataset_path: str,
    prompt_field: str,
    response_field: Optional[str],
    class_label_field: str,
    reward_field: str,
) -> Dataset:
    """Load PPO dataset from JSONL file."""
    logger.info(f"Loading PPO dataset from {dataset_path}")

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
            if response_field and isinstance(record.get(response_field), str):
                entry["response"] = record[response_field]
            if isinstance(record.get(class_label_field), str):
                entry["class_label"] = record[class_label_field]
            if isinstance(record.get("meta"), dict):
                entry["meta"] = record["meta"]

            data.append(entry)

    logger.info(f"Loaded {len(data)} PPO samples (skipped {invalid_count} invalid records)")
    if len(data) == 0:
        raise ValueError("No valid PPO samples found in dataset!")

    ds = Dataset.from_list(data)
    required = {"prompt"}
    missing = required - set(ds.column_names)
    if missing:
        raise ValueError(
            f"PPO dataset missing required columns: {missing}; need: {sorted(list(required))}"
        )
    return ds


# -----------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------
def main():
    parser = argparse.ArgumentParser(description="Train a model using PPO with Unsloth on PDDL planning data")

    # Required
    parser.add_argument("--base_model", required=True, help="Path or HF Hub ID of the base (SFT) model")
    parser.add_argument("--dataset", required=True, help="Path to PPO dataset JSONL file")
    parser.add_argument("--output_dir", required=True, help="Output directory for trained model")

    # Optional training / PPO
    parser.add_argument("--num_epochs", type=int, default=1, help="Number of full passes over the dataset")
    parser.add_argument("--ppo_epochs", type=int, default=4, help="PPO epochs per batch")
    parser.add_argument("--batch_size", type=int, default=4, help="Batch size for PPO updates")
    parser.add_argument("--mini_batch_size", type=int, default=2, help="Mini-batch size inside PPO")
    parser.add_argument("--learning_rate", type=float, default=1e-5, help="Learning rate")
    parser.add_argument("--gradient_accumulation_steps", type=int, default=1, help="Gradient accumulation steps")
    parser.add_argument("--target_kl", type=float, default=0.1, help="KL coefficient for PPO (kl_coef, controls KL penalty strength)")
    parser.add_argument("--max_grad_norm", type=float, default=1.0, help="Gradient clipping")

    # Generation
    parser.add_argument("--max_length", type=int, default=2048, help="Maximum sequence length (prompt+completion)")
    parser.add_argument("--max_prompt_length", type=int, default=1024, help="Maximum prompt length")
    parser.add_argument("--max_new_tokens", type=int, default=256, help="Tokens to generate for responses")
    parser.add_argument("--temperature", type=float, default=0.8, help="Sampling temperature")
    parser.add_argument("--top_p", type=float, default=0.9, help="Top-p nucleus sampling")
    parser.add_argument("--top_k", type=int, default=50, help="Top-k sampling")

    # Logging / saving
    parser.add_argument("--save_steps", type=int, default=500, help="Save checkpoint every N PPO steps (0 to disable)")
    parser.add_argument("--logging_steps", type=int, default=10, help="Log every N PPO steps")
    parser.add_argument("--no_wandb", action="store_true", help="Disable Weights & Biases logging")
    parser.add_argument("--wandb_project", default="pddl-ppo-training", help="W&B project name")
    parser.add_argument("--run_name", default=None, help="Run name for logging")

    # Dataset field names
    parser.add_argument("--prompt_field", default="prompt", help="Field name for prompts")
    parser.add_argument("--response_field", default="response", help="Field name for optional stored responses")
    parser.add_argument("--class_label_field", default="class_label", help="Field name for reward class labels")
    parser.add_argument("--reward_field", default="reward", help="(ignored) kept for compatibility")

    # Model options
    parser.add_argument("--no_4bit", action="store_true", help="Disable 4-bit quantization (default is 4-bit on)")
    parser.add_argument("--use_gradient_checkpointing", action="store_true", help="Enable Unsloth gradient checkpointing")
    parser.add_argument("--dataloader_num_workers", type=int, default=0, help="PyTorch DataLoader workers")

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

    # W&B（默认启用，延迟导入，避免未安装时报错）
    use_wandb = not args.no_wandb
    if use_wandb:
        try:
            import wandb  # type: ignore
        except ImportError:
            logger.warning(
                "Wandb logging is enabled by default but 'wandb' package is not installed. "
                "Install with: pip install wandb, or use --no_wandb to disable. "
                "Continuing without wandb logging."
            )
            use_wandb = False

    # 模型类型（用于日志提示；Unsloth已能自动识别常见结构）
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
        max_seq_length=args.max_length,
        dtype=None,  # auto
        load_in_4bit=load_in_4bit,
        load_in_8bit=False,
        # device_map="auto",  # 可按需开启
    )

    # 训练前设置（Unsloth 的 GC 建议用字符串 "unsloth"）
    gc_flag: Any = "unsloth" if args.use_gradient_checkpointing else False
    FastLanguageModel.for_training(model, use_gradient_checkpointing=gc_flag)

    # 训练时禁用 KV cache，避免不可预期显存波动
    if hasattr(model, "config"):
        model.config.use_cache = False

    # tokenizer pad token
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token
    tokenizer.padding_side = "right"

    # 加载数据
    dataset = load_ppo_dataset(
        args.dataset,
        prompt_field=args.prompt_field,
        response_field=args.response_field,
        class_label_field=args.class_label_field,
        reward_field=args.reward_field,
    )

    def tokenize_fn(example: Dict[str, Any]) -> Dict[str, Any]:
        tokens = tokenizer(
            example["prompt"],
            truncation=True,
            max_length=args.max_prompt_length,
            padding=False,
        )
        example["input_ids"] = tokens["input_ids"]
        example["attention_mask"] = tokens["attention_mask"]
        return example

    keep_cols = {"prompt", "response", "class_label", "meta", "input_ids", "attention_mask"}
    dataset = dataset.map(
        tokenize_fn,
        remove_columns=[c for c in dataset.column_names if c not in keep_cols],
    )
    logger.info(f"Training dataset size: {len(dataset)}; columns: {dataset.column_names}")

    def collate_fn(features: List[Dict[str, Any]]) -> Dict[str, Any]:
        prompts = [f["prompt"] for f in features]
        responses = [f.get("response", "") for f in features]
        class_labels = [f.get("class_label") for f in features]
        metas = [f.get("meta") for f in features]
        input_ids = [f["input_ids"] for f in features]
        attention_masks = [f["attention_mask"] for f in features]
        padded = tokenizer.pad(
            {"input_ids": input_ids, "attention_mask": attention_masks},
            padding=True,
            return_tensors="pt",
        )
        return {
            **padded,
            "prompt": prompts,
            "response": responses,
            "class_label": class_labels,
            "meta": metas,
        }

    ppo_config = PPOConfig(
        learning_rate=args.learning_rate,
        batch_size=args.batch_size,
        mini_batch_size=args.mini_batch_size,
        gradient_accumulation_steps=args.gradient_accumulation_steps,
        num_ppo_epochs=args.ppo_epochs,
        kl_coef=args.target_kl,  # Using kl_coef instead of target_kl
        max_grad_norm=args.max_grad_norm,
        report_to="wandb" if use_wandb else None,
        run_name=args.run_name or f"ppo-unsloth-{os.path.basename(args.base_model)}",
    )
    # Disable reference model to avoid 8-bit .to() issues
    ppo_config.use_ref_model = False  # type: ignore[attr-defined]
    ref_model = None

    ppo_trainer = PPOTrainer(
        args=ppo_config,
        model=model,
        ref_model=ref_model,
        processing_class=tokenizer,
        reward_model=model,  # Use model itself as reward model for simplicity
        value_model=model,  # Use model itself as value model for simplicity
        train_dataset=dataset,
        data_collator=collate_fn,
    )

    generation_kwargs = dict(
        max_new_tokens=args.max_new_tokens,
        temperature=args.temperature,
        top_p=args.top_p,
        top_k=args.top_k,
        do_sample=True,
        pad_token_id=tokenizer.pad_token_id,
        eos_token_id=tokenizer.eos_token_id,
        return_prompt=True,  # 确保切 prompt 时安全
    )


    if use_wandb:
        import wandb  # type: ignore

        wandb.init(
            project=args.wandb_project,
            name=ppo_config.run_name,
            config=vars(args),
        )

    global_step = 0
    for epoch in range(args.num_epochs):
        logger.info(f"Starting epoch {epoch + 1}/{args.num_epochs}")

        for batch in ppo_trainer.dataloader:
            # Extract unpadded query tensors using attention_mask lengths
            prompts = batch["prompt"]
            input_ids = batch["input_ids"]
            attention_mask = batch["attention_mask"]
            query_tensors: List[torch.Tensor] = []
            device = ppo_trainer.accelerator.device

            for i in range(input_ids.size(0)):
                length = attention_mask[i].sum().item()
                query_tensors.append(input_ids[i, :length])

            # Move all queries to the model device once for generate + step
            query_tensors = [qt.to(device) for qt in query_tensors]

            response_tensors: List[torch.Tensor] = []
            rewards: List[torch.Tensor] = []

            # Generate responses for the whole batch at once using policy.generate
            generated_batches = [
                ppo_trainer.model.policy.generate(qt.unsqueeze(0), **generation_kwargs)  # type: ignore[attr-defined]
                for qt in query_tensors
            ]

            class_labels_in_batch = batch.get("class_label", [])
            metas = batch.get("meta", [])

            for i, (query_tensor, gen_batch) in enumerate(zip(query_tensors, generated_batches)):
                existing_response = None
                if "response" in batch and isinstance(batch["response"][i], str) and batch["response"][i]:
                    existing_response = batch["response"][i]

                if existing_response:
                    resp_ids = tokenizer.encode(
                        existing_response,
                        add_special_tokens=False,
                        return_tensors="pt",
                    )[0].to(device)
                    response_tensors.append(resp_ids)
                    response_text = existing_response
                else:
                    gen_ids = gen_batch[0]  # shape: [1, total_len]
                    resp_ids = gen_ids[query_tensor.shape[0] :]
                    response_tensors.append(resp_ids)
                    response_text = tokenizer.decode(resp_ids, skip_special_tokens=True)

                # Determine reward using validator classification -> compute_reward
                meta = metas[i] if i < len(metas) else None
                class_label = classify_with_validator(meta, response_text)

                if not class_label and i < len(class_labels_in_batch) and isinstance(class_labels_in_batch[i], str):
                    class_label = class_labels_in_batch[i]

                reward_value = compute_reward(class_label) if class_label else 0.0

                rewards.append(torch.tensor(reward_value, device=device))

                if global_step % args.logging_steps == 0:
                    label = class_label
                    logger.info(f"Step {global_step}: reward={reward_value:.3f} label={label} response_snippet={response_text[:80]!r}")

            stats = ppo_trainer.step(query_tensors, response_tensors, rewards)
            ppo_trainer.log_stats(stats, batch, rewards)
            global_step += 1

            if args.save_steps and args.save_steps > 0 and global_step % args.save_steps == 0:
                ckpt_dir = os.path.join(args.output_dir, f"checkpoint-{global_step}")
                logger.info(f"Saving checkpoint to {ckpt_dir}")
                ppo_trainer.save_pretrained(ckpt_dir)
                tokenizer.save_pretrained(ckpt_dir)

    logger.info(f"Saving final model to {args.output_dir}")
    ppo_trainer.save_pretrained(args.output_dir)
    tokenizer.save_pretrained(args.output_dir)

    if use_wandb:
        import wandb  # type: ignore

        wandb.finish()

    logger.info("PPO training completed successfully!")


if __name__ == "__main__":
    main()
