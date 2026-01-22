#!/bin/bash

# Evaluate LLM model on 4 scenarios: blocksworld, ferry, spanner, grippers
# Usage: ./evaluate_llm_all.sh <run_path> <problems_subdir> [one_shot]
# Example: ./evaluate_llm_all.sh runs/grpo/<run_id> testing_problem50 1

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
RUN_PATH="${1}"
PROBLEMS_SUBDIR="${2:-testing_problem50}"
ONE_SHOT="${3:-0}"  # Default to 0 (disabled)

# Fixed parameters
MAX_PROBLEMS=50

# Sanitize model path for filename (replace / and other special chars with -)

# Output will be written to runs structure automatically

echo "=========================================="
echo "Evaluating model on 4 scenarios"
echo "=========================================="
echo "Run path: ${RUN_PATH}"
echo "Max problems per scenario: ${MAX_PROBLEMS}"
echo "Problems subdir: ${PROBLEMS_SUBDIR}"
echo "One-shot: ${ONE_SHOT}"
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
    esac
    
    echo "Problems dir: ${PROBLEMS_DIR}"
    echo "Domain file: ${DOMAIN_FILE}"
        echo ""
    
    # Run evaluation
    if [ "${SCENARIO}" = "spanner" ]; then
        if [ "${ONE_SHOT}" = "1" ]; then
            python3 script/evaluate_llm_solver.py \
                --run-path "${RUN_PATH}" \
                --problems-dir "${PROBLEMS_DIR}" \
                --domain-file "${DOMAIN_FILE}" \
                --max-problems ${MAX_PROBLEMS} \
                --no-load-in-4bit \
                --one-shot
        else
            python3 script/evaluate_llm_solver.py \
                --run-path "${RUN_PATH}" \
                --problems-dir "${PROBLEMS_DIR}" \
                --domain-file "${DOMAIN_FILE}" \
                --max-problems ${MAX_PROBLEMS} \
                --no-load-in-4bit
        fi
    else
        if [ "${ONE_SHOT}" = "1" ]; then
            python3 script/evaluate_llm_solver.py \
                --run-path "${RUN_PATH}" \
                --problems-dir "${PROBLEMS_DIR}" \
                --domain-file "${DOMAIN_FILE}" \
                --max-problems ${MAX_PROBLEMS} \
                --one-shot
        else
            python3 script/evaluate_llm_solver.py \
                --run-path "${RUN_PATH}" \
                --problems-dir "${PROBLEMS_DIR}" \
                --domain-file "${DOMAIN_FILE}" \
                --max-problems ${MAX_PROBLEMS}
        fi
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
echo ""

