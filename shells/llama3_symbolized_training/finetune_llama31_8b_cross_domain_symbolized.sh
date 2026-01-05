#!/bin/bash

# Cross-domain SFT on Llama-3.1-8B using the combined symbolized (obfuscated) PDDL3 dataset.
# Model: unsloth/Meta-Llama-3.1-8B-Instruct-bnb-4bit

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/finetune_llama31_8b_cross_domain_symbolized.o
#SBATCH --job-name=finetune_llama31_8b_cross_sym

# Initialize conda
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
  source "$HOME/miniconda3/etc/profile.d/conda.sh"
elif command -v conda >/dev/null 2>&1; then
  eval "$(conda shell.bash hook)"
else
  echo "[ERROR] conda not found; cannot activate env 'llmstl'." >&2
  exit 1
fi
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Paths
MODEL="unsloth/Meta-Llama-3.1-8B-Instruct-bnb-4bit"

DATASET="/jfan5/sft_data/pddl3_symbolized_four_scenarios/combined.hf"
OUTPUT_DIR="/jfan5/sft_models/llama31_8b/symbolized"

# Training parameters
NUM_EPOCHS=3
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=2
LEARNING_RATE=2e-4
SEED=3407
MAX_SEQ_LENGTH=4096

# LoRA parameters (optimized for Llama-3.1-8B)
LORA_R=32
LORA_ALPHA=64
LORA_DROPOUT=0.05

echo "=========================================="
echo "Fine-tuning Llama-3.1-8B on cross-domain PDDL3 symbolized dataset"
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
echo ""
echo "LoRA parameters:"
echo "  LoRA R: ${LORA_R}"
echo "  LoRA Alpha: ${LORA_ALPHA}"
echo "  LoRA Dropout: ${LORA_DROPOUT}"
echo "=========================================="
echo ""

# Run fine-tuning
python3 pddl_finetune.py \
    --mode train \
    --model "${MODEL}" \
    --family llama \
    --dataset "${DATASET}" \
    --output "${OUTPUT_DIR}" \
    --num-train-epochs ${NUM_EPOCHS} \
    --per-device-train-batch-size ${BATCH_SIZE} \
    --gradient-accumulation-steps ${GRADIENT_ACCUMULATION_STEPS} \
    --learning-rate ${LEARNING_RATE} \
    --max-seq-length ${MAX_SEQ_LENGTH} \
    --lora-r ${LORA_R} \
    --lora-alpha ${LORA_ALPHA} \
    --lora-dropout ${LORA_DROPOUT} \
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
