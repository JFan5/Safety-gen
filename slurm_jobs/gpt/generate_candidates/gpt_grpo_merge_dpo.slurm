#!/bin/bash

#SBATCH --mail-user=jfan5@nd.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --output=gpt_grpo_merge_dpo.o
#SBATCH --cpus-per-task=28
#SBATCH --job-name=gpt_grpo_merge_dpo

set -euo pipefail

# ============================================================================
# Step 1: 使用 merge_dpo_to_grpo.py 合并 DPO 数据到 GRPO
# ============================================================================
echo "=== Step 1: Merging DPO scored.jsonl to GRPO grpo.jsonl ==="

echo ""
echo "=== Processing scenario: blocksworld ==="
python3 /home/ubuntu/Safety-gen/script/merge_dpo_to_grpo.py \
    --scenario "blocksworld" \
    --dpo-base-dir "/home/ubuntu/data/dpo/gpt_multi_pddl3_500" \
    --grpo-base-dir "/home/ubuntu/data/grpo/gpt_multi_pddl3_500" \
    --skip-missing

echo ""
echo "=== Processing scenario: grippers ==="
python3 /home/ubuntu/Safety-gen/script/merge_dpo_to_grpo.py \
    --scenario "grippers" \
    --dpo-base-dir "/home/ubuntu/data/dpo/gpt_multi_pddl3_500" \
    --grpo-base-dir "/home/ubuntu/data/grpo/gpt_multi_pddl3_500" \
    --skip-missing

echo ""
echo "=== Processing scenario: ferry ==="
python3 /home/ubuntu/Safety-gen/script/merge_dpo_to_grpo.py \
    --scenario "ferry" \
    --dpo-base-dir "/home/ubuntu/data/dpo/gpt_multi_pddl3_500" \
    --grpo-base-dir "/home/ubuntu/data/grpo/gpt_multi_pddl3_500" \
    --skip-missing

echo ""
echo "=== Processing scenario: spanner ==="
python3 /home/ubuntu/Safety-gen/script/merge_dpo_to_grpo.py \
    --scenario "spanner" \
    --dpo-base-dir "/home/ubuntu/data/dpo/gpt_multi_pddl3_500" \
    --grpo-base-dir "/home/ubuntu/data/grpo/gpt_multi_pddl3_500" \
    --skip-missing

echo ""
echo "=== Processing scenario: delivery ==="
python3 /home/ubuntu/Safety-gen/script/merge_dpo_to_grpo.py \
    --scenario "delivery" \
    --dpo-base-dir "/home/ubuntu/data/dpo/gpt_multi_pddl3_500" \
    --grpo-base-dir "/home/ubuntu/data/grpo/gpt_multi_pddl3_500" \
    --skip-missing

# ============================================================================
# Step 2: 创建 GRPO summaries
# ============================================================================
echo ""
echo "=== Step 2: Creating GRPO summaries ==="

echo ""
echo "=== blocksworld: creating GRPO summaries ==="
python3 /home/ubuntu/Safety-gen/script/create_scored_summaries.py \
    --scenario "blocksworld" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/blocksworld/pddl3/candidates.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/blocksworld/grpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/blocksworld/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/blocksworld/all_problems/training" \
    --output "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/blocksworld/pddl3/grpo_summaries.json"

echo ""
echo "=== grippers: creating GRPO summaries ==="
python3 /home/ubuntu/Safety-gen/script/create_scored_summaries.py \
    --scenario "grippers" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/grippers/pddl3/candidates.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/grippers/grpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/grippers/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/grippers/all_problems/training" \
    --output "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/grippers/pddl3/grpo_summaries.json"

echo ""
echo "=== ferry: creating GRPO summaries ==="
python3 /home/ubuntu/Safety-gen/script/create_scored_summaries.py \
    --scenario "ferry" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/ferry/pddl3/candidates.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/ferry/grpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/ferry/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/ferry/all_problems/training" \
    --output "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/ferry/pddl3/grpo_summaries.json"

