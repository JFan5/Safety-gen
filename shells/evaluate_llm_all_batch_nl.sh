#!/bin/bash
# Evaluate LLM on NL problems using batch processing
# Usage: ./evaluate_llm_all_batch_nl.sh <run_path> [problems_subdir] [batch_size] [num_workers]
# Example: ./evaluate_llm_all_batch_nl.sh runs/grpo/<run_id> testing_problem50 8 8

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
RUN_PATH="${1}"
PROBLEMS_SUBDIR="${2:-testing_problem50}"
BATCH_SIZE="${3:-8}"
NUM_WORKERS="${4:-8}"

# Fixed parameters
MAX_PROBLEMS=50

echo "=========================================="
echo "Evaluating model on all 5 scenarios (NL MODE)"
echo "=========================================="
echo "Run path: ${RUN_PATH}"
echo "Max problems per scenario: ${MAX_PROBLEMS}"
echo "Problems subdir: ${PROBLEMS_SUBDIR}"
echo "Batch size: ${BATCH_SIZE}"
echo "Validation workers: ${NUM_WORKERS}"
echo "=========================================="
echo ""

# Define scenarios array
declare -a SCENARIOS=( "blocksworld" "ferry" "spanner" "grippers" "delivery" )

# Generate shared eval_id (so all scenarios go into the same folder)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
EVAL_ID="solver_batch_nl__temp0.6_max512_bs${BATCH_SIZE}_${TIMESTAMP}"
echo "Shared eval_id: ${EVAL_ID}"
echo ""

# Loop through each scenario
for SCENARIO in "${SCENARIOS[@]}"; do
    echo ""
    echo "=========================================="
    echo "Evaluating ${SCENARIO} scenario (NL mode)"
    echo "=========================================="
    echo ""

    # Set scenario-specific paths - use NL problems directory
    NL_PROBLEMS_DIR="pddl3/${SCENARIO}/${PROBLEMS_SUBDIR}/testing_problems_nl"
    DOMAIN_FILE="pddl3/${SCENARIO}/domain3.pddl"

    echo "NL Problems dir: ${NL_PROBLEMS_DIR}"
    echo "Domain file: ${DOMAIN_FILE}"
    echo "Batch size: ${BATCH_SIZE}"
    echo "Validation workers: ${NUM_WORKERS}"
    echo ""

    if [ ! -d "${NL_PROBLEMS_DIR}" ]; then
        echo "Warning: ${NL_PROBLEMS_DIR} not found, skipping..."
        continue
    fi

    # Run evaluation with batch processing and NL mode
    if [ "${SCENARIO}" = "spanner" ]; then
        python3 script/evaluate_llm_solver_batch.py \
            --run-path "${RUN_PATH}" \
            --problems-dir "${NL_PROBLEMS_DIR}" \
            --domain-file "${DOMAIN_FILE}" \
            --max-problems ${MAX_PROBLEMS} \
            --batch-size ${BATCH_SIZE} \
            --num-workers ${NUM_WORKERS} \
            --eval-id "${EVAL_ID}" \
            --nl-mode \
            --no-load-in-4bit
    else
        python3 script/evaluate_llm_solver_batch.py \
            --run-path "${RUN_PATH}" \
            --problems-dir "${NL_PROBLEMS_DIR}" \
            --domain-file "${DOMAIN_FILE}" \
            --max-problems ${MAX_PROBLEMS} \
            --batch-size ${BATCH_SIZE} \
            --num-workers ${NUM_WORKERS} \
            --eval-id "${EVAL_ID}" \
            --nl-mode
    fi

    echo ""
    echo "=========================================="
    echo "${SCENARIO} NL evaluation completed!"
    echo "Results saved to runs structure"
    echo "=========================================="
done

echo ""
echo "=========================================="
echo "All NL evaluations completed!"
echo "=========================================="
echo "Evaluated scenarios: ${SCENARIOS[*]}"
echo "Results saved to runs structure"
echo "Performance settings:"
echo "  Batch size: ${BATCH_SIZE}"
echo "  Validation workers: ${NUM_WORKERS}"
echo ""
