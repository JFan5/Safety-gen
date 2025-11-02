#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"

cd "${REPO_ROOT}"


echo "Submitting jobs/generate_candidates/llama/blocksworld/pddl3_crc.job"
qsub "jobs/generate_candidates/llama/blocksworld/pddl3_crc.job"

echo "Submitting jobs/generate_candidates/llama/ferry/pddl3_crc.job"
qsub "jobs/generate_candidates/llama/ferry/pddl3_crc.job"

echo "Submitting jobs/generate_candidates/llama/grippers/pddl3_crc.job"
qsub "jobs/generate_candidates/llama/grippers/pddl3_crc.job"

echo "Submitting jobs/generate_candidates/llama/rovers/pddl3_crc.job"
qsub "jobs/generate_candidates/llama/rovers/pddl3_crc.job"

echo "Submitting jobs/generate_candidates/llama/spanner/pddl3_crc.job"
qsub "jobs/generate_candidates/llama/spanner/pddl3_crc.job"
