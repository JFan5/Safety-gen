#!/bin/zsh

# Evaluate LLM model on delivery scenario
# Usage: ./evaluate_llm_delivery.sh <model_path> [one_shot]
# Example: ./evaluate_llm_delivery.sh /jfan5/sft_models/mistral_7b/four_scenarios500 1

# Initialize conda for zsh shell
eval "$(conda shell.zsh hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
MODEL_PATH="${1}"
ONE_SHOT="${2:-0}"  # Default to 0 (disabled)

# Fixed parameters
MODEL_FAMILY="auto"
MAX_PROBLEMS=50

MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')

PROBLEMS_DIR="pddl3/delivery/testing_problem50"
DOMAIN_FILE="pddl3/delivery/domain3.pddl"
OUTPUT_FILE="planning_results/delivery_${MODEL_NAME}_50.json"

# Run evaluation
if [ "${ONE_SHOT}" = "1" ]; then
    python3 script/evaluate_llm_solver.py \
        --model "${MODEL_PATH}" \
        --family "${MODEL_FAMILY}" \
        --problems-dir "${PROBLEMS_DIR}" \
        --domain-file "${DOMAIN_FILE}" \
        --max-problems ${MAX_PROBLEMS} \
        --output "${OUTPUT_FILE}" \
        --one-shot
else
    python3 script/evaluate_llm_solver.py \
        --model "${MODEL_PATH}" \
        --family "${MODEL_FAMILY}" \
        --problems-dir "${PROBLEMS_DIR}" \
        --domain-file "${DOMAIN_FILE}" \
        --max-problems ${MAX_PROBLEMS} \
        --temperature 0.1 \
        --output "${OUTPUT_FILE}"
fi

echo ""
echo "=========================================="
echo "Evaluation completed!"
echo "=========================================="
echo "Results saved to: ${OUTPUT_FILE} (with timestamp added)"
echo ""

