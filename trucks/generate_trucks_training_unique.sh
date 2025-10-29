#!/usr/bin/env bash
set -euo pipefail

# 一步到位：自动生成直到目录内累计达到 EXACT_TARGET (=1100)
# 用法：
#   ./generate_trucks_training_unique.sh [OUTPUT_DIR] [PYTHON_EXEC]
# 默认：
#   OUTPUT_DIR = trucks/all_problems
#   PYTHON_EXEC = /usr/bin/python3

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON_EXEC="${2:-${PYTHON_EXEC:-/usr/bin/python3}}"
GEN_PY="$SCRIPT_DIR/gen_unique_trucks.py"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"
EXACT_TARGET=2100
SEED="${SEED:-10001}"

# 先清空输出目录
echo "Removing $TARGET_DIR"
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

# 工具函数：当前数量 / 还缺数量
count_now() { find "$TARGET_DIR" -maxdepth 1 -name '*.pddl' | wc -l | tr -d ' '; }
remain()    { echo $(( EXACT_TARGET - $(count_now) )); }

# 执行一批：按还缺数量自动截断
gen_batch() {
  local trucks="$1" locs="$2" pkgs="$3" areas="$4" want="$5" uniq="$6"
  local left; left="$(remain)"
  [[ "$left" -le 0 ]] && return 0
  local take="$want"
  if [[ "$take" -gt "$left" ]]; then take="$left"; fi

  echo "[BATCH] t=$trucks l=$locs p=$pkgs a=$areas  count=$take  uniq=$uniq"
  "$PYTHON_EXEC" "$GEN_PY" \
    --count "$take" \
    --target-dir "$TARGET_DIR" \
    --trucks "$trucks" \
    --locations "$locs" \
    --packages "$pkgs" \
    --areas "$areas" \
    --seed "$SEED" \
    --uniqueness "$uniq"

  echo "Progress: $(count_now)/$EXACT_TARGET"
}

# -------------------- 生成流程 --------------------
# 说明：
# 1) 先用中等复杂度的参数批量填充（重复率低）。
# 2) 再用近邻参数扩展唯一空间。
# 3) 如仍未达到 1100，使用相同参数但放宽去重为 text 兜底补齐。

# trucks=2, max locations=5, max packages=4, max areas=3
gen_batch 2 5 4 3 400 syntactic



gen_batch 2 5 3 3 400 syntactic
gen_batch 2 4 3 3 400 syntactic

# Tier B：轻推参数，扩展唯一空间
gen_batch 1 4 3 2 300 syntactic
gen_batch 1 3 3 2 300 syntactic
gen_batch 1 4 2 2 300 syntactic

# 兜底 1：仍未满 → 用 syntactic 再喂一批高多样参数
if [[ "$(remain)" -gt 0 ]]; then
  gen_batch 2 5 4 3 300 syntactic
fi

# 兜底 2（最终保障）：放宽到 text，务必补齐到 1100
if [[ "$(remain)" -gt 0 ]]; then
  # 选用多样性高的一档参数补齐剩余
  gen_batch 2 5 4 3 "$(remain)" text
fi

# -------------------- 报告 --------------------
TOTAL="$(count_now)"
echo "Generated $TOTAL problems in $TARGET_DIR."
if [[ "$TOTAL" -ne "$EXACT_TARGET" ]]; then
  echo "WARN: did not reach EXACT_TARGET=$EXACT_TARGET (got $TOTAL). Consider increasing locations/areas or running again." >&2
  exit 2
fi