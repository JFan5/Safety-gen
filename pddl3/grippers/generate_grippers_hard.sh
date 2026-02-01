#!/usr/bin/env bash
set -euo pipefail

# Generate harder Grippers problems with 5 tiers of difficulty
# Tier distribution: 1400 problems per tier = 7000 total

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
GEN_PY="$SCRIPT_DIR/gen_unique_grippers.py"
OUTPUT_DIR="$SCRIPT_DIR/all_problems_hard"

echo "=== Generating Harder Grippers Problems ==="
echo "Output directory: $OUTPUT_DIR"

# Clean and create output directory
rm -rf "$OUTPUT_DIR" && mkdir -p "$OUTPUT_DIR"

# Tier 1: n=1, r=4, o=4 (1400 problems)
echo "Generating Tier 1: n=1, r=4, o=4..."
python3 "$GEN_PY" --target-dir "$OUTPUT_DIR" --count 1400 --robots 1 --rooms 4 --objects 4 --seed 40001

# Tier 2: n=2, r=4, o=4 (1400 problems)
echo "Generating Tier 2: n=2, r=4, o=4..."
python3 "$GEN_PY" --target-dir "$OUTPUT_DIR" --count 1400 --robots 2 --rooms 4 --objects 4 --seed 41001

# Tier 3: n=2, r=5, o=5 (1400 problems)
echo "Generating Tier 3: n=2, r=5, o=5..."
python3 "$GEN_PY" --target-dir "$OUTPUT_DIR" --count 1400 --robots 2 --rooms 5 --objects 5 --seed 42001

# Tier 4: n=2, r=5, o=6 (1400 problems)
echo "Generating Tier 4: n=2, r=5, o=6..."
python3 "$GEN_PY" --target-dir "$OUTPUT_DIR" --count 1400 --robots 2 --rooms 5 --objects 6 --seed 43001

# Tier 5: n=2, r=6, o=6 (1400 problems)
echo "Generating Tier 5: n=2, r=6, o=6..."
python3 "$GEN_PY" --target-dir "$OUTPUT_DIR" --count 1400 --robots 2 --rooms 6 --objects 6 --seed 44001

echo ""
echo "=== Generation Complete ==="
echo "Total problems: $(ls "$OUTPUT_DIR"/*.pddl 2>/dev/null | wc -l)"
