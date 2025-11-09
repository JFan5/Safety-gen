#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/dpo_mistral_multi_pddl3_500-grpo.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=dpo_mistral_multi_pddl3_500-grpo # Specify job name





/home/ubuntu/miniconda3/envs/llmstl/bin/python /home/ubuntu/Safety-gen/script/train_dpo_unsloth.py \
  --base_model "/home/ubuntu/sft_models/mistral_7b/multi_scenarios500/pddl3" \
  --dataset "data/grpo/gpt_multi_pddl3_500/multi_scenarios/pddl3_grpo.jsonl" \
  --output_dir "/home/ubuntu/dpo_models/mistral_7b/multi/pddl3_500-gpt-candidate" \
  --num_epochs 2 \
  --batch_size 2 \
  --gradient_accumulation_steps 4 \
  --learning_rate 5e-6 \
  --save_steps 60 \
  --eval_steps 60 \
  --logging_steps 10 \
  --beta 0.2 \
  --memory_efficient \
  --run_name "dpo-mistral-multi-pddl3-500-grpo" \
  --dataloader_num_workers 4
