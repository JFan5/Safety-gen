#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_dpo_qwen3_14b_multi_pddl3-500-gpt-candidate-16bit.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=evaluate_dpo_qwen3_14b_multi_pddl3-500-gpt-candidate-16bit # Specify job name

# 串行执行，每个场景一条参数实例化命令
/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model /home/ubuntu/dpo_models/qwen3_14b/multi/pddl3_500-gpt-candidate \
  --problems-dir blocksworld/all_problems3/testing \
  --domain-file blocksworld/domain3.pddl \
  --max-problems 50 \
  --output blocksworld_test_results.json \
  --results-dir planning_results/qwen3_14b-multi-dpo-pddl3-500-gpt-candidate-16bit/blocksworld/50 \
  --no-load-in-4bit

/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model /home/ubuntu/dpo_models/qwen3_14b/multi/pddl3_500-gpt-candidate \
  --problems-dir delivery/all_problems3/testing \
  --domain-file delivery/domain3.pddl \
  --max-problems 50 \
  --output delivery_test_results.json \
  --results-dir planning_results/qwen3_14b-multi-dpo-pddl3-500-gpt-candidate-16bit/delivery/50 \
  --no-load-in-4bit

/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model /home/ubuntu/dpo_models/qwen3_14b/multi/pddl3_500-gpt-candidate \
  --problems-dir ferry/all_problems3/testing \
  --domain-file ferry/domain3.pddl \
  --max-problems 50 \
  --output ferry_test_results.json \
  --results-dir planning_results/qwen3_14b-multi-dpo-pddl3-500-gpt-candidate-16bit/ferry/50 \
  --no-load-in-4bit

/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model /home/ubuntu/dpo_models/qwen3_14b/multi/pddl3_500-gpt-candidate \
  --problems-dir grippers/all_problems3/testing \
  --domain-file grippers/domain3.pddl \
  --max-problems 50 \
  --output grippers_test_results.json \
  --results-dir planning_results/qwen3_14b-multi-dpo-pddl3-500-gpt-candidate-16bit/grippers/50 \
  --no-load-in-4bit

/home/ubuntu/miniconda3/envs/llmstl/bin/python script/evaluate_llm_solver.py \
  --model /home/ubuntu/dpo_models/qwen3_14b/multi/pddl3_500-gpt-candidate \
  --problems-dir spanner/all_problems3/testing \
  --domain-file spanner/domain3.pddl \
  --max-problems 50 \
  --output spanner_test_results.json \
  --results-dir planning_results/qwen3_14b-multi-dpo-pddl3-500-gpt-candidate-16bit/spanner/50 \
  --no-load-in-4bit

