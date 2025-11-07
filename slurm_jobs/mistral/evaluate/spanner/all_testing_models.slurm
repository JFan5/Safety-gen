#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_spanner_all_testing_models.o
#SBATCH --cpus-per-task=28
#SBATCH --job-name=evaluate_spanner_all_testing_models

conda activate llmstl

# PDDL2 fine-tuned model
python3 script/evaluate_llm_solver.py \
  --model /home/ubuntu/sft_models/mistral_7b/spanner/pddl2 \
  --problems-dir spanner/all_problems3/testing \
  --domain-file spanner/domain3.pddl \
  --output spanner_all_testing_pddl2.json \
  --results-dir planning_results/sft_mistral_7b/spanner/pddl2

# PDDL3 fine-tuned model evaluated on PDDL2 testing set
python3 script/evaluate_llm_solver.py \
  --model /home/ubuntu/sft_models/mistral_7b/spanner/pddl3 \
  --problems-dir spanner/all_problems3/testing \
  --domain-file spanner/domain3.pddl \
  --output spanner_all_testing_pddl3.json \
  --results-dir planning_results/sft_mistral_7b/spanner/pddl3

# Baseline unsloth model
python3 script/evaluate_llm_solver.py \
  --model unsloth/mistral-7b-instruct-v0.3-bnb-4bit \
  --problems-dir spanner/all_problems3/testing \
  --domain-file spanner/domain3.pddl \
  --output spanner_all_testing_baseline.json \
  --results-dir planning_results/mistral_7b/spanner/baseline
