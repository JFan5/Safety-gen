#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=gpt_multi500_pddl3_dpo_gen.o
#SBATCH --cpus-per-task=28 # Specify parallel environment and legal core size
#SBATCH --job-name=gpt_multi500_pddl3_dpo_gen # Specify job name



# Regenerate 500-pair GRPO datasets for selected scenarios using Hyperstack paths.

set -euo pipefail

mkdir -p "/home/ubuntu/data/grpo/gpt_multi_pddl3_500" "/home/ubuntu/data/grpo/gpt_oss_20b"

# ============================================================================
# Step 1: Generate GRPO candidates for all scenarios
# ============================================================================
mkdir -p "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/blocksworld/pddl3" "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/grippers/pddl3" "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/ferry/pddl3" "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/spanner/pddl3" "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/delivery/pddl3"

echo "=== blocksworld: generating GRPO candidates -> /home/ubuntu/data/grpo/gpt_multi_pddl3_500/blocksworld/pddl3/grpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/generate_score_candidate.py" \
    --model "/home/ubuntu/sft_models/gpt_multi_pddl3_500" \
    --domain-file "/home/ubuntu/Safety-gen/blocksworld/domain3.pddl" \
    --problems-dir "/home/ubuntu/Safety-gen/blocksworld/grpo_training" \
    --out "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/blocksworld/pddl3/grpo.jsonl" \
    --temperatures 0.6 0.9 \
    --top-p 0.9 \
    --top-k 50 \
    "$@"

echo "=== grippers: generating GRPO candidates -> /home/ubuntu/data/grpo/gpt_multi_pddl3_500/grippers/pddl3/grpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/generate_score_candidate.py" \
    --model "/home/ubuntu/sft_models/gpt_multi_pddl3_500" \
    --domain-file "/home/ubuntu/Safety-gen/grippers/domain3.pddl" \
    --problems-dir "/home/ubuntu/Safety-gen/grippers/grpo_training" \
    --out "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/grippers/pddl3/grpo.jsonl" \
    --temperatures 0.6 0.9 \
    --top-p 0.9 \
    --top-k 50 \
    "$@"

echo "=== ferry: generating GRPO candidates -> /home/ubuntu/data/grpo/gpt_multi_pddl3_500/ferry/pddl3/grpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/generate_score_candidate.py" \
    --model "/home/ubuntu/sft_models/gpt_multi_pddl3_500" \
    --domain-file "/home/ubuntu/Safety-gen/ferry/domain3.pddl" \
    --problems-dir "/home/ubuntu/Safety-gen/ferry/grpo_training" \
    --out "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/ferry/pddl3/grpo.jsonl" \
    --temperatures 0.6 0.9 \
    --top-p 0.9 \
    --top-k 50 \
    "$@"

echo "=== spanner: generating GRPO candidates -> /home/ubuntu/data/grpo/gpt_multi_pddl3_500/spanner/pddl3/grpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/generate_score_candidate.py" \
    --model "/home/ubuntu/sft_models/gpt_multi_pddl3_500" \
    --domain-file "/home/ubuntu/Safety-gen/spanner/domain3.pddl" \
    --problems-dir "/home/ubuntu/Safety-gen/spanner/grpo_training" \
    --out "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/spanner/pddl3/grpo.jsonl" \
    --temperatures 0.6 0.9 \
    --top-p 0.9 \
    --top-k 50 \
    "$@"

echo "=== delivery: generating GRPO candidates -> /home/ubuntu/data/grpo/gpt_multi_pddl3_500/delivery/pddl3/grpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/generate_score_candidate.py" \
    --model "/home/ubuntu/sft_models/gpt_multi_pddl3_500" \
    --domain-file "/home/ubuntu/Safety-gen/delivery/domain3.pddl" \
    --problems-dir "/home/ubuntu/Safety-gen/delivery/grpo_training" \
    --out "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/delivery/pddl3/grpo.jsonl" \
    --temperatures 0.6 0.9 \
    --top-p 0.9 \
    --top-k 50 \
    "$@"

