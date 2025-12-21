#!/bin/bash

# Evaluate LLM model on 4 scenarios: blocksworld, ferry, spanner, grippers
# Usage: ./evaluate_llm_all.sh <model_path> <problems_subdir> [one_shot]
# Example: ./evaluate_llm_all.sh /jfan5/sft_models/mistral_7b/four_scenarios500 testing_problem50 1

set -e

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

# Sanitize model path for filename (replace / and other special chars with -)
MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')

RUN_TS="$(date +%Y%m%d_%H%M%S)"
OUTPUT_DIR="planning_results/${MODEL_NAME}_${RUN_TS}"
mkdir -p "${OUTPUT_DIR}"

echo "=========================================="
echo "Evaluating model on 4 scenarios"
echo "=========================================="
echo "Model: ${MODEL_PATH}"
echo "Family: ${MODEL_FAMILY}"
echo "Max problems per scenario: ${MAX_PROBLEMS}"
echo "Problems subdir: ${PROBLEMS_SUBDIR}"
echo "One-shot: ${ONE_SHOT}"
echo "Output dir: ${OUTPUT_DIR}"
echo "=========================================="
echo ""

# Define scenarios array
declare -a SCENARIOS=( "blocksworld" "ferry" "spanner" "grippers" )

# Loop through each scenario
for SCENARIO in "${SCENARIOS[@]}"; do
    echo ""
    echo "=========================================="
    echo "Evaluating ${SCENARIO} scenario"
    echo "=========================================="
    echo ""
    
    # Set scenario-specific paths
    case "${SCENARIO}" in
        blocksworld)
            PROBLEMS_DIR="pddl3/blocksworld/${PROBLEMS_SUBDIR}"
            DOMAIN_FILE="pddl3/blocksworld/domain3.pddl"
            OUTPUT_FILE="${OUTPUT_DIR}/blocksworld.json"
            ;;
        ferry)
            PROBLEMS_DIR="pddl3/ferry/${PROBLEMS_SUBDIR}"
            DOMAIN_FILE="pddl3/ferry/domain3.pddl"
            OUTPUT_FILE="${OUTPUT_DIR}/ferry.json"
            ;;
        spanner)
            PROBLEMS_DIR="pddl3/spanner/${PROBLEMS_SUBDIR}"
            DOMAIN_FILE="pddl3/spanner/domain3.pddl"
            OUTPUT_FILE="${OUTPUT_DIR}/spanner.json"
            ;;
        grippers)
            PROBLEMS_DIR="pddl3/grippers/${PROBLEMS_SUBDIR}"
            DOMAIN_FILE="pddl3/grippers/domain3.pddl"
            OUTPUT_FILE="${OUTPUT_DIR}/grippers.json"
            ;;
    esac
    
    echo "Problems dir: ${PROBLEMS_DIR}"
    echo "Domain file: ${DOMAIN_FILE}"
    echo "Output file: ${OUTPUT_FILE}"
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
                --one-shot \
                --no-timestamp
        else
            python3 script/evaluate_llm_solver.py \
                --model "${MODEL_PATH}" \
                --family "${MODEL_FAMILY}" \
                --problems-dir "${PROBLEMS_DIR}" \
                --domain-file "${DOMAIN_FILE}" \
                --max-problems ${MAX_PROBLEMS} \
                --output "${OUTPUT_FILE}" \
                --no-load-in-4bit \
                --no-timestamp
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
                --one-shot \
                --no-timestamp
        else
            python3 script/evaluate_llm_solver.py \
                --model "${MODEL_PATH}" \
                --family "${MODEL_FAMILY}" \
                --problems-dir "${PROBLEMS_DIR}" \
                --domain-file "${DOMAIN_FILE}" \
                --max-problems ${MAX_PROBLEMS} \
                --output "${OUTPUT_FILE}" \
                --no-timestamp
        fi
    fi
    
    echo ""
    echo "=========================================="
    echo "${SCENARIO} evaluation completed!"
    echo "Results saved to: ${OUTPUT_FILE}"
    echo "=========================================="
done

echo ""
echo "=========================================="
echo "All evaluations completed!"
echo "=========================================="
echo "Evaluated scenarios: ${SCENARIOS[*]}"
echo "Results saved in: ${OUTPUT_DIR}"
echo ""

