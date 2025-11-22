#!/usr/bin/env bash
set -euo pipefail

# Adaptive batch generator to produce ~5000 unique Rovers problems.
# - Allocates counts across parameter sets by combinatorial weight
# - Samples generation speed per set and downweights slow configs
# Usage:
#   ./generate_rovers_training_batch.sh [OUTPUT_DIR] [PYTHON_EXEC]
# Defaults:
#   OUTPUT_DIR = rovers/all_problems
#   PYTHON_EXEC = ${PYTHON_EXEC:-/usr/bin/env python3}
PYTHON_EXEC="/usr/bin/python3"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"
PYTHON_EXEC="${2:-${PYTHON_EXEC}}"
GENERATOR_PY="$SCRIPT_DIR/generate_rovers_training_unique.py"

if [[ ! -f "$GENERATOR_PY" ]]; then
  echo "Error: $GENERATOR_PY not found" >&2
  exit 1
fi

TOTAL_TARGET=5000

echo "Clearing output directory: $TARGET_DIR"
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

function progress() {
  local label="$1"
  local count
  count=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
  echo "Progress after $label: $count problems"
}

# Define parameter batches: rovers waypoints objectives cameras goals base_weight seed_start
# Heavier configs receive larger base_weight; seeds spaced to avoid collisions
BATCHES=(
  "1 6 2 1 2 1 1"        # light
  "1 8 3 2 2 2 10001"    # medium
  "2 10 3 2 3 3 20001"   # medium-heavy
  "2 12 4 3 3 4 30001"   # heavy
  "1 12 4 3 3 3 40001"   # heavy (single rover but larger map)
)

# Measure per-problem generation time for each batch on a small sample, in a temp dir
declare -a TIMINGS
SAMPLE_COUNT=20
echo "Sampling generation speed (per batch, $SAMPLE_COUNT problems each)..."
for idx in "${!BATCHES[@]}"; do
  read -r R W O C G WEIGHT SEED <<<"${BATCHES[$idx]}"
  TMPDIR=$(mktemp -d)
  start=$(date +%s)
  if ! "$PYTHON_EXEC" "$GENERATOR_PY" \
    --count "$SAMPLE_COUNT" --seed-start "$SEED" \
    --rovers "$R" --waypoints "$W" --objectives "$O" --cameras "$C" --goals "$G" \
    --out-dir "$TMPDIR" >/dev/null 2>&1; then
    # If sampling fails, treat as very slow
    dur=9999
  else
    end=$(date +%s)
    dur=$(( end - start ))
    if [[ $dur -le 0 ]]; then dur=1; fi
  fi
  rm -rf "$TMPDIR"
  # time per problem in seconds (integer)
  tpp=$(( dur / SAMPLE_COUNT ))
  if [[ $tpp -le 0 ]]; then tpp=1; fi
  TIMINGS[$idx]=$tpp
  echo "  Batch $((idx+1)): R=$R W=$W O=$O C=$C G=$G -> ${tpp}s/problem (sampled)"
done

# Compute adjusted weights: base_weight divided by relative slowness
declare -a ADJ_WEIGHTS
sum_weights=0
for idx in "${!BATCHES[@]}"; do
  read -r _R _W _O _C _G WEIGHT _SEED <<<"${BATCHES[$idx]}"
  tpp=${TIMINGS[$idx]}
  # Faster (smaller tpp) => larger adjusted weight; ensure divisor >=1
  adj=$(( WEIGHT * 10 / tpp ))
  if [[ $adj -le 0 ]]; then adj=1; fi
  ADJ_WEIGHTS[$idx]=$adj
  sum_weights=$(( sum_weights + adj ))
done

# Allocate counts proportional to adjusted weights, enforce TOTAL_TARGET
declare -a COUNTS
allocated=0
for idx in "${!BATCHES[@]}"; do
  w=${ADJ_WEIGHTS[$idx]}
  cnt=$(( TOTAL_TARGET * w / sum_weights ))
  if [[ $cnt -le 0 ]]; then cnt=1; fi
  COUNTS[$idx]=$cnt
  allocated=$(( allocated + cnt ))
