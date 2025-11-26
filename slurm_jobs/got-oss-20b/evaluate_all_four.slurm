#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate/got-oss-20b/all_four_%j.out
#SBATCH --error=job_outputs/evaluate/got-oss-20b/all_four_%j.err
#SBATCH --cpus-per-task=28
#SBATCH --job-name=eval_got-oss-20b_all_four

set -euo pipefail

# Ensure we are at the repo root so relative paths below work
cd /home/ubuntu/Safety-gen

echo "=========================================="
echo "Starting evaluation for all four scenarios"
echo "Model path: got-oss-20b"
echo "=========================================="

# blocksworld
echo "=========================================="
echo "Starting blocksworld scenario"
echo "=========================================="
/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model "got-oss-20b" \
  --problems-dir "pddl3/blocksworld/all_problems3/testing" \
  --domain-file "pddl3/blocksworld/domain3.pddl" \
  --max-problems 50 \
  --output "blocksworld_test_results.json" \
  --results-dir "planning_results/got-oss-20b/blocksworld"

# ferry
echo "=========================================="
echo "Starting ferry scenario"
echo "=========================================="
/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model "got-oss-20b" \
  --problems-dir "pddl3/ferry/all_problems3/testing" \
  --domain-file "pddl3/ferry/domain3.pddl" \
  --max-problems 50 \
  --output "ferry_test_results.json" \
  --results-dir "planning_results/got-oss-20b/ferry"

# grippers
echo "=========================================="
echo "Starting grippers scenario"
echo "=========================================="
/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model "got-oss-20b" \
  --problems-dir "pddl3/grippers/all_problems3/testing" \
  --domain-file "pddl3/grippers/domain3.pddl" \
  --max-problems 50 \
  --output "grippers_test_results.json" \
  --results-dir "planning_results/got-oss-20b/grippers"

# spanner
echo "=========================================="
echo "Starting spanner scenario"
echo "=========================================="
/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model "got-oss-20b" \
  --problems-dir "pddl3/spanner/all_problems3/testing" \
  --domain-file "pddl3/spanner/domain3.pddl" \
  --max-problems 50 \
  --output "spanner_test_results.json" \
  --results-dir "planning_results/got-oss-20b/spanner" \
  --no-load-in-4bit

echo "=========================================="
echo "All four scenarios completed!"
echo "=========================================="

