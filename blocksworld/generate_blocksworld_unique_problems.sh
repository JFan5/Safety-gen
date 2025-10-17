#!/usr/bin/env bash

set -euo pipefail

# Generate 1100 unique Blocksworld training problems from simple to complex.
# Requires: generate_blocksworld_training_unique.py in the same directory.

# Clear existing all_problems directory
rm -rf all_problems
mkdir -p all_problems

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYGEN="$SCRIPT_DIR/generate_blocksworld_training_unique.py"

if [[ ! -x "$PYGEN" && ! -f "$PYGEN" ]]; then
  echo "Error: $PYGEN not found" >&2
  exit 1
fi

# Strategy: start small and increase complexity
# Baseline 1100:
# - 3 ops, 3 blocks: 100
# - 3 ops, 4 blocks: 200  
# - 3 ops, 5 blocks: 200
# - 3 ops, 6 blocks: 100
# - 4 ops, 3 blocks: 100
# - 4 ops, 4 blocks: 200
# - 4 ops, 5 blocks: 200
# +1000 more (additional):
# - 3 ops, 3 blocks: 100
# - 3 ops, 4 blocks: 200  
# - 3 ops, 5 blocks: 200
# - 3 ops, 6 blocks: 100
# - 4 ops, 4 blocks: 200
# - 4 ops, 5 blocks: 200
# Total = 2100

TARGET_TOTAL=2100

echo "Generating Blocksworld training problems (total: $TARGET_TOTAL) ..."

# Baseline 1100 (原始配置)
python3 "$PYGEN" --count 100 --ops 3 --blocks 3 --seed-start 1 --out-dir all_problems
python3 "$PYGEN" --append --count 200 --ops 3 --blocks 4 --seed-start 100001 --out-dir all_problems
python3 "$PYGEN" --append --count 200 --ops 3 --blocks 5 --seed-start 300001 --out-dir all_problems
python3 "$PYGEN" --append --count 100 --ops 3 --blocks 6 --seed-start 300001 --out-dir all_problems

python3 "$PYGEN" --append --count 100 --ops 4 --blocks 3 --seed-start 200001 --out-dir all_problems
python3 "$PYGEN" --append --count 200 --ops 4 --blocks 4 --seed-start 300001 --out-dir all_problems
python3 "$PYGEN" --append --count 200 --ops 4 --blocks 5 --seed-start 300001 --out-dir all_problems

# +1000 more (新增部分)
python3 "$PYGEN" --append --count 100 --ops 3 --blocks 3 --seed-start 400001 --out-dir all_problems
python3 "$PYGEN" --append --count 200 --ops 3 --blocks 4 --seed-start 500001 --out-dir all_problems
python3 "$PYGEN" --append --count 200 --ops 3 --blocks 5 --seed-start 600001 --out-dir all_problems
python3 "$PYGEN" --append --count 100 --ops 3 --blocks 6 --seed-start 700001 --out-dir all_problems
python3 "$PYGEN" --append --count 200 --ops 4 --blocks 4 --seed-start 800001 --out-dir all_problems
python3 "$PYGEN" --append --count 200 --ops 4 --blocks 5 --seed-start 900001 --out-dir all_problems

echo "Done. Check: $SCRIPT_DIR/all_problems"