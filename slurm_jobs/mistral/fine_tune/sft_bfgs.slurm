#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/sft-mistral-bfgs.o
#SBATCH --job-name=sft-mistral-bfgs # Specify job name

conda activate llmstl

python3 pddl_finetune.py --mode train --model unsloth/mistral-7b-instruct-v0.3-bnb-4bit --output /jfan5/sft_mistral-bfgs-v1 --dataset /home/ubuntu/data/sft/blocksworld-variant-500/pddl3.hf  --per-device-train-batch-size 16 --gradient-accumulation-steps 2  --num-train-epochs 1 --lora-r 4 --lora-alpha 8 --lora-dropout 0.1