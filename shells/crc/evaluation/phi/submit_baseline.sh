#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/phi4_mini/blocksworld/baseline_crc.job
qsub jobs/evaluate/phi4_mini/ferry/baseline_crc.job
qsub jobs/evaluate/phi4_mini/grid/baseline_crc.job
qsub jobs/evaluate/phi4_mini/rovers/baseline_crc.job
qsub jobs/evaluate/phi4_mini/spanner/baseline_crc.job
