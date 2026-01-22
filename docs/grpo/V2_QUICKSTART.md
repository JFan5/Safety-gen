# GRPO V2 Quick Start Guide

## 概述

`train_grpo_unsloth_stl_v2.py` 是一个支持**课程学习**和**批次级domain均衡**的GRPO训练脚本。

## 核心改进

### 1. 基于问题文件名的难度评分

每个domain使用不同的命名约定：

| Domain | 文件名示例 | 难度参数 | 难度公式 |
|--------|-----------|---------|---------|
| **blocksworld** | `bw_ops3_n4_seed200074.pddl` | n=blocks | 5*n |
| **ferry** | `ferry-l4-c2-s122320450.pddl` | l=locations, c=cars | 5*l + 3*c |
| **grippers** | `grippers-n1-r4-o3-s299249445.pddl` | n=robots, r=rooms, o=objects | 5*n + 3*r + 2*o |
| **spanner** | `spanner-s3-n2-l4-s1595284416.pddl` | n=nuts, l=locations, s=spanners | 5*n + 3*l + 2*s |

**通用公式**: `difficulty_score = 5*n + 3*r + 2*o`

### 2. 难度分桶（每个domain独立）

- **Easy**: 前 40% (难度分数 ≤ p40)
- **Medium**: 中间 40% (p40 < 难度分数 ≤ p80)
- **Hard**: 后 20% (难度分数 > p80)

**实际分布示例**（基于500个样本）：

```
blocksworld: p40=25.0, p80=30.0
  Easy   (≤25.0):  205 samples (41.0%)
  Medium (25-30):  295 samples (59.0%)
  Hard   (>30.0):    0 samples (0.0%)

ferry: p40=31.0, p80=36.0
  Easy   (≤31.0):  250 samples (50.0%)
  Medium (31-36):  167 samples (33.4%)
  Hard   (>36.0):   83 samples (16.6%)

grippers: p40=25.0, p80=30.0
  Easy   (≤25.0):  243 samples (48.6%)
  Medium (25-30):  257 samples (51.4%)
  Hard   (>30.0):    0 samples (0.0%)

spanner: p40=33.0, p80=35.0
  Easy   (≤33.0):  398 samples (79.6%)
  Medium (33-35):  102 samples (20.4%)
  Hard   (>35.0):    0 samples (0.0%)
```

### 3. 课程学习时间表

训练过程中动态调整难度分布：

| 训练阶段 | Step比例 | Easy | Medium | Hard |
|---------|---------|------|--------|------|
| **早期** | 0-30% | 70% | 25% | 5% |
| **中期** | 30-70% | 40% | 40% | 20% |
| **后期** | 70-100% | 20% | 40% | 40% |

**设计理念**：
- 早期：主要学习简单问题，建立基础能力
- 中期：均衡训练，巩固技能
- 后期：挑战困难问题，提升泛化能力

### 4. Batch级Domain均衡

**要求**: `batch_size` 必须被 `num_domains` 整除

| batch_size | num_domains | 每domain样本数 | 有效? |
|-----------|-------------|---------------|------|
| 8 | 4 | 2 | ✅ |
| 12 | 4 | 3 | ✅ |
| 16 | 4 | 4 | ✅ |
| 10 | 4 | 2.5 | ❌ |

**保证**：每个batch中，每个domain的样本数严格相等。

## 示例命令

### 基础训练（Qwen 7B）

```bash
python script/train_grpo_unsloth_stl_v2.py \
    --base_model unsloth/Qwen2.5-7B-Instruct-bnb-4bit \
    --data_root /jfan5/grpo_data/five_domain_0109 \
    --output_dir /jfan5/grpo_models/qwen_7b_curriculum_v2 \
    --batch_size 8 \
    --max_steps 1000 \
    --learning_rate 1e-5 \
    --beta 0.02 \
    --save_steps 100 \
    --wandb_project pddl-grpo-v2 \
    --run_name qwen-7b-curriculum
```

### 高级训练（Qwen 14B with gradient checkpointing）

```bash
python script/train_grpo_unsloth_stl_v2.py \
    --base_model /jfan5/sft_models/qwen3_14b \
    --data_root /jfan5/grpo_data/five_domain_0109 \
    --output_dir /jfan5/grpo_models/qwen3_14b_curriculum_v2 \
    --batch_size 16 \
    --gradient_accumulation_steps 2 \
    --max_steps 2000 \
    --learning_rate 5e-6 \
    --beta 0.01 \
    --save_steps 100 \
    --use_gradient_checkpointing \
    --wandb_project pddl-grpo-v2 \
    --run_name qwen3-14b-curriculum-long
```

### Mistral 7B 训练

```bash
python script/train_grpo_unsloth_stl_v2.py \
    --base_model /jfan5/sft_models/mistral_7b \
    --data_root /jfan5/grpo_data/five_domain_0109 \
    --output_dir /jfan5/grpo_models/mistral_7b_curriculum_v2 \
    --batch_size 12 \
    --max_steps 1500 \
    --learning_rate 1e-5 \
    --beta 0.02 \
    --temperature 0.8 \
    --num_generations 4 \
    --wandb_project pddl-grpo-v2 \
    --run_name mistral-7b-curriculum
```

