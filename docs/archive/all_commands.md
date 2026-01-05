# Safety-gen 项目完整命令指南

本文档列出了构建 Safety-gen 项目所需的全部脚本和命令。

## 1. PDDL 问题创建、验证、转换为 PDDL3

### 1.1 生成 PDDL2 问题

```bash
# Blocksworld
python3 pddl3/blocksworld/generate_problems.py

# Ferry
python3 pddl3/ferry/generate.py

# Spanner
python3 pddl3/spanner/generate_unique_problems.py

# Grippers
python3 pddl3/gripper/generate_gripper_problems.py

# Grid
python3 pddl3/grid/generate.py

# Delivery
python3 pddl3/delivery/generate.py
```

### 1.2 转换为 PDDL3 并生成训练集

```bash
# Blocksworld - 转换为PDDL3并生成训练集
python3 pddl3/blocksworld/convert_pddl3.py
python3 pddl3/blocksworld/generate_blocksworld_training_unique.py

# Spanner - 转换为PDDL3
python3 pddl3/spanner/convert_training_to_pddl3.py

# Ferry - 转换为PDDL3
# (通常通过pipeline脚本完成)

# Grippers - 转换为PDDL3
# (通常通过pipeline脚本完成)
```

### 1.3 验证 PDDL3 问题和解决方案

```bash
# 验证所有场景的PDDL3训练集
python3 pddl3/validate_all_problems_solutions_for_pddl3.py

# 验证sft_500数据集
python3 pddl3/validate_sft_datasets.py

# 验证grpo_500数据集（四个特征）
python3 pddl3/validate_grpo_500_comprehensive.py

# 验证测试集
python3 pddl3/validate_testing_datasets.py

# 验证PDDL3约束
python3 script/validate_pddl3_constraints_against_classical.py
```

### 1.4 生成测试集

```bash
# 生成testing_problem50
python3 pddl3/generate_testing50_metadata.py

# 为每个场景创建测试集
python3 pddl3/blocksworld/create_testing_problem50.py
```

## 2. SFT/DPO/GRPO 数据集构建

### 2.1 SFT 数据集构建

#### 生成 SFT_500 数据集

```bash
# 为所有场景生成sft_500_new数据集
python3 pddl3/generate_sft_500_new.py

# 为单个场景生成sft_500
python3 pddl3/grid/generate_sft_500_new.py
python3 pddl3/delivery/generate_sft_500_new.py

# 生成sft_500元数据
python3 pddl3/generate_sft_500_new_metadata.py

# 选择sft_500数据集
python3 select_sft_500.py
```

#### 收集 SFT 数据集为 HuggingFace 格式

```bash
# 收集单个场景的SFT数据
python3 script/collect_single_scenario.py blocksworld \
    --pddl PDDL3 \
    --source sft_500 \
    --root pddl3/blocksworld \
    --prompt_variants 5 \
    --max_number 500 \
    --seed 42 \
    --output /jfan5/sft_data/blocksworld-sft500-variant-5

# 收集所有场景的SFT数据（使用shell脚本）
bash shells/collect_sft500.sh

# 收集PDDL2的SFT数据
bash shells/collect_sft_pddl2_dataset_all.sh
bash shells/collect_sft_pddl2_dataset_together.sh

# 收集PDDL3的SFT数据
bash shells/collect_sft_pddl3_dataset_all.sh
bash shells/collect_sft_pddl3_dataset_together.sh

# 收集多场景SFT数据（variant模型）
bash shells/collect_multi_scenarios_sft_variant.sh
```

### 2.2 DPO 数据集构建

#### 生成 DPO 数据集

```bash
# 生成DPO数据集（主脚本）
python3 generate_dpo_dataset.py \
    --scenario blocksworld \
    --sft_model /jfan5/sft_models/mistral_variant-blocksworld \
    --output_dir data/dpo/new_four \
    --num_samples 500

# 使用脚本构建DPO数据集
python3 script/construct_dpo_dataset.py
python3 script/construct_dpo_dataset-500.py

# 为单个场景创建DPO训练数据
python3 create_blocksworld_dpo.py
python3 create_ferry_dpo_training.py
python3 create_grippers_dpo_training.py
python3 create_spanner_dpo_training.py

# 创建DPO训练文件
python3 create_dpo_training_files.py

# 确保DPO训练数据完整性
python3 script/ensure_dpo_training.py
```

