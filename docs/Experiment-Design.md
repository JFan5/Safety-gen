# Experiment Design

## Research Questions

1. **RQ1**: Does fine-tuning improve PDDL3 constraint compliance over baseline LLMs?
2. **RQ2**: Which training method (SFT/DPO/GRPO) is most effective?
3. **RQ3**: Do models generalize across planning domains?
4. **RQ4**: What are the main failure modes for each method?

## Training Methods

### SFT (Supervised Fine-Tuning)

- **Input**: (domain, problem, constraints)
- **Output**: Valid plan
- **Loss**: Cross-entropy on plan tokens
- **Strength**: Simple, stable training
- **Weakness**: No explicit constraint feedback

### DPO (Direct Preference Optimization)

- **Input**: (domain, problem, constraints, chosen_plan, rejected_plan)
- **Chosen**: Constraint-satisfying plan
- **Rejected**: Constraint-violating plan
- **Loss**: Preference ranking loss
- **Strength**: Learns from negative examples
- **Weakness**: Requires paired data generation

### GRPO (Group Relative Policy Optimization)

- **Input**: (domain, problem, constraints)
- **Reward**: Based on plan validity + goal + constraint satisfaction
- **Loss**: Reward-weighted policy gradient
- **Strength**: Direct optimization for constraint compliance
- **Weakness**: More complex training, potential instability

## Experimental Setup

### Fixed Variables

| Variable | Value |
|----------|-------|
| Base Model | Mistral-7B-Instruct / Qwen3-14B / Llama3.1-8B |
| Quantization | 4-bit QLoRA |
| LoRA rank | 16 |
| LoRA alpha | 32 |
| Seed | 3407 |
| Evaluation | testing_problem50 (50 problems per domain) |

### Controlled Variables

| Variable | Values Tested |
|----------|---------------|
| Training Method | SFT, DPO, GRPO |
| Dataset | Original, Symbolized, Augmented |
| Training Scope | Single-domain, Cross-domain |
| Max Steps | 300, 500, 1000 |

## Evaluation Protocol

### Metrics

| Metric | Description |
|--------|-------------|
| **Success Rate** | Plans that satisfy goal AND all constraints |
| Precondition Errors | Actions with unsatisfied preconditions |
| Safety Violations | Plans violating `always`/`always-not` constraints |
| Goal Failures | Plans not achieving goal state |
| Format Errors | Unparseable plan output |

### Test Sets

- `testing_problem50`: 50 problems per domain, held out from training
- Complexity varies (e.g., blocksworld: 3-6 blocks)

### Validation

Plans validated using:
1. Syntax checker (PDDL parser)
2. Precondition checker (state tracking)
3. **Constraint checker** (PDDL3 constraint evaluator)
4. Goal checker (final state verification)

## What Counts as an "Experiment"?

### Experiment (New Training Run)

- Different training method
- Different dataset version
- Different base model
- Different hyperparameters (lr, steps)

→ Creates new `runs/<run_id>/`

### Evaluation (Not a New Experiment)

- Re-evaluating existing model on different test set
- Changing evaluation parameters (temperature, one-shot)
- Aggregating results differently

→ Stored in `planning_results/`, linked to model run

## Comparison Baselines

| Baseline | Type | Purpose |
|----------|------|---------|
| Pretrained (no fine-tuning) | Zero-shot | Measure improvement from fine-tuning |
| GPT-5-nano (API) | Commercial | Compare with API reasoning models |
| GPT-5.1 (API) | Commercial | State-of-art reasoning baseline |
| Gemini-3-Pro (API) | Commercial | Alternative commercial baseline |

## Ablation Studies

See [Ablations.md](Ablations.md) for:
- Learning rate sensitivity
- Training steps vs. performance
- Dataset size effects
- Symbolization impact

---

*For specific experiment configurations, see `runs/<run_id>/config.json`*
