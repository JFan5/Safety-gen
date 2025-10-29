#!/bin/bash

set -euo pipefail

qsub jobs/fine_tune/mistral/blocksworld/pddl3.job
qsub jobs/fine_tune/mistral/delivery/pddl3.job
qsub jobs/fine_tune/mistral/ferry/pddl3.job
qsub jobs/fine_tune/mistral/grippers/pddl3.job
qsub jobs/fine_tune/mistral/logistics/pddl3.job
qsub jobs/fine_tune/mistral/rovers/pddl3.job
qsub jobs/fine_tune/mistral/spanner/pddl3.job
