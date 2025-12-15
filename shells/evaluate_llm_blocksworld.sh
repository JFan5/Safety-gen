#!/bin/bash

# Evaluate LLM model on blocksworld scenario
# Usage: ./evaluate_llm_blocksworld.sh <model_path> [testing_problems]
# Example: ./evaluate_llm_blocksworld.sh /jfan5/sft_models/mistral_7b/four_scenarios500 1

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
MODEL_PATH="${1}"
TESTING_PROBLEMS="${2:-0}"  # Default to 0 (disabled)

# Fixed parameters
MODEL_FAMILY="auto"
MAX_PROBLEMS=50

MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')
SCENARIO="blocksworld"
PROBLEMS_DIR="pddl3/blocksworld/${2:-testing_problem50}"
DOMAIN_FILE="pddl3/blocksworld/domain3.pddl"
OUTPUT_FILE="planning_results/blocksworld_${MODEL_NAME}_${MAX_PROBLEMS}.json"

echo "=========================================="
echo "Evaluating ${SCENARIO} scenario"
echo "=========================================="
echo "Model: ${MODEL_PATH}"
echo "Family: ${MODEL_FAMILY}"
echo "Max problems: ${MAX_PROBLEMS}"
echo "Testing problems: ${TESTING_PROBLEMS}"
echo "Output file: ${OUTPUT_FILE} (timestamp will be added)"
echo "=========================================="
echo ""


python3 script/evaluate_llm_solver.py \
        --model "${MODEL_PATH}" \
        --family "${MODEL_FAMILY}" \
        --problems-dir "${PROBLEMS_DIR}" \
        --domain-file "${DOMAIN_FILE}" \
        --max-problems ${MAX_PROBLEMS} \
        --output "${OUTPUT_FILE}"


echo ""
echo "=========================================="
echo "Evaluation completed!"
echo "=========================================="
echo "Results saved to: ${OUTPUT_FILE} (with timestamp added)"
echo ""

