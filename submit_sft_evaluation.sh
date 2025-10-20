#!/bin/bash

qsub jobs/evaluate_sft_grippers.job
qsub jobs/evaluate_sft_ferry.job
# qsub jobs/evaluate_sft_delivery.job
qsub jobs/evaluate_sft_spanner.job
qsub jobs/evaluate_sft_blocksworld.job
qsub jobs/evaluate_sft_rovers.job
