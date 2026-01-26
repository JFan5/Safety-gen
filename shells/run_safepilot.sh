#!/bin/bash
# Run SafePilot on PDDL3 planning problems with iterative refinement
#
# Usage: ./shells/run_safepilot.sh <model_path> <domain> [max_retries] [max_problems]
#
# Arguments:
#   $1 - model_path (required): Path to local model directory OR HuggingFace model ID
#   $2 - domain (required): blocksworld|ferry|grippers|spanner|delivery|all
#   $3 - max_retries (optional, default: 5): Maximum retry attempts per problem
#   $4 - max_problems (optional, default: 0 = all): Limit number of problems
#
# Examples:
#   # Run on all blocksworld problems with 5 retries (local model)
#   ./shells/run_safepilot.sh runs/grpo/grpo_qwen3-14b/model_dir blocksworld
#
#   # Run with HuggingFace model ID (no fine-tuning)
#   ./shells/run_safepilot.sh unsloth/Qwen3-14B-unsloth-bnb-4bit all 5
#
#   # Run on 1 problem with 3 retries (quick test)
#   ./shells/run_safepilot.sh runs/grpo/grpo_qwen3-14b/model_dir blocksworld 3 1
#
#   # Run on all ferry problems with 10 retries
#   ./shells/run_safepilot.sh runs/grpo/grpo_qwen3-14b/model_dir ferry 10
#
#   # Run on delivery domain (very hard)
#   ./shells/run_safepilot.sh runs/grpo/grpo_qwen3-14b/model_dir delivery 5 50
#
#   # Run on ALL domains
#   ./shells/run_safepilot.sh runs/grpo/grpo_qwen3-14b/model_dir all

set -e

# Show usage if --help or no arguments
if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ -z "$1" ]; then
    echo "Usage: ./shells/run_safepilot.sh <model_path> <domain> [max_retries] [max_problems]"
    echo ""
    echo "Arguments:"
    echo "  model_path   - Path to local model directory OR HuggingFace model ID (required)"
    echo "  domain       - Planning domain: blocksworld|ferry|grippers|spanner|delivery|all (required)"
    echo "  max_retries  - Maximum retry attempts per problem (default: 5)"
    echo "  max_problems - Limit number of problems, 0 = all (default: 0)"
    echo ""
    echo "Examples:"
    echo "  ./shells/run_safepilot.sh runs/grpo/grpo_qwen3-14b/model_dir blocksworld"
    echo "  ./shells/run_safepilot.sh unsloth/Qwen3-14B-unsloth-bnb-4bit all 5  # HuggingFace model"
    echo "  ./shells/run_safepilot.sh runs/grpo/grpo_qwen3-14b/model_dir blocksworld 3 1"
    echo "  ./shells/run_safepilot.sh runs/grpo/grpo_qwen3-14b/model_dir all  # Run all domains"
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

# All valid domains
ALL_DOMAINS="blocksworld ferry grippers spanner delivery"

# Validate required arguments
if [ -z "${MODEL_PATH}" ]; then
    echo "Error: model_path is required (local path or HuggingFace model ID)"
    echo "Usage: ./shells/run_safepilot.sh <model_path> <domain> [max_retries] [max_problems]"
    exit 1
fi

if [ -z "${DOMAIN}" ]; then
    echo "Error: domain is required"
    echo "Usage: ./shells/run_safepilot.sh <model_path> <domain> [max_retries] [max_problems]"
    exit 1
fi

# Validate domain (allow 'all' or specific domain)
if [ "${DOMAIN}" != "all" ]; then
    if [[ ! " ${ALL_DOMAINS} " =~ " ${DOMAIN} " ]]; then
        echo "Error: Invalid domain '${DOMAIN}'"
        echo "Valid domains: ${ALL_DOMAINS} all"
        exit 1
    fi
fi

