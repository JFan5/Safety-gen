#!/bin/bash
#
# different_input_compare.sh - Compare PDDL3 vs Natural Language input format performance
#
# Usage:
#   ./shells/different_input_compare.sh <PDDL3_EVAL_DIR> <NL_EVAL_DIR> [OUTPUT_FILE]
#
# Arguments:
#   PDDL3_EVAL_DIR: Path to PDDL3 (symbolic) evaluation directory containing metrics.json
#   NL_EVAL_DIR:    Path to Natural Language evaluation directory containing metrics.json
#   OUTPUT_FILE:    (Optional) Output path for LaTeX table
#                   Default: paper/new_submission/exp_figure_reference/table3_input_format.tex
#
# Example:
#   ./shells/different_input_compare.sh \
#     runs/qwen3/grpo/.../eval/solver_batch__temp0.6_max512_bs8_... \
#     runs/qwen3/grpo/.../eval/solver_batch_nl__temp0.6_max512_bs8_...

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Check arguments
if [ $# -lt 2 ]; then
    echo "Usage: $0 <PDDL3_EVAL_DIR> <NL_EVAL_DIR> [OUTPUT_FILE]"
    echo ""
    echo "Generate LaTeX table comparing PDDL3 vs Natural Language input format performance."
    echo ""
    echo "Arguments:"
    echo "  PDDL3_EVAL_DIR  Path to PDDL3 evaluation directory with metrics.json"
    echo "  NL_EVAL_DIR     Path to NL evaluation directory with metrics.json"
    echo "  OUTPUT_FILE     (Optional) Output LaTeX file path"
    exit 1
fi

PDDL3_DIR="$1"
NL_DIR="$2"
OUTPUT_FILE="${3:-${PROJECT_ROOT}/paper/new_submission/exp_figure_reference/table3_input_format.tex}"

# Validate directories exist
if [ ! -d "$PDDL3_DIR" ]; then
    echo "Error: PDDL3 evaluation directory not found: $PDDL3_DIR"
    exit 1
fi

if [ ! -d "$NL_DIR" ]; then
    echo "Error: NL evaluation directory not found: $NL_DIR"
    exit 1
fi

# Check for metrics.json files
if [ ! -f "${PDDL3_DIR}/metrics.json" ]; then
    echo "Error: metrics.json not found in PDDL3 directory: $PDDL3_DIR"
    exit 1
fi

if [ ! -f "${NL_DIR}/metrics.json" ]; then
    echo "Error: metrics.json not found in NL directory: $NL_DIR"
    exit 1
fi

echo "Comparing input formats:"
echo "  PDDL3 eval: $PDDL3_DIR"
echo "  NL eval:    $NL_DIR"
echo "  Output:     $OUTPUT_FILE"
echo ""

# Run the Python script
python "${PROJECT_ROOT}/script/generate_input_format_table.py" \
    --pddl3-dir "$PDDL3_DIR" \
    --nl-dir "$NL_DIR" \
    --output "$OUTPUT_FILE"

echo ""
echo "Done! LaTeX table saved to: $OUTPUT_FILE"
