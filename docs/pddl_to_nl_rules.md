# PDDL-to-Natural-Language Conversion Rules

This document describes the conversion rules used by `script/pddl_to_nl.py` to transform PDDL3 problem files into structured natural language descriptions.

## Overview

The conversion tool parses PDDL problem files and generates human-readable descriptions suitable for testing LLM generalization on planning tasks without domain-specific PDDL knowledge.

## Output Format

Each converted file follows this strict template structure:

```
## Title
Problem: {problem_name}

## Domain / Scenario
Domain: {domain_name}

## Objects
{object_type}: {comma-separated list}

## Initial State
- {predicate sentence 1}
- {predicate sentence 2}
...

## Goal
All of the following must be true:
  - {goal predicate 1}
  - {goal predicate 2}
...

## Constraints (PDDL3)
- {constraint description}

## Notes
{optional: parse warnings, unparseable sections}
```

## Predicate Templates by Domain

### Blocksworld

| PDDL Predicate | Natural Language Template |
|----------------|--------------------------|
| `(on X Y)` | Block X is on block Y. |
| `(on-table X)` | Block X is on the table. |
| `(clear X)` | Block X is clear (nothing on top). |
| `(arm-empty)` | The robot arm is empty. |
| `(holding X)` | The robot is holding block X. |

### Ferry

| PDDL Predicate | Natural Language Template |
|----------------|--------------------------|
| `(at-ferry X)` | The ferry is at location X. |
| `(at X Y)` | X is at location Y. |
| `(on X)` / `(on-ferry X)` | X is on the ferry. |
| `(empty-ferry)` | The ferry is empty. |
| `(location X)` | X is a valid location. |
| `(car X)` | X is a car. |
| `(not-eq X Y)` | X and Y are different locations. |

### Grippers

| PDDL Predicate | Natural Language Template |
|----------------|--------------------------|
| `(at-robby R X)` | Robot R is at room X. |
| `(at X Y)` | Object X is at room Y. |
| `(free R G)` | Gripper G of robot R is free. |
| `(carry R O G)` | Robot R is carrying object O with gripper G. |

### Spanner

| PDDL Predicate | Natural Language Template |
|----------------|--------------------------|
| `(at X Y)` | X is at location Y. |
| `(carrying M S)` | Man M is carrying S. |
| `(useable X)` | Spanner X is useable. |
| `(link X Y)` | Location X is connected to location Y. |
| `(tightened X)` | Nut X is tightened. |
| `(loose X)` | Nut X is loose. |

### Delivery

| PDDL Predicate | Natural Language Template |
|----------------|--------------------------|
| `(at X Y)` | X is at cell Y. |
| `(carrying T P)` | Truck T is carrying package P. |
| `(in P T)` | Package P is in truck T. |
| `(empty T)` | Truck T is empty. |
| `(adjacent X Y)` | Cell X is adjacent to cell Y. |
| `(last T C)` | Truck T was last at cell C. |
| `(road X Y)` | There is a road from X to Y. |
| `(delivered P)` | Package P has been delivered. |

### Unknown Predicates

For predicates not in the template table, the tool uses this fallback format:
```
{predicate}({arg1}, {arg2}, ...) is true.
```

## Constraint Templates

The tool uses a recursive AST-based parser to handle complex nested constraints.

### sometime-before

**PDDL:**
```pddl
(sometime-before (on-table b2) (on-table b1))
```

**Natural Language:**
```
Before "block b2 is on the table" becomes true, "block b1 is on the table" must be true at some point.
```

### always

**PDDL:**
```pddl
(always (arm-empty))
```

**Natural Language:**
```
At all times during the plan, the robot arm is empty must hold.
```

### always with imply

**PDDL:**
```pddl
(always (imply (not (tightened nut1)) (not (tightened nut2))))
```

**Natural Language:**
```
At all times during the plan, if it is not the case that nut nut1 is tightened, then it is not the case that nut nut2 is tightened must hold.
```

### always-not

**PDDL:**
```pddl
(always (not (holding b1)))
```

**Natural Language:**
```
At all times during the plan, it is not the case that the robot is holding block b1 must hold.
```

### at-most-once

**PDDL:**
```pddl
(at-most-once (holding b1))
```

**Natural Language:**
```
"The robot is holding block b1" is allowed to become true at most once during the entire plan.
```

### forall (quantified constraints)

**PDDL:**
```pddl
(forall (?m - man) (at-most-once (at ?m shed)))
```

**Natural Language (for small sets, expands):**
```
For bob: "bob is at location shed" is allowed to become true at most once during the entire plan.
```

### always with forall

**PDDL:**
```pddl
(always (forall (?b - object) (not (carry robot1 ?b rgripper1))))
```

**Natural Language:**
```
At all times during the plan, for ball1: it is not the case that robot robot1 is carrying object ball1 with gripper rgripper1; for ball2: it is not the case that robot robot1 is carrying object ball2 with gripper rgripper1; ... must hold.
```

### Compound and/not constraints

**PDDL:**
```pddl
(always (and (not (and (last t1 c_0_0) (at t1 c_0_1))) (not (and (last t1 c_0_1) (at t1 c_0_0)))))
```

**Natural Language:**
```
At all times during the plan, it is not the case that truck t1 was last at cell c_0_0 and t1 is at cell c_0_1 and it is not the case that truck t1 was last at cell c_0_1 and t1 is at cell c_0_0 must hold.
```

## Parsing Rules

### Object Extraction

