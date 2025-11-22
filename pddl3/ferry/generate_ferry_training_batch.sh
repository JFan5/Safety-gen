#!/usr/bin/env bash
set -euo pipefail

# Adaptive batch generator for Ferry problems targeting 5000 instances.
# Usage:
#   ./generate_ferry_training_batch.sh [OUTPUT_DIR] [PYTHON_EXEC]
# Defaults:
#   OUTPUT_DIR = $(dirname "$0")/all_problems
#   PYTHON_EXEC = ${PYTHON_EXEC:-python3}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"
PYTHON_EXEC="${2:-${PYTHON_EXEC:-python3}}"
GENERATOR_PY="$SCRIPT_DIR/gen_unique_ferry.py"

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
  "$PYTHON_EXEC" "$GENERATOR_PY" "$@" --target-dir "$TARGET_DIR"
  progress "$label"
}

echo "Generating Ferry training problems (target: 5000 instances)"
echo "Adaptive batches: rotate parameter sets; small per-call counts to avoid stalls"

TARGET_TOTAL=5000

# Parameter sets: (locations, cars, per_call_count, seed_start)
declare -a LOCS=(3 3 4 5 4 5 6 6)
declare -a CARS=(2 3 2 2 3 3 2 3)
declare -a COUNTS=(200 300 300 400 400 500 400 500)
declare -a SEEDS=(21001 22001 23001 24001 25001 26001 27001 28001)

total=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
round=0

while (( total < TARGET_TOTAL )); do
  for idx in "${!LOCS[@]}"; do
    if (( total >= TARGET_TOTAL )); then break; fi
    locs=${LOCS[$idx]}
    cars=${CARS[$idx]}
    batch=${COUNTS[$idx]}
    seed_start=${SEEDS[$idx]}
    remaining=$(( TARGET_TOTAL - total ))
    req=$batch
    if (( req > remaining )); then req=$remaining; fi
    label="L${locs}-C${cars}-R${round}"
    before=$total
    run_batch "$label" \
      --count "$req" \
      --locations "$locs" \
      --cars "$cars" \
      --seed "$(( seed_start + round * 111 ))"
    total=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
    # If no progress for this combo, reduce requested batch next time
    if (( total == before )) && (( COUNTS[$idx] > 100 )); then
      COUNTS[$idx]=$(( COUNTS[$idx] - 50 ))
    fi
  done
  round=$(( round + 1 ))
  # Safety: avoid infinite loop; break if too many rounds without growth
  if (( round > 200 )); then
    echo "Warning: reached many rounds; current total=$total (<$TARGET_TOTAL). Exiting early."
    break
  fi
done

TOTAL=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
echo "Done. Generated $TOTAL Ferry problems in $TARGET_DIR"


