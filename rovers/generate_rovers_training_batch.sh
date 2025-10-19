#!/usr/bin/env bash
set -euo pipefail

# Batch-generate 2100 Rover training problems across varying parameter sets.
# Usage:
#   ./generate_rovers_training_batch.sh [OUTPUT_DIR] [PYTHON_EXEC]
# Defaults:
#   OUTPUT_DIR = rovers/all_problems
#   PYTHON_EXEC = ${PYTHON_EXEC:-/usr/bin/env python3}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"
PYTHON_EXEC="${2:-${PYTHON_EXEC:-/usr/bin/env python3}}"
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

echo "[BATCH] rovers=1 waypoints=5 objectives=2 cameras=1 goals=2 count=250"
"$PYTHON_EXEC" "$GENERATOR_PY" \
  --count 250 \
  --seed-start 1 \
  --rovers 1 \
  --waypoints 5 \
  --objectives 2 \
  --cameras 1 \
  --goals 2 \
  --out-dir "$TARGET_DIR"
progress "batch 1"

echo "[BATCH] rovers=1 waypoints=7 objectives=3 cameras=2 goals=3 count=300"
"$PYTHON_EXEC" "$GENERATOR_PY" \
  --count 300 \
  --seed-start 10001 \
  --rovers 1 \
  --waypoints 7 \
  --objectives 3 \
  --cameras 2 \
  --goals 3 \
  --out-dir "$TARGET_DIR"
progress "batch 2"

echo "[BATCH] rovers=2 waypoints=8 objectives=3 cameras=3 goals=4 count=300"
"$PYTHON_EXEC" "$GENERATOR_PY" \
  --count 300 \
  --seed-start 20001 \
  --rovers 2 \
  --waypoints 8 \
  --objectives 3 \
  --cameras 3 \
  --goals 4 \
  --out-dir "$TARGET_DIR"
progress "batch 3"

echo "[BATCH] rovers=2 waypoints=10 objectives=4 cameras=3 goals=5 count=300"
"$PYTHON_EXEC" "$GENERATOR_PY" \
  --count 300 \
  --seed-start 30001 \
  --rovers 2 \
  --waypoints 10 \
  --objectives 4 \
  --cameras 3 \
  --goals 5 \
  --out-dir "$TARGET_DIR"
progress "batch 4"

echo "[BATCH] rovers=3 waypoints=12 objectives=5 cameras=4 goals=6 count=300"
"$PYTHON_EXEC" "$GENERATOR_PY" \
  --count 300 \
  --seed-start 40001 \
  --rovers 3 \
  --waypoints 12 \
  --objectives 5 \
  --cameras 4 \
  --goals 6 \
  --out-dir "$TARGET_DIR"
progress "batch 5"

echo "[BATCH] rovers=3 waypoints=16 objectives=6 cameras=5 goals=7 count=350"
"$PYTHON_EXEC" "$GENERATOR_PY" \
  --count 350 \
  --seed-start 50001 \
  --rovers 3 \
  --waypoints 16 \
  --objectives 6 \
  --cameras 5 \
  --goals 7 \
  --out-dir "$TARGET_DIR"
progress "batch 6"

echo "[BATCH] rovers=4 waypoints=20 objectives=7 cameras=6 goals=8 count=300"
"$PYTHON_EXEC" "$GENERATOR_PY" \
  --count 300 \
  --seed-start 60001 \
  --rovers 4 \
  --waypoints 20 \
  --objectives 7 \
  --cameras 6 \
  --goals 8 \
  --out-dir "$TARGET_DIR"
progress "batch 7"

TOTAL=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
echo "Done. Generated $TOTAL rover training problems in $TARGET_DIR"
