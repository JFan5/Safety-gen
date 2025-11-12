#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/sft-mistral-bfgs.o
#SBATCH --job-name=sft-mistral-bfgs # Specify job name

conda activate llmstl

python3 pddl_finetune.py --mode train --model unsloth/mistral-7b-instruct-v0.3-bnb-4bit --output /jfan5/sft_mistral-bfgs --dataset /home/ubuntu/data/sft/bfgs-variant-500/combined.hf  --per-device-train-batch-size 8 --gradient-accumulation-steps 16  --num-train-epochs 4