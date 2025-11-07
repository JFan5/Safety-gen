#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_sft_rovers_pddl3.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=evaluate_sft_rovers_pddl3 # Specify job name

conda activate llmstl

python3 script/evaluate_llm_solver.py --model /home/ubuntu/sft_models/mistral_7b/rovers/pddl3  --problems-dir rovers/all_problems3/testing --domain-file rovers/domain3.pddl --max-problems 100 --output rovers_test_results_pddl3.json  --results-dir planning_results/sft_mistral_7b/rovers/pddl3



