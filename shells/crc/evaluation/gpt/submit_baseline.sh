#!/bin/bash

set -euo pipefail

qsub jobs/evaluate/gpt_oss_20b/blocksworld/baseline_crc.job
qsub jobs/evaluate/gpt_oss_20b/ferry/baseline_crc.job
qsub jobs/evaluate/gpt_oss_20b/grid/baseline_crc.job
qsub jobs/evaluate/gpt_oss_20b/rovers/baseline_crc.job
qsub jobs/evaluate/gpt_oss_20b/spanner/baseline_crc.job
