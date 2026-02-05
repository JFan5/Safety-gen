#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=job_outputs/dpo_qwen3-14b_1205.o
#SBATCH --job-name=dpo_qwen-14b_1205


conda activate llmstl

OUTPUT_DIR="/jfan5/dpo_models/qwen3-14b-1205"
mkdir -p "${OUTPUT_DIR}"

python3 /home/ubuntu/Safety-gen/script/train_dpo_unsloth.py \
  --base_model "/jfan5/sft_models/qwen3-14b-1127" \
  --dataset "/jfan5/data/dpo/success_gpt_data/pddl3_dpo.jsonl" \
  --output_dir "${OUTPUT_DIR}" \
  --num_epochs 1 \
  --batch_size 4 \
  --gradient_accumulation_steps 4 \
  --learning_rate 2e-6 \
  --save_steps 60 \
  --eval_steps 60 \
  --logging_steps 10 \
  --beta 0.02 \
  --run_name "dpo-qwen3-14b-1205" \
  --dataloader_num_workers 4
