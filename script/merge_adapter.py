#!/usr/bin/env python3
"""
Merge LoRA/PEFT adapter with base model for vLLM usage.

This script merges a trained adapter (LoRA/QLoRA) with its base model,
creating a standalone model that can be used directly with vLLM.
"""

import argparse
import logging
from pathlib import Path

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


def merge_adapter(base_model_path: str, adapter_path: str, output_path: str):
    """
    Merge PEFT adapter with base model.

    Args:
        base_model_path: Path to base model
        adapter_path: Path to adapter (LoRA/QLoRA)
        output_path: Path to save merged model
    """
    try:
        from peft import PeftModel
        from transformers import AutoModelForCausalLM, AutoTokenizer
    except ImportError:
        logger.error("PEFT or transformers not installed!")
        logger.error("Install with: pip install peft transformers")
        return False

    logger.info(f"Loading base model from: {base_model_path}")
    try:
        base_model = AutoModelForCausalLM.from_pretrained(
            base_model_path,
            torch_dtype="auto",
            device_map="auto"
        )
    except Exception as e:
        logger.error(f"Failed to load base model: {e}")
        return False

    logger.info(f"Loading adapter from: {adapter_path}")
    try:
        model = PeftModel.from_pretrained(base_model, adapter_path)
    except Exception as e:
        logger.error(f"Failed to load adapter: {e}")
        return False

    logger.info("Merging adapter with base model...")
    try:
        merged_model = model.merge_and_unload()
    except Exception as e:
        logger.error(f"Failed to merge: {e}")
        return False

    logger.info(f"Saving merged model to: {output_path}")
    Path(output_path).mkdir(parents=True, exist_ok=True)

    try:
        merged_model.save_pretrained(output_path)
        logger.info("Model saved successfully")
    except Exception as e:
        logger.error(f"Failed to save model: {e}")
        return False

    logger.info("Saving tokenizer...")
    try:
        tokenizer = AutoTokenizer.from_pretrained(base_model_path)
        tokenizer.save_pretrained(output_path)
        logger.info("Tokenizer saved successfully")
    except Exception as e:
        logger.error(f"Failed to save tokenizer: {e}")
        return False

    logger.info("✓ Merge completed successfully!")
    logger.info(f"You can now use the merged model: {output_path}")

    return True


def main():
    parser = argparse.ArgumentParser(
        description='Merge LoRA/PEFT adapter with base model'
    )
    parser.add_argument(
        '--base_model',
        type=str,
        required=True,
        help='Path to base model'
    )
    parser.add_argument(
        '--adapter',
        type=str,
        required=True,
        help='Path to adapter (LoRA/QLoRA checkpoint)'
    )
    parser.add_argument(
        '--output',
        type=str,
        required=True,
        help='Output path for merged model'
    )

    args = parser.parse_args()

    # Validate paths
    if not Path(args.base_model).exists():
        logger.error(f"Base model not found: {args.base_model}")
        return

    if not Path(args.adapter).exists():
        logger.error(f"Adapter not found: {args.adapter}")
        return

    # Check if output exists
    if Path(args.output).exists():
        response = input(f"Output directory {args.output} exists. Overwrite? (y/n): ")
        if response.lower() != 'y':
            logger.info("Cancelled by user")
            return

    # Merge
    success = merge_adapter(args.base_model, args.adapter, args.output)

    if success:
        print("\n" + "="*60)
        print("SUCCESS! Next steps:")
        print("="*60)
        print(f"1. Verify merged model:")
        print(f"   ls -lh {args.output}")
        print(f"")
        print(f"2. Use with DPO generation:")
        print(f"   ./run_dpo_generation.sh --model {args.output}")
        print("="*60)
    else:
        print("\n" + "="*60)
        print("FAILED! Please check the error messages above.")
        print("="*60)


if __name__ == "__main__":
    main()
