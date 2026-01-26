#!/bin/bash
# Generate NL problems and domain files for all 5 domains
# Usage: ./shells/generate_nl_all.sh [problems_subdir]

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

PROBLEMS_SUBDIR="${1:-testing_problem50}"

echo "=========================================="
echo "Generating NL problems and domains for all domains"
echo "=========================================="
echo "Problems subdir: ${PROBLEMS_SUBDIR}"
echo "=========================================="
echo ""

declare -a DOMAINS=( "blocksworld" "ferry" "spanner" "grippers" "delivery" )

# Step 1: Convert domain files to NL
echo ""
echo "=========================================="
echo "Step 1: Converting domain files to NL"
echo "=========================================="
for DOMAIN in "${DOMAINS[@]}"; do
    DOMAIN_FILE="pddl3/${DOMAIN}/domain3.pddl"

    echo ""
    echo "Processing domain: ${DOMAIN}"

    if [ -f "${DOMAIN_FILE}" ]; then
        python3 script/pddl_to_nl.py \
            --domain-file "${DOMAIN_FILE}" \
            --verbose
        echo "${DOMAIN} domain conversion completed!"
    else
        echo "Warning: ${DOMAIN_FILE} not found, skipping..."
    fi
done

# Step 2: Convert problem files to NL
echo ""
echo "=========================================="
echo "Step 2: Converting problem files to NL"
echo "=========================================="
for DOMAIN in "${DOMAINS[@]}"; do
    INPUT_DIR="pddl3/${DOMAIN}/${PROBLEMS_SUBDIR}"

    echo ""
    echo "=========================================="
    echo "Processing ${DOMAIN} problems"
    echo "=========================================="

    if [ -d "${INPUT_DIR}" ]; then
        python3 script/pddl_to_nl.py \
            --input "${INPUT_DIR}" \
            --copy-pddl \
            --copy-soln \
            --verbose
        echo "${DOMAIN} problem conversion completed!"
    else
        echo "Warning: ${INPUT_DIR} not found, skipping..."
    fi
done

echo ""
echo "=========================================="
echo "All NL conversions completed!"
echo "=========================================="
echo "Generated NL files for domains: ${DOMAINS[*]}"
echo "  - Domain NL files: pddl3/<domain>/domain3_nl.txt"
echo "  - Problem NL files: pddl3/<domain>/${PROBLEMS_SUBDIR}/testing_problems_nl/"
echo ""
