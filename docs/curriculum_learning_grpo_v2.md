# GRPO V2 Curriculum Learning 文档

本文档详细说明 `train_grpo_unsloth_stl_v2.py` 中的 Curriculum Learning 逻辑和难度分数计算方法。

---

## 目录

1. [概述](#1-概述)
2. [难度分数计算](#2-难度分数计算)
3. [难度分桶](#3-难度分桶)
4. [Curriculum Learning 调度](#4-curriculum-learning-调度)
5. [批次生成逻辑](#5-批次生成逻辑)
6. [Reward 分布](#6-reward-分布)
7. [完整流程图](#7-完整流程图)

---

## 1. 概述

GRPO V2 引入了 Curriculum Learning（课程学习）策略，核心思想是：

- **由易到难**：训练初期主要学习简单问题，后期逐渐增加难题比例
- **Domain 平衡**：每个批次包含来自各个 domain 的等量样本
- **预生成序列**：训练前预先生成整个训练序列，确保可复现性

---

## 2. 难度分数计算

### 2.1 从文件名解析难度参数

不同 domain 使用不同的命名约定：

| Domain | 文件名格式 | 参数含义 |
|--------|-----------|---------|
| **blocksworld** | `bw_ops3_n4_seed200074.pddl` | n = blocks 数量 |
| **ferry** | `ferry-l4-c2-s122320450.pddl` | l = locations, c = cars |
| **grippers** | `grippers-n1-r4-o3-s299249445.pddl` | n = robots, r = rooms, o = objects |
| **spanner** | `spanner-s3-n2-l4-s1595284416.pddl` | s = spanners, n = nuts, l = locations |
| **delivery** | `delivery-s2-p1-seed...` | s = locations, p = packages |

### 2.2 难度分数公式 (乘法)

使用**乘法公式**计算难度分数，因为规划问题的状态空间通常是参数的乘积关系：

```python
# blocksworld: 状态空间随 blocks 数量快速增长
difficulty_score = n × n  (n²)

# ferry: locations × cars
difficulty_score = l × c

# grippers: robots × rooms × objects
difficulty_score = n × r × o

# spanner: spanners × nuts × locations
difficulty_score = s × n × l

# delivery: locations × packages
difficulty_score = s × p
```

**为什么使用乘法而非加法？**

1. **组合爆炸特性**：规划问题的状态空间是参数的乘积，而非加法
2. **更直观**：`l=4, c=3` 表示 12 种 car-location 组合
3. **避免任意权重**：加法需要人为设定权重 (如 5n + 3r + 2o)，缺乏理论依据

### 2.3 计算示例

| Domain | 文件名 | 解析参数 | 公式 | 难度分数 |
|--------|--------|---------|------|---------|
| blocksworld | `bw_ops3_n4_seed...` | n=4 | 4² | **16** |
| blocksworld | `bw_ops4_n6_seed...` | n=6 | 6² | **36** |
| ferry | `ferry-l4-c2-s...` | l=4, c=2 | 4×2 | **8** |
| ferry | `ferry-l6-c3-s...` | l=6, c=3 | 6×3 | **18** |
| grippers | `grippers-n1-r4-o3-s...` | n=1, r=4, o=3 | 1×4×3 | **12** |
| grippers | `grippers-n2-r3-o3-s...` | n=2, r=3, o=3 | 2×3×3 | **18** |
| spanner | `spanner-s3-n2-l4-s...` | s=3, n=2, l=4 | 3×2×4 | **24** |
| spanner | `spanner-s4-n3-l4-s...` | s=4, n=3, l=4 | 4×3×4 | **48** |

---

## 3. 难度分桶

### 3.1 基于百分位数的分桶

对每个 domain **独立计算**百分位数，确保各 domain 内部的难度分布一致：

```python
p40 = np.percentile(scores, 40)  # 40th percentile
p80 = np.percentile(scores, 80)  # 80th percentile
```

### 3.2 分桶规则

```python
def assign_difficulty_bucket(score, percentiles):
    if score <= percentiles['p40']:
        return 'easy'      # 最简单的 40%
    elif score <= percentiles['p80']:
        return 'medium'    # 中等的 40% (40%-80%)
    else:
        return 'hard'      # 最难的 20% (80%-100%)
```

### 3.3 分布比例

```
┌────────────────────────────────────────────────────────────┐
│                    Difficulty Distribution                  │
├────────────────┬────────────────┬──────────────────────────┤
│     Easy       │     Medium     │          Hard            │
│   (0-40%)      │   (40-80%)     │        (80-100%)         │
│    ~40%        │     ~40%       │          ~20%            │
└────────────────┴────────────────┴──────────────────────────┘
```

---

## 4. Curriculum Learning 调度

### 4.1 训练进度与采样权重

根据训练进度动态调整各难度等级的采样概率：

```python
def get_curriculum_weights(step, max_steps):
    step_ratio = step / max(max_steps, 1)

    if step_ratio < 0.3:      # 训练前 30%
        return {'easy': 0.7, 'medium': 0.25, 'hard': 0.05}
    elif step_ratio < 0.7:    # 训练中期 30%-70%
        return {'easy': 0.4, 'medium': 0.4, 'hard': 0.2}
    else:                      # 训练后 30%
        return {'easy': 0.2, 'medium': 0.4, 'hard': 0.4}
```

### 4.2 调度可视化

```
Training Progress: 0% ──────────── 30% ──────────── 70% ──────────── 100%
                   │               │                │                │
Easy Weight:      0.70 ────────> 0.40 ──────────> 0.20              │
Medium Weight:    0.25 ────────> 0.40 ──────────> 0.40              │
Hard Weight:      0.05 ────────> 0.20 ──────────> 0.40              │
```

### 4.3 各阶段策略

| 阶段 | Step 范围 | Easy | Medium | Hard | 策略说明 |
|------|----------|------|--------|------|---------|
| **早期** | 0-30% | 70% | 25% | 5% | 主要学简单题，建立基础能力 |
| **中期** | 30-70% | 40% | 40% | 20% | 平衡学习，逐渐增加难度 |
| **后期** | 70-100% | 20% | 40% | 40% | 重点攻克难题，提升上限 |

### 4.4 设计原理

1. **早期 (0-30%)**：
   - 高比例简单题 (70%) 帮助模型快速学习基本 action 序列
   - 少量难题 (5%) 让模型接触复杂模式

2. **中期 (30-70%)**：
   - 均衡分布让模型巩固已学内容同时接受挑战
   - 避免过早接触太多难题导致学习不稳定

3. **后期 (70-100%)**：
   - 高比例难题 (40%) 推动模型突破能力上限
   - 保留部分简单题 (20%) 防止灾难性遗忘

---

## 5. 批次生成逻辑

### 5.1 Domain 平衡约束

```python
# batch_size 必须能被 domain 数量整除
samples_per_domain = batch_size // num_domains

# 示例: batch_size=8, 4 domains → 每个 domain 2 个样本
```

### 5.2 生成算法

```python
for step in range(max_steps):
    # 1. 获取当前 step 的 curriculum 权重
    weights = get_curriculum_weights(step, max_steps)

    batch_samples = []
    for domain in domains:
        for _ in range(samples_per_domain):
            # 2. 按权重随机选择难度桶
            bucket = rng.choice(
                ['easy', 'medium', 'hard'],
                p=[weights['easy'], weights['medium'], weights['hard']]
            )

            # 3. 从该桶中随机选一个样本
            sample = random.choice(domain_buckets[domain][bucket])
            batch_samples.append(sample)

    # 4. 打乱批次内顺序，避免 domain 顺序偏差
    rng.shuffle(batch_samples)
    all_samples.extend(batch_samples)
```

### 5.3 批次示例

**配置**: batch_size=8, 4 domains (blocksworld, ferry, grippers, spanner)

**Step 50 (5%, 早期阶段)**
- 权重: {easy: 0.7, medium: 0.25, hard: 0.05}

```
blocksworld: easy, easy
ferry:       easy, medium
grippers:    easy, easy
spanner:     medium, easy
────────────────────────
Batch 组成: 6 easy, 2 medium, 0 hard
```

**Step 500 (50%, 中期阶段)**
- 权重: {easy: 0.4, medium: 0.4, hard: 0.2}

```
blocksworld: medium, easy
ferry:       hard, medium
grippers:    easy, medium
spanner:     medium, hard
────────────────────────
Batch 组成: 2 easy, 4 medium, 2 hard
```

**Step 800 (80%, 后期阶段)**
- 权重: {easy: 0.2, medium: 0.4, hard: 0.4}

```
blocksworld: hard, medium
ferry:       medium, hard
grippers:    hard, easy
spanner:     medium, hard
────────────────────────
Batch 组成: 1 easy, 3 medium, 4 hard
```

---

## 6. Reward 分布

### 6.1 Reward 结构总览

所有 reward 归一化到 **[-1, +1]** 范围：

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                         PDDL Planning Reward Structure                       ║
╠══════════════════════════════════════════════════════════════════════════════╣
║                                                                              ║
║  FIXED ANCHORS (固定锚点):                                                    ║
║  ┌─────────────────────────┬─────────┐                                       ║
║  │ plan_format_error       │  -1.0   │  ← 最差 (无法解析)                     ║
║  │ empty_plan (size=0)     │  -1.0   │  ← 空计划惩罚                          ║
║  │ success_plans           │  +1.0   │  ← 最好 (完全成功)                     ║
║  └─────────────────────────┴─────────┘                                       ║
║                                                                              ║
║  VARIABLE PENALTIES (基于进度比例):                                          ║
║  ┌─────────────────────────────┬───────────────┬────────────────────────┐    ║
║  │ Category                    │ Range         │ Formula                │    ║
║  ├─────────────────────────────┼───────────────┼────────────────────────┤    ║
║  │ safety_constraints_violation│ [-0.9, -0.6]  │ -0.9 + 0.3 × ratio     │    ║
║  │ precondition_violation      │ [-0.6, -0.3]  │ -0.6 + 0.3 × ratio     │    ║
║  │ goal_not_satisfied          │ [-0.4, -0.1]  │ -0.4 + 0.3 × (done/N)  │    ║
║  └─────────────────────────────┴───────────────┴────────────────────────┘    ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

### 6.2 Reward 层次结构

```
-1.0 ──── -0.9 ─── -0.6 ──── -0.4 ─── -0.3 ─── -0.1 ──── +1.0
  │         └────────┘         │        └────────┘          │
format     safety           goal(0%)  precond/goal(100%) success
error                        base         top
```

### 6.3 各类别详细说明

| 类别 | Reward 范围 | 公式 | 说明 |
|------|------------|------|------|
| **success_plans** | +1.0 (固定) | — | 计划完全正确，满足所有约束 |
| **plan_format_error** | -1.0 (固定) | — | 无法解析计划格式 |
| **empty_plan** | -1.0 (固定) | — | plan_size=0，空计划 |
| **safety_constraints_violation** | [-0.9, -0.6] | -0.9 + 0.3 × (step/total) | 违反时序约束 (sometime-before) |
| **precondition_violation** | [-0.6, -0.3] | -0.6 + 0.3 × (step/total) | 动作前置条件不满足 |
| **goal_not_satisfied** | [-0.4, -0.1] | -0.4 + 0.3 × (satisfied/total) | 计划执行完但目标未达成 |

### 6.4 Reward 计算示例

**Precondition Violation** (假设 plan_size = 16):

| 违反步骤 | 进度比例 | Reward |
|---------|---------|--------|
| step 0 | 0% | -0.60 |
| step 4 | 25% | -0.525 |
| step 8 | 50% | -0.45 |
| step 12 | 75% | -0.375 |
| step 16 | 100% | -0.30 |

**Goal Not Satisfied** (假设 total_goals = 4):

| 满足目标数 | 满足率 | Reward |
|-----------|--------|--------|
| 0/4 | 0% | -0.40 |
| 1/4 | 25% | -0.33 |
| 2/4 | 50% | -0.25 |
| 3/4 | 75% | -0.18 |
| 4/4 | 100% | -0.10 |

---

## 7. 完整流程图

```
┌─────────────────────────────────────────────────────────────────┐
│                    1. Data Loading & Preprocessing              │
├─────────────────────────────────────────────────────────────────┤
│  • Load JSONL files for each domain                             │
│  • Parse difficulty from filename → (n, r, o)                   │
│  • Compute difficulty_score = 5n + 3r + 2o                      │
│  • Compute percentiles (p40, p80) per domain                    │
│  • Assign buckets: easy / medium / hard                         │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                 2. Curriculum Dataset Generation                │
├─────────────────────────────────────────────────────────────────┤
│  For each training step (0 to max_steps):                       │
│    ① Get curriculum weights based on step/max_steps             │
│    ② For each domain:                                           │
│       - Sample difficulty bucket according to weights           │
│       - Random sample from that bucket                          │
│    ③ Shuffle batch to remove domain ordering bias               │
│    ④ Append to training sequence                                │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                      3. GRPO Training Loop                      │
├─────────────────────────────────────────────────────────────────┤
│  For each batch:                                                │
│    ① Generate num_generations completions per prompt            │
│    ② Validate each completion with VAL validator                │
│    ③ Compute dense reward based on validation result            │
│    ④ Update model with GRPO loss                                │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                      4. Model Checkpoint                        │
├─────────────────────────────────────────────────────────────────┤
│  • Save model every save_steps                                  │
│  • Log metrics to W&B                                           │
│  • Final model saved to output_dir                              │
└─────────────────────────────────────────────────────────────────┘
```

---

## 附录: 使用示例

### 训练所有 domains

```bash
python train_grpo_unsloth_stl_v2.py \
    --base_model /path/to/sft_model \
    --data_root /jfan5/grpo_data/five_domain_0109 \
    --batch_size 8 \
    --max_steps 1000 \
    --num_generations 8 \
    --temperature 0.6
```

### 训练单个 domain

```bash
python train_grpo_unsloth_stl_v2.py \
    --base_model /path/to/sft_model \
    --data_root /jfan5/grpo_data/five_domain_0109 \
    --domains blocksworld \
    --batch_size 4 \
    --max_steps 500
```

### 训练多个指定 domains

```bash
python train_grpo_unsloth_stl_v2.py \
    --base_model /path/to/sft_model \
    --data_root /jfan5/grpo_data/five_domain_0109 \
    --domains blocksworld,ferry,grippers \
    --batch_size 6 \
    --max_steps 800
```

---

*文档生成日期: 2026-01-12*
