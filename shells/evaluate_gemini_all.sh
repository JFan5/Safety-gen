#!/usr/bin/env bash
set -euo pipefail

# Run Gemini evaluation on five scenarios' testing_problem50 splits (50 problems each).
# Requires GEMINI_API_KEY to be set in the environment.

if [[ -z "${GEMINI_API_KEY:-}" ]]; then
  echo "ERROR: Please set GEMINI_API_KEY before running." >&2
  exit 1
fi

# Default model (can be overridden via command line argument)
MODEL="${1:-gemini-3-pro}"
PROBLEMS_SUBDIR="${2:-testing_problem50}"
MAX_PROBLEMS="${3:-100}"
MAX_WORKERS="${4:-5}"

# Create output directory (like evaluate_llm_all.sh)
MODEL_NAME=$(echo "${MODEL}" | sed 's/[\/\\]/-/g' | sed 's/[^a-zA-Z0-9._-]/-/g')
RUN_TS="$(date +%Y%m%d_%H%M%S)"
OUTPUT_DIR="planning_results/${MODEL_NAME}_${RUN_TS}"
mkdir -p "${OUTPUT_DIR}"

echo "Using Gemini model: ${MODEL}"
echo "Problems subdir: ${PROBLEMS_SUBDIR}"
echo "Max problems per scenario: ${MAX_PROBLEMS}"
echo "Max concurrent workers: ${MAX_WORKERS}"
echo "Output dir: ${OUTPUT_DIR}"
echo ""

fmt_dur() {
  local secs=$1
  printf "%02d:%02d:%02d" $((secs/3600)) $((secs%3600/60)) $((secs%60))
}

run_eval() {
  local scenario="$1"
  local dir="pddl3/${scenario}/${PROBLEMS_SUBDIR}"
  local domain="pddl3/${scenario}/domain3.pddl"
  local out="${OUTPUT_DIR}/${scenario}.json"
  local start_ts end_ts elapsed

  echo "=== Evaluating ${scenario} (${PROBLEMS_SUBDIR}, max_problems=${MAX_PROBLEMS}) with ${MODEL} ==="
  start_ts=$(date +%s)
  python script/evaluate_gemini_solver.py \
    --model "${MODEL}" \
    --problems-dir "${dir}" \
    --domain-file "${domain}" \
    --max-problems ${MAX_PROBLEMS} \
    --max-workers ${MAX_WORKERS} \
    --output "${out}" \
    --no-timestamp
  end_ts=$(date +%s)
  elapsed=$((end_ts-start_ts))
  echo "=== ${scenario} done in $(fmt_dur "${elapsed}") ==="
  echo "=== results: ${out} ==="
  echo ""
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
