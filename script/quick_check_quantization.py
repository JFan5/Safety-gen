#!/usr/bin/env python3
"""Quick check model quantization - one-liner version"""
import sys
from unsloth import FastLanguageModel
import torch

model_path = sys.argv[1] if len(sys.argv) > 1 else "/groups/fkong/jfan5/sft_models/mistral_7b-spanner-variant-500_merged_16bit"

model, _ = FastLanguageModel.from_pretrained(model_path, max_seq_length=2048, load_in_4bit=False, load_in_8bit=False)

# Check quantization
is_4bit = any('Linear4bit' in str(type(m)) for m in model.modules())
is_8bit = any('Linear8bitLt' in str(type(m)) for m in model.modules())
dtype = next(model.parameters()).dtype

print(f"Model: {model_path}")
if is_4bit:
    print("Quantization: 4-bit (QLoRA)")
elif is_8bit:
    print("Quantization: 8-bit")
elif dtype == torch.float32:
    print("Quantization: 32-bit (FP32)")
elif dtype == torch.float16:
    print("Quantization: 16-bit (FP16)")
elif dtype == torch.bfloat16:
    print("Quantization: 16-bit (BF16)")
else:
    print(f"Quantization: {dtype}")


