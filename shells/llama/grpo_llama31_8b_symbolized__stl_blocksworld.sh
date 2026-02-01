#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/grpo_llama31_8b_symbolized_chat.o
#SBATCH --job-name=grpo_llama31_8b_symbolized_chat
#SBATCH --chdir=/home/ubuntu/Safety-gen

conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# 单GPU配置
export CUDA_VISIBLE_DEVICES=0

# ==========================================
# GRPO Training with Chat Template
# ==========================================
# This version uses train_grpo_unsloth_chat.py which wraps prompts
# with chat template (e.g., <|begin_of_text|>...<|eot_id|> for LLaMA3) to match
# the SFT training format and reduce format errors.
# ==========================================

BASE_MODEL="/jfan5/sft_models/llama31_8b/symbolized"

# Symbolized (obfuscated) 4-scenarios combined GRPO JSONL
DATASET="/jfan5/grpo_data/pddl3_symbolized_four_scenarios-v3/blocksworld.jsonl"

# Training parameters
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=4
LEARNING_RATE=1e-5
NUM_GENERATIONS=4
TEMPERATURE=0.8
MAX_STEPS=500
TOP_P=0.9
LOGGING_STEPS=20
SAVE_STEPS=60
WANDB_PROJECT="pddl-grpo-llama31-8b-blocksworld"
BETA=0.01
MAX_GRAD_NORM=1
SEED=3407

# ==========================================
# Auto-generate RUN_NAME and OUTPUT_DIR
# ==========================================
DATE_TAG=$(date +%m%d)
MODEL_TAG="llama31_8b"
DATASET_TAG="symbolized-chat-blocksworld"

# 自动生成 RUN_NAME 和 OUTPUT_DIR
RUN_NAME="grpo_${MODEL_TAG}-${DATASET_TAG}-${DATE_TAG}"
OUTPUT_DIR="/jfan5/grpo_models/${MODEL_TAG}-blocksworld-${DATASET_TAG}-${DATE_TAG}-${MAX_STEPS}"

echo "=========================================="
echo "GRPO Training for LLaMA3.1-8B (with Chat Template) for Blocksworld Dataset"
echo "=========================================="
echo "Base model: ${BASE_MODEL}"
echo "Dataset: ${DATASET}"
echo "Output: ${OUTPUT_DIR}"
echo ""
echo "Training parameters:"
echo "  Batch size: ${BATCH_SIZE}"
echo "  Gradient accumulation: ${GRADIENT_ACCUMULATION_STEPS}"
echo "  Learning rate: ${LEARNING_RATE}"
echo "  Generations per prompt: ${NUM_GENERATIONS}"
echo "  Temperature: ${TEMPERATURE}"
echo "  Beta (KL penalty): ${BETA}"
echo ""
echo "Chat Template: ENABLED (LLaMA3 format)"
echo "  Prompts will be wrapped as: <|begin_of_text|><|start_header_id|>user<|end_header_id|>..."
echo "=========================================="
echo ""

# Run GRPO training with chat template
python3 script/train_grpo_unsloth_stl.py \
  --base_model "${BASE_MODEL}" \
  --dataset "${DATASET}" \
  --output_dir "${OUTPUT_DIR}" \
  --batch_size ${BATCH_SIZE} \
  --beta ${BETA} \
  --max_grad_norm ${MAX_GRAD_NORM} \
  --gradient_accumulation_steps ${GRADIENT_ACCUMULATION_STEPS} \
  --learning_rate ${LEARNING_RATE} \
  --num_generations ${NUM_GENERATIONS} \
  --temperature ${TEMPERATURE} \
  --top_p ${TOP_P} \
  --max_steps ${MAX_STEPS} \
  --logging_steps ${LOGGING_STEPS} \
  --save_steps ${SAVE_STEPS} \
  --wandb_project "${WANDB_PROJECT}" \
  --seed ${SEED} \
  --run_name "${RUN_NAME}"

echo ""
echo "=========================================="
echo "GRPO training completed!"
echo "=========================================="
echo "Model saved to: ${OUTPUT_DIR}"
echo ""
