# Planning Results Layout

This folder now groups every planning run by the base model family to keep comparisons and batch processing simple.

## Directory map
- **qwen/**
  - `Qwen3-14B`
  - `qwen3-14b_multi_pddl3`
  - `qwen3_14b-multi-dpo-pddl3-500-gpt-candidate-4bit`
  - `qwen3_multi_pddl3`
- **gpt/**
  - `gpt_oss_20b`
  - `gpt_oss_20b-multi-dpo-pddl3-500-gpt-candidate-4bit`
- **mistral/**
  - `dpo_mistral_7b-multi-gpt-candidate`
  - `dpo_mistral_7b-multi-gpt-candidate-500`
  - `dpo_mistral_7b-multi-gpt-candidate-500-16bit`
  - `mistral_7b`
  - `sft_mistral_7b`
  - `sft_mistral_7b_multi`

## Handy commands
Run these from the repo root (`/home/ubuntu/Safety-gen`).

```bash
# Aggregate per model family
python script/parse_planning_results.py --aggregate-existing \
  --planning-results-dir planning_results/qwen \
  --aggregate-output planning_results/qwen_results.json

python script/parse_planning_results.py --aggregate-existing \
  --planning-results-dir planning_results/gpt \
  --aggregate-output planning_results/gpt_results.json

python script/parse_planning_results.py --aggregate-existing \
  --planning-results-dir planning_results/mistral \
  --aggregate-output planning_results/mistral_results.json

# Aggregate everything together (uses the nested layout automatically)
python script/parse_planning_results.py --aggregate-existing \
  --planning-results-dir planning_results \
  --aggregate-output planning_results/all_models.json

# Visualize any aggregated file
python visualize_planning_results.py --input planning_results/qwen_results.json \
  --output-dir plots/qwen
```

Adjust the `--planning-results-dir` or `--input` arguments if you add new model families or want to visualize different aggregates.
