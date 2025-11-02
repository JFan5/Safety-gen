#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
PLANNING_ROOT="${REPO_ROOT}/planning_results"
MODEL_OUTPUT_ROOT="${PLANNING_ROOT}/aggregated_by_model"
LEGACY_OUTPUT_ROOT="${PLANNING_ROOT}/aggregated_by_scenario"
VARIANTS=(baseline pddl2 pddl3)

# 约定的模型别名 -> 真正的输出目录名称
declare -A MODEL_DIR_MAP=(
  [llama]="llama"
  [mistral]="mistral_7b"
  [qwen]="qwen3_1_7b"
)

ORDERED_MODELS=(llama mistral qwen)

rm -rf "${MODEL_OUTPUT_ROOT}"
mkdir -p "${MODEL_OUTPUT_ROOT}"
mkdir -p "${LEGACY_OUTPUT_ROOT}"

cd "${REPO_ROOT}"

for model_alias in "${ORDERED_MODELS[@]}"; do
  model_name="${MODEL_DIR_MAP[${model_alias}]:-}"
  if [[ -z "${model_name}" ]]; then
    echo "⚠️  未配置模型别名 ${model_alias} 的真实目录名称，跳过" >&2
    continue
  fi

  model_input_dir="${PLANNING_ROOT}/${model_name}"
  if [[ ! -d "${model_input_dir}" ]]; then
    echo "⚠️  未找到模型目录: ${model_input_dir}，跳过" >&2
    continue
  fi

  model_output_dir="${MODEL_OUTPUT_ROOT}/${model_alias}"
  mkdir -p "${model_output_dir}"

  for scenario_dir in "${model_input_dir}"/*; do
    if [[ ! -d "${scenario_dir}" ]]; then
      continue
    fi

    scenario_name="$(basename "${scenario_dir}")"
    scenario_output_path="${model_output_dir}/${scenario_name}_planning_results.json"

    python3 script/parse_planning_results.py \
      --planning-results-dir "${PLANNING_ROOT}" \
      --models "${model_name}" \
      --scenarios "${scenario_name}" \
      --variants "${VARIANTS[@]}" \
      --aggregate-output "${scenario_output_path}"

    legacy_output_path="${LEGACY_OUTPUT_ROOT}/${model_name}_${scenario_name}_planning_results.json"
    cp "${scenario_output_path}" "${legacy_output_path}"
  done
done
