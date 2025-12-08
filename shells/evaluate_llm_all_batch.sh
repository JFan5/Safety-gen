#!/bin/bash

# Evaluate LLM model on all 5 scenarios using BATCH PROCESSING
# 充分利用 GPU 内存，通过批处理和多线程加速评估
# Usage: ./evaluate_llm_all_batch.sh <model_path> [batch_size] [num_workers]
# Example: ./evaluate_llm_all_batch.sh /jfan5/sft_models/mistral_7b/four_scenarios500 8 8

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
MODEL_PATH="${1}"
BATCH_SIZE="${2:-8}"  # Default to 8 (adjust based on GPU memory)
NUM_WORKERS="${3:-8}"  # Default to 8 (adjust based on CPU cores)

# Fixed parameters
MODEL_FAMILY="auto"
MAX_PROBLEMS=50

# Sanitize model path for filename
MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')

echo "=========================================="
echo "Evaluating model on all 5 scenarios (BATCH MODE)"
echo "=========================================="
echo "Model: ${MODEL_PATH}"
echo "Family: ${MODEL_FAMILY}"
echo "Max problems per scenario: ${MAX_PROBLEMS}"
echo "Batch size: ${BATCH_SIZE}"
echo "Validation workers: ${NUM_WORKERS}"
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
            OUTPUT_FILE="planning_results/delivery_${MODEL_NAME}_${MAX_PROBLEMS}.json"
            ;;
        blocksworld)
            PROBLEMS_DIR="pddl3/blocksworld/testing_problem50"
            DOMAIN_FILE="pddl3/blocksworld/domain3.pddl"
            OUTPUT_FILE="planning_results/blocksworld_${MODEL_NAME}_${MAX_PROBLEMS}.json"
            ;;
        ferry)
            PROBLEMS_DIR="pddl3/ferry/testing_problem50"
            DOMAIN_FILE="pddl3/ferry/domain3.pddl"
            OUTPUT_FILE="planning_results/ferry_${MODEL_NAME}_${MAX_PROBLEMS}.json"
            ;;
        spanner)
            PROBLEMS_DIR="pddl3/spanner/testing_problem50"
            DOMAIN_FILE="pddl3/spanner/domain3.pddl"
            OUTPUT_FILE="planning_results/spanner_${MODEL_NAME}_${MAX_PROBLEMS}.json"
            ;;
        grippers)
            PROBLEMS_DIR="pddl3/grippers/testing_problem50"
            DOMAIN_FILE="pddl3/grippers/domain3.pddl"
            OUTPUT_FILE="planning_results/grippers_${MODEL_NAME}_${MAX_PROBLEMS}.json"
            ;;
        grid)
            PROBLEMS_DIR="pddl3/grid/testing_problem50"
            DOMAIN_FILE="pddl3/grid/domain3.pddl"
            OUTPUT_FILE="planning_results/grid_${MODEL_NAME}_${MAX_PROBLEMS}.json"
            ;;
    esac

    echo "Problems dir: ${PROBLEMS_DIR}"
    echo "Domain file: ${DOMAIN_FILE}"
    echo "Output file: ${OUTPUT_FILE} (timestamp will be added)"
    echo "Batch size: ${BATCH_SIZE}"
    echo "Validation workers: ${NUM_WORKERS}"
    echo ""

    # Run evaluation with batch processing
    if [ "${SCENARIO}" = "spanner" ]; then
        python3 script/evaluate_llm_solver_batch.py \
            --model "${MODEL_PATH}" \
            --family "${MODEL_FAMILY}" \
            --problems-dir "${PROBLEMS_DIR}" \
            --domain-file "${DOMAIN_FILE}" \
            --max-problems ${MAX_PROBLEMS} \
            --output "${OUTPUT_FILE}" \
            --batch-size ${BATCH_SIZE} \
            --num-workers ${NUM_WORKERS} \
            --no-load-in-4bit
    else
        python3 script/evaluate_llm_solver_batch.py \
            --model "${MODEL_PATH}" \
            --family "${MODEL_FAMILY}" \
            --problems-dir "${PROBLEMS_DIR}" \
            --domain-file "${DOMAIN_FILE}" \
            --max-problems ${MAX_PROBLEMS} \
            --output "${OUTPUT_FILE}" \
            --batch-size ${BATCH_SIZE} \
            --num-workers ${NUM_WORKERS}
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
echo "Performance settings:"
echo "  Batch size: ${BATCH_SIZE}"
echo "  Validation workers: ${NUM_WORKERS}"
echo ""
