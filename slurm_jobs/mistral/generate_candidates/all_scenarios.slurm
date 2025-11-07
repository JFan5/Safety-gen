#!/bin/bash

#SBATCH --mail-user=fjl2401@gmail.com
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/generate_candidates_all_scenarios.o
#SBATCH --cpus-per-task=28
#SBATCH --job-name=generate_candidates_all_scenarios

set -euo pipefail

conda activate llmstl

SCENARIOS=(
  blocksworld
  grid
  rovers
  spanner
  ferry
  grippers
)

for scenario in "${SCENARIOS[@]}"; do
  echo ">>> Generating DPO candidates for ${scenario} (PDDL2)"
  mkdir -p "/home/ubuntu/data/dpo/mistral_7b/${scenario}/pddl2"
  python3 script/generate_score_candidate.py \
    --model "sft_model/mistral_7b/${scenario}/pddl2" \
    --family mistral \
    --domain-file "${scenario}/domain.pddl" \
    --problems-dir "${scenario}/all_problems" \
    --prompt-template "prompt_pddl2.txt" \
    --out "/home/ubuntu/data/dpo/mistral_7b/${scenario}/pddl2/scored.jsonl"

  echo ">>> Generating DPO candidates for ${scenario} (PDDL3)"
  mkdir -p "/home/ubuntu/data/dpo/mistral_7b/${scenario}/pddl3"
  python3 script/generate_score_candidate.py \
    --model "sft_model/mistral_7b/${scenario}/pddl3" \
    --family mistral \
    --domain-file "${scenario}/domain3.pddl" \
    --problems-dir "${scenario}/all_problems3" \
    --prompt-template "prompt_pddl3.txt" \
    --out "/home/ubuntu/data/dpo/mistral_7b/${scenario}/pddl3/scored.jsonl"
done

echo "All scenarios processed."

