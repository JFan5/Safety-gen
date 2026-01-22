#!/bin/bash

# Evaluate LLM model on blocksworld scenario using BATCH PROCESSING
# Usage: ./evaluate_llm_blocksworld_batch.sh <run_path> <problems_subdir> [batch_size] [num_workers]
# Example: ./evaluate_llm_blocksworld_batch.sh runs/grpo/<run_id> testing_problem50 8 8

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
RUN_PATH="${1}"
PROBLEMS_SUBDIR="${2:-testing_problem50}"
BATCH_SIZE="${3:-8}"
NUM_WORKERS="${4:-8}"

# Fixed parameters
MAX_PROBLEMS=100

# Scenario-specific paths
SCENARIO="blocksworld"
PROBLEMS_DIR="pddl3/blocksworld/${PROBLEMS_SUBDIR}"
DOMAIN_FILE="pddl3/blocksworld/domain3.pddl"
# Output handled by runs structure

echo "=========================================="
echo "Evaluating model on ${SCENARIO} (BATCH MODE)"
echo "=========================================="
echo "Run path: ${RUN_PATH}"
echo "Max problems: ${MAX_PROBLEMS}"
echo "Problems subdir: ${PROBLEMS_SUBDIR}"
echo "Batch size: ${BATCH_SIZE}"
echo "Validation workers: ${NUM_WORKERS}"
echo "Problems dir: ${PROBLEMS_DIR}"
echo "Domain file: ${DOMAIN_FILE}"
echo "=========================================="
echo ""

# Run evaluation with batch processing
python3 script/evaluate_llm_solver_batch.py \
    --run-path "${RUN_PATH}" \
    --problems-dir "${PROBLEMS_DIR}" \
    --domain-file "${DOMAIN_FILE}" \
    --max-problems ${MAX_PROBLEMS} \
    --batch-size ${BATCH_SIZE} \
    --num-workers ${NUM_WORKERS}

echo ""
echo "=========================================="
echo "${SCENARIO} evaluation completed!"
echo "Results saved to runs structure"
echo "=========================================="
