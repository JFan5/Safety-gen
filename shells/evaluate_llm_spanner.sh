#!/bin/bash

# Evaluate LLM model on spanner scenario
# Usage: ./evaluate_llm_spanner.sh <run_path> <problems_subdir> [one_shot]
# Example: ./evaluate_llm_spanner.sh runs/grpo/<run_id> testing_problem50 1
# Note: spanner scenario requires --no-load-in-4bit flag

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
PROBLEMS_DIR="pddl3/spanner/${PROBLEMS_SUBDIR}"
DOMAIN_FILE="pddl3/spanner/domain3.pddl"

# Sanitize model path for filename (replace / and other special chars with -)
# Output handled by runs structure

# Run evaluation
if [ "${ONE_SHOT}" = "1" ]; then
    python3 script/evaluate_llm_solver.py \
        --run-path "${RUN_PATH}" \
        --problems-dir "${PROBLEMS_DIR}" \
        --domain-file "${DOMAIN_FILE}" \
        --max-problems ${MAX_PROBLEMS} \
        --no-load-in-4bit \
        --one-shot
else
    python3 script/evaluate_llm_solver.py \
        --run-path "${RUN_PATH}" \
        --problems-dir "${PROBLEMS_DIR}" \
        --domain-file "${DOMAIN_FILE}" \
        --max-problems ${MAX_PROBLEMS} \
        --no-load-in-4bit
fi

echo ""
echo "=========================================="
echo "Evaluation completed!"
echo "=========================================="
echo "Results saved to runs structure"
echo ""

