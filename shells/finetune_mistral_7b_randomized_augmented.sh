#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/finetune_mistral_7b_randomized_augmented.o
#SBATCH --job-name=finetune_mistral_7b_randomized_aug

conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Configuration
MODEL="unsloth/mistral-7b-instruct-v0.3-bnb-4bit"
# Augmented randomized dataset with 5 prompt variants per problem
# Original: 2000 problems → Augmented: 10000 training samples (2000 × 5)
DATASET="/jfan5/sft_data/four_scenarios500_randomized_augmented/combined.hf"
OUTPUT_DIR="/jfan5/sft_models/mistral_7b/four_scenarios500_randomized_augmented"

# Training parameters
NUM_EPOCHS=3
BATCH_SIZE=8
GRADIENT_ACCUMULATION_STEPS=2
LEARNING_RATE=2e-4
SEED=3407
MAX_SEQ_LENGTH=4096

echo "=========================================="
echo "Fine-tuning Mistral-7B on Augmented Randomized PDDL Dataset"
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
echo "Dataset Augmentation Info:"
echo "  Original problems: 2000"
echo "  Prompt variants per problem: 5"
echo "  Total training samples: ~10000 (2000 × 5)"
echo "  Augmentation strategy: Sequential prompt templates (1-5)"
echo ""
echo "Randomization Info:"
echo "  - Predicates randomized: clear -> p5, on-table -> p2, etc."
echo "  - Actions randomized: pickup -> a3, stack -> a4, etc."
echo "  - Objects randomized: b1 -> o1, b2 -> o4, etc."
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
echo "Training statistics:"
echo "  Total training samples: ~10000"
echo "  Effective batch size: $((BATCH_SIZE * GRADIENT_ACCUMULATION_STEPS))"
echo "  Total training steps: ~$((10000 * NUM_EPOCHS / (BATCH_SIZE * GRADIENT_ACCUMULATION_STEPS)))"
