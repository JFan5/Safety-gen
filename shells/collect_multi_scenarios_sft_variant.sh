#!/bin/bash

# Merge per-scenario PDDL3 GRPO datasets into a single multi-scenario split.

set -euo pipefail

# blocksworld
python script/collect_single_scenario.py blocksworld --prompt_variants 5 --max_number 500 --seed 42 --output ~/data/sft/blocksworld-variant-500 --root blocksworld

# ferry
python script/collect_single_scenario.py ferry --prompt_variants 5 --max_number 500 --seed 42 --output ~/data/sft/ferry-variant-500 --root ferry

# grippers
python script/collect_single_scenario.py grippers --prompt_variants 5 --max_number 500 --seed 42 --output ~/data/sft/grippers-variant-500 --root grippers   

# spanner
python script/collect_single_scenario.py spanner --prompt_variants 5 --max_number 500 --seed 42 --output ~/data/sft/spanner-variant-500 --root spanner


# together
python3 script/collect_finetuned_dataset_together.py --scenarios blocksworld ferry grippers spanner --base-dir ~/data/sft/ --output ~/data/sft/bfgs-variant-500 