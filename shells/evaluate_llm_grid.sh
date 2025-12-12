#!/bin/bash

# Evaluate LLM model on grid scenario
# Usage: ./evaluate_llm_grid.sh <model_path> [one_shot]
# Example: ./evaluate_llm_grid.sh /jfan5/sft_models/mistral_7b/four_scenarios500 1

set -e

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

MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')
PROBLEMS_DIR="pddl3/grid/testing_problem50"
DOMAIN_FILE="pddl3/grid/domain3.pddl"
OUTPUT_FILE="planning_results/grid_${MODEL_NAME}_50.json"

echo "=========================================="
echo "Evaluating ${MODEL_PATH} model"
echo "=========================================="
echo "Model: ${MODEL_PATH}"
echo "Family: ${MODEL_FAMILY}"
echo "Max problems: ${MAX_PROBLEMS}"
echo "One-shot: ${ONE_SHOT}"
echo "Output file: ${OUTPUT_FILE} (timestamp will be added)"
echo "=========================================="
echo ""

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
        --output "${OUTPUT_FILE}"
fi

echo ""
echo "=========================================="
echo "Evaluation completed!"
echo "=========================================="
echo "Results saved to: ${OUTPUT_FILE} (with timestamp added)"
echo ""

