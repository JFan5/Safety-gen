#!/bin/bash

# Evaluate LLM model on all 5 scenarios: delivery, blocksworld, ferry, spanner, grippers
# Usage: ./evaluate_llm_all.sh <model_path> [one_shot]
# Example: ./evaluate_llm_all.sh /jfan5/sft_models/mistral_7b/four_scenarios500 1

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
MODEL_PATH="${1}"
ONE_SHOT="${2:-0}"  # Default to 0 (disabled)

# Fixed parameters
MODEL_FAMILY="auto"
MAX_PROBLEMS=50

# Sanitize model path for filename (replace / and other special chars with -)
MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')

echo "=========================================="
echo "Evaluating model on all 5 scenarios"
echo "=========================================="
echo "Model: ${MODEL_PATH}"
echo "Family: ${MODEL_FAMILY}"
echo "Max problems per scenario: ${MAX_PROBLEMS}"
echo "One-shot: ${ONE_SHOT}"
echo "=========================================="
echo ""

# Define scenarios array
declare -a SCENARIOS=( "blocksworld" "ferry" "spanner" "grippers" "delivery")

# Loop through each scenario
for SCENARIO in "${SCENARIOS[@]}"; do
    echo ""
    echo "=========================================="
    echo "Evaluating ${SCENARIO} scenario"
    echo "=========================================="
    echo ""
    
    # Set scenario-specific paths
    case "${SCENARIO}" in
        delivery)
            PROBLEMS_DIR="pddl3/delivery/all_problems3/testing"
            DOMAIN_FILE="pddl3/delivery/domain3.pddl"
            OUTPUT_FILE="planning_results/delivery_${MODEL_NAME}_${MAX_PROBLEMS}.json"
            ;;
        blocksworld)
            PROBLEMS_DIR="pddl3/blocksworld/all_problems3/testing"
            DOMAIN_FILE="pddl3/blocksworld/domain3.pddl"
            OUTPUT_FILE="planning_results/blocksworld_${MODEL_NAME}_${MAX_PROBLEMS}.json"
            ;;
        ferry)
            PROBLEMS_DIR="pddl3/ferry/all_problems3/testing"
            DOMAIN_FILE="pddl3/ferry/domain3.pddl"
            OUTPUT_FILE="planning_results/ferry_${MODEL_NAME}_${MAX_PROBLEMS}.json"
            ;;
        spanner)
            PROBLEMS_DIR="pddl3/spanner/all_problems3/testing"
            DOMAIN_FILE="pddl3/spanner/domain3.pddl"
            OUTPUT_FILE="planning_results/spanner_${MODEL_NAME}_${MAX_PROBLEMS}.json"
            ;;
        grippers)
            PROBLEMS_DIR="pddl3/grippers/all_problems3/testing"
            DOMAIN_FILE="pddl3/grippers/domain3.pddl"
            OUTPUT_FILE="planning_results/grippers_${MODEL_NAME}_${MAX_PROBLEMS}.json"
            ;;
    esac
    
    echo "Problems dir: ${PROBLEMS_DIR}"
    echo "Domain file: ${DOMAIN_FILE}"
    echo "Output file: ${OUTPUT_FILE} (timestamp will be added)"
    echo ""
    
    # Run evaluation
    if [ "${SCENARIO}" = "spanner" ]; then
        if [ "${ONE_SHOT}" = "1" ]; then
            python3 script/evaluate_llm_solver.py \
                --model "${MODEL_PATH}" \
                --family "${MODEL_FAMILY}" \
                --problems-dir "${PROBLEMS_DIR}" \
                --domain-file "${DOMAIN_FILE}" \
                --max-problems ${MAX_PROBLEMS} \
                --output "${OUTPUT_FILE}" \
                --no-load-in-4bit \
                --one-shot
        else
            python3 script/evaluate_llm_solver.py \
                --model "${MODEL_PATH}" \
                --family "${MODEL_FAMILY}" \
                --problems-dir "${PROBLEMS_DIR}" \
                --domain-file "${DOMAIN_FILE}" \
                --max-problems ${MAX_PROBLEMS} \
                --output "${OUTPUT_FILE}" \
                --no-load-in-4bit
        fi
    else
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
    fi
    
    echo ""
    echo "=========================================="
    echo "${SCENARIO} evaluation completed!"
    echo "Results saved to: ${OUTPUT_FILE} (with timestamp added)"
    echo "=========================================="
done

echo ""
echo "=========================================="
echo "All evaluations completed!"
echo "=========================================="
echo "Evaluated scenarios: ${SCENARIOS[*]}"
echo "Results saved in: planning_results/"
echo ""