done
# Fix rounding by adjusting the last batch
if [[ $allocated -ne $TOTAL_TARGET ]]; then
  last=$(( ${#BATCHES[@]} - 1 ))
  delta=$(( TOTAL_TARGET - allocated ))
  COUNTS[$last]=$(( COUNTS[$last] + delta ))
fi

echo "Final per-batch allocation (target total: $TOTAL_TARGET):"
total_print=0
for idx in "${!BATCHES[@]}"; do
  read -r R W O C G WEIGHT SEED <<<"${BATCHES[$idx]}"
  cnt=${COUNTS[$idx]}
  total_print=$(( total_print + cnt ))
  echo "  Batch $((idx+1)): R=$R W=$W O=$O C=$C G=$G weight=${ADJ_WEIGHTS[$idx]} -> count=$cnt"
done
echo "  Total: $total_print"

echo "Generating Rover training problems (adaptive, chunked)..."

# Initialize remaining targets per batch and simple performance stats
declare -a REMAIN
declare -a LAST_TPP
declare -a LAST_YIELD
total_remain=0
for idx in "${!BATCHES[@]}"; do
  REMAIN[$idx]=${COUNTS[$idx]}
  LAST_TPP[$idx]=${TIMINGS[$idx]:-1}
  LAST_YIELD[$idx]=100  # percent
  total_remain=$(( total_remain + REMAIN[$idx] ))
done

# Dynamic round-robin generation in chunks
iteration=0
while [[ $total_remain -gt 0 ]]; do
  iteration=$((iteration + 1))
  for idx in "${!BATCHES[@]}"; do
    remain=${REMAIN[$idx]}
    (( remain > 0 )) || continue

    read -r R W O C G WEIGHT SEED <<<"${BATCHES[$idx]}"

    # Derive chunk size based on remaining, last yield and tpp
    base_chunk=$(( remain / 10 ))
    if [[ $base_chunk -lt 50 ]]; then base_chunk=50; fi
    if [[ $base_chunk -gt 300 ]]; then base_chunk=300; fi
    tpp=${LAST_TPP[$idx]}
    yieldp=${LAST_YIELD[$idx]}
    # If slow (>2s/problem) or low yield (<70%), shrink chunk; if fast (<0.3s) and good yield, grow chunk
    if [[ $tpp -gt 2 || $yieldp -lt 70 ]]; then
      base_chunk=$(( base_chunk / 2 ))
      if [[ $base_chunk -lt 20 ]]; then base_chunk=20; fi
    elif [[ $tpp -lt 1 && $yieldp -ge 90 ]]; then
      base_chunk=$(( base_chunk + 100 ))
      if [[ $base_chunk -gt 500 ]]; then base_chunk=500; fi
    fi
    if [[ $base_chunk -gt $remain ]]; then base_chunk=$remain; fi

    echo "[ITER $iteration][BATCH $((idx+1))] R=$R W=$W O=$O C=$C G=$G chunk=$base_chunk remain=$remain"
    before=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
    start=$(date +%s)
    set +e
    "$PYTHON_EXEC" "$GENERATOR_PY" \
      --count "$base_chunk" --seed-start "$SEED" \
      --rovers "$R" --waypoints "$W" --objectives "$O" --cameras "$C" --goals "$G" \
      --out-dir "$TARGET_DIR"
    rc=$?
    set -e
    end=$(date +%s)
    after=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
    added=$(( after - before ))
    dur=$(( end - start ))
    if [[ $dur -le 0 ]]; then dur=1; fi
    # Update stats
    if [[ $added -gt 0 ]]; then
      LAST_TPP[$idx]=$(( dur / added ))
      if [[ ${LAST_TPP[$idx]} -le 0 ]]; then LAST_TPP[$idx]=1; fi
    fi
    if [[ $base_chunk -gt 0 ]]; then
      LAST_YIELD[$idx]=$(( 100 * added / base_chunk ))
    else
      LAST_YIELD[$idx]=0
    fi

    echo "  -> added=$added in ${dur}s (tpp~${LAST_TPP[$idx]}s, yield=${LAST_YIELD[$idx]}%)"

    if [[ $added -eq 0 || $rc -ne 0 ]]; then
      # Likely uniqueness/exhaustion or failure: mark this batch as exhausted and redistribute its remainder
      dead=$remain
      REMAIN[$idx]=0
      # Redistribute equally to other active batches
      active=0
      for j in "${!BATCHES[@]}"; do
        if [[ ${REMAIN[$j]} -gt 0 ]]; then active=$((active + 1)); fi
      done
      if [[ $active -gt 0 ]]; then
        share=$(( dead / active ))
        if [[ $share -lt 1 ]]; then share=1; fi
        for j in "${!BATCHES[@]}"; do
          if [[ ${REMAIN[$j]} -gt 0 ]]; then REMAIN[$j]=$(( REMAIN[$j] + share )); fi
        done
      fi
    else
      # Normal decrement; also bump seed to avoid overlaps next round
      REMAIN[$idx]=$(( remain - added ))
      # Increase seed start by the attempted chunk to diversify next call
      next_seed=$(( SEED + base_chunk + iteration ))
      BATCHES[$idx]="${R} ${W} ${O} ${C} ${G} ${WEIGHT} ${next_seed}"
    fi

    total_remain=0
    for j in "${!BATCHES[@]}"; do total_remain=$(( total_remain + REMAIN[$j] )); done
    progress "iter ${iteration}, batch $((idx+1))"
    if [[ $total_remain -le 0 ]]; then break; fi
  done
done

TOTAL=$(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.pddl' | wc -l | tr -d ' ')
echo "Done. Generated $TOTAL rover training problems in $TARGET_DIR"
