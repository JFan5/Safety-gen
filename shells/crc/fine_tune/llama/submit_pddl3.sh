#!/bin/bash

set -euo pipefail

qsub jobs/fine_tune/llama/blocksworld/pddl3.job
qsub jobs/fine_tune/llama/delivery/pddl3.job
qsub jobs/fine_tune/llama/ferry/pddl3.job
qsub jobs/fine_tune/llama/grippers/pddl3.job
qsub jobs/fine_tune/llama/logistics/pddl3.job
qsub jobs/fine_tune/llama/rovers/pddl3.job
qsub jobs/fine_tune/llama/spanner/pddl3.job
