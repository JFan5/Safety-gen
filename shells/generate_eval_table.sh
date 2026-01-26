#!/bin/bash
# Generate evaluation results table from an eval folder
# Usage: ./shells/generate_eval_table.sh <eval_folder> [--format markdown|csv|latex] [--output <file>]
#
# Example:
#   ./shells/generate_eval_table.sh runs/grpo/.../eval/solver_batch_json_temp0.6_max512_bs4_20260125_191206
#   ./shells/generate_eval_table.sh runs/grpo/.../eval/... --format csv --output results.csv
#   ./shells/generate_eval_table.sh runs/grpo/.../eval/... --format latex

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Check if eval folder is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <eval_folder> [--format markdown|csv|latex] [--output <file>]"
    echo ""
    echo "Example:"
    echo "  $0 runs/grpo/.../eval/solver_batch_json_temp0.6_max512_bs4_20260125_191206"
    exit 1
fi

# Run the Python script with all arguments
python3 script/generate_eval_table.py "$@"
