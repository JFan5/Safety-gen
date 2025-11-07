#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_gpt_multi.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=evaluate_gpt_multi # Specify job name
#SBATCH --array=1-7 # Specify number of tasks in array (7 scenarios)

conda activate llmstl

# Define scenario configurations for evaluation
scenarios=( 
    "blocksworld"
    "delivery" 
    "ferry"
    "grippers"
    "spanner"
    "grid"
    "rovers"
)
scenario_name="${scenarios[$SLURM_ARRAY_TASK_ID-1]}"

echo "=========================================="
echo "Starting evaluation for scenario: $scenario_name"
echo "Task ID: $SLURM_ARRAY_TASK_ID"
echo "=========================================="

BASE_MODEL="unsloth/gpt-oss-20b-unsloth-bnb-4bit"

# Map scenario to problems dir and domain file
case "$scenario_name" in
  "blocksworld")
    PROBLEMS_DIR="blocksworld/all_problems3/testing"
    DOMAIN_FILE="blocksworld/domain3.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b/blocksworld/baseline"
    OUTPUT_NAME="blocksworld_test_results.json"
    ;;
  "delivery")
    PROBLEMS_DIR="delivery/all_problems3/testing"
    DOMAIN_FILE="delivery/domain3.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b/delivery/baseline"
    OUTPUT_NAME="delivery_test_results.json"
    ;;
  "ferry")
    PROBLEMS_DIR="ferry/all_problems3/testing"
    DOMAIN_FILE="ferry/domain3.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b/ferry/baseline"
    OUTPUT_NAME="ferry_test_results.json"
    ;;
  "grippers")
    PROBLEMS_DIR="grippers/all_problems3/testing"
    DOMAIN_FILE="grippers/domain3.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b/grippers/baseline"
    OUTPUT_NAME="grippers_test_results.json"
    ;;
  "spanner")
    PROBLEMS_DIR="spanner/all_problems3/testing"
    DOMAIN_FILE="spanner/domain3.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b/spanner/baseline"
    OUTPUT_NAME="spanner_test_results.json"
    ;;
  "grid")
    PROBLEMS_DIR="grid/all_problems3/testing"
    DOMAIN_FILE="grid/domain3.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b/grid/baseline"
    OUTPUT_NAME="grid_test_results.json"
    ;;
  "rovers")
    PROBLEMS_DIR="rovers/all_problems3/testing"
    DOMAIN_FILE="rovers/domain3.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b/rovers/baseline"
    OUTPUT_NAME="rovers_test_results.json"
    ;;
  *)
    echo "Unknown scenario: $scenario_name"; exit 1
    ;;  
esac

python3 script/evaluate_llm_solver.py \
  --model ${BASE_MODEL} \
  --problems-dir ${PROBLEMS_DIR} \
  --domain-file ${DOMAIN_FILE} \
  --max-problems 50 \
  --output ${OUTPUT_NAME} \
  --results-dir ${RESULTS_DIR}
