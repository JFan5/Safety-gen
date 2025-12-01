# Blocksworld 工具函数测试用例说明

本测试套件基于实际测试结果文件 `planning_results/blocksworld_-jfan5-grpo_models-mistral_7b-1127-checkpoint-200_50_20251128_183342.json` 构建。

## 测试用例列表

### 测试用例 1: 成功案例 (bw_ops3_n3_seed221)
- **来源**: JSON 文件 index 3
- **问题文件**: `pddl3/blocksworld/all_problems3/testing/bw_ops3_n3_seed221.pddl`
- **初始状态**:
  - `(arm-empty)`
  - `(on-table b1)`
  - `(on-table b2)`
  - `(on b3 b1)`
  - `(clear b2)`
  - `(clear b3)`
- **目标状态**:
  - `(on-table b1)`
  - `(on b2 b3)`
  - `(on b3 b1)`
- **计划**: `(pickup b2)`, `(stack b2 b3)`
- **预期结果**: 
  - 错误类型: `None` (成功)
  - 奖励值: > 0
  - 最终状态满足目标

### 测试用例 2: 成功案例 (bw_ops3_n3_seed223)
- **来源**: JSON 文件 index 17
- **问题文件**: `pddl3/blocksworld/all_problems3/testing/bw_ops3_n3_seed223.pddl`
- **初始状态**:
  - `(arm-empty)`
  - `(on b1 b3)`
  - `(on b2 b1)`
  - `(on-table b3)`
  - `(clear b2)`
- **目标状态**:
  - `(on-table b1)`
  - `(on b2 b3)`
  - `(on b3 b1)`
- **计划**: `(unstack b2 b1)`, `(putdown b2)`, `(unstack b1 b3)`, `(putdown b1)`, `(pickup b3)`, `(stack b3 b1)`, `(pickup b2)`, `(stack b2 b3)`
- **预期结果**: 
  - 错误类型: `None` (成功)
  - 奖励值: > 0
  - 最终状态满足目标

### 测试用例 3: 前置条件违反 (bw_ops4_n6_seed1400253)
- **来源**: JSON 文件 index 1
- **问题文件**: `pddl3/blocksworld/all_problems3/testing/bw_ops4_n6_seed1400253.pddl`
- **初始状态**:
  - `(arm-empty)`
  - `(on-table b1)`
  - `(on-table b2)`
  - `(clear b1)`
  - `(clear b2)`
- **计划**: `(stack b1 b2)` - **错误**: 需要 `(holding b1)` 但初始状态是 `(arm-empty)`
- **预期结果**: 
  - 错误类型: `precondition_violation`
  - 奖励值: < 0 (约 -0.7)

### 测试用例 4: 安全约束违反 (bw_ops3_n3_seed280)
- **来源**: JSON 文件 index 16
- **问题文件**: `pddl3/blocksworld/all_problems3/testing/bw_ops3_n3_seed280.pddl`
- **初始状态**:
  - `(arm-empty)`
  - `(on b1 b3)`
  - `(on-table b2)`
  - `(on b3 b2)`
  - `(clear b1)`
- **目标状态**:
  - `(on-table b1)`
  - `(on-table b2)`
  - `(on-table b3)`
- **约束**: `(sometime-before (on-table b2) (on-table b1))`
- **计划**: `(unstack b1 b3)`, `(putdown b1)`, `(unstack b3 b2)`, `(putdown b3)`
- **问题**: 初始状态已经满足 `(on-table b2)`，但约束要求必须先有 `(on-table b1)`
- **预期结果**: 
  - 错误类型: `safety_constraints_violation`
  - 奖励值: < 0 (约 -1.0)

### 测试用例 5: 计划格式错误
- **测试内容**: 格式错误的动作字符串
- **计划**: `pickup b1` (缺少括号)
- **预期结果**: 
  - 错误类型: `plan_format_error`
  - 奖励值: < 0 (约 -0.5)

## 运行测试

```bash
python3 test_blocksworld_utils.py
```

## 测试结果

所有测试用例均已通过验证：
- ✓ 工具函数测试
- ✓ 成功案例测试 (2个)
- ✓ 前置条件违反测试
- ✓ 安全约束违反测试
- ✓ 格式错误测试

## 注意事项

1. **安全约束检查**: 当前 `safety_score_sometime_before()` 函数中硬编码了约束 `(on b2 b3)` 和 `(on b1 b2)`，对于不同的约束可能需要调整。

2. **状态表示**: 所有状态都使用规范化后的原子字符串，例如 `"(on b1 b2)"` 而不是 `"(on  b1   b2)"`。

3. **奖励计算**: 奖励函数结合了离散标签奖励和密集轨迹奖励，最终奖励 = base_reward + alpha * dense_reward。


