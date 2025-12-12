#!/bin/bash

# Cross-domain SFT on Mistral-7B using the combined symbolized (obfuscated) PDDL3 dataset.
# Converts combined JSONL -> HF dataset if the HF dir is missing.

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/finetune_mistral_7b_cross_domain_symbolized.o
#SBATCH --job-name=finetune_mistral_7b_cross_sym

set -euo pipefail

conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Paths
MODEL="unsloth/mistral-7b-instruct-v0.3-bnb-4bit"
SYM_JSONL="/jfan5/sft_data/pddl3_symbolized_four_scenarios/combined.jsonl"
DATASET="/jfan5/sft_data/pddl3_symbolized_four_scenarios/combined.hf"
OUTPUT_DIR="/jfan5/sft_models/mistral_7b/symbolized"

# Convert JSONL -> HF dataset if needed
if [ ! -d "${DATASET}" ]; then
  python3 - "${SYM_JSONL}" "${DATASET}" <<'PY'
import sys, json
from pathlib import Path
from datasets import Dataset

src = Path(sys.argv[1])
dst = Path(sys.argv[2])
if not src.exists():
    raise SystemExit(f"Source JSONL not found: {src}")

print(f"Building HF dataset from {src} -> {dst}")
entries = []
with src.open(encoding="utf-8") as f:
    for line in f:
        line = line.strip()
        if not line:
            continue
        obj = json.loads(line)
        entries.append({
            "prompt": obj.get("input", ""),
            "path": obj.get("output", ""),
            "scenario": "cross_domain",
            "pddl": "PDDL3",
        })

ds = Dataset.from_list(entries)
ds.save_to_disk(str(dst))
print(f"Saved HF dataset with {len(ds)} entries to {dst}")
PY
fi

# Training parameters
NUM_EPOCHS=3
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=2
LEARNING_RATE=2e-4
MAX_SEQ_LENGTH=4096

echo "=========================================="
echo "Fine-tuning Mistral-7B on cross-domain PDDL3 symbolized dataset"
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
    --save-total-limit 3

echo ""
echo "=========================================="
echo "Fine-tuning completed!"
echo "=========================================="
echo "Model saved to: ${OUTPUT_DIR}"
echo ""


