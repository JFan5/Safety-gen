#!/bin/bash

# Evaluate fine-tuned Qwen3-14B model on four scenarios
# Model: /jfan5/sft_models/qwen3_14b/four_scenarios500
# Scenarios: blocksworld, ferry, grippers, spanner

conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Configuration
MODEL_PATH="/jfan5/sft_models/qwen3_14b/four_scenarios500"
RESULTS_BASE_DIR="planning_results/qwen3_14b-sft500"
MAX_PROBLEMS=50

echo "=========================================="
echo "Evaluating Qwen3-14B SFT Model"
echo "=========================================="
echo "Model: ${MODEL_PATH}"
echo "Results directory: ${RESULTS_BASE_DIR}"
echo "Max problems per scenario: ${MAX_PROBLEMS}"
echo "=========================================="
echo ""

# blocksworld
echo "=========================================="
echo "Evaluating blocksworld scenario..."
echo "=========================================="
python3 script/evaluate_llm_solver.py \
    --model "${MODEL_PATH}" \
    --family qwen \
    --problems-dir "pddl3/blocksworld/all_problems3/testing" \
    --domain-file "pddl3/blocksworld/domain3.pddl" \
    --max-problems ${MAX_PROBLEMS} \
    --output "blocksworld_test_results.json" \
    --results-dir "${RESULTS_BASE_DIR}/blocksworld"

echo ""

# ferry
echo "=========================================="
echo "Evaluating ferry scenario..."
echo "=========================================="
python3 script/evaluate_llm_solver.py \
    --model "${MODEL_PATH}" \
    --family qwen \
    --problems-dir "pddl3/ferry/all_problems3/testing" \
    --domain-file "pddl3/ferry/domain3.pddl" \
    --max-problems ${MAX_PROBLEMS} \
    --output "ferry_test_results.json" \
    --results-dir "${RESULTS_BASE_DIR}/ferry"

echo ""

# grippers
echo "=========================================="
echo "Evaluating grippers scenario..."
echo "=========================================="
python3 script/evaluate_llm_solver.py \
    --model "${MODEL_PATH}" \
    --family qwen \
    --problems-dir "pddl3/grippers/all_problems3/testing" \
    --domain-file "pddl3/grippers/domain3.pddl" \
    --max-problems ${MAX_PROBLEMS} \
    --output "grippers_test_results.json" \
    --results-dir "${RESULTS_BASE_DIR}/grippers"

echo ""

# spanner
echo "=========================================="
echo "Evaluating spanner scenario..."
echo "=========================================="
python3 script/evaluate_llm_solver.py \
    --model "${MODEL_PATH}" \
    --family qwen \
    --problems-dir "pddl3/spanner/all_problems3/testing" \
    --domain-file "pddl3/spanner/domain3.pddl" \
    --max-problems ${MAX_PROBLEMS} \
    --output "spanner_test_results.json" \
    --results-dir "${RESULTS_BASE_DIR}/spanner" \
    --no-load-in-4bit

echo ""
echo "=========================================="
echo "Evaluation completed for all four scenarios!"
echo "=========================================="
echo "Results saved to: ${RESULTS_BASE_DIR}/"
echo "  - blocksworld: ${RESULTS_BASE_DIR}/blocksworld/blocksworld_test_results.json"
echo "  - ferry: ${RESULTS_BASE_DIR}/ferry/ferry_test_results.json"
echo "  - grippers: ${RESULTS_BASE_DIR}/grippers/grippers_test_results.json"
echo "  - spanner: ${RESULTS_BASE_DIR}/spanner/spanner_test_results.json"
echo ""

