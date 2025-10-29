#!/bin/bash

set -euo pipefail

MODEL_DIR="slurm_jobs/qwen/evaluate"

if [ ! -d "$MODEL_DIR" ]; then
    echo "ERROR: Directory '$MODEL_DIR' not found. Create Qwen evaluation jobs before submitting." >&2
    exit 1
fi

mapfile -t JOBS < <(find "$MODEL_DIR" -maxdepth 2 -type f -name 'baseline.job' | sort)

if [ ${#JOBS[@]} -eq 0 ]; then
    echo "ERROR: No baseline evaluation jobs found under '$MODEL_DIR'." >&2
    exit 1
fi

echo "Submitting ${#JOBS[@]} Qwen baseline evaluation jobs..."
for job in "${JOBS[@]}"; do
    echo "sbatch $job"
    sbatch "$job"
done
