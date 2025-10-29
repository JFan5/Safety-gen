#!/bin/bash

set -euo pipefail

sbatch slurm_jobs/mistral/evaluate/blocksworld/sft_pddl2.job
sbatch slurm_jobs/mistral/evaluate/delivery/sft_pddl2.job
sbatch slurm_jobs/mistral/evaluate/ferry/sft_pddl2.job
sbatch slurm_jobs/mistral/evaluate/grippers/sft_pddl2.job
sbatch slurm_jobs/mistral/evaluate/rovers/sft_pddl2.job
sbatch slurm_jobs/mistral/evaluate/spanner/sft_pddl2.job
