# 训练模型及成功率统计


## supervised fine-tuning data
/jfan5/sft_data/four_scenarios500

### dpo data
/home/ubuntu/Safety-gen/data/dpo/new_four

### grpo data
/jfan5/ppo_data


## Mistral-7B

### Cross-Domain

| Training Method | Model Path | Date | Spanner | Grippers | Ferry | Blocksworld | Grid | Delivery | Average Success Rate |
|---------|---------|------|---------|----------|-------|-------------|------|----------|-----------|
| SFT | `/jfan5/sft_models/mistral_7b/four_scenarios500-1124` | 2025-12-06 | 52.0%<br/>`planning_results/spanner_-jfan5-sft_models-mistral_7b-four_scenarios500-1124_50_20251206_150941.json` | 50.0%<br/>`planning_results/grippers_-jfan5-sft_models-mistral_7b-four_scenarios500-1124_50_20251206_151334.json` | 76.0%<br/>`planning_results/ferry_-jfan5-sft_models-mistral_7b-four_scenarios500-1124_50_20251206_150333.json` | 58.0%<br/>`planning_results/blocksworld_-jfan5-sft_models-mistral_7b-four_scenarios500-1124_50_20251206_145855.json` | - | 0.0%<br/>`planning_results/delivery_-jfan5-sft_models-mistral_7b-four_scenarios500-1124_50_20251206_151739.json` | 47.2% |
| SFT | `/jfan5/sft_models/mistral_7b/symbolized_v3` | 2025-12-15 | 88.0%<br/>`planning_results/spanner_-jfan5-sft_models-mistral_7b-symbolized_v3_50_20251215_000940.json` | 82.0%<br/>`planning_results/grippers_-jfan5-sft_models-mistral_7b-symbolized_v3_50_20251215_001053.json` | 86.0%<br/>`planning_results/ferry_-jfan5-sft_models-mistral_7b-symbolized_v3_50_20251215_000854.json` | 66.0%<br/>`planning_results/blocksworld_-jfan5-sft_models-mistral_7b-symbolized_v3_50_20251215_000753.json` | - | 0.0%<br/>`planning_results/delivery_-jfan5-sft_models-mistral_7b-symbolized_v3_50_20251215_020909.json` | 64.4% |

**简化表格（仅成功率）：**

