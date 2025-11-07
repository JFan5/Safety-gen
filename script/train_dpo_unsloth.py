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
from transformers import TrainingArguments
from trl import DPOTrainer, DPOConfig

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
    with open(dataset_path, "r", encoding="utf-8") as f:
        for line in f:
            if line.strip():
                data.append(json.loads(line))

    logger.info(f"Loaded {len(data)} DPO pairs")
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
    parser.add_argument("--num_epochs", type=int, default=3, help="Number of training epochs")
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
    parser.add_argument("--use_wandb", action="store_true", help="Use Weights & Biases for logging")
    parser.add_argument("--wandb_project", default="pddl-dpo-training", help="W&B project name")
    parser.add_argument("--run_name", help="Run name for logging")
    parser.add_argument("--load_in_4bit", action="store_true", help="Load model in 4-bit quantization")
    parser.add_argument("--load_in_8bit", action="store_true", help="Load model in 8-bit quantization")
    parser.add_argument("--use_gradient_checkpointing", action="store_true", help="Enable Unsloth gradient checkpointing")
    parser.add_argument("--lora_r", type=int, default=16)
    parser.add_argument("--lora_alpha", type=int, default=32)
    parser.add_argument("--lora_dropout", type=float, default=0.05)
    parser.add_argument("--reference_free", action="store_true", help="Use reference-free DPO to save memory")
    parser.add_argument("--dataloader_num_workers", type=int, default=0, help="PyTorch DataLoader workers")
    parser.add_argument(
        "--memory_efficient",
        action="store_true",
        help="Apply conservative settings to reduce GPU memory usage",
    )

    args = parser.parse_args()

    # Validate paths
    if not os.path.exists(args.dataset):
        raise ValueError(f"Dataset path does not exist: {args.dataset}")

    # Create output dir
    os.makedirs(args.output_dir, exist_ok=True)

    # Memory-efficient bundle (conservative)
    if args.memory_efficient:
        logger.info("Applying memory efficient settings")
        if args.batch_size > 1:
            logger.info(f"- Reducing per-device batch size {args.batch_size} -> 1")
            args.batch_size = 1
        if not (args.load_in_4bit or args.load_in_8bit):
            logger.info("- Enabling 4-bit quantization")
            args.load_in_4bit = True
        if not args.use_gradient_checkpointing:
            logger.info("- Enabling Unsloth gradient checkpointing")
            args.use_gradient_checkpointing = True
        if args.max_length > 1536:
            logger.info(f"- Reducing max_length {args.max_length} -> 1536")
            args.max_length = 1536
        if args.max_prompt_length > args.max_length:
            logger.info(f"- Capping max_prompt_length to {args.max_length}")
            args.max_prompt_length = args.max_length
        if args.dataloader_num_workers != 0:
            logger.info("- Using single-process dataloader")
            args.dataloader_num_workers = 0

    # Guard: 4bit/8bit不可同时
    if args.load_in_4bit and args.load_in_8bit:
        raise ValueError("Choose only one: --load_in_4bit OR --load_in_8bit (not both).")

    # W&B（延迟导入，避免未安装时报错）
    if args.use_wandb:
        try:
            import wandb  # type: ignore
        except Exception as e:
            raise RuntimeError(
                "You passed --use_wandb but the 'wandb' package is not installed. "
                "pip install wandb 或去掉该参数。"
            ) from e

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
        load_in_4bit=args.load_in_4bit,
        load_in_8bit=args.load_in_8bit,
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
        ref_model=None,
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
        report_to=["wandb"] if args.use_wandb else [],
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
        reference_free=args.reference_free,
        max_length=args.max_length,
        max_prompt_length=min(args.max_prompt_length, args.max_length),
        # 也可按需设置 max_completion_length
    ),
        train_dataset=train_dataset,
        eval_dataset=eval_dataset,
        processing_class=tokenizer,
    )

    print("eval steps: ", args.eval_steps)
    # 可选：初始化 W&B
    if args.use_wandb:
        import wandb  # type: ignore
        wandb.init(
            project=args.wandb_project,
            name=args.run_name or f"dpo-unsloth-{os.path.basename(args.base_model)}",
            config=vars(args),
        )

    # 开始训练
    logger.info("Starting DPO training with Unsloth...")
    dpo_trainer.train()

    # 只保存一个模型（合并后的 16bit 全量权重，便于推理 / 部署）
    logger.info(f"Saving merged model to {args.output_dir}")
    FastLanguageModel.for_inference(model)
    model.save_pretrained_merged(
        args.output_dir,
        tokenizer,
        save_method="merged_16bit",
    )
    logger.info("DPO training completed successfully!")
    logger.info(f"Adapter saved to: {args.output_dir}")
    logger.info(f"Merged model saved to: {args.output_dir}_merged")
    if args.use_wandb:
        import wandb  # type: ignore
        wandb.finish()


if __name__ == "__main__":
    main()
