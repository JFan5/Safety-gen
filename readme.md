# 训练模型及成功率统计


## supervised fine-tuning data
/jfan5/sft_data/four_scenarios500

### dpo data
/home/ubuntu/Safety-gen/data/dpo/new_four

### grpo data
/jfan5/ppo_data


## Mistral-7B

### Cross-Domain

| 训练方法 | 模型路径 | 日期 | Spanner | Grippers | Ferry | Delivery | Blocksworld | Grid | 平均成功率 |
|---------|---------|------|---------|----------|-------|----------|-------------|------|-----------|
| Baseline | `unsloth/mistral-7b-instruct-v0.3-bnb-4bit` | - | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/spanner_test_results.json` | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/grippers_test_results.json` | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/ferry_test_results.json` | 0.0%<br/>`planning_results/baseline_mistral_7b/delivery.json` | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/blocksworld_test_results.json` | - | 0.0% |
| SFT | `/jfan5/sft_models/mistral_7b/four_scenarios500` | 2025-11-24 | 54.0%<br/>`planning_results/mistral_7b-sft500_spanner_spanner_test_results.json` | 18.0%<br/>`planning_results/mistral_7b-sft500_grippers_grippers_test_results.json` | 72.0%<br/>`planning_results/mistral_7b-sft500_ferry_ferry_test_results.json` | 0.0%<br/>`planning_results/delivery_-jfan5-sft_models-mistral_7b-four_scenarios500-1124_50_oneshot_20251127_204146.json` | 46.0%<br/>`planning_results/mistral_7b-sft500_blocksworld_blocksworld_test_results.json` | - | 38.0% |
| DPO | `/groups/fkong/jfan5/dpo_models/mistral_7b/multi/pddl3_500-gpt-candidate` | - | - | 28.0%<br/>`paper_results_iccps2025/mistral-multi/dpo/grippers_test_results_pddl3.json` | 32.0%<br/>`paper_results_iccps2025/mistral-multi/dpo/ferry_test_results_pddl3.json` | - | 28.0%<br/>`paper_results_iccps2025/mistral-multi/dpo/blocksworld_test_results_pddl3.json` | - | 29.3% |
| GRPO | - | - | - | - | - | - | - | - | - |

### Single-Domain

| 场景 | 训练方法 | 模型路径 | 日期 | Spanner | Grippers | Ferry | Delivery | Blocksworld | Grid | 平均成功率 |
|------|---------|---------|------|---------|----------|-------|----------|-------------|------|-----------|
| Blocksworld | SFT | `/jfan5/sft_models/mistral_variant-blocksworld` | 2025-11-27 | - | - | - | - | 46.0%<br/>`planning_results/blocksworld_-jfan5-sft_models-mistral_variant-blocksworld_50_20251127_213753.json` | - | 46.0% |
| Blocksworld | DPO | `/jfan5/dpo_models/mistral_7b-blocksworld-1127` | 2025-11-28 | - | - | - | - | 50.0%<br/>`planning_results/blocksworld_-jfan5-dpo_models-mistral_7b-blocksworld-1127_50_20251128_000436.json` | - | 50.0% |
| Blocksworld | GRPO | `/jfan5/grpo_models/mistral_variant-blocksworld` | 2025-11-25 | - | - | - | - | 60.0%<br/>`planning_results/grpo-mistral_variant-blocksworld_blocksworld_blocksworld_test_results.json` | - | 60.0% |
| Blocksworld | GRPO | `/jfan5/grpo_models/mistral_variant-blocksworld` | 2025-11-28 | - | - | - | - | 58.0%<br/>`planning_results/blocksworld_-jfan5-grpo_models-mistral_variant-blocksworld_50_20251128_001213.json` | - | 58.0% |


---

## Qwen3-14B

sft: /jfan5/sft_models/qwen3_14b/four_scenarios500/pddl3

dpo: 
### Cross-Domain

