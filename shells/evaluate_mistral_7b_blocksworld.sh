#!/bin/bash

# Evaluate Mistral-7B Blocksworld model on blocksworld test set
# Model: /home/ubuntu/sft_models/mistral_7b/blocksworld/pddl3

conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Configuration
MODEL_PATH="/jfan5/grpo_models/mistral_variant-blocksworld"
RESULTS_BASE_DIR="planning_results/grpo-mistral_variant-blocksworld"
MAX_PROBLEMS=50

echo "=========================================="
echo "Evaluating Mistral-7B Blocksworld Model"
echo "=========================================="
echo "Model: ${MODEL_PATH}"
echo "Results directory: ${RESULTS_BASE_DIR}"
echo "Max problems: ${MAX_PROBLEMS}"
echo "=========================================="
echo ""

# blocksworld
echo "=========================================="
echo "Evaluating blocksworld scenario..."
echo "=========================================="
python3 script/evaluate_llm_solver.py \
    --model "${MODEL_PATH}" \
    --family mistral \
    --problems-dir "pddl3/blocksworld/all_problems3/testing" \
    --domain-file "pddl3/blocksworld/domain3.pddl" \
    --max-problems ${MAX_PROBLEMS} \
    --output "blocksworld_test_results.json" \
    --results-dir "${RESULTS_BASE_DIR}/blocksworld"

echo ""
echo "=========================================="
echo "Evaluation completed!"
echo "=========================================="
echo "Results saved to: ${RESULTS_BASE_DIR}/blocksworld/blocksworld_test_results.json"
echo ""

