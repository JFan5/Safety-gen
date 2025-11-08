#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=gpt_multi500_pddl3_dpo_gen.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=gpt_multi500_pddl3_dpo_gen # Specify job name



# Regenerate 500-pair DPO datasets for selected scenarios using Hyperstack paths.

set -euo pipefail

mkdir -p "/home/ubuntu/data/dpo/gpt_multi_pddl3_500" "/home/ubuntu/data/dpo/gpt_oss_20b"

# ============================================================================
# Step 1: Generate scored candidates for all scenarios
# ============================================================================
mkdir -p "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/blocksworld/pddl3" "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/grippers/pddl3" "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/ferry/pddl3" "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/spanner/pddl3" "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/delivery/pddl3"

echo "=== blocksworld: generating scored candidates -> /home/ubuntu/data/dpo/gpt_multi_pddl3_500/blocksworld/pddl3/scored.jsonl"
python3 "/home/ubuntu/Safety-gen/script/generate_score_candidate.py" \
    --model "/home/ubuntu/sft_models/gpt_multi_pddl3_500" \
    --domain-file "/home/ubuntu/Safety-gen/blocksworld/domain3.pddl" \
    --problems-dir "/home/ubuntu/Safety-gen/blocksworld/dpo_training" \
    --out "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/blocksworld/pddl3/scored.jsonl" \
    --temperatures 0.6 0.9 \
    --top-p 0.9 \
    --top-k 50 \
    "$@"

echo "=== grippers: generating scored candidates -> /home/ubuntu/data/dpo/gpt_multi_pddl3_500/grippers/pddl3/scored.jsonl"
python3 "/home/ubuntu/Safety-gen/script/generate_score_candidate.py" \
    --model "/home/ubuntu/sft_models/gpt_multi_pddl3_500" \
    --domain-file "/home/ubuntu/Safety-gen/grippers/domain3.pddl" \
    --problems-dir "/home/ubuntu/Safety-gen/grippers/dpo_training" \
    --out "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/grippers/pddl3/scored.jsonl" \
    --temperatures 0.6 0.9 \
    --top-p 0.9 \
    --top-k 50 \
    "$@"

echo "=== ferry: generating scored candidates -> /home/ubuntu/data/dpo/gpt_multi_pddl3_500/ferry/pddl3/scored.jsonl"
python3 "/home/ubuntu/Safety-gen/script/generate_score_candidate.py" \
    --model "/home/ubuntu/sft_models/gpt_multi_pddl3_500" \
    --domain-file "/home/ubuntu/Safety-gen/ferry/domain3.pddl" \
    --problems-dir "/home/ubuntu/Safety-gen/ferry/dpo_training" \
    --out "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/ferry/pddl3/scored.jsonl" \
    --temperatures 0.6 0.9 \
    --top-p 0.9 \
    --top-k 50 \
    "$@"

echo "=== spanner: generating scored candidates -> /home/ubuntu/data/dpo/gpt_multi_pddl3_500/spanner/pddl3/scored.jsonl"
python3 "/home/ubuntu/Safety-gen/script/generate_score_candidate.py" \
    --model "/home/ubuntu/sft_models/gpt_multi_pddl3_500" \
    --domain-file "/home/ubuntu/Safety-gen/spanner/domain3.pddl" \
    --problems-dir "/home/ubuntu/Safety-gen/spanner/dpo_training" \
    --out "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/spanner/pddl3/scored.jsonl" \
    --temperatures 0.6 0.9 \
    --top-p 0.9 \
    --top-k 50 \
    "$@"

echo "=== delivery: generating scored candidates -> /home/ubuntu/data/dpo/gpt_multi_pddl3_500/delivery/pddl3/scored.jsonl"
python3 "/home/ubuntu/Safety-gen/script/generate_score_candidate.py" \
    --model "/home/ubuntu/sft_models/gpt_multi_pddl3_500" \
    --domain-file "/home/ubuntu/Safety-gen/delivery/domain3.pddl" \
    --problems-dir "/home/ubuntu/Safety-gen/delivery/dpo_training" \
    --out "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/delivery/pddl3/scored.jsonl" \
    --temperatures 0.6 0.9 \
    --top-p 0.9 \
    --top-k 50 \
    "$@"

