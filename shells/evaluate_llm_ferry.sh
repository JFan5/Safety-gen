#!/bin/bash

# Evaluate LLM model on ferry scenario
# Usage: ./evaluate_llm_ferry.sh <model_path> <problems_subdir> [one_shot]
# Example: ./evaluate_llm_ferry.sh /jfan5/sft_models/mistral_7b/four_scenarios500 testing_problem50 1

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
MODEL_PATH="${1}"
PROBLEMS_SUBDIR="${2:-testing_problem50}"
ONE_SHOT="${3:-0}"  # Default to 0 (disabled)

# Fixed parameters
MODEL_FAMILY="auto"
MAX_PROBLEMS=50

# Scenario configuration
SCENARIO="ferry"
PROBLEMS_DIR="pddl3/ferry/${PROBLEMS_SUBDIR}"
DOMAIN_FILE="pddl3/ferry/domain3.pddl"

# Sanitize model path for filename (replace / and other special chars with -)
MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')
# Generate output filename: model_name_scenario_test_results.json (timestamp will be added by Python script)
OUTPUT_FILE="planning_results/ferry_${MODEL_NAME}_50.json"

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

