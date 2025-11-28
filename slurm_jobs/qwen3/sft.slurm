#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=fine_tune_qwen3-14b.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=fine_tune_qwen3-14b # Specify job name

conda activate llmstl

# Model and output configuration for qwen3-14b on delivery scenario (PDDL3)
MODEL_NAME="unsloth/Qwen3-14B-unsloth-bnb-4bit"
OUTPUT_NAME="/jfan5/sft_models/qwen3-14b-1127"
DATASET_PATH="/jfan5/sft_data/four_scenarios500/combined.hf"

python3 pddl_finetune.py \
    --mode train \
    --model ${MODEL_NAME} \
    --output ${OUTPUT_NAME} \
    --dataset ${DATASET_PATH} \
    --per-device-train-batch-size 16 \
    --gradient-accumulation-steps 2 \
    --num-train-epochs 1 \
    --learning-rate 1e-4

