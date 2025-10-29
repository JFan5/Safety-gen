#!/usr/bin/env bash
set -euo pipefail

# Generate unique Delivery problems prioritizing simplest instances first (trucks-style).
# Usage:
#   ./generate_delivery_training_unique.sh [OUTPUT_DIR] [PYTHON_EXEC]
# Defaults:
#   OUTPUT_DIR = delivery/all_problems
#   PYTHON_EXEC = /usr/bin/python3

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON_EXEC="${2:-${PYTHON_EXEC:-/home/fjl2401/miniconda3/bin/python}}"
GEN_PY="$SCRIPT_DIR/gen_unique_delivery.py"
TARGET_DIR="${1:-$SCRIPT_DIR/all_problems}"

# Start clean
rm -rf "$TARGET_DIR"
echo "Removing $TARGET_DIR"
mkdir -p "$TARGET_DIR"

# Seed (can be adjusted if needed)
SEED=10001

SEED=${SEED:-10001}

# Adaptive generation helper: generate in chunks; if slow or timeout, downscale remaining and spill to faster tiers.
TIMEOUT_BIN="$(command -v timeout || true)"
has_timeout=0
if [[ -n "$TIMEOUT_BIN" ]]; then has_timeout=1; fi

count_tier() {
  local size="$1" pkgs="$2"
  ls -1 "$TARGET_DIR"/delivery-s${size}-p${pkgs}-*.pddl 2>/dev/null | wc -l | tr -d ' '
}

gen_tier_adaptive() {
  local size="$1" pkgs="$2" target="$3" chunk="$4" max_secs="$5"
  local before after made sofar=0 start_ts now_ts elapsed=0 rc=0
  before=$(count_tier "$size" "$pkgs")
  start_ts=$(date +%s)
  while [[ $sofar -lt $target ]]; do
    now_ts=$(date +%s)
    elapsed=$(( now_ts - start_ts ))
    if [[ $elapsed -ge $max_secs ]]; then
      echo "[gen] tier s=$size p=$pkgs reached time budget ${max_secs}s, stopping early (made=$sofar/${target})."
      break
    fi
    if [[ $has_timeout -eq 1 ]]; then
      "$TIMEOUT_BIN" $(( max_secs - elapsed ))s "$PYTHON_EXEC" "$GEN_PY" \
        --count "$chunk" \
        --target-dir "$TARGET_DIR" \
        --size "$size" \
        --packages "$pkgs" \
        --seed "$SEED" \
        --domain "$SCRIPT_DIR/domain.pddl" || rc=$?
      # 124 is GNU timeout exit on timeout; treat as no-progress and break
      if [[ ${rc:-0} -eq 124 ]]; then
        echo "[gen] timeout on s=$size p=$pkgs; reducing/ending this tier."
        break
      fi
    else
      "$PYTHON_EXEC" "$GEN_PY" \
        --count "$chunk" \
        --target-dir "$TARGET_DIR" \
        --size "$size" \
        --packages "$pkgs" \
        --seed "$SEED" \
        --domain "$SCRIPT_DIR/domain.pddl" || true
    fi
    after=$(count_tier "$size" "$pkgs")
    made=$(( after - before ))
    sofar=$made
    # If no new problems produced, consider this tier stalled and stop
    if [[ $chunk -gt 1 && $after -le $before ]]; then
      echo "[gen] no progress for s=$size p=$pkgs (chunk=$chunk), marking as stalled."
      break
    fi
  done
  echo "[gen] tier s=$size p=$pkgs produced $(count_tier "$size" "$pkgs") files total."
  # Return how many were produced in this tier in this run via global variable GEN_MADE
  GEN_MADE=$(( $(count_tier "$size" "$pkgs") - before ))
}

# Baseline plan totaling ~5000, from fast → heavy
declare -a TIERS=(
  "2 1 100 200 120"   # size pkgs target chunk max_secs
  "2 2 500 200 180"
  "3 1 800 200 240"
  "3 2 1500 200 420"
  "4 1 900 150 420"
  "4 2 1200 100 600"
)

TARGET_TOTAL=5000
REMAIN=$TARGET_TOTAL

for spec in "${TIERS[@]}"; do
  set -- $spec
  size="$1"; pkgs="$2"; want="$3"; chunk="$4"; maxs="$5"
  # Cap want by remaining to avoid overshoot
  if [[ $REMAIN -le 0 ]]; then break; fi
  if [[ $want -gt $REMAIN ]]; then want=$REMAIN; fi
  echo "[gen] starting tier s=$size p=$pkgs want=$want chunk=$chunk max=${maxs}s"
  gen_tier_adaptive "$size" "$pkgs" "$want" "$chunk" "$maxs"
  made="$GEN_MADE"
  if [[ -z "$made" ]]; then made=0; fi
  if [[ $made -lt $want ]]; then
    # Not enough produced for this tier, push the leftover to remaining to be filled by later tiers
    deficit=$(( want - made ))
    echo "[gen] tier s=$size p=$pkgs under-produced by $deficit; will attempt to fill with later tiers."
  fi
  # Update remaining against actual made
  REMAIN=$(( REMAIN - made ))
  echo "[gen] remaining target: $REMAIN"
done

# If still short, top-up using faster tiers in a loop
if [[ $REMAIN -gt 0 ]]; then
  echo "[gen] starting top-up to reach $TARGET_TOTAL (remain $REMAIN)"
  for round in 1 2 3 4 5; do
    [[ $REMAIN -le 0 ]] && break
    for spec in "3 2 400 200 240" "3 1 300 200 180" "2 2 300 200 120"; do
      set -- $spec
      size="$1"; pkgs="$2"; want="$3"; chunk="$4"; maxs="$5"
      [[ $REMAIN -le 0 ]] && break
      if [[ $want -gt $REMAIN ]]; then want=$REMAIN; fi
      echo "[gen][topup] s=$size p=$pkgs want=$want"
      gen_tier_adaptive "$size" "$pkgs" "$want" "$chunk" "$maxs"
      made="$GEN_MADE"; [[ -z "$made" ]] && made=0
      REMAIN=$(( REMAIN - made ))
      echo "[gen][topup] remaining: $REMAIN"
    done
  done
fi

# Report
TOTAL=$(ls -1 "$TARGET_DIR"/*.pddl 2>/dev/null | wc -l || true)
echo "Generated $TOTAL problems in $TARGET_DIR."


