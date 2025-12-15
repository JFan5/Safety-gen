#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/grpo_mistral_7b_1207.o
#SBATCH --job-name=grpo_mistral_7b_1207



conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# 单GPU配置
export CUDA_VISIBLE_DEVICES=0

# Configuration
BASE_MODEL="/jfan5/sft_models/mistral_7b/four_scenarios500-1124"
DATASET="/jfan5/grpo_data-127/merged.jsonl"
OUTPUT_DIR="/jfan5/grpo_models/mistral_7b-1214-stl-500"


# BATCH_SIZE=4
# GRADIENT_ACCUMULATION_STEPS=8
# LEARNING_RATE=5e-6
# NUM_GENERATIONS=4
# TEMPERATURE=0.6
# MAX_STEPS=200
# TOP_P=0.9
# LOGGING_STEPS=20
# SAVE_STEPS=100
# Training parameters
NUM_EPOCHS=1.0
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=8
LEARNING_RATE=5e-6
NUM_GENERATIONS=4
TEMPERATURE=0.6
MAX_STEPS=500
TOP_P=0.9
LOGGING_STEPS=20
SAVE_STEPS=60
EVAL_STEPS=60
WANDB_PROJECT="pddl-grpo-mistral7b"
RUN_NAME="grpo_mistral_7b-1214-stl-500"
BETA=0.01
MAX_GRAD_NORM=1
echo "=========================================="
echo "GRPO Training for Mistral-7B"
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
python3 script/train_grpo_unsloth_stl.py \
  --base_model "${BASE_MODEL}" \
  --dataset "${DATASET}" \
  --output_dir "${OUTPUT_DIR}" \
  --num_epochs ${NUM_EPOCHS} \
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
  --run_name "${RUN_NAME}"

echo ""
echo "=========================================="
echo "GRPO training completed!"
echo "=========================================="
echo "Model saved to: ${OUTPUT_DIR}"
echo ""

