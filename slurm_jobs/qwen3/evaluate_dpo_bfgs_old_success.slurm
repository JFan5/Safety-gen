#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_qwen3_dpo_bfgs.o
#SBATCH --cpus-per-task=28
#SBATCH --job-name=evaluate_qwen3_dpo_bfgs

conda activate llmstl


# blocksworld
python3 script/evaluate_llm_solver.py --model /jfan5/dpo_qwen3/bfgs-variant-500-old-success-data --problems-dir blocksworld/all_problems3/testing --domain-file blocksworld/domain3.pddl --max-problems 50 --output results_blocksworld_dpo_bfgs_old_success_data.json --results-dir planning_results/qwen3_dpo_bfgs_old_success_data/blocksworld/

# spanner

python3 script/evaluate_llm_solver.py --model /jfan5/dpo_qwen3/bfgs-variant-500-old-success-data --problems-dir spanner/all_problems3/testing --domain-file spanner/domain3.pddl --max-problems 50 --output results_spanner_dpo_bfgs_old_success_data.json --results-dir planning_results/qwen3_dpo_bfgs_old_success_data/spanner/
