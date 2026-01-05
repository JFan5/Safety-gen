# 随机化 + 增强训练完整指南

## 📋 项目概述

本项目实现了两层数据增强策略：
1. **符号随机化**: 将 PDDL 符号（predicates/actions/objects）随机重命名
2. **Prompt 增强**: 为每个 problem 生成多个不同的 prompt 变体

结果：**从 2000 个 problems 生成 10000 条训练样本**

## 🎯 完整工作流程

### 阶段 1: 符号随机化

#### 1.1 生成随机化数据集

```bash
python randomize_pddl.py \
  --output_root data_randomized \
  --domains blocksworld ferry spanner grippers \
  --seed 42
```

**输出：**
- `data_randomized/mixed_dataset.json` (2000 个 problems)
- 各场景独立数据集
- 映射表 (`mapping.json`)

#### 1.2 验证随机化

```bash
python verify_randomization.py
```

**期望结果：**
```
✅ 所有 predicates 已正确替换
✅ 所有 actions 已正确替换
✅ 所有 objects 已正确替换
```

### 阶段 2: Prompt 增强

#### 2.1 转换为增强的 HF 格式

```bash
python convert_randomized_to_hf_augmented.py \
  --input data_randomized/mixed_dataset.json \
  --output /jfan5/sft_data/four_scenarios500_randomized_augmented/combined.hf \
  --num-variants 5 \
  --val-ratio 0.1 \
  --seed 42
```

**输出：**
- 训练集: ~9000 条（1800 problems × 5 variants）
- 验证集: ~1000 条（200 problems × 5 variants）

#### 2.2 启动训练

```bash
sbatch shells/finetune_mistral_7b_randomized_augmented.sh
```

#### 2.3 监控训练

```bash
tail -f job_outputs/finetune_mistral_7b_randomized_augmented.o
```

## 📊 数据转换流程图

```
原始 PDDL 数据 (2000 problems)
    ↓
[符号随机化]
    ↓
随机化数据集 (2000 problems)
  - Predicates: clear → p5, on → p4
  - Actions: pickup → a3, stack → a4
  - Objects: b1 → o1, b2 → o4
    ↓
[Prompt 增强 × 5]
    ↓
增强数据集 (10000 samples)
  - Problem 1 → Variant 1, 2, 3, 4, 5
  - Problem 2 → Variant 1, 2, 3, 4, 5
  - ...
    ↓
[HF 格式 + 训练/验证分割]
    ↓
最终训练集
  - 训练: ~9000 条
  - 验证: ~1000 条
```

## 📁 生成的文件结构

### 核心脚本

```
Safety-gen/
├── randomize_pddl.py                    # 符号随机化脚本
├── verify_randomization.py              # 验证脚本
├── convert_randomized_to_hf_augmented.py # 增强转换脚本
├── example_usage.py                     # 使用示例
└── shells/
    ├── finetune_mistral_7b_randomized.sh          # 基础训练脚本
    └── finetune_mistral_7b_randomized_augmented.sh # 增强训练脚本
```

### 数据文件

```
data_randomized/
├── mixed_dataset.json              # 混合数据集 (2000)
├── blocksworld_dataset.json        # 单场景数据集 (500)
├── ferry_dataset.json              # (500)
├── spanner_dataset.json            # (500)
├── grippers_dataset.json           # (500)
└── [各场景目录]/
    ├── domain.pddl                 # 随机化后的 domain
    ├── mapping.json                # 符号映射表
    └── problems/                   # 随机化后的 problems + plans
```

### HF 训练数据

```
/jfan5/sft_data/
├── four_scenarios500_randomized/
│   └── combined.hf                 # 基础版本 (2000 条)
└── four_scenarios500_randomized_augmented/
    └── combined.hf                 # 增强版本 (10000 条)
        ├── train/                  # 训练集 (~9000)
        └── validation/             # 验证集 (~1000)
```

### 文档

```
Safety-gen/
├── README_RANDOMIZATION.md          # 随机化详细文档
├── QUICKSTART.md                    # 快速开始
├── TRAINING_RANDOMIZED.md           # 基础训练指南
├── AUGMENTED_TRAINING_GUIDE.md      # 增强训练指南
└── FINAL_SUMMARY.md                 # 本文档
```

## 🔍 数据统计

### 符号随机化映射

| 原始符号 | 随机化符号 | 类型 |
|---------|-----------|------|
| clear | p5 | predicate |
| on-table | p2 | predicate |
| arm-empty | p3 | predicate |
| holding | p1 | predicate |
| on | p4 | predicate |
| pickup | a3 | action |
| putdown | a2 | action |
| stack | a4 | action |
| unstack | a1 | action |
| b1, b2, ... | o1, o4, ... | objects |

### 数据量统计

| 阶段 | Problems | 样本数 | 增强倍数 |
|------|---------|--------|---------|
| 原始 | 2000 | 2000 | 1x |
| 随机化 | 2000 | 2000 | 1x |
| Prompt 增强 (5x) | 2000 | 10000 | 5x |
| Prompt 增强 (10x) | 2000 | 20000 | 10x |

### 各场景分布（5x 增强）

| Domain | Problems | 增强后样本 |
|--------|----------|-----------|
| blocksworld | 500 | 2500 |
| ferry | 500 | 2500 |
| spanner | 500 | 2500 |
| grippers | 500 | 2500 |
| **总计** | **2000** | **10000** |

## 💡 增强优势

### 1. 符号随机化的优势

