#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
DPO_ROOT="/groups/fkong/jfan5/data/dpo"

SCENARIOS=(
  blocksworld
  ferry
  grid
  grippers
  rovers
  spanner
)

VARIANTS=(pddl2 pddl3)

for scenario in "${SCENARIOS[@]}"; do
  for variant in "${VARIANTS[@]}"; do
    if [[ "${variant}" == "pddl2" ]]; then
      problems_dir="${REPO_ROOT}/${scenario}/all_problems/training"
      domain_file="${REPO_ROOT}/${scenario}/domain.pddl"
    else
      problems_dir="${REPO_ROOT}/${scenario}/all_problems3/training"
      domain_file="${REPO_ROOT}/${scenario}/domain3.pddl"
    fi

    unsloth_jsonl="${DPO_ROOT}/mistral_unsloth/${scenario}/${variant}/scored.jsonl"
    summary_path="${DPO_ROOT}/mistral_unsloth/${scenario}/${variant}/scored_summaries.json"
    output_dir="${DPO_ROOT}/datasets/${scenario}"
    output_path="${output_dir}/${variant}_dpo.jsonl"

    if [[ ! -f "${unsloth_jsonl}" ]]; then
      echo "Skip ${scenario} ${variant}: ${unsloth_jsonl} not found" >&2
      continue
    fi
    if [[ ! -d "${problems_dir}" ]]; then
      echo "Skip ${scenario} ${variant}: ${problems_dir} not found" >&2
      continue
    fi
    if [[ ! -f "${domain_file}" ]]; then
      echo "Skip ${scenario} ${variant}: ${domain_file} not found" >&2
      continue
    fi

    echo "Building scored summary for ${scenario} ${variant}"
    python "${REPO_ROOT}/script/create_scored_summaries.py" \
      --scenario "${scenario}" \
      --variant "${variant}" \
      --unsloth-jsonl "${unsloth_jsonl}" \
      --problem-dir "${problems_dir}" \
      --domain-file "${domain_file}" \
      --output "${summary_path}"

    mkdir -p "${output_dir}"

    echo "Constructing DPO dataset for ${scenario} ${variant}"
    python "${REPO_ROOT}/script/construct_dpo_dataset.py" \
      "${summary_path}" \
      --output "${output_path}" \
      --all-pairs
  done
done
