#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/qwen3_1_7b/blocksworld/baseline_crc.job
qsub jobs/evaluate/qwen3_1_7b/ferry/baseline_crc.job
qsub jobs/evaluate/qwen3_1_7b/grid/baseline_crc.job
qsub jobs/evaluate/qwen3_1_7b/rovers/baseline_crc.job
qsub jobs/evaluate/qwen3_1_7b/spanner/baseline_crc.job
