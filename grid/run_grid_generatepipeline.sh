#!/usr/bin/env bash
set -euo pipefail

# Grid end-to-end pipeline per generatepipeline.md steps
# 1. Generate unique problems (target 5000 via batch script)
# 2. Solve original problems with OPTIC
# 3. Convert to PDDL3 (create all_problems3)
# 4. Validate old solutions on new PDDL3 problems
# 5. Solve PDDL3 problems with OPTIC
# 6. Validate and delete invalid pairs
# 7. Split 200 testing

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCEN_DIR="$SCRIPT_DIR"

DOMAIN2="$SCEN_DIR/domain.pddl"
DOMAIN3="$SCEN_DIR/domain3.pddl"
ALL2_DIR="$SCEN_DIR/all_problems"
ALL3_DIR="$SCEN_DIR/all_problems3"

PY=python3
SOLVER_PY="$SCRIPT_DIR/../script/solve_problems_optic.py"
VALIDATE_PY="$SCRIPT_DIR/../script/validate_classical_solvers.py"
SPLIT_PY="$SCRIPT_DIR/../script/split_problems.py"
CONVERT_PY="$SCRIPT_DIR/convert_pddl3.py"

echo "==[1/7]== Generate unique problems (5000 target)"
chmod +x "$SCEN_DIR/generate_grid_training_batch.sh"
"$SCEN_DIR/generate_grid_training_batch.sh" "$ALL2_DIR" "$PY"

echo "==[2/7]== Solve original problems with OPTIC"
cd "$SCEN_DIR"
"$PY" "$SOLVER_PY" "$ALL2_DIR" "$DOMAIN2" 10 || true

echo "==[3/7]== Convert problems to PDDL3"
"$PY" "$CONVERT_PY" "$ALL2_DIR" "$ALL3_DIR" --domain "$DOMAIN3" || true

echo "==[4/7]== Validate old solutions against new problems (JSON saved)"
"$PY" "$VALIDATE_PY" --domain "$DOMAIN3" --problems_dir "$ALL3_DIR" --solutions_dir "$ALL2_DIR" || true
if [[ -f grid_validation_results.json ]]; then mv grid_validation_results.json grid_old_vs_new_validation_results.json; fi
if [[ -f grid_domain3_validation_results.json ]]; then mv grid_domain3_validation_results.json grid_old_vs_new_validation_results.json; fi

echo "==[5/7]== Solve PDDL3 problems with OPTIC"
"$PY" "$SOLVER_PY" "$ALL3_DIR" "$DOMAIN3" 10 || true

echo "==[6/7]== Validate PDDL3 solutions and delete invalid pairs"
"$PY" "$VALIDATE_PY" --domain "$DOMAIN3" --problems_dir "$ALL3_DIR" --solutions_dir "$ALL3_DIR" || true
if [[ -f grid_validation_results.json ]]; then mv grid_validation_results.json grid_all_problems3_validation_results.json; fi
if [[ -f grid_domain3_validation_results.json ]]; then mv grid_domain3_validation_results.json grid_all_problems3_validation_results.json; fi
if [[ -f grid_all_problems3_validation_results.json ]]; then "$PY" "$SCEN_DIR/cleanup_invalid_from_validation.py" grid_all_problems3_validation_results.json || true; fi

echo "==[7/7]== Split testing 200"
"$PY" "$SPLIT_PY" --input-dir "$ALL3_DIR" --num-testing 200 --force || true

echo "== Report =="
"$PY" "$SCEN_DIR/make_grid_pipeline_report.py" "$SCEN_DIR/generatepipeline.md" || true
echo "Report: $SCEN_DIR/generatepipeline.md"


