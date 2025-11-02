#!/usr/bin/env python3
"""
DPO Training Script using Unsloth for PDDL Planning Models

This script uses Unsloth for faster and more memory-efficient DPO training.

Usage:
    python train_dpo_unsloth.py --base_model <model_path> --dataset <dpo_dataset.jsonl> --output_dir <output_path>
"""
import unsloth
import argparse
import json
import os
import logging
from typing import Dict, List, Any

import torch
from datasets import Dataset
from transformers import TrainingArguments
from trl import DPOTrainer, DPOConfig
from unsloth import FastLanguageModel
import wandb

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


def load_dpo_dataset(dataset_path: str) -> Dataset:
    """Load DPO dataset from JSONL file."""
    logger.info(f"Loading DPO dataset from {dataset_path}")
    
    data = []
    with open(dataset_path, 'r', encoding='utf-8') as f:
        for line in f:
            if line.strip():
                data.append(json.loads(line))
    
    logger.info(f"Loaded {len(data)} DPO pairs")
    return Dataset.from_list(data)


def main():
    parser = argparse.ArgumentParser(description="Train a model using DPO with Unsloth on PDDL planning data")
    
    # Required arguments
    parser.add_argument("--base_model", required=True, help="Path to the base model (SFT model)")
    parser.add_argument("--dataset", required=True, help="Path to DPO dataset JSONL file")
    parser.add_argument("--output_dir", required=True, help="Output directory for trained model")
    
    # Optional arguments
    parser.add_argument("--num_epochs", type=int, default=3, help="Number of training epochs")
    parser.add_argument("--batch_size", type=int, default=2, help="Training batch size")
    parser.add_argument("--learning_rate", type=float, default=5e-6, help="Learning rate")
    parser.add_argument("--max_length", type=int, default=2048, help="Maximum sequence length")
    parser.add_argument("--max_prompt_length", type=int, default=1024, help="Maximum prompt length")
    parser.add_argument("--beta", type=float, default=0.1, help="DPO beta parameter")
    parser.add_argument("--gradient_accumulation_steps", type=int, default=4, help="Gradient accumulation steps")
    parser.add_argument("--save_steps", type=int, default=500, help="Save checkpoint every N steps")
    parser.add_argument("--eval_steps", type=int, default=500, help="Evaluate every N steps")
    parser.add_argument("--logging_steps", type=int, default=10, help="Log every N steps")
    parser.add_argument("--warmup_ratio", type=float, default=0.1, help="Warmup ratio")
    parser.add_argument("--weight_decay", type=float, default=0.01, help="Weight decay")
    parser.add_argument("--use_wandb", action="store_true", help="Use Weights & Biases for logging")
    parser.add_argument("--wandb_project", default="pddl-dpo-training", help="W&B project name")
    parser.add_argument("--run_name", help="Run name for logging")
    parser.add_argument("--load_in_4bit", action="store_true", help="Load model in 4-bit quantization")
    parser.add_argument("--load_in_8bit", action="store_true", help="Load model in 8-bit quantization")
    parser.add_argument("--use_gradient_checkpointing", action="store_true", help="Use gradient checkpointing")
    parser.add_argument("--dataloader_num_workers", type=int, default=0, help="Number of workers for the PyTorch DataLoader")
    parser.add_argument(
        "--memory_efficient",
        action="store_true",
        help="Apply a bundle of conservative settings that reduce GPU memory usage",
    )
    # Flash Attention 2 is automatically enabled in Unsloth

    args = parser.parse_args()

    if args.memory_efficient:
        logger.info("Applying memory efficient settings")
        if args.batch_size > 1:
            logger.info(
                f"- Reducing per-device batch size from {args.batch_size} to 1 to cut activations in half"
            )
            args.batch_size = 1
        if not (args.load_in_4bit or args.load_in_8bit):
            logger.info("- Enabling 4-bit quantization to shrink model memory footprint")
            args.load_in_4bit = True
        if not args.use_gradient_checkpointing:
            logger.info("- Enabling gradient checkpointing to trade compute for memory")
            args.use_gradient_checkpointing = True
        if args.max_length > 1536:
            logger.info(
                f"- Reducing maximum sequence length from {args.max_length} to 1536"
            )
            args.max_length = 1536
        if args.max_prompt_length > args.max_length:
            logger.info(
                f"- Capping max prompt length to {args.max_length} to match the new sequence cap"
            )
            args.max_prompt_length = args.max_length
        if args.dataloader_num_workers != 0:
            logger.info("- Using single-process dataloader to avoid additional forks")
            args.dataloader_num_workers = 0

    # Validate inputs
    if not os.path.exists(args.base_model):
        raise ValueError(f"Base model path does not exist: {args.base_model}")

    if not os.path.exists(args.dataset):
        raise ValueError(f"Dataset path does not exist: {args.dataset}")
    
    # Create output directory
    os.makedirs(args.output_dir, exist_ok=True)
    
    # Set up logging
    if args.use_wandb:
        wandb.init(
            project=args.wandb_project,
            name=args.run_name or f"dpo-unsloth-{os.path.basename(args.base_model)}",
            config=vars(args)
        )
    
    # Determine model type and setup
    model_name = args.base_model
    if "llama" in model_name.lower():
        model_type = "llama"
    elif "mistral" in model_name.lower():
        model_type = "mistral"
    elif "qwen" in model_name.lower():
        model_type = "qwen"
    else:
        model_type = "llama"  # Default fallback
        logger.warning(f"Unknown model type, defaulting to llama for {model_name}")
    
    # Load model and tokenizer with Unsloth
    logger.info(f"Loading model with Unsloth from {args.base_model}")
    
    # Determine quantization
    load_in_4bit = args.load_in_4bit
    load_in_8bit = args.load_in_8bit

    # Load model with Unsloth optimizations
    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=args.base_model,
        max_seq_length=args.max_length,
        dtype=None,  # Auto-detect
        load_in_4bit=load_in_4bit,
        load_in_8bit=load_in_8bit,
        use_gradient_checkpointing=args.use_gradient_checkpointing,
        # Flash Attention 2 is automatically enabled in Unsloth
    )

    # Disable KV caching during training to keep memory usage predictable
    if hasattr(model, "config"):
        model.config.use_cache = False

    # Add padding token if not present
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token

    # Load and prepare dataset
    dataset = load_dpo_dataset(args.dataset)
    
    # Split dataset into train and eval (90/10 split)
    train_size = int(0.9 * len(dataset))
    train_dataset = dataset.select(range(train_size))
    eval_dataset = dataset.select(range(train_size, len(dataset)))
    
    logger.info(f"Training dataset size: {len(train_dataset)}")
    logger.info(f"Evaluation dataset size: {len(eval_dataset)}")
    
    # Set up DPO config (includes training arguments)
    dpo_config = DPOConfig(
        output_dir=args.output_dir,
        num_train_epochs=args.num_epochs,
        per_device_train_batch_size=args.batch_size,
        per_device_eval_batch_size=args.batch_size,
        gradient_accumulation_steps=args.gradient_accumulation_steps,
        learning_rate=args.learning_rate,
        lr_scheduler_type="cosine",
        warmup_ratio=args.warmup_ratio,
        weight_decay=args.weight_decay,
        logging_steps=args.logging_steps,
        save_steps=args.save_steps,
        eval_steps=args.eval_steps,
        eval_strategy="steps",
        save_strategy="steps",
        save_total_limit=3,
        load_best_model_at_end=True,
        metric_for_best_model="eval_loss",
        greater_is_better=False,
        report_to=["wandb"] if args.use_wandb else [],
        run_name=args.run_name or f"dpo-unsloth-{os.path.basename(args.base_model)}",
        remove_unused_columns=False,
        dataloader_pin_memory=False,
        bf16=torch.cuda.is_available(),
        gradient_checkpointing=args.use_gradient_checkpointing,
        dataloader_num_workers=args.dataloader_num_workers,
        # Unsloth specific optimizations
        optim="adamw_8bit",  # Use 8-bit optimizer for memory efficiency
        max_grad_norm=1.0,
        # DPO specific parameters
        beta=args.beta,
        loss_type="sigmoid",
        label_smoothing=0.0,
        reference_free=False,
        max_length=args.max_length,
        max_prompt_length=args.max_prompt_length,
    )
    
    # Initialize DPO trainer
    dpo_trainer = DPOTrainer(
        model=model,
        ref_model=None,  # Use the same model as reference (online DPO)
        args=dpo_config,
        train_dataset=train_dataset,
        eval_dataset=eval_dataset,
        processing_class=tokenizer,
    )
    
    # Start training
    logger.info("Starting DPO training with Unsloth...")
    dpo_trainer.train()
    
    # Save the final model
    logger.info(f"Saving model to {args.output_dir}")
    
    # Save with Unsloth optimizations
    FastLanguageModel.for_training(model)  # Enable training mode for saving
    model.save_pretrained(args.output_dir)
    tokenizer.save_pretrained(args.output_dir)
    
    # Save training arguments
    config_dict = {
        "output_dir": getattr(dpo_config, 'output_dir', args.output_dir),
        "num_train_epochs": getattr(dpo_config, 'num_train_epochs', args.num_epochs),
        "per_device_train_batch_size": getattr(dpo_config, 'per_device_train_batch_size', args.batch_size),
        "per_device_eval_batch_size": getattr(dpo_config, 'per_device_eval_batch_size', args.batch_size),
        "gradient_accumulation_steps": getattr(dpo_config, 'gradient_accumulation_steps', args.gradient_accumulation_steps),
        "learning_rate": getattr(dpo_config, 'learning_rate', args.learning_rate),
        "lr_scheduler_type": getattr(dpo_config, 'lr_scheduler_type', 'cosine'),
        "warmup_ratio": getattr(dpo_config, 'warmup_ratio', args.warmup_ratio),
        "weight_decay": getattr(dpo_config, 'weight_decay', args.weight_decay),
        "logging_steps": getattr(dpo_config, 'logging_steps', args.logging_steps),
        "save_steps": getattr(dpo_config, 'save_steps', args.save_steps),
        "eval_steps": getattr(dpo_config, 'eval_steps', args.eval_steps),
        "eval_strategy": getattr(dpo_config, 'eval_strategy', 'steps'),
        "save_strategy": getattr(dpo_config, 'save_strategy', 'steps'),
        "load_best_model_at_end": getattr(dpo_config, 'load_best_model_at_end', True),
        "metric_for_best_model": getattr(dpo_config, 'metric_for_best_model', 'eval_loss'),
        "greater_is_better": getattr(dpo_config, 'greater_is_better', False),
        "bf16": getattr(dpo_config, 'bf16', torch.cuda.is_available()),
        "dataloader_num_workers": getattr(dpo_config, 'dataloader_num_workers', args.dataloader_num_workers),
        "remove_unused_columns": getattr(dpo_config, 'remove_unused_columns', False),
        "report_to": getattr(dpo_config, 'report_to', ["wandb"] if args.use_wandb else []),
        "run_name": getattr(dpo_config, 'run_name', f"dpo-unsloth-{os.path.basename(args.base_model)}"),
        "optim": getattr(dpo_config, 'optim', 'adamw_8bit'),
        "max_grad_norm": getattr(dpo_config, 'max_grad_norm', 1.0),
        "beta": getattr(dpo_config, 'beta', args.beta),
        "loss_type": getattr(dpo_config, 'loss_type', 'sigmoid'),
        "label_smoothing": getattr(dpo_config, 'label_smoothing', 0.0),
        "reference_free": getattr(dpo_config, 'reference_free', False),
        "max_length": getattr(dpo_config, 'max_length', args.max_length),
        "max_prompt_length": getattr(dpo_config, 'max_prompt_length', args.max_prompt_length),
    }
    
    # Add command line arguments for reference
    config_dict.update({
        "base_model": args.base_model,
        "dataset": args.dataset,
        "use_wandb": args.use_wandb,
        "use_gradient_checkpointing": args.use_gradient_checkpointing,
        "beta": args.beta,
        "max_length": args.max_length,
        "max_prompt_length": args.max_prompt_length,
    })
    
    with open(os.path.join(args.output_dir, "dpo_config.json"), "w") as f:
        json.dump(config_dict, f, indent=2)
    
    # Save Unsloth model for inference
    FastLanguageModel.for_inference(model)  # Enable inference mode
    model.save_pretrained_merged(args.output_dir + "_merged", tokenizer, save_method="merged_16bit")
    
    logger.info("DPO training completed successfully!")
    logger.info(f"Model saved to: {args.output_dir}")
    logger.info(f"Merged model saved to: {args.output_dir}_merged")
    
    if args.use_wandb:
        wandb.finish()


if __name__ == "__main__":
    main()
