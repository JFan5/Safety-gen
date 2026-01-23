#!/bin/bash
# Run SafePilot on PDDL3 planning problems with iterative refinement
#
# Usage: ./shells/run_safepilot.sh <model_path> <domain> [max_retries] [max_problems]
#
# Arguments:
#   $1 - model_path (required): Path to local model directory
#   $2 - domain (required): blocksworld|ferry|grippers|spanner|delivery
#   $3 - max_retries (optional, default: 5): Maximum retry attempts per problem
#   $4 - max_problems (optional, default: 0 = all): Limit number of problems
#
# Examples:
#   # Run on all blocksworld problems with 5 retries
#   ./shells/run_safepilot.sh runs/grpo/grpo_qwen3-14b/model_dir blocksworld
#
#   # Run on 1 problem with 3 retries (quick test)
#   ./shells/run_safepilot.sh runs/grpo/grpo_qwen3-14b/model_dir blocksworld 3 1
#
#   # Run on all ferry problems with 10 retries
#   ./shells/run_safepilot.sh runs/grpo/grpo_qwen3-14b/model_dir ferry 10
#
#   # Run on delivery domain (very hard)
#   ./shells/run_safepilot.sh runs/grpo/grpo_qwen3-14b/model_dir delivery 5 50

set -e

# Show usage if --help or no arguments
if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ -z "$1" ]; then
    echo "Usage: ./shells/run_safepilot.sh <model_path> <domain> [max_retries] [max_problems]"
    echo ""
    echo "Arguments:"
    echo "  model_path   - Path to local model directory (required)"
    echo "  domain       - Planning domain: blocksworld|ferry|grippers|spanner|delivery (required)"
    echo "  max_retries  - Maximum retry attempts per problem (default: 5)"
    echo "  max_problems - Limit number of problems, 0 = all (default: 0)"
    echo ""
    echo "Examples:"
    echo "  ./shells/run_safepilot.sh runs/grpo/grpo_qwen3-14b/model_dir blocksworld"
    echo "  ./shells/run_safepilot.sh runs/grpo/grpo_qwen3-14b/model_dir blocksworld 3 1"
    exit 0
fi

# Initialize conda for bash shell
eval "$(conda shell.bash hook)"
conda activate llmstl

# Set working directory
cd /home/ubuntu/Safety-gen

# Parse arguments
MODEL_PATH="${1}"
DOMAIN="${2}"
MAX_RETRIES="${3:-5}"
MAX_PROBLEMS="${4:-0}"

# Fixed parameters (defaults matching the Python script)
FAMILY="qwen"
TEMPERATURE="0.6"
MAX_NEW_TOKENS="512"
OUTPUT_DIR="runs/safepilot"

# Validate required arguments
if [ -z "${MODEL_PATH}" ]; then
    echo "Error: model_path is required"
    echo "Usage: ./shells/run_safepilot.sh <model_path> <domain> [max_retries] [max_problems]"
    exit 1
fi

if [ -z "${DOMAIN}" ]; then
    echo "Error: domain is required"
    echo "Usage: ./shells/run_safepilot.sh <model_path> <domain> [max_retries] [max_problems]"
    exit 1
fi

# Validate domain
VALID_DOMAINS="blocksworld ferry grippers spanner delivery"
if [[ ! " ${VALID_DOMAINS} " =~ " ${DOMAIN} " ]]; then
    echo "Error: Invalid domain '${DOMAIN}'"
    echo "Valid domains: ${VALID_DOMAINS}"
    exit 1
fi

# Check model path exists
if [ ! -d "${MODEL_PATH}" ]; then
    echo "Error: Model path not found: ${MODEL_PATH}"
    exit 1
fi

echo "=========================================="
echo "SafePilot - Iterative Refinement Runner"
echo "=========================================="
echo "Model path: ${MODEL_PATH}"
echo "Domain: ${DOMAIN}"
echo "Max retries: ${MAX_RETRIES}"
echo "Max problems: ${MAX_PROBLEMS} (0 = all)"
echo "Family: ${FAMILY}"
echo "Temperature: ${TEMPERATURE}"
echo "Max new tokens: ${MAX_NEW_TOKENS}"
echo "Output dir: ${OUTPUT_DIR}"
echo "=========================================="
echo ""

# Run SafePilot
python3 SafePilot/src/safepilot/run_safepilot.py \
    --run-path "${MODEL_PATH}" \
    --domain "${DOMAIN}" \
    --family "${FAMILY}" \
    --max-retries "${MAX_RETRIES}" \
    --max-problems "${MAX_PROBLEMS}" \
    --temperature "${TEMPERATURE}" \
    --max-new-tokens "${MAX_NEW_TOKENS}" \
    --output-dir "${OUTPUT_DIR}"

echo ""
echo "=========================================="
echo "SafePilot run completed!"
echo "Results saved to ${OUTPUT_DIR}"
echo "=========================================="
