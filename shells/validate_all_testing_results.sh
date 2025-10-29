#!/usr/bin/env bash

# Validate solution sets for each scenario and result variant.
set -euo pipefail

# Allow overriding the Python interpreter: PYTHON_BIN=python ./validate_all_testing_results.sh
PYTHON_BIN="${PYTHON_BIN:-python3}"

SCENARIOS=(blocksworld ferry grid rovers spanner)
RESULT_VARIANTS=(pddl2 pddl3 baseline)

for scenario in "${SCENARIOS[@]}"; do
  domain="${scenario}/domain3.pddl"
  problems_dir="${scenario}/all_problems3/testing"

  if [[ ! -f "${domain}" ]]; then
    echo "[skip] ${scenario}: missing domain file ${domain}" >&2
    continue
  fi

  if [[ ! -d "${problems_dir}" ]]; then
    echo "[skip] ${scenario}: missing problems dir ${problems_dir}" >&2
    continue
  fi

  echo "================================================================"
  echo "Scenario: ${scenario}"
  echo "Domain: ${domain}"
  echo "Problems dir: ${problems_dir}"
  echo "================================================================"

  for variant in "${RESULT_VARIANTS[@]}"; do
    case "${variant}" in
      pddl2)
        solutions_dir="planning_results/${scenario}_pddl2_all_testing"
        output_file="${solutions_dir}/${scenario}_all_testing_pddl2.json"
        ;;
      pddl3)
        solutions_dir="planning_results/${scenario}_pddl3_all_testing"
        output_file="${solutions_dir}/${scenario}_all_testing_pddl3.json"
        ;;
      baseline)
        solutions_dir="planning_results/${scenario}_baseline_all_testing"
        output_file="${solutions_dir}/${scenario}_all_testing_baseline.json"
        ;;
      *)
        echo "[skip] ${scenario}: unknown result variant ${variant}" >&2
        continue
        ;;
    esac

    if [[ ! -d "${solutions_dir}" ]]; then
      echo "[skip] ${scenario} (${variant}): solutions dir not found: ${solutions_dir}" >&2
      continue
    fi

    if ! compgen -G "${solutions_dir}/*.soln" > /dev/null; then
      echo "[skip] ${scenario} (${variant}): no .soln files found in ${solutions_dir}" >&2
      continue
    fi

    echo "Validating ${scenario} (${variant})"
    "${PYTHON_BIN}" script/validate_classical_solvers.py \
      --domain "${domain}" \
      --problems_dir "${problems_dir}" \
      --solutions_dir "${solutions_dir}" \
      --output "${output_file}"
    echo
  done
done

echo "All validations attempted."
