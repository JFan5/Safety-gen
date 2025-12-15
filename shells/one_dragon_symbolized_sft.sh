#!/bin/bash

# One-dragon pipeline: generate symbolized+original mixed datasets, then fine-tune
# (1) single-domain Blocksworld and (2) cross-domain (four scenarios) on Mistral-7B.

set -euo pipefail

# Activate env and set workdir
cd /home/ubuntu/Safety-gen

echo "=== [Step 1] Generate symbolized (mixed) datasets for four scenarios ==="
bash shells/symbolized_four_scenarios_sft.sh

echo "=== [Step 2] Fine-tune Mistral-7B on Blocksworld (symbolized) ==="
bash shells/finetune_mistral_7b_blocksworld_symbolized.sh

echo "=== [Step 2.5] Evaluate Blocksworld model on testing set ==="
bash shells/evaluate_llm_blocksworld.sh /jfan5/sft_models/mistral_7b/blocksworld_pddl3_symbolized 0

echo "=== [Step 3] Fine-tune Mistral-7B on cross-domain (symbolized) ==="
bash shells/finetune_mistral_7b_cross_domain_symbolized.sh

echo "=== [Step 3.5] Evaluate cross-domain model on all scenarios ==="
bash shells/evaluate_llm_all.sh /jfan5/sft_models/mistral_7b/cross_domain_pddl3_symbolized 0

echo "=== Pipeline completed ==="
