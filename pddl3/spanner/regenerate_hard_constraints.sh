#!/usr/bin/env bash
set -euo pipefail

# =============================================================================
# Regenerate spanner _hard directories with proper PDDL3 constraints
# =============================================================================
# This script converts PDDL2 problems to PDDL3 with:
#   - (always (imply (not (tightened nutX)) (not (tightened nutY))))
#   - (forall (?m - man) (at-most-once (at ?m shed)))
#
# Problems without enough tightened nuts (< 2) are skipped.
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONVERT_PY="$SCRIPT_DIR/convert_training_to_pddl3.py"
ALL_PROBLEMS="$SCRIPT_DIR/all_problems"

# Target directories
SFT_500_HARD="$SCRIPT_DIR/sft_500_hard"
GRPO_500_HARD="$SCRIPT_DIR/grpo_500_hard"
TESTING_50_HARD="$SCRIPT_DIR/testing_problem50_hard"

# Temp directories
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

log() {
    echo "[$(date '+%H:%M:%S')] $*"
}

regenerate_directory() {
    local target_dir="$1"
    local dir_name=$(basename "$target_dir")

    log "=== Processing $dir_name ==="

    if [[ ! -d "$target_dir" ]]; then
        log "ERROR: Directory not found: $target_dir"
        return 1
    fi

    # Create temp input directory with problems and solutions from all_problems
    local temp_input="$TEMP_DIR/input_$dir_name"
    local temp_output="$TEMP_DIR/output_$dir_name"
    rm -rf "$temp_input" "$temp_output"
    mkdir -p "$temp_input" "$temp_output"

    # Copy relevant problems and solutions from all_problems
    local count=0
    for pddl_file in "$target_dir"/*.pddl; do
        local basename=$(basename "$pddl_file")
        local soln_basename="${basename%.pddl}.soln"

        # Check if both pddl and soln exist in all_problems
        if [[ -f "$ALL_PROBLEMS/$basename" ]] && [[ -f "$ALL_PROBLEMS/$soln_basename" ]]; then
            cp "$ALL_PROBLEMS/$basename" "$temp_input/"
            cp "$ALL_PROBLEMS/$soln_basename" "$temp_input/"
            ((count++)) || true
        else
            log "  WARNING: Missing in all_problems: $basename or $soln_basename"
        fi
    done

    log "  Found $count problems with solutions in all_problems"

    # Run conversion
    log "  Converting to PDDL3 with spanner-invalidating constraints..."
    python3 "$CONVERT_PY" \
        --input "$temp_input" \
        --output "$temp_output" \
        --constraint-style spanner-invalidating

    # Count converted files
    local converted=$(ls "$temp_output"/*.pddl 2>/dev/null | wc -l)
    log "  Converted $converted problems (skipped problems without enough tightened nuts)"

    # Backup original directory
    local backup_dir="${target_dir}_backup_$(date +%Y%m%d_%H%M%S)"
    log "  Backing up $dir_name to $backup_dir"
    cp -r "$target_dir" "$backup_dir"

    # Replace content
    log "  Replacing $dir_name content..."
    rm -f "$target_dir"/*.pddl "$target_dir"/*.soln 2>/dev/null || true

    # Copy converted PDDL3 files
    cp "$temp_output"/*.pddl "$target_dir/" 2>/dev/null || true

    # Copy corresponding .soln files from all_problems
    for pddl_file in "$temp_output"/*.pddl; do
        local basename=$(basename "$pddl_file")
        local soln_basename="${basename%.pddl}.soln"
        if [[ -f "$ALL_PROBLEMS/$soln_basename" ]]; then
            cp "$ALL_PROBLEMS/$soln_basename" "$target_dir/"
        fi
    done

    # Verify
    local final_count=$(ls "$target_dir"/*.pddl 2>/dev/null | wc -l)
    local has_always_imply=$(grep -l "always.*imply" "$target_dir"/*.pddl 2>/dev/null | wc -l)
    local has_at_most_once=$(grep -l "at-most-once" "$target_dir"/*.pddl 2>/dev/null | wc -l)

    log "  Final count: $final_count problems"
    log "  With always-imply: $has_always_imply"
    log "  With at-most-once: $has_at_most_once"

    if [[ $has_always_imply -ne $final_count ]] || [[ $has_at_most_once -ne $final_count ]]; then
        log "  ERROR: Not all problems have required constraints!"
        return 1
    fi

    log "  SUCCESS: All problems have both constraints"
    return 0
}

main() {
    log "Starting regeneration of _hard directories with proper constraints"
    log ""

    # Check prerequisites
    if [[ ! -f "$CONVERT_PY" ]]; then
        log "ERROR: Convert script not found: $CONVERT_PY"
        exit 1
    fi

    if [[ ! -d "$ALL_PROBLEMS" ]]; then
        log "ERROR: all_problems directory not found: $ALL_PROBLEMS"
        exit 1
    fi

    # Process each directory
    regenerate_directory "$SFT_500_HARD"
    log ""

    regenerate_directory "$GRPO_500_HARD"
    log ""

    regenerate_directory "$TESTING_50_HARD"
    log ""

    log "=== COMPLETE ==="
    log "All three directories regenerated with proper constraints:"
    log "  - $SFT_500_HARD"
    log "  - $GRPO_500_HARD"
    log "  - $TESTING_50_HARD"
}

main "$@"
