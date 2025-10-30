#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/llama/blocksworld/baseline_crc.job
qsub jobs/evaluate/llama/ferry/baseline_crc.job
qsub jobs/evaluate/llama/grid/baseline_crc.job
qsub jobs/evaluate/llama/rovers/baseline_crc.job
qsub jobs/evaluate/llama/spanner/baseline_crc.job
