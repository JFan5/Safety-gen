# GRPO V2 Training Scripts - Usage Guide

本目录包含用于训练 Mistral-7B 模型的 GRPO V2 脚本（支持课程学习和domain均衡）。

## 📁 文件清单

### 训练脚本

1. **`grpo_mistral_7b_stl_v2.sh`** ⭐ (主要脚本)
   - 完整的 GRPO V2 训练
   - 支持课程学习
   - 保证batch级domain均衡
   - 1000 steps (可配置)

2. **`test_grpo_v2.sh`** (快速测试)
   - 仅运行 50 steps
   - 用于验证配置正确性
   - 自动清理测试输出
   - 建议先运行此脚本

3. **`grpo_mistral_7b_symbolized_stl.sh`** (V1版本，保留供参考)
   - 原始 V1 脚本
   - 无课程学习
   - 无domain均衡保证

## 🚀 快速开始

### 步骤 1: 快速测试（推荐）

先运行快速测试验证环境和配置：

```bash
# 在 Safety-gen 目录下运行
cd /home/ubuntu/Safety-gen

# 执行快速测试（~5-10分钟）
bash shells/mistral_symbolized_training/test_grpo_v2.sh
```

**期望输出**：
```
========================================
GRPO V2 Quick Test (50 steps)
========================================
Step 1/2: Testing difficulty parsing...
  Domain: blocksworld
    Samples: 500, Mean difficulty: 27.3
    Buckets: easy=41%, medium=59%, hard=0%
  ...

Step 2/2: Running quick training (50 steps)...
  Step 0/50: curriculum weights = {'easy': 0.7, 'medium': 0.25, 'hard': 0.05}
  ...
  Step 50/50: ...

✓ Quick test PASSED!
```

### 步骤 2: 完整训练

测试通过后，运行完整训练：

```bash
# 方式 1: 直接运行（前台）
bash shells/mistral_symbolized_training/grpo_mistral_7b_stl_v2.sh

# 方式 2: 后台运行（推荐）
nohup bash shells/mistral_symbolized_training/grpo_mistral_7b_stl_v2.sh > grpo_v2_train.log 2>&1 &

# 方式 3: SLURM (如果在集群上)
sbatch shells/mistral_symbolized_training/grpo_mistral_7b_stl_v2.sh
```

## 📊 监控训练

### 实时日志

```bash
# 查看训练日志
tail -f grpo_v2_train.log

# 查看最近的curriculum权重
grep "curriculum weights" grpo_v2_train.log | tail -5
```

### W&B Dashboard

训练会自动上传到 Weights & Biases：

- **项目**: `pddl-grpo-v2`
- **Run名称**: `grpo_mistral_7b-curriculum_v2-{DATE}-stl`
- **URL**: 训练开始后会打印在日志中

关键指标：
- `train/reward_mean`: 平均reward（期望上升）
- `train/kl`: KL散度（不应过大）
- `curriculum/*`: 课程学习权重变化

### 检查点

模型会定期保存到：
```
/jfan5/grpo_models/mistral_7b-curriculum_v2-{DATE}-stl-1000/
├── checkpoint-100/
├── checkpoint-200/
├── ...
└── final_model/
```

## ⚙️ 配置参数

### 关键参数（可修改）

编辑 `grpo_mistral_7b_stl_v2.sh` 中的以下变量：

```bash
# 数据与模型
BASE_MODEL="/jfan5/sft_models/mistral_7b/symbolized_v2"  # 基础模型路径
DATA_ROOT="/jfan5/grpo_data/five_domain_0109"            # 数据目录

# 训练参数
BATCH_SIZE=8                      # 必须能被4整除！
GRADIENT_ACCUMULATION_STEPS=4     # 有效batch = 8 * 4 = 32
LEARNING_RATE=1e-5                # 学习率
MAX_STEPS=1000                    # 训练步数
NUM_GENERATIONS=8                 # 每个prompt生成8个回答

# 生成参数
TEMPERATURE=0.6                   # 较低温度 = 更确定性
TOP_P=0.9                         # Nucleus sampling
BETA=0.01                         # KL惩罚系数（越大越保守）

# 保存与日志
SAVE_STEPS=100                    # 每100步保存一次
LOGGING_STEPS=20                  # 每20步记录一次
```

### 调参建议

**如果loss过大**：
```bash
BETA=0.005        # 降低KL惩罚
LEARNING_RATE=5e-6  # 降低学习率
```

**如果显存不足**：
```bash
BATCH_SIZE=4                      # 减小batch
GRADIENT_ACCUMULATION_STEPS=8     # 增加accumulation
NUM_GENERATIONS=4                 # 减少生成数量
```

