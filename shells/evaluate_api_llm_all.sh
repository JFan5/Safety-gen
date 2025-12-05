#!/bin/bash

# Evaluate API-based LLM models (e.g., ChatGPT) on multiple scenarios
# Usage: ./evaluate_api_llm_all.sh <model_name> [one_shot] [api_key]
# Example: ./evaluate_api_llm_all.sh gpt-4 1
# Example: ./evaluate_api_llm_all.sh chatgpt 0 "sk-xxx"

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/jfan5/Safety-gen

# Parse arguments
MODEL_NAME="${1}"
ONE_SHOT="${2:-0}"  # Default to 0 (disabled)
API_KEY="${3:-}"    # Optional API key (if not provided, will use OPENAI_API_KEY env var)

# Fixed parameters
PROVIDER="openai"
FAMILY="auto"
MAX_PROBLEMS=50

# Sanitize model name for filename (replace / and other special chars with -)
MODEL_NAME_CLEAN=$(echo "${MODEL_NAME}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')

echo "=========================================="
echo "Evaluating API model on all 5 scenarios"
echo "=========================================="
echo "Model: ${MODEL_NAME}"
echo "Provider: ${PROVIDER}"
echo "Family: ${FAMILY}"
echo "Max problems per scenario: ${MAX_PROBLEMS}"
echo "One-shot: ${ONE_SHOT}"
if [ -n "${API_KEY}" ]; then
    echo "API Key: [PROVIDED]"
else
    echo "API Key: [Will use OPENAI_API_KEY environment variable]"
fi
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
            OUTPUT_FILE="planning_results/delivery_${MODEL_NAME_CLEAN}_${MAX_PROBLEMS}.json"
            ;;
        blocksworld)
            PROBLEMS_DIR="pddl3/blocksworld/all_problems3/testing"
            DOMAIN_FILE="pddl3/blocksworld/domain3.pddl"
            OUTPUT_FILE="planning_results/blocksworld_${MODEL_NAME_CLEAN}_${MAX_PROBLEMS}.json"
            ;;
        ferry)
            PROBLEMS_DIR="pddl3/ferry/all_problems3/testing"
            DOMAIN_FILE="pddl3/ferry/domain3.pddl"
            OUTPUT_FILE="planning_results/ferry_${MODEL_NAME_CLEAN}_${MAX_PROBLEMS}.json"
            ;;
        spanner)
            PROBLEMS_DIR="pddl3/spanner/all_problems3/testing"
            DOMAIN_FILE="pddl3/spanner/domain3.pddl"
            OUTPUT_FILE="planning_results/spanner_${MODEL_NAME_CLEAN}_${MAX_PROBLEMS}.json"
            ;;
        grippers)
            PROBLEMS_DIR="pddl3/grippers/all_problems3/testing"
            DOMAIN_FILE="pddl3/grippers/domain3.pddl"
            OUTPUT_FILE="planning_results/grippers_${MODEL_NAME_CLEAN}_${MAX_PROBLEMS}.json"
            ;;
    esac
    
    echo "Problems dir: ${PROBLEMS_DIR}"
    echo "Domain file: ${DOMAIN_FILE}"
    echo "Output file: ${OUTPUT_FILE} (timestamp will be added)"
    echo ""
    
    # Build command arguments
    CMD_ARGS=(
        "--model" "${MODEL_NAME}"
        "--provider" "${PROVIDER}"
        "--family" "${FAMILY}"
        "--problems-dir" "${PROBLEMS_DIR}"
        "--domain-file" "${DOMAIN_FILE}"
        "--max-problems" "${MAX_PROBLEMS}"
        "--output" "${OUTPUT_FILE}"
    )
    
    # Add API key if provided
    if [ -n "${API_KEY}" ]; then
        CMD_ARGS+=("--api-key" "${API_KEY}")
    fi
    
    # Add one-shot flag if enabled
    if [ "${ONE_SHOT}" = "1" ]; then
        CMD_ARGS+=("--one-shot")
    fi
    
    # Run evaluation
    python3 script/evaluate_api_llm_solver.py "${CMD_ARGS[@]}"
    
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

