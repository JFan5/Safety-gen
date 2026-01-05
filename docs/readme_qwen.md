# Model Training and Success Rate Statistics - Qwen3-14B


# 数据集
## sft data
1. 用5个prompt去randomnized：/jfan5/sft_data/four_scenarios500
2. simple prompt symbolized (每个Scenario 1000条): /jfan5/sft_data/pddl3_symbolized_four_scenarios_v2


### dpo data
/home/ubuntu/Safety-gen/data/dpo/new_four

### grpo data
/jfan5/grpo_data
symobolized，每个1000条：/jfan5/grpo_data/pddl3_symbolized_four_scenarios-v2/


## 训练好的model

qwen3-14b
1. sft model和测试结果： /jfan5/sft_models/qwen3_14b/cross_domain_pddl3_symbolized 测试结果： planning_results/-jfan5-sft_models-qwen3_14b-cross_domain_pddl3_symbolized_20251216_191358

2. grpo测试结果：  planning_results/-jfan5-grpo_models-qwen3_14b-symbolized-1215-stl-1000-checkpoint-900_20251216_191254， model: /jfan5/grpo_models/qwen3_14b-symbolized-1215-stl-1000/checkpoint-900



## single domain blocksworld 测试结果
sft_model evaluation results: 
planning_results/blocksworld_-jfan5-sft_models-qwen3_14b-blocksworld_pddl3_symbolized_50_20251212_195238.json





## Qwen3-14B

sft: /jfan5/sft_models/qwen3_14b/four_scenarios500/pddl3

dpo: 

grpo: 
### Cross-Domain

| Training Method | Model Path | Date | Spanner | Grippers | Ferry | Delivery | Blocksworld | Grid | Average Success Rate |
|---------|---------|------|---------|----------|-------|----------|-------------|------|-----------|
| Baseline | `unsloth/Qwen3-14B-unsloth-bnb-4bit` | - | 0.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/spanner_test_results.json` | 0.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/grippers_test_results.json` | 0.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/ferry_test_results.json` | 12.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/delivery_test_results.json` | 4.0%<br/>`paper_results_iccps2025/qwen3-14b/baseline/blocksworld_test_results.json` | - | 3.2% |
| SFT | `/jfan5/sft_models/qwen3-14b-1127` | 2025-11-28 | 66.0%<br/>`planning_results/spanner_-jfan5-sft_models-qwen3-14b-1127_50_20251128_001536.json` | 34.0%<br/>`planning_results/grippers_-jfan5-sft_models-qwen3-14b-1127_50_20251128_001934.json` | 46.0%<br/>`planning_results/ferry_-jfan5-sft_models-qwen3-14b-1127_50_20251128_001213.json` | 2.0%<br/>`planning_results/delivery_-jfan5-sft_models-qwen3-14b-1127_50_20251128_000120.json` | 30.0%<br/>`planning_results/blocksworld_-jfan5-sft_models-qwen3-14b-1127_50_20251128_000655.json` | - | 35.6% |
| DPO | `/home/ubuntu/dpo_models/qwen3_14b/multi/pddl3_500-gpt-candidate` | 2025-11-09 | 94.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/spanner_test_results.json` | 30.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/grippers_test_results.json` | 24.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/ferry_test_results.json` | 20.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/delivery_test_results.json` | 18.0%<br/>`paper_results_iccps2025/qwen3-14b/dpo/blocksworld_test_results.json` | - | 37.2% |
| GRPO | - | - | - | - | - | - | - | - | - |

### Single-Domain

| Scenario | Training Method | Model Path | Date | Spanner | Grippers | Ferry | Delivery | Blocksworld | Grid | Average Success Rate |
|------|---------|---------|------|---------|----------|-------|----------|-------------|------|-----------|
| Spanner | DPO | `/home/ubuntu/dpo_models/qwen3_14b/multi/pddl3_500-gpt-candidate-2` | 2025-11-14 | 56.0%<br/>`planning_results/qwen3_dpo_bfgs-v2_spanner_results_spanner_dpo_bfgs.json` | - | - | - | - | - | 56.0% |

---

## Notes

- **Cross-Domain**: Models trained on multiple scenarios and evaluated on multiple scenarios
- **Single-Domain**: Models trained on a single scenario and tested only on that scenario
- Success rates are based on validation results from each scenario's test set (typically 50 problems)
- Average success rate is calculated only for scenarios with data
- Qwen3-14B DPO (cross-domain) performs best on the spanner scenario (94% success rate)




