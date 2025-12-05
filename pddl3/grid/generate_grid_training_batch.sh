#!/usr/bin/env bash
set -euo pipefail

# Batch generator for Grid problems totaling 2000 instances (2×2 to 5×5).
# Usage:
#   ./generate_grid_training_batch.sh [OUTPUT_DIR] [PYTHON_EXEC]
# Defaults:
#   OUTPUT_DIR = $(dirname "$0")/all_problems
#   PYTHON_EXEC = ${PYTHON_EXEC:-python3}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"
PYTHON_EXEC="${2:-${PYTHON_EXEC:-python3}}"
GENERATOR_PY="$SCRIPT_DIR/generate_grid_training_unique.py"

if [[ ! -f "$GENERATOR_PY" ]]; then
  echo "Error: generator script not found at $GENERATOR_PY" >&2
  exit 1
fi

echo "Clearing output directory: $TARGET_DIR"
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

progress() {
  local label="$1"
  local count
  count=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
  echo "Progress after $label: $count problems"
}

run_batch() {
  local label="$1"; shift
  echo "[$label] $*"
  "$PYTHON_EXEC" "$GENERATOR_PY" "$@" --out-dir "$TARGET_DIR"
  progress "$label"
}

echo "Generating Grid training problems (target: 2000 instances, 2×2 to 5×5)"
echo "Adaptive batches: favor high-combination settings while keeping throughput smooth"

# === Batches totaling 2000 instances (2×2 to 5×5) ===
# 超轻量：2×2 网格，最小配置，生成速度最快
# 注意：2×2配置空间很小，容易重复，数量不宜过多
run_batch "TINY-1" \
  --count 50 --seed-start 9001 \
  --x 2 --y 2 --shapes 1 --keys 1 --locks 1 --prob-goal 0.50

run_batch "TINY-2" \
  --count 50 --seed-start 9501 \
  --x 2 --y 2 --shapes 2 --keys 2 --locks 2 --prob-goal 0.50

# 最轻量：3×3 网格，最小配置，生成速度最快
# 注意：3×3配置空间较大（约3780种），重复风险低
run_batch "MINI-1" \
  --count 200 --seed-start 10001 \
  --x 3 --y 3 --shapes 2 --keys 2 --locks 2 --prob-goal 0.50

# 轻量：4×4 网格、较少钥匙/锁，生成速度快
run_batch "EASY-1" \
  --count 300 --seed-start 11001 \
  --x 4 --y 4 --shapes 2 --keys 2 --locks 2 --prob-goal 0.50

run_batch "EASY-2" \
  --count 400 --seed-start 12001 \
  --x 4 --y 4 --shapes 2 --keys 3 --locks 3 --prob-goal 0.55

run_batch "EASY-3" \
  --count 200 --seed-start 12501 \
  --x 4 --y 4 --shapes 3 --keys 3 --locks 3 --prob-goal 0.55

# 中等：5×5 网格，保持钥匙/锁适中
run_batch "MEDIUM-1" \
  --count 300 --seed-start 13001 \
  --x 5 --y 5 --shapes 2 --keys 3 --locks 3 --prob-goal 0.55

run_batch "MEDIUM-2" \
  --count 350 --seed-start 14001 \
  --x 5 --y 5 --shapes 3 --keys 3 --locks 3 --prob-goal 0.55

# 过渡：5×5 + 形状 3 + 钥匙/锁 4，组合空间更大
run_batch "TRANSITION" \
  --count 150 --seed-start 17001 \
  --x 5 --y 5 --shapes 3 --keys 4 --locks 4 --prob-goal 0.58



TOTAL=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
echo "Done. Generated $TOTAL Grid problems in $TARGET_DIR"
