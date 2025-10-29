#!/bin/bash

qsub jobs/evaluate/sft/grippers/baseline.job
qsub jobs/evaluate/sft/ferry/baseline.job
# qsub jobs/evaluate/sft/delivery/baseline.job
qsub jobs/evaluate/sft/spanner/baseline.job
qsub jobs/evaluate/sft/blocksworld/baseline.job
qsub jobs/evaluate/sft/rovers/baseline.job
