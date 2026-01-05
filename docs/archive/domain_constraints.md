# 领域约束类型分类总结

本文档总结了六个PDDL3规划领域（blocksworld, ferry, spanner, delivery, grippers, grid）中使用的约束类型及其分类。

## 约束类型总览

PDDL3支持多种时序约束和状态约束。根据在各个领域中的实际使用情况，我们将约束类型分为以下几大类：

### 1. 时序顺序约束 (Temporal Ordering Constraints)
- **sometime-before**: 要求某个条件在另一个条件之前至少满足一次
- **sometime-after**: 要求某个条件在另一个条件之后至少满足一次

### 2. 状态保持约束 (State Maintenance Constraints)
- **always**: 要求某个条件在整个执行过程中始终为真
- **always-not**: 要求某个条件在整个执行过程中始终为假（禁止状态）
- **always-imply**: 要求某个条件蕴含关系在整个执行过程中始终成立

### 3. 次数限制约束 (Occurrence Constraints)
- **at-most-once**: 要求某个条件最多只能满足一次
- **at-least-once**: 要求某个条件至少满足一次

### 4. 时间窗口约束 (Temporal Window Constraints)
- **always-within**: 要求某个条件在指定时间内必须满足
- **hold-during**: 要求在某个时间段内保持某个条件
- **hold-after**: 要求在某个时间点之后保持某个条件

---

## 各领域约束类型详细分析

### 1. Blocksworld（积木世界）

**主要约束类型：**
- **sometime-before**（7169个问题）

**约束示例：**
```pddl
(:constraints
  (sometime-before (on b2 b4) (on-table b1))
)
```

**约束说明：**
- Blocksworld领域主要使用 `sometime-before` 约束来指定积木堆叠的顺序关系
- 约束表达的含义是：在执行计划中，`(on b2 b4)` 这个状态必须在 `(on-table b1)` 之前至少出现一次
- 这确保了积木操作的正确顺序，避免违反物理约束

**其他约束：**
- 少量使用 `always-not` 和通用 `always` 约束（共3个问题）

**约束语义分类：**
- **类型**：时序顺序约束
- **目的**：确保操作的逻辑顺序
- **应用场景**：防止在某个积木还没有移动到桌子之前就尝试在其上堆叠其他积木

---

### 2. Ferry（渡船）

**主要约束类型：**
- **sometime-before**（7245个问题）

**约束示例：**
```pddl
(:constraints
  (and
    (sometime-before (at c0 l4) (at-ferry l0))
    (sometime-before (at c1 l2) (at-ferry l0))
    (sometime-before (at c2 l1) (at-ferry l0))
  )
)
```

**约束说明：**
- Ferry领域完全使用 `sometime-before` 约束
- 约束要求渡船必须先到达某个位置（如 `l0`），然后才能将汽车运送到目标位置
- 这确保了渡船的移动顺序符合逻辑，避免在不合理的时间点完成运输任务

**约束语义分类：**
- **类型**：时序顺序约束
- **目的**：确保渡船在运输汽车前先到达指定位置
- **应用场景**：要求在汽车到达目标位置之前，渡船必须先经过某个关键位置

---

### 3. Spanner（扳手）

**主要约束类型：**
- **always-imply**（3243个问题）
- **at-most-once**（3244个问题，通常与forall结合使用）

**约束示例：**
```pddl
(:constraints
  (and
    (always (imply (not (tightened nut1)) (not (tightened nut2))))
    (forall (?m - man) (at-most-once (at ?m shed)))
  )
)
```

**约束说明：**
- Spanner领域使用两种主要约束类型：
  1. **always-imply**: 要求螺母的拧紧顺序必须遵循特定的逻辑关系
     - 例如：如果 `nut1` 没有被拧紧，则 `nut2` 也不能被拧紧
     - 这确保了螺母的拧紧顺序符合依赖关系
  2. **at-most-once**: 结合 `forall` 量词，限制每个工人最多只能访问一次shed位置
     - 这限制了资源的使用次数，增加了规划的复杂度

**约束语义分类：**
- **always-imply**: 状态保持约束（蕴含关系）
  - **目的**：维护螺母拧紧的顺序依赖关系
  - **应用场景**：某些螺母的拧紧必须以其他螺母的状态为前提
  
- **at-most-once**: 次数限制约束
  - **目的**：限制资源访问次数
  - **应用场景**：防止工人重复访问资源位置，增加规划难度

---

### 4. Delivery（配送）

**主要约束类型：**
- **always-not**（2361个问题）

**约束示例：**
```pddl
(:constraints
  (always (and (not (and (last t1 c_1_0) (at t1 c_2_0))) 
               (not (and (last t1 c_2_0) (at t1 c_1_0)))))
)
```

