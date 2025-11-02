#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_sft_rovers_gpt.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=evaluate_sft_rovers_gpt # Specify job name

conda activate llmstl



python3 script/evaluate_llm_solver.py --model /home/ubuntu/sft_models/gpt_oss_20b/rovers/base  --problems-dir rovers/all_problems3/testing --domain-file rovers/domain3.pddl --max-problems 100 --output rovers_test_results.json  --results-dir planning_results/gpt_oss_20b/rovers/baseline


