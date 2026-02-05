#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/grpo_qwen3_4b_thinking_sft500.o
#SBATCH --job-name=grpo_qwen3_4b_thinking_sft500



conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# 单GPU配置
export CUDA_VISIBLE_DEVICES=0

# Configuration
BASE_MODEL="/jfan5/sft_models/qwen3-4b-thinking/four_scenarios500"
DATASET="/jfan5/ppo_data/all_scenarios.jsonl"
OUTPUT_DIR="/jfan5/grpo_models/qwen3_4b_thinking_sft500"

# Training parameters
MAX_STEPS=500
BATCH_SIZE=16
GRADIENT_ACCUMULATION_STEPS=2
LEARNING_RATE=1e-5
NUM_GENERATIONS=2
TEMPERATURE=0.8
TOP_P=0.9
LOGGING_STEPS=20
SAVE_STEPS=100
WANDB_PROJECT="pddl-grpo-qwen3-4b-thinking"
RUN_NAME="grpo_qwen3_4b_thinking_sft500"

echo "=========================================="
echo "GRPO Training for Qwen3-4B-Thinking"
echo "=========================================="
echo "Base model: ${BASE_MODEL}"
echo "Dataset: ${DATASET}"
echo "Output: ${OUTPUT_DIR}"
echo ""
echo "Training parameters:"
echo "  Max steps: ${MAX_STEPS}"
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
  --max_steps ${MAX_STEPS} \
  --batch_size ${BATCH_SIZE} \
  --gradient_accumulation_steps ${GRADIENT_ACCUMULATION_STEPS} \
  --learning_rate ${LEARNING_RATE} \
  --num_generations ${NUM_GENERATIONS} \
  --temperature ${TEMPERATURE} \
  --top_p ${TOP_P} \
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

