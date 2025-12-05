#!/usr/bin/env bash
set -euo pipefail

# Run API LLM evaluation on four scenarios' testing_problem50 splits (50 problems each).
# Requires OPENAI_API_KEY or CPSL_OPENAI_KEY to be set in the environment.

if [[ -z "${OPENAI_API_KEY:-}" && -z "${CPSL_OPENAI_KEY:-}" ]]; then
  echo "ERROR: Please set OPENAI_API_KEY or CPSL_OPENAI_KEY before running." >&2
  exit 1
fi

run_eval() {
  local scenario="$1"
  local dir="pddl3/${scenario}/testing_problem50"
  local domain="pddl3/${scenario}/domain.pddl"

  echo "=== Evaluating ${scenario} (testing_problem50) ==="
  python script/evaluate_api_llm_solver.py \
    --problems-dir "${dir}" \
    --domain-file "${domain}" \
    --max-problems 50 \
    --max-workers 10
}

run_eval blocksworld
run_eval ferry
run_eval spanner
run_eval grippers
run_eval delivery

echo "All evaluations finished."
