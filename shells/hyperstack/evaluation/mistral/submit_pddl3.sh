#!/bin/bash

set -euo pipefail

sbatch slurm_jobs/mistral/evaluate/blocksworld/sft_pddl3.job
sbatch slurm_jobs/mistral/evaluate/delivery/sft_pddl3.job
sbatch slurm_jobs/mistral/evaluate/ferry/sft_pddl3.job
sbatch slurm_jobs/mistral/evaluate/grippers/sft_pddl3.job
sbatch slurm_jobs/mistral/evaluate/multi/baseline_pddl3.job
sbatch slurm_jobs/mistral/evaluate/rovers/sft_pddl3.job
sbatch slurm_jobs/mistral/evaluate/spanner/sft_pddl3.job
