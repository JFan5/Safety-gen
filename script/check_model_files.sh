#!/bin/bash
# 快速检查模型文件中的量化信息

MODEL_PATH="${1:-/groups/fkong/jfan5/sft_models/mistral_7b-spanner-variant-500_merged_16bit}"

echo "Checking model files in: $MODEL_PATH"
echo "----------------------------------------"

# 检查 config.json
if [ -f "$MODEL_PATH/config.json" ]; then
    echo "1. config.json:"
    grep -i "quantization\|bits\|dtype" "$MODEL_PATH/config.json" | head -5
    echo ""
fi

# 检查 adapter_config.json (如果是 LoRA)
if [ -f "$MODEL_PATH/adapter_config.json" ]; then
    echo "2. adapter_config.json (LoRA adapter):"
    cat "$MODEL_PATH/adapter_config.json" | grep -i "bits\|quantization" || echo "   No quantization info"
    echo ""
fi

# 检查文件大小（量化模型通常更小）
echo "3. Model file sizes:"
ls -lh "$MODEL_PATH"/*.safetensors "$MODEL_PATH"/*.bin 2>/dev/null | head -5

