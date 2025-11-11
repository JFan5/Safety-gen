#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_dpo_blocksworld_pddl3-500.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=evaluate_dpo_blocksworld_pddl3-500 # Specify job name

conda activate llmstl

python3 script/evaluate_llm_solver.py --model /home/ubuntu/dpo_models/mistral_7b/blocksworld-grpo  --problems-dir blocksworld/all_problems3/testing --domain-file blocksworld/domain3.pddl --max-problems 50 --output blocksworld_dpo_test_results_pddl3.json  --results-dir planning_results/grpo_mistral-blocksworld --no-load-in-4bit


