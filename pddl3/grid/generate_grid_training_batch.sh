#!/usr/bin/env bash
set -euo pipefail

# Batch generator for Grid problems totaling 2100 instances across varied settings.
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

echo "Generating Grid training problems (target: 5000 instances)"
echo "Adaptive batches: favor high-combination settings while keeping throughput smooth"

# === Adaptive batches totaling 5000 ===
# 轻量：小网格、较少钥匙/锁，生成速度快
run_batch "EASY-1" \
  --count 300 --seed-start 11001 \
  --x 4 --y 4 --shapes 2 --keys 2 --locks 2 --prob-goal 0.50

run_batch "EASY-2" \
  --count 400 --seed-start 12001 \
  --x 4 --y 4 --shapes 2 --keys 3 --locks 3 --prob-goal 0.55

# 中等：增加网格或形状，保持钥匙/锁适中
run_batch "MEDIUM-1" \
  --count 700 --seed-start 13001 \
  --x 5 --y 5 --shapes 2 --keys 3 --locks 3 --prob-goal 0.55

run_batch "MEDIUM-2" \
  --count 900 --seed-start 14001 \
  --x 5 --y 5 --shapes 3 --keys 3 --locks 3 --prob-goal 0.55

# 过渡：5×5 + 形状 3 + 钥匙/锁 4，组合空间更大
run_batch "TRANSITION" \
  --count 900 --seed-start 17001 \
  --x 5 --y 5 --shapes 3 --keys 4 --locks 4 --prob-goal 0.58

# 稍难：6×6 保持较低钥匙/锁，保证生成流畅
run_batch "HARD-LITE-1" \
  --count 700 --seed-start 15001 \
  --x 6 --y 6 --shapes 3 --keys 3 --locks 3 --prob-goal 0.60

run_batch "HARD-LITE-2" \
  --count 800 --seed-start 16001 \
  --x 6 --y 6 --shapes 3 --keys 4 --locks 4 --prob-goal 0.60

# 高组合上限：6×6 + 形状 4 + 钥匙/锁 6，适度分配数量
run_batch "HARD-HEAVY" \
  --count 300 --seed-start 18001 \
  --x 6 --y 6 --shapes 4 --keys 6 --locks 6 --prob-goal 0.60
TOTAL=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
echo "Done. Generated $TOTAL Grid problems in $TARGET_DIR"
