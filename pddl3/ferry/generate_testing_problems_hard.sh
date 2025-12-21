#!/usr/bin/env bash
set -euo pipefail

# Generate Ferry hard testing set: 150 problems total
# - 汽车数 (cars) = 4, 5, 6
# - 位置数 (locations) = 5, 6, 7, 8
# - 参数随机组合，总共 150 个问题
#
# Output: pddl3/ferry/testing_problems_hard/

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON_EXEC="${PYTHON_EXEC:-python3}"
GEN_PY="$SCRIPT_DIR/gen_unique_ferry.py"
TARGET_DIR="${1:-$SCRIPT_DIR/testing_problems_hard}"

# Start clean
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

echo "Generating Ferry hard testing problems into $TARGET_DIR"
echo "Parameters: cars={4,5,6}, locations={5,6,7,8}"
echo "Target: 150 problems total"

# 组合: 3 cars × 4 locations = 12 种组合
# 每种组合生成约 12-13 个问题，总共 150 个
# 分配: 12 × 12 = 144, 再补 6 个到 150

SEED_BASE=50001
combo_idx=0

# cars=4, locations=5,6,7,8 各 13 个 = 52
for loc in 5 6 7 8; do
  count=13
  seed=$(( SEED_BASE + combo_idx * 1000 ))
  echo "  -> cars=4, locations=$loc, count=$count"
  $PYTHON_EXEC "$GEN_PY" \
    --count $count \
    --target-dir "$TARGET_DIR" \
    --locations $loc \
    --cars 4 \
    --seed $seed
  combo_idx=$((combo_idx + 1))
done

# cars=5, locations=5,6,7,8 各 12 个 = 48
for loc in 5 6 7 8; do
  count=12
  seed=$(( SEED_BASE + combo_idx * 1000 ))
  echo "  -> cars=5, locations=$loc, count=$count"
  $PYTHON_EXEC "$GEN_PY" \
    --count $count \
    --target-dir "$TARGET_DIR" \
    --locations $loc \
    --cars 5 \
    --seed $seed
  combo_idx=$((combo_idx + 1))
done

# cars=6, locations=5,6,7,8 各 12 个 = 48, 再补 2 个
for loc in 5 6 7 8; do
  if [[ $loc -le 6 ]]; then
    count=13  # locations=5,6 各多 1 个
  else
    count=12
  fi
  seed=$(( SEED_BASE + combo_idx * 1000 ))
  echo "  -> cars=6, locations=$loc, count=$count"
  $PYTHON_EXEC "$GEN_PY" \
    --count $count \
    --target-dir "$TARGET_DIR" \
    --locations $loc \
    --cars 6 \
    --seed $seed
  combo_idx=$((combo_idx + 1))
done

# Report
TOTAL=$(ls -1 "$TARGET_DIR"/*.pddl 2>/dev/null | wc -l || true)
echo ""
echo "Generated $TOTAL problems in $TARGET_DIR (expected 150)"
