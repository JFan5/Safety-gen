# Blocksworld Problem Generator

这个脚本用于生成不同参数的blocksworld问题，支持3ops和4ops两种变体。

## 功能特性

- **支持两种变体**：
  - **3ops**: 使用3个操作符，不使用机器人手臂
  - **4ops**: 使用4个操作符，使用机器人手臂

- **灵活的块数量**：支持2, 3, 4, 5, 10个块的问题生成

- **可配置的种子范围**：可以指定随机种子范围，确保问题可重现

- **分类存储**：按配置自动创建子目录，便于管理

## 使用方法

### 基本用法

```bash
# 生成所有配置的问题（默认）
python generate_problems.py

# 或者明确指定生成所有配置
python generate_problems.py all
```

### 特定配置生成

```bash
# 只生成3ops变体的问题
python generate_problems.py 3ops

# 只生成4ops变体的问题
python generate_problems.py 4ops

# 生成小规模问题（2-5个块）
python generate_problems.py small

# 生成中等规模问题（10个块）
python generate_problems.py medium
```

## 输出结构

生成的问题文件将按以下结构组织：

```
problems/
├── 3ops_2blocks/
│   ├── problem_1.pddl
│   ├── problem_2.pddl
│   └── ...
├── 3ops_3blocks/
│   ├── problem_1.pddl
│   └── ...
├── 4ops_2blocks/
│   ├── problem_1.pddl
│   └── ...
└── ...
```

## 配置说明

### 3ops变体 (Blocksworld-3ops)
- **描述**: 经典的无类型STRIPS域，可堆叠的块需要在有无限空间的桌子上重新组装
- **操作符**: 3个操作符
  - 将块从桌子移动到另一个块
  - 将块从另一个块移动到桌子
  - 将块从一个块移动到另一个块
- **特点**: 不使用机器人手臂

### 4ops变体 (Blocksworld-4ops)
- **描述**: 与3ops类似，但使用机器人手臂
- **操作符**: 4个操作符
  - 将块堆叠到另一个块上
  - 从另一个块上取下块
  - 放下块
  - 拿起块
- **特点**: 使用机器人手臂，更接近实际物理操作

## 参数说明

### 块数量限制
- 当前限制：最多200个块
- 如需增加限制，请编辑 `bwstates.1/Makefile` 并增加 `SIZE` 值

### 种子范围
- 默认范围：1-21（生成20个问题）
- 小规模问题：1-11（生成10个问题）
- 可自定义范围

## 示例输出

运行脚本后，您将看到类似以下的输出：

```
生成所有配置的问题...
生成 3ops, 2blocks 的问题...
生成 3ops, 3blocks 的问题...
生成 3ops, 4blocks 的问题...
生成 3ops, 5blocks 的问题...
生成 3ops, 10blocks 的问题...
生成 4ops, 2blocks 的问题...
生成 4ops, 3blocks 的问题...
生成 4ops, 4blocks 的问题...
生成 4ops, 5blocks 的问题...
生成 4ops, 10blocks 的问题...

总共生成了 200 个问题文件
输出目录: problems
```

## 错误处理

脚本包含错误处理机制：
- 如果某个问题生成失败，会显示错误信息但继续生成其他问题
- 支持异常捕获，确保脚本不会因单个问题失败而中断

## 自定义配置

如需自定义配置，可以修改脚本中的参数：

```python
# 修改操作符列表
ops_list = [3, 4]  # 或只选择 [3] 或 [4]

# 修改块数量列表
num_blocks_list = [2, 3, 4, 5, 10]  # 可以添加更多数量

# 修改种子范围
seeds_range = (1, 21)  # 生成种子1到20的问题
```
