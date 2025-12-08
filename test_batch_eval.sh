#!/bin/bash

# 测试批处理评估脚本

cd /home/ubuntu/Safety-gen

# 检查参数
if [ -z "$1" ]; then
    echo "Error: Model path is required"
    echo "Usage: $0 <model_path>"
    echo ""
    echo "Example:"
    echo "  $0 /jfan5/sft_models/mistral_7b/four_scenarios500_randomized"
    exit 1
fi

MODEL_PATH="$1"

echo "Testing batch evaluation script..."
echo "Model: ${MODEL_PATH}"
echo ""

# 快速测试：只评估 5 个问题
python3 script/evaluate_llm_solver_batch.py \
  --model "${MODEL_PATH}" \
  --problems-dir pddl3/blocksworld/testing_problem50 \
  --domain-file pddl3/blocksworld/domain3.pddl \
  --batch-size 2 \
  --num-workers 4 \
  --max-problems 5 \
  --output planning_results/test_batch.json

echo ""
echo "Test completed!"
