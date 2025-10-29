#!/bin/bash

set -euo pipefail

qsub jobs/fine_tune/phi4_mini/blocksworld/pddl3.job
qsub jobs/fine_tune/phi4_mini/delivery/pddl3.job
qsub jobs/fine_tune/phi4_mini/ferry/pddl3.job
qsub jobs/fine_tune/phi4_mini/grippers/pddl3.job
qsub jobs/fine_tune/phi4_mini/logistics/pddl3.job
qsub jobs/fine_tune/phi4_mini/rovers/pddl3.job
qsub jobs/fine_tune/phi4_mini/spanner/pddl3.job
