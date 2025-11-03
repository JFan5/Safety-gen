#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=fine_tune_gpt_ferry_pddl2.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=fine_tune_gpt_ferry_pddl2 # Specify job name

conda activate llmstl

# Model and output configuration for GPT-OSS-20B on ferry scenario (PDDL2)
MODEL_NAME="unsloth/gpt-oss-20b-unsloth-bnb-4bit"
OUTPUT_NAME="gpt_oss_20b/ferry/pddl2"
DATASET_PATH="/home/ubuntu/data/sft/ferry/pddl2.hf"

python3 pddl_finetune.py \
  --mode train \
  --model "$MODEL_NAME" \
  --output "$OUTPUT_NAME" \
  --dataset "$DATASET_PATH" \
  --family gpt \
  --max-seq-length 2048 \
  --per-device-train-batch-size 4 \
  --gradient-accumulation-steps 4 \
  --load-in-4bit \
  --scenarios ferry



