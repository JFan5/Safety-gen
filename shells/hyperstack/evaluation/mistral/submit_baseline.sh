#!/bin/bash

set -euo pipefail

sbatch slurm_jobs/mistral/evaluate/grippers/baseline.job
sbatch slurm_jobs/mistral/evaluate/multi/baseline.job
sbatch slurm_jobs/mistral/evaluate/rovers/baseline.job
sbatch slurm_jobs/mistral/evaluate/spanner/baseline.job
