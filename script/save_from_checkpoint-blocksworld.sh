#!/bin/bash
# Script to save model from checkpoint after training completes

CHECKPOINT="/groups/fkong/jfan5/dpo_models/mistral_7b/blocksworld/dpo-variant/checkpoint-226"
BASE_MODEL="/groups/fkong/jfan5/sft_models/mistral_7b/blocksworld/sft-variant"
OUTPUT_DIR="/groups/fkong/jfan5/dpo_models/mistral_7b/blocksworld/dpo-variant"

# For 16bit saving, don't use --load_in_4bit
python3 script/save_model_from_checkpoint.py \
  --checkpoint "${CHECKPOINT}" \
  --base_model "${BASE_MODEL}" \
  --output_dir "${OUTPUT_DIR}" \
  --max_length 2048 \
  --save_method "merged_16bit"

