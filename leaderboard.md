# PDDL Planning Leaderboard

Generated: 2026-01-25 18:33:25

Total models: 61
Total evaluation records: 330
Domains: blocksworld, delivery, ferry, grid, grippers, rovers, spanner

## Table of Contents

- [gpt-oss-20b](#gpt-oss-20b)
- [llama31-8b](#llama31-8b)
- [mistral-7b](#mistral-7b)
- [qwen3-14b](#qwen3-14b)
- [qwen3-4b](#qwen3-4b)
- [unknown](#unknown)

## gpt-oss-20b

| Model | Method | Eval Type | Blocksworld | Delivery | Ferry | Grippers | Spanner | Avg |
|-------|--------|----------|-----------:|-----------:|-----------:|-----------:|-----------:|----:|
| `/jfan5/sft_models/gpt_oss_20b/four_scenarios500` | sft | PDDL | 2.0% | 2.0% | 4.0% | 10.0% | 60.0% | 15.6% |

## llama31-8b

| Model | Method | Eval Type | Blocksworld | Delivery | Ferry | Grippers | Spanner | Avg |
|-------|--------|----------|-----------:|-----------:|-----------:|-----------:|-----------:|----:|
| `...els/llama3.1-8b-curriculum_v2-all-0110-stl-1000` | grpo | PDDL | 58.0% | 0.0% | 82.0% | 66.0% | 94.0% | 60.0% |
| `/jfan5/sft_models/llama31_8b/symbolized` | sft | PDDL | 52.0% | 0.0% | 80.0% | 66.0% | 92.0% | 58.0% |
| `/jfan5/sft_models/llama31_8b/symbolized_v4` | sft | PDDL | 38.0% | 28.0% | 66.0% | 68.0% | 88.0% | 57.6% |
| `...rpo_models/llama31_8b-symbolized-chat-0106-1000` | grpo | PDDL | 58.0% | 0.0% | 0.0% | 2.0% | 100.0% | 32.0% |
| `...1_8b-stl-blocksworld-20260108_20/checkpoint-360` | grpo | PDDL | 58.0% | - | - | - | - | 58.0% |

## mistral-7b

| Model | Method | Eval Type | Blocksworld | Delivery | Ferry | Grid | Grippers | Spanner | Avg |
|-------|--------|----------|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|----:|
| `/jfan5/sft_models/mistral_7b/symbolized_v3` | sft | PDDL | 66.0% | 0.0% | 86.0% | 0.0% | 82.0% | 88.0% | 53.7% |
| `/jfan5/sft_models/mistral_7b/symbolized_v2` | sft | PDDL | 62.0% | 0.0% | 68.0% | - | 78.0% | 92.0% | 60.0% |
| `..._models/symbolized_v2_five_domain_0109_5a6qtftq` | grpo | PDDL | 0.0% | 0.0% | 96.0% | - | 98.0% | 100.0% | 58.8% |
| `...dels/mistral_7b-curriculum_v2-all-0110-stl-1000` | grpo | PDDL | 0.0% | 0.0% | 96.0% | - | 92.0% | 92.0% | 56.0% |
| `/jfan5/grpo_models/mistral_7b-symbolized-1214` | grpo | PDDL | 48.0% | 0.0% | 76.0% | - | 62.0% | 88.0% | 54.8% |
| `/jfan5/grpo_models/mistral_7b-symbolized-1214-stl` | grpo | PDDL | 46.0% | 0.0% | 70.0% | - | 68.0% | 80.0% | 52.8% |
| `/jfan5/dpo_models/mistral_7b-1207` | dpo | PDDL | 62.0% | 0.0% | 78.0% | - | 52.0% | 52.0% | 48.8% |
| `...dels/grpo_mistral_7b-curriculum_v2-all-0112-stl` | grpo | PDDL | 0.0% | 0.0% | 60.0% | - | 80.0% | 98.0% | 47.6% |
| `/jfan5/grpo_models/mistral_7b-1207` | grpo | PDDL | 48.0% | 0.0% | 68.0% | - | 38.0% | 46.0% | 40.0% |
| `...o_models/mistral_7b-curriculum_v2-0109-stl-1000` | grpo | PDDL | 0.0% | 0.0% | 72.0% | - | 48.0% | 76.0% | 39.2% |
| `/jfan5/grpo_models/mistral_7b-1207-500` | grpo | PDDL | 42.0% | 0.0% | 66.0% | - | 38.0% | 46.0% | 38.4% |
| `...grpo_models/mistral_7b-symbolized-0106-stl-1000` | grpo | PDDL | 4.0% | 0.0% | 8.0% | - | 90.0% | 50.0% | 30.4% |
| `...grpo_models/mistral_7b-symbolized-1219-stl-1000` | grpo | PDDL | 4.0% | 0.0% | 2.0% | - | 6.0% | 70.0% | 16.4% |
| `...rpo_models/mistral_7b-symbolized-chat-0106-1000` | grpo | PDDL | 6.0% | 0.0% | 0.0% | - | 16.0% | 38.0% | 12.0% |
| `..._models/mistral_7b/four_scenarios500_randomized` | sft | PDDL | 6.0% | 2.0% | 0.0% | - | 6.0% | 8.0% | 4.4% |
| `...stral_7b/four_scenarios500_randomized_augmented` | sft | PDDL | 0.0% | 0.0% | 0.0% | - | 6.0% | 2.0% | 1.6% |
| `/jfan5/sft_models/mistral_7b/four_scenarios500` | sft | PDDL | 46.0% | - | 72.0% | - | 18.0% | 54.0% | 47.5% |
| `/jfan5/dpo_models/mistral_7b-1129` | dpo | PDDL | - | 0.0% | 60.0% | - | 18.0% | 52.0% | 32.5% |
| `..._7b-symbolized-chat-v2-0107-1000/checkpoint-720` | grpo | PDDL | 0.0% | - | 80.0% | - | - | - | 40.0% |
| `/jfan5/grpo_models/mistral_7b-symbolized-1212` | grpo | PDDL | 72.0% | 0.0% | - | - | - | - | 36.0% |
| `...n5/grpo_models/mistral_7b-blocksworld-stl-121-2` | grpo | PDDL | 100.0% | - | - | - | - | - | 100.0% |
| `/jfan5/grpo_models/mistral_7b-blocksworld-1208-500` | grpo | PDDL | 88.0% | - | - | - | - | - | 88.0% |
| `...grpo_models/mistral_7b-blocksworld-stl-1208-500` | grpo | PDDL | 86.0% | - | - | - | - | - | 86.0% |
| `...n5/grpo_models/mistral_7b-blocksworld-stl-121-1` | grpo | PDDL | 86.0% | - | - | - | - | - | 86.0% |
| `/jfan5/grpo_models/mistral_7b-blocksworld-stl-121/` | grpo | PDDL | 82.0% | - | - | - | - | - | 82.0% |
| `/jfan5/grpo_models/mistral_7b-blocksworld-stl-1221` | grpo | PDDL | 82.0% | - | - | - | - | - | 82.0% |
| `/jfan5/grpo_models/mistral_7b-blocksworld-1207` | grpo | PDDL | 80.0% | - | - | - | - | - | 80.0% |
| `/jfan5/grpo_models/mistral_7b-blocksworld-stl-1207` | grpo | PDDL | 74.0% | - | - | - | - | - | 74.0% |
| `/jfan5/grpo_models/mistral_7b-ferry-1129` | grpo | PDDL | - | - | 72.0% | - | - | - | 72.0% |
| `/jfan5/dpo_models/mistral_7b-blocksworld-1206` | dpo | PDDL | 70.0% | - | - | - | - | - | 70.0% |
| `...tral_7b-symbolized-0109-stl-1000/checkpoint-300` | grpo | PDDL | 70.0% | - | - | - | - | - | 70.0% |
| `/jfan5/sft_models/mistral_variant-blocksworld` | sft | PDDL | 66.0% | - | - | - | - | - | 66.0% |
| `/jfan5/grpo_models/mistral_7b-blocksworld-stl-121` | grpo | PDDL | 66.0% | - | - | - | - | - | 66.0% |
| `/jfan5/dpo_models/mistral_7b-blocksworld-1206-1` | dpo | PDDL | 62.0% | - | - | - | - | - | 62.0% |
| `/jfan5/grpo_models/mistral_variant-blocksworld` | sft | PDDL | 60.0% | - | - | - | - | - | 60.0% |
| `/jfan5/grpo_models/mistral_7b-blocksworld-stl-1130` | grpo | PDDL | 54.0% | - | - | - | - | - | 54.0% |
| `...t_models/mistral_7b_blocksworld_symbolized-1222` | sft | PDDL | 40.0% | - | - | - | - | - | 40.0% |
| `/jfan5/sft_models/mistral_7b_blocksworld_simple` | sft | PDDL | 32.0% | - | - | - | - | - | 32.0% |
| `/jfan5/sft_models/mistral_7b/symbolized-delivery` | sft | PDDL | - | 12.0% | - | - | - | - | 12.0% |
| `...n5/sft_models/mistral_7b/symbolized-delivery-v4` | sft | PDDL | - | 8.0% | - | - | - | - | 8.0% |
| `...po_models/mistral_7b_blocksworld/checkpoint-100` | sft | PDDL | 0.0% | - | - | - | - | - | 0.0% |
| `/jfan5/sft_models/mistral_variant-grid` | sft | PDDL | - | - | - | 0.0% | - | - | 0.0% |

## qwen3-14b

| Model | Method | Eval Type | Blocksworld | Delivery | Ferry | Grid | Grippers | Spanner | Avg |
|-------|--------|----------|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|----:|
| `..._models/qwen3_14b/cross_domain_pddl3_symbolized` | sft | PDDL | 76.0% | 6.0% | 90.0% | 0.0% | 92.0% | 100.0% | 60.7% |
| `...odels/qwen3-14b-curriculum_v2-all-0111-stl-1000` | grpo | JSON, NL, PDDL | 88.0% | 16.0% | 98.0% | - | 98.0% | 100.0% | 80.0% |
| `.../grpo_models/qwen3_14b-symbolized-1221-stl-1000` | grpo | PDDL | 68.0% | 2.0% | 72.0% | - | 92.0% | 96.0% | 66.0% |
| `/jfan5/grpo_models/qwen3_14b-symbolized-1218-1000` | grpo | PDDL | 70.0% | 2.0% | 78.0% | - | 86.0% | 50.0% | 57.2% |
| `/jfan5/sft_models/qwen3-14b-1127` | sft | PDDL | 30.0% | 12.0% | 46.0% | - | 34.0% | 66.0% | 37.6% |
| `...models/qwen3_14b/cross_domain_pddl3_symbolized/` | sft | PDDL | 62.0% | 8.0% | 80.0% | - | - | - | 50.0% |
| `...5/sft_models/qwen3_14b/delivery_symbolized_v3-1` | sft | PDDL | - | 48.0% | - | 0.0% | - | - | 24.0% |
| `...dels/qwen3_14b/cross_domain_pddl3_symbolized-v5` | sft | PDDL | 22.0% | 8.0% | - | - | - | - | 15.0% |
| `...t_models/qwen3_14b/blocksworld_pddl3_symbolized` | sft | PDDL | 62.0% | - | - | - | - | - | 62.0% |
| `/jfan5/sft_models/qwen3_14b/delivery_symbolized_v4` | sft | PDDL | - | 38.0% | - | - | - | - | 38.0% |

## qwen3-4b

| Model | Method | Eval Type | Delivery | Grippers | Spanner | Avg |
|-------|--------|----------|-----------:|-----------:|-----------:|----:|
| `.../sft_models/qwen3-4b-thinking/four_scenarios500` | sft | PDDL | 0.0% | 24.0% | 58.0% | 27.3% |

## unknown

| Model | Method | Eval Type | Blocksworld | Delivery | Ferry | Grid | Grippers | Rovers | Spanner | Avg |
|-------|--------|----------|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|----:|
| `/jfan5/sft_qwen3/bfgs-variant-500` | sft | PDDL | 12.0% | 12.0% | 12.0% | 4.0% | 14.0% | 0.0% | 50.0% | 14.9% |
| `/jfan5/dpo_qwen3/bfgs-variant-500` | sft | PDDL | 2.0% | - | - | - | - | - | - | 2.0% |
