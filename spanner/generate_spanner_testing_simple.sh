#!/usr/bin/env bash
set -euo pipefail

# Generate simple testing problems (<=200) using two parameter tiers.
# Usage:
#   ./generate_spanner_testing_simple.sh [TOTAL_COUNT] [OUTPUT_DIR] [UNIQUE_AGAINST...]
# Defaults:
#   TOTAL_COUNT = 50
#   OUTPUT_DIR = spanner/all_problems/testing
#   UNIQUE_AGAINST = spanner/all_problems

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON_EXEC="${PYTHON_EXEC:-python3}"
TOTAL="${1:-200}"
if [ $# -gt 0 ]; then
  shift
fi
OUTPUT_DIR="${1:-$SCRIPT_DIR/all_problems/testing}"
if [ $# -gt 0 ]; then
  shift
fi
UNIQUE_SOURCES=("$@")
if [ ${#UNIQUE_SOURCES[@]} -eq 0 ]; then
  UNIQUE_SOURCES=("$SCRIPT_DIR/all_problems")
fi

if ! [[ "$TOTAL" =~ ^[0-9]+$ ]]; then
  echo "TOTAL_COUNT must be an integer (got '$TOTAL')" >&2
  exit 1
fi

if [ "$TOTAL" -le 0 ]; then
  echo "TOTAL_COUNT must be > 0" >&2
  exit 1
fi
if [ "$TOTAL" -gt 200 ]; then
  echo "TOTAL_COUNT ($TOTAL) exceeds cap of 200" >&2
  exit 1
fi

# Simple tiers favour fewer objects to keep instances easy.
TIER1_COUNT=$(( (TOTAL + 1) / 2 )) # ceil half
TIER2_COUNT=$(( TOTAL - TIER1_COUNT ))

TIER1_SPANNERS=2
TIER1_NUTS=1
TIER1_LOCATIONS=3
TIER1_SEED=30101

TIER2_SPANNERS=3
TIER2_NUTS=2
TIER2_LOCATIONS=4
TIER2_SEED=30202

echo "Generating $TOTAL testing problems into $OUTPUT_DIR"
echo " - Tier1: count=$TIER1_COUNT (s=$TIER1_SPANNERS n=$TIER1_NUTS l=$TIER1_LOCATIONS)"
echo " - Tier2: count=$TIER2_COUNT (s=$TIER2_SPANNERS n=$TIER2_NUTS l=$TIER2_LOCATIONS)"

rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

if [ "$TIER1_COUNT" -gt 0 ]; then
  "$PYTHON_EXEC" "$SCRIPT_DIR/generate_unique_problems.py" \
    --output-dir "$OUTPUT_DIR" \
    --count "$TIER1_COUNT" \
    --spanners "$TIER1_SPANNERS" \
    --nuts "$TIER1_NUTS" \
    --locations "$TIER1_LOCATIONS" \
    --seed "$TIER1_SEED" \
    --unique-against "${UNIQUE_SOURCES[@]}"
fi

if [ "$TIER2_COUNT" -gt 0 ]; then
  "$PYTHON_EXEC" "$SCRIPT_DIR/generate_unique_problems.py" \
    --output-dir "$OUTPUT_DIR" \
    --count "$TIER2_COUNT" \
    --spanners "$TIER2_SPANNERS" \
    --nuts "$TIER2_NUTS" \
    --locations "$TIER2_LOCATIONS" \
    --seed "$TIER2_SEED" \
    --append \
    --unique-against "${UNIQUE_SOURCES[@]}"
fi

TOTAL_WRITTEN=$(ls -1 "$OUTPUT_DIR"/*.pddl 2>/dev/null | wc -l || true)
echo "Finished. Total testing problems: $TOTAL_WRITTEN"
