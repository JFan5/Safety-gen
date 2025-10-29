#!/bin/bash

sbatch slurm_jobs/mistral/fine_tune/blocksworld/pddl3.job
sbatch slurm_jobs/mistral/fine_tune/ferry/pddl3.job
sbatch slurm_jobs/mistral/fine_tune/grid/pddl3.job
sbatch slurm_jobs/mistral/fine_tune/grippers/pddl3.job

# sbatch slurm_jobs/mistral/fine_tune/delivery/pddl3.job

# sbatch slurm_jobs/mistral/fine_tune/multi_scenarios/pddl3.job
# sbatch slurm_jobs/mistral/fine_tune/rovers/pddl3.job
# sbatch slurm_jobs/mistral/fine_tune/spanner/pddl3.job
