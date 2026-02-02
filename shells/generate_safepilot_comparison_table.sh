#!/bin/bash
# Generate LaTeX comparison table for SafePilot evaluation results
# Compares: Pretrained vs GRPO vs GRPO+SafePilot

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Input folders
PRETRAINED="/home/jfan5/Safety-gen/runs/safepilot/safepilot__temp0.6_max512_20260126_212056"
GRPO="/home/jfan5/Safety-gen/runs/qwen3/grpo/grpo_qwen3-14b-curriculum_v2-all-0111-stl_20260111_015253_seed3407/eval/solver_batch__temp0.6_max512_bs8_20260122_143526"
GRPO_WORKFLOW="/home/jfan5/Safety-gen/runs/safepilot/safepilot__temp0.6_max512_20260126_140327"

# Output directory
OUTPUT_DIR="${PROJECT_ROOT}/paper_tables"
mkdir -p "$OUTPUT_DIR"

echo "=== Generating SafePilot Comparison Tables ==="
echo ""

# Generate compact comparison table (Success + Safety only)
echo "1. Generating compact comparison table (Success + Safety)..."
python "${PROJECT_ROOT}/script/generate_safepilot_table.py" \
    --compare \
    --pretrained "$PRETRAINED" \
    --grpo "$GRPO" \
    --grpo-workflow "$GRPO_WORKFLOW" \
    --format latex \
    --output "${OUTPUT_DIR}/safepilot_comparison.tex"

echo ""
echo "Compact table saved to: ${OUTPUT_DIR}/safepilot_comparison.tex"
echo ""

# Generate full comparison table (all error categories)
echo "2. Generating full comparison table (all categories)..."
python "${PROJECT_ROOT}/script/generate_safepilot_table.py" \
    --compare \
    --pretrained "$PRETRAINED" \
    --grpo "$GRPO" \
    --grpo-workflow "$GRPO_WORKFLOW" \
    --format latex \
    --full \
    --output "${OUTPUT_DIR}/safepilot_comparison_full.tex"

echo ""
echo "Full table saved to: ${OUTPUT_DIR}/safepilot_comparison_full.tex"
echo ""

# Print the compact table to stdout
echo "=== Compact Table Preview ==="
cat "${OUTPUT_DIR}/safepilot_comparison.tex"
echo ""
echo "=== Done ==="
