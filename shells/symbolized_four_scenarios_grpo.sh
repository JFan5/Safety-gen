#!/bin/bash
set -euo pipefail

# Generate symbolized (obfuscated) JSONL datasets for four scenarios using PDDL3 GRPO data.
# Uses pddl3/pddl_augment.py to create per-domain JSONL files and a combined.jsonl.
# This script generates GRPO training data from grpo_500 problem sets.



INPUT_DIR="$(pwd)/pddl3"
OUTPUT_DIR="/jfan5/grpo_data/pddl3_symbolized_four_scenarios"
SEED=42

python3 pddl3/pddl_symbolized.py \
  --input_dir "${INPUT_DIR}" \
  --output_dir "${OUTPUT_DIR}" \
  --domains blocksworld ferry grippers spanner \
  --problems_subdir grpo_500 \
  --seed "${SEED}"




echo ""
echo "Finished. Per-domain JSONL files and combined.jsonl are in: ${OUTPUT_DIR}"

