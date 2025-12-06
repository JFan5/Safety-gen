# PDDL 随机化快速开始

## 🚀 快速开始

### 1. 运行随机化脚本

```bash
python randomize_pddl.py \
  --output_root data_randomized \
  --domains blocksworld ferry spanner grippers \
  --seed 42
```

### 2. 查看生成的文件

```bash
# 查看输出结构
ls -lh data_randomized/

# 输出示例:
# blocksworld_dataset.json    (500 条)
# ferry_dataset.json          (500 条)
# spanner_dataset.json        (500 条)
# grippers_dataset.json       (500 条)
# mixed_dataset.json          (2000 条)
# blocksworld/
# ferry/
# spanner/
# grippers/
```

### 3. 验证随机化结果

```bash
python verify_randomization.py
```

预期输出：
```
✅ 所有 predicates 已正确替换
✅ 所有 actions 已正确替换
✅ 所有 objects 已正确替换
✅ 数据集格式正确
```

### 4. 查看使用示例

```bash
python example_usage.py
```

## 📊 生成的数据集格式

每个数据集是一个 JSON 文件，包含以下字段的列表：

```json
[
  {
    "domain": "blocksworld",
    "problem_id": "bw_ops3_n3_seed10",
    "domain_pddl": "(define (domain blocksworld) ...)",
    "problem_pddl": "(define (problem BW-rand-3) ...)",
    "plan": "(a1 o1)\n(a2 o1 o2)\n..."
  }
]
```

## 🔍 映射表示例

每个 domain 目录包含一个 `mapping.json`：

```json
{
  "predicate_map": {
    "on": "p1",
    "clear": "p2"
  },
  "action_map": {
    "pickup": "a1",
    "stack": "a2"
  },
  "object_map": {
    "b1": "o1",
    "b2": "o2"
  }
}
```

## 📈 数据集统计

| Domain | Problems | Predicates | Actions | Objects |
|--------|----------|------------|---------|---------|
| blocksworld | 500 | 5 | 4 | 6 |
| ferry | 500 | 7 | 3 | 7 |
| spanner | 500 | 6 | 3 | 12 |
| grippers | 500 | 4 | 3 | 10 |
| **总计** | **2000** | - | - | - |

## 💡 使用 Python 加载数据集

```python
import json

# 加载单个场景数据集
with open('data_randomized/blocksworld_dataset.json', 'r') as f:
    blocksworld_data = json.load(f)

print(f"Blocksworld: {len(blocksworld_data)} 条")

# 加载混合数据集
with open('data_randomized/mixed_dataset.json', 'r') as f:
    mixed_data = json.load(f)

print(f"混合数据集: {len(mixed_data)} 条")

# 访问单条数据
sample = blocksworld_data[0]
print(f"Domain: {sample['domain']}")
print(f"Problem ID: {sample['problem_id']}")
print(f"Domain PDDL: {sample['domain_pddl'][:100]}...")
print(f"Problem PDDL: {sample['problem_pddl'][:100]}...")
print(f"Plan: {sample['plan'][:100]}...")
```

## 🎯 用于 LLM 训练

### 格式化为训练样本

```python
def format_training_sample(data_item):
    """将数据格式化为训练样本"""
    prompt = f"""Given the following PDDL domain and problem, generate a valid plan.

Domain:
{data_item['domain_pddl']}

Problem:
{data_item['problem_pddl']}

Plan:"""

    completion = data_item['plan']

    return {
        'prompt': prompt,
        'completion': completion,
        'metadata': {
            'domain': data_item['domain'],
            'problem_id': data_item['problem_id']
        }
    }

# 使用示例
with open('data_randomized/mixed_dataset.json', 'r') as f:
    dataset = json.load(f)

training_samples = [format_training_sample(item) for item in dataset]
print(f"生成了 {len(training_samples)} 个训练样本")
```

### 创建训练/验证分割

```python
from sklearn.model_selection import train_test_split

# 加载数据集
with open('data_randomized/mixed_dataset.json', 'r') as f:
    dataset = json.load(f)

# 按场景分层分割
train_data, val_data = train_test_split(
    dataset,
    test_size=0.1,
    random_state=42,
    stratify=[item['domain'] for item in dataset]
)

print(f"训练集: {len(train_data)} 条")
print(f"验证集: {len(val_data)} 条")

# 保存分割后的数据
with open('train_dataset.json', 'w') as f:
    json.dump(train_data, f, indent=2)

with open('val_dataset.json', 'w') as f:
    json.dump(val_data, f, indent=2)
```

## 🔧 常见问题

### Q: 如何使用不同的随机种子？

```bash
python randomize_pddl.py \
  --output_root data_randomized_v2 \
  --domains blocksworld ferry spanner grippers \
  --seed 123  # 改变种子
```

### Q: 如何只处理特定场景？

```bash
# 只处理 blocksworld
python randomize_pddl.py \
  --output_root data_randomized \
  --domains blocksworld \
  --seed 42
```

### Q: 如何还原原始符号？

查看 `mapping.json` 文件，反向应用映射即可：

```python
import json

# 加载映射表
with open('data_randomized/blocksworld/mapping.json', 'r') as f:
    mapping = json.load(f)

# 创建反向映射
reverse_pred_map = {v: k for k, v in mapping['predicate_map'].items()}
reverse_action_map = {v: k for k, v in mapping['action_map'].items()}
reverse_object_map = {v: k for k, v in mapping['object_map'].items()}

print(f"p1 的原始名称: {reverse_pred_map['p1']}")
# 输出: p1 的原始名称: holding
```

## 📚 更多信息

- 详细文档: `README_RANDOMIZATION.md`
- 使用示例: `example_usage.py`
- 验证脚本: `verify_randomization.py`

## ✅ 检查清单

- [ ] 运行 `randomize_pddl.py` 生成数据集
- [ ] 运行 `verify_randomization.py` 验证结果
- [ ] 查看 `example_usage.py` 了解使用方法
- [ ] 检查生成的 JSON 文件
- [ ] 查看映射表确保符合预期
- [ ] 准备用于 LLM 训练

## 🎉 完成！

现在你有了一个完整的随机化 PDDL 数据集，可以用于训练 LLM！
