#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_qwen3_multi_pddl3.o
#SBATCH --cpus-per-task=28
#SBATCH --job-name=evaluate_qwen3_multi_pddl3

conda activate llmstl


python3 pddl_finetune.py --mode train --model /jfan5/sft_models/qwen3_14b/four_scenarios500/pddl3 --output   /jfan5/sft_models/qwen3_14b/four_scenarios500/pddl3_five --dataset /home/ubuntu/data/sft/spanner-32 --per-device-train-batch-size 4 --gradient-accumulation-steps 2 