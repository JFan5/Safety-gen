#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/mistral/blocksworld/baseline_crc.job
qsub jobs/evaluate/mistral/ferry/baseline_crc.job
qsub jobs/evaluate/mistral/grid/baseline_crc.job
qsub jobs/evaluate/mistral/rovers/baseline_crc.job
qsub jobs/evaluate/mistral/spanner/baseline_crc.job
