#!/usr/bin/env bash
set -euo pipefail

# Generate unique Delivery problems prioritizing simplest instances first (trucks-style).
# Usage:
#   ./generate_delivery_training_unique.sh [OUTPUT_DIR] [PYTHON_EXEC]
# Defaults:
#   OUTPUT_DIR = delivery/all_problems
#   PYTHON_EXEC = /usr/bin/python3

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON_EXEC="${2:-${PYTHON_EXEC:-/home/fjl2401/miniconda3/bin/python}}"
GEN_PY="$SCRIPT_DIR/gen_unique_delivery.py"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"

# Start clean
rm -rf "$TARGET_DIR"
echo "Removing $TARGET_DIR"
mkdir -p "$TARGET_DIR"

# Seed (can be adjusted if needed)
SEED=10001

# Tiers from simplest to more complex (size, packages)
SEED=${SEED:-10001}

# 1) size=2, packages=1 → 35
"$PYTHON_EXEC" "$GEN_PY" \
  --count 35 \
  --target-dir "$TARGET_DIR" \
  --size 2 \
  --packages 1 \
  --seed $SEED \
  --domain "$SCRIPT_DIR/domain.pddl"

# 2) size=2, packages=2 → 120
"$PYTHON_EXEC" "$GEN_PY" \
  --count 120 \
  --target-dir "$TARGET_DIR" \
  --size 2 \
  --packages 2 \
  --seed $SEED \
  --domain "$SCRIPT_DIR/domain.pddl"

# 3) size=3, packages=1 → 150
"$PYTHON_EXEC" "$GEN_PY" \
  --count 150 \
  --target-dir "$TARGET_DIR" \
  --size 3 \
  --packages 1 \
  --seed $SEED \
  --domain "$SCRIPT_DIR/domain.pddl"

# 4) size=3, packages=2 → 300
"$PYTHON_EXEC" "$GEN_PY" \
  --count 300 \
  --target-dir "$TARGET_DIR" \
  --size 3 \
  --packages 2 \
  --seed $SEED \
  --domain "$SCRIPT_DIR/domain.pddl"

# 5) size=4, packages=2 → 495（把多出来的量放到容量巨大的档位）
"$PYTHON_EXEC" "$GEN_PY" \
  --count 495 \
  --target-dir "$TARGET_DIR" \
  --size 4 \
  --packages 2 \
  --seed $SEED \
  --domain "$SCRIPT_DIR/domain.pddl"

# Report
TOTAL=$(ls -1 "$TARGET_DIR"/*.pddl 2>/dev/null | wc -l || true)
echo "Generated $TOTAL problems in $TARGET_DIR."


