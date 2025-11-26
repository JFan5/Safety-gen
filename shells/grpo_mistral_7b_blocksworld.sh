#!/bin/bash

# GRPO training for Mistral-7B SFT model - Blocksworld only
# Base model: /home/ubuntu/sft_models/mistral_7b/blocksworld/pddl3

conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# 单GPU配置
export CUDA_VISIBLE_DEVICES=0

# Configuration
BASE_MODEL="/jfan5/sft_models/mistral_variant-blocksworld"
DATASET="/jfan5/ppo_data/blocksworld.jsonl"
OUTPUT_DIR="/jfan5/grpo_models/mistral_variant-blocksworld"

# Training parameters
NUM_EPOCHS=1.0
BATCH_SIZE=16
GRADIENT_ACCUMULATION_STEPS=2
LEARNING_RATE=5e-6
NUM_GENERATIONS=8
TEMPERATURE=0.6
TOP_P=0.9
LOGGING_STEPS=20
MAX_STEPS=500
SAVE_STEPS=100
WANDB_PROJECT="pddl-grpo-mistral7b"
RUN_NAME="grpo_mistral_7b_blocksworld"

echo "=========================================="
echo "GRPO Training for Mistral-7B - Blocksworld"
echo "=========================================="
echo "Base model: ${BASE_MODEL}"
echo "Dataset: ${DATASET}"
echo "Output: ${OUTPUT_DIR}"
echo ""
echo "Training parameters:"
echo "  Epochs: ${NUM_EPOCHS}"
echo "  Batch size: ${BATCH_SIZE}"
echo "  Gradient accumulation: ${GRADIENT_ACCUMULATION_STEPS}"
echo "  Learning rate: ${LEARNING_RATE}"
echo "  Generations per prompt: ${NUM_GENERATIONS}"
echo "=========================================="
echo ""

# Run GRPO training
python3 script/train_grpo_unsloth.py \
  --base_model "${BASE_MODEL}" \
  --dataset "${DATASET}" \
  --output_dir "${OUTPUT_DIR}" \
  --max_steps ${MAX_STEPS} \
  --num_epochs ${NUM_EPOCHS} \
  --batch_size ${BATCH_SIZE} \
  --gradient_accumulation_steps ${GRADIENT_ACCUMULATION_STEPS} \
  --learning_rate ${LEARNING_RATE} \
  --num_generations ${NUM_GENERATIONS} \
  --temperature ${TEMPERATURE} \
  --top_p ${TOP_P} \
  --logging_steps ${LOGGING_STEPS} \
  --save_steps ${SAVE_STEPS} \
  --wandb_project "${WANDB_PROJECT}" \
  --run_name "${RUN_NAME}"

echo ""
echo "=========================================="
echo "GRPO training completed!"
echo "=========================================="
echo "Model saved to: ${OUTPUT_DIR}"
echo ""

