#!/usr/bin/env bash
set -euo pipefail

# Generate harder Spanner problems with 5 tiers of difficulty
# Tier distribution: 1400 problems per tier = 7000 total

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
GEN_PY="$SCRIPT_DIR/generate_unique_problems.py"
OUTPUT_DIR="$SCRIPT_DIR/all_problems"

echo "=== Generating Harder Spanner Problems ==="
echo "Output directory: $OUTPUT_DIR"

# Clean and create output directory
rm -rf "$OUTPUT_DIR" && mkdir -p "$OUTPUT_DIR"

# Tier 1: s=3, n=2, l=5 (1400 problems)
echo "Generating Tier 1: s=3, n=2, l=5..."
python3 "$GEN_PY" --output-dir "$OUTPUT_DIR" --append --count 1400 --spanners 3 --nuts 2 --locations 5 --seed 20001

# Tier 2: s=4, n=3, l=5 (1400 problems)
echo "Generating Tier 2: s=4, n=3, l=5..."
python3 "$GEN_PY" --output-dir "$OUTPUT_DIR" --append --count 1400 --spanners 4 --nuts 3 --locations 5 --seed 21001

# Tier 3: s=5, n=4, l=6 (1400 problems)
echo "Generating Tier 3: s=5, n=4, l=6..."
python3 "$GEN_PY" --output-dir "$OUTPUT_DIR" --append --count 1400 --spanners 5 --nuts 4 --locations 6 --seed 22001

# Tier 4: s=5, n=5, l=7 (1400 problems)
echo "Generating Tier 4: s=5, n=5, l=7..."
python3 "$GEN_PY" --output-dir "$OUTPUT_DIR" --append --count 1400 --spanners 5 --nuts 5 --locations 7 --seed 23001

# Tier 5: s=6, n=5, l=8 (1400 problems)
echo "Generating Tier 5: s=6, n=5, l=8..."
python3 "$GEN_PY" --output-dir "$OUTPUT_DIR" --append --count 1400 --spanners 6 --nuts 5 --locations 8 --seed 24001

echo ""
echo "=== Generation Complete ==="
echo "Total problems: $(ls "$OUTPUT_DIR"/*.pddl 2>/dev/null | wc -l)"
echo ""
echo "Next steps:"
echo "  1. Solve with PDDL2: python3 ../../script/solve_problems_optic.py all_problems domain.pddl 60"
echo "  2. Remove unsolved: for f in all_problems/*.pddl; do [ ! -f \"\${f%.pddl}.soln\" ] && rm -f \"\$f\"; done"
echo "  3. Convert to PDDL3: python3 convert_training_to_pddl3.py --input all_problems --output all_problems3 --safety-mode portfolio --portfolio-size 3 --difficulty hard --invert-order-from-plan --invert-count 2"
