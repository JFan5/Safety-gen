#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/finetune_mistral_7b_ferry.o
#SBATCH --job-name=finetune_mistral_7b_ferry

conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Configuration
MODEL="unsloth/mistral-7b-instruct-v0.3-bnb-4bit"
DATASET="/jfan5/sft_data/ferry-sft500-variant-5/pddl3.hf"
OUTPUT_DIR="/jfan5/sft_models/mistral_variant-ferry"

# Training parameters
NUM_EPOCHS=3
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=2
LEARNING_RATE=2e-4
SEED=3407
MAX_SEQ_LENGTH=4096

echo "=========================================="
echo "Fine-tuning Mistral-7B on Ferry"
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
    --family mistral \
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
echo ""


