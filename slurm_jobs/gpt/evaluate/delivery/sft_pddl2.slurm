#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_sft_delivery_pddl2_gpt.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=evaluate_sft_delivery_pddl2_gpt # Specify job name

conda activate llmstl

python3 script/evaluate_llm_solver.py --model /home/ubuntu/sft_models/gpt_oss_20b/delivery/pddl2  --problems-dir delivery/all_problems3/testing --domain-file delivery/domain.pddl --max-problems 100 --output delivery_test_results_pddl2.json  --results-dir planning_results/gpt_oss_20b/delivery/pddl2



