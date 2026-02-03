#!/bin/bash
# Generate error type distribution comparison chart for Mistral-7B on Blocksworld
# Compares: Pretrained vs SFT vs GRPO

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Input files
BASELINE="/home/jfan5/Safety-gen/paper_results_iccps2025/mistral-blocksworld-variant/baseline.json"
SFT="/home/jfan5/Safety-gen/runs/mistral/sft/20251125_003048_proj-pddl-finetune_method-sft_base-mistral_7b_ds-unknown_seed-3407_2gvrrx7s/evals/blocksworld_-jfan5-sft_models-mistral_variant-blocksworld_50_20251207_034712.json"
GRPO="/home/jfan5/Safety-gen/runs/mistral/grpo/20251221_145922_proj-pddl-grpo-mistral7b_method-grpo_base-mistral_7b_ds-blocksworld_seed-3407_h62ki5xw/eval/solver_batch__temp0.6_max512_bs8/scenarios/blocksworld.json"

# Output directory
OUTPUT_DIR="${PROJECT_ROOT}/paper_plots/mistral_blocksworld"

# Run the plotting script
# Note: Using --GRPO for GRPO data (label will show as GRPO)
python "${PROJECT_ROOT}/script/plot_model_category.py" \
    --baseline "$BASELINE" \
    --sft "$SFT" \
    --GRPO "$GRPO" \
    --output "$OUTPUT_DIR" \
    --model-name "Mistral-7B" \
    --domain "Blocksworld"

echo "Plot saved to: ${OUTPUT_DIR}/model_comparison.png"
