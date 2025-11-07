#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_dpo_multi_pddl3-500-gpt-candidate.o
#SBATCH --cpus-per-task=28
#SBATCH --job-name=evaluate_dpo_multi_pddl3-500-gpt-candidate

conda activate llmstl

python3 script/evaluate_llm_solver.py --model /home/ubuntu/dpo_models/mistral_7b/multi/pddl3_500-gpt-candidate --problems-dir blocksworld/all_problems3/testing --domain-file blocksworld/domain3.pddl --max-problems 50 --output blocksworld_dpo_test_results_50.json --results-dir planning_results/dpo_mistral_7b-multi/blocksworld/dpo-mistral-multi-pddl3-500-gpt-candidate-50

python3 script/evaluate_llm_solver.py --model /home/ubuntu/dpo_models/mistral_7b/multi/pddl3_500-gpt-candidate --problems-dir ferry/all_problems3/testing --domain-file ferry/domain3.pddl --max-problems 50 --output ferry_dpo_test_results_50.json --results-dir planning_results/dpo_mistral_7b-multi/ferry/dpo-mistral-multi-pddl3-500-gpt-candidate-50

python3 script/evaluate_llm_solver.py --model /home/ubuntu/dpo_models/mistral_7b/multi/pddl3_500-gpt-candidate --problems-dir delivery/all_problems3/testing --domain-file delivery/domain3.pddl --max-problems 50 --output delivery_dpo_test_results_50.json --results-dir planning_results/dpo_mistral_7b-multi/delivery/dpo-mistral-multi-pddl3-500-gpt-candidate-50

python3 script/evaluate_llm_solver.py --model /home/ubuntu/dpo_models/mistral_7b/multi/pddl3_500-gpt-candidate --problems-dir grid/all_problems3/testing --domain-file grid/domain3.pddl --max-problems 50 --output grid_dpo_test_results_50.json --results-dir planning_results/dpo_mistral_7b-multi/grid/dpo-mistral-multi-pddl3-500-gpt-candidate-50

python3 script/evaluate_llm_solver.py --model /home/ubuntu/dpo_models/mistral_7b/multi/pddl3_500-gpt-candidate --problems-dir grippers/all_problems3/testing --domain-file grippers/domain3.pddl --max-problems 50 --output grippers_dpo_test_results_50.json --results-dir planning_results/dpo_mistral_7b-multi/grippers/dpo-mistral-multi-pddl3-500-gpt-candidate-50

python3 script/evaluate_llm_solver.py --model /home/ubuntu/dpo_models/mistral_7b/multi/pddl3_500-gpt-candidate --problems-dir rovers/all_problems3/testing --domain-file rovers/domain3.pddl --max-problems 50 --output rovers_dpo_test_results_50.json --results-dir planning_results/dpo_mistral_7b-multi/rovers/dpo-mistral-multi-pddl3-500-gpt-candidate-50

python3 script/evaluate_llm_solver.py --model /home/ubuntu/dpo_models/mistral_7b/multi/pddl3_500-gpt-candidate --problems-dir spanner/all_problems3/testing --domain-file spanner/domain3.pddl --max-problems 50 --output spanner_dpo_test_results_50.json --results-dir planning_results/dpo_mistral_7b-multi/spanner/dpo-mistral-multi-pddl3-500-gpt-candidate-50
