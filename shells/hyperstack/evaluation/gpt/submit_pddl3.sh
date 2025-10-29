#!/bin/bash

set -euo pipefail

sbatch slurm_jobs/gpt/evaluate/blocksworld/sft_pddl3.job
sbatch slurm_jobs/gpt/evaluate/delivery/sft_pddl3.job
sbatch slurm_jobs/gpt/evaluate/ferry/sft_pddl3.job
sbatch slurm_jobs/gpt/evaluate/grippers/sft_pddl3.job
sbatch slurm_jobs/gpt/evaluate/multi/baseline_pddl3.job
sbatch slurm_jobs/gpt/evaluate/rovers/sft_pddl3.job
sbatch slurm_jobs/gpt/evaluate/spanner/sft_pddl3.job
