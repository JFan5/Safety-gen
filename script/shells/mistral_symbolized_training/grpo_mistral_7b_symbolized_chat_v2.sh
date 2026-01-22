#!/bin/bash
# GRPO Training Script V2 for Mistral-7B with domain selection support
# Usage:
#   ./grpo_mistral_7b_symbolized_chat_v2.sh                    # Train on all domains
#   ./grpo_mistral_7b_symbolized_chat_v2.sh blocksworld        # Train on single domain
#   ./grpo_mistral_7b_symbolized_chat_v2.sh blocksworld,ferry  # Train on multiple domains

set -e

# Parse domain argument
DOMAINS_ARG=""
if [ -n "$1" ]; then
    DOMAINS_ARG="--domains $1"
    echo "Training on specified domains: $1"
else
    echo "Training on all available domains"
fi

# Model configuration
# Use SFT model as base (not raw quantized model)
BASE_MODEL="/jfan5/sft_models/mistral_7b/cross_domain_pddl3_symbolized"
DATA_ROOT="/jfan5/grpo_data/five_domain_0109"

# Generate output directory name based on domains
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
if [ -n "$1" ]; then
    DOMAIN_SUFFIX=$(echo "$1" | tr ',' '_')
    OUTPUT_DIR="/jfan5/grpo_models/mistral_7b_v2_${DOMAIN_SUFFIX}_${TIMESTAMP}"
    RUN_NAME="grpo-v2-mistral7b-${DOMAIN_SUFFIX}"
else
    OUTPUT_DIR="/jfan5/grpo_models/mistral_7b_v2_all_domains_${TIMESTAMP}"
    RUN_NAME="grpo-v2-mistral7b-all-domains"
fi

# Training parameters
BATCH_SIZE=4
MAX_STEPS=100  # Small number for testing
LEARNING_RATE=1e-5
NUM_GENERATIONS=4
TEMPERATURE=0.8
BETA=0.02

echo "============================================"
echo "GRPO V2 Training Configuration:"
echo "============================================"
echo "Base Model: ${BASE_MODEL}"
echo "Data Root: ${DATA_ROOT}"
echo "Domains: ${1:-all}"
echo "Output Dir: ${OUTPUT_DIR}"
echo "Batch Size: ${BATCH_SIZE}"
echo "Max Steps: ${MAX_STEPS}"
echo "Learning Rate: ${LEARNING_RATE}"
echo "============================================"

cd /home/ubuntu/Safety-gen/script

python train_grpo_unsloth_stl_v2.py \
    --base_model "${BASE_MODEL}" \
    --data_root "${DATA_ROOT}" \
    ${DOMAINS_ARG} \
    --output_dir "${OUTPUT_DIR}" \
    --batch_size ${BATCH_SIZE} \
    --max_steps ${MAX_STEPS} \
    --learning_rate ${LEARNING_RATE} \
    --num_generations ${NUM_GENERATIONS} \
    --temperature ${TEMPERATURE} \
    --beta ${BETA} \
    --save_steps 50 \
    --logging_steps 10 \
    --max_prompt_length 2048 \
    --max_new_tokens 512 \
    --wandb_project "pddl-grpo-training-v2" \
    --run_name "${RUN_NAME}" \
    --use_gradient_checkpointing \
    --seed 3407

echo "Training completed! Model saved to: ${OUTPUT_DIR}"
