#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=gpt_multi500_pddl3_dpo_gen.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=gpt_multi500_pddl3_dpo_gen # Specify job name

# Build DPO datasets from scored.jsonl files in new_four directory
# Reads scored_*.jsonl directly from /home/ubuntu/Safety-gen/data/dpo/new_four
# Generates summaries, constructs single-scenario and multi-scenario DPO datasets

set -euo pipefail

# ============================================================================
# Step 1: Create scored summaries for all scenarios
# ============================================================================
echo "=== Step 1: Creating scored summaries"

echo "=== blocksworld: creating scored summaries -> /home/ubuntu/Safety-gen/data/dpo/new_four/scored_summaries_blocksworld.json"
python3 "/home/ubuntu/Safety-gen/script/create_scored_summaries.py" \
    --scenario "blocksworld" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/Safety-gen/data/dpo/new_four/scored_blocksworld.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/blocksworld/dpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/blocksworld/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/blocksworld/all_problems/training" \
    --output "/home/ubuntu/Safety-gen/data/dpo/new_four/scored_summaries_blocksworld.json"

echo "=== ferry: creating scored summaries -> /home/ubuntu/Safety-gen/data/dpo/new_four/scored_summaries_ferry.json"
python3 "/home/ubuntu/Safety-gen/script/create_scored_summaries.py" \
    --scenario "ferry" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/Safety-gen/data/dpo/new_four/scored_ferry.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/ferry/dpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/ferry/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/ferry/all_problems/training" \
    --output "/home/ubuntu/Safety-gen/data/dpo/new_four/scored_summaries_ferry.json"

echo "=== grippers: creating scored summaries -> /home/ubuntu/Safety-gen/data/dpo/new_four/scored_summaries_grippers.json"
python3 "/home/ubuntu/Safety-gen/script/create_scored_summaries.py" \
    --scenario "grippers" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/Safety-gen/data/dpo/new_four/scored_grippers.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/grippers/dpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/grippers/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/grippers/all_problems/training" \
    --output "/home/ubuntu/Safety-gen/data/dpo/new_four/scored_summaries_grippers.json"

echo "=== spanner: creating scored summaries -> /home/ubuntu/Safety-gen/data/dpo/new_four/scored_summaries_spanner.json"
python3 "/home/ubuntu/Safety-gen/script/create_scored_summaries.py" \
    --scenario "spanner" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/Safety-gen/data/dpo/new_four/scored_spanner.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/spanner/dpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/spanner/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/spanner/all_problems/training" \
    --output "/home/ubuntu/Safety-gen/data/dpo/new_four/scored_summaries_spanner.json"

# ============================================================================
# Step 2: Construct single-scenario DPO datasets (all pairs, no sampling)
# ============================================================================
echo "=== Step 2: Constructing single-scenario DPO datasets (all pairs)"

echo "=== blocksworld: constructing DPO dataset -> /home/ubuntu/Safety-gen/data/dpo/new_four/blocksworld_pddl3_dpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/construct_dpo_dataset.py" \
    "/home/ubuntu/Safety-gen/data/dpo/new_four/scored_summaries_blocksworld.json" \
    --output "/home/ubuntu/Safety-gen/data/dpo/new_four/blocksworld_pddl3_dpo.jsonl" \
    --all-pairs

echo "=== ferry: constructing DPO dataset -> /home/ubuntu/Safety-gen/data/dpo/new_four/ferry_pddl3_dpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/construct_dpo_dataset.py" \
    "/home/ubuntu/Safety-gen/data/dpo/new_four/scored_summaries_ferry.json" \
    --output "/home/ubuntu/Safety-gen/data/dpo/new_four/ferry_pddl3_dpo.jsonl" \
    --all-pairs

echo "=== grippers: constructing DPO dataset -> /home/ubuntu/Safety-gen/data/dpo/new_four/grippers_pddl3_dpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/construct_dpo_dataset.py" \
    "/home/ubuntu/Safety-gen/data/dpo/new_four/scored_summaries_grippers.json" \
    --output "/home/ubuntu/Safety-gen/data/dpo/new_four/grippers_pddl3_dpo.jsonl" \
    --all-pairs

echo "=== spanner: constructing DPO dataset -> /home/ubuntu/Safety-gen/data/dpo/new_four/spanner_pddl3_dpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/construct_dpo_dataset.py" \
    "/home/ubuntu/Safety-gen/data/dpo/new_four/scored_summaries_spanner.json" \
    --output "/home/ubuntu/Safety-gen/data/dpo/new_four/spanner_pddl3_dpo.jsonl" \
    --all-pairs

# ============================================================================
# Step 3: Construct multi-scenario DPO dataset (all scenarios combined, all pairs)
# ============================================================================
echo "=== Step 3: Constructing multi-scenario DPO dataset (all pairs)"

echo "=== multi-scenario: merging all pairs from all scenarios -> /home/ubuntu/Safety-gen/data/dpo/new_four/multi_pddl3_dpo.jsonl"
cat "/home/ubuntu/Safety-gen/data/dpo/new_four/blocksworld_pddl3_dpo.jsonl" \
    "/home/ubuntu/Safety-gen/data/dpo/new_four/ferry_pddl3_dpo.jsonl" \
    "/home/ubuntu/Safety-gen/data/dpo/new_four/grippers_pddl3_dpo.jsonl" \
    "/home/ubuntu/Safety-gen/data/dpo/new_four/spanner_pddl3_dpo.jsonl" \
    > "/home/ubuntu/Safety-gen/data/dpo/new_four/multi_pddl3_dpo.jsonl"

echo "Done. All files available under /home/ubuntu/Safety-gen/data/dpo/new_four"
