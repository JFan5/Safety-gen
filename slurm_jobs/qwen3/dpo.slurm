#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/dpo_qwen3_14b_multi_pddl3_500-gpt-candidate.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=dpo_qwen3_14b_multi_pddl3_500-gpt-candidate # Specify job name
conda activate llmstl

OUTPUT_DIR="/home/ubuntu/dpo_models/qwen3_14b/multi/pddl3_500-gpt-candidate-2"
mkdir -p "${OUTPUT_DIR}"

python3 /home/ubuntu/Safety-gen/script/train_dpo_unsloth.py \
  --base_model "/jfan5/sft_models/qwen3-14b-1127" \
  --dataset "/home/ubuntu/Safety-gen/data/dpo/gpt_oss_20b/multi/qwen3-dpo-success.jsonl" \
  --output_dir "${OUTPUT_DIR}" \
  --num_epochs 2 \
  --batch_size 2 \
  --gradient_accumulation_steps 4 \
  --learning_rate 5e-6 \
  --save_steps 60 \
  --eval_steps 60 \
  --logging_steps 10 \
  --beta 0.2 \
  --run_name "dpo-qwen3-14b-multi-pddl3-500-gpt-candidate-2" \
  --dataloader_num_workers 4
