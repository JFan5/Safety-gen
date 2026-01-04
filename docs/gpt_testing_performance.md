# GPT 模型测试性能统计

## supervised fine-tuning data
/jfan5/sft_data/four_scenarios500

### dpo data
/home/ubuntu/Safety-gen/data/dpo/new_four

### grpo data
/jfan5/ppo_data

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