# ============================================================================
# Step 2: Create scored summaries for all scenarios
# ============================================================================
echo "=== blocksworld: creating scored summaries -> /home/ubuntu/data/dpo/gpt_multi_pddl3_500/blocksworld/pddl3/scored_summaries.json"
python3 "/home/ubuntu/Safety-gen/script/create_scored_summaries.py" \
    --scenario "blocksworld" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/blocksworld/pddl3/scored.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/blocksworld/dpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/blocksworld/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/blocksworld/all_problems/training" \
    --output "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/blocksworld/pddl3/scored_summaries.json"

echo "=== grippers: creating scored summaries -> /home/ubuntu/data/dpo/gpt_multi_pddl3_500/grippers/pddl3/scored_summaries.json"
python3 "/home/ubuntu/Safety-gen/script/create_scored_summaries.py" \
    --scenario "grippers" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/grippers/pddl3/scored.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/grippers/dpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/grippers/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/grippers/all_problems/training" \
    --output "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/grippers/pddl3/scored_summaries.json"

echo "=== ferry: creating scored summaries -> /home/ubuntu/data/dpo/gpt_multi_pddl3_500/ferry/pddl3/scored_summaries.json"
python3 "/home/ubuntu/Safety-gen/script/create_scored_summaries.py" \
    --scenario "ferry" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/ferry/pddl3/scored.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/ferry/dpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/ferry/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/ferry/all_problems/training" \
    --output "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/ferry/pddl3/scored_summaries.json"

echo "=== spanner: creating scored summaries -> /home/ubuntu/data/dpo/gpt_multi_pddl3_500/spanner/pddl3/scored_summaries.json"
python3 "/home/ubuntu/Safety-gen/script/create_scored_summaries.py" \
    --scenario "spanner" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/spanner/pddl3/scored.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/spanner/dpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/spanner/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/spanner/all_problems/training" \
    --output "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/spanner/pddl3/scored_summaries.json"

echo "=== delivery: creating scored summaries -> /home/ubuntu/data/dpo/gpt_multi_pddl3_500/delivery/pddl3/scored_summaries.json"
python3 "/home/ubuntu/Safety-gen/script/create_scored_summaries.py" \
    --scenario "delivery" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/delivery/pddl3/scored.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/delivery/dpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/delivery/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/delivery/all_problems/training" \
    --output "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/delivery/pddl3/scored_summaries.json"

# ============================================================================
# Step 3: Construct DPO datasets for all scenarios
# ============================================================================
mkdir -p "/home/ubuntu/data/dpo/gpt_oss_20b/blocksworld" "/home/ubuntu/data/dpo/gpt_oss_20b/grippers" "/home/ubuntu/data/dpo/gpt_oss_20b/ferry" "/home/ubuntu/data/dpo/gpt_oss_20b/spanner" "/home/ubuntu/data/dpo/gpt_oss_20b/delivery"

echo "=== blocksworld: constructing DPO dataset -> /home/ubuntu/data/dpo/gpt_oss_20b/blocksworld/pddl3_dpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/construct_dpo_dataset.py" \
    "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/blocksworld/pddl3/scored_summaries.json" \
    --output "/home/ubuntu/data/dpo/gpt_oss_20b/blocksworld/pddl3_dpo.jsonl" \
    --all-pairs

echo "=== grippers: constructing DPO dataset -> /home/ubuntu/data/dpo/gpt_oss_20b/grippers/pddl3_dpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/construct_dpo_dataset.py" \
    "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/grippers/pddl3/scored_summaries.json" \
    --output "/home/ubuntu/data/dpo/gpt_oss_20b/grippers/pddl3_dpo.jsonl" \
    --all-pairs

