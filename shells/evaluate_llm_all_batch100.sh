#!/bin/bash

# Evaluate LLM model on multiple scenarios using BATCH PROCESSING
# 充分利用 GPU 内存，通过批处理和多线程加速评估
# Usage: ./evaluate_llm_all_batch.sh <model_path> <problems_subdir> [batch_size] [num_workers]
# Example: ./evaluate_llm_all_batch.sh /jfan5/sft_models/mistral_7b/four_scenarios500 testing_problem50 8 8

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
MODEL_PATH="${1}"
PROBLEMS_SUBDIR="${2:-testing_problem50}"  # e.g., testing_problem50 / testing_problems3 / etc.
BATCH_SIZE="${3:-8}"  # Default to 8 (adjust based on GPU memory)
NUM_WORKERS="${4:-8}"  # Default to 8 (adjust based on CPU cores)

# Fixed parameters
MODEL_FAMILY="auto"
MAX_PROBLEMS=100

# Sanitize model path for filename
MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')

RUN_TS="$(date +%Y%m%d_%H%M%S)"
OUTPUT_DIR="planning_results/${MODEL_NAME}_${RUN_TS}"
mkdir -p "${OUTPUT_DIR}"

echo "=========================================="
echo "Evaluating model on all 5 scenarios (BATCH MODE)"
echo "=========================================="
echo "Model: ${MODEL_PATH}"
echo "Family: ${MODEL_FAMILY}"
echo "Max problems per scenario: ${MAX_PROBLEMS}"
echo "Problems subdir: ${PROBLEMS_SUBDIR}"
echo "Batch size: ${BATCH_SIZE}"
echo "Validation workers: ${NUM_WORKERS}"
echo "Output dir: ${OUTPUT_DIR}"
echo "=========================================="
echo ""

# Define scenarios array
declare -a SCENARIOS=( "blocksworld" "ferry" "spanner" "grippers" "delivery" )

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
            PROBLEMS_DIR="pddl3/delivery/${PROBLEMS_SUBDIR}"
            DOMAIN_FILE="pddl3/delivery/domain3.pddl"
            OUTPUT_FILE="${OUTPUT_DIR}/delivery.json"
            ;;
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
        grid)
            PROBLEMS_DIR="pddl3/grid/${PROBLEMS_SUBDIR}"
            DOMAIN_FILE="pddl3/grid/domain3.pddl"
            OUTPUT_FILE="${OUTPUT_DIR}/grid.json"
            ;;
    esac

    echo "Problems dir: ${PROBLEMS_DIR}"
    echo "Domain file: ${DOMAIN_FILE}"
    echo "Output file: ${OUTPUT_FILE}"
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
            --no-load-in-4bit \
            --no-timestamp
    else
        python3 script/evaluate_llm_solver_batch.py \
            --model "${MODEL_PATH}" \
            --family "${MODEL_FAMILY}" \
            --problems-dir "${PROBLEMS_DIR}" \
            --domain-file "${DOMAIN_FILE}" \
            --max-problems ${MAX_PROBLEMS} \
            --output "${OUTPUT_FILE}" \
            --batch-size ${BATCH_SIZE} \
            --num-workers ${NUM_WORKERS} \
            --no-timestamp
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
echo "Performance settings:"
echo "  Batch size: ${BATCH_SIZE}"
echo "  Validation workers: ${NUM_WORKERS}"
echo ""
