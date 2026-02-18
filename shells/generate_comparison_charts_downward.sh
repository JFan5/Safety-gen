#!/bin/bash
# Generate three-way comparison charts: Fast Downward vs OPTIC vs GPT-5.2
# Output: runs/benchmark/compare/

set -e

BENCHMARK_DIR="runs/benchmark"
DOWNWARD_DIR="${BENCHMARK_DIR}/downward"
OPTIC_DIR="${BENCHMARK_DIR}/optic"
OPENAI_DIR="${BENCHMARK_DIR}/openai"
OUTPUT_DIR="${BENCHMARK_DIR}/compare"

# Create output directory
mkdir -p "${OUTPUT_DIR}"

# Domains available in downward benchmarks
DOMAINS=("blocksworld" "delivery" "ferry" "grippers" "spanner")

# Track sources for manifest
declare -A SOURCES

echo "========================================================="
echo "Generating Fast Downward vs OPTIC vs GPT-5.2 Comparisons"
echo "========================================================="
echo ""

for domain in "${DOMAINS[@]}"; do
    echo "Processing domain: ${domain}"

    # Find latest Downward benchmark folder (must have results.json)
    downward_folder=""
    for folder in $(ls -dt ${DOWNWARD_DIR}/${domain}_* 2>/dev/null); do
        if [ -f "${folder}/results.json" ]; then
            downward_folder="$folder"
            break
        fi
    done

    if [ -z "$downward_folder" ]; then
        echo "  [SKIP] No Downward benchmark found for ${domain}"
        continue
    fi

    # Find latest OPTIC benchmark folder (must have solver_cache.json or summary.json)
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

    # Find latest GPT-5.2 benchmark folder
    gpt_folder=$(ls -dt ${OPENAI_DIR}/gpt-5.2_${domain}_* 2>/dev/null | head -1)

    if [ -z "$gpt_folder" ]; then
        echo "  [SKIP] No GPT-5.2 benchmark found for ${domain}"
        continue
    fi

    echo "  Downward: $(basename ${downward_folder})"
    echo "  OPTIC:    $(basename ${optic_folder})"
    echo "  GPT-5.2:  $(basename ${gpt_folder})"

    # Output filename
    output_file="${OUTPUT_DIR}/comparison_${domain}_3way.png"

    # Generate three-way comparison chart
    python script/generate_benchmark_table.py \
        "${downward_folder}" \
        --compare "${optic_folder}" "${gpt_folder}" \
        --time-chart \
        --chart-output "${output_file}"

    if [ $? -eq 0 ]; then
        echo "  [OK] Generated: $(basename ${output_file})"
        SOURCES["${domain}_downward"]="${downward_folder}"
        SOURCES["${domain}_optic"]="${optic_folder}"
        SOURCES["${domain}_gpt"]="${gpt_folder}"
    else
        echo "  [ERROR] Failed to generate chart for ${domain}"
    fi

    echo ""
done

# Generate manifest file
MANIFEST_FILE="${OUTPUT_DIR}/sources_3way.txt"
echo "# Three-Way Comparison Chart Source Folders" > "${MANIFEST_FILE}"
echo "# Generated: $(date)" >> "${MANIFEST_FILE}"
echo "" >> "${MANIFEST_FILE}"

for domain in "${DOMAINS[@]}"; do
    downward_key="${domain}_downward"
    optic_key="${domain}_optic"
    gpt_key="${domain}_gpt"

    if [ -n "${SOURCES[$downward_key]}" ]; then
        echo "## ${domain}" >> "${MANIFEST_FILE}"
        echo "Chart: comparison_${domain}_3way.png" >> "${MANIFEST_FILE}"
        echo "Downward: ${SOURCES[$downward_key]}" >> "${MANIFEST_FILE}"
        echo "OPTIC:    ${SOURCES[$optic_key]}" >> "${MANIFEST_FILE}"
        echo "GPT-5.2:  ${SOURCES[$gpt_key]}" >> "${MANIFEST_FILE}"
        echo "" >> "${MANIFEST_FILE}"
    fi
done

echo "========================================================="
echo "Done! Output directory: ${OUTPUT_DIR}"
echo "Manifest file: ${MANIFEST_FILE}"
echo "========================================================="

echo ""
echo "Generated files:"
ls -la "${OUTPUT_DIR}/comparison_*_3way.png" 2>/dev/null || echo "  (no files generated)"