#### 收集 DPO 数据集

```bash
# 收集blocksworld的DPO数据
bash shells/collect_blocksworld_dpo500.sh

# 收集多场景DPO数据
bash shells/collect_multi_scenarios_dpo.sh
```

### 2.3 GRPO 数据集构建

#### 生成 GRPO_500 数据集

```bash
# 生成grpo_500数据集（满足四个特征）
python3 pddl3/generate_grpo_500.py

# 为grid场景生成grpo_500
python3 pddl3/grid/generate_grpo_500.py
python3 pddl3/grid/generate_grpo_500_new.py

# 为delivery场景生成grpo_500
python3 pddl3/delivery/generate_grpo_500.py
```

#### 构建 GRPO 训练数据集

```bash
# 构建GRPO数据集
python3 script/construct_grpo_dataset.py

# 匹配GRPO候选
python3 script/match_grpo_candidates.py

# 合并DPO到GRPO
python3 script/merge_dpo_to_grpo.py

# 收集多场景GRPO数据
bash shells/collect_multi_scenarios_grpo.sh
```

### 2.4 数据集验证和修复

```bash
# 验证数据集
python3 pddl3/validate_grpo_500_comprehensive.py
python3 pddl3/validate_sft_datasets.py

# 修复DPO数据
python3 script/fix_dpo_data.py
python3 clean_dpo_data.py

# 检查重叠
python3 check_overlap.py
```

## 3. SFT/DPO/GRPO 训练

### 3.1 SFT 训练

#### 使用 Unsloth 训练

```bash
# Mistral-7B SFT训练
bash shells/finetune_mistral_7b_sft500.sh
bash shells/finetune_mistral_7b_blocksworld.sh
bash shells/finetune_mistral_7b_ferry.sh
bash shells/finetune_mistral_7b_grippers.sh
bash shells/finetune_mistral_7b_spanner.sh

# Mistral-7B 随机化训练
bash shells/finetune_mistral_7b_randomized.sh
bash shells/finetune_mistral_7b_randomized_augmented.sh

# Qwen3-14B SFT训练
bash shells/finetune_qwen3_14b_sft500.sh

# Qwen3-4B SFT训练
bash shells/finetune_qwen3_4b_sft500.sh

# GPT-OSS-20B SFT训练
bash shells/finetune_gpt_oss_20b_sft500.sh
```

#### 直接使用 Python 脚本训练

```bash
# 使用pddl_finetune.py
python3 pddl_finetune.py \
    --model_name unsloth/mistral-7b-instruct-v0.3-bnb-4bit \
    --dataset /jfan5/sft_data/four_scenarios500 \
    --output_dir /jfan5/sft_models/mistral_7b/four_scenarios500
```

### 3.2 DPO 训练

#### 使用 Unsloth 训练

```bash
# Mistral-7B DPO训练（多场景）
bash shells/dpo_mistral_7b.sh

# Mistral-7B DPO训练（单场景blocksworld）
bash shells/dpo_mistral_7b_blocksworld.sh

# Qwen3-14B DPO训练
bash shells/dpo_qwen-14b.sh
```

#### 直接使用 Python 脚本训练

```bash
# 使用train_dpo_unsloth.py
python3 script/train_dpo_unsloth.py \
    --base_model /jfan5/sft_models/mistral_7b/four_scenarios500-1124 \
    --dataset /home/ubuntu/Safety-gen/data/dpo/new_four/multi_pddl3_dpo.jsonl \
    --output_dir /jfan5/dpo_models/mistral_7b-1206 \
    --num_epochs 2 \
    --batch_size 4 \
    --gradient_accumulation_steps 4 \
    --learning_rate 2e-6 \
    --beta 0.02

# 使用train_dpo_pure.py（不使用unsloth）
python3 script/train_dpo_pure.py
```

### 3.3 GRPO 训练

#### 使用 Unsloth 训练

