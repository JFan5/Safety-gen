#!/bin/zsh

# Evaluate LLM model on delivery scenario
# Usage: ./evaluate_llm_delivery.sh <run_path> <problems_subdir> [one_shot]
# Example: ./evaluate_llm_delivery.sh runs/grpo/<run_id> testing_problem50 1

# Initialize conda for zsh shell
eval "$(conda shell.zsh hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
RUN_PATH="${1}"
PROBLEMS_SUBDIR="${2:-testing_problem50}"
ONE_SHOT="${3:-0}"  # Default to 0 (disabled)

# Fixed parameters
MAX_PROBLEMS=50

PROBLEMS_DIR="pddl3/delivery/${PROBLEMS_SUBDIR}"
DOMAIN_FILE="pddl3/delivery/domain3.pddl"
# Output handled by runs structure

# Run evaluation
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
        --max-problems ${MAX_PROBLEMS} \
        --temperature 0.6
fi

echo ""
echo "=========================================="
echo "Evaluation completed!"
echo "=========================================="
echo "Results saved to runs structure"
echo ""

