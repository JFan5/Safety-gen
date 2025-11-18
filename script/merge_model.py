#!/usr/bin/env python3
"""
Script to merge a fine-tuned model to a base model using unsloth.
This converts a model with LoRA adapters to a full merged model.
"""
from unsloth import FastLanguageModel

base = "/jfan5/sft_qwen3/bfgs-variant-500"
out = "/jfan5/sft_qwen3/bfgs-variant-500-merged"

model, tokenizer = FastLanguageModel.from_pretrained(
    base,
    max_seq_length=4096,
    load_in_4bit=True,
    load_in_8bit=False,
)

FastLanguageModel.for_inference(model)

model.save_pretrained_merged(
    out,
    tokenizer,
    save_method="merged_4bit_forced",   # 显存紧就用 "merged_4bit_forced"
)

print("Merged saved to", out)

