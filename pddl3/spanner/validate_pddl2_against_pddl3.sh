#!/usr/bin/env bash
# =============================================================================
# Validate PDDL2 solutions against PDDL3 problems
# =============================================================================
# This script validates that PDDL2 solutions FAIL when run against PDDL3 problems
# (because the PDDL3 constraints should invalidate the PDDL2 solutions)
#
# Usage:
#   ./validate_pddl2_against_pddl3.sh [dataset]
#
#   dataset: sft, grpo, or testing (default: all)
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
    local pddl3_dir=$2
    local pddl2_dir=$3
    local output_file="$REPORT_DIR/${name}_pddl2_vs_pddl3.json"

    log "=== Validating $name ==="
    log "  PDDL3 problems: $pddl3_dir"
    log "  PDDL2 solutions: $pddl2_dir"
    log "  Domain: $DOMAIN3"
    log "  Output: $output_file"

    python3 "$VALIDATE_SCRIPT" \
        --domain "$DOMAIN3" \
        --problems_dir "$pddl3_dir" \
        --solutions_dir "$pddl2_dir" \
        --output "$output_file" \
        --timeout 30

    log ""
}

# Parse arguments
DATASET="${1:-all}"

case "$DATASET" in
    sft)
        validate_dataset "sft_500" "$SCRIPT_DIR/sft_500" "$SCRIPT_DIR/sft2_500"
        ;;
    grpo)
        validate_dataset "grpo_500" "$SCRIPT_DIR/grpo_500" "$SCRIPT_DIR/grpo2_500"
        ;;
    testing)
        validate_dataset "testing_200" "$SCRIPT_DIR/testing_200" "$SCRIPT_DIR/testing2_200"
        ;;
    all)
        validate_dataset "sft_500" "$SCRIPT_DIR/sft_500" "$SCRIPT_DIR/sft2_500"
        validate_dataset "grpo_500" "$SCRIPT_DIR/grpo_500" "$SCRIPT_DIR/grpo2_500"
        validate_dataset "testing_200" "$SCRIPT_DIR/testing_200" "$SCRIPT_DIR/testing2_200"
        ;;
    *)
        echo "Usage: $0 [sft|grpo|testing|all]"
        exit 1
        ;;
esac

log "=== Validation Complete ==="
log "Reports saved to: $REPORT_DIR"
ls -la "$REPORT_DIR"/*.json 2>/dev/null || true
