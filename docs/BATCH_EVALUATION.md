# 批处理评估脚本使用指南

## 📋 概述

`evaluate_llm_solver_batch.py` 是原始评估脚本的优化版本，通过**批处理**和**多线程验证**显著提升性能。

## 🚀 主要改进

### 1. **批量生成** (Batch Generation)
- 一次性处理多个问题，而不是逐个处理
- 充分利用 GPU 内存和并行计算能力
- 默认批次大小：4（可调整）

### 2. **并行验证** (Parallel Validation)
- 使用多线程并行运行 VAL 验证器
- VAL 是 CPU 密集型任务，多线程可显著加速
- 默认线程数：4（可调整）

### 3. **进度显示**
- 使用 tqdm 显示实时进度条
- 更好的用户体验

## 📊 性能提升

预期性能提升（相比原始脚本）：
- **生成阶段**: 2-4倍加速（取决于 batch size 和 GPU）
- **验证阶段**: 2-4倍加速（取决于 num_workers）
- **总体**: 2-5倍加速

## 🔧 使用方法

### 基本用法

```bash
python3 script/evaluate_llm_solver_batch.py \
  --model /path/to/model \
  --problems-dir /path/to/problems \
  --domain-file /path/to/domain.pddl \
  --output results.json
```

### 高级参数

```bash
python3 script/evaluate_llm_solver_batch.py \
  --model /jfan5/sft_models/mistral_7b/four_scenarios500_randomized \
  --problems-dir /path/to/problems \
  --domain-file /path/to/domain.pddl \
  --output results.json \
  --batch-size 8 \           # 批次大小（根据 GPU 内存调整）
  --num-workers 8 \          # 验证线程数（根据 CPU 核心数调整）
  --temperature 0.6 \        # 生成温度
  --max-problems 100 \       # 限制问题数量
  --one-shot                 # 使用 one-shot 模式
```

## ⚙️ 参数说明

### 关键参数

| 参数 | 默认值 | 说明 |
|------|--------|------|
| `--batch-size` | 4 | 批量生成的大小。**增大可提升速度但需要更多 GPU 内存** |
| `--num-workers` | 4 | 并行验证的线程数。**建议设置为 CPU 核心数的一半** |
| `--temperature` | 0.6 | 生成温度，控制随机性 |
| `--max-problems` | 0 | 限制评估的问题数量（0 = 全部） |
| `--one-shot` | False | 是否使用 one-shot 示例 |
| `--load-in-4bit` | True | 使用 4-bit 量化加载模型 |

### 如何选择 batch-size？

根据 GPU 内存选择：

| GPU 内存 | 推荐 batch-size |
|----------|----------------|
| 16 GB | 2-4 |
| 24 GB | 4-8 |
| 40 GB | 8-16 |
| 80 GB (H100) | 16-32 |

**提示**: 从小的 batch-size 开始，逐步增大直到出现 OOM 错误，然后减小一点。

### 如何选择 num-workers？

```bash
# 查看 CPU 核心数
nproc

# 推荐设置为核心数的 50-100%
# 例如 16 核 CPU，设置 8-16
```

## 📝 使用示例

### 示例 1: 快速测试（小批次）

```bash
python3 script/evaluate_llm_solver_batch.py \
  --model /jfan5/sft_models/mistral_7b/four_scenarios500_randomized \
  --problems-dir data/blocksworld/problems \
  --domain-file data/blocksworld/domain.pddl \
  --batch-size 2 \
  --num-workers 4 \
  --max-problems 10
```

### 示例 2: 最大性能（充分利用 GPU）

```bash
python3 script/evaluate_llm_solver_batch.py \
  --model /jfan5/sft_models/mistral_7b/four_scenarios500_randomized \
  --problems-dir data/blocksworld/problems \
  --domain-file data/blocksworld/domain.pddl \
  --batch-size 16 \
  --num-workers 16 \
  --temperature 0.6
```

### 示例 3: One-shot 模式

```bash
python3 script/evaluate_llm_solver_batch.py \
  --model /jfan5/sft_models/mistral_7b/four_scenarios500_randomized \
  --problems-dir data/blocksworld/problems \
  --domain-file data/blocksworld/domain.pddl \
  --batch-size 8 \
  --num-workers 8 \
  --one-shot
```

## 🔍 监控和调试

### 查看 GPU 使用情况

```bash
# 在另一个终端运行
watch -n 1 nvidia-smi
```

### 如果遇到 CUDA OOM 错误

1. **减小 batch-size**：
   ```bash
   --batch-size 2
   ```

2. **使用 8-bit 量化**（修改脚本或添加参数）

3. **减小 max_seq_length**（在脚本中修改）

### 验证输出

输出 JSON 包含：
- `batch_size`: 使用的批次大小
- `num_workers`: 使用的验证线程数
- `success_rate`: 成功率
- `category_counts`: 各类别统计
- `results`: 详细结果列表

## 🆚 对比原始脚本

| 特性 | 原始脚本 | 批处理脚本 |
|------|---------|-----------|
| 生成方式 | 逐个 | 批量 |
| 验证方式 | 串行 | 并行 |
| GPU 利用率 | 低 (~20-30%) | 高 (~80-90%) |
| 进度显示 | 简单打印 | tqdm 进度条 |
| 速度 | 基准 | 2-5x 加速 |

## 💡 最佳实践

1. **首次运行**：使用 `--max-problems 10` 和小的 `--batch-size 2` 测试
2. **调优**：逐步增大 batch-size 直到接近 GPU 内存限制
3. **生产环境**：根据硬件选择合适的 batch-size 和 num-workers
4. **监控**：使用 `nvidia-smi` 和 `htop` 监控资源使用

## 🐛 故障排除

### 问题：CUDA Out of Memory

**解决方案**：
```bash
--batch-size 2  # 减小批次大小
```

### 问题：CPU 验证慢

**解决方案**：
```bash
--num-workers 16  # 增加验证线程数
```

### 问题：结果不一致

**说明**：由于批处理和原始脚本在处理顺序上可能不同，但最终统计结果应该一致。

## 📚 相关文件

- 原始脚本: `script/evaluate_llm_solver.py`
- 批处理脚本: `script/evaluate_llm_solver_batch.py`
- 使用示例: `shells/evaluate_llm_all.sh`

---

**推荐**: 对于大规模评估，始终使用批处理脚本以获得最佳性能！
