#!/usr/bin/env bash
# =============================================================================
# Validate PDDL3 problems using PDDL2 solutions - Spanner Domain
# =============================================================================
# Usage:
#   ./validate_solutions.sh [dataset]
#   dataset: sft, grpo, testing, sft_hard, grpo_hard, testing_hard, or all
#
# Non-hard datasets: use PDDL2 solutions from all_problems/
# Hard datasets: use PDDL2 solutions from all_problems_hard/
#
# Output:
#   JSON reports in pddl3/spanner/validation_reports/
# =============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"

VALIDATE_SCRIPT="$ROOT_DIR/script/validate_classical_solvers.py"
DOMAIN3="$SCRIPT_DIR/domain3.pddl"
PDDL2_SOLUTIONS="$SCRIPT_DIR/all_problems"
PDDL2_SOLUTIONS_HARD="$SCRIPT_DIR/all_problems"

REPORT_DIR="$SCRIPT_DIR/validation_reports"
mkdir -p "$REPORT_DIR"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

# validate_dataset: Validate PDDL3 problems using PDDL2 solutions
validate_dataset() {
    local name=$1
    local problems_dir=$2
    local solutions_dir=$3
    local output_file="$REPORT_DIR/${name}_validation.json"

    log "=== Validating $name ==="
    log "  PDDL3 problems: $problems_dir"
    log "  PDDL2 solutions: $solutions_dir"
    log "  Domain: $DOMAIN3"
    log "  Output: $output_file"

    python3 "$VALIDATE_SCRIPT" \
        --domain "$DOMAIN3" \
        --problems_dir "$problems_dir" \
        --solutions_dir "$solutions_dir" \
        --output "$output_file" \
        --timeout 30

    log ""
}

DATASET="${1:-all}"

case "$DATASET" in
    sft)
        validate_dataset "sft_500" "$SCRIPT_DIR/sft_500" "$PDDL2_SOLUTIONS"
        ;;
    grpo)
        validate_dataset "grpo_500" "$SCRIPT_DIR/grpo_500" "$PDDL2_SOLUTIONS"
        ;;
    testing)
        validate_dataset "testing_200" "$SCRIPT_DIR/testing_200" "$PDDL2_SOLUTIONS"
        ;;
    sft_hard)
        validate_dataset "sft_500_hard" "$SCRIPT_DIR/sft_500_hard" "$PDDL2_SOLUTIONS_HARD"
        ;;
    grpo_hard)
        validate_dataset "grpo_500_hard" "$SCRIPT_DIR/grpo_500_hard" "$PDDL2_SOLUTIONS_HARD"
        ;;
    testing_hard)
        validate_dataset "testing_problem50_hard" "$SCRIPT_DIR/testing_problem50_hard" "$PDDL2_SOLUTIONS_HARD"
        ;;
    all)
        validate_dataset "sft_500" "$SCRIPT_DIR/sft_500" "$PDDL2_SOLUTIONS"
        validate_dataset "grpo_500" "$SCRIPT_DIR/grpo_500" "$PDDL2_SOLUTIONS"
        validate_dataset "testing_200" "$SCRIPT_DIR/testing_200" "$PDDL2_SOLUTIONS"
        validate_dataset "sft_500_hard" "$SCRIPT_DIR/sft_500_hard" "$PDDL2_SOLUTIONS_HARD"
        validate_dataset "grpo_500_hard" "$SCRIPT_DIR/grpo_500_hard" "$PDDL2_SOLUTIONS_HARD"
        validate_dataset "testing_problem50_hard" "$SCRIPT_DIR/testing_problem50_hard" "$PDDL2_SOLUTIONS_HARD"
        ;;
    *)
        echo "Usage: $0 [sft|grpo|testing|sft_hard|grpo_hard|testing_hard|all]"
        exit 1
        ;;
esac

log "=== Validation Complete ==="
log "Reports saved to: $REPORT_DIR"
ls -la "$REPORT_DIR"/*.json 2>/dev/null || true
