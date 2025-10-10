#!/usr/bin/env bash
set -euo pipefail

# Generate 1100 Spanner problems in a single directory from simple to complex.
# Usage:
#   ./generate_spanner_training.sh [OUTPUT_DIR]
# Default OUTPUT_DIR = all_problems

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON_EXEC="${PYTHON_EXEC:-python3}"
GEN_PY="$SCRIPT_DIR/generate_simple_problems.py"

OUT_DIR="${1:-$SCRIPT_DIR/all_problems}"

# Start clean output directory
rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

echo "Generating Spanner problems into $OUT_DIR (target total: 1100)"

# Strategy: simpler first, then increase complexity.
# Tune counts per tier to reach total 1100 with growing difficulty.

# Tier 1: very small
"$PYTHON_EXEC" "$GEN_PY" --output-dir "$OUT_DIR" --append --count 200 --spanners 2 --nuts 1 --locations 3 --seed 10001

# Tier 2
"$PYTHON_EXEC" "$GEN_PY" --output-dir "$OUT_DIR" --append --count 250 --spanners 2 --nuts 2 --locations 3 --seed 11001

# Tier 3
"$PYTHON_EXEC" "$GEN_PY" --output-dir "$OUT_DIR" --append --count 250 --spanners 3 --nuts 2 --locations 4 --seed 12001

# Tier 4
"$PYTHON_EXEC" "$GEN_PY" --output-dir "$OUT_DIR" --append --count 200 --spanners 3 --nuts 3 --locations 4 --seed 13001

# Tier 5: slightly larger
"$PYTHON_EXEC" "$GEN_PY" --output-dir "$OUT_DIR" --append --count 200 --spanners 4 --nuts 3 --locations 5 --seed 14001

# Total = 1100

TOTAL=$(ls -1 "$OUT_DIR"/*.pddl 2>/dev/null | wc -l || true)
echo "Generated $TOTAL problems in $OUT_DIR (expected 1100)."


