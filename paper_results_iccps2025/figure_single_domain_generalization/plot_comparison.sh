#!/bin/bash

# 脚本用于比较 baseline (Mistral-7B) 和 DPO (Blocksworld DPO) 的结果
# 图片保存在当前文件夹下

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# 设置文件路径
BASELINE_JSON="$SCRIPT_DIR/baseline.json"
DPO_JSON="$SCRIPT_DIR/dpo_blocksworld.json"
OUTPUT_DIR="$SCRIPT_DIR"

# 检查文件是否存在
if [ ! -f "$BASELINE_JSON" ]; then
    echo "Error: baseline.json not found at $BASELINE_JSON"
    exit 1
fi

if [ ! -f "$DPO_JSON" ]; then
    echo "Error: dpo_blocksworld.json not found at $DPO_JSON"
    exit 1
fi

# 获取项目根目录（假设脚本在 paper_results/figure_single_domain_generalization 下）
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
PLOT_SCRIPT="$PROJECT_ROOT/script/plot_two_models.py"

# 检查绘图脚本是否存在
if [ ! -f "$PLOT_SCRIPT" ]; then
    echo "Error: plot_two_models.py not found at $PLOT_SCRIPT"
    exit 1
fi

echo "=========================================="
echo "Plotting Model Comparison"
echo "=========================================="
echo "Baseline (Mistral-7B): $BASELINE_JSON"
echo "DPO (Blocksworld DPO): $DPO_JSON"
echo "Output directory: $OUTPUT_DIR"
echo "=========================================="

# 运行绘图脚本
python3 "$PLOT_SCRIPT" \
    --baseline "$BASELINE_JSON" \
    --dpo "$DPO_JSON" \
    --output "$OUTPUT_DIR" \
    --baseline-label "Mistral-7B" \
    --dpo-label "Blocksworld DPO" \
    --domain "Delivery"

if [ $? -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "Plotting completed successfully!"
    echo "Images saved to: $OUTPUT_DIR"
    echo "=========================================="
else
    echo ""
    echo "=========================================="
    echo "Error: Plotting failed!"
    echo "=========================================="
    exit 1
fi


