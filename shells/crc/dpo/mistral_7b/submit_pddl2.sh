#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../../../../" && pwd)"

declare -a JOBS=(
  "jobs/dpo/mistral_7b/blocksworld/pddl2_crc.job"
  "jobs/dpo/mistral_7b/ferry/pddl2_crc.job"
  "jobs/dpo/mistral_7b/grid/pddl2_crc.job"
  "jobs/dpo/mistral_7b/grippers/pddl2_crc.job"
  "jobs/dpo/mistral_7b/rovers/pddl2_crc.job"
  "jobs/dpo/mistral_7b/spanner/pddl2_crc.job"
)

for job_rel in "${JOBS[@]}"; do
  job_path="${REPO_ROOT}/${job_rel}"
  if [[ ! -f "${job_path}" ]]; then
    echo "Skipping missing job file: ${job_path}" >&2
    continue
  fi
  echo "Submitting ${job_path}"
  qsub "${job_path}"
done
