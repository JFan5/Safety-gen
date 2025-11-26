#!/bin/bash

# Evaluate LLM model on grippers scenario
# Usage: ./evaluate_llm_grippers.sh <model_path> [model_family] [max_problems]
# Example: ./evaluate_llm_grippers.sh /jfan5/sft_models/mistral_7b/four_scenarios500 mistral 50

set -e

conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
MODEL_PATH="${1}"
MODEL_FAMILY="${2:-auto}"  # Default to auto detection
MAX_PROBLEMS="${3:-50}"    # Default to 50

if [ -z "${MODEL_PATH}" ]; then
    echo "Error: Model path is required"
    echo "Usage: $0 <model_path> [model_family] [max_problems]"
    exit 1
fi

# Scenario configuration
SCENARIO="grippers"
PROBLEMS_DIR="pddl3/grippers/all_problems3/testing"
DOMAIN_FILE="pddl3/grippers/domain3.pddl"

# Extract model name from path
MODEL_NAME=$(basename "${MODEL_PATH}" | sed 's/[\/\\]/_/g')
# Generate output filename: model_name_scenario_test_results.json (timestamp will be added by Python script)
OUTPUT_FILE="${MODEL_NAME}_${SCENARIO}_test_results.json"

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

