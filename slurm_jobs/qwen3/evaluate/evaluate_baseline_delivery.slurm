#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_qwen3_dpo_bfgs.o
#SBATCH --cpus-per-task=28
#SBATCH --job-name=evaluate_qwen3_dpo_bfgs

conda activate llmstl

BASE_MODEL="unsloth/Qwen3-14B-unsloth-bnb-4bit"

PROBLEMS_DIR="delivery/testing_problems3"
DOMAIN_FILE="delivery/domain3.pddl"
RESULTS_DIR="planning_results/Qwen3-14B-unsloth-bnb-4bit/delivery"
OUTPUT_NAME="delivery_test_results.json"

python3 script/evaluate_llm_solver.py --model $BASE_MODEL --problems-dir $PROBLEMS_DIR --domain-file $DOMAIN_FILE --max-problems 50 --output $OUTPUT_NAME  --results-dir $RESULTS_DIR