# ============================================================================
    # Step 2: Create GRPO summaries for all scenarios
# ============================================================================
echo "=== blocksworld: creating GRPO summaries -> /home/ubuntu/data/grpo/gpt_multi_pddl3_500/blocksworld/pddl3/grpo_summaries.json"
python3 "/home/ubuntu/Safety-gen/script/create_scored_summaries.py" \
    --scenario "blocksworld" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/blocksworld/pddl3/grpo.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/blocksworld/grpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/blocksworld/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/blocksworld/all_problems/training" \
    --output "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/blocksworld/pddl3/grpo_summaries.json"

echo "=== grippers: creating GRPO summaries -> /home/ubuntu/data/grpo/gpt_multi_pddl3_500/grippers/pddl3/grpo_summaries.json"
python3 "/home/ubuntu/Safety-gen/script/create_scored_summaries.py" \
    --scenario "grippers" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/grippers/pddl3/grpo.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/grippers/grpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/grippers/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/grippers/all_problems/training" \
    --output "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/grippers/pddl3/grpo_summaries.json"

echo "=== ferry: creating GRPO summaries -> /home/ubuntu/data/grpo/gpt_multi_pddl3_500/ferry/pddl3/grpo_summaries.json"
python3 "/home/ubuntu/Safety-gen/script/create_scored_summaries.py" \
    --scenario "ferry" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/ferry/pddl3/grpo.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/ferry/dpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/ferry/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/ferry/all_problems/training" \
    --output "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/ferry/pddl3/grpo_summaries.json"

echo "=== spanner: creating GRPO summaries -> /home/ubuntu/data/grpo/gpt_multi_pddl3_500/spanner/pddl3/grpo_summaries.json"
python3 "/home/ubuntu/Safety-gen/script/create_scored_summaries.py" \
    --scenario "spanner" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/spanner/pddl3/grpo.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/spanner/dpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/spanner/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/spanner/all_problems/training" \
    --output "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/spanner/pddl3/grpo_summaries.json"

echo "=== delivery: creating scored summaries -> /home/ubuntu/data/dpo/gpt_multi_pddl3_500/delivery/pddl3/scored_summaries.json"
python3 "/home/ubuntu/Safety-gen/script/create_scored_summaries.py" \
    --scenario "delivery" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/delivery/pddl3/scored.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/delivery/grpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/delivery/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/delivery/all_problems/training" \
    --output "/home/ubuntu/data/dpo/gpt_multi_pddl3_500/delivery/pddl3/scored_summaries.json"

# ============================================================================
# Step 3: Construct GRPO datasets for all scenarios
# ============================================================================
mkdir -p "/home/ubuntu/data/grpo/gpt_oss_20b/blocksworld" "/home/ubuntu/data/grpo/gpt_oss_20b/grippers" "/home/ubuntu/data/grpo/gpt_oss_20b/ferry" "/home/ubuntu/data/grpo/gpt_oss_20b/spanner" "/home/ubuntu/data/grpo/gpt_oss_20b/delivery"

echo "=== blocksworld: constructing GRPO dataset -> /home/ubuntu/data/grpo/gpt_oss_20b/blocksworld/pddl3_grpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/construct_grpo_dataset.py" \
    "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/blocksworld/pddl3/grpo_summaries.json" \
    --output "/home/ubuntu/data/grpo/gpt_oss_20b/blocksworld/pddl3_grpo.jsonl" \
    --all-pairs

    echo "=== grippers: constructing GRPO dataset -> /home/ubuntu/data/grpo/gpt_oss_20b/grippers/pddl3_grpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/construct_grpo_dataset.py" \
    "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/grippers/pddl3/grpo_summaries.json" \
    --output "/home/ubuntu/data/grpo/gpt_oss_20b/grippers/pddl3_grpo.jsonl" \
    --all-pairs

echo "=== ferry: constructing GRPO dataset -> /home/ubuntu/data/grpo/gpt_oss_20b/ferry/pddl3_grpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/construct_grpo_dataset.py" \
    "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/ferry/pddl3/grpo_summaries.json" \
    --output "/home/ubuntu/data/grpo/gpt_oss_20b/ferry/pddl3_grpo.jsonl" \
    --all-pairs

