#!/usr/bin/env bash
set -euo pipefail

# Generate unique Spanner problems with adaptive tiering targeting ~5000 total.
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

echo "Generating Spanner problems into $TARGET_DIR (target ~5000)"

# Helper: run one tier with simple timing; if slow, scale down next low-capacity tiers
run_tier() {
  local COUNT="$1" S="$2" N="$3" L="$4" SEED="$5"
  local LABEL="s${S}-n${N}-l${L}"
  echo "  -> Tier ${LABEL} x ${COUNT}"
  local t0=$(date +%s)
  "$PYTHON_EXEC" "$GEN_PY" --output-dir "$TARGET_DIR" --append \
    --count "$COUNT" --spanners "$S" --nuts "$N" --locations "$L" --seed "$SEED"
  local t1=$(date +%s)
  local dt=$((t1 - t0))
  if [ "$COUNT" -gt 0 ] && [ "$dt" -gt 0 ]; then
    local rate_ms=$(( (dt * 1000) / COUNT ))
    echo "     Tier ${LABEL} throughput: ~${rate_ms} ms/problem"
    # If tier is notably slow (>500ms/problem), reduce subsequent low-capacity counts
    if [ "$rate_ms" -gt 500 ]; then
      export SLOW_TIER_SEEN=1
    fi
  fi
}

# Base allocation (heavier on higher combinatorial capacity)
# Sum ≈ 5000
T1=50    ; S1=2 ; N1=1 ; L1=3 ; SEED1=10001
T2=350   ; S2=2 ; N2=2 ; L2=3 ; SEED2=11001
T3=1100  ; S3=3 ; N3=2 ; L3=4 ; SEED3=12001
T4=1200  ; S4=3 ; N4=3 ; L4=4 ; SEED4=13001
T5=1150  ; S5=4 ; N5=3 ; L5=4 ; SEED5=14001
T6=1150  ; S6=4 ; N6=3 ; L6=5 ; SEED6=15001

# Optional downscale for early, lower-capacity tiers if generation seems slow
SLOW_TIER_SEEN=0

run_tier "$T1" "$S1" "$N1" "$L1" "$SEED1"
if [ "$SLOW_TIER_SEEN" = "1" ]; then T2=$(( T2 * 8 / 10 )); fi
run_tier "$T2" "$S2" "$N2" "$L2" "$SEED2"
if [ "$SLOW_TIER_SEEN" = "1" ]; then T3=$(( T3 * 9 / 10 )); fi
run_tier "$T3" "$S3" "$N3" "$L3" "$SEED3"
run_tier "$T4" "$S4" "$N4" "$L4" "$SEED4"
run_tier "$T5" "$S5" "$N5" "$L5" "$SEED5"
run_tier "$T6" "$S6" "$N6" "$L6" "$SEED6"

# Report
TOTAL=$(ls -1 "$TARGET_DIR"/*.pddl 2>/dev/null | wc -l || true)
echo "Generated $TOTAL problems in $TARGET_DIR."


