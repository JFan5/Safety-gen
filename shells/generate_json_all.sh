#!/bin/bash
# Generate JSON problems and domain files for all 5 domains
# Usage: ./shells/generate_json_all.sh [problems_subdir]

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

PROBLEMS_SUBDIR="${1:-testing_problem50}"

echo "=========================================="
echo "Generating JSON problems and domains for all domains"
echo "=========================================="
echo "Problems subdir: ${PROBLEMS_SUBDIR}"
echo "=========================================="
echo ""

declare -a DOMAINS=( "blocksworld" "ferry" "spanner" "grippers" "delivery" )

# Step 1: Convert domain files to JSON
echo ""
echo "=========================================="
echo "Step 1: Converting domain files to JSON"
echo "=========================================="
for DOMAIN in "${DOMAINS[@]}"; do
    DOMAIN_FILE="pddl3/${DOMAIN}/domain3.pddl"

    echo ""
    echo "Processing domain: ${DOMAIN}"

    if [ -f "${DOMAIN_FILE}" ]; then
        python3 script/pddl_to_json.py \
            --domain-file "${DOMAIN_FILE}" \
            --compact \
            --verbose
        echo "${DOMAIN} domain conversion completed!"
    else
        echo "Warning: ${DOMAIN_FILE} not found, skipping..."
    fi
done

# Step 2: Convert problem files to JSON
echo ""
echo "=========================================="
echo "Step 2: Converting problem files to JSON"
echo "=========================================="
for DOMAIN in "${DOMAINS[@]}"; do
    INPUT_DIR="pddl3/${DOMAIN}/${PROBLEMS_SUBDIR}"

    echo ""
    echo "=========================================="
    echo "Processing ${DOMAIN} problems"
    echo "=========================================="

    if [ -d "${INPUT_DIR}" ]; then
        python3 script/pddl_to_json.py \
            --input "${INPUT_DIR}" \
            --copy-pddl \
            --copy-soln \
            --compact \
            --verbose
        echo "${DOMAIN} problem conversion completed!"
    else
        echo "Warning: ${INPUT_DIR} not found, skipping..."
    fi
done

echo ""
echo "=========================================="
echo "All JSON conversions completed!"
echo "=========================================="
echo "Generated JSON files for domains: ${DOMAINS[*]}"
echo "  - Domain JSON files: pddl3/<domain>/domain3.json"
echo "  - Problem JSON files: pddl3/<domain>/${PROBLEMS_SUBDIR}/testing_problems_json/"
echo ""
