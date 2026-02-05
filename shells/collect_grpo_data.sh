#!/bin/bash

# Collect GRPO training data from pddl3/*/grpo_500 directories
# Generates JSONL files for GRPO training (prompt + meta only, no solution)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${REPO_ROOT}"

# Configuration
SCENARIOS=(blocksworld spanner ferry  grippers delivery)
MAX_PROBLEMS=500
PROBLEMS_SUBDIR="grpo_500"  # Configurable subdirectory (e.g., grpo_500, grpo_500_hard)
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT_DIR="/jfan5/grpo_data/five_domain_${TIMESTAMP}"
PDDL3_DIR="${REPO_ROOT}/pddl3"
GENERATE_SCRIPT="${REPO_ROOT}/script/generate_grpo_500.py"

echo "=========================================="
echo "GRPO Data Collection Pipeline"
echo "=========================================="
echo ""
echo "Configuration:"
echo "  Scenarios: ${SCENARIOS[*]}"
echo "  Max problems per scenario: ${MAX_PROBLEMS}"
echo "  Problems subdirectory: ${PROBLEMS_SUBDIR}"
echo "  Output directory: ${OUTPUT_DIR}"
echo "  PDDL3 directory: ${PDDL3_DIR}"
echo ""

# Check if generate script exists
if [[ ! -f "${GENERATE_SCRIPT}" ]]; then
    echo "ERROR: Generate script not found: ${GENERATE_SCRIPT}"
    exit 1
fi

# Check if pddl3 directory exists
if [[ ! -d "${PDDL3_DIR}" ]]; then
    echo "ERROR: PDDL3 directory not found: ${PDDL3_DIR}"
    exit 1
fi

# Pre-check: Verify problems directories exist for all scenarios
echo "Pre-checking ${PROBLEMS_SUBDIR} directories..."
missing_dirs=()
for scenario in "${SCENARIOS[@]}"; do
    grpo_dir="${PDDL3_DIR}/${scenario}/${PROBLEMS_SUBDIR}"
    domain_file="${PDDL3_DIR}/${scenario}/domain3.pddl"

    if [[ ! -d "${grpo_dir}" ]]; then
        missing_dirs+=("${scenario}: ${PROBLEMS_SUBDIR} directory missing")
    elif [[ ! -f "${domain_file}" ]]; then
        missing_dirs+=("${scenario}: domain3.pddl missing")
    else
        pddl_count=$(ls "${grpo_dir}"/*.pddl 2>/dev/null | wc -l)
        echo "  ${scenario}: ${pddl_count} .pddl files found"
    fi
done

if [[ ${#missing_dirs[@]} -gt 0 ]]; then
    echo ""
    echo "WARNING: Some scenarios have missing files:"
    for msg in "${missing_dirs[@]}"; do
        echo "  - ${msg}"
    done
    echo ""
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Create output directory
mkdir -p "${OUTPUT_DIR}"

# Run the generation script
echo ""
echo "Running GRPO data generation..."
echo ""

python3 "${GENERATE_SCRIPT}" \
    --output-dir "${OUTPUT_DIR}" \
    --pddl3-dir "${PDDL3_DIR}" \
    --scenarios "${SCENARIOS[@]}" \
    --prompt-mode "file" \
    --max-problems "${MAX_PROBLEMS}" \
    --problems-subdir "${PROBLEMS_SUBDIR}"

# Post-check: Verify output files
echo ""
echo "=========================================="
echo "Verification"
echo "=========================================="

total_entries=0
all_success=true

for scenario in "${SCENARIOS[@]}"; do
    jsonl_file="${OUTPUT_DIR}/${scenario}.jsonl"
    if [[ -f "${jsonl_file}" ]]; then
        count=$(wc -l < "${jsonl_file}")
        total_entries=$((total_entries + count))
        if [[ ${count} -eq ${MAX_PROBLEMS} ]]; then
            echo "  ${scenario}.jsonl: ${count} entries [OK]"
        else
            echo "  ${scenario}.jsonl: ${count} entries [WARNING: expected ${MAX_PROBLEMS}]"
            all_success=false
        fi
    else
        echo "  ${scenario}.jsonl: NOT FOUND [ERROR]"
        all_success=false
    fi
done

# Check combined file
combined_file="${OUTPUT_DIR}/combined.jsonl"
if [[ -f "${combined_file}" ]]; then
    combined_count=$(wc -l < "${combined_file}")
    expected_total=$((${#SCENARIOS[@]} * MAX_PROBLEMS))
    if [[ ${combined_count} -eq ${expected_total} ]]; then
        echo "  combined.jsonl: ${combined_count} entries [OK]"
    else
        echo "  combined.jsonl: ${combined_count} entries [WARNING: expected ${expected_total}]"
    fi
else
    echo "  combined.jsonl: NOT FOUND [ERROR]"
    all_success=false
fi

echo ""
echo "=========================================="
echo "Summary"
echo "=========================================="
echo "  Total entries: ${total_entries}"
echo "  Output directory: ${OUTPUT_DIR}"
if [[ "${all_success}" == "true" ]]; then
    echo "  Status: SUCCESS"
else
    echo "  Status: COMPLETED WITH WARNINGS"
fi

echo ""
echo "Done."
