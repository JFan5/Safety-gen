#!/usr/bin/env bash
set -euo pipefail

# Generate Grippers hard testing set: 150 problems total
# - 机器人数 (robots) = 3, 4
# - 房间数 (rooms) = 3, 4, 5
# - 物体数 (objects) = 3, 4
# - 参数随机组合，总共 150 个问题
#
# Output: pddl3/grippers/testing_problems_hard/

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON_EXEC="${PYTHON_EXEC:-python3}"
GEN_PY="$SCRIPT_DIR/gen_unique_grippers.py"
TARGET_DIR="${1:-$SCRIPT_DIR/testing_problems_hard}"

# Start clean
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

echo "Generating Grippers hard testing problems into $TARGET_DIR"
echo "Parameters: robots={3,4}, rooms={3,4,5}, objects={3,4}"
echo "Target: 150 problems total"

# 组合: 2 robots × 3 rooms × 2 objects = 12 种组合
# 每种组合生成约 12-13 个问题，总共 150 个
# 分配: 12 × 12 = 144, 再补 6 个到 150

SEED_BASE=70001
combo_idx=0

# robots=3
for room in 3 4 5; do
  for obj in 3 4; do
    if [[ $room -eq 5 ]]; then
      count=13  # 稍微多一些
    else
      count=12
    fi
    seed=$(( SEED_BASE + combo_idx * 1000 ))
    echo "  -> robots=3, rooms=$room, objects=$obj, count=$count"
    $PYTHON_EXEC "$GEN_PY" \
      --count $count \
      --target-dir "$TARGET_DIR" \
      --robots 3 \
      --rooms $room \
      --objects $obj \
      --seed $seed \
      --uniqueness "text"
    combo_idx=$((combo_idx + 1))
  done
done

# robots=4
for room in 3 4 5; do
  for obj in 3 4; do
    if [[ $room -eq 5 ]]; then
      count=13  # 稍微多一些
    else
      count=12
    fi
    seed=$(( SEED_BASE + combo_idx * 1000 ))
    echo "  -> robots=4, rooms=$room, objects=$obj, count=$count"
    $PYTHON_EXEC "$GEN_PY" \
      --count $count \
      --target-dir "$TARGET_DIR" \
      --robots 4 \
      --rooms $room \
      --objects $obj \
      --seed $seed \
      --uniqueness "text"
    combo_idx=$((combo_idx + 1))
  done
done

# Report
TOTAL=$(ls -1 "$TARGET_DIR"/*.pddl 2>/dev/null | wc -l || true)
echo ""
echo "Generated $TOTAL problems in $TARGET_DIR (expected 150)"
