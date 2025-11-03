#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=fine_tune_mistral_delivery_pddl2.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=fine_tune_mistral_delivery_pddl2 # Specify job name

conda activate llmstl

# Model and output configuration for Mistral on delivery scenario (PDDL2)
MODEL_NAME="unsloth/mistral-7b-instruct-v0.3-bnb-4bit"
OUTPUT_NAME="sft_model/mistral_7b/delivery/pddl2"
DATASET_PATH="/home/ubuntu/data/sft/delivery/pddl2.hf"

python3 pddl_finetune.py \
  --mode train \
  --model "$MODEL_NAME" \
  --output "$OUTPUT_NAME" \
  --dataset "$DATASET_PATH" \
  --scenarios delivery



