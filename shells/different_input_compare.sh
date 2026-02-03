#!/bin/bash
#
# different_input_compare.sh - Compare PDDL3 vs Natural Language (vs JSON) input format performance
#
# Usage:
#   ./shells/different_input_compare.sh <PDDL3_EVAL_DIR> <NL_EVAL_DIR> [JSON_EVAL_DIR] [OUTPUT_FILE]
#
# Arguments:
#   PDDL3_EVAL_DIR: Path to PDDL3 (symbolic) evaluation directory containing metrics.json
#   NL_EVAL_DIR:    Path to Natural Language evaluation directory containing metrics.json
#   JSON_EVAL_DIR:  (Optional) Path to JSON evaluation directory containing metrics.json
#   OUTPUT_FILE:    (Optional) Output path for LaTeX table
#                   Default: paper/new_submission/exp_figure_reference/table3_input_format.tex
#
# Examples:
#   # Two formats (PDDL3 vs NL):
#   ./shells/different_input_compare.sh \
#     runs/qwen3/grpo/.../eval/solver_batch__temp0.6_max512_bs8_... \
#     runs/qwen3/grpo/.../eval/solver_batch_nl__temp0.6_max512_bs8_...
#
#   # Three formats (PDDL3 vs NL vs JSON):
#   ./shells/different_input_compare.sh \
#     runs/qwen3/grpo/.../eval/solver_batch__temp0.6_max512_bs8_... \
#     runs/qwen3/grpo/.../eval/solver_batch_nl__temp0.6_max512_bs8_... \
#     runs/qwen3/grpo/.../eval/solver_batch_json_temp0.6_max512_bs8_...

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Check arguments
if [ $# -lt 2 ]; then
    echo "Usage: $0 <PDDL3_EVAL_DIR> <NL_EVAL_DIR> [JSON_EVAL_DIR] [OUTPUT_FILE]"
    echo ""
    echo "Generate LaTeX table comparing PDDL3 vs Natural Language (vs JSON) input format performance."
    echo ""
    echo "Arguments:"
    echo "  PDDL3_EVAL_DIR  Path to PDDL3 evaluation directory with metrics.json"
    echo "  NL_EVAL_DIR     Path to NL evaluation directory with metrics.json"
    echo "  JSON_EVAL_DIR   (Optional) Path to JSON evaluation directory with metrics.json"
    echo "  OUTPUT_FILE     (Optional) Output LaTeX file path"
    exit 1
fi

PDDL3_DIR="$1"
NL_DIR="$2"

# Determine if third argument is JSON_DIR or OUTPUT_FILE
JSON_DIR=""
OUTPUT_FILE="${PROJECT_ROOT}/paper/new_submission/exp_figure_reference/table3_input_format.tex"

if [ $# -ge 3 ]; then
    # Check if arg3 is a directory (JSON_DIR) or a file path (OUTPUT_FILE)
    if [ -d "$3" ] || [[ "$3" == *"eval"* && "$3" != *".tex" ]]; then
        JSON_DIR="$3"
        if [ $# -ge 4 ]; then
            OUTPUT_FILE="$4"
        fi
    else
        OUTPUT_FILE="$3"
    fi
fi

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

# Build Python command
PYTHON_ARGS="--pddl3-dir \"$PDDL3_DIR\" --nl-dir \"$NL_DIR\" --output \"$OUTPUT_FILE\""

if [ -n "$JSON_DIR" ]; then
    if [ ! -d "$JSON_DIR" ]; then
        echo "Error: JSON evaluation directory not found: $JSON_DIR"
        exit 1
    fi
    if [ ! -f "${JSON_DIR}/metrics.json" ]; then
        echo "Error: metrics.json not found in JSON directory: $JSON_DIR"
        exit 1
    fi
    PYTHON_ARGS="$PYTHON_ARGS --json-dir \"$JSON_DIR\""
    echo "Comparing input formats (3-way):"
    echo "  PDDL3 eval: $PDDL3_DIR"
    echo "  NL eval:    $NL_DIR"
    echo "  JSON eval:  $JSON_DIR"
else
    echo "Comparing input formats (2-way):"
    echo "  PDDL3 eval: $PDDL3_DIR"
    echo "  NL eval:    $NL_DIR"
fi

echo "  Output:     $OUTPUT_FILE"
echo ""

# Run the Python script
eval python "${PROJECT_ROOT}/script/generate_input_format_table.py" $PYTHON_ARGS

echo ""
echo "Done! LaTeX table saved to: $OUTPUT_FILE"
