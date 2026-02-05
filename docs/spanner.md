# Spanner Domain - Hard Dataset Generation

This document describes the pipeline for generating harder Spanner domain problems with PDDL3 constraints that effectively increase difficulty for LLM planners.

## Problem Analysis

The original `sft_500` dataset had uneven difficulty distribution:
- 273 problems (54.6%): s3-n3-l4
- 102 problems (20.4%): s4-n3-l4
- 73 problems (14.6%): s3-n2-l4
- 52 problems (10.4%): s2-n2-l3

**Issues**: Parameters too small (max s=4, n=3, l=5), constraints not challenging enough, models easily achieve 100% success rate.

## Solution: 4-Phase Pipeline (Updated 2026-02-05)

### Phase 1: Source PDDL2 Problems

Source problems from `all_problems/` directory (7000 problems with PDDL2 solutions).

Difficulty tiers:

| Tier | Spanners | Nuts | Locations | Count |
|------|----------|------|-----------|-------|
| 1 | 3 | 2 | 5 | 1400 |
| 2 | 4 | 3 | 5 | 1400 |
| 3 | 5 | 4 | 6 | 1400 |
| 4 | 5 | 5 | 7 | 1400 |
| 5 | 6 | 5 | 8 | 1400 |

### Phase 2: Convert to PDDL3 with Constraints

```bash
python3 convert_training_to_pddl3.py \
    --input all_problems --output all_problems3 \
    --constraint-style spanner-invalidating
```

**Key mechanism**: `--constraint-style spanner-invalidating` generates two constraints:

1. **`always imply`**: Reverses the nut-tightening order from the PDDL2 solution
2. **`at-most-once`**: Man can only visit shed once

Example constraint block:
```lisp
(:constraints
  (and
    (always (imply (not (tightened nut1)) (not (tightened nut2))))
    (forall (?m - man) (at-most-once (at ?m shed)))
  )
)
```

The `always imply` constraint means: as long as `nut1` is NOT tightened, `nut2` must also NOT be tightened. This forces `nut1` to be tightened **before** `nut2`, invalidating the original PDDL2 solution which tightened them in the opposite order.

### Phase 3: Filter, Solve, and Validate

Use the all-in-one script:

```bash
python3 convert_and_filter_all.py
```

This script performs:
1. **Convert**: all_problems → all_problems3 with PDDL3 constraints
2. **Filter**: Verify original PDDL2 solutions FAIL on PDDL3 problems (100% should fail)
3. **Solve**: Use OPTIC to solve all PDDL3 problems
4. **Validate**: Keep only problems with valid OPTIC solutions

Results (2026-02-05):
| Step | Count |
|------|-------|
| Original problems | 7000 |
| After PDDL3 conversion | 7000 |
| PDDL2 solutions invalidated | 7000 (100%) |
| OPTIC solved | 7000 |
| Validation passed | 2722 (38.9%) |

### Phase 4: Uniform Difficulty Selection

```bash
python3 select_problems.py
```

Selects problems with uniform distribution across difficulty levels:

| Directory | Total | Per Difficulty |
|-----------|-------|----------------|
| `sft_500` | 500 | 100 |
| `grpo_500` | 500 | 100 |
| `testing_problem200` | 200 | 40 |
| `testing_problem50` | 50 | 10 |

To create testing_problem50 from testing_problem200:
```python
# In Python or as separate script
# Sample 10 problems per difficulty level from testing_problem200
```

## Output Directories

| Directory | Problems | Solutions | Purpose |
|-----------|----------|-----------|---------|
| `pddl3/spanner/all_problems3/` | 2722 | 2722 | All valid PDDL3 problems |
| `pddl3/spanner/sft_500/` | 500 | 500 | SFT training |
| `pddl3/spanner/grpo_500/` | 500 | 500 | GRPO training |
| `pddl3/spanner/testing_problem200/` | 200 | 200 | Testing (large) |
| `pddl3/spanner/testing_problem50/` | 50 | 50 | Testing (small) |

Each output directory has **uniform** difficulty distribution:

| Tier | Parameters | sft_500 | grpo_500 | testing_200 | testing_50 |
|------|------------|---------|----------|-------------|------------|
| 1 | s3-n2-l5 | 100 | 100 | 40 | 10 |
| 2 | s4-n3-l5 | 100 | 100 | 40 | 10 |
| 3 | s5-n4-l6 | 100 | 100 | 40 | 10 |
| 4 | s5-n5-l7 | 100 | 100 | 40 | 10 |
| 5 | s6-n5-l8 | 100 | 100 | 40 | 10 |

## Constraint Types

The Spanner domain uses two constraint types:

### 1. Always Imply (Order Enforcement)
```lisp
(always (imply (not (tightened nut1)) (not (tightened nut2))))
```
Meaning: Until `nut1` is tightened, `nut2` cannot be tightened. Forces `nut1` before `nut2`.

### 2. At-Most-Once (Visit Restriction)
```lisp
(forall (?m - man) (at-most-once (at ?m shed)))
```
Meaning: Each man can only be at the shed once (must collect all needed spanners in one trip).

### Why These Constraints Work

