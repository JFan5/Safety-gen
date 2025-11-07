#!/bin/bash

# Regenerate 500-pair DPO datasets for selected scenarios using Hyperstack paths.

set -euo pipefail

SCENARIOS=(blocksworld grippers ferry spanner)
PAIRS_PER_SCENARIO="${PAIRS_PER_SCENARIO:-500}"
GEN_EXTRA_ARGS=("$@")

REPO_ROOT="${HOME}/Safety-gen"
MODEL_ROOT="${REPO_ROOT}/sft_models/mistral_7b"
PROBLEM_SUBPATH="all_problems3/training"
UNSLOTH_ROOT="${HOME}/data/dpo/mistral_unsloth"
DATASET_ROOT="${HOME}/data/dpo/datasets"

mkdir -p "${UNSLOTH_ROOT}" "${DATASET_ROOT}"

for scenario in "${SCENARIOS[@]}"; do
    model_path="${MODEL_ROOT}/${scenario}/pddl3"
    domain_file="${REPO_ROOT}/${scenario}/domain3.pddl"
    problems_dir="${REPO_ROOT}/${scenario}/${PROBLEM_SUBPATH}"
    scenario_unsloth_dir="${UNSLOTH_ROOT}/${scenario}/pddl3"
    scenario_dataset_dir="${DATASET_ROOT}/${scenario}"
    scored_path="${scenario_unsloth_dir}/scored.jsonl"
    scored_summary_path="${scenario_unsloth_dir}/scored_summaries.json"
    full_dataset_path="${scenario_dataset_dir}/pddl3_dpo.jsonl"
    sampled_dataset_path="${scenario_dataset_dir}/pddl3_dpo-${PAIRS_PER_SCENARIO}.jsonl"

    mkdir -p "${scenario_unsloth_dir}" "${scenario_dataset_dir}"

    echo "=== ${scenario}: generating scored candidates -> ${scored_path}"
    python3 "${REPO_ROOT}/script/generate_score_candidate.py" \
        --model "${model_path}" \
        --domain-file "${domain_file}" \
        --problems-dir "${problems_dir}" \
        --out "${scored_path}" \
        --temperatures 0.6 0.9 \
        --top-p 0.9 \
        --top-k 50 \
        "${GEN_EXTRA_ARGS[@]}"

    echo "=== ${scenario}: creating scored summaries -> ${scored_summary_path}"
    python3 "${REPO_ROOT}/script/create_scored_summaries.py" \
        --scenario "${scenario}" \
        --variant "pddl3" \
        --unsloth-jsonl "${scored_path}" \
        --problem-dir "${problems_dir}" \
        --domain-file "${domain_file}" \
        --output "${scored_summary_path}"

    echo "=== ${scenario}: constructing DPO dataset -> ${full_dataset_path}"
    python3 "${REPO_ROOT}/script/construct_dpo_dataset.py" \
        "${scored_summary_path}" \
        --output "${full_dataset_path}" \
        --all-pairs

    echo "=== ${scenario}: sampling ${PAIRS_PER_SCENARIO} pairs -> ${sampled_dataset_path}"
    python3 "${REPO_ROOT}/pick_dpo_data.py" \
        --datasets-dir "${DATASET_ROOT}" \
        --scenarios "${scenario}" \
        --per-scenario "${PAIRS_PER_SCENARIO}" \
        --allow-fewer \
        --output "${sampled_dataset_path}"
done

echo "Done. DPO datasets available under ${DATASET_ROOT}"
