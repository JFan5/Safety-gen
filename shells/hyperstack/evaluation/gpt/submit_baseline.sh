#!/bin/bash

set -euo pipefail

sbatch slurm_jobs/gpt/evaluate/blocksworld/baseline.job
sbatch slurm_jobs/gpt/evaluate/delivery/baseline.job
sbatch slurm_jobs/gpt/evaluate/ferry/baseline.job
sbatch slurm_jobs/gpt/evaluate/grippers/baseline.job
sbatch slurm_jobs/gpt/evaluate/rovers/baseline.job
sbatch slurm_jobs/gpt/evaluate/spanner/baseline.job
sbatch slurm_jobs/gpt/evaluate/multi/baseline.job
