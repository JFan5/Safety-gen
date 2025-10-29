#!/bin/bash

set -euo pipefail

qsub jobs/fine_tune/mistral/blocksworld/pddl2.job
qsub jobs/fine_tune/mistral/delivery/pddl2.job
qsub jobs/fine_tune/mistral/ferry/pddl2.job
qsub jobs/fine_tune/mistral/grippers/pddl2.job
qsub jobs/fine_tune/mistral/logistics/pddl2.job
qsub jobs/fine_tune/mistral/rovers/pddl2.job
qsub jobs/fine_tune/mistral/spanner/pddl2.job
