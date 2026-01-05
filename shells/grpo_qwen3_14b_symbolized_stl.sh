#!/bin/bash
set -euo pipefail

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/grpo_mistral_7b_1207_symbolized.o
#SBATCH --job-name=grpo_mistral_7b_1207_symbolized
#SBATCH --chdir=/home/ubuntu/Safety-gen

if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
  # shellcheck source=/dev/null
  source "$HOME/miniconda3/etc/profile.d/conda.sh"
elif command -v conda >/dev/null 2>&1; then
  # shellcheck source=/dev/null
  source "$(conda info --base)/etc/profile.d/conda.sh"
else
  echo "[ERROR] conda not found; cannot activate env 'llmstl'." >&2
  exit 1
fi
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# 单GPU配置
export CUDA_VISIBLE_DEVICES=0

# ==========================================
# Step 2: GRPO Training Configuration
# ==========================================
BASE_MODEL="/jfan5/sft_models/qwen3_14b/cross_domain_pddl3_symbolized"

# Symbolized (obfuscated) 4-scenarios combined GRPO JSONL
DATASET="/jfan5/grpo_data/pddl3_symbolized_four_scenarios-v3/train_combined.jsonl"
# DATASET="/jfan5/grpo_data-127/merged.jsonl"
OUTPUT_DIR="/jfan5/grpo_models/qwen3_14b-symbolized-1221-stl-1000"

# Training parameters
# NOTE: `--num_epochs` is currently not used by `script/train_grpo_unsloth_stl.py`;
# training length is controlled by `--max_steps`.
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=4
LEARNING_RATE=5e-6
NUM_GENERATIONS=4
TEMPERATURE=0.6
MAX_STEPS=1000
TOP_P=0.9
LOGGING_STEPS=50
SAVE_STEPS=100
MAX_PROMPT_LENGTH=2024
MAX_NEW_TOKENS=512
WANDB_PROJECT="pddl-grpo-qwen3_14b"
RUN_NAME="grpo_qwen3_14b-symbolized-1221-stl-1000"
BETA=0.05
MAX_GRAD_NORM=1
SEED=3407

echo "=========================================="
echo "Step 2: GRPO Training for Qwen3-14B (Symbolized)"
echo "=========================================="
echo "Base model: ${BASE_MODEL}"
echo "Dataset: ${DATASET}"
echo "Output: ${OUTPUT_DIR}"
echo ""
echo "Training parameters:"
echo "  Batch size: ${BATCH_SIZE}"
echo "  Gradient accumulation: ${GRADIENT_ACCUMULATION_STEPS}"
echo "  Learning rate: ${LEARNING_RATE}"
echo "  Generations per prompt: ${NUM_GENERATIONS}"
echo "=========================================="
echo ""

# Run GRPO training
python3 script/train_grpo_unsloth_stl.py \
  --base_model "${BASE_MODEL}" \
  --dataset "${DATASET}" \
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
  --max_prompt_length ${MAX_PROMPT_LENGTH} \
  --max_new_tokens ${MAX_NEW_TOKENS} \
  --save_steps ${SAVE_STEPS} \
  --wandb_project "${WANDB_PROJECT}" \
  --seed ${SEED} \
  --run_name "${RUN_NAME}"

echo ""
echo "=========================================="
echo "GRPO training completed!"
echo "=========================================="
echo "Model saved to: ${OUTPUT_DIR}"
echo ""

