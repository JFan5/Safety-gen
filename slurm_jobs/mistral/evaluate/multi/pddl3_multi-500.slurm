#!/bin/bash

#SBATCH --job-name=eval_mistral_multi_pddl3-500
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --ntasks=1
#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/evaluate/mistral/multi_scenarios/pddl3_multi-500_%j.out
#SBATCH --error=job_outputs/evaluate/mistral/multi_scenarios/pddl3_multi-500_%j.err

set -euo pipefail

# Ensure we are at the repo root so relative paths below work
cd /home/ubuntu/Safety-gen

MODEL_PATH="/home/ubuntu/sft_models/mistral_7b/multi_scenarios500/pddl3"

# blocksworld
echo "=========================================="
echo "Starting blocksworld scenario"
echo "=========================================="
/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model "${MODEL_PATH}" \
  --problems-dir "blocksworld/all_problems3/testing" \
  --domain-file "blocksworld/domain3.pddl" \
  --max-problems 50 \
  --output "blocksworld_multi_pddl3_50-500.json" \
  --results-dir "planning_results/sft_mistral_7b_multi/blocksworld/pddl3-500/50"

# ferry
echo "=========================================="
echo "Starting ferry scenario"
echo "=========================================="
/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model "${MODEL_PATH}" \
  --problems-dir "ferry/all_problems3/testing" \
  --domain-file "ferry/domain3.pddl" \
  --max-problems 50 \
  --output "ferry_multi_pddl3_50-500.json" \
  --results-dir "planning_results/sft_mistral_7b_multi/ferry/pddl3-500/50"

# delivery
echo "=========================================="
echo "Starting delivery scenario"
echo "=========================================="
/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model "${MODEL_PATH}" \
  --problems-dir "delivery/all_problems3/testing" \
  --domain-file "delivery/domain3.pddl" \
  --max-problems 50 \
  --output "delivery_multi_pddl3_50-500.json" \
  --results-dir "planning_results/sft_mistral_7b_multi/delivery/pddl3-500/50"

# grid
echo "=========================================="
echo "Starting grid scenario"
echo "=========================================="
/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model "${MODEL_PATH}" \
  --problems-dir "grid/all_problems3/testing" \
  --domain-file "grid/domain3.pddl" \
  --max-problems 50 \
  --output "grid_multi_pddl3_50-500.json" \
  --results-dir "planning_results/sft_mistral_7b_multi/grid/pddl3-500/50"

# grippers
echo "=========================================="
echo "Starting grippers scenario"
echo "=========================================="
/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model "${MODEL_PATH}" \
  --problems-dir "grippers/all_problems3/testing" \
  --domain-file "grippers/domain3.pddl" \
  --max-problems 50 \
  --output "grippers_multi_pddl3_50-500.json" \
  --results-dir "planning_results/sft_mistral_7b_multi/grippers/pddl3-500/50"

# rovers
echo "=========================================="
echo "Starting rovers scenario"
echo "=========================================="
/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model "${MODEL_PATH}" \
  --problems-dir "rovers/all_problems3/testing" \
  --domain-file "rovers/domain3.pddl" \
  --max-problems 50 \
  --output "rovers_multi_pddl3_50-500.json" \
  --results-dir "planning_results/sft_mistral_7b_multi/rovers/pddl3-500/50"

# spanner
echo "=========================================="
echo "Starting spanner scenario"
echo "=========================================="
/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model "${MODEL_PATH}" \
  --problems-dir "spanner/all_problems3/testing" \
  --domain-file "spanner/domain3.pddl" \
  --max-problems 50 \
  --output "spanner_multi_pddl3_50-500.json" \
  --results-dir "planning_results/sft_mistral_7b_multi/spanner/pddl3-500/50"
