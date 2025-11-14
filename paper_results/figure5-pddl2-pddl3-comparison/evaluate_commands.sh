#!/bin/bash

# 命令1: 使用 pddl2 模型评估 blocksworld/all_problems3/testing
python ~/jfan5/Safety-gen/script/evaluate_llm_solver.py \
  --model /groups/fkong/jfan5/sft_models/mistral_7b/blocksworld/pddl2 \
  --problems-dir /users/jfan5/jfan5/Safety-gen/blocksworld/all_problems3/testing \
  --domain-file /users/jfan5/jfan5/Safety-gen/blocksworld/domain3.pddl \
  --family mistral --results-dir /users/jfan5/jfan5/Safety-gen/paper_results/figure5-pddl2-pddl3-comparison/pddl2-results --max-problems 50

# 命令2: 使用 sft-variant 模型评估 blocksworld/all_problems3/testing
python ~/jfan5/Safety-gen/script/evaluate_llm_solver.py \
  --model /groups/fkong/jfan5/sft_models/mistral_7b/blocksworld/sft-variant/ \
  --problems-dir /users/jfan5/jfan5/Safety-gen/blocksworld/all_problems3/testing \
  --domain-file /users/jfan5/jfan5/Safety-gen/blocksworld/domain3.pddl \
  --family mistral --results-dir /users/jfan5/jfan5/Safety-gen/paper_results/figure5-pddl2-pddl3-comparison/sft-variant-results --max-problems 50