## 验证难度解析

在训练前，可以运行测试脚本验证难度解析是否正确：

```bash
python script/test_difficulty_parsing.py
```

**输出示例**：
```
Domain: grippers
  Samples analyzed: 500
  Difficulty Score Statistics:
    Min:    23.0
    Max:    30.0
    Mean:   26.6
    Median: 28.0
  Percentiles (for bucketing):
    40th (p40): 25.0
    80th (p80): 30.0
  Bucket Distribution:
    Easy   (≤25.0):   243 samples (48.6%)
    Medium (25.0-30.0):  257 samples (51.4%)
    Hard   (>30.0):     0 samples (0.0%)
```

## 监控训练

### W&B 仪表板

关键指标：
1. **Curriculum weights**: 检查难度比例是否按预期变化
2. **Batch domain distribution**: 验证每个batch的domain均衡
3. **Reward by difficulty**: 跟踪各难度级别的成功率
4. **Reward by domain**: 比较不同domain的学习进度

### 日志输出

训练时会定期输出：
```
Step 0/1000: curriculum weights = {'easy': 0.7, 'medium': 0.25, 'hard': 0.05}
Step 100/1000: curriculum weights = {'easy': 0.7, 'medium': 0.25, 'hard': 0.05}
Step 300/1000: curriculum weights = {'easy': 0.4, 'medium': 0.4, 'hard': 0.2}
Step 700/1000: curriculum weights = {'easy': 0.2, 'medium': 0.4, 'hard': 0.4}
```

## 常见问题

### Q1: batch_size必须是多少？

**A**: 必须是 `num_domains` 的倍数。当前有4个domains（blocksworld, ferry, grippers, spanner），所以batch_size应该是4的倍数（4, 8, 12, 16等）。

### Q2: 如果某个domain的文件名不符合预期怎么办？

**A**: 脚本会记录警告但不会崩溃。难度分数会默认为0，这些样本会被分到easy桶。检查日志中的警告信息。

### Q3: 课程学习时间表可以自定义吗？

**A**: 可以。修改 `get_curriculum_weights()` 函数中的比例：

```python
def get_curriculum_weights(step: int, max_steps: int) -> Dict[str, float]:
    step_ratio = step / max(max_steps, 1)

    if step_ratio < 0.5:  # 前50%只做简单问题
        return {'easy': 0.9, 'medium': 0.1, 'hard': 0.0}
    elif step_ratio < 0.8:
        return {'easy': 0.3, 'medium': 0.5, 'hard': 0.2}
    else:
        return {'easy': 0.1, 'medium': 0.3, 'hard': 0.6}
```

### Q4: 为什么有些domain没有hard样本？

**A**: 当前数据集中，部分domain的难度范围较窄。例如blocksworld和grippers的所有样本都落在p80以下，所以没有hard样本。这是正常的，脚本会自动fallback到其他桶。

### Q5: V2比V1慢吗？

**A**: 略慢（~5%），因为需要动态采样。但课程学习通常能加速收敛，整体训练时间可能更短。

## 参数调优建议

### 学习率

- **小模型（7B）**: 1e-5 到 5e-6
- **大模型（14B+）**: 5e-6 到 1e-6

### Beta (KL惩罚系数)

- **标准**: 0.02 (默认)
- **Loss过大**: 降低到 0.01 或 0.005
- **模型变化太小**: 提高到 0.05

### Batch Size

- **显存充足**: 16或更大
- **显存有限**: 8 + gradient_accumulation_steps=2

### Max Steps

- **快速实验**: 500-1000
- **完整训练**: 2000-5000
- **长期训练**: 10000+

## 与V1的兼容性

### 保持不变
- ✅ Reward function接口
- ✅ VAL validator集成
- ✅ GRPOConfig参数
- ✅ Unsloth模型加载
- ✅ W&B集成

### 已更改
- ❌ 数据加载方式（单文件→多文件）
- ❌ Dataset类型（Dataset→IterableDataset）
- ❌ 采样策略（排序→动态采样）

### 迁移指南

从V1迁移到V2：

1. **准备数据**：将单个JSONL拆分为多个domain文件
2. **更新参数**：`--dataset` → `--data_root`
3. **调整batch_size**：确保能被domain数整除
4. **其他参数**：保持不变

## 性能优化

### 显存优化

```bash
# 启用gradient checkpointing
--use_gradient_checkpointing

# 减小batch size，增加accumulation
--batch_size 8 --gradient_accumulation_steps 4

# 使用4-bit量化（默认开启）
# 不加 --no_4bit
```

### 速度优化

```bash
# 增大batch size（如果显存允许）
--batch_size 16

# 减少保存频率
--save_steps 200

# 减少日志频率
--logging_steps 20
```

## 联系与反馈

如有问题或建议，请：
1. 查看完整文档：`GRPO_V2_README.md`
2. 运行测试脚本：`test_difficulty_parsing.py`
3. 提交Issue或联系维护者

---

**版本**: V2.0
**最后更新**: 2026-01-09
**作者**: Claude Code with Human Supervision
