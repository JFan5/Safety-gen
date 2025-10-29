#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/gpt_oss_20b/blocksworld/pddl2_crc.job
qsub jobs/evaluate/gpt_oss_20b/ferry/pddl2_crc.job
qsub jobs/evaluate/gpt_oss_20b/grid/pddl2_crc.job
qsub jobs/evaluate/gpt_oss_20b/rovers/pddl2_crc.job
qsub jobs/evaluate/gpt_oss_20b/spanner/pddl2_crc.job
