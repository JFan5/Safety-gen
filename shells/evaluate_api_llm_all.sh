#!/bin/bash

# Evaluate API-based LLM models (e.g., ChatGPT) on multiple scenarios
# Usage: ./evaluate_api_llm_all.sh <model_name> [api_key]
# Example: ./evaluate_api_llm_all.sh gpt-4
# Example: ./evaluate_api_llm_all.sh chatgpt "sk-xxx"

# Set working directory
cd /home/jfan5/Safety-gen

# Parse arguments
MODEL_NAME="${1:-gpt-5}"           # Default to gpt-5
API_KEY="${2:-}"                   # Optional API key (if not provided, will use OPENAI_API_KEY env var)

# Fixed parameters
PROVIDER="openai"

# Sanitize model name for filename (replace / and other special chars with -)
MODEL_NAME_CLEAN=$(echo "${MODEL_NAME}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')

echo "=========================================="
echo "Evaluating API model on all 5 scenarios"
echo "=========================================="
echo "Model: ${MODEL_NAME}"
echo "Provider: ${PROVIDER}"
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
            PROBLEMS_DIR="pddl3/delivery/testing_problem50"
            DOMAIN_FILE="pddl3/delivery/domain3.pddl"
            OUTPUT_FILE="planning_results/delivery_${MODEL_NAME_CLEAN}_0.json"
            ;;
        blocksworld)
            PROBLEMS_DIR="pddl3/blocksworld/testing_problem50"
            DOMAIN_FILE="pddl3/blocksworld/domain3.pddl"
            OUTPUT_FILE="planning_results/blocksworld_${MODEL_NAME_CLEAN}_0.json"
            ;;
        ferry)
            PROBLEMS_DIR="pddl3/ferry/testing_problem50"
            DOMAIN_FILE="pddl3/ferry/domain3.pddl"
            OUTPUT_FILE="planning_results/ferry_${MODEL_NAME_CLEAN}_0.json"
            ;;
        spanner)
            PROBLEMS_DIR="pddl3/spanner/testing_problem50"
            DOMAIN_FILE="pddl3/spanner/domain3.pddl"
            OUTPUT_FILE="planning_results/spanner_${MODEL_NAME_CLEAN}_0.json"
            ;;
        grippers)
            PROBLEMS_DIR="pddl3/grippers/testing_problem50"
            DOMAIN_FILE="pddl3/grippers/domain3.pddl"
            OUTPUT_FILE="planning_results/grippers_${MODEL_NAME_CLEAN}_0.json"
            ;;
    esac
    
    echo "Problems dir: ${PROBLEMS_DIR}"
    echo "Domain file: ${DOMAIN_FILE}"
    echo "Output file: ${OUTPUT_FILE} (timestamp will be added)"
    echo ""
    
    # Check if paths exist
    if [ ! -d "${PROBLEMS_DIR}" ]; then
        echo "Warning: Problems directory not found: ${PROBLEMS_DIR}"
        echo "Skipping ${SCENARIO} scenario..."
        continue
    fi
    
    if [ ! -f "${DOMAIN_FILE}" ]; then
        echo "Warning: Domain file not found: ${DOMAIN_FILE}"
        echo "Skipping ${SCENARIO} scenario..."
        continue
    fi
    
    # Build command arguments
    CMD_ARGS=(
        "--provider" "${PROVIDER}"
        "--problems-dir" "${PROBLEMS_DIR}"
        "--domain-file" "${DOMAIN_FILE}"
        "--output" "${OUTPUT_FILE}"
    )
    
    # Add API key if provided
    if [ -n "${API_KEY}" ]; then
        CMD_ARGS+=("--api-key" "${API_KEY}")
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