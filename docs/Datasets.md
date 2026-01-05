# Datasets

This document describes dataset versions and generation logic. For specific file paths, see `runs/<run_id>/run.json`.

## Dataset Naming Convention

```
<type>_<domain>_<variant>_<version>
```

- **type**: `sft_data`, `dpo_data`, `grpo_data`
- **domain**: `blocksworld`, `ferry`, `spanner`, `grippers`, `delivery`, `grid`, `four_scenarios`, `cross_domain`
- **variant**: `pddl2`, `pddl3`, `symbolized`, `randomized`, `augmented`
- **version**: date or version number (e.g., `v2`, `1206`)

## SFT Data

### Generation Logic

1. **Problem Generation**: Use PDDL problem generators with varying complexity parameters
2. **Plan Generation**: Solve problems with classical planner (e.g., Fast Downward)
3. **Prompt Construction**: Format as instruction-following pairs (domain + problem + constraints → plan)

### Variants

| Variant | Description |
|---------|-------------|
| `pddl3` | Original PDDL3 problems with natural language constraints |
| `symbolized` | Predicates/actions replaced with generic symbols (p1, a1, o1) |
| `randomized` | Symbol names randomized to prevent memorization |
| `augmented` | Multiple prompt templates per problem (5x-10x data) |

### Typical Sizes

- Per-domain: 500-1000 problems
- Four scenarios combined: 2000-4000 problems
- With augmentation: 10000-20000 samples

## DPO Data

### Generation Logic

1. **Chosen**: Correct plans that satisfy all constraints
2. **Rejected**: Plans that violate constraints (from model samples or perturbation)
   - Safety constraint violations
   - Precondition violations
   - Goal failures

### Source

- Rejected samples: Model-generated plans with validation errors
- Chosen samples: Ground-truth or validator-approved plans

## GRPO Data

### Generation Logic

GRPO uses online generation - model samples plans during training and receives rewards based on:
- Plan validity (parseable, correct format)
- Precondition satisfaction
- Goal achievement
- **Safety constraint compliance** (key differentiator)

### Reward Signal

```
reward = validity_score + goal_score - constraint_violation_penalty
```

## Dataset Versions (High-Level)

| Version | Description | Use Case |
|---------|-------------|----------|
| `four_scenarios500` | 500 problems × 4 domains, 5 prompt variants | SFT baseline |
| `pddl3_symbolized_v2` | Symbolized predicates/actions, 1000 per domain | Cross-domain training |
| `pddl3_symbolized_v3` | Updated symbolization, improved constraint formatting | GRPO training |

## Symbolization

Symbolization replaces domain-specific names with generic symbols:

| Original | Symbolized |
|----------|------------|
| `(on b1 b2)` | `(p4 o1 o2)` |
| `(pickup ?x)` | `(a3 ?x)` |
| `(clear ?x)` | `(p5 ?x)` |

**Purpose**: Force model to learn planning logic, not memorize domain-specific patterns.

## Data Quality Notes

- All training data validated with PDDL validator
- Constraint satisfaction verified before inclusion
- Test sets (`testing_problem50`) are held out - never used in training

---

*For dataset file paths in specific runs, see `runs/<run_id>/run.json` → `dataset.dataset_path`*
