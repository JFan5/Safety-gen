#!/usr/bin/env bash

set -euo pipefail

# Generate 1100 unique Blocksworld training problems from simple to complex.
# Requires: generate_blocksworld_training_unique.py in the same directory.

rm -rf training_problems
mkdir -p training_problems

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYGEN="$SCRIPT_DIR/generate_blocksworld_training_unique.py"

if [[ ! -x "$PYGEN" && ! -f "$PYGEN" ]]; then
  echo "Error: $PYGEN not found" >&2
  exit 1
fi

# Strategy: start small and increase complexity
# - 3 ops, 3 blocks: 400
# - 3 ops, 4 blocks: 300
# - 4 ops, 3 blocks: 200
# - 4 ops, 4 blocks: 200
# Total = 1100

TARGET_TOTAL=1100

echo "Generating Blocksworld training problems (total: $TARGET_TOTAL) ..."

# Start seeds far apart to reduce collisions, uniqueness is still ensured by hash.
python3 "$PYGEN" --count 100 --ops 3 --blocks 3 --seed-start 1
python3 "$PYGEN" --append --count 200 --ops 3 --blocks 4 --seed-start 100001
python3 "$PYGEN" --append --count 200 --ops 3 --blocks 5 --seed-start 300001
python3 "$PYGEN" --append --count 100 --ops 3 --blocks 6 --seed-start 300001

python3 "$PYGEN" --append --count 100 --ops 4 --blocks 3 --seed-start 200001
python3 "$PYGEN" --append --count 200 --ops 4 --blocks 4 --seed-start 300001
python3 "$PYGEN" --append --count 200 --ops 4 --blocks 5 --seed-start 300001

echo "Done. Check: $SCRIPT_DIR/all_problems"