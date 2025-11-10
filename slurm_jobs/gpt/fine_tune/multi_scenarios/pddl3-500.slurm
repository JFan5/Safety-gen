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
  --model "${MODEL_NAME}" \
  --output "${OUTPUT_NOTE}" \
  --dataset "${DATASET_PATH}" \
  --family gpt \
  --per-device-train-batch-size 8 \
  --gradient-accumulation-steps 2 \
  --scenarios all
