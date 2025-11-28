#!/bin/bash

# Evaluate LLM model on spanner scenario
# Usage: ./evaluate_llm_spanner.sh <model_path> [one_shot]
# Example: ./evaluate_llm_spanner.sh /jfan5/sft_models/mistral_7b/four_scenarios500 1
# Note: spanner scenario requires --no-load-in-4bit flag

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
MODEL_PATH="${1}"
ONE_SHOT="${2:-0}"  # Default to 0 (disabled)

# Fixed parameters
MODEL_FAMILY="auto"
MAX_PROBLEMS=50
PROBLEMS_DIR="pddl3/spanner/all_problems3/testing"
DOMAIN_FILE="pddl3/spanner/domain3.pddl"

# Sanitize model path for filename (replace / and other special chars with -)
MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')
OUTPUT_FILE="planning_results/spanner_${MODEL_NAME}_50.json"

# Run evaluation
if [ "${ONE_SHOT}" = "1" ]; then
    python3 script/evaluate_llm_solver.py \
        --model "${MODEL_PATH}" \
        --family "${MODEL_FAMILY}" \
        --problems-dir "${PROBLEMS_DIR}" \
        --domain-file "${DOMAIN_FILE}" \
        --max-problems ${MAX_PROBLEMS} \
        --output "${OUTPUT_FILE}" \
        --no-load-in-4bit \
        --one-shot
else
    python3 script/evaluate_llm_solver.py \
        --model "${MODEL_PATH}" \
        --family "${MODEL_FAMILY}" \
        --problems-dir "${PROBLEMS_DIR}" \
        --domain-file "${DOMAIN_FILE}" \
        --max-problems ${MAX_PROBLEMS} \
        --output "${OUTPUT_FILE}" \
        --no-load-in-4bit
fi

echo ""
echo "=========================================="
echo "Evaluation completed!"
echo "=========================================="
echo "Results saved to: ${OUTPUT_FILE} (with timestamp added)"
echo ""

