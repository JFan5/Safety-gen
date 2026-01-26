#!/bin/bash

# Fine-tune unsloth/Qwen3-14B-unsloth-bnb-4bit on combined SFT dataset
# Dataset: /jfan5/sft_data/four_scenarios500/combined.hf
# Contains: 4 scenarios × 500 problems × 5 variants = 10,000 entries

conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Configuration
MODEL="unsloth/Qwen3-14B-unsloth-bnb-4bit"
DATASET="/jfan5/sft_data/four_scenarios_simple/combined.hf"
# Auto-generate timestamp for output directory
DATE_TAG=$(date +%m%d)
OUTPUT_DIR="/jfan5/sft_models/qwen3_14b/four_scenarios500_${DATE_TAG}"

# Training parameters
NUM_EPOCHS=3
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=2
LEARNING_RATE=2e-4
SEED=3407
MAX_SEQ_LENGTH=4096

echo "=========================================="
echo "Fine-tuning Qwen3-14B"
echo "=========================================="
echo "Model: ${MODEL}"
echo "Dataset: ${DATASET}"
echo "Output: ${OUTPUT_DIR}"
echo ""
echo "Training parameters:"
echo "  Epochs: ${NUM_EPOCHS}"
echo "  Batch size: ${BATCH_SIZE}"
echo "  Gradient accumulation: ${GRADIENT_ACCUMULATION_STEPS}"
echo "  Learning rate: ${LEARNING_RATE}"
echo "  Max sequence length: ${MAX_SEQ_LENGTH}"
echo "=========================================="
echo ""

# Run fine-tuning
python3 pddl_finetune.py \
    --mode train \
    --model "${MODEL}" \
    --family qwen \
    --dataset "${DATASET}" \
    --output "${OUTPUT_DIR}" \
    --num-train-epochs ${NUM_EPOCHS} \
    --per-device-train-batch-size ${BATCH_SIZE} \
    --gradient-accumulation-steps ${GRADIENT_ACCUMULATION_STEPS} \
    --learning-rate ${LEARNING_RATE} \
    --max-seq-length ${MAX_SEQ_LENGTH} \
    --load-in-4bit \
    --eval-strategy epoch \
    --save-strategy epoch \
    --logging-steps 10 \
    --save-total-limit 3 \
    --seed ${SEED}

echo ""
echo "=========================================="
echo "Fine-tuning completed!"
echo "=========================================="
echo "Model saved to: ${OUTPUT_DIR}"

