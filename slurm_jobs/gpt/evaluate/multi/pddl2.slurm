#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_gpt_multi_pddl2.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=evaluate_gpt_multi_pddl2 # Specify job name
#SBATCH --array=1-5 # Specify number of tasks in array (5 scenarios)

conda activate llmstl

# Define scenario configurations for evaluation (PDDL2)
scenarios=( 
    "blocksworld"
    "delivery" 
    "ferry"
    "grippers"
    "spanner"
)
scenario_name="${scenarios[$SLURM_ARRAY_TASK_ID-1]}"
MODEL_BASE_DIR="/home/ubuntu/sft_models/gpt_oss_20b"

echo "=========================================="
echo "Starting evaluation (PDDL2) for scenario: $scenario_name"
echo "Task ID: $SLURM_ARRAY_TASK_ID"
echo "=========================================="

# Map scenario to problems dir and domain file for PDDL2
case "$scenario_name" in
  "blocksworld")
    MODEL_PATH="${MODEL_BASE_DIR}/blocksworld/pddl2"
    PROBLEMS_DIR="blocksworld/all_problems3/testing"
    DOMAIN_FILE="blocksworld/domain.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b/blocksworld/pddl2"
    OUTPUT_NAME="blocksworld_test_results_pddl2.json"
    ;;
  "delivery")
    MODEL_PATH="${MODEL_BASE_DIR}/delivery/pddl2"
    PROBLEMS_DIR="delivery/all_problems3/testing"
    DOMAIN_FILE="delivery/domain.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b/delivery/pddl2"
    OUTPUT_NAME="delivery_test_results_pddl2.json"
    ;;
  "ferry")
    MODEL_PATH="${MODEL_BASE_DIR}/ferry/pddl2"
    PROBLEMS_DIR="ferry/all_problems3/testing"
    DOMAIN_FILE="ferry/domain.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b/ferry/pddl2"
    OUTPUT_NAME="ferry_test_results_pddl2.json"
    ;;
  "grippers")
    MODEL_PATH="${MODEL_BASE_DIR}/grippers/pddl2"
    PROBLEMS_DIR="grippers/all_problems3/testing"
    DOMAIN_FILE="grippers/domain.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b/grippers/pddl2"
    OUTPUT_NAME="grippers_test_results_pddl2.json"
    ;;
  "spanner")
    MODEL_PATH="${MODEL_BASE_DIR}/spanner/pddl2"
    PROBLEMS_DIR="spanner/all_problems3/testing"
    DOMAIN_FILE="spanner/domain.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b/spanner/pddl2"
    OUTPUT_NAME="spanner_test_results_pddl2.json"
    ;;
  *)
    echo "Unknown scenario: $scenario_name"; exit 1
    ;;  
esac

python3 script/evaluate_llm_solver.py \
  --model ${MODEL_PATH} \
  --problems-dir ${PROBLEMS_DIR} \
  --domain-file ${DOMAIN_FILE} \
  --max-problems 100 \
  --output ${OUTPUT_NAME} \
  --results-dir ${RESULTS_DIR}
