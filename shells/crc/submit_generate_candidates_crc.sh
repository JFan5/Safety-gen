#!/bin/bash

set -euo pipefail

qsub jobs/generate_candidates/blocksworld/crc.job
qsub jobs/generate_candidates/grid/crc.job
qsub jobs/generate_candidates/rovers/crc.job
qsub jobs/generate_candidates/spanner/crc.job
qsub jobs/generate_candidates/ferry/crc.job
qsub jobs/generate_candidates/grippers/crc.job
