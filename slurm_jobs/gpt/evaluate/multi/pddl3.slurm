#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_gpt_multi_pddl3.o
#SBATCH --cpus-per-task=28
#SBATCH --job-name=evaluate_gpt_multi_pddl3

conda activate llmstl

python3 script/evaluate_llm_solver.py --model /home/ubuntu/sft_models/gpt_multi_pddl3_500 --problems-dir blocksworld/all_problems3/testing --domain-file blocksworld/domain3.pddl --max-problems 50 --output blocksworld_test_results_50.json --results-dir planning_results/gpt_oss_20b/blocksworld/50

python3 script/evaluate_llm_solver.py --model /home/ubuntu/sft_models/gpt_multi_pddl3_500 --problems-dir delivery/all_problems3/testing --domain-file delivery/domain3.pddl --max-problems 50 --output delivery_test_results_50.json --results-dir planning_results/gpt_oss_20b/delivery/50

python3 script/evaluate_llm_solver.py --model /home/ubuntu/sft_models/gpt_multi_pddl3_500 --problems-dir ferry/all_problems3/testing --domain-file ferry/domain3.pddl --max-problems 50 --output ferry_test_results_50.json --results-dir planning_results/gpt_oss_20b/ferry/50

python3 script/evaluate_llm_solver.py --model /home/ubuntu/sft_models/gpt_multi_pddl3_500 --problems-dir grippers/all_problems3/testing --domain-file grippers/domain3.pddl --max-problems 50 --output grippers_test_results_50.json --results-dir planning_results/gpt_oss_20b/grippers/50

python3 script/evaluate_llm_solver.py --model /home/ubuntu/sft_models/gpt_multi_pddl3_500 --problems-dir spanner/all_problems3/testing --domain-file spanner/domain3.pddl --max-problems 50 --output spanner_test_results_50.json --results-dir planning_results/gpt_oss_20b/spanner/50

python3 script/evaluate_llm_solver.py --model /home/ubuntu/sft_models/gpt_multi_pddl3_500 --problems-dir grid/all_problems3/testing --domain-file grid/domain3.pddl --max-problems 50 --output grid_test_results_50.json --results-dir planning_results/gpt_oss_20b/grid/50

python3 script/evaluate_llm_solver.py --model /home/ubuntu/sft_models/gpt_multi_pddl3_500 --problems-dir rovers/all_problems3/testing --domain-file rovers/domain3.pddl --max-problems 50 --output rovers_test_results_pddl3.json --results-dir planning_results/gpt_oss_20b/rovers/50
