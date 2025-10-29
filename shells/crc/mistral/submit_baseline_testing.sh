#!/bin/bash

set -euo pipefail

MODEL_DIR="jobs/evaluate/mistral"

if [ ! -d "$MODEL_DIR" ]; then
  echo "ERROR: Missing evaluation jobs in $MODEL_DIR" >&2
  exit 1
fi

mapfile -t JOBS < <(find "$MODEL_DIR" -maxdepth 2 -type f -name 'baseline_crc.job' | sort)

if [ ${#JOBS[@]} -eq 0 ]; then
  echo "ERROR: No baseline CRC jobs found under $MODEL_DIR" >&2
  exit 1
fi

echo "Submitting ${#JOBS[@]} Mistral baseline CRC evaluations..."
for job in "${JOBS[@]}"; do
  echo "qsub $job"
  qsub "$job"
done
