# Runs Guide

The `runs/` directory is the **experiment ledger** - machine-readable records of all training runs.

## Directory Structure

```
runs/
├── <run_id>/
│   ├── run.json        # Standardized metadata (required)
│   ├── summary.json    # W&B summary snapshot (required)
│   ├── config.json     # Full W&B config (optional)
│   └── files/          # Downloaded files (optional)
├── <run_id>/
│   └── ...
leaderboard.csv         # Aggregated summary of all runs
```

## Run ID Format

```
<date>_<time>_proj-<project>_method-<method>_base-<model>_ds-<dataset>_seed-<seed>_<wandb_id>
```

Example:
```
20251208_141859_proj-pddl-grpo-mistral7b_method-grpo_base-mistral_7b_ds-blocksworld_seed-3407_gdqqcx3e
```

## Linking from Wiki

When referencing a run in documentation, use:

```markdown
See [run `gdqqcx3e`](../runs/20251208_..._gdqqcx3e/)
```

Or link to W&B:
```markdown
[W&B Dashboard](https://wandb.ai/fjl2401-university-of-notre-dame/pddl-grpo-mistral7b/runs/gdqqcx3e)
```

## What's in run.json

```json
{
  "run_id": "...",
  "project": "pddl-grpo-mistral7b",
  "method": "grpo",
  "base_model": "mistral_7b",
  "dataset": {
    "dataset_id": "blocksworld",
    "dataset_path": "/jfan5/grpo_data/..."
  },
  "train": {
    "seed": 3407,
    "lr": 5e-06,
    "batch_size": 4,
    "max_steps": 500
  },
  "wandb": {
    "url": "https://wandb.ai/..."
  }
}
```

## What NOT to Put in Wiki

- Raw config values (already in `runs/<run_id>/config.json`)
- Metrics that change (already in `runs/<run_id>/summary.json`)
- File paths (may change between machines)

Instead, reference the run and let readers look up details.

## Updating Runs

The `runs/` directory is populated by:

```bash
python tools/wandb_runs_exporter.py
```

Options:
- `--overwrite`: Force refresh existing runs
- `--since_days N`: Only export recent runs
- `--leaderboard_only`: Just regenerate CSV

## Finding Runs

### By Method
```bash
ls runs/ | grep "method-grpo"
```

### By Date
```bash
ls runs/ | grep "^202512"  # December 2025 runs
```

### By Project
```bash
ls runs/ | grep "proj-pddl-dpo"
```

### Best Runs
Check `leaderboard.csv` or `docs/Leaderboard.md`

## Evaluation Results

Evaluation results live in `planning_results/`, not `runs/`.

Linking evaluation to training:
1. Find model path in evaluation filename
2. Match to run by `base_model` and date

Example:
```
planning_results/blocksworld_-jfan5-grpo_models-mistral_7b-blocksworld-1208-500_50_20251208_141859.json
                              ↑ model path matches run
```

## W&B Projects

| Project | Method | Models |
|---------|--------|--------|
| `pddl-finetune` | SFT | Various |
| `pddl-dpo-mistral7b` | DPO | Mistral-7B |
| `pddl-grpo-mistral7b` | GRPO | Mistral-7B |
| `pddl-grpo-qwen3_14b` | GRPO | Qwen3-14B |
| `pddl-grpo-llama31-8b` | GRPO | Llama3.1-8B |

---

*This is a reference guide. Don't duplicate run data here - link to `runs/` instead.*
