#!/bin/bash

set -euo pipefail

sbatch slurm_jobs/qwen/fine_tune/blocksworld/pddl3.job
sbatch slurm_jobs/qwen/fine_tune/delivery/pddl3.job
sbatch slurm_jobs/qwen/fine_tune/ferry/pddl3.job
sbatch slurm_jobs/qwen/fine_tune/grid/pddl3.job
sbatch slurm_jobs/qwen/fine_tune/grippers/pddl3.job
sbatch slurm_jobs/qwen/fine_tune/rovers/pddl3.job
sbatch slurm_jobs/qwen/fine_tune/spanner/pddl3.job
