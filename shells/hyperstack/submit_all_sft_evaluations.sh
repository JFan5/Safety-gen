#!/bin/bash

set -euo pipefail

sbatch slurm_jobs/mistral/evaluate/blocksworld/all_testing_models.job
sbatch slurm_jobs/mistral/evaluate/grid/all_testing_models.job
sbatch slurm_jobs/mistral/evaluate/rovers/all_testing_models.job
sbatch slurm_jobs/mistral/evaluate/spanner/all_testing_models.job
sbatch slurm_jobs/mistral/evaluate/ferry/all_testing_models.job
