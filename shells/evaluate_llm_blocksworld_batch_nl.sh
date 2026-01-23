#!/bin/bash
# Evaluate LLM on blocksworld NL problems using batch processing
# Usage: ./evaluate_llm_blocksworld_batch_nl.sh <run_path> [problems_subdir] [batch_size] [num_workers]
# Example: ./evaluate_llm_blocksworld_batch_nl.sh runs/grpo/<run_id> testing_problem50 8 8

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
MAX_PROBLEMS=50
DOMAIN="blocksworld"

echo "=========================================="
echo "Evaluating model on ${DOMAIN} (NL MODE)"
echo "=========================================="
echo "Run path: ${RUN_PATH}"
echo "Max problems: ${MAX_PROBLEMS}"
echo "Problems subdir: ${PROBLEMS_SUBDIR}"
echo "Batch size: ${BATCH_SIZE}"
echo "Validation workers: ${NUM_WORKERS}"
echo "=========================================="
echo ""

# Generate eval_id with domain name
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
EVAL_ID="solver_batch_nl_${DOMAIN}_temp0.6_max512_bs${BATCH_SIZE}_${TIMESTAMP}"
echo "Eval ID: ${EVAL_ID}"
echo ""

# Set domain-specific paths - use NL problems directory
NL_PROBLEMS_DIR="pddl3/${DOMAIN}/${PROBLEMS_SUBDIR}/testing_problems_nl"
DOMAIN_FILE="pddl3/${DOMAIN}/domain3.pddl"

echo "NL Problems dir: ${NL_PROBLEMS_DIR}"
echo "Domain file: ${DOMAIN_FILE}"
echo ""

if [ ! -d "${NL_PROBLEMS_DIR}" ]; then
    echo "Error: ${NL_PROBLEMS_DIR} not found"
    exit 1
fi

# Run evaluation with batch processing and NL mode
python3 script/evaluate_llm_solver_batch.py \
    --run-path "${RUN_PATH}" \
    --problems-dir "${NL_PROBLEMS_DIR}" \
    --domain-file "${DOMAIN_FILE}" \
    --max-problems ${MAX_PROBLEMS} \
    --batch-size ${BATCH_SIZE} \
    --num-workers ${NUM_WORKERS} \
    --eval-id "${EVAL_ID}" \
    --nl-mode

echo ""
echo "=========================================="
echo "${DOMAIN} NL evaluation completed!"
echo "Results saved to runs structure"
echo "=========================================="
