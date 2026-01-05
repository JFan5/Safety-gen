#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/grpo_mistral_7b_grippers.o
#SBATCH --job-name=grpo_mistral_7b_grippers



conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# 单GPU配置
export CUDA_VISIBLE_DEVICES=0

# Configuration
BASE_MODEL="/jfan5/sft_models/mistral_7b/four_scenarios500-1124"
DATASET="/jfan5/ppo_data/grippers.jsonl"
OUTPUT_DIR="/jfan5/grpo_models/mistral_7b-grippers-1129"

# Training parameters
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=8
LEARNING_RATE=5e-6
NUM_GENERATIONS=8
TEMPERATURE=0.6
MAX_STEPS=300
TOP_P=0.9
LOGGING_STEPS=20
SAVE_STEPS=20
WANDB_PROJECT="pddl-grpo-mistral7b"
RUN_NAME="grpo_mistral_7b-grippers-1129"
BETA=0.02
MAX_GRAD_NORM=1
SEED=3407
echo "=========================================="
echo "GRPO Training for Mistral-7B - Grippers"
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
echo "  Temperature: ${TEMPERATURE}"
echo "  Top P: ${TOP_P}"
echo "  Logging steps: ${LOGGING_STEPS}"
echo "  Save steps: ${SAVE_STEPS}"
echo "  Eval steps: ${EVAL_STEPS}"
echo "  Wandb project: ${WANDB_PROJECT}"
echo "  Run name: ${RUN_NAME}"
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


