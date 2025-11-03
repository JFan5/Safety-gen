#!/bin/bash

# Submit multi-scenario evaluation jobs for baseline and fine-tuned adapters.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${REPO_ROOT}"

JOBS=(
  "jobs/evaluate/llama/multi_scenarios/pddl3_multi_crc.job"
  "jobs/evaluate/mistral/multi_scenarios/pddl3_multi_crc.job"
  "jobs/evaluate/qwen3_1_7b/multi_scenarios/pddl3_multi_crc.job"
  "jobs/evaluate/qwen3_4b_instruct/multi_scenarios/baseline.job"
  "jobs/evaluate/deepseek_r1_llama8b/multi_scenarios/baseline.job"
  "jobs/evaluate/mistral_small_24b/multi_scenarios/baseline.job"
)

missing=0
for job in "${JOBS[@]}"; do
  if [[ ! -f "${job}" ]]; then
    echo "Missing job script: ${job}" >&2
    missing=1
  fi
done

if (( missing )); then
  echo "Cannot submit because one or more job scripts are missing." >&2
  exit 1
fi

echo "Submitting ${#JOBS[@]} multi-scenario evaluation job arrays..."

for job in "${JOBS[@]}"; do
  echo "qsub ${job}"
  qsub "${job}"
done

echo "All submissions dispatched. Monitor via qstat/qacct as needed."
