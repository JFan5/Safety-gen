# Model Training and Success Rate Statistics - GPT


## supervised fine-tuning data
1. 用5个prompt去randomnized：/jfan5/sft_data/four_scenarios500
2. simple prompt symbolized (每个Scenario 1000条): /jfan5/sft_data/pddl3_symbolized_four_scenarios_v2



### dpo data
/home/ubuntu/Safety-gen/data/dpo/new_four

### grpo data
/jfan5/grpo_data
symobolized，每个1000条：/jfan5/grpo_data/pddl3_symbolized_four_scenarios-v2/


## GPT

### Cross-Domain

| Training Method | Model Path | Date | Spanner | Grippers | Ferry | Delivery | Blocksworld | Grid | Average Success Rate |
|---------|---------|------|---------|----------|-------|----------|-------------|------|-----------|
| Baseline | `unsloth/gpt-oss-20b-unsloth-bnb-4bit` | - | 0.0%<br/>`paper_results_iccps2025/gpt-oss-multi/baseline/spanner_test_results.json` | 2.0%<br/>`paper_results_iccps2025/gpt-oss-multi/baseline/grippers_test_results.json` | 2.0%<br/>`paper_results_iccps2025/gpt-oss-multi/baseline/ferry_test_results.json` | 0.0%<br/>`paper_results_iccps2025/gpt-oss-multi/baseline/delivery_test_results.json` | 0.0%<br/>`paper_results_iccps2025/gpt-oss-multi/baseline/blocksworld_test_results.json` | 0.0%<br/>`paper_results_iccps2025/gpt-oss-multi/baseline/grid_test_results.json` | 0.7% |
| SFT | `/jfan5/sft_models/gpt_oss_20b/four_scenarios500` | 2025-11-24 | 60.0%<br/>`planning_results/gpt_oss_20b-sft500_spanner_spanner_test_results.json` | 10.0%<br/>`planning_results/gpt_oss_20b-sft500_grippers_grippers_test_results.json` | 4.0%<br/>`planning_results/gpt_oss_20b-sft500_ferry_ferry_test_results.json` | 2.0%<br/>`planning_results/gpt_oss_20b-sft500_delivery_delivery_test_results.json` | 2.0%<br/>`planning_results/gpt_oss_20b-sft500_blocksworld_blocksworld_test_results.json` | - | 15.6% |
| GRPO | - | - | - | - | - | - | - | - | - |

### OpenAI API - gpt-5-nano (PDDL3 testing_problem50, 50 problems, zero-shot)

Note: Directly calling gpt-5-nano-2025-08-07, temperature=1.0, no completion token limit (max_new_tokens=None), and token usage per problem is recorded in the result files.

| Scenario | Success Rate | Success/Total | Average total tokens/problem | Result File |
|------|--------|-------------|----------------------|----------|
| Blocksworld | 18.0% | 9/50 | ~16,845 | `evaluation_summary_gpt-5-nano-2025-08-07_20251205_163156.json` |
| Ferry | 20.0% | 10/50 | ~6,685 | `evaluation_summary_gpt-5-nano-2025-08-07_20251205_163622.json` |
| Spanner | 66.0% | 33/50 | ~7,469 | `evaluation_summary_gpt-5-nano-2025-08-07_20251205_164014.json` |
| Grippers | 94.0% | 47/50 | ~3,733 | `evaluation_summary_gpt-5-nano-2025-08-07_20251205_164222.json` |
| Delivery | 84.0% | 42/50 | ~7,601 | `evaluation_summary_gpt-5-nano-2025-08-07_20251205_164648.json` |

Error Classification (count/50):

| Scenario | Success Rate  | success | plan_format_err | precond_err | safety_violation | goal_not | others |
|------|--------|---------|-----------------|-------------|------------------|----------|--------|
| Blocksworld | 18.0% | 9 | 1 | 3 | 34 | 2 | 1 |
| Ferry       | 20.0% | 10 | 0 | 0 | 40 | 0 | 0 |
| Spanner     | 66.0% | 33 | 2 | 15 | 0 | 0 | 0 |
| Grippers    | 94.0% | 47 | 0 | 3 | 0 | 0 | 0 |
| Delivery    | 84.0% | 42 | 0 | 1 | 7 | 0 | 0 |

### OpenAI API - gpt-5.1 (PDDL3 testing_problem50, 50 problems, zero-shot, medium reasoning)

Note: Directly calling gpt-5.1, temperature=0.6, no completion token limit (max_new_tokens=None), medium reasoning, and token usage per problem is recorded in the result files.

| Scenario | Success Rate | Success/Total | Average total tokens/problem | Result File |
|------|--------|-------------|----------------------|----------|
| Blocksworld | 28.0% | 14/50 | ~5,305 | `evaluation_summary_gpt-5.1_20251205_184821.json` |
| Ferry | 40.0% | 20/50 | ~3,624 | `evaluation_summary_gpt-5.1_20251205_185350.json` |
| Spanner | 100.0% | 50/50 | ~2,812 | `evaluation_summary_gpt-5.1_20251205_185739.json` |
| Grippers | 100.0% | 50/50 | ~1,622 | `evaluation_summary_gpt-5.1_20251205_185918.json` |
| Delivery | 98.0% | 49/50 | ~4,400 | `evaluation_summary_gpt-5.1_20251205_190422.json` |

Error Classification (count/50):

| Scenario | Success Rate  | success | plan_format_err | precond_err | safety_violation | goal_not | others |
|------|--------|---------|-----------------|-------------|------------------|----------|--------|
| Blocksworld | 28.0% | 14 | 0 | 0 | 36 | 0 | 0 |
| Ferry       | 40.0% | 20 | 0 | 0 | 30 | 0 | 0 |
| Spanner     | 100.0% | 50 | 0 | 0 | 0 | 0 | 0 |
| Grippers    | 100.0% | 50 | 0 | 0 | 0 | 0 | 0 |
| Delivery    | 98.0% | 49 | 0 | 0 | 1 | 0 | 0 |


---

## Notes

- **Cross-Domain**: Models trained on multiple scenarios and evaluated on multiple scenarios
- **Single-Domain**: Models trained on a single scenario and tested only on that scenario
- Success rates are based on validation results from each scenario's test set (typically 50 problems)
- Average success rate is calculated only for scenarios with data
- Qwen3-14B DPO (cross-domain) performs best on the spanner scenario (94% success rate)




