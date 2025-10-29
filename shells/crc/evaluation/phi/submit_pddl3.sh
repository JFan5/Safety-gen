#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/phi4_mini/blocksworld/pddl3_crc.job
qsub jobs/evaluate/phi4_mini/ferry/pddl3_crc.job
qsub jobs/evaluate/phi4_mini/grid/pddl3_crc.job
qsub jobs/evaluate/phi4_mini/rovers/pddl3_crc.job
qsub jobs/evaluate/phi4_mini/spanner/pddl3_crc.job
