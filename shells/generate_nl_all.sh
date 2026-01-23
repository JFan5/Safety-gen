#!/bin/bash
# Generate NL problems for all 5 domains
# Usage: ./shells/generate_nl_all.sh [problems_subdir]

set -e

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

PROBLEMS_SUBDIR="${1:-testing_problem50}"

echo "=========================================="
echo "Generating NL problems for all domains"
echo "=========================================="
echo "Problems subdir: ${PROBLEMS_SUBDIR}"
echo "=========================================="
echo ""

declare -a DOMAINS=( "blocksworld" "ferry" "spanner" "grippers" "delivery" )

for DOMAIN in "${DOMAINS[@]}"; do
    INPUT_DIR="pddl3/${DOMAIN}/${PROBLEMS_SUBDIR}"

    echo ""
    echo "=========================================="
    echo "Processing ${DOMAIN}"
    echo "=========================================="

    if [ -d "${INPUT_DIR}" ]; then
        python3 script/pddl_to_nl.py \
            --input "${INPUT_DIR}" \
            --copy-pddl \
            --copy-soln \
            --verbose
        echo "${DOMAIN} conversion completed!"
    else
        echo "Warning: ${INPUT_DIR} not found, skipping..."
    fi
done

echo ""
echo "=========================================="
echo "All NL conversions completed!"
echo "=========================================="
echo "Generated NL files for domains: ${DOMAINS[*]}"
echo ""
