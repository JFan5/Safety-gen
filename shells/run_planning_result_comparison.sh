#!/usr/bin/env bash
set -euo pipefail

# This script rebuilds a temporary planning_results directory that aligns the desired
# baseline/pddl3 pairs for downstream aggregation and visualization. Scenario directories
# are prefixed with the model name so downstream plots clearly indicate which model they
# belong to.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

PARSER_SCRIPT="/users/jfan5/jfan5/Safety-gen/script/parse_planning_results.py"
VISUALIZER_SCRIPT="/users/jfan5/jfan5/Safety-gen/script/visualize_planning_results.py"

if [[ ! -f "${PARSER_SCRIPT}" ]]; then
  PARSER_SCRIPT="${REPO_ROOT}/script/parse_planning_results.py"
fi

if [[ ! -f "${VISUALIZER_SCRIPT}" ]]; then
  VISUALIZER_SCRIPT="${REPO_ROOT}/script/visualize_planning_results.py"
fi

OUTPUT_JSON="${REPO_ROOT}/comparsion_results/planning_results_aggregated_baseline_vs_pddl3.json"
PLOTS_DIR="${REPO_ROOT}/plots/baseline_vs_pddl3"

mkdir -p "$(dirname "${OUTPUT_JSON}")" "${PLOTS_DIR}"

temp_root="$(mktemp -d)"
cleanup() {
  rm -rf "${temp_root}"
}
trap cleanup EXIT

shopt -s nullglob

declare -a MODEL_CONFIGS=(
  "gpt_oss_20b|${REPO_ROOT}/planning_results/gpt_oss_20b|baseline-30|${REPO_ROOT}/planning_results/gpt_oss_20b-500|pddl3"
  "mistral_7b|${REPO_ROOT}/planning_results/mistral_7b|baseline-30|${REPO_ROOT}/planning_results/sft_mistral_7b_multi|pddl3-500"
  "Qwen3-14B|${REPO_ROOT}/planning_results/Qwen3-14B|baseline|${REPO_ROOT}/planning_results/sft_llama_multi|pddl3"
)

printf 'Temporary planning_results root: %s\n' "${temp_root}"

for config in "${MODEL_CONFIGS[@]}"; do
  IFS="|" read -r MODEL BASE_ROOT BASE_VARIANT PDDL3_ROOT PDDL3_VARIANT <<< "${config}"
  printf '\nPreparing model %s\n' "${MODEL}"

  declare -A added=()
  for scenario_dir in "${BASE_ROOT}"/* "${PDDL3_ROOT}"/*; do
    [[ -d "${scenario_dir}" ]] || continue
    scenario="$(basename "${scenario_dir}")"
    [[ -n "${scenario}" ]] || continue
    if [[ -v "added[${scenario}]" ]]; then
      continue
    fi
    added["${scenario}"]=1

    scenario_label="${MODEL}__${scenario}"
    dest_dir="${temp_root}/${MODEL}/${scenario_label}"
    mkdir -p "${dest_dir}"

    baseline_src="${BASE_ROOT}/${scenario}/${BASE_VARIANT}"
    pddl3_src="${PDDL3_ROOT}/${scenario}/${PDDL3_VARIANT}"

    variants=()

    if [[ -d "${baseline_src}" ]]; then
      ln -s "${baseline_src}" "${dest_dir}/baseline"
      variants+=("baseline")
    fi

    if [[ -d "${pddl3_src}" ]]; then
      ln -s "${pddl3_src}" "${dest_dir}/pddl3"
      variants+=("pddl3")
    fi

    if [[ ${#variants[@]} -eq 0 ]]; then
      rmdir "${dest_dir}"
      continue
    fi

    printf '  %s (%s) -> %s\n' "${scenario_label}" "${scenario}" "$(IFS=','; echo "${variants[*]}")"
  done

  if [[ ! -d "${temp_root}/${MODEL}" ]]; then
    printf '  [warning] no scenarios found for %s\n' "${MODEL}"
  fi
  unset added
done

printf '\nAggregating results...\n'
python "${PARSER_SCRIPT}" \
  --planning-results-dir "${temp_root}" \
  --aggregate-output "${OUTPUT_JSON}"

printf '\nGenerating plots...\n'
python "${VISUALIZER_SCRIPT}" \
  --input "${OUTPUT_JSON}" \
  --output-dir "${PLOTS_DIR}"

printf '\nDone.\nAggregated JSON: %s\nPlots directory: %s\n' "${OUTPUT_JSON}" "${PLOTS_DIR}"
