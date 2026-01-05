# Leaderboard

## Definition of "Best"

- **Primary Metric**: Success Rate (%) on `testing_problem50`
- **Success** = Plan satisfies: (1) correct format, (2) valid preconditions, (3) goal achieved, (4) **all PDDL3 constraints**
- **Evaluation**: Zero-shot, temperature=0.6 (unless noted)

## Current Best Results

### Single-Domain (Blocksworld)

| Rank | Method | Model | Success Rate | Safety Violations | Run ID |
|------|--------|-------|--------------|-------------------|--------|
| 1 | **GRPO** | Mistral-7B | **88.0%** | 4.0% | `20251208_..._grpo...blocksworld-1208-500` |
| 2 | GRPO (dense) | Mistral-7B | 86.0% | 6.0% | `20251208_..._grpo...stl-1208-500` |
| 3 | Gemini-3-Pro | API | 74.0% | 24.0% | - |
| 4 | DPO | Mistral-7B | 70.0% | 12.0% | `20251207_..._dpo...blocksworld-1206` |
| 5 | SFT | Mistral-7B | 66.0% | 10.0% | - |
| 6 | GPT-5.1 | API | 28.0% | 72.0% | - |
| 7 | GPT-5-nano | API | 18.0% | 68.0% | - |

### Cross-Domain (Average over 5 domains)

| Rank | Method | Model | Avg Success | Best Domain | Worst Domain |
|------|--------|-------|-------------|-------------|--------------|
| 1 | SFT | Mistral-7B (`1124`) | **47.2%** | Ferry (76%) | Delivery (0%) |
| 2 | DPO | Qwen3-14B | 37.2% | Spanner (94%) | Blocksworld (18%) |
| 3 | SFT | Qwen3-14B | 35.6% | Spanner (66%) | Delivery (2%) |
| 4 | SFT | GPT-OSS-20B | 15.6% | Spanner (60%) | Blocksworld (2%) |
| 5 | Baseline | All | ~0-3% | - | - |

## By Domain (Best Result per Domain)

| Domain | Best Method | Best Model | Success Rate |
|--------|-------------|------------|--------------|
| Blocksworld | GRPO | Mistral-7B | 88.0% |
| Ferry | SFT | Mistral-7B | 76.0% |
| Spanner | DPO | Qwen3-14B | 94.0% |
| Grippers | SFT | Mistral-7B | 50.0% |
| Delivery | SFT | Qwen3-14B | 2.0% |
| Grid | - | - | TBD |

## API Model Comparison

| Model | Blocksworld | Ferry | Spanner | Grippers | Delivery |
|-------|-------------|-------|---------|----------|----------|
| GPT-5-nano | 18% | 20% | 66% | 94% | 84% |
| GPT-5.1 | 28% | 40% | 100% | 100% | 98% |
| Gemini-3-Pro | 74% | - | - | - | - |

**Note**: API models excel on simpler domains (spanner, grippers) but fail on constraint-heavy domains (blocksworld, ferry) due to safety violations.

## Full Runs Data

For complete run data, see:
```
../leaderboard.csv
```

This CSV is auto-generated from `runs/` and contains:
- `run_id`, `project`, `method`, `base_model`
- `dataset_id`, `dataset_path`, `seed`
- `created_at`, `wandb_url`
- Metrics: `eval/accuracy`, `eval_loss`, `reward`, `train/loss`

## How to Read Leaderboard

1. **run_id** links to `runs/<run_id>/` for full config
2. **wandb_url** links to W&B dashboard for training curves
3. Success rates from `planning_results/` JSON files
4. Safety violations from error classification in evaluation output

---

*Updated: 2025-01-05 | Source: [leaderboard.csv](../leaderboard.csv)*
