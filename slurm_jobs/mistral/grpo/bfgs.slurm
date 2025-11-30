#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --output=job_outputs/grpo/mistral/spanner/grpo.o
#SBATCH --job-name=grpo_mistral_spanner_grpo-only

conda activate llmstl

# 单GPU配置
export CUDA_VISIBLE_DEVICES=0



# 直接运行训练脚本，不使用 accelerate
python /home/ubuntu/Safety-gen/script/train_grpo_unsloth.py \
  --base_model /jfan5/sft_mistral-bfgs-v1 \
  --dataset /jfan5/ppo_data/all_scenarios.jsonl \
  --output_dir /jfan5/grpo_models/mistral_bfgs\
  --num_epochs 1.0 \
  --batch_size 16 \
  --gradient_accumulation_steps 2 \
  --learning_rate 5e-6 \
  --num_generations 2 \
  --temperature 0.8 \
  --top_p 0.9 \
  --logging_steps 20 \
  --save_steps 1000 \
  --wandb_project pddl-grpo-mistral7b \
  --run_name grpo_mistral_bfgs_grpo



