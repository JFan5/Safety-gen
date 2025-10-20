#!/bin/bash

qsub jobs/fine-tune_mistral_grippers.job
qsub jobs/fine-tune_mistral_ferry.job
qsub jobs/fine-tune_mistral_delivery.job
qsub jobs/fine-tune_mistral_spanner.job
qsub jobs/fine-tune_mistral_blocksworld.job
qsub jobs/fine-tune_mistral_rovers.job
