#!/bin/bash

set -euo pipefail

MODEL_DIR="jobs/evaluate/gpt_oss_20b"

if [ ! -d "$MODEL_DIR" ]; then
  echo "ERROR: Missing evaluation jobs in $MODEL_DIR" >&2
  exit 1
fi

mapfile -t JOBS < <(find "$MODEL_DIR" -maxdepth 2 -type f -name 'pddl3_crc.job' | sort)

if [ ${#JOBS[@]} -eq 0 ]; then
  echo "ERROR: No PDDL3 CRC jobs found under $MODEL_DIR" >&2
  exit 1
fi

echo "Submitting ${#JOBS[@]} GPT PDDL3 CRC evaluations..."
for job in "${JOBS[@]}"; do
  echo "qsub $job"
  qsub "$job"
done
