#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/generate_candidates_grippers_pddl2.o
#SBATCH --cpus-per-task=28
#SBATCH --job-name=generate_candidates_grippers_pddl2

conda activate llmstl

MODEL_PATH="sft_model/sft_model_pddl_sft_model/mistral_7b/grippers/pddl2"
DOMAIN_FILE="grippers/domain.pddl"
PROBLEMS_DIR="grippers/all_problems"
PROMPT_TEMPLATE="prompt_pddl2.txt"
OUTPUT_PATH="/home/ubuntu/data/dpo/mistral_7b/grippers/pddl2/scored.jsonl"

python3 script/generate_score_candidate.py \
  --model "$MODEL_PATH" \
  --family mistral \
  --domain-file "$DOMAIN_FILE" \
  --problems-dir "$PROBLEMS_DIR" \
  --prompt-template "$PROMPT_TEMPLATE" \
  --out "$OUTPUT_PATH"
