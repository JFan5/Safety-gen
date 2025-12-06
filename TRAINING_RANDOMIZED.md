# 使用随机化数据集训练 Mistral-7B

## 📋 准备步骤

### 1. 生成随机化数据集（已完成 ✅）

```bash
python randomize_pddl.py \
  --output_root data_randomized \
  --domains blocksworld ferry spanner grippers \
  --seed 42
```

已生成：
- `data_randomized/mixed_dataset.json` (2000 条)
- 各场景独立数据集 JSON 文件

### 2. 转换为 HuggingFace 格式

```bash
# 转换为 HF 格式（自动分割 90% 训练 / 10% 验证）
python convert_randomized_to_hf.py \
  --input data_randomized/mixed_dataset.json \
  --output /jfan5/sft_data/four_scenarios500_randomized/combined.hf \
  --val-ratio 0.1 \
  --seed 42
```

**参数说明：**
- `--input`: 输入 JSON 文件路径
- `--output`: 输出 HuggingFace 数据集路径
- `--val-ratio`: 验证集比例（默认 0.1）
- `--seed`: 随机种子（默认 42）
- `--no-split`: 可选，不分割训练/验证集

### 3. 启动训练

```bash
# 提交训练任务
sbatch shells/finetune_mistral_7b_randomized.sh
```

或手动运行：

```bash
python3 pddl_finetune.py \
    --mode train \
    --model "unsloth/mistral-7b-instruct-v0.3-bnb-4bit" \
    --family mistral \
    --dataset "/jfan5/sft_data/four_scenarios500_randomized/combined.hf" \
    --output "/jfan5/sft_models/mistral_7b/four_scenarios500_randomized" \
    --num-train-epochs 3 \
    --per-device-train-batch-size 4 \
    --gradient-accumulation-steps 2 \
    --learning-rate 2e-4 \
    --max-seq-length 4096 \
    --load-in-4bit \
    --eval-strategy epoch \
    --save-strategy epoch \
    --logging-steps 10 \
    --save-total-limit 3
```

## 📊 数据集信息

### 随机化统计

| Domain | Problems | Predicates | Actions | Objects |
|--------|----------|------------|---------|---------|
| blocksworld | 500 | 5 | 4 | 6 |
| ferry | 500 | 7 | 3 | 7 |
| spanner | 500 | 6 | 3 | 12 |
| grippers | 500 | 4 | 3 | 10 |
| **总计** | **2000** | - | - | - |

### 随机化示例

**原始 → 随机化：**

```
Predicates:
  clear      → p5
  on-table   → p2
  arm-empty  → p3
  holding    → p1
  on         → p4

Actions:
  pickup     → a3
  putdown    → a2
  stack      → a4
  unstack    → a1

Objects:
  b1 → o1, b2 → o4, b3 → o2
```

### 数据格式

转换后的 HuggingFace 数据集包含以下字段：

- `text`: 完整的训练文本（prompt + plan）
- `domain`: 场景名称
- `problem_id`: Problem ID
- `domain_pddl`: Domain PDDL 内容
- `problem_pddl`: Problem PDDL 内容
- `plan`: Plan 内容

## 🎯 训练参数

当前配置（`finetune_mistral_7b_randomized.sh`）：

- **模型**: Mistral-7B Instruct (4-bit quantized)
- **Epochs**: 3
- **Batch size**: 4
- **Gradient accumulation**: 2（有效 batch size = 8）
- **Learning rate**: 2e-4
- **Max sequence length**: 4096
- **优化**: 4-bit LoRA fine-tuning

## 📝 监控训练

### 查看训练日志

```bash
# 实时查看
tail -f job_outputs/finetune_mistral_7b_randomized.o

# 查看完整日志
cat job_outputs/finetune_mistral_7b_randomized.o
```

### 检查训练状态

```bash
# 查看作业状态
squeue -u jfan5

# 查看 GPU 使用
nvidia-smi
```

## 📂 输出文件

