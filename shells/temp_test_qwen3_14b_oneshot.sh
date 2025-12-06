#!/bin/bash

# Temporary script to test Qwen3-14b one-shot pretrained model
# Tests all scenarios with one-shot mode



# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Model configuration
MODEL_PATH="unsloth/Qwen3-14B-unsloth-bnb-4bit"
MODEL_FAMILY="qwen"
MAX_PROBLEMS=50

# Sanitize model path for filename
MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')

# Scenarios to test
SCENARIOS=("blocksworld" "delivery" "ferry" "grippers" "spanner")

echo "=========================================="
echo "Testing Qwen3-14b One-Shot Pretrained Model"
echo "=========================================="
echo "Model: ${MODEL_PATH}"
echo "Family: ${MODEL_FAMILY}"
echo "Max problems per scenario: ${MAX_PROBLEMS}"
echo "Mode: One-shot"
echo "=========================================="
echo ""

for SCENARIO in "${SCENARIOS[@]}"; do
    echo ""
    echo "=========================================="
    echo "Testing scenario: ${SCENARIO}"
    echo "=========================================="
    
    # Set scenario-specific paths
    if [ "$SCENARIO" = "blocksworld" ]; then
        PROBLEMS_DIR="pddl3/blocksworld/testing_problem50"
        DOMAIN_FILE="pddl3/blocksworld/domain3.pddl"
    elif [ "$SCENARIO" = "delivery" ]; then
        PROBLEMS_DIR="pddl3/delivery/testing_problem50"
        DOMAIN_FILE="pddl3/delivery/domain3.pddl"
    elif [ "$SCENARIO" = "ferry" ]; then
        PROBLEMS_DIR="pddl3/ferry/testing_problem50"
        DOMAIN_FILE="pddl3/ferry/domain3.pddl"
    elif [ "$SCENARIO" = "grippers" ]; then
        PROBLEMS_DIR="pddl3/grippers/testing_problem50"
        DOMAIN_FILE="pddl3/grippers/domain3.pddl"
    elif [ "$SCENARIO" = "spanner" ]; then
        PROBLEMS_DIR="pddl3/spanner/testing_problem50"
        DOMAIN_FILE="pddl3/spanner/domain3.pddl"
    fi
    
    OUTPUT_FILE="planning_results/baseline_qwen_14b/${SCENARIO}_oneshot.json"
    
    echo "Problems dir: ${PROBLEMS_DIR}"
    echo "Domain file: ${DOMAIN_FILE}"
    echo "Output file: ${OUTPUT_FILE}"
    echo ""
    
    python3 script/evaluate_llm_solver.py \
        --model "${MODEL_PATH}" \
        --family "${MODEL_FAMILY}" \
        --problems-dir "${PROBLEMS_DIR}" \
        --domain-file "${DOMAIN_FILE}" \
        --max-problems ${MAX_PROBLEMS} \
        --output "${OUTPUT_FILE}" \
        --one-shot
    
    echo ""
    echo "Completed: ${SCENARIO}"
    echo ""
done

echo "=========================================="
echo "All scenarios completed!"
echo "=========================================="
echo "Results saved to: planning_results/baseline_qwen_14b/"
echo ""