echo "=== spanner: constructing GRPO dataset -> /home/ubuntu/data/grpo/gpt_oss_20b/spanner/pddl3_grpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/construct_grpo_dataset.py" \
    "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/spanner/pddl3/grpo_summaries.json" \
    --output "/home/ubuntu/data/grpo/gpt_oss_20b/spanner/pddl3_grpo.jsonl" \
    --all-pairs

echo "=== delivery: constructing GRPO dataset -> /home/ubuntu/data/grpo/gpt_oss_20b/delivery/pddl3_grpo.jsonl"
python3 "/home/ubuntu/Safety-gen/script/construct_grpo_dataset.py" \
    "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/delivery/pddl3/grpo_summaries.json" \
    --output "/home/ubuntu/data/grpo/gpt_oss_20b/delivery/pddl3_grpo.jsonl" \
    --all-pairs

# ============================================================================
# Step 4: Sample 500 pairs for all scenarios
# ============================================================================
echo "=== blocksworld: sampling 500 pairs -> /home/ubuntu/data/grpo/gpt_oss_20b/blocksworld/pddl3_grpo-500.jsonl"
python3 "/home/ubuntu/Safety-gen/pick_grpo_data.py" \
    --datasets-dir "/home/ubuntu/data/grpo/gpt_oss_20b" \
    --scenarios "blocksworld" \
    --per-scenario 500 \
    --allow-fewer \
    --output "/home/ubuntu/data/grpo/gpt_oss_20b/blocksworld/pddl3_grpo-500.jsonl"

echo "=== grippers: sampling 500 pairs -> /home/ubuntu/data/grpo/gpt_oss_20b/grippers/pddl3_grpo-500.jsonl"
python3 "/home/ubuntu/Safety-gen/pick_grpo_data.py" \
    --datasets-dir "/home/ubuntu/data/grpo/gpt_oss_20b" \
    --scenarios "grippers" \
    --per-scenario 500 \
    --allow-fewer \
    --output "/home/ubuntu/data/grpo/gpt_oss_20b/grippers/pddl3_grpo-500.jsonl"

echo "=== ferry: sampling 500 pairs -> /home/ubuntu/data/grpo/gpt_oss_20b/ferry/pddl3_grpo-500.jsonl"
python3 "/home/ubuntu/Safety-gen/pick_grpo_data.py" \
    --datasets-dir "/home/ubuntu/data/grpo/gpt_oss_20b" \
    --scenarios "ferry" \
    --per-scenario 500 \
    --allow-fewer \
--output "/home/ubuntu/data/grpo/gpt_oss_20b/ferry/pddl3_grpo-500.jsonl"

echo "=== spanner: sampling 500 pairs -> /home/ubuntu/data/grpo/gpt_oss_20b/spanner/pddl3_grpo-500.jsonl"
python3 "/home/ubuntu/Safety-gen/pick_grpo_data.py" \
    --datasets-dir "/home/ubuntu/data/grpo/gpt_oss_20b" \
    --scenarios "spanner" \
    --per-scenario 500 \
    --allow-fewer \
    --output "/home/ubuntu/data/grpo/gpt_oss_20b/spanner/pddl3_grpo-500.jsonl"

echo "=== delivery: sampling 500 pairs -> /home/ubuntu/data/grpo/gpt_oss_20b/delivery/pddl3_grpo-500.jsonl"
python3 "/home/ubuntu/Safety-gen/pick_grpo_data.py" \
    --datasets-dir "/home/ubuntu/data/grpo/gpt_oss_20b" \
    --scenarios "delivery" \
    --per-scenario 500 \
    --allow-fewer \
    --output "/home/ubuntu/data/grpo/gpt_oss_20b/delivery/pddl3_grpo-500.jsonl"

echo "Done. GRPO datasets available under /home/ubuntu/data/grpo/gpt_oss_20b"
