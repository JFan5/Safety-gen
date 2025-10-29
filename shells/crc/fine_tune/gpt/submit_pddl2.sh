#!/bin/bash

set -euo pipefail

qsub jobs/fine_tune/gpt_oss_20b/blocksworld/pddl2.job
qsub jobs/fine_tune/gpt_oss_20b/delivery/pddl2.job
qsub jobs/fine_tune/gpt_oss_20b/ferry/pddl2.job
qsub jobs/fine_tune/gpt_oss_20b/grippers/pddl2.job
qsub jobs/fine_tune/gpt_oss_20b/logistics/pddl2.job
qsub jobs/fine_tune/gpt_oss_20b/rovers/pddl2.job
qsub jobs/fine_tune/gpt_oss_20b/spanner/pddl2.job
