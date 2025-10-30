#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/llama/blocksworld/pddl3_crc.job
qsub jobs/evaluate/llama/ferry/pddl3_crc.job
qsub jobs/evaluate/llama/grid/pddl3_crc.job
qsub jobs/evaluate/llama/rovers/pddl3_crc.job
qsub jobs/evaluate/llama/spanner/pddl3_crc.job
