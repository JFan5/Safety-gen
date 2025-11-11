#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_dpo_qwen3_14b_multi_pddl3-500-gpt-candidate.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=evaluate_dpo_qwen3_14b_multi_pddl3-500-gpt-candidate # Specify job name

# 串行执行，每个场景一条参数实例化命令
/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model /home/ubuntu/dpo_models/qwen3_14b/multi/pddl3_500-gpt-candidate \
  --problems-dir /home/ubuntu/Safety-gen/grid/testing_100 \
  --domain-file grid/domain3.pddl \
  --max-problems 50 \
  --output grid_test_results.json \
  --results-dir planning_results/qwen3_dpo_grid

