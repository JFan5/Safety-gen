#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_sft_delivery.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=evaluate_sft_delivery # Specify job name

conda activate llmstl

# 生成测试问题
python3 delivery/convert_pddl3.py delivery/all_problems/testing delivery/testing_problems3

python3 script/evaluate_llm_solver.py --model /home/ubuntu/sft_models/mistral_7b/delivery/base  --problems-dir delivery/all_problems3/testing --domain-file delivery/domain3.pddl --max-problems 100 --output delivery_test_results.json  --results-dir planning_results/sft_mistral_7b/delivery/baseline
