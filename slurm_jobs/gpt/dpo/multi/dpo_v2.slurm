#!/bin/bash

set -euo pipefail

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/dpo_gpt_pddl3_500-multi.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=dpo_gpt_pddl3_500-multi # Specify job name

# Initialize conda inside the non-interactive Slurm shell.
source /home/ubuntu/miniconda3/etc/profile.d/conda.sh
conda activate llmstl

OUTPUT_DIR="/home/ubuntu/dpo_models/gpt_oss_20b/multi/pddl3_500_v2"
mkdir -p "${OUTPUT_DIR}"

python3 /home/ubuntu/Safety-gen/script/train_dpo_unsloth.py \
  --base_model "/home/ubuntu/sft_models/gpt_multi_pddl3_500_v2" \
  --dataset "/home/ubuntu/data/dpo/gpt_oss_20b/multi/pddl3_dpo_multi-500.jsonl" \
  --output_dir "${OUTPUT_DIR}" \
  --num_epochs 2 \
  --batch_size 2 \
  --gradient_accumulation_steps 4 \
  --learning_rate 5e-6 \
  --save_steps 60 \
  --eval_steps 60 \
  --logging_steps 10 \
  --beta 0.2 \
  --memory_efficient \
  --run_name "dpo-gpt-oss-20b-multi-pddl3-500-stable" \
  --dataloader_num_workers 4
