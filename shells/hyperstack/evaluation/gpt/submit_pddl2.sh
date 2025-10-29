#!/bin/bash

set -euo pipefail

sbatch slurm_jobs/gpt/evaluate/blocksworld/sft_pddl2.job
sbatch slurm_jobs/gpt/evaluate/delivery/sft_pddl2.job
sbatch slurm_jobs/gpt/evaluate/ferry/sft_pddl2.job
sbatch slurm_jobs/gpt/evaluate/grippers/sft_pddl2.job
sbatch slurm_jobs/gpt/evaluate/rovers/sft_pddl2.job
sbatch slurm_jobs/gpt/evaluate/spanner/sft_pddl2.job
