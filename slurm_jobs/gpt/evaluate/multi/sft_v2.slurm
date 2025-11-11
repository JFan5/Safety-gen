#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_gpt_multi_pddl3.o
#SBATCH --cpus-per-task=28
#SBATCH --job-name=evaluate_gpt_multi_pddl3

conda activate llmstl

model_path=/home/ubuntu/sft_models/gpt_multi_pddl3_500_v2

python3 script/evaluate_llm_solver.py --model $model_path --problems-dir blocksworld/all_problems3/testing --domain-file blocksworld/domain3.pddl --max-problems 50 --output blocksworld_test_results_50.json --results-dir planning_results/sft_gpt_multi/blocksworld/50  

python3 script/evaluate_llm_solver.py --model $model_path --problems-dir delivery/all_problems3/testing --domain-file delivery/domain3.pddl --max-problems 50 --output delivery_test_results_50.json --results-dir planning_results/sft_gpt_multi/delivery/50 

python3 script/evaluate_llm_solver.py --model $model_path --problems-dir ferry/all_problems3/testing --domain-file ferry/domain3.pddl --max-problems 50 --output ferry_test_results_50.json --results-dir planning_results/sft_gpt_multi/ferry/50 

python3 script/evaluate_llm_solver.py --model $model_path --problems-dir grippers/all_problems3/testing --domain-file grippers/domain3.pddl --max-problems 50 --output grippers_test_results_50.json --results-dir planning_results/sft_gpt_multi/grippers/50 

python3 script/evaluate_llm_solver.py --model $model_path --problems-dir spanner/all_problems3/testing --domain-file spanner/domain3.pddl --max-problems 50 --output spanner_test_results_50.json --results-dir planning_results/sft_gpt_multi/spanner/50 

python3 script/evaluate_llm_solver.py --model $model_path --problems-dir /home/ubuntu/Safety-gen/grid/testing_100 --domain-file grid/domain3.pddl --max-problems 50 --output grid_test_results_50.json --results-dir planning_results/sft_gpt_multi-V2/grid/50 --no-load-in-4bit


python3 script/evaluate_llm_solver.py --model $model_path --problems-dir /home/ubuntu/Safety-gen/logistics/testing_problems3 --domain-file logistics/domain3.pddl --max-problems 50 --output logistics_test_results_50.json --results-dir planning_results/sft_gpt_multi-V2/logistics/50 --no-load-in-4bit

# python3 script/evaluate_llm_solver.py --model $model_path --problems-dir rovers/all_problems3/testing --domain-file rovers/domain3.pddl --max-problems 50 --output rovers_test_results_pddl3.json --results-dir planning_results/sft_gpt_multi/rovers/50 --no-load-in-4bit
