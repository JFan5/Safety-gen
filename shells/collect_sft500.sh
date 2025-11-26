#!/bin/bash

# Collect SFT data from sft_500 directories for four scenarios
# Each scenario has 500 problems in pddl3/<scenario>/sft_500/

conda activate llmstl

# Base output directory
OUTPUT_BASE=/jfan5/sft_data

# Collect from blocksworld
python3 script/collect_single_scenario.py blocksworld \
    --pddl PDDL3 \
    --source sft_500 \
    --root pddl3/blocksworld \
    --prompt_variants 5 \
    --max_number 500 \
    --seed 42 \
    --output ${OUTPUT_BASE}/blocksworld-sft500-variant-5

# Collect from ferry
python3 script/collect_single_scenario.py ferry \
    --pddl PDDL3 \
    --source sft_500 \
    --root pddl3/ferry \
    --prompt_variants 5 \
    --max_number 500 \
    --seed 42 \
    --output ${OUTPUT_BASE}/ferry-sft500-variant-5

# Collect from spanner
python3 script/collect_single_scenario.py spanner \
    --pddl PDDL3 \
    --source sft_500 \
    --root pddl3/spanner \
    --prompt_variants 5 \
    --max_number 500 \
    --seed 42 \
    --output ${OUTPUT_BASE}/spanner-sft500-variant-5

# Collect from grippers
python3 script/collect_single_scenario.py grippers \
    --pddl PDDL3 \
    --source sft_500 \
    --root pddl3/grippers \
    --prompt_variants 5 \
    --max_number 500 \
    --seed 42 \
    --output ${OUTPUT_BASE}/grippers-sft500-variant-5

echo ""
echo "=========================================="
echo "All individual datasets collected successfully!"
echo "=========================================="
echo "Output directories:"
echo "  - ${OUTPUT_BASE}/blocksworld-sft500-variant-5"
echo "  - ${OUTPUT_BASE}/ferry-sft500-variant-5"
echo "  - ${OUTPUT_BASE}/spanner-sft500-variant-5"
echo "  - ${OUTPUT_BASE}/grippers-sft500-variant-5"
echo ""
echo "Each dataset contains 500 problems × 5 prompt variants = 2500 entries"
echo ""

# Collect combined dataset from all four scenarios
echo "=========================================="
echo "Collecting combined dataset from all scenarios..."
echo "=========================================="
python3 script/collect_finetuned_dataset_together.py \
    --scenarios blocksworld ferry grippers spanner \
    --base-dir ${OUTPUT_BASE} \
    --output ${OUTPUT_BASE}/four_scenarios500/combined.hf

echo ""
echo "=========================================="
echo "All datasets collected successfully!"
echo "=========================================="
echo "Combined dataset:"
echo "  - ${OUTPUT_BASE}/four_scenarios500/combined.hf"
echo ""
echo "Total: 4 scenarios × 500 problems × 5 variants = 10,000 entries"
