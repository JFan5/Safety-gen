#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/grpo_mistral_7b_symbolized_stl.o
#SBATCH --job-name=grpo_mistral_7b_symbolized_stl
#SBATCH --chdir=/home/ubuntu/Safety-gen

conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# 单GPU配置
export CUDA_VISIBLE_DEVICES=0

# ==========================================
# Step 2: GRPO Training Configuration
# ==========================================
BASE_MODEL="/jfan5/sft_models/mistral_7b/symbolized_v2"

# Symbolized (obfuscated) 4-scenarios combined GRPO JSONL
# DATASET="/jfan5/grpo_data/pddl3_symbolized_four_scenarios-v3/train_combined.jsonl"
DATASET="/jfan5/grpo_data/five_domain_0109/combined.jsonl"

# Training parameters
# training length is controlled by `--max_steps`.

BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=4
LEARNING_RATE=5e-6
NUM_GENERATIONS=4
TEMPERATURE=0.6
MAX_STEPS=1000
TOP_P=0.9
LOGGING_STEPS=50
SAVE_STEPS=100
MAX_PROMPT_LENGTH=2048
MAX_NEW_TOKENS=512
WANDB_PROJECT="pddl-grpo-mistral7b"
BETA=0.05
MAX_GRAD_NORM=1
SEED=3407

# ==========================================
# Auto-generate RUN_NAME and OUTPUT_DIR
# ==========================================
DATE_TAG=$(date +%m%d)
MODEL_TAG="mistral_7b"
DATASET_TAG="five_domain_0109-combined"

# 自动生成 RUN_NAME 和 OUTPUT_DIR
RUN_NAME="grpo_${MODEL_TAG}-${DATASET_TAG}-${DATE_TAG}-stl"

echo "=========================================="
echo "Step 2: GRPO Training for Mistral-7B (Symbolized)"
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
        echo "=========================================="
        echo ""

# Run GRPO training
python3 script/train_grpo_unsloth_stl.py \
  --base_model "${BASE_MODEL}" \
  --dataset "${DATASET}" \
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