**约束说明：**
- Delivery领域使用 `always-not` 约束来禁止某些状态组合同时出现
- 示例约束表示：卡车不能同时满足"上次在位置c_1_0"和"当前在位置c_2_0"这两个状态
- 这防止了逻辑上不可能的状态组合，确保规划的合理性

**约束语义分类：**
- **类型**：状态保持约束（禁止状态）
- **目的**：防止逻辑上矛盾的状态组合
- **应用场景**：确保卡车的位置状态和上一次访问位置的一致性

---

### 5. Grippers（夹爪机器人）

**主要约束类型：**
- **always-not**（6697个问题）
- **always-other**（1270个问题）

**约束示例：**
```pddl
(:constraints
  (always (not (at-robby robot1 room3)))
)
```

**约束说明：**
- Grippers领域主要使用 `always-not` 约束来禁止机器人进入某些房间
- 这限制了机器人的移动范围，增加了多机器人协调的复杂度
- 约束确保在规划过程中，指定的机器人永远不会出现在被禁止的房间中

**约束语义分类：**
- **类型**：状态保持约束（禁止状态）
- **目的**：限制机器人的移动范围
- **应用场景**：模拟机器人无法访问某些区域的情况，或者为了增加规划难度而设置的约束

**其他约束：**
- 还有部分问题使用通用的 `always` 约束（1270个问题），表达各种始终为真的条件

---

### 6. Grid（网格）

**主要约束类型：**
- **always-not**（3468个问题）

**约束示例：**
```pddl
(:constraints
  (always (not (at-robot pos0-2)))
)
```

**约束说明：**
- Grid领域使用 `always-not` 约束来禁止机器人到达某些网格位置
- 这模拟了网格中存在障碍物或禁区的情况
- 约束在整个执行过程中都必须保持，机器人永远不能进入被禁止的位置

**约束语义分类：**
- **类型**：状态保持约束（禁止状态）
- **目的**：定义网格中的禁区或障碍物
- **应用场景**：限制机器人的移动路径，增加规划问题的难度

---

## 约束类型使用统计

| 领域 | 主要约束类型 | 问题数量 | 约束语义 |
|------|------------|---------|---------|
| blocksworld | sometime-before | 7169 | 时序顺序约束 |
| ferry | sometime-before | 7245 | 时序顺序约束 |
| spanner | always-imply | 3243 | 状态保持约束（蕴含） |
| spanner | at-most-once | 3244 | 次数限制约束 |
| delivery | always-not | 2361 | 状态保持约束（禁止） |
| grippers | always-not | 6697 | 状态保持约束（禁止） |
| grid | always-not | 3468 | 状态保持约束（禁止） |

## 约束类型分类总结

### 按语义分类

#### 1. 时序顺序约束（Temporal Ordering）
- **blocksworld**: 使用 `sometime-before` 确保操作顺序
- **ferry**: 使用 `sometime-before` 确保渡船移动顺序

#### 2. 状态保持约束（State Maintenance）
- **禁止状态约束（Always-Not）**:
  - **delivery**: 禁止矛盾的状态组合
  - **grippers**: 禁止机器人进入特定房间
  - **grid**: 禁止机器人进入特定位置
  
- **蕴含关系约束（Always-Imply）**:
  - **spanner**: 维护螺母拧紧的顺序依赖关系

#### 3. 次数限制约束（Occurrence Constraints）
- **spanner**: 使用 `at-most-once` 限制资源访问次数

### 按复杂度分类

#### 简单约束（单条件约束）
- `always-not`: 禁止某个单一条件为真
- `sometime-before`: 指定两个条件之间的时序关系

#### 复合约束（多条件约束）
- `always-imply`: 涉及条件之间的逻辑蕴含关系
- `at-most-once` with `forall`: 涉及量化的次数限制

### 按应用目的分类

#### 顺序保证约束
- **blocksworld, ferry**: 确保操作的逻辑顺序

#### 资源限制约束
- **spanner**: 限制资源访问次数

#### 禁止区域约束
- **grippers, grid**: 定义不允许访问的区域

#### 逻辑一致性约束
- **delivery, spanner**: 维护状态之间的逻辑关系

---

## 约束验证要点

在验证规划解是否满足PDDL3约束时，需要注意：

1. **sometime-before**: 检查在满足第二个条件之前，第一个条件是否至少出现一次
2. **always-not**: 检查在整个执行过程中，被禁止的条件是否从未为真
3. **always-imply**: 检查在整个执行过程中，前提条件为真时，结论条件是否也为真
4. **at-most-once**: 检查被约束的条件在整个执行过程中最多只满足一次

---

## 参考资料

- PDDL3规范文档
- 各领域的问题文件位于 `pddl3/<domain>/` 目录下
- 约束验证代码参考 `script/validate_pddl3_constraints_against_classical.py`

