#!/bin/bash

# Pipeline to regenerate a 500-sample Blocksworld DPO dataset using the local fine-tuned model.

set -euo pipefail

MODEL_PATH="/users/jfan5/jfan5/Safety-gen/sft_models/mistral_7b/blocksworld/pddl3"
GEN_EXTRA_ARGS=("$@")

mkdir -p \
    "/users/jfan5/jfan5/Safety-gen/data/dpo/mistral_unsloth/blocksworld/pddl3" \
    "/users/jfan5/jfan5/Safety-gen/data/dpo/datasets/blocksworld"

echo "[1/4] Generating scored candidates -> /users/jfan5/jfan5/Safety-gen/data/dpo/mistral_unsloth/blocksworld/pddl3/scored.jsonl"
python "/users/jfan5/jfan5/Safety-gen/script/generate_score_candidate.py" \
    --model "${MODEL_PATH}" \
    --domain-file "/users/jfan5/jfan5/Safety-gen/blocksworld/domain3.pddl" \
    --problems-dir "/users/jfan5/jfan5/Safety-gen/blocksworld/all_problems3/training" \
    --out "/users/jfan5/jfan5/Safety-gen/data/dpo/mistral_unsloth/blocksworld/pddl3/scored.jsonl" \
    --temperatures 0.6 0.9 \
    --top-p 0.9 \
    --top-k 50 \
    "${GEN_EXTRA_ARGS[@]}"

echo "[2/4] Building scored summary -> /users/jfan5/jfan5/Safety-gen/data/dpo/mistral_unsloth/blocksworld/pddl3/scored_summaries.json"
python "/users/jfan5/jfan5/Safety-gen/script/create_scored_summaries.py" \
    --scenario "blocksworld" \
    --variant "pddl3" \
    --unsloth-jsonl "/users/jfan5/jfan5/Safety-gen/data/dpo/mistral_unsloth/blocksworld/pddl3/scored.jsonl" \
    --problem-dir "/users/jfan5/jfan5/Safety-gen/blocksworld/all_problems3/training" \
    --domain-file "/users/jfan5/jfan5/Safety-gen/blocksworld/domain3.pddl" \
    --output "/users/jfan5/jfan5/Safety-gen/data/dpo/mistral_unsloth/blocksworld/pddl3/scored_summaries.json"

echo "[3/4] Constructing full DPO dataset -> /users/jfan5/jfan5/Safety-gen/data/dpo/datasets/blocksworld/pddl3_dpo.jsonl"
python "/users/jfan5/jfan5/Safety-gen/script/construct_dpo_dataset.py" \
    "/users/jfan5/jfan5/Safety-gen/data/dpo/mistral_unsloth/blocksworld/pddl3/scored_summaries.json" \
    --output "/users/jfan5/jfan5/Safety-gen/data/dpo/datasets/blocksworld/pddl3_dpo.jsonl" \
    --all-pairs

echo "[4/4] Sampling 500 Blocksworld pairs -> /users/jfan5/jfan5/Safety-gen/data/dpo/datasets/blocksworld/pddl3_dpo-500.jsonl"
python "/users/jfan5/jfan5/Safety-gen/pick_dpo_data.py" \
    --datasets-dir "/users/jfan5/jfan5/Safety-gen/data/dpo/datasets" \
    --scenarios "blocksworld" \
    --per-scenario 500 \
    --allow-fewer \
    --output "/users/jfan5/jfan5/Safety-gen/data/dpo/datasets/blocksworld/pddl3_dpo-500.jsonl"

echo "Done. DPO-500 dataset written to /users/jfan5/jfan5/Safety-gen/data/dpo/datasets/blocksworld/pddl3_dpo-500.jsonl"
