#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${REPO_ROOT}"

python3 script/plot_cross_model_comparison.py \
    --gpt5-dir "runs/gpt5" \
    --llama-dir "runs/llama31_8b/grpo/grpo_llama3.1-8b-curriculum_v2-all-0129-stl_20260129_153849_seed3407/eval/solver_batch__temp0.6_max512_bs8_20260206_031347" \
    --qwen-dir "runs/qwen3/grpo/grpo_qwen3-14b-curriculum_v2-all-0111-stl_20260111_015253_seed3407/eval/solver_batch__temp0.6_max512_bs8_20260122_143526" \
    --output paper_plots
