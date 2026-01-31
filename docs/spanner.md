# Spanner Domain - Hard Dataset Generation

This document describes the pipeline for generating harder Spanner domain problems with PDDL3 constraints that effectively increase difficulty for LLM planners.

## Problem Analysis

The original `sft_500` dataset had uneven difficulty distribution:
- 273 problems (54.6%): s3-n3-l4
- 102 problems (20.4%): s4-n3-l4
- 73 problems (14.6%): s3-n2-l4
- 52 problems (10.4%): s2-n2-l3

**Issues**: Parameters too small (max s=4, n=3, l=5), constraints not challenging enough, models easily achieve 100% success rate.

## Solution: 5-Phase Pipeline

### Phase 1: Generate Harder PDDL2 Problems

New difficulty tiers with uniform distribution:

| Tier | Spanners | Nuts | Locations | Count |
|------|----------|------|-----------|-------|
| 1 | 3 | 2 | 5 | 1400 |
| 2 | 4 | 3 | 5 | 1400 |
| 3 | 5 | 4 | 6 | 1400 |
| 4 | 5 | 5 | 7 | 1400 |
| 5 | 6 | 5 | 8 | 1400 |

**Script**: `pddl3/spanner/generate_spanner_hard.sh`

### Phase 2: Solve PDDL2 Problems

```bash
python3 ../../script/solve_problems_optic.py all_problems domain.pddl 60
```

Remove unsolved problems:
```bash
for f in all_problems/*.pddl; do [ ! -f "${f%.pddl}.soln" ] && rm -f "$f"; done
```

### Phase 3: Convert to PDDL3 with Constraints

```bash
python3 convert_training_to_pddl3.py \
    --input all_problems --output all_problems3 \
    --invert-order-from-plan --invert-count 2
```

**Key mechanism**: `--invert-order-from-plan` generates `sometime-before` constraints that force a **different** nut-tightening order than the original PDDL2 solution.

Example: If PDDL2 solution tightens nuts in order `nut4 -> nut3 -> nut2 -> nut1`, the script generates:
```lisp
(:constraints
  (and
    (sometime-before (tightened nut1) (tightened nut4))
    (sometime-before (tightened nut2) (tightened nut4))
  )
)
```

This forces `nut1` and `nut2` to be tightened **before** `nut4`, invalidating the original solution.

### Phase 4: Validate PDDL3 Problems

**Step 4a**: Solve PDDL3 problems with constraints
```bash
python3 ../../script/solve_problems_optic.py all_problems3 domain3.pddl 120
```

**Step 4b**: Validate that PDDL2 solutions violate constraints
```bash
python3 ../../script/validate_spanner_pddl3.py all_problems3 all_problems all_problems3_validated
```

**Script**: `script/validate_spanner_pddl3.py`
- Checks PDDL3 solution exists (problem is solvable with constraints)
- Verifies original PDDL2 solution violates the `sometime-before` constraints
- Keeps only problems where constraints make a difference

### Phase 5: Uniform Difficulty Selection

```bash
python3 ../../script/select_uniform_difficulty.py all_problems3_validated \
    --sft-dir sft_500 --grpo-dir grpo_500 --test-dir testing_200
```

**Script**: `script/select_uniform_difficulty.py`

## Output Directories

| Directory | Problems | Solutions | Purpose |
|-----------|----------|-----------|---------|
| `pddl3/spanner/sft_500/` | 500 | 500 | SFT training |
| `pddl3/spanner/grpo_500/` | 500 | 500 | GRPO training |
| `pddl3/spanner/testing_200/` | 200 | 200 | Testing |

Each output directory has **uniform** difficulty distribution:

| Tier | Parameters | sft_500 | grpo_500 | testing_200 |
|------|------------|---------|----------|-------------|
| 1 | s3-n2-l5 | 100 | 100 | 40 |
| 2 | s4-n3-l5 | 100 | 100 | 40 |
| 3 | s5-n4-l6 | 100 | 100 | 40 |
| 4 | s5-n5-l7 | 100 | 100 | 40 |
| 5 | s6-n5-l8 | 100 | 100 | 40 |

## Constraint Types

The Spanner domain uses `sometime-before` constraints on nut-tightening order:

```lisp
(sometime-before (tightened nutA) (tightened nutB))
```

Meaning: `nutA` must be tightened at some point **before** `nutB` is tightened.

### Why Order Inversion Works

1. Classical planners (OPTIC) naturally tighten nuts in a specific order based on spanner locations
2. By inverting this order, we force the planner to find an alternative path
3. LLMs must understand the constraint semantics to generate valid plans

## Scripts Reference

| Script | Purpose |
|--------|---------|
| `pddl3/spanner/generate_spanner_hard.sh` | Generate 7000 harder PDDL2 problems |
| `pddl3/spanner/convert_training_to_pddl3.py` | Add PDDL3 constraints (with order inversion) |
| `script/validate_spanner_pddl3.py` | Filter problems where constraints matter |
| `script/select_uniform_difficulty.py` | Select uniform distribution across tiers |
| `script/solve_problems_optic.py` | Batch solve with OPTIC planner |

## Execution Commands

Full pipeline:
```bash
cd /home/jfan5/Safety-gen/pddl3/spanner

# Phase 1: Generate problems
./generate_spanner_hard.sh

# Phase 2: Solve PDDL2
python3 ../../script/solve_problems_optic.py all_problems domain.pddl 60
for f in all_problems/*.pddl; do [ ! -f "${f%.pddl}.soln" ] && rm -f "$f"; done

# Phase 3: Convert to PDDL3
python3 convert_training_to_pddl3.py \
    --input all_problems --output all_problems3 \
    --invert-order-from-plan --invert-count 2

# Phase 4: Solve and validate PDDL3
python3 ../../script/solve_problems_optic.py all_problems3 domain3.pddl 120
python3 ../../script/validate_spanner_pddl3.py all_problems3 all_problems all_problems3_validated

# Phase 5: Select uniform distribution
python3 ../../script/select_uniform_difficulty.py all_problems3_validated \
    --sft-dir sft_500 --grpo-dir grpo_500 --test-dir testing_200
```

## Results (2026-01-30)

| Phase | Result |
|-------|--------|
| Phase 1 | 7000 problems generated |
| Phase 2 | 7000/7000 solved (100%) |
| Phase 3 | 7000 converted to PDDL3 |
| Phase 4a | 7000/7000 PDDL3 solved (100%) |
| Phase 4b | 7000/7000 validated (constraints effective) |
| Phase 5 | 500 SFT + 500 GRPO + 200 test selected |

## Notes

- Tier 1 (s3-n2-l5) has only 2 nuts, so `invert-order-from-plan` doesn't add constraints (requires nuts > 2). These problems are kept without additional constraints.
- The `--invert-count 2` parameter adds 2 order-inversion constraints per problem for problems with 3+ nuts.
- OPTIC timeout: 60s for PDDL2, 120s for PDDL3 (constraints increase search complexity).

---

*Last updated: 2026-01-30*
