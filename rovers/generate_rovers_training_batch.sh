#!/usr/bin/env bash
set -euo pipefail

# Batch-generate 2100 Rover training problems across varying parameter sets.
# Usage:
#   ./generate_rovers_training_batch.sh [OUTPUT_DIR] [PYTHON_EXEC]
# Defaults:
#   OUTPUT_DIR = rovers/all_problems
#   PYTHON_EXEC = ${PYTHON_EXEC:-/usr/bin/env python3}
PYTHON_EXEC="/opt/crc/c/conda/23.5.2/bin/python3"


SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"
PYTHON_EXEC="${2:-${PYTHON_EXEC}}"
GENERATOR_PY="$SCRIPT_DIR/generate_rovers_training_unique.py"

if [[ ! -f "$GENERATOR_PY" ]]; then
  echo "Error: $GENERATOR_PY not found" >&2
  exit 1
fi

echo "Clearing output directory: $TARGET_DIR"
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

function progress() {
  local label="$1"
  local count
  count=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
  echo "Progress after $label: $count problems"
}

echo "Generating Rover training problems (total target: 2100)"

echo "[BATCH 1] rovers=1 waypoints=6 objectives=2 cameras=1 goals=2 count=700"
"$PYTHON_EXEC" "$GENERATOR_PY" \
  --count 700 --seed-start 1 \
  --rovers 1 --waypoints 6 --objectives 2 --cameras 1 --goals 2 \
  --out-dir "$TARGET_DIR"
progress "batch 1"

echo "[BATCH 2] rovers=1 waypoints=8 objectives=3 cameras=2 goals=2 count=700"
"$PYTHON_EXEC" "$GENERATOR_PY" \
  --count 700 --seed-start 10001 \
  --rovers 1 --waypoints 8 --objectives 3 --cameras 2 --goals 2 \
  --out-dir "$TARGET_DIR"
progress "batch 2"

echo "[BATCH 3] rovers=2 waypoints=10 objectives=3 cameras=2 goals=3 count=700"
"$PYTHON_EXEC" "$GENERATOR_PY" \
  --count 700 --seed-start 20001 \
  --rovers 2 --waypoints 10 --objectives 3 --cameras 2 --goals 3 \
  --out-dir "$TARGET_DIR"
progress "batch 3"

TOTAL=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
echo "Done. Generated $TOTAL rover training problems in $TARGET_DIR"
