#!/bin/bash
set -euo pipefail

# Collect SFT training data from PDDL3 domains.
# Output directory will have timestamp appended automatically.
# A config.json file will be generated in the output directory.
#
# Usage: bash shells/collect_sft_data.sh

INPUT_DIR="$(pwd)/pddl3"
OUTPUT_DIR="/jfan5/sft_data/four_scenarios_simple"
SEED=42

python3 script/collect_sft_data.py \
  --input_dir "${INPUT_DIR}" \
  --output_dir "${OUTPUT_DIR}" \
  --domains blocksworld ferry grippers spanner delivery \
  --save_hf \
  --only-original \
  --problems_subdir sft_500_hard

echo ""
echo "Finished. Check output directory for JSONL files and config.json"
