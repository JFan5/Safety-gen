#!/usr/bin/env bash
set -euo pipefail

# Generate Spanner hard testing set: 150 problems total
# - 扳手数 (spanners) = 4, 5, 6
# - nuts数 = 4, 5, 6 (nuts <= spanners)
# - 位置数 (locations) = 5, 6, 7
# - 参数随机组合，总共 150 个问题
#
# Output: pddl3/spanner/testing_problems_hard/

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON_EXEC="${PYTHON_EXEC:-python3}"
GEN_PY="$SCRIPT_DIR/generate_unique_problems.py"
TARGET_DIR="${1:-$SCRIPT_DIR/testing_problems_hard}"

# Start clean
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

echo "Generating Spanner hard testing problems into $TARGET_DIR"
echo "Parameters: spanners=nuts={4,5,6}, locations={5,6,7}"
echo "Target: 150 problems total"

# 组合: spanners/nuts 相同 {4,5,6} × locations {5,6,7} = 3 × 3 = 9 种组合
# 每种组合生成约 16-17 个问题，总共 150 个
# 分配: 9 × 16 = 144, 再补 6 个到 150

SEED_BASE=60001
combo_idx=0

# s=n=4, locations=5,6,7
for loc in 5 6 7; do
  count=17
  seed=$(( SEED_BASE + combo_idx * 1000 ))
  echo "  -> spanners=4, nuts=4, locations=$loc, count=$count"
  $PYTHON_EXEC "$GEN_PY" \
    --output-dir "$TARGET_DIR" \
    --append \
    --count $count \
    --spanners 4 \
    --nuts 4 \
    --locations $loc \
    --seed $seed
  combo_idx=$((combo_idx + 1))
done

# s=n=5, locations=5,6,7
for loc in 5 6 7; do
  count=17
  seed=$(( SEED_BASE + combo_idx * 1000 ))
  echo "  -> spanners=5, nuts=5, locations=$loc, count=$count"
  $PYTHON_EXEC "$GEN_PY" \
    --output-dir "$TARGET_DIR" \
    --append \
    --count $count \
    --spanners 5 \
    --nuts 5 \
    --locations $loc \
    --seed $seed
  combo_idx=$((combo_idx + 1))
done

# s=n=6, locations=5,6,7
for loc in 5 6 7; do
  if [[ $loc -eq 5 ]]; then
    count=16  # 稍微少 1 个来达到 150
  else
    count=16
  fi
  seed=$(( SEED_BASE + combo_idx * 1000 ))
  echo "  -> spanners=6, nuts=6, locations=$loc, count=$count"
  $PYTHON_EXEC "$GEN_PY" \
    --output-dir "$TARGET_DIR" \
    --append \
    --count $count \
    --spanners 6 \
    --nuts 6 \
    --locations $loc \
    --seed $seed
  combo_idx=$((combo_idx + 1))
done

# Report
TOTAL=$(ls -1 "$TARGET_DIR"/*.pddl 2>/dev/null | wc -l || true)
echo ""
echo "Generated $TOTAL problems in $TARGET_DIR (expected 150)"
