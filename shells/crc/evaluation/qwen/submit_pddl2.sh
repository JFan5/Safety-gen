#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/qwen3_1_7b/blocksworld/pddl2_crc.job
qsub jobs/evaluate/qwen3_1_7b/ferry/pddl2_crc.job
qsub jobs/evaluate/qwen3_1_7b/grid/pddl2_crc.job
qsub jobs/evaluate/qwen3_1_7b/rovers/pddl2_crc.job
qsub jobs/evaluate/qwen3_1_7b/spanner/pddl2_crc.job
