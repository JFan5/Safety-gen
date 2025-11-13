#!/usr/bin/env python3
"""
Script to save a trained model from checkpoint after training completes.
This fixes the issue where save_pretrained_merged fails due to 4bit merging warning.
"""
import argparse
import os
import logging
from unsloth import FastLanguageModel

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("save_from_checkpoint")


def main():
    parser = argparse.ArgumentParser(description="Save model from checkpoint")
    parser.add_argument("--checkpoint", required=True, help="Path to checkpoint directory")
    parser.add_argument("--base_model", required=True, help="Path to base model (if checkpoint only has adapters)")
    parser.add_argument("--output_dir", required=True, help="Output directory for saved model")
    parser.add_argument("--load_in_4bit", action="store_true", help="Load model in 4-bit quantization")
    parser.add_argument("--load_in_8bit", action="store_true", help="Load model in 8-bit quantization")
    parser.add_argument("--max_length", type=int, default=2048, help="Maximum sequence length")
    parser.add_argument("--save_method", type=str, default="merged_4bit_forced", 
                       help="Save method: merged_4bit_forced, merged_16bit, or lora")
    
    args = parser.parse_args()
    
    # Validate paths
    if not os.path.exists(args.checkpoint):
        raise ValueError(f"Checkpoint path does not exist: {args.checkpoint}")
    
    # Check if checkpoint has full model or just adapters
    checkpoint_files = os.listdir(args.checkpoint)
    checkpoint_has_full_model = (
        os.path.exists(os.path.join(args.checkpoint, "pytorch_model.bin")) or
        os.path.exists(os.path.join(args.checkpoint, "model.safetensors")) or
        any(f.startswith("pytorch_model") for f in checkpoint_files)
    )
    
    # For 16bit saving, we need to load base model without quantization
    # (unless it was originally quantized, then we keep the quantization)
    load_4bit = args.load_in_4bit and args.save_method != "merged_16bit"
    load_8bit = args.load_in_8bit and args.save_method != "merged_16bit"
    
    if args.save_method == "merged_16bit":
        logger.info("Saving as 16bit: Loading base model without quantization for proper merging")
    
    # Load model
    if checkpoint_has_full_model:
        logger.info(f"Loading full model from checkpoint: {args.checkpoint}")
        model, tokenizer = FastLanguageModel.from_pretrained(
            model_name=args.checkpoint,
            max_seq_length=args.max_length,
            dtype=None,
            load_in_4bit=load_4bit,
            load_in_8bit=load_8bit,
        )
    else:
        logger.info(f"Loading base model: {args.base_model}")
        logger.info(f"Will load adapter weights from checkpoint: {args.checkpoint}")
        model, tokenizer = FastLanguageModel.from_pretrained(
            model_name=args.base_model,
            max_seq_length=args.max_length,
            dtype=None,
            load_in_4bit=load_4bit,
            load_in_8bit=load_8bit,
        )
        # Load adapter weights from checkpoint
        from peft import PeftModel
        model = PeftModel.from_pretrained(model, args.checkpoint)
    
    # Set to inference mode
    FastLanguageModel.for_inference(model)
    
    # Create output directory
    os.makedirs(args.output_dir, exist_ok=True)
    
    # Save model
    logger.info(f"Saving model using method: {args.save_method}")
    if args.save_method == "merged_4bit_forced":
        model.save_pretrained_merged(
            args.output_dir,
            tokenizer,
            save_method="merged_4bit_forced",
        )
    elif args.save_method == "merged_16bit":
        model.save_pretrained_merged(
            args.output_dir,
            tokenizer,
            save_method="merged_16bit",
        )
    elif args.save_method == "lora":
        model.save_pretrained(args.output_dir)
        tokenizer.save_pretrained(args.output_dir)
    else:
        raise ValueError(f"Unknown save_method: {args.save_method}")
    
    logger.info(f"Model saved successfully to: {args.output_dir}")


if __name__ == "__main__":
    main()