# Check model path - allow HuggingFace model IDs (contain "/" but don't start with "/" or "." or known local prefixes)
is_hf_model_id() {
    local path="$1"
    # HuggingFace model IDs look like "org/model-name" (contain "/" but don't start with "/" or ".")
    if [[ "$path" == *"/"* ]] && [[ ! "$path" == /* ]] && [[ ! "$path" == .* ]] && [[ ! "$path" == runs/* ]]; then
        return 0  # true - is HF model ID
    fi
    return 1  # false - is local path
}

IS_HF_MODEL="false"
if is_hf_model_id "${MODEL_PATH}"; then
    IS_HF_MODEL="true"
    echo "Detected HuggingFace model ID: ${MODEL_PATH}"
    # Extract model name for family detection (optional)
    if [[ "${MODEL_PATH}" == *"qwen"* ]] || [[ "${MODEL_PATH}" == *"Qwen"* ]]; then
        FAMILY="qwen"
    elif [[ "${MODEL_PATH}" == *"llama"* ]] || [[ "${MODEL_PATH}" == *"Llama"* ]]; then
        FAMILY="llama"
    elif [[ "${MODEL_PATH}" == *"mistral"* ]] || [[ "${MODEL_PATH}" == *"Mistral"* ]]; then
        FAMILY="mistral"
    fi
    echo "Auto-detected family: ${FAMILY}"
elif [ ! -d "${MODEL_PATH}" ]; then
    echo "Error: Model path not found: ${MODEL_PATH}"
    exit 1
fi

# Function to run SafePilot on a single domain
run_domain() {
    local domain=$1
    local eval_dir=$2  # Optional: shared eval directory

    echo ""
    echo "=========================================="
    echo "SafePilot - Running domain: ${domain}"
    echo "=========================================="
    echo "Model path: ${MODEL_PATH}"
    echo "Domain: ${domain}"
    echo "Max retries: ${MAX_RETRIES}"
    echo "Max problems: ${MAX_PROBLEMS} (0 = all)"
    echo "Family: ${FAMILY}"
    echo "Temperature: ${TEMPERATURE}"
    echo "Max new tokens: ${MAX_NEW_TOKENS}"
    echo "Output dir: ${OUTPUT_DIR}"
    if [ -n "${eval_dir}" ]; then
        echo "Eval dir: ${eval_dir}"
    fi
    echo "=========================================="
    echo ""

    # Build command - use --model for HuggingFace IDs, --run-path for local paths
    local model_arg
    if [ "${IS_HF_MODEL}" = "true" ]; then
        model_arg="--model \"${MODEL_PATH}\""
    else
        model_arg="--run-path \"${MODEL_PATH}\""
    fi

    local cmd="python3 SafePilot/src/safepilot/run_safepilot.py \
        ${model_arg} \
        --domain \"${domain}\" \
        --family \"${FAMILY}\" \
        --max-retries \"${MAX_RETRIES}\" \
        --max-problems \"${MAX_PROBLEMS}\" \
        --temperature \"${TEMPERATURE}\" \
        --max-new-tokens \"${MAX_NEW_TOKENS}\" \
        --output-dir \"${OUTPUT_DIR}\""

    if [ -n "${eval_dir}" ]; then
        cmd="${cmd} --eval-dir \"${eval_dir}\" --scenario-name \"${domain}\""
    fi

    # Run SafePilot
    eval ${cmd}

    echo ""
    echo "=========================================="
    echo "Completed domain: ${domain}"
    echo "=========================================="
}

# Run on all domains or single domain
if [ "${DOMAIN}" = "all" ]; then
    # Generate single eval directory for all domains
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    EVAL_DIR="${OUTPUT_DIR}/safepilot__temp${TEMPERATURE}_max${MAX_NEW_TOKENS}_${TIMESTAMP}"

    echo "=========================================="
    echo "SafePilot - Running ALL domains"
    echo "Domains: ${ALL_DOMAINS}"
    echo "Eval directory: ${EVAL_DIR}"
    echo "=========================================="

    # Create the eval directory and scenarios subdirectory
    mkdir -p "${EVAL_DIR}/scenarios"

    for domain in ${ALL_DOMAINS}; do
        run_domain "${domain}" "${EVAL_DIR}"
    done

    echo ""
    echo "=========================================="
    echo "SafePilot completed ALL domains!"
    echo "Results saved to ${EVAL_DIR}"
    echo "=========================================="
else
    run_domain "${DOMAIN}"

    echo ""
    echo "=========================================="
    echo "SafePilot run completed!"
    echo "Results saved to ${OUTPUT_DIR}"
    echo "=========================================="
fi
