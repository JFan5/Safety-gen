# Ablations & Sensitivity Analysis

This document records observations from hyperparameter variations and evaluation changes. These are NOT new experiments - just variations on existing runs.

## Hyperparameter Sensitivity

### Learning Rate

| LR | Method | Domain | Effect |
|----|--------|--------|--------|
| 1e-6 | DPO | All | Standard, stable |
| 5e-6 | GRPO | All | Standard for GRPO |
| 1e-5 | SFT | All | Sometimes unstable |

**Observation**: Lower LR (1e-6) more stable for DPO; GRPO tolerates 5e-6.

### Training Steps (GRPO)

| Steps | Blocksworld Success | Notes |
|-------|---------------------|-------|
| 300 | ~82% | Quick experiment |
| 500 | **88%** | Sweet spot |
| 1000 | ~86% | Slight overfit? |

**Observation**: 500 steps appears optimal for single-domain GRPO on blocksworld.

### Batch Size / Gradient Accumulation

| Per-device BS | Grad Accum | Effective BS | Effect |
|---------------|------------|--------------|--------|
| 4 | 4 | 16 | Standard SFT |
| 4 | 8 | 32 | Standard DPO/GRPO |

**Observation**: GRPO benefits from larger effective batch size.

## Dataset Variations

### Symbolization Impact

| Dataset | Cross-domain Avg | Single-domain |
|---------|------------------|---------------|
| Original (named) | 47% | 66% |
| Symbolized | TBD | TBD |

**Status**: Full comparison pending.

### Augmentation Multiplier

| Multiplier | Training Samples | Effect |
|------------|------------------|--------|
| 1x | 2000 | Baseline |
| 5x | 10000 | +5-10% improvement |
| 10x | 20000 | Diminishing returns |

**Observation**: 5x augmentation is cost-effective.

## Evaluation Variations

### Temperature

| Temperature | Effect |
|-------------|--------|
| 0.0 | Deterministic, sometimes worse |
| 0.6 | Standard, balanced |
| 1.0 | More diverse, slightly lower avg |

**Observation**: Temperature 0.6 is robust default.

### One-shot vs Zero-shot

| Prompting | Effect |
|-----------|--------|
| Zero-shot | Standard for fine-tuned |
| One-shot | Marginal improvement for baseline |

**Observation**: Fine-tuned models don't benefit from one-shot.

### Checkpoint Selection

| Checkpoint | Notes |
|------------|-------|
| Final | Usually best |
| Best eval loss | Sometimes better for DPO |
| Intermediate | Rarely useful |

## Reward Signal (GRPO)

### Sparse vs Dense Reward

| Reward Type | Blocksworld |
|-------------|-------------|
| Sparse (binary success) | **88%** |
| Dense (STL-based) | 86% |

**Observation**: Surprisingly, sparse reward slightly better. Dense reward may cause reward hacking.

### Reward Components

| Component | Weight | Effect |
|-----------|--------|--------|
| Goal satisfaction | 1.0 | Must have |
| Constraint satisfaction | 1.0 | Key differentiator |
| Plan length penalty | 0.1 | Minor |

## Model Size

| Model | Parameters | Best Single-domain | Notes |
|-------|------------|-------------------|-------|
| Mistral-7B | 7B | 88% (GRPO) | Most experiments |
| Qwen3-14B | 14B | 94% (DPO) | On spanner |
| GPT-OSS-20B | 20B | 60% | Underperforms size |

**Observation**: Model size helps but method matters more.

## LoRA Configuration

| Parameter | Value | Notes |
|-----------|-------|-------|
| Rank | 16 | Standard |
| Alpha | 32 | Standard |
| Dropout | 0.05 | Slight regularization |

**Observation**: Default LoRA config works well; no extensive tuning done.

## Unsorted Observations

- Training on PDDL2 (no constraints) transfers poorly to PDDL3
- Longer max sequence length (4096) didn't help significantly
- Gradient checkpointing essential for 14B models on single GPU

---

*Add new ablation observations here. Link to runs when relevant.*
