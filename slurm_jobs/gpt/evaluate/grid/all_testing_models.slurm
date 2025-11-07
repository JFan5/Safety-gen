#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_grid_all_testing_models_gpt.o
#SBATCH --cpus-per-task=28
#SBATCH --job-name=evaluate_grid_all_testing_models_gpt

conda activate llmstl

# PDDL2 fine-tuned model
python3 script/evaluate_llm_solver.py \
  --model /home/ubuntu/sft_models/gpt_oss_20b/grid/pddl2 \
  --problems-dir grid/all_problems3/testing \
  --domain-file grid/domain3.pddl \
  --output grid_all_testing_pddl2.json \
  --results-dir planning_results/gpt_oss_20b/grid/pddl2

# PDDL3 fine-tuned model evaluated on PDDL2 testing set
python3 script/evaluate_llm_solver.py \
  --model /home/ubuntu/sft_models/gpt_oss_20b/grid/pddl3 \
  --problems-dir grid/all_problems3/testing \
  --domain-file grid/domain3.pddl \
  --output grid_all_testing_pddl3.json \
  --results-dir planning_results/gpt_oss_20b/grid/pddl3

# Baseline unsloth model
python3 script/evaluate_llm_solver.py \
  --model unsloth/gpt-oss-20b-unsloth-bnb-4bit \
  --problems-dir grid/all_problems3/testing \
  --domain-file grid/domain3.pddl \
  --output grid_all_testing_baseline.json \
  --results-dir planning_results/gpt_oss_20b/grid/baseline
