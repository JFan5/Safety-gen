#!/bin/bash

# Evaluate LLM model on ferry scenario using BATCH PROCESSING
# Usage: ./evaluate_llm_ferry_batch.sh <model_path> [batch_size] [num_workers]
# Example: ./evaluate_llm_ferry_batch.sh /jfan5/sft_models/mistral_7b/ferry 8 8

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
MODEL_PATH="${1}"
BATCH_SIZE="${2:-8}"
NUM_WORKERS="${3:-8}"

# Fixed parameters
MODEL_FAMILY="auto"
MAX_PROBLEMS=50

# Sanitize model path for filename
MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')

# Scenario-specific paths
SCENARIO="ferry"
PROBLEMS_DIR="pddl3/ferry/testing_problem50"
DOMAIN_FILE="pddl3/ferry/domain3.pddl"
OUTPUT_FILE="planning_results/ferry_${MODEL_NAME}_${MAX_PROBLEMS}.json"

echo "=========================================="
echo "Evaluating model on ${SCENARIO} (BATCH MODE)"
echo "=========================================="
echo "Model: ${MODEL_PATH}"
echo "Family: ${MODEL_FAMILY}"
echo "Max problems: ${MAX_PROBLEMS}"
echo "Batch size: ${BATCH_SIZE}"
echo "Validation workers: ${NUM_WORKERS}"
echo "Problems dir: ${PROBLEMS_DIR}"
echo "Domain file: ${DOMAIN_FILE}"
echo "Output file: ${OUTPUT_FILE} (timestamp will be added)"
echo "=========================================="
echo ""

# Run evaluation with batch processing
python3 script/evaluate_llm_solver_batch.py \
    --model "${MODEL_PATH}" \
    --family "${MODEL_FAMILY}" \
    --problems-dir "${PROBLEMS_DIR}" \
    --domain-file "${DOMAIN_FILE}" \
    --max-problems ${MAX_PROBLEMS} \
    --output "${OUTPUT_FILE}" \
    --batch-size ${BATCH_SIZE} \
    --num-workers ${NUM_WORKERS}

echo ""
echo "=========================================="
echo "${SCENARIO} evaluation completed!"
echo "Results saved to: ${OUTPUT_FILE} (with timestamp added)"
echo "=========================================="
