#!/bin/bash
# Generate comparison charts between OPTIC and GPT-5.2 benchmarks
# Output: runs/benchmark/compare/

set -e

BENCHMARK_DIR="runs/benchmark"
OPTIC_DIR="${BENCHMARK_DIR}/optic"
OPENAI_DIR="${BENCHMARK_DIR}/openai"
OUTPUT_DIR="${BENCHMARK_DIR}/compare"

# Create output directory
mkdir -p "${OUTPUT_DIR}"

# Domains to compare
DOMAINS=("blocksworld" "delivery" "ferry" "grid" "grippers" "spanner")

# Track sources for manifest
declare -A SOURCES

echo "=============================================="
echo "Generating OPTIC vs GPT-5.2 Comparison Charts"
echo "=============================================="
echo ""

for domain in "${DOMAINS[@]}"; do
    echo "Processing domain: ${domain}"

    # Find OPTIC benchmark folder (completed runs only - must have solver_cache.json or summary.json)
    optic_folder=""
    for folder in $(ls -dt ${OPTIC_DIR}/${domain}_* 2>/dev/null); do
        if [ -f "${folder}/solver_cache.json" ] || [ -f "${folder}/summary.json" ]; then
            optic_folder="$folder"
            break
        fi
    done

    if [ -z "$optic_folder" ]; then
        echo "  [SKIP] No OPTIC benchmark found for ${domain}"
        continue
    fi

    # Find latest GPT-5.2 benchmark folder for this domain
    gpt_folder=$(ls -dt ${OPENAI_DIR}/gpt-5.2_${domain}_* 2>/dev/null | head -1)

    if [ -z "$gpt_folder" ]; then
        echo "  [SKIP] No GPT-5.2 benchmark found for ${domain}"
        continue
    fi

    echo "  OPTIC:   $(basename ${optic_folder})"
    echo "  GPT-5.2: $(basename ${gpt_folder})"

    # Output filename
    output_file="${OUTPUT_DIR}/comparison_${domain}_gpt5.2_vs_optic.png"

    # Generate comparison chart (time-based, like original benchmark chart with two curves)
    python script/generate_benchmark_table.py \
        "${gpt_folder}" \
        --compare "${optic_folder}" \
        --time-chart \
        --chart-output "${output_file}"

    if [ $? -eq 0 ]; then
        echo "  [OK] Generated: $(basename ${output_file})"
        SOURCES["${domain}_gpt"]="${gpt_folder}"
        SOURCES["${domain}_optic"]="${optic_folder}"
    else
        echo "  [ERROR] Failed to generate chart for ${domain}"
    fi

    echo ""
done

# Generate manifest file with source information
MANIFEST_FILE="${OUTPUT_DIR}/sources.txt"
echo "# Comparison Chart Source Folders" > "${MANIFEST_FILE}"
echo "# Generated: $(date)" >> "${MANIFEST_FILE}"
echo "" >> "${MANIFEST_FILE}"

for domain in "${DOMAINS[@]}"; do
    gpt_key="${domain}_gpt"
    optic_key="${domain}_optic"

    if [ -n "${SOURCES[$gpt_key]}" ]; then
        echo "## ${domain}" >> "${MANIFEST_FILE}"
        echo "Chart: comparison_${domain}_gpt5.2_vs_optic.png" >> "${MANIFEST_FILE}"
        echo "GPT-5.2: ${SOURCES[$gpt_key]}" >> "${MANIFEST_FILE}"
        echo "OPTIC:   ${SOURCES[$optic_key]}" >> "${MANIFEST_FILE}"
        echo "" >> "${MANIFEST_FILE}"
    fi
done

echo "=============================================="
echo "Done! Output directory: ${OUTPUT_DIR}"
echo "Manifest file: ${MANIFEST_FILE}"
echo "=============================================="

# List generated files
echo ""
echo "Generated files:"
ls -la "${OUTPUT_DIR}/"
