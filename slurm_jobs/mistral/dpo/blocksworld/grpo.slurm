#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/dpo_mistral_pddl3_500.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=dpo_mistral_pddl3_500 # Specify job name

set -euo pipefail

conda activate llmstl


mkdir -p "${OUTPUT_DIR}"

python3 /home/ubuntu/Safety-gen/script/train_dpo_unsloth.py \
  --base_model "/home/ubuntu/sft_models/mistral_7b/blocksworld/pddl3" \
  --dataset "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/blocksworld/pddl3/grpo.jsonl" \
  --output_dir "/home/ubuntu/dpo_models/mistral_7b/blocksworld-grpo" \
  --num_epochs 2 \
  --batch_size 2 \
  --gradient_accumulation_steps 4 \
  --learning_rate 5e-6 \
  --save_steps 60 \
  --eval_steps 60 \
  --logging_steps 10 \
  --beta 0.2 \
  --memory_efficient \
  --run_name "grpo-mistral-blocksworld-pddl3-500" \
  --dataloader_num_workers 4
