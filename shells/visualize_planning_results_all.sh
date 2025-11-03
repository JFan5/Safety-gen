#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
AGG_MODEL_ROOT="${REPO_ROOT}/planning_results/aggregated_by_model"
LEGACY_ROOT="${REPO_ROOT}/planning_results/aggregated_by_scenario"
PLOT_ROOT="${REPO_ROOT}/plots"

cd "${REPO_ROOT}"

shopt -s nullglob
generated=false

# 优先使用新的 aggregated_by_model 目录
if [[ -d "${AGG_MODEL_ROOT}" ]]; then
  for model_dir in "${AGG_MODEL_ROOT}"/*; do
    [[ -d "${model_dir}" ]] || continue
    model_name="$(basename "${model_dir}")"
    for json_file in "${model_dir}"/*_planning_results.json; do
      [[ -f "${json_file}" ]] || continue
      scenario_name="$(basename "${json_file}" "_planning_results.json")"
      output_dir="${PLOT_ROOT}/${model_name}/${scenario_name}"
      mkdir -p "${output_dir}"
      python3 script/visualize_planning_results.py \
        --input "${json_file}" \
        --output-dir "${output_dir}" \
        --scenarios "${scenario_name}"
      generated=true
    done
  done
fi

# 兼容旧的 aggregated_by_scenario 目录（若存在，且需要额外导出）
if [[ -d "${LEGACY_ROOT}" ]]; then
  for json_file in "${LEGACY_ROOT}"/*_planning_results.json; do
    [[ -f "${json_file}" ]] || continue
    # 读取文件内部信息以确定模型和场景名称
    readarray -t info < <(python3 - <<'PY'
import json
import sys
from pathlib import Path

path = Path(sys.argv[1])
try:
    data = json.load(path.open())
except Exception:
    sys.exit(1)

def detect(data):
    if not isinstance(data, dict):
        return None
    for key, value in data.items():
        if isinstance(value, dict) and any(isinstance(v, dict) and 'summary' in v for v in value.values()):
            return key, list(value.keys())
    return None

res = detect(data)
if res:
    model, scenarios = res
    for s in scenarios:
        print(model)
        print(s)
PY
    "${json_file}")

    # 解析 python 回传的模型/场景对
    for ((idx=0; idx<${#info[@]}; idx+=2)); do
      model_name="${info[idx]}"
      scenario_name="${info[idx+1]}"
      [[ -n "${model_name}" && -n "${scenario_name}" ]] || continue
      output_dir="${PLOT_ROOT}/${model_name}/${scenario_name}"
      mkdir -p "${output_dir}"
      python3 script/visualize_planning_results.py \
        --input "${json_file}" \
        --output-dir "${output_dir}" \
        --scenarios "${scenario_name}"
      generated=true
    done
  done
fi

shopt -u nullglob

if [[ "${generated}" = false ]]; then
  echo "⚠️  未找到可供可视化的聚合结果 JSON。" >&2
  exit 1
fi
