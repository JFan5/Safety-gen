#!/bin/bash

# Evaluate LLM model on multiple scenarios using BATCH PROCESSING
# 充分利用 GPU 内存，通过批处理和多线程加速评估
# Usage: ./evaluate_llm_all_batch.sh <run_path_or_model> <problems_subdir> [batch_size] [num_workers] [prompt_template]
# Example (trained run):  ./evaluate_llm_all_batch.sh runs/grpo/<run_id> testing_problem50 8 8
# Example (base model):   ./evaluate_llm_all_batch.sh unsloth/Meta-Llama-3.1-8B-Instruct-bnb-4bit testing_problem50 8 8
# Example (custom prompt): ./evaluate_llm_all_batch.sh runs/grpo/<run_id> testing_problem50 8 8 prompt_cot.txt

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
RUN_PATH="${1}"
PROBLEMS_SUBDIR="${2:-testing_problem50}"  # e.g., testing_problem50 / testing_problems3 / etc.
BATCH_SIZE="${3:-8}"  # Default to 8 (adjust based on GPU memory)
NUM_WORKERS="${4:-8}"  # Default to 8 (adjust based on CPU cores)
PROMPT_TEMPLATE="${5:-}"  # Optional: path to prompt template file (default: prompt.txt)

# Fixed parameters
MAX_PROBLEMS=50

# Determine whether the first argument is a run directory or a direct model path
if [ -f "${RUN_PATH}/run.json" ]; then
    MODEL_FLAG="--run-path"
else
    MODEL_FLAG="--model"
fi

# Output will be written to runs structure automatically

echo "=========================================="
echo "Evaluating model on all 5 scenarios (BATCH MODE)"
echo "=========================================="
echo "Run path: ${RUN_PATH}"
echo "Max problems per scenario: ${MAX_PROBLEMS}"
echo "Problems subdir: ${PROBLEMS_SUBDIR}"
echo "Batch size: ${BATCH_SIZE}"
echo "Validation workers: ${NUM_WORKERS}"
if [ -n "${PROMPT_TEMPLATE}" ]; then
    echo "Prompt template: ${PROMPT_TEMPLATE}"
else
    echo "Prompt template: (default)"
fi
echo "=========================================="
echo ""

# Define scenarios array
declare -a SCENARIOS=( "blocksworld" "ferry" "spanner" "grippers" "delivery" )

# Generate shared eval_id (so all scenarios go into the same folder)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
EVAL_ID="solver_batch__temp0.6_max512_bs${BATCH_SIZE}_${TIMESTAMP}"
echo "Shared eval_id: ${EVAL_ID}"
echo ""

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
            # Output handled by runs structure
            ;;
        blocksworld)
            PROBLEMS_DIR="pddl3/blocksworld/${PROBLEMS_SUBDIR}"
            DOMAIN_FILE="pddl3/blocksworld/domain3.pddl"
            # Output handled by runs structure
            ;;
        ferry)
            PROBLEMS_DIR="pddl3/ferry/${PROBLEMS_SUBDIR}"
            DOMAIN_FILE="pddl3/ferry/domain3.pddl"
            # Output handled by runs structure
            ;;
        spanner)
            PROBLEMS_DIR="pddl3/spanner/${PROBLEMS_SUBDIR}"
            DOMAIN_FILE="pddl3/spanner/domain3.pddl"
            # Output handled by runs structure
            ;;
        grippers)
            PROBLEMS_DIR="pddl3/grippers/${PROBLEMS_SUBDIR}"
            DOMAIN_FILE="pddl3/grippers/domain3.pddl"
            # Output handled by runs structure
            ;;
        grid)
            PROBLEMS_DIR="pddl3/grid/${PROBLEMS_SUBDIR}"
            DOMAIN_FILE="pddl3/grid/domain3.pddl"
            # Output handled by runs structure
            ;;
    esac

    echo "Problems dir: ${PROBLEMS_DIR}"
    echo "Domain file: ${DOMAIN_FILE}"
    echo "Batch size: ${BATCH_SIZE}"
    echo "Validation workers: ${NUM_WORKERS}"
    echo ""

    # Build eval-id argument only when using a run directory
    EVAL_ID_ARGS=""
    if [ "${MODEL_FLAG}" = "--run-path" ]; then
        EVAL_ID_ARGS="--eval-id ${EVAL_ID}"
    fi

    # Build prompt-template argument if specified
    PROMPT_TEMPLATE_ARGS=""
    if [ -n "${PROMPT_TEMPLATE}" ]; then
        PROMPT_TEMPLATE_ARGS="--prompt-template ${PROMPT_TEMPLATE}"
    fi

    # Run evaluation with batch processing
    if [ "${SCENARIO}" = "spanner" ]; then
        python3 script/evaluate_llm_solver_batch.py \
            ${MODEL_FLAG} "${RUN_PATH}" \
            --problems-dir "${PROBLEMS_DIR}" \
            --domain-file "${DOMAIN_FILE}" \
            --max-problems ${MAX_PROBLEMS} \
            --batch-size ${BATCH_SIZE} \
            --num-workers ${NUM_WORKERS} \
            ${EVAL_ID_ARGS} \
            ${PROMPT_TEMPLATE_ARGS} \
            --no-load-in-4bit
    else
        python3 script/evaluate_llm_solver_batch.py \
            ${MODEL_FLAG} "${RUN_PATH}" \
            --problems-dir "${PROBLEMS_DIR}" \
            --domain-file "${DOMAIN_FILE}" \
            --max-problems ${MAX_PROBLEMS} \
            --batch-size ${BATCH_SIZE} \
            --num-workers ${NUM_WORKERS} \
            ${EVAL_ID_ARGS} \
            ${PROMPT_TEMPLATE_ARGS}
    fi

    echo ""
    echo "=========================================="
    echo "${SCENARIO} evaluation completed!"
    echo "Results saved to runs structure"
    echo "=========================================="
done

echo ""
echo "=========================================="
echo "All evaluations completed!"
echo "=========================================="
echo "Evaluated scenarios: ${SCENARIOS[*]}"
echo "Results saved to runs structure"
echo "Performance settings:"
echo "  Batch size: ${BATCH_SIZE}"
echo "  Validation workers: ${NUM_WORKERS}"
echo ""
