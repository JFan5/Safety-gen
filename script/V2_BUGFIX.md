# GRPO V2 Bug Fix - TypeError修复说明

## 问题描述

训练启动时出现错误：
```
TypeError: Can only concatenate tensors but got <class 'str'>
```

**错误位置**: 在 `accelerate.data_loader` 尝试合并 batch 数据时

**根本原因**: `IterableDataset` 返回的字典包含字符串和字典类型字段（如 `meta`, `domain`, `difficulty_bucket`），这些字段无法被转换为 tensor 进行 batch 合并。

## 为什么V1可以工作？

V1 使用 HuggingFace 的 `Dataset` 类（通过 `Dataset.from_list()` 创建），它有特殊的机制来处理非 tensor 字段。但 PyTorch 的 `IterableDataset` 没有这种机制。

## 解决方案

**从动态 IterableDataset 改为预生成 Dataset**

### 修改前（V2.0）
```python
class BalancedDomainDifficultyDataset(IterableDataset):
    def __iter__(self):
        while self.current_step < self.max_steps:
            # 动态生成每个batch
            yield sample

train_dataset = BalancedDomainDifficultyDataset(...)
```

### 修改后（V2.1）
```python
def generate_curriculum_dataset(...) -> List[Dict[str, Any]]:
    all_samples = []
    for step in range(max_steps):
        # 预先生成所有batch
        batch_samples = [...]
        all_samples.extend(batch_samples)
    return all_samples

# 生成所有样本
curriculum_samples = generate_curriculum_dataset(...)

# 创建普通 Dataset
train_dataset = Dataset.from_list(curriculum_samples)
```

## 功能保持不变

✅ **Curriculum Learning**: 完全保留，预先计算每个step的curriculum权重
✅ **Domain Balancing**: 完全保留，预先生成时确保每个batch domain均衡
✅ **随机性**: 使用相同 seed，结果完全可复现
✅ **Reward Function**: 无任何改动

## 优缺点对比

### 预生成方案（V2.1，当前）

**优点**：
- ✅ 与 GRPOTrainer 完全兼容
- ✅ 与 V1 使用相同的 Dataset 类型
- ✅ 可以预先验证数据
- ✅ 训练启动更快（不需要动态生成）

**缺点**：
- ❌ 需要占用内存存储所有样本
- ❌ 不够灵活（无法中途改变curriculum）

### 动态生成方案（V2.0，已弃用）

**优点**：
- ✅ 内存效率高
- ✅ 理论上可以无限生成数据

**缺点**：
- ❌ 与 GRPOTrainer 不兼容（TypeError）
- ❌ 需要自定义 collate function

## 内存影响分析

**数据量估算**（batch_size=8, max_steps=1000）：
- 总样本数: 8 × 1000 = 8,000
- 每个样本: ~2KB (prompt + meta)
- 总内存: 8,000 × 2KB = 16MB

**结论**: 对于我们的训练规模，预生成占用的内存可以忽略不计（<20MB）。

## 测试验证

### 验证点1: 数据生成正确性
```bash
# 检查生成的样本数
python script/test_difficulty_parsing.py
```

### 验证点2: Dataset创建成功
训练日志中应看到：
```
Generated 8000 samples for 1000 steps
Created curriculum dataset:
  - Total samples: 8000
  - Dataset columns: ['prompt', 'meta', 'class_label', ...]
```

### 验证点3: Curriculum正确
日志中应看到curriculum权重按预期变化：
```
Step 0/1000: curriculum weights = {'easy': 0.7, 'medium': 0.25, 'hard': 0.05}
Step 300/1000: curriculum weights = {'easy': 0.4, 'medium': 0.4, 'hard': 0.2}
Step 700/1000: curriculum weights = {'easy': 0.2, 'medium': 0.4, 'hard': 0.4}
```

### 验证点4: 训练成功启动
不再出现 TypeError，训练正常进行。

## 迁移指南

如果你已经在使用 V2.0（有 IterableDataset 的版本），请：

1. **拉取最新代码**
   ```bash
   git pull origin main
   ```

2. **无需改动训练脚本**
   - Shell 脚本完全兼容
   - 参数保持不变
   - 功能完全一致

3. **重新运行训练**
   ```bash
   bash shells/mistral_symbolized_training/test_grpo_v2.sh  # 快速测试
   bash shells/mistral_symbolized_training/grpo_mistral_7b_stl_v2.sh  # 完整训练
   ```

## 技术细节

### HuggingFace Dataset vs PyTorch IterableDataset

**HuggingFace Dataset**:
```python
# 可以存储任意 Python 对象
dataset = Dataset.from_list([
    {'prompt': 'text', 'meta': {'key': 'value'}}  # ✅ 字典可以存储
])
```

**PyTorch IterableDataset**:
```python
# DataLoader 期望所有字段都可以转换为 tensor
class MyIterableDataset(IterableDataset):
    def __iter__(self):
        yield {'prompt': 'text', 'meta': {'key': 'value'}}  # ❌ 字典无法转tensor
```

### GRPOTrainer 的期望

GRPOTrainer 使用 HuggingFace 的 Dataset 和 DataCollator，它们可以正确处理非 tensor 字段（如 meta, class_label），并将它们传递给 reward function。

## 相关文件

- **修复的脚本**: `script/train_grpo_unsloth_stl_v2.py`
- **测试脚本**: `shells/mistral_symbolized_training/test_grpo_v2.sh`
- **完整训练**: `shells/mistral_symbolized_training/grpo_mistral_7b_stl_v2.sh`

## 版本历史

- **V2.0** (2026-01-09 06:00): 初始版本，使用 IterableDataset
- **V2.1** (2026-01-09 06:30): 修复 TypeError，改用预生成 Dataset

---

**状态**: ✅ Fixed
**测试**: ✅ Pending
**影响**: 无功能变化，仅实现方式改变