**如果想更快收敛**：
```bash
LEARNING_RATE=2e-5     # 提高学习率（谨慎）
TEMPERATURE=0.7        # 增加探索性
```

## 📈 V2 vs V1 对比

| 特性 | V1 | V2 |
|------|----|----|
| **数据源** | 单个JSONL | 多domain目录 |
| **难度感知** | ❌ | ✅ 基于文件名解析 |
| **课程学习** | ❌ | ✅ 3阶段动态调整 |
| **Domain均衡** | ❌ 随机 | ✅ 严格保证 |
| **训练速度** | 基准 | ~5%慢（动态采样） |
| **收敛速度** | 基准 | 预期快20-30% |

## 🔍 验证训练质量

### 检查Curriculum进展

```bash
# 查看curriculum权重变化
grep "curriculum weights" grpo_v2_train.log

# 期望输出（随步数增加，hard比例增加）：
# Step 0/1000: {'easy': 0.7, 'medium': 0.25, 'hard': 0.05}
# Step 300/1000: {'easy': 0.4, 'medium': 0.4, 'hard': 0.2}
# Step 700/1000: {'easy': 0.2, 'medium': 0.4, 'hard': 0.4}
```

### 检查Domain均衡

在训练脚本中添加调试（可选）：

```python
# 在 grpo_reward_func 中添加
if trainer_state and trainer_state.global_step % 20 == 0:
    domain_counts = {}
    for m in meta:
        if isinstance(m, dict):
            domain = m.get('scenario', 'unknown')
            domain_counts[domain] = domain_counts.get(domain, 0) + 1
    logger.info(f"Batch domains: {domain_counts}")
```

期望每20步看到：
```
Batch domains: {'blocksworld': 2, 'ferry': 2, 'grippers': 2, 'spanner': 2}
```

## 🐛 故障排除

### 问题1: "batch_size must be divisible by num_domains"

**原因**: batch_size 不能被4整除

**解决**:
```bash
# 修改为4的倍数
BATCH_SIZE=8   # ✓
BATCH_SIZE=12  # ✓
BATCH_SIZE=10  # ✗
```

### 问题2: "Data root does not exist"

**原因**: DATA_ROOT路径不存在

**解决**:
```bash
# 检查路径
ls -la /jfan5/grpo_data/five_domain_0109/

# 应该看到：
# blocksworld.jsonl
# ferry.jsonl
# grippers.jsonl
# spanner.jsonl
```

### 问题3: CUDA out of memory

**解决**:
```bash
# 减小batch size
BATCH_SIZE=4
GRADIENT_ACCUMULATION_STEPS=8

# 或减少生成数量
NUM_GENERATIONS=4
```

### 问题4: Loss过大或不下降

**解决**:
```bash
# 降低beta（KL惩罚）
BETA=0.005

# 降低学习率
LEARNING_RATE=5e-6

# 检查reward是否正常
grep "reward_mean" grpo_v2_train.log
```

## 📝 训练后评估

训练完成后，使用标准评估脚本：

```bash
# 评估最终模型
python script/evaluate_llm_solver.py \
  --model_path /jfan5/grpo_models/mistral_7b-curriculum_v2-{DATE}-stl-1000 \
  --scenario blocksworld \
  --num_samples 50

# 对比V1和V2
python script/compare_models.py \
  --model1 /jfan5/grpo_models/mistral_7b-symbolized-{DATE}-stl-1000  # V1 \
  --model2 /jfan5/grpo_models/mistral_7b-curriculum_v2-{DATE}-stl-1000  # V2 \
  --scenarios blocksworld ferry grippers spanner
```

## 📚 相关文档

- **完整技术文档**: `script/GRPO_V2_README.md`
- **快速指南**: `script/V2_QUICKSTART.md`
- **实现总结**: `script/V2_SUMMARY.md`
- **测试工具**: `script/test_difficulty_parsing.py`

## 💡 最佳实践

1. **总是先运行快速测试** (`test_grpo_v2.sh`)
2. **监控W&B** 确保curriculum和domain balance正常
3. **定期检查checkpoint** 避免训练中途失败丢失进度
4. **保存日志** 用于后续分析和调试
5. **对比V1** 验证V2改进效果

## 🎯 预期结果

基于课程学习和domain均衡，V2相比V1应该有：

- ✅ **更快收敛**: 20-30%步数减少达到相同性能
- ✅ **更好泛化**: Cross-domain性能提升
- ✅ **更稳定训练**: Loss波动更小
- ✅ **更均衡学习**: 各domain性能更平衡

---

**创建时间**: 2026-01-09
**版本**: V2.0
**维护者**: Safety-gen Team
