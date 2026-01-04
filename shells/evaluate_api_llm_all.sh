#!/usr/bin/env bash
set -euo pipefail

# Run API LLM evaluation on four scenarios' testing_problem50 splits (50 problems each).
# Requires OPENAI_API_KEY or CPSL_OPENAI_KEY to be set in the environment.

if [[ -z "${OPENAI_API_KEY:-}" && -z "${CPSL_OPENAI_KEY:-}" ]]; then
  echo "ERROR: Please set OPENAI_API_KEY or CPSL_OPENAI_KEY before running." >&2
  exit 1
fi

fmt_dur() {
  local secs=$1
  printf "%02d:%02d:%02d" $((secs/3600)) $((secs%3600/60)) $((secs%60))
}

run_eval() {
  local scenario="$1"
  local dir="pddl3/${scenario}/testing_problems100"
  local domain="pddl3/${scenario}/domain3.pddl"
  local start_ts end_ts elapsed
  local max_problems=100

  echo "=== Evaluating ${scenario} (testing_problems${max_problems}) ==="
  start_ts=$(date +%s)
  python script/evaluate_api_llm_solver.py \
    --problems-dir "${dir}" \
    --domain-file "${domain}" \
    --max-problems ${max_problems} \
    --max-workers 10
  end_ts=$(date +%s)
  elapsed=$((end_ts-start_ts))
  echo "=== ${scenario} done in $(fmt_dur "${elapsed}") ==="
}

total_start=$(date +%s)

run_eval blocksworld
run_eval ferry
run_eval spanner
run_eval grippers
run_eval delivery
# run_eval grid



total_end=$(date +%s)
echo "All evaluations finished. Total time: $(fmt_dur $((total_end-total_start)))"