✅ **测试泛化能力**: 模型必须学习规划逻辑，而不是记忆符号名称
✅ **减少过拟合**: 避免对特定符号名称的依赖
✅ **提高鲁棒性**: 对不同命名约定的适应性

### 2. Prompt 增强的优势

✅ **更多训练数据**: 从 2000 → 10000 条
✅ **Prompt 多样性**: 学习不同的表述方式
✅ **防止模板记忆**: 避免过拟合到单一 prompt 格式
✅ **提高实用性**: 更好地处理各种用户输入

### 3. 双重增强的优势

✅ **双重泛化**: 符号 + Prompt 两个维度的泛化
✅ **更强的鲁棒性**: 对符号和表述都不敏感
✅ **更好的实际表现**: 适应真实世界的多样性

## 🎓 训练配置对比

### 配置 1: 原始数据（基线）

```bash
# 2000 条样本，单一 prompt
Dataset: /jfan5/sft_data/four_scenarios500/combined.hf
Samples: 2000
Epochs: 3
Training steps: ~750
```

### 配置 2: 随机化数据

```bash
# 2000 条样本，单一 prompt，随机化符号
Dataset: /jfan5/sft_data/four_scenarios500_randomized/combined.hf
Samples: 2000
Epochs: 3
Training steps: ~750
```

### 配置 3: 随机化 + 增强（推荐）

```bash
# 10000 条样本，5 个 prompt 变体，随机化符号
Dataset: /jfan5/sft_data/four_scenarios500_randomized_augmented/combined.hf
Samples: 10000
Epochs: 3
Training steps: ~3750
```

### 配置 4: 随机化 + 最大增强

```bash
# 20000 条样本，10 个 prompt 变体，随机化符号
Dataset: /jfan5/sft_data/four_scenarios500_randomized_augmented_10x/combined.hf
Samples: 20000
Epochs: 2
Training steps: ~5000
```

## 🚀 推荐使用流程

### 快速开始（配置 3）

```bash
# 1. 生成随机化数据（已完成）
python randomize_pddl.py \
  --output_root data_randomized \
  --domains blocksworld ferry spanner grippers \
  --seed 42

# 2. 转换为增强格式
python convert_randomized_to_hf_augmented.py \
  --input data_randomized/mixed_dataset.json \
  --output /jfan5/sft_data/four_scenarios500_randomized_augmented/combined.hf \
  --num-variants 5

# 3. 启动训练
sbatch shells/finetune_mistral_7b_randomized_augmented.sh

# 4. 监控
tail -f job_outputs/finetune_mistral_7b_randomized_augmented.o
```

### 验证和测试

```bash
# 验证随机化
python verify_randomization.py

# 查看使用示例
python example_usage.py

# 快速测试（小数据集）
bash test_augmented_conversion.sh
```

## 📚 命令参考

### randomize_pddl.py

```bash
python randomize_pddl.py \
  --input_root pddl3 \
  --output_root data_randomized \
  --domains blocksworld ferry spanner grippers \
  --seed 42
```

### convert_randomized_to_hf_augmented.py

```bash
python convert_randomized_to_hf_augmented.py \
  --input data_randomized/mixed_dataset.json \
  --output /path/to/output.hf \
  --num-variants 5 \              # 变体数量（1-10）
  --val-ratio 0.1 \               # 验证集比例
  --seed 42 \                     # 随机种子
  --pddl-version PDDL3 \          # PDDL 版本
  --random-variants               # 可选：随机选择模板
```

### 训练脚本

```bash
# 基础版本（2000 条）
sbatch shells/finetune_mistral_7b_randomized.sh

# 增强版本（10000 条）
sbatch shells/finetune_mistral_7b_randomized_augmented.sh
```

## 🔧 常见问题

### Q: 如何选择增强倍数？

- **5x**: 平衡数据量和训练时间，**推荐**
- **3x**: 快速实验
- **10x**: 最大多样性，训练时间长

### Q: 训练需要多长时间？

| 配置 | 样本数 | 预计时间（单 GPU） |
|------|--------|------------------|
| 基础 | 2000 | ~30-45 分钟 |
| 5x 增强 | 10000 | ~2-3 小时 |
| 10x 增强 | 20000 | ~4-6 小时 |

### Q: 如何验证模型效果？

```python
# 使用验证集评估
from datasets import load_from_disk

dataset = load_from_disk('/path/to/dataset.hf')
val_data = dataset['validation']

# 检查模型在不同 prompt 变体上的表现
# （确保模型对不同表述方式都有好的性能）
```

### Q: 内存不足怎么办？

1. 减少 batch size
2. 减少增强倍数（5x → 3x）
3. 使用梯度累积
4. 分场景训练

## ✅ 最终检查清单

- [ ] 生成随机化数据集
- [ ] 验证随机化结果
- [ ] 转换为增强 HF 格式
- [ ] 检查数据集统计
- [ ] 配置训练参数
- [ ] 提交训练任务
- [ ] 监控训练进度
- [ ] 评估模型性能

## 📖 相关文档索引

| 文档 | 用途 |
|------|------|
| `README_RANDOMIZATION.md` | 随机化详细文档 |
| `QUICKSTART.md` | 快速开始指南 |
| `TRAINING_RANDOMIZED.md` | 基础训练指南 |
| `AUGMENTED_TRAINING_GUIDE.md` | 增强训练详细指南 |
| `FINAL_SUMMARY.md` | 完整工作流程总结（本文档）|

---

**🎉 现在你已经准备好使用增强的随机化数据集进行训练了！**

**预期效果：**
- 更好的泛化能力
- 更强的鲁棒性
- 更高的实际应用价值
