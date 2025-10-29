#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/phi4_mini/blocksworld/pddl2_crc.job
qsub jobs/evaluate/phi4_mini/ferry/pddl2_crc.job
qsub jobs/evaluate/phi4_mini/grid/pddl2_crc.job
qsub jobs/evaluate/phi4_mini/rovers/pddl2_crc.job
qsub jobs/evaluate/phi4_mini/spanner/pddl2_crc.job
