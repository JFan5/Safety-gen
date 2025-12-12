#!/usr/bin/env python3
"""
DPO Training Script using Unsloth for PDDL Planning Models (FIXED)

Usage:
    python train_dpo_unsloth.py --base_model <model_path_or_hub_id> --dataset <dpo_dataset.jsonl> --output_dir <output_path>
"""
import unsloth
import argparse
import json
import os
import logging

from typing import Any

import torch
from datasets import Dataset
from trl import DPOTrainer, DPOConfig
from transformers import TrainingArguments, EarlyStoppingCallback
# Unsloth
from unsloth import FastLanguageModel
try:
    # Prefer Unsloth's helper if available
    from unsloth import is_bfloat16_supported as _unsloth_bf16_ok
except Exception:
    _unsloth_bf16_ok = None

# -----------------------------------------------------------------------------
# Logging
# -----------------------------------------------------------------------------
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("dpo_unsloth")


# -----------------------------------------------------------------------------
# Data loader
# -----------------------------------------------------------------------------
def load_dpo_dataset(dataset_path: str) -> Dataset:
    """Load DPO dataset from JSONL file."""
    logger.info(f"Loading DPO dataset from {dataset_path}")

    data = []
    invalid_count = 0
    with open(dataset_path, "r", encoding="utf-8") as f:
        for line_num, line in enumerate(f, 1):
            if not line.strip():
                continue
            try:
                record = json.loads(line)
                # Validate required fields and ensure they are non-empty strings
                prompt = record.get("prompt", "")
                chosen = record.get("chosen", "")
                rejected = record.get("rejected", "")
                
                # Skip records with missing or invalid fields
                if not prompt or not isinstance(prompt, str):
                    invalid_count += 1
                    logger.warning(f"Line {line_num}: Missing or invalid 'prompt' field, skipping")
                    continue
                if not chosen or not isinstance(chosen, str):
                    invalid_count += 1
                    logger.warning(f"Line {line_num}: Missing or invalid 'chosen' field, skipping")
                    continue
                if not rejected or not isinstance(rejected, str):
                    invalid_count += 1
                    logger.warning(f"Line {line_num}: Missing or invalid 'rejected' field, skipping")
                    continue
                
                data.append(record)
            except json.JSONDecodeError as e:
                invalid_count += 1
                logger.warning(f"Line {line_num}: JSON decode error: {e}, skipping")
                continue

    logger.info(f"Loaded {len(data)} valid DPO pairs (skipped {invalid_count} invalid records)")
    
    if len(data) == 0:
        raise ValueError("No valid DPO pairs found in dataset!")
    
    ds = Dataset.from_list(data)
    required = {"prompt", "chosen", "rejected"}
    missing = required - set(ds.column_names)
    if missing:
        raise ValueError(
            f"DPO dataset missing required columns: {missing}; need: {sorted(list(required))}"
        )
    return ds


