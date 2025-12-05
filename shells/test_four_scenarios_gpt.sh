#!/bin/bash

# Test GPT-5 model on four scenarios (blocksworld, spanner, ferry, grippers)
# Usage: ./test_four_scenarios_gpt.sh [max_problems] [temperature] [one_shot] [api_key]
# Example: ./test_four_scenarios_gpt.sh 10 0.6 0
# Example: ./test_four_scenarios_gpt.sh 0 0.6 1 "sk-xxx"

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /users/jfan5/Safety-gen

# Parse arguments
MAX_PROBLEMS="${1:-0}"             # Default to 0 (all problems)
TEMPERATURE="${2:-0.6}"            # Default to 0.6
ONE_SHOT="${3:-0}"                # Default to 0 (disabled)
API_KEY="${4:-}"                   # Optional API key (if not provided, will use OPENAI_API_KEY env var)

# Fixed parameters - using GPT-5
MODEL_NAME="gpt-5"
PROVIDER="openai"
FAMILY="auto"

# Sanitize model name for filename (replace / and other special chars with -)
MODEL_NAME_CLEAN=$(echo "${MODEL_NAME}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')

# Generate timestamp for output files
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ONESHOT_SUFFIX=""
if [ "${ONE_SHOT}" = "1" ]; then
    ONESHOT_SUFFIX="_oneshot"
fi

echo "=========================================="
echo "Testing GPT model on four scenarios"
echo "=========================================="
echo "Model: ${MODEL_NAME}"
echo "Provider: ${PROVIDER}"
echo "Family: ${FAMILY}"
echo "Max problems per scenario: ${MAX_PROBLEMS} (0 = all)"
echo "Temperature: ${TEMPERATURE}"
echo "One-shot: ${ONE_SHOT}"
if [ -n "${API_KEY}" ]; then
    echo "API Key: [PROVIDED]"
else
    echo "API Key: [Will use OPENAI_API_KEY environment variable]"
fi
echo "=========================================="
echo ""

# Define scenarios array
declare -a SCENARIOS=( "blocksworld" "spanner" "ferry" "grippers" )

# Array to store result files for summary
declare -a RESULT_FILES=()

# Loop through each scenario
for SCENARIO in "${SCENARIOS[@]}"; do
    echo ""
    echo "=========================================="
    echo "Testing ${SCENARIO} scenario"
    echo "=========================================="
    echo ""
    
    # Set scenario-specific paths
    PROBLEMS_DIR="benchmark_problems/${SCENARIO}"
    DOMAIN_FILE="pddl3/${SCENARIO}/domain.pddl"
    OUTPUT_FILE="${SCENARIO}_${MODEL_NAME_CLEAN}${ONESHOT_SUFFIX}_results.json"
    
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
    
    # Build command arguments (model is fixed to gpt-5, no --model parameter needed)
    CMD_ARGS=(
        "--provider" "${PROVIDER}"
        "--family" "${FAMILY}"
        "--problems-dir" "${PROBLEMS_DIR}"
        "--domain-file" "${DOMAIN_FILE}"
        "--temperature" "${TEMPERATURE}"
        "--output" "${OUTPUT_FILE}"
    )
    
    # Add max-problems if specified
    if [ "${MAX_PROBLEMS}" -gt 0 ]; then
        CMD_ARGS+=("--max-problems" "${MAX_PROBLEMS}")
    fi
    
    # Add API key if provided
    if [ -n "${API_KEY}" ]; then
        CMD_ARGS+=("--api-key" "${API_KEY}")
    fi
    
    # Add one-shot flag if enabled
    if [ "${ONE_SHOT}" = "1" ]; then
        CMD_ARGS+=("--one-shot")
    fi
    
    # Run evaluation
    echo "Running evaluation..."
    python3 script/evaluate_api_llm_solver.py "${CMD_ARGS[@]}"
    
    # Find the actual output file (with timestamp added by the script)
    # The script adds timestamp to the filename: {stem}{oneshot_suffix}_{timestamp}.json
    # Pattern: {scenario}_{model}{oneshot_suffix}_*_*.json or {scenario}_{model}_*_*.json
    OUTPUT_PATTERN="${SCENARIO}_${MODEL_NAME_CLEAN}${ONESHOT_SUFFIX}_*_*.json"
    ACTUAL_OUTPUT=$(ls -t ${OUTPUT_PATTERN} 2>/dev/null | head -1)
    
    # If not found with oneshot suffix, try without (in case script didn't add it)
    if [ -z "${ACTUAL_OUTPUT}" ] && [ "${ONE_SHOT}" = "1" ]; then
        OUTPUT_PATTERN="${SCENARIO}_${MODEL_NAME_CLEAN}_*_*.json"
        ACTUAL_OUTPUT=$(ls -t ${OUTPUT_PATTERN} 2>/dev/null | head -1)
    fi
    
    if [ -n "${ACTUAL_OUTPUT}" ]; then
        RESULT_FILES+=("${ACTUAL_OUTPUT}")
        echo ""
        echo "=========================================="
        echo "${SCENARIO} evaluation completed!"
        echo "Results saved to: ${ACTUAL_OUTPUT}"
        echo "=========================================="
    else
        echo ""
        echo "Warning: Could not find output file for ${SCENARIO}"
        echo "  Searched for pattern: ${OUTPUT_PATTERN}"
    fi
done

echo ""
echo "=========================================="
echo "All evaluations completed!"
echo "=========================================="
echo "Evaluated scenarios: ${SCENARIOS[*]}"
echo ""
echo "Result files:"
for RESULT_FILE in "${RESULT_FILES[@]}"; do
    echo "  - ${RESULT_FILE}"
done
echo ""

# Generate summary if we have result files
if [ ${#RESULT_FILES[@]} -gt 0 ]; then
    echo "=========================================="
    echo "Generating summary..."
    echo "=========================================="
    
    # Use Python script to generate summary
    SUMMARY_FILE="four_scenarios_summary${ONESHOT_SUFFIX}_${TIMESTAMP}.json"
    
    # Create a temporary file list for Python to read
    TEMP_FILE_LIST="/tmp/result_files_${TIMESTAMP}.txt"
    printf '%s\n' "${RESULT_FILES[@]}" > "${TEMP_FILE_LIST}"
    
    python3 << EOF
import json
import sys
from pathlib import Path
from datetime import datetime

# Read result files from temp file
result_files = []
with open("${TEMP_FILE_LIST}", 'r') as f:
    result_files = [line.strip() for line in f if line.strip()]

summary_file = "${SUMMARY_FILE}"

all_results = []
total_tests = 0
total_success = 0

for result_file in result_files:
    try:
        with open(result_file, 'r', encoding='utf-8') as f:
            data = json.load(f)
            scenario_name = result_file.split('_')[0]
            data['scenario_name'] = scenario_name
            data['result_file'] = result_file
            all_results.append(data)
            total_tests += data.get('total_tests', 0)
            total_success += data.get('success_count', 0)
    except Exception as e:
        print(f"Error loading {result_file}: {e}")

summary = {
    'timestamp': datetime.now().isoformat(),
    'total_scenarios': len(all_results),
    'scenarios': [],
    'overall': {
        'total_tests': total_tests,
        'total_success': total_success,
        'overall_success_rate': (total_success / total_tests * 100) if total_tests > 0 else 0
    }
}

for result in all_results:
    scenario_summary = {
        'scenario_name': result.get('scenario_name', 'unknown'),
        'model_name': result.get('model_name', 'unknown'),
        'total_tests': result.get('total_tests', 0),
        'success_count': result.get('success_count', 0),
        'success_rate': result.get('success_rate', 0),
        'category_counts': result.get('category_counts', {}),
        'category_rates': result.get('category_rates', {}),
        'one_shot': result.get('one_shot', False),
        'temperature': result.get('temperature', 0.6),
        'result_file': result.get('result_file', '')
    }
    summary['scenarios'].append(scenario_summary)

with open(summary_file, 'w', encoding='utf-8') as f:
    json.dump(summary, f, indent=2, ensure_ascii=False)

print(f"\nSummary saved to: {summary_file}")
print(f"\nOverall success rate: {summary['overall']['overall_success_rate']:.1f}%")
print(f"Total tests: {summary['overall']['total_tests']}")
print(f"Total success: {summary['overall']['total_success']}")
print(f"\nPer-scenario results:")
for scenario in summary['scenarios']:
    print(f"  {scenario['scenario_name']}: {scenario['success_rate']:.1f}% ({scenario['success_count']}/{scenario['total_tests']})")
EOF
    
    # Clean up temp file
    rm -f "${TEMP_FILE_LIST}"
    
    echo ""
    echo "Summary saved to: ${SUMMARY_FILE}"
fi

echo ""
echo "=========================================="
echo "Done!"
echo "=========================================="

