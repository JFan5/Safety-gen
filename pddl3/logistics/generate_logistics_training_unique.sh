#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON_EXEC="${2:-${PYTHON_EXEC:-/usr/bin/python3}}"
GEN_PY="$SCRIPT_DIR/generate_unique_problems.py"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"

BASE_SEED="${SEED:-10001}"
MAX_ATTEMPTS="${MAX_ATTEMPTS:-20}"

# 默认开启去重与参数命名
UNIQUE_OPT=(--unique)
NAME_OPT=(--use-param-filename)

echo "Removing $TARGET_DIR"
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

# -----------------------------------------------------------------------------
echo "[GEN] c=2 s=3 p=4 a=1 count=400 seed=$((BASE_SEED+0))"
$PYTHON_EXEC "$GEN_PY" \
  --type single \
  --cities 2 --city-size 3 --packages 4 --airplanes 1 \
  --seed $((BASE_SEED+0)) \
  --num 500 \
  --output-dir "$TARGET_DIR" \
  --max-attempts-per-problem "$MAX_ATTEMPTS" \
  "${UNIQUE_OPT[@]}" "${NAME_OPT[@]}"

# -----------------------------------------------------------------------------
echo "[GEN] c=2 s=3 p=6 a=1 count=400 seed=$((BASE_SEED+400))"
$PYTHON_EXEC "$GEN_PY" \
  --type single \
  --cities 2 --city-size 3 --packages 6 --airplanes 1 \
  --seed $((BASE_SEED+400)) \
  --num 600 \
  --output-dir "$TARGET_DIR" \
  --max-attempts-per-problem "$MAX_ATTEMPTS" \
  "${UNIQUE_OPT[@]}" "${NAME_OPT[@]}"

# -----------------------------------------------------------------------------
echo "[GEN] c=3 s=4 p=8 a=2 count=400 seed=$((BASE_SEED+800))"
$PYTHON_EXEC "$GEN_PY" \
  --type single \
  --cities 3 --city-size 4 --packages 8 --airplanes 2 \
  --seed $((BASE_SEED+800)) \
  --num 600 \
  --output-dir "$TARGET_DIR" \
  --max-attempts-per-problem "$MAX_ATTEMPTS" \
  "${UNIQUE_OPT[@]}" "${NAME_OPT[@]}"

# -----------------------------------------------------------------------------
echo "[GEN] c=3 s=4 p=6 a=2 count=300 seed=$((BASE_SEED+1200))"
$PYTHON_EXEC "$GEN_PY" \
  --type single \
  --cities 3 --city-size 4 --packages 6 --airplanes 2 \
  --seed $((BASE_SEED+1200)) \
  --num 300 \
  --output-dir "$TARGET_DIR" \
  --max-attempts-per-problem "$MAX_ATTEMPTS" \
  "${UNIQUE_OPT[@]}" "${NAME_OPT[@]}"


# -----------------------------------------------------------------------------
echo "[GEN] c=2 s=5 p=7 a=2 count=200 seed=$((BASE_SEED+1600))"
$PYTHON_EXEC "$GEN_PY" \
  --type single \
  --cities 2 --city-size 5 --packages 7 --airplanes 2 \
  --seed $((BASE_SEED+1600)) \
  --num 1000 \
  --output-dir "$TARGET_DIR" \
  --max-attempts-per-problem "$MAX_ATTEMPTS" \
  "${UNIQUE_OPT[@]}" "${NAME_OPT[@]}"

# -----------------------------------------------------------------------------
echo "[GEN] c=4 s=3 p=6 a=2 count=300 seed=$((BASE_SEED+1800))"
$PYTHON_EXEC "$GEN_PY" \
  --type single \
  --cities 4 --city-size 3 --packages 6 --airplanes 2 \
  --seed $((BASE_SEED+1800)) \
  --num 1000 \
  --output-dir "$TARGET_DIR" \
  --max-attempts-per-problem "$MAX_ATTEMPTS" \
  "${UNIQUE_OPT[@]}" "${NAME_OPT[@]}"


echo "[GEN] c=4 s=3 p=5 a=2 count=300 seed=$((BASE_SEED+1800))"
$PYTHON_EXEC "$GEN_PY" \
  --type single \
  --cities 4 --city-size 3 --packages 5 --airplanes 2 \
  --seed $((BASE_SEED+2000)) \
  --num 1000 \
  --output-dir "$TARGET_DIR" \
  --max-attempts-per-problem "$MAX_ATTEMPTS" \
  "${UNIQUE_OPT[@]}" "${NAME_OPT[@]}"
#
#-----------------------------------------------------------------------------
TOTAL=$(find "$TARGET_DIR" -maxdepth 1 -name "*.pddl" | wc -l)
echo "Generated $TOTAL problems in $TARGET_DIR"
