#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"

cd "${REPO_ROOT}"


echo "Submitting jobs/generate_candidates/mistral_unsloth/blocksworld/pddl2_crc.job"
qsub "jobs/generate_candidates/mistral_unsloth/blocksworld/pddl2_crc.job"

echo "Submitting jobs/generate_candidates/mistral_unsloth/blocksworld/pddl3_crc.job"
qsub "jobs/generate_candidates/mistral_unsloth/blocksworld/pddl3_crc.job"

echo "Submitting jobs/generate_candidates/mistral_unsloth/ferry/pddl2_crc.job"
qsub "jobs/generate_candidates/mistral_unsloth/ferry/pddl2_crc.job"

echo "Submitting jobs/generate_candidates/mistral_unsloth/ferry/pddl3_crc.job"
qsub "jobs/generate_candidates/mistral_unsloth/ferry/pddl3_crc.job"

echo "Submitting jobs/generate_candidates/mistral_unsloth/grid/pddl2_crc.job"
qsub "jobs/generate_candidates/mistral_unsloth/grid/pddl2_crc.job"

echo "Submitting jobs/generate_candidates/mistral_unsloth/grid/pddl3_crc.job"
qsub "jobs/generate_candidates/mistral_unsloth/grid/pddl3_crc.job"

echo "Submitting jobs/generate_candidates/mistral_unsloth/grippers/pddl2_crc.job"
qsub "jobs/generate_candidates/mistral_unsloth/grippers/pddl2_crc.job"

echo "Submitting jobs/generate_candidates/mistral_unsloth/grippers/pddl3_crc.job"
qsub "jobs/generate_candidates/mistral_unsloth/grippers/pddl3_crc.job"

echo "Submitting jobs/generate_candidates/mistral_unsloth/rovers/pddl2_crc.job"
qsub "jobs/generate_candidates/mistral_unsloth/rovers/pddl2_crc.job"

echo "Submitting jobs/generate_candidates/mistral_unsloth/rovers/pddl3_crc.job"
qsub "jobs/generate_candidates/mistral_unsloth/rovers/pddl3_crc.job"

echo "Submitting jobs/generate_candidates/mistral_unsloth/spanner/pddl2_crc.job"
qsub "jobs/generate_candidates/mistral_unsloth/spanner/pddl2_crc.job"

echo "Submitting jobs/generate_candidates/mistral_unsloth/spanner/pddl3_crc.job"
qsub "jobs/generate_candidates/mistral_unsloth/spanner/pddl3_crc.job"
