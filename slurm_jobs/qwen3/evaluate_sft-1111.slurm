#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_qwen3_multi_pddl3.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=evaluate_qwen3_multi_pddl3 # Specify job name


conda activate llmstl

BASE_MODEL="/home/ubuntu/sft_models/qwen3_multi_pddl3_500-1111"

# blocksworld
python3 script/evaluate_llm_solver.py --model /home/ubuntu/Safety-gen/sft_models/Qwen3-14B/multi_pddl3_500/pddl3/ --problems-dir blocksworld/all_problems3/testing --domain-file blocksworld/domain3.pddl --max-problems 50 --output blocksworld_test_results_pddl3.json --results-dir planning_results/sft-qwen3-multi-pddl3/blocksworld/pddl3 


# delivery
python3 script/evaluate_llm_solver.py --model /home/ubuntu/Safety-gen/sft_models/Qwen3-14B/multi_pddl3_500/pddl3/ --problems-dir delivery/all_problems3/testing --domain-file delivery/domain3.pddl --max-problems 50 --output delivery_test_results_pddl3.json --results-dir planning_results/sft-qwen3-multi-pddl3/delivery/pddl3 

# ferry
python3 script/evaluate_llm_solver.py --model /home/ubuntu/Safety-gen/sft_models/Qwen3-14B/multi_pddl3_500/pddl3/ --problems-dir ferry/all_problems3/testing --domain-file ferry/domain3.pddl --max-problems 50 --output ferry_test_results_pddl3.json --results-dir planning_results/sft-qwen3-multi-pddl3/ferry/pddl3

# grippers
python3 script/evaluate_llm_solver.py --model /home/ubuntu/Safety-gen/sft_models/Qwen3-14B/multi_pddl3_500/pddl3/ --problems-dir grippers/all_problems3/testing --domain-file grippers/domain3.pddl --max-problems 50 --output grippers_test_results_pddl3.json --results-dir planning_results/sft-qwen3-multi-pddl3/grippers/pddl3

# spanner
python3 script/evaluate_llm_solver.py --model /home/ubuntu/sft_models/qwen3_multi_pddl3_500-1111 --problems-dir spanner/all_problems3/testing --domain-file spanner/domain3.pddl --max-problems 50 --output spanner_test_results_pddl3.json --results-dir planning_results/sft-qwen3-1111/spanner/pddl3 


# grid
python3 script/evaluate_llm_solver.py --model /home/ubuntu/sft_models/qwen3_multi_pddl3_500-1111 --problems-dir grid/testing_100 --domain-file grid/domain3.pddl --max-problems 10 --output grid_test_results_pddl3.json --results-dir planning_results/sft-qwen3-1111/grid/pddl3 
