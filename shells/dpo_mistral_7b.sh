#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/dpo_mistral_7b_1206.o
#SBATCH --job-name=dpo_mistral_7b_1206



conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# 单GPU配置
export CUDA_VISIBLE_DEVICES=0

# Configuration
BASE_MODEL="/jfan5/sft_models/mistral_7b/four_scenarios500-1124"
DATASET="/jfan5/dpo_data-1206/all_scenarios_merged.jsonl"
OUTPUT_DIR="/jfan5/dpo_models/mistral_7b-1207"

# NUM_EPOCHS=1
# BATCH_SIZE=2  # Reduce to 1 to avoid Unsloth batching issues
# GRADIENT_ACCUMULATION_STEPS=16  # Increase to maintain effective batch size
# LEARNING_RATE=1e-6
# MAX_LENGTH=2048  # Reduce from 4096 - our data is much shorter anyway
# MAX_PROMPT_LENGTH=512
# BETA=0.1
# WARMUP_RATIO=0.1
# WEIGHT_DECAY=0.01
# LOGGING_STEPS=5
# SAVE_STEPS=50
# EVAL_STEPS=50
# Training parameters
NUM_EPOCHS=1  
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=8
LEARNING_RATE=1e-6
MAX_LENGTH=2048
MAX_PROMPT_LENGTH=512
BETA=0.1
WARMUP_RATIO=0.1  
WEIGHT_DECAY=0.01
LOGGING_STEPS=5
SAVE_STEPS=50
EVAL_STEPS=50
WANDB_PROJECT="pddl-dpo-mistral7b"
RUN_NAME="dpo_mistral_7b-1207"
echo "=========================================="
echo "DPO Training for Mistral-7B"
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
echo "  Beta: ${BETA}"
echo "=========================================="
echo ""
# Run DPO training
python3 script/train_dpo_unsloth.py \
  --base_model "${BASE_MODEL}" \
  --dataset "${DATASET}" \
  --output_dir "${OUTPUT_DIR}" \
  --num_epochs ${NUM_EPOCHS} \
  --batch_size ${BATCH_SIZE} \
  --beta ${BETA} \
  --gradient_accumulation_steps ${GRADIENT_ACCUMULATION_STEPS} \
  --learning_rate ${LEARNING_RATE} \
  --max_length ${MAX_LENGTH} \
  --max_prompt_length ${MAX_PROMPT_LENGTH} \
  --warmup_ratio ${WARMUP_RATIO} \
  --weight_decay ${WEIGHT_DECAY} \
  --eval_steps ${EVAL_STEPS} \
  --logging_steps ${LOGGING_STEPS} \
  --save_steps ${SAVE_STEPS} \
  --wandb_project "${WANDB_PROJECT}" \
  --run_name "${RUN_NAME}"

echo ""
echo "=========================================="
echo "DPO training completed!"
echo "=========================================="
echo "Model saved to: ${OUTPUT_DIR}"
echo ""


