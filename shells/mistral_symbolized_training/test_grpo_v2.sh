#!/bin/bash
# Quick test script for GRPO V2
# Runs only 50 steps to verify everything works

conda activate llmstl
cd /home/ubuntu/Safety-gen

export CUDA_VISIBLE_DEVICES=0

# ==========================================
# Quick Test Configuration (50 steps)
# ==========================================
BASE_MODEL="/jfan5/sft_models/mistral_7b/symbolized_v2"
DATA_ROOT="/jfan5/grpo_data/five_domain_0109"

# Small configuration for quick test
BATCH_SIZE=8  # Must be divisible by 4 (num_domains)
GRADIENT_ACCUMULATION_STEPS=1  # Reduced for faster testing
LEARNING_RATE=1e-5
NUM_GENERATIONS=4  # Reduced from 8
TEMPERATURE=0.6
MAX_STEPS=50  # Quick test
TOP_P=0.9
LOGGING_STEPS=5  # More frequent logging for testing
SAVE_STEPS=25  # Save midway through test
WANDB_PROJECT="pddl-grpo-v2-test"
BETA=0.01
MAX_GRAD_NORM=1
SEED=3407

# Test output directory
OUTPUT_DIR="./test_grpo_v2_output"
RUN_NAME="test_grpo_v2_$(date +%H%M%S)"

echo "=========================================="
echo "GRPO V2 Quick Test (${MAX_STEPS} steps)"
echo "=========================================="
echo "Base model: ${BASE_MODEL}"
echo "Data root: ${DATA_ROOT}"
echo "Output: ${OUTPUT_DIR}"
echo ""
echo "This is a quick test to verify:"
echo "  ✓ Data loading and difficulty parsing"
echo "  ✓ Domain-balanced batch generation"
echo "  ✓ Curriculum learning schedule"
echo "  ✓ Training loop execution"
echo "=========================================="
echo ""

# Step 1: Test difficulty parsing
echo "Step 1/2: Testing difficulty parsing..."
python3 script/test_difficulty_parsing.py | head -80
echo ""

# Step 2: Run quick training
echo "=========================================="
echo "Step 2/2: Running quick training (${MAX_STEPS} steps)..."
echo "=========================================="
echo ""

python3 script/train_grpo_unsloth_stl_v2.py \
  --base_model "${BASE_MODEL}" \
  --data_root "${DATA_ROOT}" \
  --output_dir "${OUTPUT_DIR}" \
  --batch_size ${BATCH_SIZE} \
  --beta ${BETA} \
  --max_grad_norm ${MAX_GRAD_NORM} \
  --gradient_accumulation_steps ${GRADIENT_ACCUMULATION_STEPS} \
  --learning_rate ${LEARNING_RATE} \
  --num_generations ${NUM_GENERATIONS} \
  --temperature ${TEMPERATURE} \
  --top_p ${TOP_P} \
  --max_steps ${MAX_STEPS} \
  --logging_steps ${LOGGING_STEPS} \
  --save_steps ${SAVE_STEPS} \
  --wandb_project "${WANDB_PROJECT}" \
  --seed ${SEED} \
  --run_name "${RUN_NAME}" \
  --no_wandb  # Disable W&B for quick test

EXIT_CODE=$?

echo ""
echo "=========================================="
if [ $EXIT_CODE -eq 0 ]; then
  echo "✓ Quick test PASSED!"
  echo ""
  echo "Next steps:"
  echo "  1. Review output above for any warnings"
  echo "  2. Check curriculum weights progression"
  echo "  3. Verify domain balance in logs"
  echo "  4. Run full training: grpo_mistral_7b_stl_v2.sh"
else
  echo "✗ Quick test FAILED with exit code: $EXIT_CODE"
  echo ""
  echo "Troubleshooting:"
  echo "  1. Check error messages above"
  echo "  2. Verify DATA_ROOT exists: ${DATA_ROOT}"
  echo "  3. Verify BASE_MODEL exists: ${BASE_MODEL}"
  echo "  4. Check batch_size is divisible by 4: ${BATCH_SIZE}"
fi
echo "=========================================="
echo ""

# Cleanup test output if successful
if [ $EXIT_CODE -eq 0 ]; then
  echo "Cleaning up test output directory..."
  rm -rf "${OUTPUT_DIR}"
  echo "✓ Cleanup complete"
fi

exit $EXIT_CODE