echo ""
echo "=== spanner: creating GRPO summaries ==="
python3 /home/ubuntu/Safety-gen/script/create_scored_summaries.py \
    --scenario "spanner" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/spanner/pddl3/candidates.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/spanner/grpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/spanner/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/spanner/all_problems/training" \
    --output "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/spanner/pddl3/grpo_summaries.json"

echo ""
echo "=== delivery: creating GRPO summaries ==="
python3 /home/ubuntu/Safety-gen/script/create_scored_summaries.py \
    --scenario "delivery" \
    --variant "pddl3" \
    --unsloth-jsonl "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/delivery/pddl3/candidates.jsonl" \
    --problem-dir "/home/ubuntu/Safety-gen/delivery/grpo_training" \
    --domain-file "/home/ubuntu/Safety-gen/delivery/domain3.pddl" \
    --pddl2-solution-dir "/home/ubuntu/Safety-gen/delivery/all_problems/training" \
    --output "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/delivery/pddl3/grpo_summaries.json"

# ============================================================================
# Step 3: 构建 GRPO 数据集
# ============================================================================
echo ""
echo "=== Step 3: Constructing GRPO datasets ==="

mkdir -p "/home/ubuntu/data/grpo/gpt_oss_20b/blocksworld" \
         "/home/ubuntu/data/grpo/gpt_oss_20b/grippers" \
         "/home/ubuntu/data/grpo/gpt_oss_20b/ferry" \
         "/home/ubuntu/data/grpo/gpt_oss_20b/spanner" \
         "/home/ubuntu/data/grpo/gpt_oss_20b/delivery"

echo ""
echo "=== blocksworld: constructing GRPO dataset ==="
python3 /home/ubuntu/Safety-gen/script/construct_grpo_dataset.py \
    "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/blocksworld/pddl3/grpo_summaries.json" \
    --output "/home/ubuntu/data/grpo/gpt_oss_20b/blocksworld/pddl3_grpo.jsonl" \
    --include-pddl \
    --all-pairs

echo ""
echo "=== grippers: constructing GRPO dataset ==="
python3 /home/ubuntu/Safety-gen/script/construct_grpo_dataset.py \
    "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/grippers/pddl3/grpo_summaries.json" \
    --output "/home/ubuntu/data/grpo/gpt_oss_20b/grippers/pddl3_grpo.jsonl" \
    --include-pddl \
    --all-pairs

echo ""
echo "=== ferry: constructing GRPO dataset ==="
python3 /home/ubuntu/Safety-gen/script/construct_grpo_dataset.py \
    "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/ferry/pddl3/grpo_summaries.json" \
    --output "/home/ubuntu/data/grpo/gpt_oss_20b/ferry/pddl3_grpo.jsonl" \
    --include-pddl \
    --all-pairs

echo ""
echo "=== spanner: constructing GRPO dataset ==="
python3 /home/ubuntu/Safety-gen/script/construct_grpo_dataset.py \
    "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/spanner/pddl3/grpo_summaries.json" \
    --output "/home/ubuntu/data/grpo/gpt_oss_20b/spanner/pddl3_grpo.jsonl" \
    --include-pddl \
    --all-pairs

echo ""
echo "=== delivery: constructing GRPO dataset ==="
python3 /home/ubuntu/Safety-gen/script/construct_grpo_dataset.py \
    "/home/ubuntu/data/grpo/gpt_multi_pddl3_500/delivery/pddl3/grpo_summaries.json" \
    --output "/home/ubuntu/data/grpo/gpt_oss_20b/delivery/pddl3_grpo.jsonl" \
    --include-pddl \
    --all-pairs

echo ""
echo "=== Done! ==="
echo "GRPO datasets are available under /home/ubuntu/data/grpo/gpt_oss_20b/"

