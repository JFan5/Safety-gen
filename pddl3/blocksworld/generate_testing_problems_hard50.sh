#!/usr/bin/env bash
set -euo pipefail

# Generate Blocksworld hard testing set: 50 problems total
# - Difficulty controlled by number of blocks: 6..10, 10 each
# - Must NOT overlap with training_problems3 (by SHA256 content hash)
# - If training_problems3 is absent, fallback to all_problems3/training as exclusion set
#
# Output: pddl3/blocksworld/testing_problems_hard50/
# Filenames: bw_ops<ops>_n<blocks>_seed<seed>.pddl
#
# Tunables (env vars):
# - OPS_LIST: space-separated ops variants to use (default: "4")
# - CLEAN: "1" to delete output dir before generating (default: "1")
# - SEED_BASE: base seed to start from (default: "9000000")
# - MAX_ATTEMPTS_PER_BLOCK: safety cap per blocks bucket (default: "200000")

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCENARIO_DIR="$SCRIPT_DIR"

OPS_LIST="${OPS_LIST:-4}"
CLEAN="${CLEAN:-1}"
SEED_BASE="${SEED_BASE:-9000000}"
MAX_ATTEMPTS_PER_BLOCK="${MAX_ATTEMPTS_PER_BLOCK:-200000}"

GEN_BIN="$SCENARIO_DIR/blocksworld"
OUT_DIR="$SCENARIO_DIR/testing_problems_hard50"

if ! command -v python3 >/dev/null 2>&1; then
  echo "Error: python3 not found in PATH" >&2
  exit 1
fi

if [[ ! -x "$GEN_BIN" ]]; then
  echo "Error: generator wrapper not found/executable: $GEN_BIN" >&2
  exit 1
fi

# Ensure generator dependencies exist (bwstates + 2pddl for requested ops)
ensure_deps() {
  local need_ops_list=("$@")
  echo "Ensuring generator deps via make (ops=${need_ops_list[*]})..."
  make -C "$SCENARIO_DIR" bwstates >/dev/null

  for ops in "${need_ops_list[@]}"; do
    case "$ops" in
      3) make -C "$SCENARIO_DIR" 3ops >/dev/null ;;
      4) make -C "$SCENARIO_DIR" 4ops >/dev/null ;;
      *) echo "Error: unsupported ops=$ops (expected 3 or 4)" >&2; exit 1 ;;
    esac
  done

  if [[ ! -x "$SCENARIO_DIR/bwstates.1/bwstates" ]]; then
    echo "Error: missing bwstates binary after make: $SCENARIO_DIR/bwstates.1/bwstates" >&2
    exit 1
  fi
  if [[ -f "$SCENARIO_DIR/3ops/2pddl/2pddl" && ! -x "$SCENARIO_DIR/3ops/2pddl/2pddl" ]]; then
    echo "Error: 3ops 2pddl exists but not executable: $SCENARIO_DIR/3ops/2pddl/2pddl" >&2
    exit 1
  fi
  if [[ -f "$SCENARIO_DIR/4ops/2pddl/2pddl" && ! -x "$SCENARIO_DIR/4ops/2pddl/2pddl" ]]; then
    echo "Error: 4ops 2pddl exists but not executable: $SCENARIO_DIR/4ops/2pddl/2pddl" >&2
    exit 1
  fi
}

if [[ "$CLEAN" == "1" ]]; then
  rm -rf "$OUT_DIR"
fi
mkdir -p "$OUT_DIR"

tmpdir="$(mktemp -d)"
cleanup() { rm -rf "$tmpdir"; }
trap cleanup EXIT

EXCLUDE_HASHES="$tmpdir/exclude_hashes.txt"
ACCEPTED_HASHES="$tmpdir/accepted_hashes.txt"
touch "$EXCLUDE_HASHES" "$ACCEPTED_HASHES"

collect_hashes() {
  local dir="$1"
  if [[ ! -d "$dir" ]]; then
    return 0
  fi
  # shellcheck disable=SC2016
  find "$dir" -type f -name "*.pddl" \
    ! -name "domain.pddl" ! -name "domain3.pddl" \
    -print0 | xargs -0 -r sha256sum | awk '{print $1}' >> "$EXCLUDE_HASHES"
}

TRAIN_DIR_1="$SCENARIO_DIR/training_problems3"
TRAIN_DIR_2="$SCENARIO_DIR/all_problems3/training"

collect_hashes "$TRAIN_DIR_1"
collect_hashes "$TRAIN_DIR_2"

sort -u "$EXCLUDE_HASHES" -o "$EXCLUDE_HASHES"
cp "$EXCLUDE_HASHES" "$ACCEPTED_HASHES"

