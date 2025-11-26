#!/bin/bash

# Evaluate LLM model on ferry scenario
# Usage: ./evaluate_llm_ferry.sh <model_path> [model_family] [max_problems]
# Example: ./evaluate_llm_ferry.sh /jfan5/sft_models/mistral_7b/four_scenarios500 mistral 50



conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
MODEL_PATH="/jfan5/sft_qwen3/bfgs-variant-500"
MODEL_FAMILY="auto"  # Default to auto detection
MAX_PROBLEMS="50"    # Default to 50

# Scenario configuration
SCENARIO="ferry"
PROBLEMS_DIR="pddl3/ferry/all_problems3/testing"
DOMAIN_FILE="pddl3/ferry/domain3.pddl"

# Extract model name from path
MODEL_NAME=$(basename "${MODEL_PATH}" | sed 's/[\/\\]/_/g')
# Generate output filename: model_name_scenario_test_results.json (timestamp will be added by Python script)
OUTPUT_FILE="planning_results/${MODEL_NAME}_${SCENARIO}_test_results.json"

echo "=========================================="
echo "Evaluating ${SCENARIO} scenario"
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
    --output "${OUTPUT_FILE}"

echo ""
echo "=========================================="
echo "Evaluation completed!"
echo "=========================================="
echo "Results saved to: ${OUTPUT_FILE} (with timestamp added)"
echo ""

