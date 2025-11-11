#!/usr/bin/env bash
set -euo pipefail

# Batch generator for Grid testing problems - 100 simple instances.
# Usage:
#   ./generate_grid_testing.sh [OUTPUT_DIR] [PYTHON_EXEC]
# Defaults:
#   OUTPUT_DIR = $(dirname "$0")/all_problems
#   PYTHON_EXEC = ${PYTHON_EXEC:-python3}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"
PYTHON_EXEC="${2:-${PYTHON_EXEC:-python3}}"
GENERATOR_PY="$SCRIPT_DIR/generate_grid_training_unique.py"

if [[ ! -f "$GENERATOR_PY" ]]; then
  echo "Error: generator script not found at $GENERATOR_PY" >&2
  exit 1
fi

echo "Clearing output directory: $TARGET_DIR"
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

progress() {
  local label="$1"
  local count
  count=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
  echo "Progress after $label: $count problems"
}

run_batch() {
  local label="$1"; shift
  echo "[$label] $*"
  "$PYTHON_EXEC" "$GENERATOR_PY" "$@" --out-dir "$TARGET_DIR"
  progress "$label"
}

echo "Generating Grid testing problems (target: 100 simple instances)"
echo "Mixed grid sizes: 2x2 (40), 3x3 (50), 4x4 (10)"
echo "Configuration: 2 shapes, 2 keys, 2 locks"

# === Mixed batches: different grid sizes for variety ===
# 2x2: simplest, 40 problems
run_batch "2x2-SIMPLE" \
  --count 40 --seed-start 10001 \
  --x 2 --y 2 --shapes 2 --keys 2 --locks 2 --prob-goal 0.50

# 3x3: medium, 50 problems (most of the batch)
run_batch "3x3-MEDIUM" \
  --count 50 --seed-start 20001 \
  --x 3 --y 3 --shapes 2 --keys 2 --locks 2 --prob-goal 0.50

# 4x4: slightly larger, 10 problems (small portion)
run_batch "4x4-LARGER" \
  --count 10 --seed-start 30001 \
  --x 4 --y 4 --shapes 2 --keys 2 --locks 2 --prob-goal 0.50

TOTAL=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
echo "Done. Generated $TOTAL Grid problems in $TARGET_DIR"
