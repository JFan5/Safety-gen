#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/sft-qwen3-four.o
#SBATCH --job-name=sft-qwen3-four # Specify job name

conda activate llmstl

python3 pddl_finetune.py --mode train --model unsloth/Qwen3-14B-unsloth-bnb-4bit --output /jfan5/sft_qwen3/bfgs-variant-500 --dataset /home/ubuntu/data/sft/bfgs-variant-500/combined.hf --per-device-train-batch-size 8 --gradient-accumulation-steps 16  --num-train-epochs 4