# -----------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------
def main():
    parser = argparse.ArgumentParser(description="Train a model using DPO with Unsloth on PDDL planning data")

    # Required
    parser.add_argument("--base_model", required=True, help="Path or HF Hub ID of the base (SFT) model")
    parser.add_argument("--dataset", required=True, help="Path to DPO dataset JSONL file")
    parser.add_argument("--output_dir", required=True, help="Output directory for trained model")

    # Optional
    parser.add_argument("--num_epochs", type=float, default=3, help="Number of training epochs (supports fractional epochs, e.g., 0.3)")
    parser.add_argument("--batch_size", type=int, default=2, help="Per-device train/eval batch size")
    parser.add_argument("--learning_rate", type=float, default=5e-6, help="Learning rate")
    parser.add_argument("--max_length", type=int, default=2048, help="Maximum sequence length (prompt+completion)")
    parser.add_argument("--max_prompt_length", type=int, default=1024, help="Maximum prompt length")
    parser.add_argument("--beta", type=float, default=0.1, help="DPO beta (temperature)")
    parser.add_argument("--gradient_accumulation_steps", type=int, default=4, help="Gradient accumulation steps")
    parser.add_argument("--save_steps", type=int, default=500, help="Save checkpoint every N steps")
    parser.add_argument("--eval_steps", type=int, default=50, help="Evaluate every N steps")
    parser.add_argument("--logging_steps", type=int, default=10, help="Log every N steps")
    parser.add_argument("--warmup_ratio", type=float, default=0.1, help="Warmup ratio")
    parser.add_argument("--weight_decay", type=float, default=0.01, help="Weight decay")
    parser.add_argument("--no_wandb", action="store_true", help="Disable Weights & Biases logging (enabled by default)")
    parser.add_argument("--wandb_project", default="pddl-dpo-training", help="W&B project name")
    parser.add_argument("--run_name", help="Run name for logging")
    parser.add_argument("--no_4bit", action="store_true", help="Disable 4-bit quantization (load in full precision, not recommended)")
    parser.add_argument("--use_gradient_checkpointing", action="store_true", help="Enable Unsloth gradient checkpointing")
    parser.add_argument("--lora_r", type=int, default=16)
    parser.add_argument("--lora_alpha", type=int, default=32)
    parser.add_argument("--lora_dropout", type=float, default=0.05)
    parser.add_argument("--reference_free", action="store_true", help="Use reference-free DPO to save memory")
    parser.add_argument("--dataloader_num_workers", type=int, default=0, help="PyTorch DataLoader workers")
    parser.add_argument(
        "--resume_from_checkpoint",
        type=str,
        default=None,
        help="Path to a checkpoint directory to resume training from",
    )

    args = parser.parse_args()

    # Validate paths
    if not os.path.exists(args.dataset):
        raise ValueError(f"Dataset path does not exist: {args.dataset}")
    
    # Validate checkpoint path if provided
    if args.resume_from_checkpoint:
        if not os.path.exists(args.resume_from_checkpoint):
            raise ValueError(f"Checkpoint path does not exist: {args.resume_from_checkpoint}")
        if not os.path.isdir(args.resume_from_checkpoint):
            raise ValueError(f"Checkpoint path is not a directory: {args.resume_from_checkpoint}")
        logger.info(f"Resuming training from checkpoint: {args.resume_from_checkpoint}")

    # Create output dir
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
    # 对于 DPO 训练，检查点通常只包含适配器权重和训练状态，不包含完整模型
    # 所以通常需要从 base_model 加载基础模型，然后 Trainer 会从检查点恢复适配器权重
    # 但如果检查点包含完整模型（比如使用了 save_pretrained），则可以从检查点加载
    if args.resume_from_checkpoint:
        # 检查检查点是否包含完整模型文件（而不是仅适配器权重）
        checkpoint_files = []
        try:
            checkpoint_files = os.listdir(args.resume_from_checkpoint)
        except OSError:
            pass
        
        checkpoint_has_full_model = (
            os.path.exists(os.path.join(args.resume_from_checkpoint, "pytorch_model.bin")) or
            os.path.exists(os.path.join(args.resume_from_checkpoint, "model.safetensors")) or
            any(f.startswith("pytorch_model") for f in checkpoint_files)
        )
        
        if checkpoint_has_full_model:
            logger.info(f"Checkpoint contains full model. Loading from checkpoint: {args.resume_from_checkpoint}")
            model, tokenizer = FastLanguageModel.from_pretrained(
                model_name=args.resume_from_checkpoint,
                max_seq_length=args.max_length,
                dtype=None,  # auto
                load_in_4bit=True,
                load_in_8bit=False,
            )
        else:
            # 从 base_model 加载，Trainer 会从检查点恢复适配器权重和训练状态
            logger.info(f"Loading base model from: {args.base_model}")
            logger.info(f"Adapter weights and training state will be restored from checkpoint: {args.resume_from_checkpoint}")
            model, tokenizer = FastLanguageModel.from_pretrained(
                model_name=args.base_model,
                max_seq_length=args.max_length,
                dtype=None,  # auto
                load_in_4bit=True,
                load_in_8bit=False,
            )
    else:
        logger.info(f"Loading model with Unsloth from {args.base_model}")
        model, tokenizer = FastLanguageModel.from_pretrained(
            model_name=args.base_model,
            max_seq_length=args.max_length,
            dtype=None,  # auto
            load_in_4bit=True,
            load_in_8bit=False,
            # device_map="auto",  # 可按需开启
        )

    # 训练前设置（Unsloth 的 GC 建议用字符串 "unsloth"）
    gc_flag: Any = "unsloth" if args.use_gradient_checkpointing else False

    FastLanguageModel.for_training(model,use_gradient_checkpointing=gc_flag)



    # 训练时禁用 KV cache，避免不可预期显存波动
    if hasattr(model, "config"):
        model.config.use_cache = False

    # tokenizer pad token
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token

    # 加载数据
    dataset = load_dpo_dataset(args.dataset)
    split = dataset.train_test_split(test_size=0.1, seed=42, shuffle=True)
    train_dataset, eval_dataset = split["train"], split["test"]
    logger.info(f"Training dataset size: {len(train_dataset)}")
    logger.info(f"Evaluation dataset size: {len(eval_dataset)}")

    # 训练配置（注意 evaluation_strategy 字段名）


    # 初始化 DPOTrainer
    # ref_model=None: 若 reference_free=False，则会自动复制一份参考模型（占显存）；
    # 若 reference_free=True，则不会用参考模型（更省显存）。
    dpo_trainer = DPOTrainer(
        model=model,
        args=DPOConfig(
        output_dir=args.output_dir,
        num_train_epochs=args.num_epochs,
        per_device_train_batch_size=args.batch_size,
        per_device_eval_batch_size=args.batch_size,
        gradient_accumulation_steps=args.gradient_accumulation_steps,
        learning_rate=args.learning_rate,
        lr_scheduler_type="linear",
        warmup_ratio=args.warmup_ratio,
        weight_decay=args.weight_decay,
        logging_steps=args.logging_steps,
        save_steps=args.save_steps,
        eval_steps=args.eval_steps,
        eval_strategy="steps",    # <-- 修复字段名
        save_strategy="steps",
        save_total_limit=2,
        load_best_model_at_end=True,
        metric_for_best_model="eval_loss",
        greater_is_better=False,
        report_to=["wandb"] if use_wandb else [],
        run_name=args.run_name or f"dpo-unsloth-{os.path.basename(args.base_model)}",
        remove_unused_columns=False,
        dataloader_pin_memory=False,
        dataloader_num_workers=args.dataloader_num_workers,
        # 混精度
        bf16=bf16_ok,
        fp16=use_fp16,
        # 优化器（8-bit / paged）
        optim="paged_adamw_8bit",      # <-- 修复支持的优化器名
        max_grad_norm=1.0,
        # DPO 特有
        beta=args.beta,
        loss_type="sigmoid",
        label_smoothing=0.0,
        reference_free=False,
        max_length=args.max_length,
        max_prompt_length=min(args.max_prompt_length, args.max_length),
        # 也可按需设置 max_completion_length
    ),
        train_dataset=train_dataset,
        eval_dataset=eval_dataset,
        processing_class=tokenizer,
        callback_handler=[EarlyStoppingCallback(patience=3)],
    )

    print("eval steps: ", args.eval_steps)
    # 初始化 W&B（默认启用）
    if use_wandb:
        import wandb  # type: ignore
        wandb.init(
            project=args.wandb_project,
            name=args.run_name or f"dpo-unsloth-{os.path.basename(args.base_model)}",
            config=vars(args),
        )

    # 开始训练
    if args.resume_from_checkpoint:
        logger.info(f"Resuming DPO training from checkpoint: {args.resume_from_checkpoint}")
        dpo_trainer.train(resume_from_checkpoint=args.resume_from_checkpoint)
    else:
        logger.info("Starting DPO training with Unsloth...")
        dpo_trainer.train()

    # 保存 LoRA 适配器
    dpo_lora_dir = args.output_dir
    logger.info(f"Saving DPO LoRA adapter to {dpo_lora_dir}")
    model.save_pretrained(dpo_lora_dir)
    tokenizer.save_pretrained(dpo_lora_dir)
    logger.info("DPO training completed successfully!")
    logger.info(f"LoRA adapter saved to: {dpo_lora_dir}")
    if use_wandb:
        import wandb  # type: ignore
        wandb.finish()


if __name__ == "__main__":
    main()
