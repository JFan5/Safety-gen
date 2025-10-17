#!/usr/bin/env bash
set -euo pipefail

# Generate 1100 unique ferry problems prioritizing simplest instances first.
# Output directory can be overridden via FIRST arg; defaults to ferry/training_problems

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON_EXEC="${PYTHON_EXEC:-/usr/bin/python3}"
GEN_PY="$SCRIPT_DIR/gen_unique_ferry.py"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"

# Start clean
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

# 1) 3 locations, 2 cars → 81
$PYTHON_EXEC "$GEN_PY" \
  --count 81 \
  --target-dir "$TARGET_DIR" \
  --locations 3 \
  --cars 2 \
  --seed 11001

# 2) 3 locations, 3 cars → 729
$PYTHON_EXEC "$GEN_PY" \
  --count 500 \
  --target-dir "$TARGET_DIR" \
  --locations 3 \
  --cars 3 \
  --seed 11002

# 3) 4 locations, 2 cars  256
$PYTHON_EXEC "$GEN_PY" \
  --count 100 \
  --target-dir "$TARGET_DIR" \
  --locations 4 \
  --cars 2 \
  --seed 11003

# 4) 5 locations, 2 cars → 625
$PYTHON_EXEC "$GEN_PY" \
  --count 400 \
  --target-dir "$TARGET_DIR" \
  --locations 5 \
  --cars 2 \
  --seed 11004

# 5) 4 locations, 3 cars → 4096
$PYTHON_EXEC "$GEN_PY" \
  --count 300 \
  --target-dir "$TARGET_DIR" \
  --locations 4 \
  --cars 3 \
  --seed 11005

# 6) 5 locations, 3 cars → 15,625
$PYTHON_EXEC "$GEN_PY" \
  --count 719 \
  --target-dir "$TARGET_DIR" \
  --locations 5 \
  --cars 3 \
  --seed 11006
# Report
TOTAL=$(ls -1 "$TARGET_DIR"/*.pddl 2>/dev/null | wc -l || true)
echo "Generated $TOTAL problems in $TARGET_DIR (expected 2100)."
