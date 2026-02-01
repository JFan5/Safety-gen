#!/usr/bin/env bash
set -euo pipefail

# Generate harder Ferry problems with 5 tiers of difficulty
# Tier distribution: 1400 problems per tier = 7000 total

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
GEN_PY="$SCRIPT_DIR/gen_unique_ferry.py"
OUTPUT_DIR="$SCRIPT_DIR/all_problems_hard"

echo "=== Generating Harder Ferry Problems ==="
echo "Output directory: $OUTPUT_DIR"

# Clean and create output directory
rm -rf "$OUTPUT_DIR" && mkdir -p "$OUTPUT_DIR"

# Tier 1: l=4, c=3 (1400 problems)
echo "Generating Tier 1: l=4, c=3..."
python3 "$GEN_PY" --target-dir "$OUTPUT_DIR" --count 1400 --locations 4 --cars 3 --seed 30001

# Tier 2: l=5, c=3 (1400 problems)
echo "Generating Tier 2: l=5, c=3..."
python3 "$GEN_PY" --target-dir "$OUTPUT_DIR" --count 1400 --locations 5 --cars 3 --seed 31001

# Tier 3: l=5, c=4 (1400 problems)
echo "Generating Tier 3: l=5, c=4..."
python3 "$GEN_PY" --target-dir "$OUTPUT_DIR" --count 1400 --locations 5 --cars 4 --seed 32001

# Tier 4: l=6, c=4 (1400 problems)
echo "Generating Tier 4: l=6, c=4..."
python3 "$GEN_PY" --target-dir "$OUTPUT_DIR" --count 1400 --locations 6 --cars 4 --seed 33001

# Tier 5: l=7, c=5 (1400 problems)
echo "Generating Tier 5: l=7, c=5..."
python3 "$GEN_PY" --target-dir "$OUTPUT_DIR" --count 1400 --locations 7 --cars 5 --seed 34001

echo ""
echo "=== Generation Complete ==="
echo "Total problems: $(ls "$OUTPUT_DIR"/*.pddl 2>/dev/null | wc -l)"
