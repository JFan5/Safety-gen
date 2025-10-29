#!/bin/bash

set -euo pipefail

SCENARIOS=(grippers ferry delivery spanner blocksworld rovers)
VARIANTS=(pddl2 pddl3)

for variant in "${VARIANTS[@]}"; do
  for scenario in "${SCENARIOS[@]}"; do
    qsub "jobs/fine_tune/mistral/${scenario}/${variant}.job"
  done
done