echo "=== ferry: constructing DPO dataset -> /home/ubuntu/data/dpo/gpt_oss_20b/ferry/pddl3_dpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/construct_dpo_dataset.py" \
    "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/ferry/pddl3/scored_summaries.json" \
    --output "/home/ubuntu/data/dpo/gpt_oss_20b/ferry/pddl3_dpo.jsonl" \
    --all-pairs

echo "=== spanner: constructing DPO dataset -> /home/ubuntu/data/dpo/gpt_oss_20b/spanner/pddl3_dpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/construct_dpo_dataset.py" \
    "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/spanner/pddl3/scored_summaries.json" \
    --output "/home/ubuntu/data/dpo/gpt_oss_20b/spanner/pddl3_dpo.jsonl" \
    --all-pairs

echo "=== delivery: constructing DPO dataset -> /home/ubuntu/data/dpo/gpt_oss_20b/delivery/pddl3_dpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/construct_dpo_dataset.py" \
    "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/delivery/pddl3/scored_summaries.json" \
    --output "/home/ubuntu/data/dpo/gpt_oss_20b/delivery/pddl3_dpo.jsonl" \
    --all-pairs

# ============================================================================
# Step 4: Sample 500 pairs for all scenarios
# ============================================================================
echo "=== blocksworld: sampling 500 pairs -> /home/ubuntu/data/dpo/gpt_oss_20b/blocksworld/pddl3_dpo-500.jsonl"
python3 "/home/ubuntu/Safety-gen/pick_dpo_data.py" \
    --datasets-dir "/home/ubuntu/data/dpo/gpt_oss_20b" \
    --scenarios "blocksworld" \
    --per-scenario 500 \
    --allow-fewer \
    --output "/home/ubuntu/data/dpo/gpt_oss_20b/blocksworld/pddl3_dpo-500.jsonl"

echo "=== grippers: sampling 500 pairs -> /home/ubuntu/data/dpo/gpt_oss_20b/grippers/pddl3_dpo-500.jsonl"
python3 "/home/ubuntu/Safety-gen/pick_dpo_data.py" \
    --datasets-dir "/home/ubuntu/data/dpo/gpt_oss_20b" \
    --scenarios "grippers" \
    --per-scenario 500 \
    --allow-fewer \
    --output "/home/ubuntu/data/dpo/gpt_oss_20b/grippers/pddl3_dpo-500.jsonl"

echo "=== ferry: sampling 500 pairs -> /home/ubuntu/data/dpo/gpt_oss_20b/ferry/pddl3_dpo-500.jsonl"
python3 "/home/ubuntu/Safety-gen/pick_dpo_data.py" \
    --datasets-dir "/home/ubuntu/data/dpo/gpt_oss_20b" \
    --scenarios "ferry" \
    --per-scenario 500 \
    --allow-fewer \
    --output "/home/ubuntu/data/dpo/gpt_oss_20b/ferry/pddl3_dpo-500.jsonl"

echo "=== spanner: sampling 500 pairs -> /home/ubuntu/data/dpo/gpt_oss_20b/spanner/pddl3_dpo-500.jsonl"
python3 "/home/ubuntu/Safety-gen/pick_dpo_data.py" \
    --datasets-dir "/home/ubuntu/data/dpo/gpt_oss_20b" \
    --scenarios "spanner" \
    --per-scenario 500 \
    --allow-fewer \
    --output "/home/ubuntu/data/dpo/gpt_oss_20b/spanner/pddl3_dpo-500.jsonl"

echo "=== delivery: sampling 500 pairs -> /home/ubuntu/data/dpo/gpt_oss_20b/delivery/pddl3_dpo-500.jsonl"
python3 "/home/ubuntu/Safety-gen/pick_dpo_data.py" \
    --datasets-dir "/home/ubuntu/data/dpo/gpt_oss_20b" \
    --scenarios "delivery" \
    --per-scenario 500 \
    --allow-fewer \
    --output "/home/ubuntu/data/dpo/gpt_oss_20b/delivery/pddl3_dpo-500.jsonl"

echo "Done. DPO datasets available under /home/ubuntu/data/dpo/gpt_oss_20b"
