#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_gpt_multi_pddl3.o
#SBATCH --cpus-per-task=28
#SBATCH --job-name=evaluate_gpt_multi_pddl3

conda activate llmstl

model_path=/jfan5/sft_gpt/bfgs-variant-500

python3 script/evaluate_llm_solver.py --model $model_path --problems-dir blocksworld/all_problems3/testing --domain-file blocksworld/domain3.pddl --max-problems 50 --output blocksworld_test_results_50.json --results-dir planning_results/sft_gpt-bfgs-variant-500/blocksworld

python3 script/evaluate_llm_solver.py --model $model_path --problems-dir delivery/all_problems3/testing --domain-file delivery/domain3.pddl --max-problems 50 --output delivery_test_results_50.json --results-dir planning_results/sft_gpt-bfgs-variant-500/delivery/50 

python3 script/evaluate_llm_solver.py --model $model_path --problems-dir ferry/all_problems3/testing --domain-file ferry/domain3.pddl --max-problems 50 --output ferry_test_results_50.json --results-dir planning_results/sft_gpt-bfgs-variant-500/ferry/50 

python3 script/evaluate_llm_solver.py --model $model_path --problems-dir grippers/all_problems3/testing --domain-file grippers/domain3.pddl --max-problems 50 --output grippers_test_results_50.json --results-dir planning_results/sft_gpt-bfgs-variant-500/grippers/50 

python3 script/evaluate_llm_solver.py --model $model_path --problems-dir spanner/all_problems3/testing --domain-file spanner/domain3.pddl --max-problems 50 --output spanner_test_results_50.json --results-dir planning_results/sft_gpt-bfgs-variant-500/spanner