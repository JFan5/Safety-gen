#!/bin/bash
# Script to save model from checkpoint after training completes

CHECKPOINT="/jfan5/dpo_qwen3/bfgs-variant-500/checkpoint-4304"
BASE_MODEL="/jfan5/sft_qwen3/bfgs-variant-500"
OUTPUT_DIR="/jfan5/dpo_qwen3/bfgs-variant-500"

# For 16bit saving, don't use --load_in_4bit
python3 /home/ubuntu/Safety-gen/script/save_model_from_checkpoint.py \
  --checkpoint "${CHECKPOINT}" \
  --base_model "${BASE_MODEL}" \
  --output_dir "${OUTPUT_DIR}" \
  --max_length 2048 \
  --save_method "merged_16bit"

