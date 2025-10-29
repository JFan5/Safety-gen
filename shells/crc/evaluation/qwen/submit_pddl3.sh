#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/qwen3_1_7b/blocksworld/pddl3_crc.job
qsub jobs/evaluate/qwen3_1_7b/ferry/pddl3_crc.job
qsub jobs/evaluate/qwen3_1_7b/grid/pddl3_crc.job
qsub jobs/evaluate/qwen3_1_7b/rovers/pddl3_crc.job
qsub jobs/evaluate/qwen3_1_7b/spanner/pddl3_crc.job
