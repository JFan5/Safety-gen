#!/usr/bin/env bash

set -euo pipefail

# Generate ~5000 unique Blocksworld problems, balanced by (ops, blocks)
# Favor configurations with higher combinatorial space to ensure smooth generation.
# Uses generate_blocksworld_training_unique.py in this directory.

# Output directory
OUT_DIR="all_problems"

# Clear output dir
rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYGEN="$SCRIPT_DIR/generate_blocksworld_training_unique.py"

if [[ ! -x "$PYGEN" && ! -f "$PYGEN" ]]; then
  echo "Error: $PYGEN not found" >&2
  exit 1
fi

TARGET_TOTAL=5000

# Config space: ops in {3,4}, blocks in {3,4,5,6}
# Weights: increase with blocks; slight bump for 4-ops
# weight = (blocks - 2) + 0.3*(ops-3)
OPS_LIST=(3 4)
BLOCKS_LIST=(3 4 5 6)

# Precompute weights and allocate target counts proportional to weight
# Store as triplets: ops blocks weight
CONFIGS=()
TOTAL_WEIGHT=0
for ops in "${OPS_LIST[@]}"; do
  for blocks in "${BLOCKS_LIST[@]}"; do
    # bash doesn't do floats well; scale by 10 to avoid bc
    base=$(( (blocks - 2) * 10 ))          # 10, 20, 30, 40
    bump=$(( (ops - 3) * 3 ))              # 0 for ops=3, 3 for ops=4
    w=$(( base + bump ))
    CONFIGS+=("$ops $blocks $w")
    TOTAL_WEIGHT=$(( TOTAL_WEIGHT + w ))
  done
done

# Initial integer allocation
declare -A ALLOC
SUM_ALLOC=0
for cfg in "${CONFIGS[@]}"; do
  read -r ops blocks w <<< "$cfg"
  # round down; remainder distributed later
  cnt=$(( TARGET_TOTAL * w / TOTAL_WEIGHT ))
  ALLOC["$ops,$blocks"]=$cnt
  SUM_ALLOC=$(( SUM_ALLOC + cnt ))
done

# Distribute remainder (greedy to highest weights)
REMAIN=$(( TARGET_TOTAL - SUM_ALLOC ))
if (( REMAIN > 0 )); then
  # Sort CONFIGS by weight desc
  mapfile -t SORTED < <(printf '%s
' "${CONFIGS[@]}" | awk '{printf "%s %s %06d\n", $1, $2, $3}' | sort -k3,3nr)
  i=0
  while (( REMAIN > 0 )); do
    read -r ops blocks _ <<< "${SORTED[i]}"
    key="$ops,$blocks"
    ALLOC["$key"]=$(( ALLOC["$key"] + 1 ))
    REMAIN=$(( REMAIN - 1 ))
    i=$(( (i + 1) % ${#SORTED[@]} ))
  done
fi

# Resilient generation in batches per configuration.
# If a batch fails (slow or duplicate saturation), back off batch size and continue.

echo "Generating Blocksworld unique problems -> $TARGET_TOTAL total"
echo "Allocation:"
for cfg in "${CONFIGS[@]}"; do
  read -r ops blocks w <<< "$cfg"
  key="$ops,$blocks"
  echo "  ops=$ops blocks=$blocks -> ${ALLOC[$key]}"
done

generate_cfg() {
  local ops=$1
  local blocks=$2
  local target=$3
  local seed_start=$4

  local generated=0
  local batch=200   # start with 200 for higher throughput
  local min_batch=50
  local seed=$seed_start

  while (( generated < target )); do
    # Cap final batch to remaining
    local need=$(( target - generated ))
    local take=$batch
    if (( take > need )); then take=$need; fi

    # Run one batch; avoid abort-on-error for this call
    set +e
    python3 "$PYGEN" \
      --append \
      --count "$take" \
      --ops "$ops" \
      --blocks "$blocks" \
      --seed-start "$seed" \
      --out-dir "$OUT_DIR"
    local rc=$?
    set -e

    if (( rc == 0 )); then
      generated=$(( generated + take ))
      seed=$(( seed + take ))
      echo "  [ok] ops=$ops blocks=$blocks +$take (total $generated/$target)"
      # If smoothly generating, try to increase batch slightly for high-cap configs
      if (( batch < 400 )); then
        batch=$(( batch + 50 ))
      fi
    else
      echo "  [slow] ops=$ops blocks=$blocks batch=$take failed; backing off"
      if (( batch > min_batch )); then
        batch=$(( batch / 2 ))
        if (( batch < min_batch )); then batch=$min_batch; fi
      else
        # Make progress one minimal batch at a time; bump seed window
        seed=$(( seed + take ))
      fi
    fi
  done
}

# Generate across configs; assign non-overlapping seed ranges per config
SEED_BASE=1
SEED_STRIDE=200000   # large gap per config to avoid any overlap
for cfg in "${CONFIGS[@]}"; do
  read -r ops blocks w <<< "$cfg"
  key="$ops,$blocks"
  target=${ALLOC["$key"]}
  if (( target <= 0 )); then
    SEED_BASE=$(( SEED_BASE + SEED_STRIDE ))
    continue
  fi
  echo "\n[Config] ops=$ops blocks=$blocks target=$target seeds>=$SEED_BASE"
  generate_cfg "$ops" "$blocks" "$target" "$SEED_BASE"
  SEED_BASE=$(( SEED_BASE + SEED_STRIDE ))
done

echo "Done. Check: $SCRIPT_DIR/$OUT_DIR"