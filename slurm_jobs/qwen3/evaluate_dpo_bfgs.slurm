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
python3 script/evaluate_llm_solver.py --model /jfan5/dpo_qwen3/bfgs-variant-500 --problems-dir blocksworld/all_problems3/testing --domain-file blocksworld/domain3.pddl --max-problems 50 --output results_blocksworld_dpo_bfgs.json --results-dir planning_results/qwen3_dpo_bfgs/blocksworld/

# ferry
python3 script/evaluate_llm_solver.py --model /jfan5/dpo_qwen3/bfgs-variant-500 --problems-dir ferry/all_problems3/testing --domain-file ferry/domain3.pddl --max-problems 50 --output results_ferry_dpo_bfgs.json --results-dir planning_results/qwen3_dpo_bfgs/ferry/

# grippers
python3 script/evaluate_llm_solver.py --model /jfan5/dpo_qwen3/bfgs-variant-500 --problems-dir grippers/all_problems3/testing --domain-file grippers/domain3.pddl --max-problems 50 --output results_grippers_dpo_bfgs.json --results-dir planning_results/qwen3_dpo_bfgs/grippers/

# spanner
python3 script/evaluate_llm_solver.py --model /jfan5/dpo_qwen3/bfgs-variant-500 --problems-dir spanner/all_problems3/testing --domain-file spanner/domain3.pddl --max-problems 50 --output results_spanner_dpo_bfgs.json --results-dir planning_results/qwen3_dpo_bfgs/spanner/ --no-load-in-4bit

# # delivery
python3 script/evaluate_llm_solver.py --model /jfan5/dpo_qwen3/bfgs-variant-500 --problems-dir delivery/all_problems3/testing --domain-file delivery/domain3.pddl --max-problems 50 --output results_delivery_dpo_bfgs.json --results-dir planning_results/qwen3_dpo_bfgs/delivery/pddl3


# # rovers
python3 script/evaluate_llm_solver.py --model /jfan5/dpo_qwen3/bfgs-variant-500 --problems-dir rovers/all_problems3/testing --domain-file rovers/domain3.pddl --max-problems 50 --output planning_results/qwen3_dpo_bfgs/rovers/results_rovers_dpo_bfgs.json --results-dir planning_results/qwen3_dpo_bfgs/rovers/

# grid
python3 script/evaluate_llm_solver.py --model /jfan5/dpo_qwen3/bfgs-variant-500 --problems-dir grid/all_problems3/testing --domain-file grid/domain3.pddl --max-problems 50 --output results_grid_dpo_bfgs.json --results-dir planning_results/qwen3_dpo_bfgs/grid/


