#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
AGG_ROOT="${REPO_ROOT}/planning_results/aggregated_by_scenario"
PLOT_ROOT="${REPO_ROOT}/plots"

cd "${REPO_ROOT}"

mkdir -p "${PLOT_ROOT}/llama/blocksworld"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/llama_blocksworld_planning_results.json" \
  --output-dir "${PLOT_ROOT}/llama/blocksworld"

mkdir -p "${PLOT_ROOT}/llama/ferry"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/llama_ferry_planning_results.json" \
  --output-dir "${PLOT_ROOT}/llama/ferry"

mkdir -p "${PLOT_ROOT}/llama/grid"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/llama_grid_planning_results.json" \
  --output-dir "${PLOT_ROOT}/llama/grid"

mkdir -p "${PLOT_ROOT}/llama/rovers"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/llama_rovers_planning_results.json" \
  --output-dir "${PLOT_ROOT}/llama/rovers"

mkdir -p "${PLOT_ROOT}/llama/spanner"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/llama_spanner_planning_results.json" \
  --output-dir "${PLOT_ROOT}/llama/spanner"

mkdir -p "${PLOT_ROOT}/mistral_7b/blocksworld"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/mistral_7b_blocksworld_planning_results.json" \
  --output-dir "${PLOT_ROOT}/mistral_7b/blocksworld"

mkdir -p "${PLOT_ROOT}/mistral_7b/ferry"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/mistral_7b_ferry_planning_results.json" \
  --output-dir "${PLOT_ROOT}/mistral_7b/ferry"

mkdir -p "${PLOT_ROOT}/mistral_7b/grid"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/mistral_7b_grid_planning_results.json" \
  --output-dir "${PLOT_ROOT}/mistral_7b/grid"

mkdir -p "${PLOT_ROOT}/mistral_7b/rovers"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/mistral_7b_rovers_planning_results.json" \
  --output-dir "${PLOT_ROOT}/mistral_7b/rovers"

mkdir -p "${PLOT_ROOT}/qwen3_1_7b/blocksworld"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/qwen3_1_7b_blocksworld_planning_results.json" \
  --output-dir "${PLOT_ROOT}/qwen3_1_7b/blocksworld"

mkdir -p "${PLOT_ROOT}/qwen3_1_7b/ferry"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/qwen3_1_7b_ferry_planning_results.json" \
  --output-dir "${PLOT_ROOT}/qwen3_1_7b/ferry"

mkdir -p "${PLOT_ROOT}/qwen3_1_7b/grid"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/qwen3_1_7b_grid_planning_results.json" \
  --output-dir "${PLOT_ROOT}/qwen3_1_7b/grid"

mkdir -p "${PLOT_ROOT}/qwen3_1_7b/rovers"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/qwen3_1_7b_rovers_planning_results.json" \
  --output-dir "${PLOT_ROOT}/qwen3_1_7b/rovers"

mkdir -p "${PLOT_ROOT}/qwen3_1_7b/spanner"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/qwen3_1_7b_spanner_planning_results.json" \
  --output-dir "${PLOT_ROOT}/qwen3_1_7b/spanner"

mkdir -p "${PLOT_ROOT}/sft_mistral_7b/blocksworld"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/sft_mistral_7b_blocksworld_planning_results.json" \
  --output-dir "${PLOT_ROOT}/sft_mistral_7b/blocksworld"

mkdir -p "${PLOT_ROOT}/sft_mistral_7b/ferry"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/sft_mistral_7b_ferry_planning_results.json" \
  --output-dir "${PLOT_ROOT}/sft_mistral_7b/ferry"

mkdir -p "${PLOT_ROOT}/sft_mistral_7b/grid"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/sft_mistral_7b_grid_planning_results.json" \
  --output-dir "${PLOT_ROOT}/sft_mistral_7b/grid"

mkdir -p "${PLOT_ROOT}/sft_mistral_7b/rovers"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/sft_mistral_7b_rovers_planning_results.json" \
  --output-dir "${PLOT_ROOT}/sft_mistral_7b/rovers"

mkdir -p "${PLOT_ROOT}/sft_mistral_7b/spanner"
python3 script/visualize_planning_results.py \
  --input "${AGG_ROOT}/sft_mistral_7b_spanner_planning_results.json" \
  --output-dir "${PLOT_ROOT}/sft_mistral_7b/spanner"
