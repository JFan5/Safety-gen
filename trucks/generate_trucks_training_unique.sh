#!/usr/bin/env bash
set -euo pipefail

# Generate unique trucks problems prioritizing simplest instances first.
# Usage:
#   ./generate_trucks_training_unique.sh [OUTPUT_DIR] [PYTHON_EXEC]
# Defaults:
#   OUTPUT_DIR = trucks/all_problems
#   PYTHON_EXEC = /usr/bin/python3

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON_EXEC="${2:-${PYTHON_EXEC:-/usr/bin/python3}}"
GEN_PY="$SCRIPT_DIR/gen_unique_trucks.py"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"

# Ensure binary exists (gen_unique_trucks.py will build if needed)

# Start clean
rm -rf "$TARGET_DIR"
echo "Removing $TARGET_DIR"
mkdir -p "$TARGET_DIR"

# Tiers from simplest upwards. Adjust counts to taste.

# Seed 可统一用一个；如需可更换
SEED=10001



# 1) 简单：1 truck, 2 loc, 1 pkg, 1 area -> 3
"$PYTHON_EXEC" "$GEN_PY" \
  --count 3 \
  --target-dir "$TARGET_DIR" \
  --trucks 1 \
  --locations 2 \
  --packages 1 \
  --areas 1 \
  --seed $SEED

# 2) 稍进阶：1 truck, 2 loc, 2 pkg -> 12
"$PYTHON_EXEC" "$GEN_PY" \
  --count 12 \
  --target-dir "$TARGET_DIR" \
  --trucks 1 \
  --locations 2 \
  --packages 2 \
  --areas 1 \
  --seed $SEED

# 3) 小幅扩展地点：1 truck, 3 loc, 2 pkg -> 60
"$PYTHON_EXEC" "$GEN_PY" \
  --count 60 \
  --target-dir "$TARGET_DIR" \
  --trucks 1 \
  --locations 3 \
  --packages 2 \
  --areas 1 \
  --seed $SEED

# 4) 增包裹且分区：1 truck, 3 loc, 3 pkg, 2 areas -> 320
"$PYTHON_EXEC" "$GEN_PY" \
  --count 320 \
  --target-dir "$TARGET_DIR" \
  --trucks 1 \
  --locations 3 \
  --packages 3 \
  --areas 2 \
  --seed $SEED

# 5) 增地点：1 truck, 4 loc, 3 pkg, 2 areas -> 400
"$PYTHON_EXEC" "$GEN_PY" \
  --count 400 \
  --target-dir "$TARGET_DIR" \
  --trucks 1 \
  --locations 4 \
  --packages 3 \
  --areas 2 \
  --seed $SEED

# 6) 增卡车：2 trucks, 4 loc, 3 pkg, 2 areas -> 305
"$PYTHON_EXEC" "$GEN_PY" \
  --count 305 \
  --target-dir "$TARGET_DIR" \
  --trucks 2 \
  --locations 4 \
  --packages 3 \
  --areas 2 \
  --seed $SEED



# Report
TOTAL=$(ls -1 "$TARGET_DIR"/*.pddl 2>/dev/null | wc -l || true)
echo "Generated $TOTAL problems in $TARGET_DIR."


