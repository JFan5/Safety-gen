#!/usr/bin/env bash
set -euo pipefail

# Generate unique Spanner problems prioritizing simpler instances first.
# Usage:
#   ./generate_spanner_training_unique.sh [OUTPUT_DIR] [PYTHON_EXEC]
# Defaults:
#   OUTPUT_DIR = spanner/all_problems
#   PYTHON_EXEC = ${PYTHON_EXEC:-python3}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON_EXEC="${2:-${PYTHON_EXEC:-python3}}"
GEN_PY="$SCRIPT_DIR/generate_unique_problems.py"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"

# Start clean
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

echo "Generating Spanner problems into $TARGET_DIR (target ~2100)"

# Use a stable base seed per tier so runs are reproducible
SEED=10001

# Tiers: tune counts to total ~1100, increasing complexity gradually

# Tier 1
"$PYTHON_EXEC" "$GEN_PY" --output-dir "$TARGET_DIR" --append \
  --count 40  --spanners 2 --nuts 1 --locations 3 --seed 10001

# Tier 2
"$PYTHON_EXEC" "$GEN_PY" --output-dir "$TARGET_DIR" --append \
  --count 100 --spanners 2 --nuts 2 --locations 3 --seed 11001

# Tier 3
"$PYTHON_EXEC" "$GEN_PY" --output-dir "$TARGET_DIR" --append \
  --count 260 --spanners 3 --nuts 2 --locations 4 --seed 12001

# Tier 4
"$PYTHON_EXEC" "$GEN_PY" --output-dir "$TARGET_DIR" --append \
  --count 400 --spanners 3 --nuts 3 --locations 4 --seed 13001

# Tier 5 max L(1+s+n)= 5^7 = 78125
"$PYTHON_EXEC" "$GEN_PY" --output-dir "$TARGET_DIR" --append \
  --count 600 --spanners 4 --nuts 3 --locations 4 --seed 13001

# Tier 6 max L(1+s+n)= 5^8 = 390625
"$PYTHON_EXEC" "$GEN_PY" --output-dir "$TARGET_DIR" --append \
  --count 700 --spanners 4 --nuts 3 --locations 5 --seed 14001

# Report
TOTAL=$(ls -1 "$TARGET_DIR"/*.pddl 2>/dev/null | wc -l || true)
echo "Generated $TOTAL problems in $TARGET_DIR."


