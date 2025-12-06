# 增强训练指南：使用 Prompt 变体进行数据增强

## 🎯 概述

通过为每个 problem 生成 5 个不同的 prompt 变体，将训练数据从 **2000 条扩展到 10000 条**（5x 增强）。

## 📊 数据增强策略

### 原始数据
- **Problems**: 2000 个（4 个场景 × 500）
- **训练样本**: 2000 条

### 增强后数据
- **Problems**: 2000 个（相同）
- **Prompt 变体**: 每个 problem 5 个不同的 prompt
- **训练样本**: 10000 条（2000 × 5）

### Prompt 变体示例

同一个 problem，5 个不同的 prompt 模板：

**变体 1:**
```
You are a planning expert. Produce a **valid plan** for the domain and problem below.

DOMAIN:
(define (domain blocksworld) ...)

PROBLEM:
(define (problem BW-rand-3) ...)

### Output Rules
- Output **only** plan steps, one per line.
...
```

**变体 2:**
```
Act as a planner. Generate a **valid plan** that solves the given problem in the given domain.

[DOMAIN]
(define (domain blocksworld) ...)

[PROBLEM]
(define (problem BW-rand-3) ...)

== REQUIRED OUTPUT ==
- Return plan steps **only**, one per line.
...
```

**变体 3-5:** 其他不同的表述方式...

## 🚀 使用步骤

### 步骤 1: 转换为增强的 HuggingFace 格式

```bash
python convert_randomized_to_hf_augmented.py \
  --input data_randomized/mixed_dataset.json \
  --output /jfan5/sft_data/four_scenarios500_randomized_augmented/combined.hf \
  --num-variants 5 \
  --val-ratio 0.1 \
  --seed 42
```

**参数说明：**
- `--num-variants 5`: 每个 problem 生成 5 个变体
- `--val-ratio 0.1`: 10% 验证集
- 默认使用顺序模板 1-5

**输出：**
```
原始数据: 2000 problems
增强后数据: 10000 条训练样本
  - 训练集: ~9000 条
  - 验证集: ~1000 条
```

### 步骤 2: 启动训练

```bash
sbatch shells/finetune_mistral_7b_randomized_augmented.sh
```

### 步骤 3: 监控训练

```bash
tail -f job_outputs/finetune_mistral_7b_randomized_augmented.o
```

## 📋 高级选项

### 选项 1: 使用所有 10 个模板

```bash
python convert_randomized_to_hf_augmented.py \
  --input data_randomized/mixed_dataset.json \
  --output /jfan5/sft_data/four_scenarios500_randomized_augmented_10x/combined.hf \
  --num-variants 10 \
  --val-ratio 0.1
```

结果：**20000 条训练样本**（2000 × 10）

### 选项 2: 随机选择模板

```bash
python convert_randomized_to_hf_augmented.py \
  --input data_randomized/mixed_dataset.json \
  --output /jfan5/sft_data/four_scenarios500_randomized_augmented/combined.hf \
  --num-variants 5 \
  --random-variants
```

每个 problem 随机选择 5 个不同的模板（从 10 个中选）

### 选项 3: 只使用特定场景

```bash
# 只增强 blocksworld
python convert_randomized_to_hf_augmented.py \
  --input data_randomized/blocksworld_dataset.json \
  --output /jfan5/sft_data/blocksworld_randomized_augmented/combined.hf \
  --num-variants 5
```

结果：**2500 条训练样本**（500 × 5）

## 🔍 验证转换结果

```python
from datasets import load_from_disk

# 加载增强数据集
dataset = load_from_disk('/jfan5/sft_data/four_scenarios500_randomized_augmented/combined.hf')

print(f"训练集: {len(dataset['train'])} 条")
print(f"验证集: {len(dataset['validation'])} 条")

# 查看同一 problem 的不同变体
train_data = dataset['train']
problem_ids = train_data['problem_id']

# 找到第一个 problem 的所有变体
base_id = problem_ids[0].rsplit('_v', 1)[0]
variants = [i for i, pid in enumerate(problem_ids) if pid.startswith(base_id)]

print(f"\nProblem {base_id} 的变体数量: {len(variants)}")
for idx in variants[:3]:  # 显示前 3 个
    print(f"\n变体 {train_data[idx]['variant_id']}:")
    print(train_data[idx]['text'][:200] + "...")
```

## 📈 数据集统计

### 增强前后对比

| 特性 | 原始 | 增强 (5x) | 增强 (10x) |
|------|------|-----------|------------|
| Problems | 2000 | 2000 | 2000 |
| 训练样本 | 2000 | 10000 | 20000 |
| Prompt 变体 | 1 | 5 | 10 |
| 训练 steps (3 epochs) | ~750 | ~3750 | ~7500 |

