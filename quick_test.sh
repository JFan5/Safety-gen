#!/bin/bash
################################################################################
# Quick Test Script - Fast validation without model
################################################################################

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}════════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}   Quick Test - DPO Generation (No Model Required)${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════════════${NC}\n"

cd "$(dirname "$0")"

echo -e "${GREEN}[1/4]${NC} Testing file loading..."
python3 test_dpo_generation.py --test file

echo -e "\n${GREEN}[2/4]${NC} Testing unsafe solution loading..."
python3 test_dpo_generation.py --test unsafe || true

echo -e "\n${GREEN}[3/4]${NC} Testing prompt creation..."
python3 test_dpo_generation.py --test prompt

echo -e "\n${GREEN}[4/4]${NC} Testing verifier..."
python3 test_dpo_generation.py --test verifier

echo -e "\n${GREEN}✓ All quick tests completed!${NC}"
echo -e "\nNext steps:"
echo -e "  1. ✓ Verifier is implemented (using VAL validator)"
echo -e "  2. Install vLLM: pip install vllm"
echo -e "  3. Run with model: ./run_dpo_generation.sh --model /path/to/model --small-test"
echo -e "\nReady to generate DPO dataset!"