```bash
# Mistral-7B GRPO训练（多场景）
bash shells/grpo_mistral_7b_sft500.sh

# Mistral-7B GRPO训练（单场景）
bash shells/grpo_mistral_7b_blocksworld.sh
bash shells/grpo_mistral_7b_blocksworld_stl.sh
bash shells/grpo_mistral_7b_ferry.sh
bash shells/grpo_mistral_7b_grippers.sh
bash shells/grpo_mistral_7b_spanner.sh

# Qwen3-14B GRPO训练
bash shells/grpo_qwen3_14b_sft500.sh

# Qwen3-4B GRPO训练
bash shells/grpo_qwen3_4b_sft500.sh

# GPT-OSS-20B GRPO训练
bash shells/grpo_gpt_oss_20b_sft500.sh
```

#### 直接使用 Python 脚本训练

```bash
# 使用train_grpo_unsloth.py
python3 script/train_grpo_unsloth.py \
    --base_model /jfan5/sft_models/mistral_7b/four_scenarios500-1124 \
    --dataset /jfan5/ppo_data \
    --output_dir /jfan5/grpo_models/mistral_7b-multi \
    --num_epochs 1 \
    --batch_size 4 \
    --gradient_accumulation_steps 4 \
    --learning_rate 2e-6
```

### 3.4 PPO 训练

```bash
# 使用train_ppo_unsloth.py
python3 script/train_ppo_unsloth.py \
    --base_model /jfan5/sft_models/mistral_7b/four_scenarios500-1124 \
    --dataset /jfan5/ppo_data \
    --output_dir /jfan5/ppo_models/mistral_7b-multi
```

### 3.5 模型合并和保存

```bash
# 合并模型
python3 script/merge_model.py
python3 merge_adapter.py

# 从checkpoint保存模型
python3 script/save_model_from_checkpoint.py
bash script/save_from_checkpoint.sh
bash script/save_from_checkpoint-blocksworld.sh
```

## 4. 评估

### 4.1 LLM 求解器评估

#### 批量评估（推荐）

```bash
# 评估所有模型（批量）
bash shells/evaluate_llm_all_batch.sh

# 评估所有模型（单个）
bash shells/evaluate_llm_all.sh

# 评估单个场景
bash shells/evaluate_llm_blocksworld.sh
bash shells/evaluate_llm_ferry.sh
bash shells/evaluate_llm_grippers.sh
bash shells/evaluate_llm_spanner.sh
bash shells/evaluate_llm_delivery.sh
```

#### 使用 Python 脚本评估

```bash
# 批量评估（推荐）
python3 script/evaluate_llm_solver_batch.py \
    --model_path /jfan5/sft_models/mistral_7b/four_scenarios500-1124 \
    --scenario blocksworld \
    --problems_dir pddl3/blocksworld/testing_problem50 \
    --domain_file pddl3/blocksworld/domain3.pddl \
    --max_problems 50 \
    --output_file planning_results/blocksworld_test_results.json

# 单个问题评估
python3 script/evaluate_single_problem.py

# 使用Transformers评估
python3 script/evaluate_llm_solver_transformers.py

# 标准评估
python3 script/evaluate_llm_solver.py
```

### 4.2 API LLM 评估

```bash
# 评估API LLM（所有场景）
bash shells/evaluate_api_llm_all.sh

# 使用Python脚本评估API
python3 script/evaluate_api_llm_solver.py \
    --model_name gpt-5-nano-2025-08-07 \
    --scenario blocksworld \
    --problems_dir pddl3/blocksworld/testing_problem50 \
    --domain_file pddl3/blocksworld/domain3.pddl \
    --max_problems 50
```

### 4.3 结果解析和可视化

```bash
# 解析所有规划结果
bash shells/parse_planning_results_all.sh

# 可视化规划结果
bash shells/visualize_planning_results_all.sh

# 运行规划结果比较
bash shells/run_planning_result_comparison.sh

# 绘制模型比较
bash shells/plot_model_comparison.sh

# 验证所有测试结果
bash shells/validate_all_testing_results.sh
```

#### 使用 Python 脚本分析结果

