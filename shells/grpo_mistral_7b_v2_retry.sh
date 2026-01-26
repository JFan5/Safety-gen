#!/bin/bash
set -euo pipefail

# ==========================================
# GRPO V2 Retry Training for Mistral-7B
# 方案C: Mistral重新训练
#
# The previous Mistral training was interrupted (SIGINT after 42s).
# This script restarts training with optimized parameters:
#   - beta: 0.02 (increased from 0.01)
#   - max_new_tokens: 512 (increased from 256)
# ==========================================

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/grpo_mistral_7b_v2_retry.o
#SBATCH --job-name=grpo_mistral_retry
#SBATCH --chdir=/home/ubuntu/Safety-gen

if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
  source "$HOME/miniconda3/etc/profile.d/conda.sh"
elif command -v conda >/dev/null 2>&1; then
  source "$(conda info --base)/etc/profile.d/conda.sh"
else
  echo "[ERROR] conda not found; cannot activate env 'llmstl'." >&2
  exit 1
fi
conda activate llmstl

cd /home/ubuntu/Safety-gen
export CUDA_VISIBLE_DEVICES=0

# ==========================================
# Parse command line arguments
# ==========================================
DOMAINS_ARG=""
DOMAIN_SUFFIX="all"
if [ -n "${1:-}" ]; then
    DOMAINS_ARG="--domains $1"
    DOMAIN_SUFFIX=$(echo "$1" | tr ',' '_')
    echo "Training on specified domains: $1"
else
    echo "Training on all available domains"
fi

# ==========================================
# Configuration
# ==========================================
BASE_MODEL="/jfan5/sft_models/mistral_7b/symbolized_v2"
DATA_ROOT="/jfan5/grpo_data/five_domain_0109/"

# Optimized parameters
BETA=0.02              # Increased from 0.01 to prevent reward hacking
MAX_NEW_TOKENS=512     # Increased from 256 for longer plans

# Standard parameters
BATCH_SIZE=8
GRADIENT_ACCUMULATION_STEPS=4
LEARNING_RATE=1e-5
NUM_GENERATIONS=8
TEMPERATURE=0.6
MAX_STEPS=1000
TOP_P=0.9
MAX_GRAD_NORM=1
LOGGING_STEPS=20
SAVE_STEPS=100
SEED=3407
WANDB_PROJECT="pddl-grpo-mistral-7b"

# Auto-generate names
DATE_TAG=$(date +%m%d)
RUN_NAME="grpo_mistral_7b-v2-retry-${DOMAIN_SUFFIX}-${DATE_TAG}"
OUTPUT_DIR="/jfan5/grpo_models/mistral_7b-v2-retry-${DOMAIN_SUFFIX}-${DATE_TAG}"

echo "=========================================="
echo "GRPO V2 Retry Training for Mistral-7B"
echo "=========================================="
echo "NOTE: Previous training was interrupted (SIGINT after 42s)"
echo "      This is a full re-training with optimized parameters."
echo ""
echo "Base model: ${BASE_MODEL}"
echo "Data root: ${DATA_ROOT}"
echo "Domains: ${DOMAIN_SUFFIX}"
echo "Output: ${OUTPUT_DIR}"
echo ""
echo "Optimized parameters:"
echo "  Beta: ${BETA} (baseline: 0.01)"
echo "  Max new tokens: ${MAX_NEW_TOKENS} (baseline: 256)"
echo ""
echo "Other parameters:"
echo "  Batch size: ${BATCH_SIZE}"
echo "  Learning rate: ${LEARNING_RATE}"
echo "  Generations: ${NUM_GENERATIONS}"
echo "  Max steps: ${MAX_STEPS}"
echo "=========================================="

python3 script/train_grpo_unsloth_stl_v2.py \
  --base_model "${BASE_MODEL}" \
  --data_root "${DATA_ROOT}" \
  ${DOMAINS_ARG} \
  --output_dir "${OUTPUT_DIR}" \
  --batch_size ${BATCH_SIZE} \
  --beta ${BETA} \
  --max_grad_norm ${MAX_GRAD_NORM} \
  --gradient_accumulation_steps ${GRADIENT_ACCUMULATION_STEPS} \
  --learning_rate ${LEARNING_RATE} \
  --num_generations ${NUM_GENERATIONS} \
  --temperature ${TEMPERATURE} \
  --top_p ${TOP_P} \
  --max_new_tokens ${MAX_NEW_TOKENS} \
  --max_steps ${MAX_STEPS} \
  --logging_steps ${LOGGING_STEPS} \
  --save_steps ${SAVE_STEPS} \
  --wandb_project "${WANDB_PROJECT}" \
  --seed ${SEED} \
  --run_name "${RUN_NAME}"

EXIT_CODE=$?

echo ""
echo "=========================================="
if [ $EXIT_CODE -eq 0 ]; then
  echo "Training completed successfully!"
  echo "Model saved to: ${OUTPUT_DIR}"
  echo ""
  echo "Next: Run evaluation with:"
  echo "  python script/evaluate_llm_solver_batch.py \\"
  echo "    --run-path ${OUTPUT_DIR} \\"
  echo "    --domains blocksworld,ferry,grippers,spanner,delivery \\"
  echo "    --temperature 0.6 --max-new-tokens 512 --batch-size 8"
else
  echo "Training failed with exit code: $EXIT_CODE"
fi
echo "=========================================="

exit $EXIT_CODE
