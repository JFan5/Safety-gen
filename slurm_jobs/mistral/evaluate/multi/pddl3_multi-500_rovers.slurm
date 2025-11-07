#!/bin/bash

#SBATCH --job-name=eval_mistral_multi_pddl3-500_rovers
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --ntasks=1
#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/evaluate/mistral/multi_scenarios/pddl3_multi-500_rovers_%j.out
#SBATCH --error=job_outputs/evaluate/mistral/multi_scenarios/pddl3_multi-500_rovers_%j.err

set -euo pipefail

# Ensure we are at the repo root so relative paths below work
cd /home/ubuntu/Safety-gen

MODEL_PATH="/home/ubuntu/sft_models/mistral_7b/multi_scenarios500/pddl3"
PROBLEMS_DIR="rovers/all_problems3/testing"
DOMAIN_FILE="rovers/domain3.pddl"
RESULTS_DIR="planning_results/sft_mistral_7b_multi/rovers/pddl3-500/50"
OUTPUT_NAME="rovers_multi_pddl3_50-500.json"

echo "=========================================="
echo "Model path: ${MODEL_PATH}"
echo "Scenario: rovers"
echo "Problems dir: ${PROBLEMS_DIR}"
echo "Domain file: ${DOMAIN_FILE}"
echo "Results dir: ${RESULTS_DIR}"
echo "=========================================="

/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model "${MODEL_PATH}" \
  --problems-dir "${PROBLEMS_DIR}" \
  --domain-file "${DOMAIN_FILE}" \
  --max-problems 50 \
  --output "${OUTPUT_NAME}" \
  --results-dir "${RESULTS_DIR}"

