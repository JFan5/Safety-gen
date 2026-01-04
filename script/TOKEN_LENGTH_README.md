# Token Length Analysis for GRPO Training

Dataset: `/jfan5/grpo_data-127` (4000 samples total)

## Model Comparison Summary

| Model | Vocab Size | Max Prompt | Mean Prompt | Recommended max_prompt_length |
|-------|------------|------------|-------------|-------------------------------|
| Mistral-7B | 32,768 | **599** | 346.4 | 660 |
| Qwen3-14B | 151,643 | 462 | 272.9 | 512 |
| Llama3.1-8B | 128,000 | 462 | 267.9 | 512 |

**Key Finding**: Mistral-7B requires ~30% more tokens due to its smaller vocabulary size.

---

## Detailed Results by Scenario

### Mistral-7B (`/jfan5/grpo_models/mistral_7b-1127`)

| Scenario | Samples | Max | Mean | Median | P95 | P99 |
|----------|---------|-----|------|--------|-----|-----|
| blocksworld | 500 | 236 | 204.4 | 206 | 230 | 230 |
| ferry | 500 | **599** | 462.5 | 443 | 599 | 599 |
| grippers | 500 | 336 | 263.3 | 261 | 298 | 326 |
| spanner | 500 | 485 | 455.5 | 460 | 485 | 485 |

### Qwen3-14B (`unsloth/Qwen3-14B-unsloth-bnb-4bit`)

| Scenario | Samples | Max | Mean | Median | P95 | P99 |
|----------|---------|-----|------|--------|-----|-----|
| blocksworld | 500 | 175 | 153.4 | 155 | 170 | 171 |
| ferry | 500 | **462** | 353.0 | 338 | 462 | 462 |
| grippers | 500 | 274 | 204.5 | 202 | 234 | 261 |
| spanner | 500 | 407 | 380.6 | 384 | 407 | 407 |

### Llama3.1-8B (`/jfan5/sft_models/llama31_8b/symbolized`)

| Scenario | Samples | Max | Mean | Median | P95 | P99 |
|----------|---------|-----|------|--------|-----|-----|
| blocksworld | 500 | 175 | 153.4 | 155 | 170 | 171 |
| ferry | 500 | **462** | 353.0 | 338 | 462 | 462 |
| grippers | 500 | 274 | 204.5 | 202 | 234 | 261 |
| spanner | 500 | 387 | 360.8 | 364 | 387 | 387 |

---

## Recommended Training Settings

### Mistral-7B
```bash
--max_prompt_length 660
--max_new_tokens 256
# Total max_seq_length >= 916
```

### Qwen3-14B / Llama3.1-8B
```bash
--max_prompt_length 512
--max_new_tokens 256
# Total max_seq_length >= 768
```

---

## Usage

Run the analysis script:
```bash
python test_token_length.py --data_dir /jfan5/grpo_data-127 --model <model_path>
```

Options:
- `--data_dir`: Directory containing JSONL files
- `--file`: Specific file to analyze (optional)
- `--model`: Model name/path for tokenizer
- `--prompt_field`: Field name for prompts (default: "prompt")
- `--response_field`: Field name for responses (default: "response")
