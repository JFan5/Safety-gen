#!/bin/bash

# Evaluate LLM model on spanner scenario
# Usage: ./evaluate_llm_spanner.sh <model_path> [model_family] [max_problems]
# Example: ./evaluate_llm_spanner.sh /jfan5/sft_models/mistral_7b/four_scenarios500 mistral 50
# Note: spanner scenario requires --no-load-in-4bit flag

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl


# Parse arguments
MODEL_PATH="${1}"
MODEL_FAMILY="auto"
MAX_PROBLEMS=50
PROBLEMS_DIR="pddl3/spanner/all_problems3/testing"
DOMAIN_FILE="pddl3/spanner/domain3.pddl"

# Sanitize model path for filename (replace / and other special chars with -)
MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')
OUTPUT_FILE="planning_results/spanner_${MODEL_NAME}_50.json"

python3 script/evaluate_llm_solver.py \
    --model "${MODEL_PATH}" \
    --family "${MODEL_FAMILY}" \
    --problems-dir "${PROBLEMS_DIR}" \
    --domain-file "${DOMAIN_FILE}" \
    --max-problems ${MAX_PROBLEMS} \
    --output "${OUTPUT_FILE}" \
    --no-load-in-4bit \
    --one-shot

echo ""
echo "=========================================="
echo "Evaluation completed!"
echo "=========================================="
echo "Results saved to: ${OUTPUT_FILE} (with timestamp added)"
echo ""

