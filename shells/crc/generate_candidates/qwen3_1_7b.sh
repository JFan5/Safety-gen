#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"

cd "${REPO_ROOT}"


echo "Submitting jobs/generate_candidates/qwen3_1_7b/blocksworld/pddl2_crc.job"
qsub "jobs/generate_candidates/qwen3_1_7b/blocksworld/pddl2_crc.job"

echo "Submitting jobs/generate_candidates/qwen3_1_7b/blocksworld/pddl3_crc.job"
qsub "jobs/generate_candidates/qwen3_1_7b/blocksworld/pddl3_crc.job"

echo "Submitting jobs/generate_candidates/qwen3_1_7b/ferry/pddl2_crc.job"
qsub "jobs/generate_candidates/qwen3_1_7b/ferry/pddl2_crc.job"

echo "Submitting jobs/generate_candidates/qwen3_1_7b/ferry/pddl3_crc.job"
qsub "jobs/generate_candidates/qwen3_1_7b/ferry/pddl3_crc.job"

echo "Submitting jobs/generate_candidates/qwen3_1_7b/grippers/pddl2_crc.job"
qsub "jobs/generate_candidates/qwen3_1_7b/grippers/pddl2_crc.job"

echo "Submitting jobs/generate_candidates/qwen3_1_7b/grippers/pddl3_crc.job"
qsub "jobs/generate_candidates/qwen3_1_7b/grippers/pddl3_crc.job"

echo "Submitting jobs/generate_candidates/qwen3_1_7b/rovers/pddl2_crc.job"
qsub "jobs/generate_candidates/qwen3_1_7b/rovers/pddl2_crc.job"

echo "Submitting jobs/generate_candidates/qwen3_1_7b/rovers/pddl3_crc.job"
qsub "jobs/generate_candidates/qwen3_1_7b/rovers/pddl3_crc.job"

echo "Submitting jobs/generate_candidates/qwen3_1_7b/spanner/pddl2_crc.job"
qsub "jobs/generate_candidates/qwen3_1_7b/spanner/pddl2_crc.job"

echo "Submitting jobs/generate_candidates/qwen3_1_7b/spanner/pddl3_crc.job"
qsub "jobs/generate_candidates/qwen3_1_7b/spanner/pddl3_crc.job"
