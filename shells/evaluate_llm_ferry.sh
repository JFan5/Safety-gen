#!/bin/bash

# Evaluate LLM model on ferry scenario
# Usage: ./evaluate_llm_ferry.sh <run_path> <problems_subdir> [one_shot]
# Example: ./evaluate_llm_ferry.sh runs/grpo/<run_id> testing_problem50 1

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

# Scenario configuration
SCENARIO="ferry"
PROBLEMS_DIR="pddl3/ferry/${PROBLEMS_SUBDIR}"
DOMAIN_FILE="pddl3/ferry/domain3.pddl"

# Sanitize model path for filename (replace / and other special chars with -)
# Generate output filename: model_name_scenario_test_results.json (timestamp will be added by Python script)
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
        --max-problems ${MAX_PROBLEMS}
fi

echo ""
echo "=========================================="
echo "Evaluation completed!"
echo "=========================================="
echo "Results saved to runs structure"
echo ""