```bash
# 解析规划结果
python3 script/parse_planning_results.py

# 可视化规划结果
python3 script/visualize_planning_results.py

# 比较模型
python3 script/compare_models.py
python3 script/batch_compare_models.py

# 生成表格
python3 script/generate_sft_vs_dpo_table.py
python3 script/generate_error_table.py

# 绘制图表
python3 script/plot_model_category.py
python3 script/plot_model_correctness.py
python3 script/plot_two_models.py
python3 script/plot_domain_time.py
python3 script/plot_time_benchmark.py
```

### 4.4 基准测试

```bash
# 生成基准问题
python3 script/generate_benchmark_problems.py

# 运行OPTIC基准测试
python3 script/run_optic_benchmark.py
python3 script/solve_optic.py
python3 script/solve_problems_optic.py

# 解决基准问题
python3 script/solve_benchmark_problems.py
```

### 4.5 Token 统计

```bash
# Token统计
python3 script/token_stats.py
python3 script/token_stats_transformers.py
python3 script/token_stats_markdown.py
```

## 5. 其他工具脚本

### 5.1 数据准备和处理

```bash
# 准备SFT/PPO数据
python3 script/prepare_sft_ppo_500.py

# 生成训练问题
python3 script/generate_training_problems.py

# 生成评分候选
python3 script/generate_score_candidate.py

# 创建评分摘要
python3 script/create_scored_summaries.py

# 分割问题
python3 script/split_problems.py
```

### 5.2 验证和检查

```bash
# 验证经典求解器
python3 script/validate_classical_solvers.py

# 验证微调解决方案
python3 script/validate_finetuned_solutions.py

# 检查模型文件
bash script/check_model_files.sh

# 检查模型量化
python3 script/check_model_quantization.py
python3 script/quick_check_quantization.py
```

### 5.3 工具和实用程序

```bash
# 修复测试结果分类
python3 script/fix_test_results_classification.py

# 修复作业变量
python3 script/fix_job_variables.py

# 标准化作业文件
python3 script/standardize_job_files.py
python3 script/standardize_all_jobs.py

# 解决结果
python3 script/solve_results.py
python3 script/solve_llm.py
```

### 5.4 提交作业

```bash
# 提交多场景评估作业
bash shells/submit_multi_scenario_evals.sh

# 提交缺失的规划作业
bash shells/submit_missing_planning_jobs.sh
```

## 6. 快速开始示例

### 完整流程示例

```bash
# 1. 生成PDDL3问题和训练集
python3 pddl3/generate_sft_500_new.py
python3 pddl3/generate_grpo_500.py

# 2. 收集数据集
bash shells/collect_sft500.sh
bash shells/collect_multi_scenarios_dpo.sh
bash shells/collect_multi_scenarios_grpo.sh

# 3. 训练模型
bash shells/finetune_mistral_7b_sft500.sh
bash shells/dpo_mistral_7b.sh
bash shells/grpo_mistral_7b_sft500.sh

# 4. 评估模型
bash shells/evaluate_llm_all_batch.sh

# 5. 分析和可视化结果
bash shells/parse_planning_results_all.sh
bash shells/visualize_planning_results_all.sh
```

## 7. 重要路径说明

### 数据路径
- SFT数据: `/jfan5/sft_data/`
- DPO数据: `/home/ubuntu/Safety-gen/data/dpo/new_four/`
- GRPO数据: `/jfan5/ppo_data/`
- PDDL3问题: `pddl3/<scenario>/`

### 模型路径
- SFT模型: `/jfan5/sft_models/`
- DPO模型: `/jfan5/dpo_models/`
- GRPO模型: `/jfan5/grpo_models/`

### 结果路径
- 规划结果: `planning_results/`
- 评估结果: `evaluation_summary_*.json`

## 8. 注意事项

1. **环境设置**: 大多数脚本需要激活 `llmstl` conda环境
2. **GPU配置**: 训练脚本需要设置 `CUDA_VISIBLE_DEVICES`
3. **路径检查**: 确保所有路径存在且可访问
4. **数据验证**: 在训练前验证数据集完整性
5. **结果备份**: 定期备份重要的模型和结果文件
