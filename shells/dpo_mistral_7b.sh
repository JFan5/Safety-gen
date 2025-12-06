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
DATASET="/home/ubuntu/Safety-gen/data/dpo/new_four/multi_pddl3_dpo.jsonl"
OUTPUT_DIR="/jfan5/dpo_models/mistral_7b-1206"


# /home/ubuntu/Safety-gen/script/train_dpo_unsloth.py --base_model /jfan5/sft_models/mistral_variant-blocksworld --dataset /home/ubuntu/Safety-gen/data/dpo/new_four/blocksworld_pddl3_dpo.jsonl --output_dir /jfan5/dpo_models/mistral_7b-blocksworld-1127 --num_epochs 1 --batch_size 8 --gradient_accumulation_steps 4 --learning_rate 2e-6 --save_steps 10 --eval_steps 10 --logging_steps 10 --beta 0.02 --run_name dpo-mistral-blocksworld-1127 --dataloader_num_workers 16


# Training parameters
NUM_EPOCHS=2
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=4
LEARNING_RATE=5e-6
MAX_LENGTH=4096
MAX_PROMPT_LENGTH=512
BETA=0.02
WARMUP_RATIO=0.1
WEIGHT_DECAY=0.01
LOGGING_STEPS=10
SAVE_STEPS=50
EVAL_STEPS=50
WANDB_PROJECT="pddl-dpo-mistral7b"
RUN_NAME="dpo_mistral_7b-1206"
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


