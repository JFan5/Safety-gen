#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/grpo_mistral_7b_1219_symbolized_stl.o
#SBATCH --job-name=grpo_mistral_7b_1219_symbolized_stl
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
DATASET="/jfan5/grpo_data-127/merged.jsonl"

OUTPUT_DIR="/jfan5/grpo_models/mistral_7b-symbolized-1219-stl-1000"

# Training parameters
# NOTE: `--num_epochs` is currently not used by `script/train_grpo_unsloth_stl.py`;
# training length is controlled by `--max_steps`.
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=4
LEARNING_RATE=1e-5
NUM_GENERATIONS=8
TEMPERATURE=0.6
MAX_STEPS=1000
TOP_P=0.9
LOGGING_STEPS=20
SAVE_STEPS=60
WANDB_PROJECT="pddl-grpo-mistral7b"
RUN_NAME="grpo_mistral_7b-symbolized-1219-stl"
BETA=0.01
MAX_GRAD_NORM=1
SEED=3407

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

