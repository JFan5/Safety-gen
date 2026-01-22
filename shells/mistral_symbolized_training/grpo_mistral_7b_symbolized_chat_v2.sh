#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/grpo_mistral_7b_symbolized_chat_v2.o
#SBATCH --job-name=grpo_mistral_7b_symbolized_chat_v2
#SBATCH --chdir=/home/ubuntu/Safety-gen

conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Single GPU configuration
export CUDA_VISIBLE_DEVICES=0

# ==========================================
# GRPO Training V2 - STRENGTHENED Reward
# ==========================================
# This version uses train_grpo_unsloth_chat_v2.py with:
# 1. STRENGTHENED goal_not_satisfied penalty: [-0.8, -0.2] (was [-0.3, 0.0])
# 2. Training script auto-copy to runs dir for reproducibility
# 3. Configurable reward parameters via command line
#
# Key changes:
# - 0% goals satisfied: reward = -0.8 (was -0.3)
# - 100% goals satisfied: reward = -0.2 (was 0.0)
# - This discourages "lazy" plans that don't complete goals
# ==========================================

BASE_MODEL="/jfan5/sft_models/mistral_7b/symbolized_v2"

# Symbolized (obfuscated) 4-scenarios combined GRPO JSONL
DATASET="/jfan5/grpo_data/pddl3_symbolized_four_scenarios-v3/train_combined.jsonl"`

# Training parameters
BATCH_SIZE=8
GRADIENT_ACCUMULATION_STEPS=4
LEARNING_RATE=1e-5
NUM_GENERATIONS=4
TEMPERATURE=0.8
MAX_STEPS=1000
MAX_NEW_TOKENS=512  
TOP_P=0.9
LOGGING_STEPS=20
SAVE_STEPS=60
WANDB_PROJECT="pddl-grpo-mistral7b"
BETA=0.01
MAX_GRAD_NORM=1
SEED=3407

# ==========================================
# Reward Configuration (NEW in V2)
# ==========================================
# STRENGTHENED goal_not_satisfied penalty (default)
# Use --use_default_reward to revert to original settings
GOAL_NOT_SATISFIED_BASE=-0.8    # was -0.3
GOAL_NOT_SATISFIED_SCALE=0.6    # was 0.3

# ==========================================
# Auto-generate RUN_NAME and OUTPUT_DIR
# ==========================================
DATE_TAG=$(date +%m%d)
MODEL_TAG="mistral_7b"
DATASET_TAG="symbolized-chat-v2"

# Auto-generated RUN_NAME and OUTPUT_DIR
RUN_NAME="grpo_${MODEL_TAG}-${DATASET_TAG}-${DATE_TAG}"
OUTPUT_DIR="/jfan5/grpo_models/${MODEL_TAG}-blocksworld-${DATASET_TAG}-${DATE_TAG}-${MAX_STEPS}"

echo "=========================================="
echo "GRPO Training V2 - STRENGTHENED Reward"
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
echo "Reward Configuration (STRENGTHENED):"
echo "  goal_not_satisfied_base: ${GOAL_NOT_SATISFIED_BASE}"
echo "  goal_not_satisfied_scale: ${GOAL_NOT_SATISFIED_SCALE}"
echo "  goal_not_satisfied range: [${GOAL_NOT_SATISFIED_BASE}, $(echo "${GOAL_NOT_SATISFIED_BASE} + ${GOAL_NOT_SATISFIED_SCALE}" | bc)]"
echo ""
echo "Chat Template: ENABLED (Mistral format)"
echo "  Prompts will be wrapped as: <s>[INST] ... [/INST]"
echo "=========================================="
echo ""

# Run GRPO training V2 with strengthened reward
python3 script/train_grpo_unsloth_chat_v2.py \
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
  --domains blocksworld \ 
  --top_p ${TOP_P} \
  --max_steps ${MAX_STEPS} \
  --max_new_tokens ${MAX_NEW_TOKENS} \
  --logging_steps ${LOGGING_STEPS} \
  --save_steps ${SAVE_STEPS} \
  --wandb_project "${WANDB_PROJECT}" \
  --seed ${SEED} \
  --run_name "${RUN_NAME}" \
  --goal_not_satisfied_base ${GOAL_NOT_SATISFIED_BASE} \
  --goal_not_satisfied_scale ${GOAL_NOT_SATISFIED_SCALE}


echo ""
echo "=========================================="
echo "GRPO Training V2 completed!"
echo "=========================================="
echo "Model saved to: ${OUTPUT_DIR}"
echo ""
echo "Reward config saved to: runs/grpo/${RUN_NAME}_*/run.json"
echo "Training script copied to: runs/grpo/${RUN_NAME}_*/training_script.py"
echo ""
