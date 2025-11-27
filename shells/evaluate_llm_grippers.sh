#!/bin/bash

# Evaluate LLM model on grippers scenario
# Usage: ./evaluate_llm_grippers.sh <model_path> [model_family] [max_problems]
# Example: ./evaluate_llm_grippers.sh /jfan5/sft_models/mistral_7b/four_scenarios500 mistral 50

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Parse arguments
MODEL_PATH="${1}"
MODEL_FAMILY="auto"
MAX_PROBLEMS=50

MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')
PROBLEMS_DIR="pddl3/grippers/all_problems3/testing"
DOMAIN_FILE="pddl3/grippers/domain3.pddl"
OUTPUT_FILE="planning_results/grippers_${MODEL_NAME}_50.json"

echo "=========================================="
echo "Evaluating ${MODEL_PATH} model"
echo "=========================================="
echo "Model: ${MODEL_PATH}"
echo "Family: ${MODEL_FAMILY}"
echo "Max problems: ${MAX_PROBLEMS}"
echo "Output file: ${OUTPUT_FILE} (timestamp will be added)"
echo "=========================================="
echo ""

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

