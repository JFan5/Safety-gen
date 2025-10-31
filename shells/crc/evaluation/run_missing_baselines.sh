#!/bin/bash

qsub jobs/evaluate/mistral/blocksworld/baseline_crc.job
qsub jobs/evaluate/mistral/ferry/baseline_crc.job
qsub jobs/evaluate/mistral/grid/baseline_crc.job
qsub jobs/evaluate/mistral/rovers/baseline_crc.job
qsub jobs/evaluate/mistral/spanner/baseline_crc.job

qsub jobs/evaluate/llama/blocksworld/baseline_crc.job
qsub jobs/evaluate/llama/ferry/baseline_crc.job
qsub jobs/evaluate/llama/grid/baseline_crc.job
qsub jobs/evaluate/llama/rovers/baseline_crc.job
qsub jobs/evaluate/llama/spanner/baseline_crc.job

qsub jobs/evaluate/gpt_oss_20b/blocksworld/baseline_crc.job
qsub jobs/evaluate/gpt_oss_20b/ferry/baseline_crc.job
qsub jobs/evaluate/gpt_oss_20b/grid/baseline_crc.job
qsub jobs/evaluate/gpt_oss_20b/rovers/baseline_crc.job
qsub jobs/evaluate/gpt_oss_20b/spanner/baseline_crc.job
