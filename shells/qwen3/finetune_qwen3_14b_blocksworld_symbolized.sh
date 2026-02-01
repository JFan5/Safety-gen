#!/bin/bash

# Fine-tune unsloth/Qwen3-14B-unsloth-bnb-4bit on the symbolized (obfuscated) Blocksworld dataset.
# Converts JSONL -> HF dataset on the fly if the HF dir is missing.

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/finetune_qwen3_14b_blocksworld_symbolized.o
#SBATCH --job-name=finetune_qwen3_14b_blocksworld_sym



conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Paths
MODEL="unsloth/Qwen3-14B-unsloth-bnb-4bit"
SYM_JSONL="/jfan5/sft_data/pddl3_symbolized_four_scenarios/blocksworld.jsonl"
DATASET="/jfan5/sft_data/pddl3_symbolized_four_scenarios/blocksworld.hf"
OUTPUT_DIR="/jfan5/sft_models/qwen3_14b/blocksworld_pddl3_symbolized"

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
            "scenario": "blocksworld",
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
SEED=3407
MAX_SEQ_LENGTH=4096

echo "=========================================="
echo "Fine-tuning Qwen3-14B on Blocksworld (PDDL3 symbolized)"
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
echo ""


