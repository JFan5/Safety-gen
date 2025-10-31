#!/bin/bash

set -euo pipefail

qsub jobs/fine_tune/gpt_oss_20b/blocksworld/pddl3.job
qsub jobs/fine_tune/gpt_oss_20b/delivery/pddl3.job
qsub jobs/fine_tune/gpt_oss_20b/ferry/pddl3.job
qsub jobs/fine_tune/gpt_oss_20b/grippers/pddl3.job
qsub jobs/fine_tune/gpt_oss_20b/logistics/pddl3.job
qsub jobs/fine_tune/gpt_oss_20b/rovers/pddl3.job
qsub jobs/fine_tune/gpt_oss_20b/spanner/pddl3.job
qsub jobs/fine_tune/gpt_oss_20b/multi_scenarios/pddl3.job
