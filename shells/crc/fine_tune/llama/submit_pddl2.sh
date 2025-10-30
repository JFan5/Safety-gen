#!/bin/bash

set -euo pipefail

qsub jobs/fine_tune/llama/blocksworld/pddl2.job
qsub jobs/fine_tune/llama/delivery/pddl2.job
qsub jobs/fine_tune/llama/ferry/pddl2.job
qsub jobs/fine_tune/llama/grippers/pddl2.job
qsub jobs/fine_tune/llama/logistics/pddl2.job
qsub jobs/fine_tune/llama/rovers/pddl2.job
qsub jobs/fine_tune/llama/spanner/pddl2.job
