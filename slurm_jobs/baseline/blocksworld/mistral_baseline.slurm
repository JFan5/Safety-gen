#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_sft_blocksworld.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=evaluate_sft_blocksworld # Specify job name

conda activate llmstl



python3 script/evaluate_llm_solver.py --model "unsloth/mistral-7b-instruct-v0.3-bnb-4bit"  --problems-dir blocksworld/all_problems3/testing --domain-file blocksworld/domain3.pddl --max-problems 50 --output blocksworld_test_results_50.json  --results-dir planning_results/sft_mistral_7b/blocksworld/baseline50