### 各场景分布（5x 增强）

| Domain | 原始 Problems | 增强后样本 |
|--------|--------------|-----------|
| blocksworld | 500 | 2500 |
| ferry | 500 | 2500 |
| spanner | 500 | 2500 |
| grippers | 500 | 2500 |
| **总计** | **2000** | **10000** |

## 💡 增强的优势

### 1. 更多训练数据
- 从 2000 条增加到 10000 条
- 更充分的训练，减少过拟合

### 2. Prompt 多样性
- 学习不同的表述方式
- 提高模型对不同 prompt 格式的鲁棒性

### 3. 更好的泛化能力
- 结合随机化符号名称
- 结合多样化 prompt
- 双重泛化能力提升

### 4. 防止记忆特定模板
- 避免过拟合到单一 prompt 格式
- 提高实际应用的适应性

## 🎓 训练参数建议

### 标准配置（10000 条数据）

```bash
# 在 finetune_mistral_7b_randomized_augmented.sh 中
NUM_EPOCHS=3
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=2
LEARNING_RATE=2e-4
```

- **有效 batch size**: 8
- **总训练 steps**: ~3750（10000 / 8 × 3）
- **预计训练时间**: 取决于 GPU（通常 2-4 小时）

### 大规模配置（20000 条数据，10x 增强）

```bash
NUM_EPOCHS=2  # 减少 epochs，因为数据量增加
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=2
LEARNING_RATE=2e-4
```

- **总训练 steps**: ~5000（20000 / 8 × 2）

## 🔧 常见问题

### Q1: 训练/验证集如何分割？

默认按 **problem 分组**：
- 同一 problem 的所有 5 个变体都在训练集或验证集中
- 避免数据泄露

如果想随机分割（不推荐）：
```bash
python convert_randomized_to_hf_augmented.py \
  --input data_randomized/mixed_dataset.json \
  --output /jfan5/sft_data/four_scenarios500_randomized_augmented/combined.hf \
  --num-variants 5 \
  --no-group-by-problem
```

### Q2: 如何选择变体数量？

- **5 个变体**: 平衡数据量和多样性，推荐
- **3 个变体**: 较少数据增强，适合快速实验
- **10 个变体**: 最大多样性，但训练时间长

### Q3: 顺序模板 vs 随机模板？

**顺序模板（默认）**：
- 确定性，可重现
- 每个 problem 使用模板 1-5

**随机模板**：
- 更多随机性
- 每个 problem 随机选择 5 个不同模板

推荐使用顺序模板以保证可重现性。

### Q4: 内存不足怎么办？

分批处理：
```python
import json

# 只使用前 1000 个 problems
data = json.load(open('data_randomized/mixed_dataset.json'))
subset = data[:1000]
json.dump(subset, open('data_randomized/mixed_dataset_subset.json', 'w'))

# 然后转换
python convert_randomized_to_hf_augmented.py \
  --input data_randomized/mixed_dataset_subset.json \
  --output /jfan5/sft_data/subset_augmented/combined.hf \
  --num-variants 5
```

## 📊 完整工作流程

```bash
# 步骤 1: 生成随机化数据集（已完成）
python randomize_pddl.py \
  --output_root data_randomized \
  --domains blocksworld ferry spanner grippers \
  --seed 42

# 步骤 2: 验证随机化
python verify_randomization.py

# 步骤 3: 转换为增强的 HF 格式（5x 增强）
python convert_randomized_to_hf_augmented.py \
  --input data_randomized/mixed_dataset.json \
  --output /jfan5/sft_data/four_scenarios500_randomized_augmented/combined.hf \
  --num-variants 5

# 步骤 4: 提交训练
sbatch shells/finetune_mistral_7b_randomized_augmented.sh

# 步骤 5: 监控训练
tail -f job_outputs/finetune_mistral_7b_randomized_augmented.o
```

## 📚 相关文件

- `convert_randomized_to_hf_augmented.py` - 增强转换脚本
- `shells/finetune_mistral_7b_randomized_augmented.sh` - 增强训练脚本
- `script/prompt_variants.py` - Prompt 模板定义
- `README_RANDOMIZATION.md` - 随机化文档
- `TRAINING_RANDOMIZED.md` - 基础训练指南

## ✅ 检查清单

- [ ] 已生成随机化数据集
- [ ] 已验证随机化结果
- [ ] 已转换为增强的 HF 格式
- [ ] 已检查增强后的数据集
- [ ] 已提交训练任务
- [ ] 已监控训练进度

---

**现在你有了一个 10000 条样本的增强训练集！** 🎉

相比原始 2000 条，这将显著提升模型的训练效果和泛化能力。
