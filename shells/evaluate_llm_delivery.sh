#!/bin/zsh

# Evaluate LLM model on delivery scenario
# Usage: ./evaluate_llm_delivery.sh <model_path> [model_family] [max_problems]
# Example: ./evaluate_llm_delivery.sh /jfan5/sft_models/mistral_7b/four_scenarios500 mistral 50

# Initialize conda for zsh shell
eval "$(conda shell.zsh hook)"
conda activate llmstl
# Set working directory


# Parse arguments
MODEL_PATH="${1}"
MODEL_FAMILY="auto"
MAX_PROBLEMS=50

MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')

PROBLEMS_DIR="pddl3/delivery/all_problems3/testing"
DOMAIN_FILE="pddl3/delivery/domain3.pddl"
OUTPUT_FILE="planning_results/delivery_${MODEL_NAME}_50.json"

python3 script/evaluate_llm_solver.py \
    --model "${MODEL_PATH}" \
    --family "${MODEL_FAMILY}" \
    --problems-dir "${PROBLEMS_DIR}" \
    --domain-file "${DOMAIN_FILE}" \
    --max-problems ${MAX_PROBLEMS} \
    --output "${OUTPUT_FILE}" \
    --one-shot

echo ""
echo "=========================================="
echo "Evaluation completed!"
echo "=========================================="
echo "Results saved to: ${OUTPUT_FILE} (with timestamp added)"
echo ""