Objects are extracted from the `:objects` section. The parser handles:
- **Untyped objects**: `b1 b2 b3` (common in blocksworld)
- **Typed objects**: `bob - man spanner1 spanner2 - spanner`

For typed objects, objects are grouped by type in the output:
```
Man: bob
Spanner: spanner1, spanner2
```

### Init/Goal Parsing

1. Uses balanced parenthesis matching to find section boundaries
2. Extracts individual predicates via regex: `\(\s*([\w\-]+)([^)]*)\)`
3. Handles `(and ...)` wrapper in goal section

### Constraint Parsing

Uses a recursive S-expression parser to build an AST. Supported PDDL3 trajectory constraints:
- `(sometime-before P Q)` - Q must be true at some point before P becomes true
- `(always P)` - P must be true in every state
- `(always (not P))` - P must never be true
- `(always (imply A B))` - If A then B, in every state
- `(at-most-once P)` - P transitions to true at most once
- `(forall (?x - type) C)` - For all objects of type, constraint C holds
- `(and C1 C2 ...)` - All constraints must hold
- `(not P)` - Negation
- `(imply A B)` - Implication

## Error Handling

| Situation | Behavior |
|-----------|----------|
| Missing section | Skip with warning in Notes section |
| Parse failure | Preserve raw PDDL reference in Notes |
| Unknown predicate | Use generic template |
| Encoding error | Try UTF-8, fallback to latin-1 |

## CLI Usage

```bash
# Convert directory (default: copies .pddl and .soln files for evaluation)
python script/pddl_to_nl.py --input pddl3/blocksworld/testing_problem50/

# Convert single file
python script/pddl_to_nl.py --input path/to/problem.pddl

# Recursive conversion with verbose output
python script/pddl_to_nl.py --input pddl3/ --recursive --verbose

# Dry run (parse without writing)
python script/pddl_to_nl.py --input pddl3/blocksworld/testing_problem50/ --dry-run

# Custom output directory
python script/pddl_to_nl.py --input pddl3/blocksworld/testing_problem50/ -o output/nl/

# Convert without copying accompanying files
python script/pddl_to_nl.py --input pddl3/blocksworld/testing_problem50/ --no-copy-pddl --no-copy-soln

# Generate NL problems for all domains (shell script)
./shells/generate_nl_all.sh testing_problem50
```

### File Copy Options

By default, `pddl_to_nl.py` copies accompanying files to the output directory:

| Flag | Default | Description |
|------|---------|-------------|
| `--copy-pddl` / `--no-copy-pddl` | True | Copy original `.pddl` files (needed for validation) |
| `--copy-soln` / `--no-copy-soln` | True | Copy corresponding `.soln` files (ground truth solutions) |

These files are required for NL-mode evaluation (`--nl-mode` in `evaluate_llm_solver_batch.py`).

## Example Conversion

### Input: `bw_ops3_n3_seed183.pddl`

```pddl
(define (problem BW-rand-3)
(:domain blocksworld)
(:objects b1 b2 b3 )
(:init (arm-empty) (on-table b1) (on b2 b3) (on-table b3) (clear b1) (clear b2))
(:goal (and (on-table b1) (on-table b2) (on-table b3)))
(:constraints (sometime-before (on-table b2) (on-table b1)))
)
```

### Output: `testing_problems_nl/bw_ops3_n3_seed183.txt`

```
## Title
Problem: BW-rand-3

## Domain / Scenario
Domain: blocksworld

## Objects
Blocks: b1, b2, b3

## Initial State
- The robot arm is empty.
- Block b1 is on the table.
- Block b2 is on block b3.
- Block b3 is on the table.
- Block b1 is clear (nothing on top).
- Block b2 is clear (nothing on top).

## Goal
All of the following must be true:
  - Block b1 is on the table.
  - Block b2 is on the table.
  - Block b3 is on the table.

## Constraints (PDDL3)
- Before "block b2 is on the table" becomes true, "block b1 is on the table" must be true at some point.
```

### Complex Example: Spanner Domain

### Input: `spanner-s2-n2-l3-s320501427.pddl`

```pddl
(define (problem spanner-s2-n2-l3-s320501427)
 (:domain spanner)
 (:objects
     bob - man
     spanner1 spanner2 - spanner
     nut1 nut2 - nut
     location1 location2 location3 - location
     shed gate - location
    )
 (:init ...)
 (:goal (and (tightened nut1) (tightened nut2)))
(:constraints
  (and
    (always (imply (not (tightened nut1)) (not (tightened nut2))))
    (forall (?m - man) (at-most-once (at ?m shed)))
  )
)
)
```

### Output:

```
## Objects
Man: bob
Spanner: spanner1, spanner2
Nut: nut1, nut2
Location: location1, location2, location3, shed, gate

## Constraints (PDDL3)
- At all times during the plan, if it is not the case that nut nut1 is tightened, then it is not the case that nut nut2 is tightened must hold.
- For bob: "bob is at location shed" is allowed to become true at most once during the entire plan.
```

## Extending the Tool

### Adding a New Domain

1. Add predicate templates to `NLTemplates` class in `pddl_to_nl.py`:

```python
NEW_DOMAIN = {
    "predicate-name": "template with {0} and {1} placeholders",
    ...
}
```

2. Register in `DOMAIN_TEMPLATES`:

```python
DOMAIN_TEMPLATES = {
    ...
    "new-domain": NEW_DOMAIN,
}
```

### Adding New Constraint Types

Add to the `op_map` in `parse_sexpr()` function and add handling in `ConstraintNLGenerator.expr_to_nl()` method.
