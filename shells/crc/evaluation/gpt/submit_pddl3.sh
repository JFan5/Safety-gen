#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/gpt_oss_20b/blocksworld/pddl3_crc.job
qsub jobs/evaluate/gpt_oss_20b/ferry/pddl3_crc.job
qsub jobs/evaluate/gpt_oss_20b/grid/pddl3_crc.job
qsub jobs/evaluate/gpt_oss_20b/rovers/pddl3_crc.job
qsub jobs/evaluate/gpt_oss_20b/spanner/pddl3_crc.job
