#!/bin/bash

set -euo pipefail

qsub jobs/fine_tune/qwen3_1_7b/blocksworld/pddl2.job
qsub jobs/fine_tune/qwen3_1_7b/delivery/pddl2.job
qsub jobs/fine_tune/qwen3_1_7b/ferry/pddl2.job
qsub jobs/fine_tune/qwen3_1_7b/grippers/pddl2.job
qsub jobs/fine_tune/qwen3_1_7b/logistics/pddl2.job
qsub jobs/fine_tune/qwen3_1_7b/rovers/pddl2.job
qsub jobs/fine_tune/qwen3_1_7b/spanner/pddl2.job
