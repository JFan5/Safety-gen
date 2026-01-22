# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Safety-Gen is a research project for fine-tuning LLMs (Mistral-7B, Qwen3-14B, Llama3.1-8B) to generate safe AI plans that satisfy PDDL3 constraints. The project compares SFT (Supervised Fine-Tuning), DPO (Direct Preference Optimization), and GRPO (Group Relative Policy Optimization) for constrained planning.

**Key result**: GRPO achieves 88% success on blocksworld with only 4% safety violations (vs 28% for GPT-5.1 with 72% violations).

## Build & Run Commands

### Training

```bash
# SFT Training
python pddl_finetune.py --mode train --model <base_model> --dataset <dataset_path> --output <output_name> --family mistral

# GRPO Training (recommended)
python script/train_grpo_unsloth_stl_v2.py \
    --base_model <model_path> \
    --data_root data_randomized/ \
    --output_dir runs/ \
    --batch_size 8 \
    --max_steps 1000

# DPO Training
python script/train_dpo_unsloth.py --base_model <model_path> --dataset <dpo_dataset> --output_dir <output>
```

### Evaluation

```bash
# Evaluate model on a domain
python script/evaluate_llm_solver.py \
    --model-path runs/<run_id>/model_dir \
    --base-model mistral-7b \
    --domain blocksworld \
    --problems-dir pddl3/blocksworld/testing_problem50/

# Batch evaluation across models
python script/evaluate_llm_solver_batch.py --models-dir <models> --domains blocksworld,ferry,spanner

# Evaluate API models (GPT, Gemini)
python script/evaluate_api_llm_solver.py --model gpt-5 --domain blocksworld
python script/evaluate_gemini_solver.py --model gemini-3-pro --domain blocksworld
```

### Dataset Construction

```bash
# Build GRPO training pairs
python script/construct_grpo_dataset.py --scored-path <scored_summaries.json> --output-path data/grpo_train.jsonl

# Build DPO preference pairs
python script/construct_dpo_dataset.py --input <candidates> --output <dpo_dataset>
```

## Architecture

### Directory Structure

```
script/                    # Main Python scripts
├── train_*.py             # Training (SFT, DPO, GRPO, PPO)
├── evaluate_*.py          # Model evaluation
├── construct_*.py         # Dataset construction
├── generate_*.py          # Problem/data generation
├── compare_*.py           # Analysis and comparison
└── utils/                 # Utilities (validation.py, run_manager.py, run_registry.py)

runs/                      # Experiment tracking (machine-readable)
└── <YYYYMMDD>_proj-*_method-*_base-*_ds-*_seed-*_<id>/
    ├── config.json        # Full training config
    ├── run.json           # Metadata (wandb_url, status)
    ├── model_dir/         # Trained LoRA adapter
    └── evals/             # Evaluation results

docs/                      # Human-readable documentation
├── Home.md                # Project landing page
├── Project-Overview.md    # Research background
├── Experiment-Design.md   # Methodology
└── Leaderboard.md         # Current best results

pddl3/                     # PDDL3 domain files
├── blocksworld/
├── ferry/
├── spanner/
├── grippers/
└── delivery/

data_randomized/           # Training datasets (symbolized PDDL)
planning_results/          # Evaluation output JSONs
jobs/                      # SLURM job scripts
```

### Key Components

1. **Run Management** (`script/utils/run_manager.py`): `RunContext` manages training lifecycle - setup, train, finalize. All runs output to `runs/<run_id>/`.

2. **Plan Validation** (`script/utils/validation.py`): Four-stage validation - syntax, preconditions, PDDL3 constraints, goals. Used for both evaluation and GRPO rewards.

3. **GRPO V2 Curriculum** (`script/train_grpo_unsloth_stl_v2.py`): Implements difficulty-based curriculum learning with domain-balanced batching.

4. **Output Extraction** (`pddl_finetune.py:extract_llm_output()`): Handles different model output formats (Mistral, Llama, Qwen, GPT-OSS).

### Training Methods

| Method | Script | Key Feature |
|--------|--------|-------------|
| SFT | `pddl_finetune.py` | Cross-entropy on valid plans |
| DPO | `script/train_dpo_unsloth.py` | Preference learning (chosen vs rejected) |
| GRPO | `script/train_grpo_unsloth_stl_v2.py` | Online RL with validity/constraint rewards |

### Evaluation Metrics

- **Success Rate**: Plans satisfying goal AND all constraints
- **Precondition Errors**: Invalid action preconditions
- **Safety Violations**: PDDL3 constraint violations (`always`, `always-not`)
- **Goal Failures**: Goal state not achieved
- **Format Errors**: Unparseable output

## Key Configuration

- **Max sequence length**: 4096 (training), 5000 (evaluation)
- **Max new tokens**: 512 (training), 1024 (evaluation)
- **LoRA**: rank=16, alpha=32 (can be overridden via args)
- **Quantization**: 4-bit QLoRA via unsloth/bitsandbytes
- **Seed**: 3407

## Dependencies

Core: `unsloth`, `transformers`, `trl`, `torch`, `datasets`, `peft`, `bitsandbytes`, `wandb`

External tools: VAL (PDDL validator), Fast Downward (classical planner for ground truth)

## Planning Domains

| Domain | Main Constraints | Notes |
|--------|-----------------|-------|
| Blocksworld | `sometime-before` | Medium difficulty |
| Ferry | `sometime-before` | Medium difficulty |
| Spanner | `always-imply`, `at-most-once` | Hard |
| Grippers | `always-not` | Medium difficulty |
| Delivery | `always-not` (compound) | Very hard (0-2% success) |

## Model Families

When using `--family` flag:
- `mistral`: Mistral models (default)
- `llama`: Llama-3.x models
- `qwen`: Qwen models (removes `<think>` tags)
- `gpt-oss`: GPT-OSS/DeepSeek-R1 (supports `--reasoning` effort)
