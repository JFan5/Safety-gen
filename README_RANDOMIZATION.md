# PDDL 随机化脚本使用指南

## 概述

`randomize_pddl.py` 脚本用于对 PDDL domain/problem/plan 进行符号随机化（predicate/action/object 重命名），生成随机化版本的数据集用于 LLM 训练。

## 特性

- ✅ 随机化 predicates（谓词）名称：`on` → `p1`, `clear` → `p2`
- ✅ 随机化 actions（动作）名称：`pickup` → `a1`, `stack` → `a2`
- ✅ 随机化 objects（对象）名称：`b1` → `o1`, `b2` → `o2`
- ✅ 保持同一 domain 内所有文件的映射一致性
- ✅ 支持带连字符的符号（如 `on-table`, `arm-empty`）
- ✅ 生成每个场景的独立数据集 JSON
- ✅ 生成混合所有场景的整体数据集 JSON
- ✅ 保存映射表以便调试和还原

## 使用方法

### 基本用法

```bash
python randomize_pddl.py \
  --output_root data_randomized \
  --domains blocksworld ferry spanner grippers \
  --seed 42
```

### 参数说明

- `--input_root`: 输入根目录（默认: `pddl3`）
- `--output_root`: 输出根目录（必需）
- `--domains`: 要处理的 domain 列表（必需）
- `--seed`: 随机种子，用于可重复性（默认: 42）

### 单个场景处理

```bash
python randomize_pddl.py \
  --output_root data_randomized \
  --domains blocksworld \
  --seed 42
```

## 输入目录结构

脚本期望以下输入结构：

```
pddl3/
├── blocksworld/
│   ├── domain3.pddl           # Domain 定义文件
│   └── sft_500/               # SFT 数据目录
│       ├── problem1.pddl      # Problem 文件
│       ├── problem1.soln      # 对应的 plan 文件
│       ├── problem2.pddl
│       ├── problem2.soln
│       └── ...
├── ferry/
│   ├── domain3.pddl
│   └── sft_500/
├── spanner/
│   ├── domain3.pddl
│   └── sft_500/
└── grippers/
    ├── domain3.pddl
    └── sft_500/
```

## 输出目录结构

```
data_randomized/
├── blocksworld/
│   ├── domain.pddl            # 随机化后的 domain
│   ├── mapping.json           # 映射表
│   └── problems/              # 随机化后的 problems 和 plans
│       ├── problem1.pddl
│       ├── problem1.soln
│       └── ...
├── ferry/
│   ├── domain.pddl
│   ├── mapping.json
│   └── problems/
├── spanner/
│   ├── domain.pddl
│   ├── mapping.json
│   └── problems/
├── grippers/
│   ├── domain.pddl
│   ├── mapping.json
│   └── problems/
├── blocksworld_dataset.json   # Blocksworld 场景数据集
├── ferry_dataset.json         # Ferry 场景数据集
├── spanner_dataset.json       # Spanner 场景数据集
├── grippers_dataset.json      # Grippers 场景数据集
└── mixed_dataset.json         # 混合所有场景的数据集
```

## 映射表格式

每个 domain 的 `mapping.json` 文件包含三个映射表：

```json
{
  "predicate_map": {
    "on": "p1",
    "clear": "p2",
    "on-table": "p3",
    "arm-empty": "p4",
    "holding": "p5"
  },
  "action_map": {
    "pickup": "a1",
    "putdown": "a2",
    "stack": "a3",
    "unstack": "a4"
  },
  "object_map": {
    "b1": "o1",
    "b2": "o2",
    "b3": "o3"
  }
}
```

## 数据集 JSON 格式

每个数据集 JSON 文件包含一个列表，每个元素是一个训练样本：

```json
[
  {
    "domain": "blocksworld",
    "problem_id": "bw_ops3_n3_seed10",
    "domain_pddl": "(define (domain blocksworld) ...)",
    "problem_pddl": "(define (problem BW-rand-3) ...)",
    "plan": "(a1 o1)\n(a2 o1 o2)\n..."
  },
  ...
]
```

## 示例输出

### 原始 domain (blocksworld)

```pddl
(define (domain blocksworld)
  (:predicates (clear ?x)
               (on-table ?x)
               (arm-empty)
               (holding ?x)
               (on ?x ?y))

  (:action pickup
    :parameters (?ob)
    :precondition (and (clear ?ob) (on-table ?ob) (arm-empty))
    :effect (and (holding ?ob) (not (clear ?ob)) (not (on-table ?ob))
                 (not (arm-empty))))
  ...)
```

### 随机化后的 domain

```pddl
(define (domain blocksworld)
  (:predicates (p5 ?x)
               (p2 ?x)
               (p3)
               (p1 ?x)
               (p4 ?x ?y))

  (:action a3
    :parameters (?ob)
    :precondition (and (p5 ?ob) (p2 ?ob) (p3))
    :effect (and (p1 ?ob) (not (p5 ?ob)) (not (p2 ?ob))
                 (not (p3))))
  ...)
```

## 数据集统计

运行脚本后会输出统计信息：

```
============================================================
数据集统计:
============================================================
  blocksworld: 500 条
  ferry: 500 条
  spanner: 500 条
  grippers: 500 条
  总计: 2000 条
============================================================
```

## 注意事项

1. **一致性保证**：同一 domain 内的所有 problem 和 plan 文件使用同一套映射表
2. **独立性**：不同 domain 之间使用独立的映射表，互不影响
3. **变量保护**：不会替换 PDDL 变量（如 `?x`, `?y`），只替换 predicates/actions/objects
4. **语义保持**：随机化只改变符号名称，不改变语义结构
5. **可重复性**：使用相同的 seed 可以得到相同的随机化结果

## 故障排查

### Plan 文件找不到

如果出现 "找不到 plan 文件" 警告，检查：
- Plan 文件扩展名是否为 `.soln`（或 `.solution`）
- Plan 文件名是否与 problem 文件名匹配

### Predicates 解析为 0

如果 predicates 解析数量不正确，检查：
- Domain 文件中 `:predicates` 块的格式
- 是否有非标准的 PDDL 语法

### Objects 缺失

如果某些 objects 没有被随机化，检查：
- Problem 文件中 `:objects` 块的格式
- 是否使用了类型化 PDDL（带 `- type` 的格式）

## 扩展和定制

### 修改命名规则

在 `generate_mappings` 方法中修改：

```python
# 当前：p1, p2, p3...
predicate_map = {pred: f"p{i+1}" for i, pred in enumerate(pred_list)}

# 可以改为：pred_0, pred_1, pred_2...
predicate_map = {pred: f"pred_{i}" for i, pred in enumerate(pred_list)}
```

### 添加新的 domain

只需在命令行参数中添加新的 domain 名称：

```bash
python randomize_pddl.py \
  --output_root data_randomized \
  --domains blocksworld ferry spanner grippers logistics rovers \
  --seed 42
```

## 性能

- 处理速度：约 500 个 problems/秒
- 内存使用：取决于 problem 文件大小，通常 < 1GB
- 磁盘空间：输出大小约等于输入大小

## 许可

本脚本作为 Safety-gen 项目的一部分发布。
