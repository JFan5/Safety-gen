#!/usr/bin/env bash
set -euo pipefail

# Delivery end-to-end pipeline (generate → solve → convert → validate → solve pddl3 → prune → split → report)

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

PYTHON="/usr/bin/env python3"

DOMAIN_PDDL="$SCRIPT_DIR/domain.pddl"
DOMAIN3_PDDL="$SCRIPT_DIR/domain3.pddl"

ALL_PDDL2_DIR="$SCRIPT_DIR/all_problems"
ALL_PDDL3_DIR="$SCRIPT_DIR/all_problems3"

REPORT_MD="$SCRIPT_DIR/generatepipeline.md"

echo "[1/7] Generate ~5000 unique PDDL2 problems (adaptive tiers)"
"$SCRIPT_DIR/generate_delivery_training_unique.sh" "$ALL_PDDL2_DIR"

echo "[2/7] Solve PDDL2 problems with optic"
pushd "$SCRIPT_DIR" >/dev/null
"$PYTHON" "$ROOT_DIR/script/solve_problems_optic.py" "$ALL_PDDL2_DIR" "$DOMAIN_PDDL" || true
popd >/dev/null

echo "[3/7] Convert problems to PDDL3 with constraints"
"$PYTHON" "$SCRIPT_DIR/convert_pddl3.py" "$ALL_PDDL2_DIR" "$ALL_PDDL3_DIR"

echo "[4/7] Validate old (PDDL2) solutions on PDDL3 problems"
"$PYTHON" "$ROOT_DIR/script/validate_classical_solvers.py" \
  --domain "$DOMAIN3_PDDL" \
  --problems_dir "$ALL_PDDL3_DIR" \
  --solutions_dir "$ALL_PDDL2_DIR" || true

echo "[5/7] Solve PDDL3 problems with optic"
pushd "$SCRIPT_DIR" >/dev/null
"$PYTHON" "$ROOT_DIR/script/solve_problems_optic.py" "$ALL_PDDL3_DIR" "$DOMAIN3_PDDL" || true
popd >/dev/null

echo "[6/7] Validate and prune invalid PDDL3 problems/solutions"
"$PYTHON" "$ROOT_DIR/script/validate_classical_solvers.py" \
  --domain "$DOMAIN3_PDDL" \
  --problems_dir "$ALL_PDDL3_DIR" \
  --solutions_dir "$ALL_PDDL3_DIR" || true

echo "Pruning invalid pairs via Validate..."
shopt -s nullglob
valid_count=0
invalid_count=0
for sol in "$ALL_PDDL3_DIR"/*.soln; do
  prob="${sol%.soln}.pddl"
  if [[ ! -f "$prob" ]]; then
    rm -f "$sol"
    continue
  fi
  if Validate "$DOMAIN3_PDDL" "$prob" "$sol" >/dev/null 2>&1; then
    valid_count=$((valid_count+1))
  else
    rm -f "$prob" "$sol"
    invalid_count=$((invalid_count+1))
  fi
done
echo "Kept $valid_count valid pairs; removed $invalid_count invalid pairs."

echo "[7/7] Split 200 testing problems"
"$PYTHON" "$ROOT_DIR/script/split_problems.py" \
  --input-dir "$ALL_PDDL3_DIR" \
  --num-testing 200 \
  --force

echo "Generating report -> $REPORT_MD"
total2=$(ls -1 "$ALL_PDDL2_DIR"/*.pddl 2>/dev/null | wc -l | tr -d ' ')
solved2=$(ls -1 "$ALL_PDDL2_DIR"/*.soln 2>/dev/null | wc -l | tr -d ' ')
total3=$(ls -1 "$ALL_PDDL3_DIR"/*.pddl 2>/dev/null | wc -l | tr -d ' ')
solved3=$(ls -1 "$ALL_PDDL3_DIR"/*.soln 2>/dev/null | wc -l | tr -d ' ')

cat > "$REPORT_MD" <<'EOF'
### Delivery Pipeline Report

EOF
{
  echo "- **PDDL2 problems**: $total2"
  echo "- **PDDL2 solved**: $solved2"
  echo "- **PDDL3 problems after pruning**: $total3"
  echo "- **PDDL3 solved**: $solved3"
  echo "- **Testing split size**: 200"
} >> "$REPORT_MD"

echo "Done. See $REPORT_MD"


