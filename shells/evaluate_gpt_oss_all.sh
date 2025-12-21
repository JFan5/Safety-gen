#!/bin/bash

# Evaluate GPT-OSS model on multiple scenarios
# Usage: ./evaluate_gpt_oss_all.sh <model_path> <problems_subdir> [reasoning] [max_problems]
# Example: ./evaluate_gpt_oss_all.sh unsloth/gpt-oss-20b-unsloth-bnb-4bit testing_problems3 high 50

set -e

# Initialize conda for bash shell
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
  source "$HOME/miniconda3/etc/profile.d/conda.sh"
elif command -v conda >/dev/null 2>&1; then
  eval "$(conda shell.bash hook)"
else
  echo "[ERROR] conda not found; cannot activate env 'llmstl'." >&2
  exit 1
fi
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
MODEL_PATH="${1:-unsloth/gpt-oss-20b-unsloth-bnb-4bit}"
PROBLEMS_SUBDIR="${2:-testing_problem50}"  # e.g., testing_problems3 / testing_problems3_hard
REASONING="${3:-high}"  # low / medium / high
MAX_PROBLEMS="${4:-50}"
TEMPERATURE="${5:-0.6}"

# Sanitize model path for filename
MODEL_NAME=$(echo "${MODEL_PATH}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')

RUN_TS="$(date +%Y%m%d_%H%M%S)"
OUTPUT_DIR="planning_results/gpt_oss_${MODEL_NAME}_${REASONING}_${RUN_TS}"
mkdir -p "${OUTPUT_DIR}"

echo "=========================================="
echo "Evaluating GPT-OSS model on all scenarios"
echo "=========================================="
echo "Model: ${MODEL_PATH}"
echo "Reasoning effort: ${REASONING}"
echo "Max problems per scenario: ${MAX_PROBLEMS}"
echo "Problems subdir: ${PROBLEMS_SUBDIR}"
echo "Temperature: ${TEMPERATURE}"
echo "Output dir: ${OUTPUT_DIR}"
echo "=========================================="
echo ""

# Define scenarios array
declare -a SCENARIOS=( "blocksworld" "delivery" "ferry" "spanner" "grippers" )

# Track results
declare -A RESULTS

# Loop through each scenario
for SCENARIO in "${SCENARIOS[@]}"; do
    echo ""
    echo "=========================================="
    echo "Evaluating ${SCENARIO} scenario"
    echo "=========================================="
    echo ""

    # Set scenario-specific paths
    PROBLEMS_DIR="pddl3/${SCENARIO}/${PROBLEMS_SUBDIR}"
    DOMAIN_FILE="pddl3/${SCENARIO}/domain3.pddl"
    OUTPUT_FILE="${OUTPUT_DIR}/${SCENARIO}.json"

    # Check if problems directory exists
    if [ ! -d "${PROBLEMS_DIR}" ]; then
        echo "[WARNING] Problems directory not found: ${PROBLEMS_DIR}"
        echo "Skipping ${SCENARIO}..."
        RESULTS["${SCENARIO}"]="SKIPPED"
        continue
    fi

    # Check if domain file exists
    if [ ! -f "${DOMAIN_FILE}" ]; then
        echo "[WARNING] Domain file not found: ${DOMAIN_FILE}"
        echo "Skipping ${SCENARIO}..."
        RESULTS["${SCENARIO}"]="SKIPPED"
        continue
    fi

    echo "Problems dir: ${PROBLEMS_DIR}"
    echo "Domain file: ${DOMAIN_FILE}"
    echo "Output file: ${OUTPUT_FILE}"
    echo ""

    # Run evaluation
    python3 script/gpt-oss/evaluate_gpt_oss.py \
        --model "${MODEL_PATH}" \
        --problems-dir "${PROBLEMS_DIR}" \
        --domain-file "${DOMAIN_FILE}" \
        --reasoning "${REASONING}" \
        --max-problems ${MAX_PROBLEMS} \
        --temperature ${TEMPERATURE} \
        --output "${OUTPUT_FILE}" \
        --no-timestamp

    RESULTS["${SCENARIO}"]="COMPLETED"

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
echo "Model: ${MODEL_PATH}"
echo "Reasoning: ${REASONING}"
echo ""
echo "Results summary:"
for SCENARIO in "${SCENARIOS[@]}"; do
    echo "  ${SCENARIO}: ${RESULTS[${SCENARIO}]:-UNKNOWN}"
done
echo ""
echo "Results saved in: ${OUTPUT_DIR}"
echo "=========================================="

# Generate summary
echo ""
echo "Generating summary..."
python3 -c "
import json
import os
from pathlib import Path

output_dir = '${OUTPUT_DIR}'
scenarios = ['blocksworld', 'ferry', 'spanner', 'grippers']

print()
print('=' * 60)
print('EVALUATION SUMMARY')
print('=' * 60)
print(f'Model: ${MODEL_PATH}')
print(f'Reasoning: ${REASONING}')
print()
print(f'{\"Scenario\":<15} {\"Total\":<8} {\"Success\":<8} {\"Rate\":<10}')
print('-' * 45)

total_all = 0
success_all = 0

for scenario in scenarios:
    json_file = Path(output_dir) / f'{scenario}.json'
    if json_file.exists():
        with open(json_file) as f:
            data = json.load(f)
        total = data.get('total_tests', 0)
        success = data.get('success_count', 0)
        rate = data.get('success_rate', 0)
        print(f'{scenario:<15} {total:<8} {success:<8} {rate:.1f}%')
        total_all += total
        success_all += success
    else:
        print(f'{scenario:<15} {\"N/A\":<8} {\"N/A\":<8} {\"N/A\":<10}')

print('-' * 45)
overall_rate = (success_all / total_all * 100) if total_all > 0 else 0
print(f'{\"OVERALL\":<15} {total_all:<8} {success_all:<8} {overall_rate:.1f}%')
print('=' * 60)
"

echo ""
