#!/bin/bash

set -euo pipefail

qsub jobs/fine_tune/qwen3_1_7b/blocksworld/pddl3.job
qsub jobs/fine_tune/qwen3_1_7b/delivery/pddl3.job
qsub jobs/fine_tune/qwen3_1_7b/ferry/pddl3.job
qsub jobs/fine_tune/qwen3_1_7b/grippers/pddl3.job
qsub jobs/fine_tune/qwen3_1_7b/logistics/pddl3.job
qsub jobs/fine_tune/qwen3_1_7b/rovers/pddl3.job
qsub jobs/fine_tune/qwen3_1_7b/spanner/pddl3.job
