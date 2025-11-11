#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/sft-qwen3-four.o
#SBATCH --job-name=sft-qwen3-four # Specify job name

conda activate llmstl

python3 pddl_finetune.py --mode train --model unsloth/Qwen3-14B-unsloth-bnb-4bit --output /mnt/extra_disk_Jialiang/qwen3_14b/four_scenarios500/pddl3 --dataset /home/ubuntu/data/sft/four_scenarios500/pddl3.hf --scenarios all --per-device-train-batch-size 4 --gradient-accumulation-steps 2 