| 训练方法 | 模型路径 | 日期 | Spanner | Grippers | Ferry | Delivery | Blocksworld | Grid | 平均成功率 |
|---------|---------|------|---------|----------|-------|----------|-------------|------|-----------|
| Baseline | `unsloth/Qwen3-14B-unsloth-bnb-4bit` | - | 0.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/spanner_test_results.json` | 0.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/grippers_test_results.json` | 0.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/ferry_test_results.json` | 12.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/delivery_test_results.json` | 4.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/blocksworld_test_results.json` | - | 3.2% |
| SFT | `/jfan5/sft_models/qwen3-14b-1127` | 2025-11-28 | 66.0%<br/>`planning_results/spanner_-jfan5-sft_models-qwen3-14b-1127_50_20251128_001536.json` | 34.0%<br/>`planning_results/grippers_-jfan5-sft_models-qwen3-14b-1127_50_20251128_001934.json` | 46.0%<br/>`planning_results/ferry_-jfan5-sft_models-qwen3-14b-1127_50_20251128_001213.json` | 2.0%<br/>`planning_results/delivery_-jfan5-sft_models-qwen3-14b-1127_50_20251128_000120.json` | 30.0%<br/>`planning_results/blocksworld_-jfan5-sft_models-qwen3-14b-1127_50_20251128_000655.json` | - | 35.6% |
| DPO | `/home/ubuntu/dpo_models/qwen3_14b/multi/pddl3_500-gpt-candidate` | 2025-11-09 | 94.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/spanner_test_results.json` | 30.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/grippers_test_results.json` | 24.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/ferry_test_results.json` | 20.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/delivery_test_results.json` | 18.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/blocksworld_test_results.json` | - | 37.2% |
| GRPO | - | - | - | - | - | - | - | - | - |

### Single-Domain

| 场景 | 训练方法 | 模型路径 | 日期 | Spanner | Grippers | Ferry | Delivery | Blocksworld | Grid | 平均成功率 |
|------|---------|---------|------|---------|----------|-------|----------|-------------|------|-----------|
| Spanner | DPO | `/home/ubuntu/dpo_models/qwen3_14b/multi/pddl3_500-gpt-candidate-2` | 2025-11-14 | 56.0%<br/>`planning_results/qwen3_dpo_bfgs-v2_spanner_results_spanner_dpo_bfgs.json` | - | - | - | - | - | 56.0% |

---

## GPT

### Cross-Domain

| 训练方法 | 模型路径 | 日期 | Spanner | Grippers | Ferry | Delivery | Blocksworld | Grid | 平均成功率 |
|---------|---------|------|---------|----------|-------|----------|-------------|------|-----------|
| Baseline | `unsloth/gpt-oss-20b-unsloth-bnb-4bit` | - | 0.0%<br/>`paper_results_iccps2025/gpt-oss-multi/baseline/spanner_test_results.json` | 2.0%<br/>`paper_results_iccps2025/gpt-oss-multi/baseline/grippers_test_results.json` | 2.0%<br/>`paper_results_iccps2025/gpt-oss-multi/baseline/ferry_test_results.json` | 0.0%<br/>`paper_results_iccps2025/gpt-oss-multi/baseline/delivery_test_results.json` | 0.0%<br/>`paper_results_iccps2025/gpt-oss-multi/baseline/blocksworld_test_results.json` | 0.0%<br/>`paper_results_iccps2025/gpt-oss-multi/baseline/grid_test_results.json` | 0.7% |
| SFT | `/jfan5/sft_models/gpt_oss_20b/four_scenarios500` | 2025-11-24 | 60.0%<br/>`planning_results/gpt_oss_20b-sft500_spanner_spanner_test_results.json` | 10.0%<br/>`planning_results/gpt_oss_20b-sft500_grippers_grippers_test_results.json` | 4.0%<br/>`planning_results/gpt_oss_20b-sft500_ferry_ferry_test_results.json` | 2.0%<br/>`planning_results/gpt_oss_20b-sft500_delivery_delivery_test_results.json` | 2.0%<br/>`planning_results/gpt_oss_20b-sft500_blocksworld_blocksworld_test_results.json` | - | 15.6% |
| GRPO | - | - | - | - | - | - | - | - | - |

---

## 说明

- **Cross-Domain**: 在多个场景上训练的模型，测试时在多个场景上评估
- **Single-Domain**: 在单个场景上训练的模型，只在该场景上测试
- 成功率基于各场景测试集（通常50个问题）的验证结果
- 平均成功率仅计算有数据的场景
- Qwen3-14B DPO (cross-domain) 在 spanner 场景表现最佳（94%成功率）