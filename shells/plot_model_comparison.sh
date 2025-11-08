#!/usr/bin/env bash
set -euo pipefail

# 为 mistral 和 qwen 模型生成 baseline, sft, dpo 三个 variant 的成功率对比图

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

cd "${REPO_ROOT}"

PLOT_SCRIPT="${REPO_ROOT}/script/plot_model_correctness.py"

# 检查脚本是否存在
if [[ ! -f "${PLOT_SCRIPT}" ]]; then
  echo "错误: 找不到脚本 ${PLOT_SCRIPT}" >&2
  exit 1
fi

# 定义模型配置
# 格式: model_path|sft_variant_name
declare -a MODEL_CONFIGS=(
  "paper_results/mistral-multi|sft"
  "paper_results/qwen3-14b|sft"
)

echo "========================================="
echo "开始生成模型对比图表"
echo "========================================="

for config in "${MODEL_CONFIGS[@]}"; do
  IFS="|" read -r MODEL_PATH SFT_VARIANT <<< "${config}"
  
  if [[ ! -d "${MODEL_PATH}" ]]; then
    echo "警告: 模型目录不存在: ${MODEL_PATH}，跳过" >&2
    continue
  fi
  
  MODEL_NAME="$(basename "${MODEL_PATH}")"
  echo ""
  echo "处理模型: ${MODEL_NAME}"
  echo "  路径: ${MODEL_PATH}"
  
  # 确定 baseline variant 名称
  # 对于 mistral-multi，使用 pretrained 作为 baseline
  if [[ "${MODEL_NAME}" == "mistral-multi" ]]; then
    BASELINE_VARIANT="pretrained"
  else
    BASELINE_VARIANT="baseline"
  fi
  echo "  Variants: ${BASELINE_VARIANT}, ${SFT_VARIANT}, dpo"
  
  # 检查 variant 目录是否存在
  
  BASELINE_DIR="${MODEL_PATH}/${BASELINE_VARIANT}"
  SFT_DIR="${MODEL_PATH}/${SFT_VARIANT}"
  DPO_DIR="${MODEL_PATH}/dpo"
  
  variants=()
  if [[ -d "${BASELINE_DIR}" ]]; then
    variants+=("${BASELINE_VARIANT}")
  else
    echo "  警告: ${BASELINE_VARIANT} 目录不存在: ${BASELINE_DIR}" >&2
  fi
  
  if [[ -d "${SFT_DIR}" ]]; then
    variants+=("${SFT_VARIANT}")
  else
    echo "  警告: ${SFT_VARIANT} 目录不存在: ${SFT_DIR}" >&2
  fi
  
  if [[ -d "${DPO_DIR}" ]]; then
    variants+=("dpo")
  else
    echo "  警告: dpo 目录不存在: ${DPO_DIR}" >&2
  fi
  
  if [[ ${#variants[@]} -eq 0 ]]; then
    echo "  错误: 未找到任何 variant 目录，跳过" >&2
    continue
  fi
  
  echo "  找到 variants: ${variants[*]}"
  
  # 调用 Python 脚本生成图表
  echo "  正在生成图表..."
  if python3 "${PLOT_SCRIPT}" --model "${MODEL_PATH}" "${variants[@]}"; then
    echo "  ✓ 成功生成 ${MODEL_NAME} 的对比图表"
  else
    echo "  ✗ 生成 ${MODEL_NAME} 的对比图表失败" >&2
  fi
done

echo ""
echo "========================================="
echo "完成！生成的图表保存在 paper_plots/ 目录下"
echo "========================================="

