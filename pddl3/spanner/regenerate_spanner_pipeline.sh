#!/usr/bin/env bash
set -euo pipefail

# =============================================================================
# Spanner Domain PDDL3 Problem Regeneration Pipeline
# =============================================================================
# Generates harder PDDL3 problems with invalidating constraints.
#
# Output: sft_500, grpo_500, testing_200 problems
# Each problem:
#   - Has (always (imply ...)) constraint to reverse nut tightening order
#   - Has (forall (?m - man) (at-most-once (at ?m shed))) constraint
#   - PDDL2 solution FAILS when validated against PDDL3 problem
#   - < 1500 characters
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Paths
GEN_PY="$SCRIPT_DIR/generate_unique_problems.py"
CONVERT_PY="$SCRIPT_DIR/convert_training_to_pddl3.py"
VALIDATE_PY="$SCRIPT_DIR/validate_pddl3_invalidates_pddl2.py"
SPLIT_PY="$SCRIPT_DIR/split_datasets.py"
SOLVE_PY="$ROOT_DIR/script/solve_problems_optic.py"

DOMAIN_PDDL2="$SCRIPT_DIR/domain.pddl"
DOMAIN_PDDL3="$SCRIPT_DIR/domain3.pddl"

# Output directories
PDDL2_RAW="$SCRIPT_DIR/pddl2_raw"
PDDL3_ALL="$SCRIPT_DIR/pddl3_all"
PDDL3_VALIDATED="$SCRIPT_DIR/pddl3_validated"

# Final output directories
SFT_500="$SCRIPT_DIR/sft_500"
GRPO_500="$SCRIPT_DIR/grpo_500"
TESTING_200="$SCRIPT_DIR/testing_200"

# Configuration
MAX_CHARS=1500
SOLVE_TIMEOUT=30  # seconds per problem

# =============================================================================
# Helper Functions
# =============================================================================

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

check_prerequisites() {
    log "Checking prerequisites..."

    # Check Python scripts exist
    for script in "$GEN_PY" "$CONVERT_PY" "$VALIDATE_PY"; do
        if [[ ! -f "$script" ]]; then
            echo "ERROR: Required script not found: $script"
            exit 1
        fi
    done

    # Check domain files exist
    if [[ ! -f "$DOMAIN_PDDL2" ]]; then
        echo "ERROR: PDDL2 domain not found: $DOMAIN_PDDL2"
        exit 1
    fi
    if [[ ! -f "$DOMAIN_PDDL3" ]]; then
        echo "ERROR: PDDL3 domain not found: $DOMAIN_PDDL3"
        exit 1
    fi

    # Check OPTIC solver
    OPTIC_PATH="${HOME}/optic/release/optic/optic-clp"
    if [[ ! -x "$OPTIC_PATH" ]]; then
        echo "WARNING: OPTIC not found at $OPTIC_PATH"
        echo "  You may need to install OPTIC or adjust the path in solve_problems_optic.py"
    fi

    # Check VAL validator
    if ! command -v Validate &> /dev/null; then
        echo "WARNING: VAL Validate not found in PATH"
        echo "  Install VAL or ensure Validate is in PATH for validation step"
    fi

    log "Prerequisites check passed."
}

# =============================================================================
# Stage 1: Generate PDDL2 Problems
# =============================================================================
# Problem Parameters (within 1500 char limit after constraints):
# | Tier | Spanners | Nuts | Locations | Base Chars | With Constraints |
# |------|----------|------|-----------|------------|------------------|
# | 1    | 3        | 2    | 5         | ~900       | ~1100            |
# | 2    | 4        | 3    | 5         | ~1000      | ~1200            |
# | 3    | 4        | 4    | 6         | ~1150      | ~1350            |
#
# Distribution: 500 tier1 + 700 tier2 + 300 tier3 = 1500 total
# After solving/validation: ~1200 expected