| Training Method | Spanner | Grippers | Ferry | Blocksworld | Grid | Delivery | Average Success Rate |
|---------|---------|----------|-------|-------------|------|----------|-----------|
| SFT-Simple | 52.0% | 50.0% | 76.0% | 58.0% | - | 0.0% | 47.2% |
| SFT-Complex | 88.0% | 82.0% | 86.0% | 66.0% | - | 0.0% | 64.4% |
| Baseline | `unsloth/mistral-7b-instruct-v0.3-bnb-4bit` | - | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/spanner_test_results.json` | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/grippers_test_results.json` | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/ferry_test_results.json` | 0.0%<br/>`paper_results/iccps2025/mistral-multi/pretrained/blocksworld_test_results.json` | - | 0.0%<br/>`planning_results/baseline_mistral_7b/delivery.json` | 0.0% |
| SFT | `/jfan5/sft_models/mistral_7b/cross_domain_pddl3_augmented` | 2025-12-10 | 94.0%<br/>`planning_results/spanner_-jfan5-sft_models-mistral_7b-cross_domain_pddl3_augmented_50_20251210_211033.json` | 82.0%<br/>`planning_results/grippers_-jfan5-sft_models-mistral_7b-cross_domain_pddl3_augmented_50_20251210_211337.json` | 74.0%<br/>`planning_results/ferry_-jfan5-sft_models-mistral_7b-cross_domain_pddl3_augmented_50_20251210_210712.json` | 74.0%<br/>`planning_results/blocksworld_-jfan5-sft_models-mistral_7b-cross_domain_pddl3_augmented_50_20251210_210340.json` | - | 0.0%<br/>`planning_results/delivery_-jfan5-sft_models-mistral_7b-cross_domain_pddl3_augmented_50_20251210_211709.json` | 64.8% |
| DPO | `/jfan5/dpo_models/mistral_7b-1207` | 2025-12-08 | 52.0%<br/>`planning_results/spanner_-jfan5-dpo_models-mistral_7b-1207_50_20251208_035919.json` | 52.0%<br/>`planning_results/grippers_-jfan5-dpo_models-mistral_7b-1207_50_20251208_040208.json` | 78.0%<br/>`planning_results/ferry_-jfan5-dpo_models-mistral_7b-1207_50_20251208_035641.json` | 62.0%<br/>`planning_results/blocksworld_-jfan5-dpo_models-mistral_7b-1207_50_20251208_035328.json` | - | 0.0%<br/>`planning_results/delivery_-jfan5-dpo_models-mistral_7b-1207_50_20251208_040545.json` | 48.8% |
| GRPO | `/jfan5/grpo_models/mistral_7b-1207-500` | 2025-12-08 | 46.0%<br/>`planning_results/spanner_-jfan5-grpo_models-mistral_7b-1207-500_50_20251208_025608.json` | 38.0%<br/>`planning_results/grippers_-jfan5-grpo_models-mistral_7b-1207-500_50_20251208_030108.json` | 66.0%<br/>`planning_results/ferry_-jfan5-grpo_models-mistral_7b-1207-500_50_20251208_025132.json` | 42.0%<br/>`planning_results/blocksworld_-jfan5-grpo_models-mistral_7b-1207-500_50_20251208_024807.json` | - | 0.0%<br/>`planning_results/delivery_-jfan5-grpo_models-mistral_7b-1207-500_50_20251208_031047.json` | 38.4% |
| GRPO | `/jfan5/grpo_models/mistral_7b-symbolized-1214` | 2025-12-14 | 88.0%<br/>`planning_results/spanner_-jfan5-grpo_models-mistral_7b-symbolized-1214_50_20251214_165550.json` | 62.0%<br/>`planning_results/grippers_-jfan5-grpo_models-mistral_7b-symbolized-1214_50_20251214_165652.json` | 76.0%<br/>`planning_results/ferry_-jfan5-grpo_models-mistral_7b-symbolized-1214_50_20251214_165431.json` | 48.0%<br/>`planning_results/blocksworld_-jfan5-grpo_models-mistral_7b-symbolized-1214_50_20251214_165330.json` | - | 0.0%<br/>`planning_results/delivery_-jfan5-grpo_models-mistral_7b-symbolized-1214_50_20251214_165814.json` | 54.8% |
| GRPO (stl) | `/jfan5/grpo_models/mistral_7b-symbolized-1214-stl` | 2025-12-14 | 80.0%<br/>`planning_results/spanner_-jfan5-grpo_models-mistral_7b-symbolized-1214-stl_50_20251214_192609.json` | 68.0%<br/>`planning_results/grippers_-jfan5-grpo_models-mistral_7b-symbolized-1214-stl_50_20251214_192708.json` | 70.0%<br/>`planning_results/ferry_-jfan5-grpo_models-mistral_7b-symbolized-1214-stl_50_20251214_192524.json` | 46.0%<br/>`planning_results/blocksworld_-jfan5-grpo_models-mistral_7b-symbolized-1214-stl_50_20251214_192419.json` | - | - | 66.0% |

#### Gemini-3-Pro (gemini-3-pro-preview_20251216_195833)

| Domain | Success Rate | Success Count / Total |
|--------|--------------|----------------------|
| Blocksworld | 72.0% | 36/50 |
| Spanner | 38.0% | 19/50 |
| Ferry | 100.0% | 50/50 |
| Grippers | 100.0% | 50/50 |
| Delivery | 100.0% | 50/50 |
| **Average** | **82.0%** | **205/250** |

### cross-domain sft, GRPO single domain

| 场景 | 训练方法 | 模型路径 | 日期 | Ferry | 成功率 | 详细结果 |
|------|---------|---------|------|-------|--------|----------|
| Ferry | GRPO | `/jfan5/grpo_models/mistral_7b-ferry-1129` | 2025-11-29 | 72.0% | 36/50 | `planning_results/ferry_-jfan5-grpo_models-mistral_7b-ferry-1129_50_20251129_172521.json` |
| Grippers | GRPO | `/jfan5/grpo_models/mistral_7b-grippers-1129` | 2025-11-29 | 26.0% | 13/50 | `planning_results/grippers_-jfan5-grpo_models-mistral_7b-grippers-1129_50_20251129_210428.json` |

**Ferry 错误分类统计：**
- success_plans: 36 (72.0%)
- plan_format_error: 0 (0.0%)
- precondition_violation: 1 (2.0%)
- safety_constraints_violation: 13 (26.0%)
- goal_not_satisfied: 0 (0.0%)

**Grippers 错误分类统计：**
- success_plans: 13 (26.0%)
- plan_format_error: 6 (12.0%)
- precondition_violation: 21 (42.0%)
- safety_constraints_violation: 10 (20.0%)
- goal_not_satisfied: 0 (0.0%)





### Single-Domain

| 场景 | 训练方法 | 模型路径 | 日期 | Spanner | Grippers | Ferry | Delivery | Blocksworld | Grid | 平均成功率 |
|------|---------|---------|------|---------|----------|-------|----------|-------------|------|-----------|
| Blocksworld | SFT | `/jfan5/sft_models/mistral_variant-blocksworld` | 2025-11-27 | - | - | - | - | 46.0%<br/>`planning_results/blocksworld_-jfan5-sft_models-mistral_variant-blocksworld_50_20251127_213753.json` | - | 46.0% |
| Blocksworld | SFT | `/jfan5/sft_models/mistral_variant-blocksworld` | 2025-12-05 | - | - | - | - | 66.0%<br/>`planning_results/blocksworld_-jfan5-sft_models-mistral_variant-blocksworld_50_20251205_204335.json` | - | 66.0% |
| Blocksworld | DPO | `/jfan5/dpo_models/mistral_7b-blocksworld-1127` | 2025-11-28 | - | - | - | - | 50.0%<br/>`planning_results/blocksworld_-jfan5-dpo_models-mistral_7b-blocksworld-1127_50_20251128_000436.json` | - | 50.0% |
| Blocksworld | DPO | `/jfan5/dpo_models/mistral_7b-blocksworld-1206` | 2025-12-07 | - | - | - | - | 70.0%<br/>`planning_results/blocksworld_-jfan5-dpo_models-mistral_7b-blocksworld-1206_50_20251207_172151.json` | - | 70.0% |
| Blocksworld | GRPO | `/jfan5/grpo_models/mistral_variant-blocksworld` | 2025-11-25 | - | - | - | - | 60.0%<br/>`planning_results/grpo-mistral_variant-blocksworld_blocksworld_blocksworld_test_results.json` | - | 60.0% |
| Blocksworld | GRPO | `/jfan5/grpo_models/mistral_variant-blocksworld` | 2025-11-28 | - | - | - | - | 58.0%<br/>`planning_results/blocksworld_-jfan5-grpo_models-mistral_variant-blocksworld_50_20251128_001213.json` | - | 58.0% |
| Blocksworld | GRPO (grpo-stl) | `/jfan5/grpo_models/mistral_7b-blocksworld-stl-121` | 2025-12-01 | - | - | - | - | 66.0%<br/>`planning_results/blocksworld_-jfan5-grpo_models-mistral_7b-blocksworld-stl-121_50_20251201_165546.json` | - | 66.0% |
| Blocksworld | GRPO (grpo-stl-121-1) | `/jfan5/grpo_models/mistral_7b-blocksworld-stl-121-1` | 2025-12-05 | - | - | - | - | 86.0%<br/>`planning_results/blocksworld_-jfan5-grpo_models-mistral_7b-blocksworld-stl-121-1_50_20251205_204703.json` | - | 86.0% |
| Blocksworld | GRPO (grpo-stl) | `/jfan5/grpo_models/mistral_7b-blocksworld-stl-121/` | 2025-12-06 | - | - | - | - | 82.0%<br/>`planning_results/blocksworld_-jfan5-grpo_models-mistral_7b-blocksworld-stl-121-_50_20251206_150806.json` | - | 82.0% |
| Blocksworld | GRPO (500 steps) | `/jfan5/grpo_models/mistral_7b-blocksworld-1207` | 2025-12-07 | - | - | - | - | 80.0%<br/>`planning_results/blocksworld_-jfan5-grpo_models-mistral_7b-blocksworld-1207_50_20251207_174717.json` | - | 80.0% |
| Blocksworld | GRPO (1208-500) | `/jfan5/grpo_models/mistral_7b-blocksworld-1208-500` | 2025-12-08 | - | - | - | - | 88.0%<br/>`planning_results/blocksworld_-jfan5-grpo_models-mistral_7b-blocksworld-1208-500_50_20251208_141859.json` | - | 88.0% |
| Blocksworld | GRPO (stl-1208-500) | `/jfan5/grpo_models/mistral_7b-blocksworld-stl-1208-500` | 2025-12-08 | - | - | - | - | 86.0%<br/>`planning_results/blocksworld_-jfan5-grpo_models-mistral_7b-blocksworld-stl-1208-500_50_20251208_141945.json` | - | 86.0% |

**Blocksworld GRPO (1208-500) 错误分类统计：**
- success_plans: 44 (88.0%)
- plan_format_error: 0 (0.0%)
- precondition_violation: 2 (4.0%)
- safety_constraints_violation: 2 (4.0%)
- goal_not_satisfied: 2 (4.0%)

**Blocksworld GRPO (stl-1208-500) 错误分类统计：**
- success_plans: 43 (86.0%)
- plan_format_error: 0 (0.0%)
- precondition_violation: 2 (4.0%)
- safety_constraints_violation: 3 (6.0%)
- goal_not_satisfied: 2 (4.0%)

**Blocksworld GRPO (grpo-stl) 错误分类统计：**
- success_plans: 33 (66.0%)
- plan_format_error: 0 (0.0%)
- precondition_violation: 5 (10.0%)
- safety_constraints_violation: 11 (22.0%)
- goal_not_satisfied: 1 (2.0%)

**Blocksworld GRPO (grpo-stl-121-1) 错误分类统计：**
- success_plans: 43 (86.0%)
- plan_format_error: 1 (2.0%)
- precondition_violation: 3 (6.0%)
- safety_constraints_violation: 3 (6.0%)
- goal_not_satisfied: 0 (0.0%)

**Blocksworld GRPO (grpo-stl) 错误分类统计 (2025-12-06)：**
- success_plans: 41 (82.0%)
- plan_format_error: 0 (0.0%)
- precondition_violation: 8 (16.0%)
- safety_constraints_violation: 1 (2.0%)
- goal_not_satisfied: 0 (0.0%)

### Blocksworld 模型对比表 (Fine-tuned vs API)

#### 错误类别分布 (%)

| 类别 | SFT | DPO | GRPO (1208) | GRPO (stl-1208) | gpt-5-nano | gpt-5.1 | Gemini-3-Pro |
|------|-----|-----|-------------|-----------------|------------|---------|--------------|
| **success_plans** | 66.0 | 70.0 | **88.0** | 86.0 | 18.0 | 28.0 | 74.0 |
| plan_format_error | 0.0 | 0.0 | 0.0 | 0.0 | 2.0 | 0.0 | 0.0 |
| precondition_violation | 22.0 | 18.0 | **4.0** | **4.0** | 6.0 | 0.0 | 0.0 |
| safety_constraints_violation | 10.0 | 12.0 | **4.0** | 6.0 | 68.0 | 72.0 | 24.0 |
| goal_not_satisfied | 2.0 | 0.0 | 4.0 | 4.0 | 4.0 | 0.0 | 0.0 |

#### 按问题规模成功率 (%)

| 规模 | SFT | DPO | GRPO (1208) | GRPO (stl-1208) | gpt-5-nano | gpt-5.1 | Gemini-3-Pro |
|------|-----|-----|-------------|-----------------|------------|---------|--------------|
| ops3-n3 (n=7) | 100.0 | 100.0 | 100.0 | 100.0 | 57.1 | 85.7 | 85.7 |
| ops3-n4 (n=7) | 85.7 | 85.7 | **100.0** | **100.0** | 0.0 | 0.0 | 57.1 |
| ops3-n5 (n=3) | 100.0 | 100.0 | 100.0 | 100.0 | 33.3 | 33.3 | 33.3 |
| ops3-n6 (n=7) | 71.4 | 57.1 | 85.7 | **100.0** | 28.6 | 42.9 | 85.7 |
| ops4-n4 (n=7) | 57.1 | 71.4 | 85.7 | 85.7 | 14.3 | 14.3 | **100.0** |
| ops4-n5 (n=10) | 50.0 | 50.0 | **70.0** | **70.0** | 0.0 | 20.0 | 80.0 |
| ops4-n6 (n=9) | 33.3 | 55.6 | **88.9** | 66.7 | 11.1 | 11.1 | 55.6 |

#### 关键发现

| 模型 | 类型 | 成功率 | 主要失败原因 |
|------|------|--------|-------------|
| **GRPO (1208-500)** | Fine-tuned | **88.0%** | 均衡分布 |
| GRPO (stl-1208-500) | Fine-tuned | 86.0% | 安全约束违反 (6%) |
| Gemini-3-Pro | API | 74.0% | 安全约束违反 (24%) |
| DPO | Fine-tuned | 70.0% | 前置条件违反 (18%) |
| SFT | Fine-tuned | 66.0% | 前置条件违反 (22%) |
| gpt-5.1 | API | 28.0% | 安全约束违反 (72%) |
| gpt-5-nano | API | 18.0% | 安全约束违反 (68%) |

**结论：**
1. **微调模型显著优于API模型**：GRPO达到88%成功率，而gpt-5.1仅28%
2. **API模型主要问题是安全约束违反**：gpt-5-nano和gpt-5.1的安全约束违反率高达68-72%
3. **GRPO大幅降低前置条件违反率**：从SFT的22%降至4%
4. **Gemini-3-Pro表现较好**但仍有24%安全约束违反

---

## Qwen3-14B

sft: /jfan5/sft_models/qwen3_14b/four_scenarios500/pddl3

dpo: 
### Cross-Domain

| 训练方法 | 模型路径 | 日期 | Spanner | Grippers | Ferry | Delivery | Blocksworld | Grid | 平均成功率 |
|---------|---------|------|---------|----------|-------|----------|-------------|------|-----------|
| Baseline | `unsloth/Qwen3-14B-unsloth-bnb-4bit` | - | 0.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/spanner_test_results.json` | 0.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/grippers_test_results.json` | 0.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/ferry_test_results.json` | 12.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/delivery_test_results.json` | 4.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/blocksworld_test_results.json` | - | 3.2% |
| SFT | `/jfan5/sft_models/qwen3-14b-1127` | 2025-11-28 | 66.0%<br/>`planning_results/spanner_-jfan5-sft_models-qwen3-14b-1127_50_20251128_001536.json` | 34.0%<br/>`planning_results/grippers_-jfan5-sft_models-qwen3-14b-1127_50_20251128_001934.json` | 46.0%<br/>`planning_results/ferry_-jfan5-sft_models-qwen3-14b-1127_50_20251128_001213.json` | 2.0%<br/>`planning_results/delivery_-jfan5-sft_models-qwen3-14b-1127_50_20251128_000120.json` | 30.0%<br/>`planning_results/blocksworld_-jfan5-sft_models-qwen3-14b-1127_50_20251128_000655.json` | - | 35.6% |
| SFT | `/jfan5/sft_models/qwen3_14b/cross_domain_pddl3_symbolized` | 2025-12-12 | 98.0%<br/>`planning_results/spanner_-jfan5-sft_models-qwen3_14b-cross_domain_pddl3_symbolized_50_20251212_201724.json` | 84.0%<br/>`planning_results/grippers_-jfan5-sft_models-qwen3_14b-cross_domain_pddl3_symbolized_50_20251212_201904.json` | 80.0%<br/>`planning_results/ferry_-jfan5-sft_models-qwen3_14b-cross_domain_pddl3_symbolized_50_20251212_201506.json` | 2.0%<br/>`planning_results/delivery_-jfan5-sft_models-qwen3_14b-cross_domain_pddl3_symbolized_50_20251212_202131.json` | 74.0%<br/>`planning_results/blocksworld_-jfan5-sft_models-qwen3_14b-cross_domain_pddl3_symbolized_50_20251212_195658.json` | - | 67.6% |
| DPO | `/home/ubuntu/dpo_models/qwen3_14b/multi/pddl3_500-gpt-candidate` | 2025-11-09 | 94.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/spanner_test_results.json` | 30.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/grippers_test_results.json` | 24.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/ferry_test_results.json` | 20.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/delivery_test_results.json` | 18.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/blocksworld_test_results.json` | - | 37.2% |
| GRPO | - | - | - | - | - | - | - | - | - |

#### Detailed comparison (English): SFT vs GRPO checkpoint-900 (Cross-Domain, PDDL3 `testing_problem50`)

- SFT folder: `planning_results/-jfan5-sft_models-qwen3_14b-cross_domain_pddl3_symbolized_20251216_191358/`
- GRPO folder: `planning_results/-jfan5-grpo_models-qwen3_14b-symbolized-1215-stl-1000-checkpoint-900_20251216_191254/`

| Domain      | SFT (success/total) |  分布 (SFT)         | GRPO ckpt-900 (success/total) | 分布 (GRPO)         | precond (SFT/GRPO) | safety (SFT/GRPO) | goal-not-satisfied (SFT/GRPO) |
|-------------|---------------------|---------------------|-------------------------------|---------------------|--------------------|-------------------|-------------------------------|
| blocksworld | 36/50 (72.0%)       | 4/9/14/14 (ops4-n6/n7/n8/n9) | 35/50 (70.0%)                 | 3/10/11/11 (ops4-n6/n7/n8/n9) | 11/10             | 2/2              | 1/3                          |
| ferry       | 40/50 (80.0%)       | 4/6/9/7/9/9 (l5-c4/c5/c6, l6-c4/c5/c6, l7-c4/c5/c6, l8-c4/c5/c6) | 47/50 (94.0%)                 | 4/5/7/8/8/9 (l5-c4/c5/c6, l6-c4/c5/c6, l7-c4/c5/c6, l8-c4/c5/c6) | 3/1               | 7/2              | 0/0                          |
| spanner     | 48/50 (96.0%)       | 13/11/14/12 (s4-n4-l5/l6/l7, s5-n5-l7)    | 49/50 (98.0%)                 | 12/13/11/14 (s4-n4-l5/l6/l7, s5-n5-l7)   | 2/1               | 0/0              | 0/0                          |
| grippers    | 46/50 (92.0%)       | 3/5/2/4/5/4/2/3/4/6/6 (see 注①) | 44/50 (88.0%)                 | 3/4/2/4/5/4/2/3/4/6/7 (see 注①) | 3/3               | 1/3              | 0/0                          |
| delivery    | 3/50 (6.0%)         |                   | 3/50 (6.0%)                   |                     | 37/37              | 10/10             | 0/0                          |
| **OVERALL** | **173/250 (69.2%)** |                     | **177/250 (70.8%)**           |                     | 56/52              | 20/17             | 1/3                          |

注①：grippers难度分布样例（以 size_key 为分组，左为SFT，右为GRPO ckpt-900，各分组结果数/总数）：  
- n3-r3-o3: 3/3 | 3/3  
- n3-r4-o3: 5/7 | 4/7  
- n3-r4-o4: 2/5 | 2/5  
- n3-r5-o3: 4/4 | 4/4  
- n3-r5-o4: 5/5 | 5/5  
- n4-r3-o3: 2/2 | 2/2  
- n4-r3-o4: 3/3 | 3/3  
- n4-r4-o3: 4/5 | 4/5  
- n4-r4-o4: 6/9 | 6/9  
- n4-r5-o3: 6/6 | 6/6  
- n4-r5-o4: 6/6 | 7/6（注：GRPO为相关size数合并统计）

注②：spanner/ferry的 size_key 可查结果文件，类型举例如 s4-n4-l5（section=4, nodes=4, length=5），l5-c4（locations=5, cargos=4）。

#### Detailed results (English): GRPO checkpoint-700 (hard split, 50 problems each, temp=0.6)

- Model: `/jfan5/grpo_models/qwen3_14b-symbolized-1215-stl-1000/checkpoint-700`
- Problems: `pddl3/<domain>/testing_problems3_hard`

| Domain | Success | Difficulty breakdown (size_key success/total) | Errors: precond | safety | goal-not-satisfied | format | generation |
|---|---|---|---|---|---|---|---|
| blocksworld | 22/50 (44.0%) | ops4-n7: 10/14 (71.4%)<br/>ops4-n8: 4/15 (26.7%)<br/>ops4-n9: 8/21 (38.1%) | 19 | 3 | 6 | 0 | 0 |
| ferry | 25/50 (50.0%) | l5-c4: 4/6 (66.7%)<br/>l5-c5: 2/3 (66.7%)<br/>l5-c6: 1/6 (16.7%)<br/>l6-c4: 3/4 (75.0%)<br/>l6-c5: 3/4 (75.0%)<br/>l6-c6: 0/5 (0.0%)<br/>l7-c4: 2/3 (66.7%)<br/>l7-c5: 3/5 (60.0%)<br/>l7-c6: 0/1 (0.0%)<br/>l8-c4: 3/4 (75.0%)<br/>l8-c5: 4/6 (66.7%)<br/>l8-c6: 0/3 (0.0%) | 8 | 15 | 2 | 0 | 0 |
| grippers | 26/50 (52.0%) | n3-r3-o3: 3/3 (100.0%)<br/>n3-r4-o3: 5/7 (71.4%)<br/>n3-r4-o4: 2/5 (40.0%)<br/>n3-r5-o3: 2/4 (50.0%)<br/>n3-r5-o4: 2/4 (50.0%)<br/>n4-r3-o3: 0/1 (0.0%)<br/>n4-r3-o4: 0/2 (0.0%)<br/>n4-r4-o3: 3/5 (60.0%)<br/>n4-r4-o4: 2/4 (50.0%)<br/>n4-r5-o3: 3/6 (50.0%)<br/>n4-r5-o4: 4/9 (44.4%) | 22 | 0 | 1 | 1 | 0 |
| **OVERALL (3 domains)** | **73/150 (48.7%)** | - | 49 | 18 | 9 | 1 | 0 |


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

### OpenAI API - gpt-5-nano (PDDL3 testing_problem50, 50 problems, zero-shot)

说明：直接调用 gpt-5-nano-2025-08-07，temperature=1.0，未限制 completion tokens（max_new_tokens=None），并在结果文件中记录了每题的 token 用量。

| 场景 | 成功率 | 成功数/总数 | 平均 total tokens/题 | 结果文件 |
|------|--------|-------------|----------------------|----------|
| Blocksworld | 18.0% | 9/50 | ~16,845 | `evaluation_summary_gpt-5-nano-2025-08-07_20251205_163156.json` |
| Ferry | 20.0% | 10/50 | ~6,685 | `evaluation_summary_gpt-5-nano-2025-08-07_20251205_163622.json` |
| Spanner | 66.0% | 33/50 | ~7,469 | `evaluation_summary_gpt-5-nano-2025-08-07_20251205_164014.json` |
| Grippers | 94.0% | 47/50 | ~3,733 | `evaluation_summary_gpt-5-nano-2025-08-07_20251205_164222.json` |
| Delivery | 84.0% | 42/50 | ~7,601 | `evaluation_summary_gpt-5-nano-2025-08-07_20251205_164648.json` |

错误分类（数量/50）：

| 场景 | 成功率  | success | plan_format_err | precond_err | safety_violation | goal_not | others |
|------|--------|---------|-----------------|-------------|------------------|----------|--------|
| Blocksworld | 18.0% | 9 | 1 | 3 | 34 | 2 | 1 |
| Ferry       | 20.0% | 10 | 0 | 0 | 40 | 0 | 0 |
| Spanner     | 66.0% | 33 | 2 | 15 | 0 | 0 | 0 |
| Grippers    | 94.0% | 47 | 0 | 3 | 0 | 0 | 0 |
| Delivery    | 84.0% | 42 | 0 | 1 | 7 | 0 | 0 |

### OpenAI API - gpt-5.1 (PDDL3 testing_problem50, 50 problems, zero-shot, medium reasoning)

说明：直接调用 gpt-5.1，temperature=0.6，未限制 completion tokens（max_new_tokens=None），medium reasoning，并在结果文件中记录了每题的 token 用量。

| 场景 | 成功率 | 成功数/总数 | 平均 total tokens/题 | 结果文件 |
|------|--------|-------------|----------------------|----------|
| Blocksworld | 28.0% | 14/50 | ~5,305 | `evaluation_summary_gpt-5.1_20251205_184821.json` |
| Ferry | 40.0% | 20/50 | ~3,624 | `evaluation_summary_gpt-5.1_20251205_185350.json` |
| Spanner | 100.0% | 50/50 | ~2,812 | `evaluation_summary_gpt-5.1_20251205_185739.json` |
| Grippers | 100.0% | 50/50 | ~1,622 | `evaluation_summary_gpt-5.1_20251205_185918.json` |
| Delivery | 98.0% | 49/50 | ~4,400 | `evaluation_summary_gpt-5.1_20251205_190422.json` |

错误分类（数量/50）：

| 场景 | 成功率  | success | plan_format_err | precond_err | safety_violation | goal_not | others |
|------|--------|---------|-----------------|-------------|------------------|----------|--------|
| Blocksworld | 28.0% | 14 | 0 | 0 | 36 | 0 | 0 |
| Ferry       | 40.0% | 20 | 0 | 0 | 30 | 0 | 0 |
| Spanner     | 100.0% | 50 | 0 | 0 | 0 | 0 | 0 |
| Grippers    | 100.0% | 50 | 0 | 0 | 0 | 0 | 0 |
| Delivery    | 98.0% | 49 | 0 | 0 | 1 | 0 | 0 |


---

## 说明

- **Cross-Domain**: 在多个场景上训练的模型，测试时在多个场景上评估
- **Single-Domain**: 在单个场景上训练的模型，只在该场景上测试
- 成功率基于各场景测试集（通常50个问题）的验证结果
- 平均成功率仅计算有数据的场景
- Qwen3-14B DPO (cross-domain) 在 spanner 场景表现最佳（94%成功率）