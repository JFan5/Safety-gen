#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/grpo_mistral_7b_stl_v2.o
#SBATCH --job-name=grpo_mistral_7b_stl_v2
#SBATCH --chdir=/home/ubuntu/Safety-gen

conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen
export PYTHONPATH="${PYTHONPATH}:$(pwd)"

# 单GPU配置
export CUDA_VISIBLE_DEVICES=0

# ==========================================
# Parse command line arguments
# Usage:
#   ./grpo_mistral_7b_stl_v2.sh                    # Train on all domains
#   ./grpo_mistral_7b_stl_v2.sh blocksworld        # Train on single domain
#   ./grpo_mistral_7b_stl_v2.sh blocksworld,ferry  # Train on multiple domains
# ==========================================
DOMAINS_ARG=""
DOMAIN_SUFFIX="all"
if [ -n "$1" ]; then
    DOMAINS_ARG="--domains $1"
    DOMAIN_SUFFIX=$(echo "$1" | tr ',' '_')
    echo "Training on specified domains: $1"
else
    echo "Training on all available domains"
fi

# ==========================================
# GRPO V2 Training Configuration
# Curriculum Learning + Domain-Balanced Batching
# ==========================================
BASE_MODEL="/home/ubuntu/Safety-gen/runs/mistral/sft/default_run_20260205_170724_seed3407/model"

# V2 uses multi-domain data directory instead of single JSONL
# Expected structure: /jfan5/grpo_data/five_domain_0109/{blocksworld,ferry,grippers,spanner}.jsonl
DATA_ROOT="/jfan5/grpo_data/five_domain_20260205_173256"

# Training parameters
# NOTE: batch_size MUST be divisible by num_domains
# For single domain: any batch size works
# For all domains (4): Valid batch sizes: 4, 8, 12, 16, 20, ...
BATCH_SIZE=30
GRADIENT_ACCUMULATION_STEPS=1
LEARNING_RATE=1e-5
NUM_GENERATIONS=6
TEMPERATURE=0.6
MAX_STEPS=1000
TOP_P=0.9
LOGGING_STEPS=20
SAVE_STEPS=100
WANDB_PROJECT="pddl-grpo-mistral7b"
BETA=0.05
MAX_GRAD_NORM=0.5
SEED=3407
max_new_tokens=256

# ==========================================
# Auto-generate RUN_NAME and OUTPUT_DIR
# ==========================================
DATE_TAG=$(date +%m%d)
MODEL_TAG="mistral_7b"
DATASET_TAG="curriculum_v2"

# 自动生成 RUN_NAME 和 OUTPUT_DIR (包含domain信息)
RUN_NAME="grpo_${MODEL_TAG}-${DATASET_TAG}-${DOMAIN_SUFFIX}-${DATE_TAG}-stl"

echo "=========================================="
echo "GRPO V2 Training for Mistral-7B"
echo "Curriculum Learning + Domain Balancing"
echo "=========================================="
echo "Base model: ${BASE_MODEL}"
echo "Data root: ${DATA_ROOT}"
echo "Domains: ${DOMAIN_SUFFIX}"
echo "Output: ${OUTPUT_DIR}"
echo ""
echo "Training parameters:"
echo "  Batch size: ${BATCH_SIZE}"
echo "  Gradient accumulation: ${GRADIENT_ACCUMULATION_STEPS}"
echo "  Learning rate: ${LEARNING_RATE}"
echo "  Generations per prompt: ${NUM_GENERATIONS}"
echo "  Max steps: ${MAX_STEPS}"
echo "  Beta (KL penalty): ${BETA}"
echo ""
echo "V2 Features:"
echo "  ✓ Difficulty-based curriculum learning"
echo "  ✓ Domain-balanced batching (guaranteed equal samples per domain)"
echo "  ✓ Dynamic sampling from difficulty buckets"
echo "  ✓ Curriculum schedule: early=70% easy → late=40% hard"
echo "=========================================="
echo ""

# Optional: Test difficulty parsing first (quick validation)
echo "Step 1: Testing difficulty parsing..."
python3 script/test_difficulty_parsing.py | head -100
echo ""
echo "=========================================="
echo "Step 2: Starting V2 Training..."
echo "=========================================="
echo ""

# Run GRPO V2 training
python3 script/train_grpo_unsloth_stl_v2.py \
  --base_model "${BASE_MODEL}" \
  --data_root "${DATA_ROOT}" \
  ${DOMAINS_ARG} \
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
  --max_new_tokens ${max_new_tokens}

EXIT_CODE=$?

echo ""
echo "=========================================="
if [ $EXIT_CODE -eq 0 ]; then
  echo "✓ GRPO V2 training completed successfully!"
else
  echo "✗ GRPO V2 training failed with exit code: $EXIT_CODE"
fi
echo "=========================================="
echo "Model saved to: ${OUTPUT_DIR}"
echo ""
echo "Next steps:"
echo "  1. Check W&B for training curves: ${WANDB_PROJECT}/${RUN_NAME}"
echo "  2. Verify curriculum progression in logs"
echo "  3. Validate domain balance in batch statistics"
echo ""
echo "V2 Advantages:"
echo "  • Faster convergence via curriculum learning"
echo "  • Better generalization via domain balancing"
echo "  • Difficulty-aware sampling for efficient training"
echo ""

exit $EXIT_CODE
