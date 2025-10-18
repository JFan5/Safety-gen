#!/usr/bin/env bash
set -euo pipefail

# Generate unique grippers problems (PDDL2), prioritizing simpler instances first
# Usage:
#   ./generate_grippers_training_unique.sh [OUTPUT_DIR] [PYTHON_EXEC]
# Defaults:
#   OUTPUT_DIR = grippers/all_problems
#   PYTHON_EXEC = /usr/bin/python3

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON_EXEC="${2:-${PYTHON_EXEC:-/usr/bin/python3}}"
GEN_PY="$SCRIPT_DIR/gen_unique_grippers.py"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"

# Start clean
echo "Removing $TARGET_DIR"
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

SEED=${SEED:-10001}

"echo" "[BATCH] n=1 r=3 o=2 count=200 uniq=isomorphic"
"$PYTHON_EXEC" "$GEN_PY" \
  --count "200" \
  --target-dir "$TARGET_DIR" \
  --robots "2" \
  --rooms "3" \
  --objects "2" \
  --seed "$SEED" \
  --uniqueness "isomorphic"
echo "Progress: $(find "$TARGET_DIR" -maxdepth 1 -name '*.pddl' | wc -l | tr -d ' ') so far"

echo "[BATCH] n=1 r=3 o=3 count=300 uniq=isomorphic"
"$PYTHON_EXEC" "$GEN_PY" \
  --count "300" \
  --target-dir "$TARGET_DIR" \
  --robots "1" \
  --rooms "3" \
  --objects "3" \
  --seed "$SEED" \
  --uniqueness "isomorphic"
echo "Progress: $(find "$TARGET_DIR" -maxdepth 1 -name '*.pddl' | wc -l | tr -d ' ') so far"

echo "[BATCH] n=1 r=4 o=3 count=300 uniq=isomorphic"
"$PYTHON_EXEC" "$GEN_PY" \
  --count "400" \
  --target-dir "$TARGET_DIR" \
  --robots "1" \
  --rooms "4" \
  --objects "3" \
  --seed "$SEED" \
  --uniqueness "isomorphic"
echo "Progress: $(find "$TARGET_DIR" -maxdepth 1 -name '*.pddl' | wc -l | tr -d ' ') so far"

echo "[BATCH] n=2 r=3 o=3 count=300 uniq=isomorphic"
"$PYTHON_EXEC" "$GEN_PY" \
  --count "400" \
  --target-dir "$TARGET_DIR" \
  --robots "2" \
  --rooms "3" \
  --objects "3" \
  --seed "$SEED" \
  --uniqueness "isomorphic"
echo "Progress: $(find "$TARGET_DIR" -maxdepth 1 -name '*.pddl' | wc -l | tr -d ' ') so far"

echo "[BATCH] n=1 r=4 o=4 count=300 uniq=text"
"$PYTHON_EXEC" "$GEN_PY" \
  --count "400" \
  --target-dir "$TARGET_DIR" \
  --robots "2" \
  --rooms "4" \
  --objects "4" \
  --seed "$SEED" \
  --uniqueness "text"
echo "Progress: $(find "$TARGET_DIR" -maxdepth 1 -name '*.pddl' | wc -l | tr -d ' ') so far"

echo "[BATCH] n=2 r=4 o=3 count=300 uniq=text"
"$PYTHON_EXEC" "$GEN_PY" \
  --count "400" \
  --target-dir "$TARGET_DIR" \
  --robots "2" \
  --rooms "4" \
  --objects "3" \
  --seed "$SEED" \
  --uniqueness "text"
echo "Progress: $(find "$TARGET_DIR" -maxdepth 1 -name '*.pddl' | wc -l | tr -d ' ') so far"

# Report
TOTAL=$(ls -1 "$TARGET_DIR"/*.pddl 2>/dev/null | wc -l || true)
echo "Generated $TOTAL problems in $TARGET_DIR."


