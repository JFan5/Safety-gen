#!/bin/bash
# 测试增强转换脚本

echo "测试增强转换脚本..."
echo "================================"

# 激活环境
source ~/.bashrc
conda activate llmstl 2>/dev/null || echo "注意: 需要激活 llmstl 环境"

# 切换到项目目录
cd /home/jfan5/Safety-gen

# 创建测试数据（只使用前 10 个 problems）
echo "创建测试数据（前 10 个 problems）..."
python3 << 'EOF'
import json
data = json.load(open('data_randomized/mixed_dataset.json'))
subset = data[:10]
json.dump(subset, open('data_randomized/test_subset.json', 'w'), indent=2)
print(f"创建了 {len(subset)} 个 problems 的测试数据")
EOF

# 测试转换（生成 5 个变体）
echo ""
echo "测试转换为增强格式（每个 problem 5 个变体）..."
python3 convert_randomized_to_hf_augmented.py \
  --input data_randomized/test_subset.json \
  --output /tmp/test_augmented.hf \
  --num-variants 5 \
  --val-ratio 0.2 \
  --seed 42

# 验证结果
echo ""
echo "验证转换结果..."
python3 << 'EOF'
from datasets import load_from_disk
import os

if os.path.exists('/tmp/test_augmented.hf'):
    dataset = load_from_disk('/tmp/test_augmented.hf')

    print(f"\n训练集大小: {len(dataset['train'])}")
    print(f"验证集大小: {len(dataset['validation'])}")
    print(f"总计: {len(dataset['train']) + len(dataset['validation'])}")
    print(f"预期: 50 (10 problems × 5 variants)")

    print(f"\n字段: {list(dataset['train'].column_names)}")

    # 检查变体
    sample = dataset['train'][0]
    print(f"\n示例数据:")
    print(f"  Problem ID: {sample['problem_id']}")
    print(f"  Variant ID: {sample['variant_id']}")
    print(f"  Domain: {sample['domain']}")

    # 检查同一 problem 的不同变体
    base_id = sample['problem_id'].rsplit('_v', 1)[0]
    variants = [item for item in dataset['train'] if item['problem_id'].startswith(base_id)]
    print(f"\n  Problem {base_id} 的变体数: {len(variants)}")

    print("\n✅ 测试成功！")
else:
    print("❌ 测试失败：输出文件不存在")
EOF

echo ""
echo "================================"
echo "测试完成"
