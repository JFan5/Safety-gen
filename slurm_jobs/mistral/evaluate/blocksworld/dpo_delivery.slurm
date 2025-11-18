#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=job_outputs/evaluate_dpo_blocksworld_pddl3-500.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=evaluate_dpo_blocksworld_pddl3-500 # Specify job name

conda activate llmstl


python3 script/evaluate_llm_solver.py --model /jfan5/dpo_models/mistral_7b/blocksworld/dpo-variant_v3  --problems-dir /home/ubuntu/Safety-gen/delivery/testing_problems3 --domain-file delivery/domain3.pddl --max-problems 50 --output blocksworld_dpo_test_delivery.json  --results-dir planning_results/mistral-7b-dpo-blocksworld-dpo-variant-v3/


# unsloth
python3 script/evaluate_llm_solver.py --model /jfan5/dpo_models/mistral_7b/blocksworld/dpo-variant-unsloth  --problems-dir blocksworld/all_problems3/testing --domain-file blocksworld/domain3.pddl --max-problems 50 --output blocksworld_dpo_test_results_pddl3_unsloth.json  --results-dir planning_results/mistral-7b-dpo-blocksworld-dpo-variant-unsloth/


