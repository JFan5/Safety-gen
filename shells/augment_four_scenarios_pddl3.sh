#!/bin/bash
set -euo pipefail

# Generate symbolized (obfuscated) JSONL datasets for four scenarios using PDDL3 data.
# Uses pddl3/pddl_augment.py to create per-domain JSONL files and a combined.jsonl.



INPUT_DIR="$(pwd)/pddl3"
OUTPUT_DIR="/jfan5/sft_data/pddl3_symbolized_four_scenarios"
SEED=42

python3 pddl3/pddl_augment.py \
  --input_dir "${INPUT_DIR}" \
  --output_dir "${OUTPUT_DIR}" \
  --domains blocksworld ferry grippers spanner \
  --problems_subdir sft_500 \
  --seed "${SEED}"

echo ""
echo "Finished. Per-domain JSONL files and combined.jsonl are in: ${OUTPUT_DIR}"
