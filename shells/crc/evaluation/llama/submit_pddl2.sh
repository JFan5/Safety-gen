#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/llama/blocksworld/pddl2_crc.job
qsub jobs/evaluate/llama/ferry/pddl2_crc.job
qsub jobs/evaluate/llama/grid/pddl2_crc.job
qsub jobs/evaluate/llama/rovers/pddl2_crc.job
qsub jobs/evaluate/llama/spanner/pddl2_crc.job
