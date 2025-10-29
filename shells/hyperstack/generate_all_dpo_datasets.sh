#!/bin/bash

set -euo pipefail

sbatch slurm_jobs/mistral/generate_candidates/all_scenarios.job

