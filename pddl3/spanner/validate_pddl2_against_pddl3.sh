#!/usr/bin/env bash
# =============================================================================
# Validate PDDL3 solutions against PDDL3 problems
# =============================================================================
# This script validates that PDDL3 solutions are valid for their corresponding
# PDDL3 problems (with constraints).
#
# Usage:
#   ./validate_pddl2_against_pddl3.sh [dataset]
#
#   dataset: sft, grpo, testing, sft_hard, grpo_hard, testing_hard, or all
#
# Output:
#   JSON reports in pddl3/spanner/validation_reports/
# =============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"

VALIDATE_SCRIPT="$ROOT_DIR/script/validate_classical_solvers.py"
DOMAIN3="$SCRIPT_DIR/domain3.pddl"

# Output directory for reports
REPORT_DIR="$SCRIPT_DIR/validation_reports"
mkdir -p "$REPORT_DIR"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

validate_dataset() {
    local name=$1
    local data_dir=$2
    local output_file="$REPORT_DIR/${name}_validation.json"

    log "=== Validating $name ==="
    log "  PDDL3 problems & solutions: $data_dir"
    log "  Domain: $DOMAIN3"
    log "  Output: $output_file"

    python3 "$VALIDATE_SCRIPT" \
        --domain "$DOMAIN3" \
        --problems_dir "$data_dir" \
        --solutions_dir "$data_dir" \
        --output "$output_file" \
        --timeout 30

    log ""
}

# Parse arguments
DATASET="${1:-all}"

case "$DATASET" in
    sft)
        validate_dataset "sft_500" "$SCRIPT_DIR/sft_500"
        ;;
    grpo)
        validate_dataset "grpo_500" "$SCRIPT_DIR/grpo_500"
        ;;
    testing)
        validate_dataset "testing_200" "$SCRIPT_DIR/testing_200"
        ;;
    sft_hard)
        validate_dataset "sft_500_hard" "$SCRIPT_DIR/sft_500_hard"
        ;;
    grpo_hard)
        validate_dataset "grpo_500_hard" "$SCRIPT_DIR/grpo_500_hard"
        ;;
    testing_hard)
        validate_dataset "testing_problem50_hard" "$SCRIPT_DIR/testing_problem50_hard"
        ;;
    all)
        validate_dataset "sft_500" "$SCRIPT_DIR/sft_500"
        validate_dataset "grpo_500" "$SCRIPT_DIR/grpo_500"
        validate_dataset "testing_200" "$SCRIPT_DIR/testing_200"
        validate_dataset "sft_500_hard" "$SCRIPT_DIR/sft_500_hard"
        validate_dataset "grpo_500_hard" "$SCRIPT_DIR/grpo_500_hard"
        validate_dataset "testing_problem50_hard" "$SCRIPT_DIR/testing_problem50_hard"
        ;;
    *)
        echo "Usage: $0 [sft|grpo|testing|sft_hard|grpo_hard|testing_hard|all]"
        exit 1
        ;;
esac

log "=== Validation Complete ==="
log "Reports saved to: $REPORT_DIR"
ls -la "$REPORT_DIR"/*.json 2>/dev/null || true
