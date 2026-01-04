# Model Training and Success Rate Statistics - Mistral-7B


## supervised fine-tuning data
1. 用5个prompt去randomnized：/jfan5/sft_data/four_scenarios500
2. simple prompt symbolized (每个Scenario 1000条): /jfan5/sft_data/pddl3_symbolized_four_scenarios_v2



### dpo data
/home/ubuntu/Safety-gen/data/dpo/new_four

### grpo data
/jfan5/grpo_data
symobolized，每个1000条：/jfan5/grpo_data/pddl3_symbolized_four_scenarios-v2/


## Mistral-7B

### Cross-Domain

| Training Method | Model Path | Date | Spanner | Grippers | Ferry | Delivery | Blocksworld | Grid | Average Success Rate |
|---------|---------|------|---------|----------|-------|----------|-------------|------|-----------|
| Baseline | `unsloth/mistral-7b-instruct-v0.3-bnb-4bit` | - | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/spanner_test_results.json` | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/grippers_test_results.json` | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/ferry_test_results.json` | 0.0%<br/>`planning_results/baseline_mistral_7b/delivery.json` | 0.0%<br/>`paper_results_iccps2025/mistral-multi/pretrained/blocksworld_test_results.json` | - | 0.0% |
| SFT | `/jfan5/sft_models/mistral_7b/four_scenarios500` | 2025-11-24 | 54.0%<br/>`planning_results/mistral_7b-sft500_spanner_spanner_test_results.json` | 18.0%<br/>`planning_results/mistral_7b-sft500_grippers_grippers_test_results.json` | 72.0%<br/>`planning_results/mistral_7b-sft500_ferry_ferry_test_results.json` | 0.0%<br/>`planning_results/delivery_-jfan5-sft_models-mistral_7b-four_scenarios500-1124_50_oneshot_20251127_204146.json` | 46.0%<br/>`planning_results/mistral_7b-sft500_blocksworld_blocksworld_test_results.json` | - | 38.0% |
| SFT | `/jfan5/sft_models/mistral_7b/four_scenarios500-1124` | 2025-12-06 | 52.0%<br/>`planning_results/spanner_-jfan5-sft_models-mistral_7b-four_scenarios500-1124_50_20251206_150941.json` | 50.0%<br/>`planning_results/grippers_-jfan5-sft_models-mistral_7b-four_scenarios500-1124_50_20251206_151334.json` | 76.0%<br/>`planning_results/ferry_-jfan5-sft_models-mistral_7b-four_scenarios500-1124_50_20251206_150333.json` | 0.0%<br/>`planning_results/delivery_-jfan5-sft_models-mistral_7b-four_scenarios500-1124_50_20251206_151739.json` | 58.0%<br/>`planning_results/blocksworld_-jfan5-sft_models-mistral_7b-four_scenarios500-1124_50_20251206_145855.json` | - | 47.2% |
| SFT | `/jfan5/sft_models/mistral_7b/four_scenarios500-1124` | 2025-12-07 | - | - | - | - | 56.0%<br/>`planning_results/blocksworld_-jfan5-sft_models-mistral_7b-four_scenarios500-1124_50_20251207_015238.json` | - | 56.0% |
| DPO | `/groups/fkong/jfan5/dpo_models/mistral_7b/multi/pddl3_500-gpt-candidate` | - | - | 28.0%<br/>`paper_results_iccps2025/mistral-multi/dpo/grippers_test_results_pddl3.json` | 32.0%<br/>`paper_results_iccps2025/mistral-multi/dpo/ferry_test_results_pddl3.json` | - | 28.0%<br/>`paper_results_iccps2025/mistral-multi/dpo/blocksworld_test_results_pddl3.json` | - | 29.3% |
| GRPO | - | - | - | - | - | - | - | - | - |

### cross-domain sft, GRPO single domain

| Scenario | Training Method | Model Path | Date | Ferry | Success Rate | Detailed Results |
|------|---------|---------|------|-------|--------|----------|
| Ferry | GRPO | `/jfan5/grpo_models/mistral_7b-ferry-1129` | 2025-11-29 | 72.0% | 36/50 | `planning_results/ferry_-jfan5-grpo_models-mistral_7b-ferry-1129_50_20251129_172521.json` |
| Grippers | GRPO | `/jfan5/grpo_models/mistral_7b-grippers-1129` | 2025-11-29 | 26.0% | 13/50 | `planning_results/grippers_-jfan5-grpo_models-mistral_7b-grippers-1129_50_20251129_210428.json` |

**Ferry Error Classification Statistics:**
- success_plans: 36 (72.0%)
- plan_format_error: 0 (0.0%)
- precondition_violation: 1 (2.0%)
- safety_constraints_violation: 13 (26.0%)
- goal_not_satisfied: 0 (0.0%)

**Grippers Error Classification Statistics:**
- success_plans: 13 (26.0%)
- plan_format_error: 6 (12.0%)
- precondition_violation: 21 (42.0%)
- safety_constraints_violation: 10 (20.0%)
- goal_not_satisfied: 0 (0.0%)




### Single-Domain

| Scenario | Training Method | Model Path | Date | Success Rate | Detailed Results |
|------|----------------|-----------------------------------------------------|------------|-------------|------------------|
| Blocksworld | SFT | `/jfan5/sft_models/mistral_variant-blocksworld` | 2025-12-05 | 66.0% | `planning_results/blocksworld_-jfan5-sft_models-mistral_variant-blocksworld_50_20251205_204335.json` |
| Blocksworld | DPO | `/jfan5/dpo_models/mistral_7b-blocksworld-1206` | 2025-12-07 | 70.0% | `planning_results/blocksworld_-jfan5-dpo_models-mistral_7b-blocksworld-1206_50_20251207_172151.json` |
| Blocksworld | GRPO (1208-500) | `/jfan5/grpo_models/mistral_7b-blocksworld-1208-500` | 2025-12-08 | 88.0% | `planning_results/blocksworld_-jfan5-grpo_models-mistral_7b-blocksworld-1208-500_50_20251208_141859.json` |
| Blocksworld | GRPO (stl-1208-500) | `/jfan5/grpo_models/mistral_7b-blocksworld-stl-1208-500` | 2025-12-08 | 86.0% | `planning_results/blocksworld_-jfan5-grpo_models-mistral_7b-blocksworld-stl-1208-500_50_20251208_141945.json` |

**Blocksworld GRPO (1208-500) Error Classification Statistics:**
- success_plans: 44 (88.0%)
- plan_format_error: 0 (0.0%)
- precondition_violation: 2 (4.0%)
- safety_constraints_violation: 2 (4.0%)
- goal_not_satisfied: 2 (4.0%)

**Blocksworld GRPO (stl-1208-500) Error Classification Statistics:**
- success_plans: 43 (86.0%)
- plan_format_error: 0 (0.0%)
- precondition_violation: 2 (4.0%)
- safety_constraints_violation: 3 (6.0%)
- goal_not_satisfied: 2 (4.0%)

**Blocksworld GRPO (grpo-stl) Error Classification Statistics:**
- success_plans: 33 (66.0%)
- plan_format_error: 0 (0.0%)
- precondition_violation: 5 (10.0%)
- safety_constraints_violation: 11 (22.0%)
- goal_not_satisfied: 1 (2.0%)

**Blocksworld GRPO (grpo-stl-121-1) Error Classification Statistics:**
- success_plans: 43 (86.0%)
- plan_format_error: 1 (2.0%)
- precondition_violation: 3 (6.0%)
- safety_constraints_violation: 3 (6.0%)
- goal_not_satisfied: 0 (0.0%)

**Blocksworld GRPO (grpo-stl) Error Classification Statistics (2025-12-06):**
- success_plans: 41 (82.0%)
- plan_format_error: 0 (0.0%)
- precondition_violation: 8 (16.0%)
- safety_constraints_violation: 1 (2.0%)
- goal_not_satisfied: 0 (0.0%)

### Blocksworld Model Comparison (Fine-tuned vs API)

#### Error Category Rates (%)

| Category | SFT | DPO | GRPO  | GRPO (dense) | gpt-5-nano | gpt-5.1 (medium) | Gemini-3-Pro |
|----------|-----|-----|-------------|-----------------|------------|---------|--------------|
| **success_plans** | 66.0 | 70.0 | **88.0** | 86.0 | 18.0 | 28.0 | 74.0 |
| plan_format_error | 0.0 | 0.0 | 0.0 | 0.0 | 2.0 | 0.0 | 0.0 |
| precondition_violation | 22.0 | 18.0 | **4.0** | **4.0** | 6.0 | 0.0 | 0.0 |
| safety_constraints_violation | 10.0 | 12.0 | **4.0** | 6.0 | 68.0 | 72.0 | 24.0 |
| goal_not_satisfied | 2.0 | 0.0 | 4.0 | 4.0 | 4.0 | 0.0 | 0.0 |

#### Success Rate by Problem Size (%)

| Blocks | SFT | DPO | GRPO | GRPO (dense) | gpt-5-nano | gpt-5.1 | Gemini-3-Pro |
|----------|-----|-----|-------------|-----------------|------------|---------|--------------|
| 3        | 100.0 | 100.0 | 100.0 | 100.0 | 33.3 | 33.3 | 33.3 |
| 4        | 85.7 | 85.7 | 100.0 | 100.0 | 0.0 | 0.0 | 57.1 |
| 5        | 53.6 | 62.5 | 75.0 | 77.5 | 7.1 | 16.7 | 75.0 |
| 6        | 51.6 | 54.7 | 81.6 | 82.1 | 16.6 | 22.4 | 73.7 |


#### Key Findings

| Model | Type | Success Rate | Main Failure Mode |
|-------|------|--------------|-------------------|
| **GRPO (1208-500)** | Fine-tuned | **88.0%** | Balanced errors |
| GRPO (stl-1208-500) | Fine-tuned | 86.0% | Safety violations (6%) |
| Gemini-3-Pro | API | 74.0% | Safety violations (24%) |
| DPO | Fine-tuned | 70.0% | Precondition (18%) |
| SFT | Fine-tuned | 66.0% | Precondition (22%) |
| gpt-5.1 | API | 28.0% | Safety violations (72%) |
| gpt-5-nano | API | 18.0% | Safety violations (68%) |

**Conclusions:**
1. **Fine-tuned models significantly outperform API models**: GRPO achieves 88% success rate vs only 28% for gpt-5.1
2. **API models mainly fail on safety constraints**: gpt-5-nano and gpt-5.1 have 68-72% safety constraint violations
3. **GRPO dramatically reduces precondition violations**: from 22% (SFT) to only 4%
4. **Gemini-3-Pro performs better** than GPT models but still has 24% safety violations

---

## Notes

- **Cross-Domain**: Models trained on multiple scenarios and evaluated on multiple scenarios
- **Single-Domain**: Models trained on a single scenario and tested only on that scenario
- Success rates are based on validation results from each scenario's test set (typically 50 problems)
- Average success rate is calculated only for scenarios with data
- Qwen3-14B DPO (cross-domain) performs best on the spanner scenario (94% success rate)




