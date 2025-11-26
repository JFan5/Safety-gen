# Jobs Directory Organization

## Overview
This directory contains all job scripts for model training, evaluation, and data generation. All scripts have been standardized for easy maintenance and review.

## Directory Structure
```
jobs/
├── mistral_7b/          # Mistral-7B model jobs
│   ├── fine_tune/       # Fine-tuning jobs
│   ├── dpo/             # DPO training jobs
│   ├── grpo/            # GRPO training jobs
│   ├── ppo/             # PPO training jobs
│   ├── evaluate/        # Model evaluation jobs
│   └── generate_candidates/  # Candidate generation jobs
├── gpt_oss_20b/         # GPT-OSS-20B model jobs
├── qwen3-14b/           # Qwen3-14B model jobs
└── mistral_unsloth/     # Mistral-Unsloth jobs
```

## Standardization
All job files have been standardized with:
1. **Unified header format**: Consistent SGE directives
2. **Hardcoded parameters**: All variables replaced with literal values
3. **Error handling**: `set -euo pipefail` for robust error handling
4. **Path consistency**: All scripts use `/home/ubuntu/Safety-gen` as base directory
5. **Clear comments**: Descriptive comments for each script section

## Variable Handling
- **Task arrays**: Variables like `${SGE_TASK_ID}`, `${scenario_name}`, `${PROBLEMS_DIR}`, etc. are preserved in task array jobs (e.g., `multi_scenarios/baseline.job`) as they are necessary for parallel execution.
- **All other variables**: Replaced with hardcoded values for clarity and maintainability.

## Script Types

### Fine-tuning (`fine_tune/`)
- Single scenario fine-tuning (blocksworld, delivery, spanner)
- Multi-scenario fine-tuning
- PDDL2 and PDDL3 variants

### DPO Training (`dpo/`)
- Direct Preference Optimization training
- Single and multi-scenario configurations
- Various dataset sizes (500, 600, etc.)

### GRPO Training (`grpo/`)
- Generative Reinforcement Learning with Policy Optimization
- Single and multi-GPU configurations

### Evaluation (`evaluate/`)
- Baseline model evaluation
- Fine-tuned model evaluation
- DPO model evaluation
- Single and multi-scenario evaluations

### Candidate Generation (`generate_candidates/`)
- Generate and score candidate solutions
- Used for DPO dataset construction

## Usage
All scripts are ready to use with `qsub`:
```bash
qsub jobs/mistral_7b/fine_tune/blocksworld/pddl3.job
```

## Maintenance
- All parameters are hardcoded for easy review
- Scripts follow consistent naming conventions
- Output paths are standardized
- Job names are descriptive and unique