excluded_count="$(wc -l < "$EXCLUDE_HASHES" | tr -d ' ')"
if [[ -d "$TRAIN_DIR_1" ]]; then
  echo "Excluding against: $TRAIN_DIR_1 (+ $TRAIN_DIR_2 if exists) | hashes=$excluded_count"
else
  echo "Warning: $TRAIN_DIR_1 not found; excluding against fallback: $TRAIN_DIR_2 | hashes=$excluded_count"
fi

ops_arr=()
for o in $OPS_LIST; do
  ops_arr+=("$o")
done
if (( ${#ops_arr[@]} == 0 )); then
  echo "Error: OPS_LIST is empty" >&2
  exit 1
fi

ensure_deps "${ops_arr[@]}"

# Preflight: ensure at least one call succeeds, otherwise we'll loop forever.
{
  pf_ops="${ops_arr[0]}"
  pf_blocks=6
  pf_seed=$(( SEED_BASE + pf_blocks * 100000 ))
  pf_tmp="$tmpdir/preflight.pddl"
  if ! (cd "$SCENARIO_DIR" && "$GEN_BIN" "$pf_ops" "$pf_blocks" "$pf_seed" > "$pf_tmp"); then
    echo "Error: generator preflight failed (ops=$pf_ops blocks=$pf_blocks seed=$pf_seed). Check build logs by running: make -C $SCENARIO_DIR" >&2
    exit 1
  fi
  if [[ ! -s "$pf_tmp" ]]; then
    echo "Error: generator preflight produced empty output (ops=$pf_ops blocks=$pf_blocks seed=$pf_seed)" >&2
    exit 1
  fi
  rm -f "$pf_tmp"
}

sha_of_file() {
  local f="$1"
  sha256sum "$f" | awk '{print $1}'
}

is_hash_seen() {
  local h="$1"
  grep -qx "$h" "$ACCEPTED_HASHES"
}

remember_hash() {
  local h="$1"
  printf '%s\n' "$h" >> "$ACCEPTED_HASHES"
}

count_by_blocks() {
  local n="$1"
  find "$OUT_DIR" -maxdepth 1 -type f -name "*_n${n}_*.pddl" | wc -l | tr -d ' '
}

echo "Generating to: $OUT_DIR"
echo "Using OPS_LIST: $OPS_LIST"

for blocks in 6 7 8 9 10; do
  target=10
  have="$(count_by_blocks "$blocks")"
  if (( have > target )); then
    echo "Error: output dir already has $have problems for n=$blocks (expected <= $target). Set CLEAN=1 or remove extras." >&2
    exit 1
  fi
  if (( have == target )); then
    echo "n=$blocks already complete ($have/$target); skipping"
    continue
  fi

seed=$(( SEED_BASE + blocks * 100000 ))
attempts=0

echo "n=$blocks: generating $(( target - have )) more (current $have/$target), seed_start=$seed"
while (( have < target )); do
  attempts=$(( attempts + 1 ))
  if (( attempts > MAX_ATTEMPTS_PER_BLOCK )); then
    echo "Error: exceeded MAX_ATTEMPTS_PER_BLOCK=$MAX_ATTEMPTS_PER_BLOCK for n=$blocks; try adjusting SEED_BASE or OPS_LIST" >&2
    exit 1
  fi

  # Round-robin ops variants so the bucket isn't accidentally biased.
  idx=$(( have % ${#ops_arr[@]} ))
  ops="${ops_arr[$idx]}"

  tmp_pddl="$tmpdir/cand_ops${ops}_n${blocks}_seed${seed}.pddl"
  if ! (cd "$SCENARIO_DIR" && "$GEN_BIN" "$ops" "$blocks" "$seed" > "$tmp_pddl"); then
    seed=$(( seed + 1 ))
    continue
  fi
  if [[ ! -s "$tmp_pddl" ]]; then
    seed=$(( seed + 1 ))
    continue
  fi

  h="$(sha_of_file "$tmp_pddl")"
  if is_hash_seen "$h"; then
    seed=$(( seed + 1 ))
    continue
  fi

  out_name="bw_ops${ops}_n${blocks}_seed${seed}.pddl"
  mv "$tmp_pddl" "$OUT_DIR/$out_name"
  remember_hash "$h"

  have=$(( have + 1 ))
  seed=$(( seed + 1 ))
  echo "  [ok] $out_name ($have/$target)"
done
done

echo ""
echo "Done. Final distribution:"
for blocks in 6 7 8 9 10; do
  echo "  n=$blocks: $(count_by_blocks "$blocks")"
done

total="$(find "$OUT_DIR" -maxdepth 1 -type f -name "*.pddl" | wc -l | tr -d ' ')"
if [[ "$total" != "50" ]]; then
  echo "Error: expected 50 total problems, got $total" >&2
  exit 1
fi

echo "Total: $total problems in $OUT_DIR"


