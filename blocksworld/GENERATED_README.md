# Blocksworld Generated Problems

This document describes how the Blocksworld training and testing problem sets were generated.

## Overview
- Two sets are produced:
  - `training_problems`: 1000 problems (default)
  - `testing_problems`: 100 problems (default)
- All problems are unique by content hash within each set and across sets.
- Filenames encode the exact generation parameters:
  - `bw_ops<ops>_n<blocks}_seed<seed>.pddl`
  - Example: `bw_ops4_n6_seed100037.pddl`

## Generator and Domain
- Domain file: `domain.pddl`
- Generator binary: `./blocksworld`
  - Built via `make` in the scenario directory
  - Invocation pattern: `./blocksworld <ops> <num_blocks> <seed>`

## Parameter Ranges
- Training set parameters:
  - ops: `[3, 4]`
  - num_blocks: `[3, 4, 5, 6, 7, 8, 9, 10]`
  - seed range starts at `1` and increases as needed
- Testing set parameters:
  - ops: `[3, 4]`
  - num_blocks: `[3, 4, 5, 6]` (kept smaller to ease solving)
  - seed range starts at `100001` to avoid overlap; uniqueness is still enforced by content hash

## Uniqueness Policy
- During generation, each problem's content is hashed with SHA-256.
- A problem is accepted only if its hash is not already present in the target set and
  (for testing) not in the training set.

## Reproducibility
- The file name records the parameters actually used (ops, blocks, seed).
- Re-running the generator with the same parameters reproduces the same instance.

## How to Regenerate
```bash
# From scenario directory
python3 generate_blocksworld_sets.py              # default 1000/100
python3 generate_blocksworld_sets.py --train 500 --test 50
python3 generate_blocksworld_sets.py --clean --train 1000 --test 100
```

## Notes
- If the generator fails for a particular (ops, blocks, seed), the script skips it and continues.
- The script stops only after reaching the requested counts while preserving uniqueness.

