#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=28
#SBATCH --job-name=fine_tune_gpt_pddl3
#SBATCH --output=fine_tune_gpt_pddl3.o

conda activate llmstl

# Fine-tune GPT-OSS-20B on the PDDL3 multi-scenario dataset.
# Ensure the dataset is generated via:
#   python3 script/collect_finetuned_dataset_together.py --pddl PDDL3 --output /home/ubuntu/data/sft/multi_scenarios/pddl3.hf

MODEL_NAME="unsloth/gpt-oss-20b-unsloth-bnb-4bit"
DATASET_PATH="/home/ubuntu/data/sft/multi_scenarios500/pddl3.hf"
OUTPUT_NOTE="gpt_multi_pddl3_500"

if [ ! -d "${DATASET_PATH}" ]; then
  echo "Dataset not found at ${DATASET_PATH}"
  echo "Please generate it before submitting this job."
  exit 1
fi
python3 pddl_finetune.py \
  --mode train \
  --model "unsloth/gpt-oss-20b-unsloth-bnb-4bit" \
  --output "gpt_multi_pddl3_500_v1" \
  --dataset "/home/ubuntu/data/sft/multi_scenarios500/pddl3.hf" \
  --family gpt \
  --per-device-train-batch-size 8 \
  --gradient-accumulation-steps 2 \
  --scenarios all \
  --num-train-epochs 1.5 \
  --learning-rate 1e-4 \
  --warmup-ratio 0.05 \
  --weight-decay 0.0 \
  --lr-scheduler-type cosine \
  --max-grad-norm 1.0 \
  --val_ratio 0.1 \
  --eval-strategy steps \
  --eval-steps 25 \
  --logging-steps 10 \
  --save-strategy steps \
  --save-total-limit 2 \
  --no-load-in-4bit 