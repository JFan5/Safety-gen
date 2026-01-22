#!/bin/bash

# Evaluate LLM model on blocksworld scenario
# Usage: ./evaluate_llm_blocksworld.sh <run_path> <problems_subdir> [one_shot]
# Example: ./evaluate_llm_blocksworld.sh runs/grpo/<run_id> testing_problem50 1

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
RUN_PATH="${1}"
PROBLEMS_SUBDIR="${2:-testing_problem50}"
ONE_SHOT="${3:-0}"  # Default to 0 (disabled)

# Fixed parameters
MAX_PROBLEMS=50

SCENARIO="blocksworld"
PROBLEMS_DIR="pddl3/blocksworld/${PROBLEMS_SUBDIR}"
DOMAIN_FILE="pddl3/blocksworld/domain3.pddl"
# Output handled by runs structure

echo "=========================================="
echo "Evaluating ${SCENARIO} scenario"
echo "=========================================="
echo "Run path: ${RUN_PATH}"
echo "Max problems: ${MAX_PROBLEMS}"
echo "Problems subdir: ${PROBLEMS_SUBDIR}"
echo "One-shot: ${ONE_SHOT}"
echo "=========================================="
echo ""

if [ "${ONE_SHOT}" = "1" ]; then
    python3 script/evaluate_llm_solver.py \
            --run-path "${RUN_PATH}" \
            --problems-dir "${PROBLEMS_DIR}" \
            --domain-file "${DOMAIN_FILE}" \
            --max-problems ${MAX_PROBLEMS} \
            --one-shot
else
    python3 script/evaluate_llm_solver.py \
            --run-path "${RUN_PATH}" \
            --problems-dir "${PROBLEMS_DIR}" \
            --domain-file "${DOMAIN_FILE}" \
            --max-problems ${MAX_PROBLEMS}
fi

echo ""
echo "=========================================="
echo "Evaluation completed!"
echo "=========================================="
echo "Results saved to runs structure"
echo ""

