# Model Training Progress

## Highlights
- LoRA adapters for `unsloth/mistral-7b-instruct-v0.3` are trained across blocksworld, ferry, grid, grippers, rovers, and spanner scenarios for both PDDL2 and PDDL3, with only spanner PDDL3 missing trainer metrics.
- LoRA adapters for `unsloth/qwen3-1.7b` cover the same domains (PDDL2/3) except ferry PDDL2 and spanner PDDL3; eight three-epoch runs are tracked in the local Weights & Biases logs.
- Aggregated blocksworld evaluation shows the PDDL2 adapter solving 55/200 test problems (27.5%) versus 0/200 for the baseline; PDDL3 achieves 15/200 (7.5%). Grid PDDL2 currently reports 0/179 successes.
- Attempts to fine-tune `unsloth/Phi-4-mini-instruct` abort before training because TorchDynamo hits a data-dependent branching error during the initial plan-generation sanity check.

## Detailed Training Status

### Mistral 7B LoRA (`unsloth/mistral-7b-instruct-v0.3`)

| Domain | Variant | Steps | Eval Loss | Notes |
| --- | --- | --- | --- | --- |
| blocksworld | PDDL2 | 357 | 0.0283 | checkpoint-357 (`sft_models/mistral_7b/blocksworld/pddl2`) |
| blocksworld | PDDL3 | 357 | 0.0260 | checkpoint-357 (`sft_models/mistral_7b/blocksworld/pddl3`) |
| ferry | PDDL2 | 357 | 0.0191 | checkpoint-357 (`sft_models/mistral_7b/ferry/pddl2`) |
| ferry | PDDL3 | 357 | 0.0164 | checkpoint-357 (`sft_models/mistral_7b/ferry/pddl3`) |
| grid | PDDL2 | 357 | 0.0081 | checkpoint-357 (`sft_models/mistral_7b/grid/pddl2`) |
| grid | PDDL3 | 357 | 0.0083 | checkpoint-357 (`sft_models/mistral_7b/grid/pddl3`) |
| grippers | PDDL2 | 357 | 0.0245 | checkpoint-357 (`sft_models/mistral_7b/grippers/pddl2`) |
| grippers | PDDL3 | 357 | 0.0180 | checkpoint-357 (`sft_models/mistral_7b/grippers/pddl3`) |
| rovers | PDDL2 | 357 | 0.0067 | checkpoint-357 (`sft_models/mistral_7b/rovers/pddl2`) |
| rovers | PDDL3 | 357 | 0.0067 | checkpoint-357 (`sft_models/mistral_7b/rovers/pddl3`) |
| spanner | PDDL2 | 357 | 0.0323 | checkpoint-357 (`sft_models/mistral_7b/spanner/pddl2`) |
| spanner | PDDL3 | — | — | Adapter files exist but no `trainer_state.json`; metrics need regeneration (`sft_models/mistral_7b/spanner/pddl3`) |

### Qwen3 1.7B LoRA (`unsloth/qwen3-1.7b`)

| Domain | Variant | Steps | Eval Loss | Notes |
| --- | --- | --- | --- | --- |
| blocksworld | PDDL2 | 714 | 0.0216 | checkpoint-714, W&B run `5mw6m1go` |
| blocksworld | PDDL3 | 357 | 0.0265 | checkpoint-357, W&B run `augyhbxk` |
| ferry | PDDL3 | 357 | 0.0264 | checkpoint-357, W&B run `6dxjl7nj` |
| grippers | PDDL2 | 714 | 0.0190 | checkpoint-714, W&B run `9k324app` |
| grippers | PDDL3 | 357 | 0.0268 | checkpoint-357, W&B run `gng7y55m` |
| rovers | PDDL2 | 714 | 0.00005 | checkpoint-714, W&B run `owu36987` |
| rovers | PDDL3 | 357 | 0.00013 | checkpoint-357, W&B run `7ur3zxf1` |
| spanner | PDDL2 | 714 | 0.0259 | checkpoint-714, W&B run `hv94j175` |
| spanner | PDDL3 | — | — | Directory exists but contains no checkpoints; training still pending |

## Evaluation Snapshot

| Domain | Model Tier | Success/Total | Goal Fails | Safety Violations | Notes |
| --- | --- | --- | --- | --- | --- |
| blocksworld | Baseline (`unsloth/Phi-4-mini-instruct`) | 0/200 | 200 | 0 | `planning_results_aggregated.json` |
| blocksworld | Fine-tuned PDDL2 | 55/200 | 1 | 9 | `planning_results/mistral_7b/blocksworld/pddl2` |
| blocksworld | Fine-tuned PDDL3 | 15/200 | 0 | 0 | `planning_results/mistral_7b/blocksworld/pddl3` |
| grid | Fine-tuned PDDL2 | 0/179 | 0 | 0 | Needs investigation; validator path may be missing locally |

## Artifacts & Logs
- LoRA adapters live under `sft_models/`; each variant includes the final checkpoint and tokenizer artifacts.
- Training dashboards and configs are cached in `wandb/run-*/`, containing `config.yaml`, `wandb-summary.json`, and raw logs.
- Slurm/stdout for training and evaluation jobs are under the repo root (`fine_tune_*.o`) and `job_outputs/`.

## Issues & Next Steps
- Rerun phi-4 mini fine-tunes with TorchDynamo disabled (`TORCH_COMPILE=0`) or alternative generation path to bypass the data-dependent branching crash.
- Regenerate trainer metrics for Mistral spanner PDDL3 and complete the missing Qwen spanner PDDL3 run.
- Extend evaluation/aggregation to ferry, grippers, rovers, and spanner so `planning_results_aggregated.json` reflects all trained adapters.
- Confirm the plan validator path (`/users/jfan5/VAL/...`) exists on the current environment before re-running evaluations to avoid false negatives.