1. **Order Inversion**: PDDL2 solutions tighten nuts in a natural order. The `always imply` constraint forces the **opposite** order.
2. **Shed Restriction**: Prevents trivial solutions that return to shed multiple times.
3. **LLM Challenge**: Models must understand constraint semantics to generate valid plans.

## Scripts Reference

| Script | Purpose |
|--------|---------|
| `pddl3/spanner/convert_training_to_pddl3.py` | Add PDDL3 constraints (supports multiple styles) |
| `pddl3/spanner/convert_and_filter_all.py` | Full pipeline: convert, filter, solve, validate |
| `pddl3/spanner/select_problems.py` | Select uniform distribution across difficulties |
| `pddl3/spanner/generate_spanner_hard.sh` | Generate harder PDDL2 problems |

## Full Pipeline Commands

```bash
cd /home/jfan5/Safety-gen/pddl3/spanner

# Step 1: Convert all_problems to PDDL3, filter, solve with OPTIC, validate
python3 convert_and_filter_all.py

# Step 2: Select uniform distribution for training/testing sets
python3 select_problems.py

# Step 3: (Optional) Create smaller testing set
python3 -c "
import os, re, shutil, random
from pathlib import Path
from collections import defaultdict

random.seed(42)
TESTING_200 = Path('testing_problem200')
TESTING_50 = Path('testing_problem50')

def parse_difficulty(f):
    m = re.match(r'spanner-s(\d+)-n(\d+)-l(\d+)', f)
    return f's{m.group(1)}-n{m.group(2)}-l{m.group(3)}' if m else None

by_diff = defaultdict(list)
for p in TESTING_200.glob('*.pddl'):
    d = parse_difficulty(p.name)
    if d: by_diff[d].append(p)

if TESTING_50.exists(): shutil.rmtree(TESTING_50)
TESTING_50.mkdir()

for diff in sorted(by_diff.keys()):
    probs = by_diff[diff].copy()
    random.shuffle(probs)
    for p in probs[:10]:
        shutil.copy(p, TESTING_50)
        shutil.copy(p.with_suffix('.soln'), TESTING_50)
print(f'Created testing_problem50: {len(list(TESTING_50.glob(\"*.pddl\")))} problems')
"
```

## Results (2026-02-05)

| Phase | Result |
|-------|--------|
| Source problems | 7000 in all_problems |
| PDDL3 conversion | 7000 converted |
| PDDL2 invalidation | 7000/7000 (100% fail constraints) |
| OPTIC solving | 7000/7000 solved |
| Validation | 2722/7000 (38.9% pass) |
| Final datasets | 500 sft + 500 grpo + 200 test + 50 test |

## Notes

- OPTIC solves all problems but ~61% of solutions violate the `always imply` constraint
- Only problems with fully validated OPTIC solutions are kept
- All datasets have disjoint problems (no overlap between sft/grpo/testing)
- Constraint format ensures original PDDL2 solutions are always invalid

## PDDL3 Solution Validation

### Purpose

Validate that solutions in each dataset correctly satisfy PDDL3 constraints. The Spanner domain uses two constraint types:

```lisp
(:constraints
  (and
    (always (imply (not (tightened nut1)) (not (tightened nut2))))
    (forall (?m - man) (at-most-once (at ?m shed)))
  )
)
```

### Current Dataset Status (2026-02-05)

All current datasets contain **valid PDDL3 solutions**:

| Directory | Problems | Valid | Rate |
|-----------|----------|-------|------|
| `sft_500` | 500 | 500 | 100% |
| `grpo_500` | 500 | 500 | 100% |
| `testing_problem200` | 200 | 200 | 100% |
| `testing_problem50` | 50 | 50 | 100% |
| `all_problems3` | 2722 | 2722 | 100% |

### Validation Commands

```bash
cd /home/jfan5/Safety-gen/pddl3/spanner

# Validate a single problem
Validate -v domain3.pddl sft_500/problem.pddl sft_500/problem.soln

# Batch validation using Python script
python3 ../../script/validate_classical_solvers.py \
    --domain domain3.pddl \
    --problems_dir sft_500 \
    --solutions_dir sft_500 \
    --output validation_reports/sft_500_validation.json

# Quick validation check (5 random samples)
for PROB in $(ls sft_500/*.pddl | shuf | head -5); do
    SOLN="${PROB%.pddl}.soln"
    Validate domain3.pddl "$PROB" "$SOLN" 2>&1 | grep -E "(Plan valid|Plan failed)"
done
```

### Dataset Directories

| Directory | Files | Purpose |
|-----------|-------|---------|
| `all_problems3` | 2722 .pddl + 2722 .soln | All valid PDDL3 problems (source pool) |
| `sft_500` | 500 .pddl + 500 .soln | SFT training |
| `grpo_500` | 500 .pddl + 500 .soln | GRPO training |
| `testing_problem200` | 200 .pddl + 200 .soln | Testing (large) |
| `testing_problem50` | 50 .pddl + 50 .soln | Testing (small) |
| `all_problems` | 7000 .pddl + 7000 .soln | Original PDDL2 source (no constraints) |

### Validation Scripts

| Script | Purpose |
|--------|---------|
| `pddl3/spanner/convert_and_filter_all.py` | Full pipeline with integrated validation |
| `script/validate_classical_solvers.py` | Standalone validation script |

---

*Last updated: 2026-02-05*
