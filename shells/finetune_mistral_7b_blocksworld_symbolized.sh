#!/bin/bash

# Fine-tune Mistral-7B on the symbolized (obfuscated) Blocksworld JSONL dataset.
# Converts JSONL -> HF dataset on the fly if the HF dir is missing.

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/finetune_mistral_7b_blocksworld_symbolized.o
#SBATCH --job-name=finetune_mistral_7b_blocksworld_sym




# Set working directory
cd /home/ubuntu/Safety-gen

# Paths
MODEL="unsloth/mistral-7b-instruct-v0.3-bnb-4bit"
DATASET="/jfan5/sft_data/pddl3_symbolized_four_scenarios/blocksworld.hf"
OUTPUT_DIR="/jfan5/sft_models/mistral_7b_blocksworld_symbolized-1222"



# Training parameters
NUM_EPOCHS=1
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=2
LEARNING_RATE=2e-4
MAX_SEQ_LENGTH=2048


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
    --eval-strategy steps  \
    --eval-steps 20 \
    --save-strategy steps \
    --save-steps 20 \
    --logging-steps 10 \
    --save-total-limit 3


echo ""
echo "=========================================="
echo "Fine-tuning completed!"
echo "=========================================="
echo "Model saved to: ${OUTPUT_DIR}"
echo ""


