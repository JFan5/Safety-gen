#!/bin/bash

set -euo pipefail

sbatch slurm_jobs/qwen/fine_tune/blocksworld/pddl2.job
sbatch slurm_jobs/qwen/fine_tune/delivery/pddl2.job
sbatch slurm_jobs/qwen/fine_tune/ferry/pddl2.job
sbatch slurm_jobs/qwen/fine_tune/grid/pddl2.job
sbatch slurm_jobs/qwen/fine_tune/grippers/pddl2.job
sbatch slurm_jobs/qwen/fine_tune/rovers/pddl2.job
sbatch slurm_jobs/qwen/fine_tune/spanner/pddl2.job
