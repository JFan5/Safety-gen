#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/mistral/blocksworld/pddl2_crc.job
qsub jobs/evaluate/mistral/ferry/pddl2_crc.job
qsub jobs/evaluate/mistral/grid/pddl2_crc.job
qsub jobs/evaluate/mistral/rovers/pddl2_crc.job
qsub jobs/evaluate/mistral/spanner/pddl2_crc.job
