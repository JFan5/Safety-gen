#!/usr/bin/env bash
set -euo pipefail

# Generate Spanner hard testing set: 150 problems total
# 修改生成问题的难度：
# - 扳手数 (spanners) = 2, 3
# - 螺母数 (nuts) = 3, 4   # (nuts <= spanners)
# - 位置数 (locations) = 4, 5, 6
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
echo "Parameters: spanners={2,3}, nuts={3,4} (with nuts<=spanners), locations={4,5,6}"
echo "Target: 150 problems total"

# 组合: 满足约束 nuts <= spanners 的有效组合：
# - spanners=2: nuts最大为2（但注释目标nuts=3,4都不满足，所以跳过spanners=2）
# - spanners=3, nuts=3: 满足约束 (3<=3)，nuts=4不满足约束(4>3)
# 所以只有一种配置: spanners=3, nuts=3, locations={4,5,6} = 3 种组合
# 每种组合生成 50 个问题，总共 150 个

SEED_BASE=60001
combo_idx=0

# spanners=3, nuts=3, locations=4,5,6
for loc in 4 5 6; do
  count=50
  seed=$(( SEED_BASE + combo_idx * 1000 ))
  echo "  -> spanners=3, nuts=3, locations=$loc, count=$count"
  $PYTHON_EXEC "$GEN_PY" \
    --output-dir "$TARGET_DIR" \
    --append \
    --count $count \
    --spanners 3 \
    --nuts 3 \
    --locations $loc \
    --seed $seed
  combo_idx=$((combo_idx + 1))
done

# Report
TOTAL=$(ls -1 "$TARGET_DIR"/*.pddl 2>/dev/null | wc -l || true)
echo ""
echo "Generated $TOTAL problems in $TARGET_DIR (expected 150)"
