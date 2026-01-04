# Qwen3-14B 模型测试性能统计

## supervised fine-tuning data
/jfan5/sft_data/four_scenarios500

### dpo data
/home/ubuntu/Safety-gen/data/dpo/new_four

### grpo data
/jfan5/ppo_data

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

## 说明

- **Cross-Domain**: 在多个场景上训练的模型，测试时在多个场景上评估
- **Single-Domain**: 在单个场景上训练的模型，只在该场景上测试
- 成功率基于各场景测试集（通常50个问题）的验证结果
- 平均成功率仅计算有数据的场景
- Qwen3-14B DPO (cross-domain) 在 spanner 场景表现最佳（94%成功率）

