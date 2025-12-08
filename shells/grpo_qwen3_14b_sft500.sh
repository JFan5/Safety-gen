#!/bin/bash


#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/grpo_qwen3_14b_sft500.o
#SBATCH --job-name=grpo_qwen3_14b_sft500


conda activate llmstl

# Set working directory

# 单GPU配置
export CUDA_VISIBLE_DEVICES=0

# Configuration
BASE_MODEL="/jfan5/sft_models/qwen3-14b-1127"
# 
DATASET="/jfan5/grpo_data-127/merged.jsonl"
OUTPUT_DIR="/jfan5/grpo_models/qwen3_14b_1207"
# Training parameters

MAX_STEPS=500
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=8
LEARNING_RATE=5e-6
NUM_GENERATIONS=4
TEMPERATURE=0.6
TOP_P=0.9
LOGGING_STEPS=20
SAVE_STEPS=100
WANDB_PROJECT="pddl-grpo-qwen3-14b"
RUN_NAME="grpo_qwen3_14b_sft500"
BETA=0.01
echo "=========================================="
echo "GRPO Training for Qwen3-14B"
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
python3 script/train_grpo_unsloth_copy.py \
  --base_model "${BASE_MODEL}" \
  --dataset "${DATASET}" \
  --output_dir "${OUTPUT_DIR}" \
  --batch_size ${BATCH_SIZE} \
  --gradient_accumulation_steps ${GRADIENT_ACCUMULATION_STEPS} \
  --learning_rate ${LEARNING_RATE} \
  --max_steps ${MAX_STEPS} \
  --num_generations ${NUM_GENERATIONS} \
  --temperature ${TEMPERATURE} \
  --top_p ${TOP_P} \
  --logging_steps ${LOGGING_STEPS} \
  --save_steps ${SAVE_STEPS} \
  --wandb_project "${WANDB_PROJECT}" \
  --beta ${BETA} \
  --run_name "${RUN_NAME}"

echo ""
echo "=========================================="
echo "GRPO training completed!"
echo "=========================================="
echo "Model saved to: ${OUTPUT_DIR}"
echo ""

