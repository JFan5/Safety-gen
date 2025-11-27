# 训练模型及成功率统计

## Mistral-7B

### Cross-Domain

| 训练方法 | 模型路径 | 日期 | Spanner | Grippers | Ferry | Delivery | Blocksworld | Grid | 平均成功率 |
|---------|---------|------|---------|----------|-------|----------|-------------|------|-----------|
| Baseline | `unsloth/mistral-7b-instruct-v0.3-bnb-4bit` | - | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/spanner_test_results.json` | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/grippers_test_results.json` | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/ferry_test_results.json` | - | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/blocksworld_test_results.json` | - | 0.0% |
| SFT | `/jfan5/sft_models/mistral_7b/four_scenarios500` | 2025-11-24 | 54.0%<br/>`planning_results/mistral_7b-sft500_spanner_spanner_test_results.json` | 18.0%<br/>`planning_results/mistral_7b-sft500_grippers_grippers_test_results.json` | 72.0%<br/>`planning_results/mistral_7b-sft500_ferry_ferry_test_results.json` | - | 46.0%<br/>`planning_results/mistral_7b-sft500_blocksworld_blocksworld_test_results.json` | - | 47.5% |
| DPO | `/groups/fkong/jfan5/dpo_models/mistral_7b/multi/pddl3_500-gpt-candidate` | - | - | 28.0%<br/>`paper_results_iccps2025/mistral-multi/dpo/grippers_test_results_pddl3.json` | 32.0%<br/>`paper_results_iccps2025/mistral-multi/dpo/ferry_test_results_pddl3.json` | - | 28.0%<br/>`paper_results_iccps2025/mistral-multi/dpo/blocksworld_test_results_pddl3.json` | - | 29.3% |
| GRPO | - | - | - | - | - | - | - | - | - |

### Single-Domain

| 场景 | 训练方法 | 模型路径 | 日期 | Spanner | Grippers | Ferry | Delivery | Blocksworld | Grid | 平均成功率 |
|------|---------|---------|------|---------|----------|-------|----------|-------------|------|-----------|
| Blocksworld | SFT | `/home/ubuntu/sft_models/mistral_7b/blocksworld/pddl3` | 2025-11-24 | - | - | - | - | 48.0%<br/>`planning_results/mistral_7b-blocksworld_blocksworld_blocksworld_test_results.json` | - | 48.0% |
| Blocksworld | DPO | `/groups/fkong/jfan5/dpo_models/mistral_7b/blocksworld/pddl3_500` | 2025-11-09 | - | - | - | - | 54.0%<br/>`planning_results/mistral_7b-blocksworld-dpo_blocksworld_all_testing_dpo_pddl3-500.json` | - | 54.0% |
| Blocksworld | DPO | `/groups/fkong/jfan5/dpo_models/mistral_7b/blocksworld/dpo-variant-V1` | 2025-11-13 | - | - | - | - | 18.0%<br/>`planning_results/mistral-7b-dpo-variant-blocksworld-V1_blocksworld_all_testing_dpo-variant.json` | - | 18.0% |


---

## Qwen3-14B

### Cross-Domain

| 训练方法 | 模型路径 | 日期 | Spanner | Grippers | Ferry | Delivery | Blocksworld | Grid | 平均成功率 |
|---------|---------|------|---------|----------|-------|----------|-------------|------|-----------|
| Baseline | `unsloth/Qwen3-14B-unsloth-bnb-4bit` | - | 0.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/spanner_test_results.json` | 0.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/grippers_test_results.json` | 0.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/ferry_test_results.json` | 12.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/delivery_test_results.json` | 4.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/blocksworld_test_results.json` | - | 3.2% |
| SFT | `/home/ubuntu/Safety-gen/sft_models/Qwen3-14B/multi_pddl3_500/pddl3/` | - | 36.0%<br/>`paper_results_iccps2025/qwen3-14b/sft/spanner_test_results_pddl3.json` | 30.0%<br/>`paper_results_iccps2025/qwen3-14b/sft/grippers_test_results_pddl3.json` | 20.0%<br/>`paper_results_iccps2025/qwen3-14b/sft/ferry_test_results_pddl3.json` | 22.0%<br/>`paper_results_iccps2025/qwen3-14b/sft/delivery_test_results_pddl3.json` | 16.0%<br/>`paper_results_iccps2025/qwen3-14b/sft/blocksworld_test_results_pddl3.json` | - | 24.8% |
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
| SFT | `/home/ubuntu/sft_models/gpt_multi_pddl3_500_v2` | 2025-11-10 | 58.0%<br/>`planning_results/sft_gpt_multi-V2_spanner_50_spanner_test_results_50.json` | 8.0%<br/>`planning_results/sft_gpt_multi-V2_grippers_50_grippers_test_results_50.json` | 2.0%<br/>`planning_results/sft_gpt_multi-V2_ferry_50_ferry_test_results_50.json` | 2.0%<br/>`planning_results/sft_gpt_multi-V2_delivery_50_delivery_test_results_50.json` | 8.0%<br/>`planning_results/sft_gpt_multi-V2_blocksworld_50_blocksworld_test_results_50.json` | 0.0%<br/>`planning_results/sft_gpt_multi-V2_grid_50_grid_test_results_50.json` | 13.0% |
| GRPO | - | - | - | - | - | - | - | - | - |

---

## 说明

- **Cross-Domain**: 在多个场景上训练的模型，测试时在多个场景上评估
- **Single-Domain**: 在单个场景上训练的模型，只在该场景上测试
- 成功率基于各场景测试集（通常50个问题）的验证结果
- 平均成功率仅计算有数据的场景
- Qwen3-14B DPO (cross-domain) 在 spanner 场景表现最佳（94%成功率）