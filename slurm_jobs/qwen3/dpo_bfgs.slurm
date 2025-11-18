#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/dpo_qwen3_14b_multi_pddl3_500-gpt-candidate.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=dpo_qwen3_14b_multi_pddl3_500-gpt-candidate # Specify job name
conda activate llmstl

python3 /home/ubuntu/Safety-gen/script/train_dpo_unsloth.py \
  --base_model "/jfan5/sft_qwen3/bfgs-variant-500" \
  --dataset "/home/ubuntu/Safety-gen/data/dpo/new_four/blocksworld_pddl3_dpo.jsonl" \
  --output_dir "/jfan5/dpo_qwen3/bfgs-variant-500-v3" \
  --num_epochs 1 \
  --batch_size 8 \
  --gradient_accumulation_steps 4 \
  --learning_rate 5e-6 \
  --beta 0.03 \
  --lora_r 16 \
  --lora_alpha 32 \
  --lora_dropout 0.1 \
  --save_steps 30 \
  --eval_steps 30 \
  --logging_steps 10 \
  --run_name "dpo-qwen3-bfgs-v3" \
  --dataloader_num_workers 16


