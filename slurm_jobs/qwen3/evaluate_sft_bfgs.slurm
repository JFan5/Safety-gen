#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_qwen3_multi_pddl3.o
#SBATCH --cpus-per-task=28
#SBATCH --job-name=evaluate_qwen3_multi_pddl3

conda activate llmstl

# /jfan5/sft_qwen3/bfgs-variant-500-merged
# blocksworld
python3 script/evaluate_llm_solver.py --model /jfan5/sft_qwen3/bfgs-variant-500 --problems-dir blocksworld/all_problems3/testing --domain-file blocksworld/domain3.pddl --max-problems 50 --output blocksworld_test_results_bfgs.json --results-dir planning_results/qwen3_sft_bfgs/blocksworld/

# ferry
python3 script/evaluate_llm_solver.py --model /jfan5/sft_qwen3/bfgs-variant-500 --problems-dir ferry/all_problems3/testing --domain-file ferry/domain3.pddl --max-problems 50 --output ferry_test_results_pddl3.json --results-dir planning_results/qwen3_sft_bfgs/ferry/

# grippers
python3 script/evaluate_llm_solver.py --model /jfan5/sft_qwen3/bfgs-variant-500 --problems-dir grippers/all_problems3/testing --domain-file grippers/domain3.pddl --max-problems 50 --output grippers_test_results_pddl3.json --results-dir planning_results/qwen3_sft_bfgs/grippers/

# spanner
python3 script/evaluate_llm_solver.py --model /jfan5/sft_qwen3/bfgs-variant-500 --problems-dir spanner/all_problems3/testing --domain-file spanner/domain3.pddl --max-problems 50 --output spanner_test_results_pddl3.json --results-dir planning_results/qwen3_sft_bfgs/spanner/ --no-load-in-4bit

# # delivery
python3 script/evaluate_llm_solver.py --model /jfan5/sft_qwen3/bfgs-variant-500 --problems-dir delivery/testing_problems3 --domain-file delivery/domain3.pddl --max-problems 50 --output delivery_test_results_pddl3.json --results-dir planning_results/qwen3_sft_four_scenarios500/delivery/pddl3


# # rovers
python3 script/evaluate_llm_solver.py --model /jfan5/sft_qwen3/bfgs-variant-500 --problems-dir rovers/all_problems3/testing --domain-file rovers/domain3.pddl --max-problems 50 --output rovers_test_results_pddl3.json --results-dir planning_results/qwen3_sft_bfgs/rovers/

# grid
python3 script/evaluate_llm_solver.py --model /jfan5/sft_qwen3/bfgs-variant-500 --problems-dir grid/all_problems3/testing --domain-file grid/domain3.pddl --max-problems 50 --output grid_test_results_pddl3.json --results-dir planning_results/qwen3_sft_bfgs/grid/

