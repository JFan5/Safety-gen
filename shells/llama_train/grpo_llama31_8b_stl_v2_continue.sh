#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/grpo_llama3_8b_stl_v2_continue.o
#SBATCH --job-name=grpo_llama3_8b_stl_v2_continue
#SBATCH --chdir=/home/ubuntu/Safety-gen

conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Single GPU configuration
export CUDA_VISIBLE_DEVICES=0

# ==========================================
# GRPO V2 Resume Training Configuration
# Resume from checkpoint-500 of interrupted run
# ==========================================

# Original base model (NOT the interrupted run)
BASE_MODEL="/jfan5/sft_models/llama31_8b/symbolized"

# Checkpoint to resume from
CHECKPOINT_PATH="/home/ubuntu/Safety-gen/runs/llama31_8b/grpo/grpo_llama3.1-8b-curriculum_v2-all-0129-stl_20260129_153849_seed3407/model/checkpoint-500"

# Output to same directory (trainer will detect and continue)

# V2 uses multi-domain data directory
DATA_ROOT="/jfan5/grpo_data/five_domain_0109/"

# Training parameters (must match original run from config_snapshot.yaml)
BATCH_SIZE=32
GRADIENT_ACCUMULATION_STEPS=1
LEARNING_RATE=1e-5
NUM_GENERATIONS=8
TEMPERATURE=0.6
MAX_STEPS=1000
TOP_P=0.9
LOGGING_STEPS=20
SAVE_STEPS=100
WANDB_PROJECT="pddl-grpo-llama31-8b"
BETA=0.01
MAX_GRAD_NORM=1
SEED=3407

# Run name for W&B (continue the same run)
RUN_NAME="grpo_llama3.1-8b-curriculum_v2-all-0129-stl-resumed"

echo "=========================================="
echo "GRPO V2 RESUME Training for Llama-3.1-8B"
echo "Resuming from checkpoint-500"
echo "=========================================="
echo "Base model: ${BASE_MODEL}"
echo "Checkpoint: ${CHECKPOINT_PATH}"
echo "Data root: ${DATA_ROOT}"
echo "Output: ${OUTPUT_DIR}"
echo ""
echo "Training parameters (matching original run):"
echo "  Batch size: ${BATCH_SIZE}"
echo "  Gradient accumulation: ${GRADIENT_ACCUMULATION_STEPS}"
echo "  Learning rate: ${LEARNING_RATE}"
echo "  Generations per prompt: ${NUM_GENERATIONS}"
echo "  Max steps: ${MAX_STEPS}"
echo "  Beta (KL penalty): ${BETA}"
echo "  Seed: ${SEED}"
echo ""
echo "Resume Info:"
echo "  Resuming from step 500 (50% complete)"
echo "  Will continue to step 1000"
echo "=========================================="
echo ""

# Verify checkpoint exists
if [ ! -d "${CHECKPOINT_PATH}" ]; then
    echo "ERROR: Checkpoint directory does not exist: ${CHECKPOINT_PATH}"
    exit 1
fi
echo "Checkpoint verified: ${CHECKPOINT_PATH}"
echo ""

# Run GRPO V2 training with resume
python3 script/train_grpo_unsloth_stl_v2.py \
  --base_model "${BASE_MODEL}" \
  --data_root "${DATA_ROOT}" \
  --resume_from_checkpoint "${CHECKPOINT_PATH}" \
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
  --no_run_tracking

EXIT_CODE=$?

echo ""
echo "=========================================="
if [ $EXIT_CODE -eq 0 ]; then
  echo "GRPO V2 resume training completed successfully!"
else
  echo "GRPO V2 resume training failed with exit code: $EXIT_CODE"
fi
echo "=========================================="
echo "Model saved to: ${OUTPUT_DIR}"
echo ""
echo "Next steps:"
echo "  1. Check W&B for training curves: ${WANDB_PROJECT}/${RUN_NAME}"
echo "  2. Verify training continued from step 500"
echo "  3. Run evaluation on the completed model"
echo ""

exit $EXIT_CODE
