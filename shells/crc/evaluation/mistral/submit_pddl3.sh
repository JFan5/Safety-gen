#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/mistral/blocksworld/pddl3_crc.job
qsub jobs/evaluate/mistral/ferry/pddl3_crc.job
qsub jobs/evaluate/mistral/grid/pddl3_crc.job
qsub jobs/evaluate/mistral/rovers/pddl3_crc.job
qsub jobs/evaluate/mistral/spanner/pddl3_crc.job
