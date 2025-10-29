#!/usr/bin/env bash
set -euo pipefail

# Batch generator for Zenotravel problems (easy -> harder).
# Usage:
#   ./generate_zenotravel_training_batch.sh [OUTPUT_DIR] [PYTHON_EXEC]
# Defaults:
#   OUTPUT_DIR = $(dirname "$0")/all_problems
#   PYTHON_EXEC = ${PYTHON_EXEC:-python3}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"
PYTHON_EXEC="${2:-${PYTHON_EXEC:-python3}}"
GENERATOR_PY="$SCRIPT_DIR/generate_zenotravel_training_unique.py"

if [[ ! -f "$GENERATOR_PY" ]]; then
  echo "Error: generator script not found at $GENERATOR_PY" >&2
  exit 1
fi

echo "Clearing output directory: $TARGET_DIR"
# rm -rf "$TARGET_DIR"
# mkdir -p "$TARGET_DIR"

estimate_variants() {
  local cities="$1"
  local planes="$2"
  local people="$3"
  "$PYTHON_EXEC" - "$cities" "$planes" "$people" <<'PY'
import sys
cities, planes, people = map(int, sys.argv[1:])
value = pow(cities, planes + people)
digits = len(str(value))
if digits <= 6:
    print(str(value))
else:
    s = str(value)
    print(f"~{s[0]}.{s[1:3]}e{digits-1}")
PY
}

progress() {
  local label="$1"
  local count
  count=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
  echo "Progress after $label: $count problems"
}

run_batch() {
  local label="$1"; shift
  local cities="$1"; shift
  local planes="$1"; shift
  local people="$1"; shift
  local desc="$1"; shift
  local max_variants
  max_variants=$(estimate_variants "$cities" "$planes" "$people")
  echo "[$label] params: cities=$cities planes=$planes people=$people $desc"
  echo "  -> approximate max unique placements: $max_variants"
  "$PYTHON_EXEC" "$GENERATOR_PY" "$@" --cities "$cities" --planes "$planes" --people "$people" --out-dir "$TARGET_DIR"
  progress "$label"
}

echo "Generating Zenotravel training problems (target: 2100 instances)"

run_batch "BATCH 1" 3 1 2 "(variant=strips, typed)" \
  --count 300 --seed-start 1 --variant strips --distance 60

run_batch "BATCH 2" 3 1 3 "(variant=strips, typed)" \
  --count 300 --seed-start 6001 --variant strips --distance 80

run_batch "BATCH 3" 4 2 4 "(variant=simple-time, typed)" \
  --count 300 --seed-start 12001 --variant strips --distance 120

run_batch "BATCH 4" 5 2 5 "(variant=time, typed)" \
  --count 300 --seed-start 18001 --variant strips --distance 150

run_batch "BATCH 5" 5 3 6 "(variant=numeric, typed)" \
  --count 300 --seed-start 24001 --variant strips --distance 180

run_batch "BATCH 6" 6 3 7 "(variant=complex, typed)" \
  --count 300 --seed-start 30001 --variant strips --distance 220

run_batch "BATCH 7" 6 4 8 "(variant=complex, untyped)" \
  --count 300 --seed-start 36001 --variant strips --distance 250 --untyped

TOTAL=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
echo "Done. Generated $TOTAL Zenotravel problems in $TARGET_DIR"