训练完成后，模型保存在：
```
/jfan5/sft_models/mistral_7b/four_scenarios500_randomized/
├── adapter_config.json
├── adapter_model.bin
├── checkpoint-xxx/
├── training_args.bin
└── ...
```

## 🔍 验证转换结果

转换后可以快速验证：

```python
from datasets import load_from_disk

# 加载数据集
dataset = load_from_disk('/jfan5/sft_data/four_scenarios500_randomized/combined.hf')

print(f"训练集: {len(dataset['train'])} 条")
print(f"验证集: {len(dataset['validation'])} 条")

# 查看示例
print("\n示例:")
print(dataset['train'][0]['text'][:500])
```

## 🛠️ 常见问题

### Q1: 如何使用不同的数据集分割比例？

```bash
# 使用 20% 验证集
python convert_randomized_to_hf.py \
  --input data_randomized/mixed_dataset.json \
  --output /jfan5/sft_data/four_scenarios500_randomized/combined.hf \
  --val-ratio 0.2
```

### Q2: 如何只使用某个场景的数据？

```bash
# 只使用 blocksworld
python convert_randomized_to_hf.py \
  --input data_randomized/blocksworld_dataset.json \
  --output /jfan5/sft_data/blocksworld_randomized/combined.hf
```

### Q3: 如何调整训练参数？

编辑 `shells/finetune_mistral_7b_randomized.sh` 修改：
- `NUM_EPOCHS`: 训练轮数
- `BATCH_SIZE`: 批次大小
- `LEARNING_RATE`: 学习率
- `MAX_SEQ_LENGTH`: 最大序列长度

### Q4: 转换时出现内存错误？

减少内存使用：
```bash
# 分批处理（如果数据集很大）
# 或者在转换前只选择部分数据
python3 << 'EOF'
import json
data = json.load(open('data_randomized/mixed_dataset.json'))
# 只使用前 1000 条
subset = data[:1000]
json.dump(subset, open('data_randomized/mixed_dataset_subset.json', 'w'))
EOF

python convert_randomized_to_hf.py \
  --input data_randomized/mixed_dataset_subset.json \
  --output /jfan5/sft_data/four_scenarios500_randomized_subset/combined.hf
```

## 🚀 完整工作流程

```bash
# 步骤 1: 生成随机化数据集（已完成）
python randomize_pddl.py \
  --output_root data_randomized \
  --domains blocksworld ferry spanner grippers \
  --seed 42

# 步骤 2: 验证随机化
python verify_randomization.py

# 步骤 3: 转换为 HF 格式
python convert_randomized_to_hf.py \
  --input data_randomized/mixed_dataset.json \
  --output /jfan5/sft_data/four_scenarios500_randomized/combined.hf

# 步骤 4: 提交训练
sbatch shells/finetune_mistral_7b_randomized.sh

# 步骤 5: 监控训练
tail -f job_outputs/finetune_mistral_7b_randomized.o
```

## 📈 与原始数据集对比

| 特性 | 原始数据集 | 随机化数据集 |
|------|-----------|------------|
| 数据量 | 2000 条 | 2000 条 |
| 场景数 | 4 | 4 |
| Predicate 名称 | clear, on-table, ... | p1, p2, p3, ... |
| Action 名称 | pickup, stack, ... | a1, a2, a3, ... |
| Object 名称 | b1, b2, ... | o1, o2, o3, ... |
| 语义结构 | 保持 | 保持 |
| 用途 | 标准训练 | 测试泛化能力 |

## 🎓 研究价值

使用随机化数据集训练的模型可以：

1. **测试泛化能力**: 评估模型是否真正学习了规划逻辑，而不是记忆符号名称
2. **减少过拟合**: 避免模型过度依赖特定的符号名称
3. **提高鲁棒性**: 训练出对符号命名不敏感的模型
4. **对比研究**: 与原始数据集训练的模型进行对比分析

## 📚 相关文档

- `README_RANDOMIZATION.md` - 随机化详细文档
- `QUICKSTART.md` - 快速开始指南
- `verify_randomization.py` - 验证脚本
- `example_usage.py` - 使用示例

---

✅ **现在你可以开始转换和训练了！**
