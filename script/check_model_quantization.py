#!/usr/bin/env python3
"""
Check the quantization precision (bit width) of a model.

Usage:
    python script/check_model_quantization.py --model_path <model_path>
"""
import argparse
import torch
from unsloth import FastLanguageModel


def check_model_quantization(model_path: str):
    """Check the quantization precision of a model."""
    print(f"Loading model from: {model_path}")
    print("-" * 60)
    
    # Load model
    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=model_path,
        max_seq_length=2048,
        dtype=None,
        load_in_4bit=False,  # Don't force quantization
        load_in_8bit=False,
    )
    
    print("\n=== Model Quantization Information ===\n")
    
    # Method 1: Check model config
    if hasattr(model, "config"):
        config = model.config
        print("1. Model Config:")
        print(f"   - Model type: {getattr(config, '_name_or_path', 'unknown')}")
        if hasattr(config, "quantization_config"):
            qconfig = config.quantization_config
            print(f"   - Quantization config: {qconfig}")
        print()
    
    # Method 2: Check if model is quantized (bitsandbytes)
    is_4bit = False
    is_8bit = False
    
    # Check for 4-bit quantization
    try:
        from bitsandbytes.nn import Linear4bit
        for name, module in model.named_modules():
            if isinstance(module, Linear4bit):
                is_4bit = True
                print(f"2. Found 4-bit quantized layer: {name}")
                break
    except ImportError:
        pass
    
    # Check for 8-bit quantization
    try:
        from bitsandbytes.nn import Linear8bitLt
        for name, module in model.named_modules():
            if isinstance(module, Linear8bitLt):
                is_8bit = True
                print(f"2. Found 8-bit quantized layer: {name}")
                break
    except ImportError:
        pass
    
    # Method 3: Check weight dtype
    print("\n3. Weight Data Types (sample from first few layers):")
    layer_count = 0
    for name, param in model.named_parameters():
        if layer_count < 5:  # Show first 5 layers
            print(f"   - {name}: {param.dtype}, shape: {param.shape}")
            layer_count += 1
        else:
            break
    
    # Method 4: Check for PEFT/LoRA adapters
    is_peft = False
    try:
        from peft import PeftModel
        if isinstance(model, PeftModel):
            is_peft = True
            print("\n4. PEFT/LoRA Information:")
            print(f"   - Is PEFT model: Yes")
            print(f"   - Base model: {model.peft_config}")
            if hasattr(model, "get_base_model"):
                base_model = model.get_base_model()
                print(f"   - Base model type: {type(base_model).__name__}")
    except ImportError:
        pass
    
    # Summary
    print("\n" + "=" * 60)
    print("SUMMARY:")
    if is_4bit:
        print("   ✓ Model is 4-bit quantized (QLoRA)")
    elif is_8bit:
        print("   ✓ Model is 8-bit quantized")
    else:
        # Check dtype
        sample_param = next(model.parameters())
        dtype = sample_param.dtype
        if dtype == torch.float32:
            print("   ✓ Model is 32-bit (FP32)")
        elif dtype == torch.float16:
            print("   ✓ Model is 16-bit (FP16)")
        elif dtype == torch.bfloat16:
            print("   ✓ Model is 16-bit (BF16)")
        else:
            print(f"   ✓ Model dtype: {dtype}")
    
    if is_peft:
        print("   ✓ Model has PEFT/LoRA adapters")
    
    print("=" * 60)


def main():
    parser = argparse.ArgumentParser(description="Check model quantization precision")
    parser.add_argument("--model_path", required=True, help="Path to model directory or HF Hub ID")
    args = parser.parse_args()
    
    check_model_quantization(args.model_path)


if __name__ == "__main__":
    main()

