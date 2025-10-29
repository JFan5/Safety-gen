#!/bin/bash

set -euo pipefail

qsub jobs/fine_tune/phi4_mini/blocksworld/pddl2.job
qsub jobs/fine_tune/phi4_mini/delivery/pddl2.job
qsub jobs/fine_tune/phi4_mini/ferry/pddl2.job
qsub jobs/fine_tune/phi4_mini/grippers/pddl2.job
qsub jobs/fine_tune/phi4_mini/logistics/pddl2.job
qsub jobs/fine_tune/phi4_mini/rovers/pddl2.job
qsub jobs/fine_tune/phi4_mini/spanner/pddl2.job
