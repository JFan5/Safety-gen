#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=gpt_multi500_pddl3_dpo_gen.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=gpt_multi500_pddl3_dpo_gen # Specify job name



# Regenerate 500-pair DPO datasets for selected scenarios using Hyperstack paths.

set -euo pipefail

SCENARIOS=(blocksworld grippers ferry spanner delivery)
PAIRS_PER_SCENARIO="${PAIRS_PER_SCENARIO:-500}"
GEN_EXTRA_ARGS=("$@")

REPO_ROOT="${HOME}/Safety-gen"
# Use the multi-scenario SFT (500) GPT model for all scenarios
MODEL_PATH="/home/ubuntu/sft_models/gpt_multi_pddl3_500"
PROBLEM_SUBPATH="dpo_training"
UNSLOTH_ROOT="${HOME}/data/dpo/gpt_unsloth"
DATASET_ROOT="${HOME}/data/dpo/gpt_oss_20b"

mkdir -p "${UNSLOTH_ROOT}" "${DATASET_ROOT}"

for scenario in "${SCENARIOS[@]}"; do
    model_path="${MODEL_PATH}"
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
