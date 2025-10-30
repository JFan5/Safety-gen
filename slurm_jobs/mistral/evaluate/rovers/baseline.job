#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_mistral_rovers.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=evaluate_mistral_rovers # Specify job name

BASE_MODEL="unsloth/mistral-7b-instruct-v0.3-bnb-4bit"

PROBLEMS_DIR="rovers/all_problems3/testing"
DOMAIN_FILE="rovers/domain3.pddl"
RESULTS_DIR="planning_results/mistral_7b/rovers/baseline"
OUTPUT_NAME="rovers_test_results.json"

python3 script/evaluate_llm_solver.py --model $BASE_MODEL --problems-dir $PROBLEMS_DIR --domain-file $DOMAIN_FILE --max-problems 100 --output $OUTPUT_NAME  --results-dir $RESULTS_DIR
