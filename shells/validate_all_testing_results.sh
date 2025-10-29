#!/usr/bin/env bash

# Validate solution sets stored in planning_results/<model>/<scenario>/<variant>.
set -euo pipefail

# Allow overriding the Python interpreter: PYTHON_BIN=python ./validate_all_testing_results.sh
PYTHON_BIN="${PYTHON_BIN:-python3}"
PLANNING_ROOT="planning_results"
RESULT_VARIANTS=(pddl2 pddl3 baseline)

if [[ ! -d "${PLANNING_ROOT}" ]]; then
  echo "[error] planning results directory not found: ${PLANNING_ROOT}" >&2
  exit 1
fi

for model_path in "${PLANNING_ROOT}"/*; do
  [[ -d "${model_path}" ]] || continue
  model="$(basename "${model_path}")"

  for scenario_path in "${model_path}"/*; do
    [[ -d "${scenario_path}" ]] || continue
    scenario="$(basename "${scenario_path}")"

    domain=""
    for candidate in "domain3.pddl" "domain.pddl"; do
      potential="${scenario}/${candidate}"
      if [[ -f "${potential}" ]]; then
        domain="${potential}"
        break
      fi
    done

    if [[ -z "${domain}" ]]; then
      echo "[skip] ${model}/${scenario}: missing domain file (tried domain3.pddl, domain.pddl)" >&2
      continue
    fi

    header_printed=false

    for variant in "${RESULT_VARIANTS[@]}"; do
      solutions_dir="${scenario_path}/${variant}"
      if [[ ! -d "${solutions_dir}" ]]; then
        continue
      fi

      case "${variant}" in
        pddl2)
          candidates=(
            "all_problems"
            "all_problems_test"
            "testing_problems_all"
            "all_problems3/testing"
            "testing_problems3"
            "testing_problems"
          )
          ;;
        *)
          candidates=(
            "all_problems3/testing"
            "testing_problems3"
            "testing_problems_all"
            "all_problems"
            "all_problems_test"
            "testing_problems"
          )
          ;;
      esac

      problems_dir=""
      for candidate in "${candidates[@]}"; do
        potential="${scenario}/${candidate}"
        if [[ -d "${potential}" ]]; then
          problems_dir="${potential}"
          break
        fi
      done

      if [[ -z "${problems_dir}" ]]; then
        echo "[skip] ${model}/${scenario} (${variant}): unable to locate problems directory" >&2
        continue
      fi

      if ! compgen -G "${solutions_dir}/*.soln" > /dev/null; then
        echo "[skip] ${model}/${scenario} (${variant}): no .soln files in ${solutions_dir}" >&2
        continue
      fi

      if [[ "${header_printed}" == false ]]; then
        echo "================================================================"
        echo "Model:    ${model}"
        echo "Scenario: ${scenario}"
        echo "Domain:   ${domain}"
        echo "Problems: ${problems_dir}"
        echo "================================================================"
        header_printed=true
      fi

      case "${variant}" in
        baseline) output_file="${solutions_dir}/${scenario}_all_testing_baseline.json" ;;
        pddl2)    output_file="${solutions_dir}/${scenario}_all_testing_pddl2.json" ;;
        pddl3)    output_file="${solutions_dir}/${scenario}_all_testing_pddl3.json" ;;
      esac

      echo "Validating ${model}/${scenario} (${variant})"
      "${PYTHON_BIN}" script/validate_classical_solvers.py \
        --domain "${domain}" \
        --problems_dir "${problems_dir}" \
        --solutions_dir "${solutions_dir}" \
        --output "${output_file}"
      echo
    done
  done
done

echo "All validations attempted."