stage1_generate_pddl2() {
    log "=== STAGE 1: Generate PDDL2 Problems ==="

    rm -rf "$PDDL2_RAW" && mkdir -p "$PDDL2_RAW"

    # Tier 1: s=3, n=2, l=5 (500 problems)
    log "Generating Tier 1: s=3, n=2, l=5 (500 problems)..."
    python3 "$GEN_PY" --output-dir "$PDDL2_RAW" --append \
        --count 500 --spanners 3 --nuts 2 --locations 5 --seed 50001

    # Tier 2: s=4, n=3, l=5 (700 problems)
    log "Generating Tier 2: s=4, n=3, l=5 (700 problems)..."
    python3 "$GEN_PY" --output-dir "$PDDL2_RAW" --append \
        --count 700 --spanners 4 --nuts 3 --locations 5 --seed 51001

    # Tier 3: s=4, n=4, l=6 (300 problems)
    log "Generating Tier 3: s=4, n=4, l=6 (300 problems)..."
    python3 "$GEN_PY" --output-dir "$PDDL2_RAW" --append \
        --count 300 --spanners 4 --nuts 4 --locations 6 --seed 52001

    local total_generated=$(ls "$PDDL2_RAW"/*.pddl 2>/dev/null | wc -l)
    log "Generated $total_generated PDDL2 problems in $PDDL2_RAW"
}

# =============================================================================
# Stage 2: Solve with OPTIC
# =============================================================================

stage2_solve_pddl2() {
    log "=== STAGE 2: Solve PDDL2 Problems with OPTIC ==="

    if [[ ! -d "$PDDL2_RAW" ]]; then
        echo "ERROR: PDDL2_RAW directory not found: $PDDL2_RAW"
        exit 1
    fi

    # Solve all problems
    log "Solving problems (timeout: ${SOLVE_TIMEOUT}s per problem)..."
    python3 "$SOLVE_PY" "$PDDL2_RAW" "$DOMAIN_PDDL2" "$SOLVE_TIMEOUT"

    # Count results
    local total_pddl=$(ls "$PDDL2_RAW"/*.pddl 2>/dev/null | wc -l)
    local total_soln=$(ls "$PDDL2_RAW"/*.soln 2>/dev/null | wc -l)

    log "Solved $total_soln / $total_pddl problems"

    # Remove unsolved problems (those without .soln files)
    log "Removing unsolved problems..."
    local removed=0
    for pddl_file in "$PDDL2_RAW"/*.pddl; do
        local soln_file="${pddl_file%.pddl}.soln"
        if [[ ! -f "$soln_file" ]]; then
            rm -f "$pddl_file"
            ((removed++)) || true
        fi
    done
    log "Removed $removed unsolved problems"

    local remaining=$(ls "$PDDL2_RAW"/*.pddl 2>/dev/null | wc -l)
    log "Remaining solved problems: $remaining"
}

# =============================================================================
# Stage 3: Convert to PDDL3 with Invalidating Constraints
# =============================================================================

stage3_convert_to_pddl3() {
    log "=== STAGE 3: Convert to PDDL3 with Invalidating Constraints ==="

    if [[ ! -d "$PDDL2_RAW" ]]; then
        echo "ERROR: PDDL2_RAW directory not found: $PDDL2_RAW"
        exit 1
    fi

    rm -rf "$PDDL3_ALL" && mkdir -p "$PDDL3_ALL"

    log "Converting to PDDL3 with spanner-invalidating constraints..."
    python3 "$CONVERT_PY" \
        --input "$PDDL2_RAW" \
        --output "$PDDL3_ALL" \
        --constraint-style spanner-invalidating

    # Copy .soln files too (these are PDDL2 solutions that should fail)
    log "Copying PDDL2 solutions (for validation)..."
    for soln_file in "$PDDL2_RAW"/*.soln; do
        if [[ -f "$soln_file" ]]; then
            cp "$soln_file" "$PDDL3_ALL/"
        fi
    done

    local total_pddl3=$(ls "$PDDL3_ALL"/*.pddl 2>/dev/null | wc -l)
    log "Converted $total_pddl3 problems to PDDL3 format"
}

# =============================================================================
# Stage 4: Validate PDDL3 Problems
# =============================================================================

stage4_validate() {
    log "=== STAGE 4: Validate PDDL3 Problems ==="

    if [[ ! -d "$PDDL3_ALL" ]]; then
        echo "ERROR: PDDL3_ALL directory not found: $PDDL3_ALL"
        exit 1
    fi

    rm -rf "$PDDL3_VALIDATED" && mkdir -p "$PDDL3_VALIDATED"

    log "Validating PDDL3 problems (PDDL2 solutions should FAIL)..."
    python3 "$VALIDATE_PY" \
        --pddl3-dir "$PDDL3_ALL" \
        --pddl2-dir "$PDDL2_RAW" \
        --domain "$DOMAIN_PDDL3" \
        --output-dir "$PDDL3_VALIDATED" \
        --max-chars "$MAX_CHARS" \
        --verbose

    local total_validated=$(ls "$PDDL3_VALIDATED"/*.pddl 2>/dev/null | wc -l)
    log "Validated $total_validated problems"
}

# =============================================================================
# Stage 5: Split into SFT, GRPO, Testing Datasets
# =============================================================================

stage5_split_datasets() {
    log "=== STAGE 5: Split into SFT, GRPO, Testing Datasets ==="

    if [[ ! -d "$PDDL3_VALIDATED" ]]; then
        echo "ERROR: PDDL3_VALIDATED directory not found: $PDDL3_VALIDATED"
        exit 1
    fi

    # Clean output directories
    rm -rf "$SFT_500" "$GRPO_500" "$TESTING_200"
    mkdir -p "$SFT_500" "$GRPO_500" "$TESTING_200"

    log "Splitting datasets..."
    python3 "$SPLIT_PY" \
        --input-dir "$PDDL3_VALIDATED" \
        --sft-dir "$SFT_500" \
        --grpo-dir "$GRPO_500" \
        --testing-dir "$TESTING_200" \
        --sft-count 500 \
        --grpo-count 500 \
        --testing-count 200

    # Verify counts
    local sft_count=$(ls "$SFT_500"/*.pddl 2>/dev/null | wc -l)
    local grpo_count=$(ls "$GRPO_500"/*.pddl 2>/dev/null | wc -l)
    local testing_count=$(ls "$TESTING_200"/*.pddl 2>/dev/null | wc -l)

    log "Dataset split complete:"
    log "  SFT: $sft_count problems"
    log "  GRPO: $grpo_count problems"
    log "  Testing: $testing_count problems"
}

# =============================================================================
# Verification
# =============================================================================

verify_outputs() {
    log "=== VERIFICATION ==="

    # Check constraint format
    log "Checking constraint format..."

    for dir in "$SFT_500" "$GRPO_500" "$TESTING_200"; do
        if [[ ! -d "$dir" ]]; then
            log "WARNING: Directory not found: $dir"
            continue
        fi

        local dir_name=$(basename "$dir")
        local total=$(ls "$dir"/*.pddl 2>/dev/null | wc -l)
        local has_always_imply=$(grep -l "always.*imply" "$dir"/*.pddl 2>/dev/null | wc -l)
        local has_at_most_once=$(grep -l "at-most-once.*shed" "$dir"/*.pddl 2>/dev/null | wc -l)

        log "  $dir_name: $total files"
        log "    - with 'always imply': $has_always_imply"
        log "    - with 'at-most-once shed': $has_at_most_once"

        if [[ $has_always_imply -ne $total ]] || [[ $has_at_most_once -ne $total ]]; then
            log "  WARNING: Not all files have required constraints!"
        fi
    done

    # Check character counts
    log "Checking character counts..."
    local over_limit=0
    for dir in "$SFT_500" "$GRPO_500" "$TESTING_200"; do
        if [[ ! -d "$dir" ]]; then continue; fi
        for f in "$dir"/*.pddl; do
            local chars=$(wc -c < "$f")
            if [[ $chars -gt $MAX_CHARS ]]; then
                log "  WARNING: $f has $chars chars (> $MAX_CHARS)"
                ((over_limit++)) || true
            fi
        done
    done

    if [[ $over_limit -eq 0 ]]; then
        log "  All files within $MAX_CHARS character limit"
    else
        log "  WARNING: $over_limit files exceed character limit"
    fi

    log ""
    log "=== PIPELINE COMPLETE ==="
    log "Output directories:"
    log "  SFT: $SFT_500"
    log "  GRPO: $GRPO_500"
    log "  Testing: $TESTING_200"
}

# =============================================================================
# Main
# =============================================================================

main() {
    log "Starting Spanner PDDL3 Regeneration Pipeline"
    log "Script directory: $SCRIPT_DIR"
    log ""

    check_prerequisites

    # Parse command line arguments for stage selection
    local start_stage=${1:-1}
    local end_stage=${2:-5}

    log "Running stages $start_stage to $end_stage"
    log ""

    if [[ $start_stage -le 1 ]] && [[ $end_stage -ge 1 ]]; then
        stage1_generate_pddl2
    fi

    if [[ $start_stage -le 2 ]] && [[ $end_stage -ge 2 ]]; then
        stage2_solve_pddl2
    fi

    if [[ $start_stage -le 3 ]] && [[ $end_stage -ge 3 ]]; then
        stage3_convert_to_pddl3
    fi

    if [[ $start_stage -le 4 ]] && [[ $end_stage -ge 4 ]]; then
        stage4_validate
    fi

    if [[ $start_stage -le 5 ]] && [[ $end_stage -ge 5 ]]; then
        stage5_split_datasets
    fi

    verify_outputs
}

# Run main with all arguments
main "$@"
