#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_dpo_multi_pddl3-500-gpt-candidate.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=evaluate_dpo_multi_pddl3-500-gpt-candidate # Specify job name

conda activate llmstl

# Map scenario to problems dir and domain file
case "$scenario_name" in
  "blocksworld")
    PROBLEMS_DIR="blocksworld/all_problems3/testing"
    DOMAIN_FILE="blocksworld/domain3.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b-multi-dpo-pddl3-500-gpt-candidate/blocksworld/baseline"
    OUTPUT_NAME="blocksworld_test_results.json"
    ;;
  "delivery")
    PROBLEMS_DIR="delivery/all_problems3/testing"
    DOMAIN_FILE="delivery/domain3.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b-multi-dpo-pddl3-500-gpt-candidate/delivery/baseline"
    OUTPUT_NAME="delivery_test_results.json"
    ;;
  "ferry")
    PROBLEMS_DIR="ferry/all_problems3/testing"
    DOMAIN_FILE="ferry/domain3.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b-multi-dpo-pddl3-500-gpt-candidate/ferry/baseline"
    OUTPUT_NAME="ferry_test_results.json"
    ;;
  "grippers")
    PROBLEMS_DIR="grippers/all_problems3/testing"
    DOMAIN_FILE="grippers/domain3.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b-multi-dpo-pddl3-500-gpt-candidate/grippers/baseline"
    OUTPUT_NAME="grippers_test_results.json"
    ;;
  "spanner")
    PROBLEMS_DIR="spanner/all_problems3/testing"
    DOMAIN_FILE="spanner/domain3.pddl"
    RESULTS_DIR="planning_results/gpt_oss_20b-multi-dpo-pddl3-500-gpt-candidate/spanner/baseline"
    OUTPUT_NAME="spanner_test_results.json"
    ;;
  *)
    echo "Unknown scenario: $scenario_name"; exit 1
    ;;  
esac
python3 script/evaluate_llm_solver.py --model /home/ubuntu/dpo_models/gpt_oss_20b/multi/pddl3_500  --problems-dir $PROBLEMS_DIR --domain-file $DOMAIN_FILE --max-problems 50 --output $OUTPUT_NAME  --results-dir $RESULTS_DIR



