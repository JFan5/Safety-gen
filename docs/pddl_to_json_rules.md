# PDDL to JSON Conversion Rules

This document describes the JSON schema used by `script/pddl_to_json.py` to convert PDDL3 domain and problem files into structured JSON format.

## Overview

The PDDL to JSON converter transforms PDDL files into machine-readable JSON format that can be used for:
- Training LLMs on structured planning tasks
- Evaluating LLM generalization from symbolic to JSON representation
- Programmatic analysis of planning problems

## JSON Schema Reference

### Domain JSON

Domain files are converted to the following structure:

```json
{
  "type": "domain",
  "name": "blocksworld",
  "requirements": ["strips", "constraints", "negative-preconditions"],
  "types": {
    "locatable": "object",
    "man": "locatable",
    "spanner": "locatable"
  },
  "constants": {},
  "predicates": [
    {
      "name": "on",
      "parameters": [
        {"var": "?x", "type": "block"},
        {"var": "?y", "type": "block"}
      ]
    }
  ],
  "actions": [
    {
      "name": "stack",
      "parameters": [
        {"var": "?ob", "type": "block"},
        {"var": "?underob", "type": "block"}
      ],
      "precondition": {"and": [...]},
      "effect": {"and": [...]}
    }
  ]
}
```

#### Domain Fields

| Field | Type | Description |
|-------|------|-------------|
| `type` | string | Always `"domain"` |
| `name` | string | Domain name (e.g., "blocksworld") |
| `requirements` | string[] | PDDL requirements (e.g., "strips", "typing") |
| `types` | object | Type hierarchy mapping type -> parent_type |
| `constants` | object | Domain constants (rarely used) |
| `predicates` | array | Predicate definitions |
| `actions` | array | Action definitions |

### Problem JSON

Problem files are converted to the following structure:

```json
{
  "type": "problem",
  "name": "BW-rand-3",
  "domain": "blocksworld",
  "objects": {
    "block": ["b1", "b2", "b3"],
    "location": ["loc1", "loc2"]
  },
  "init": [
    {"pred": "arm-empty", "args": [], "negated": false},
    {"pred": "on-table", "args": ["b1"], "negated": false},
    {"pred": "on", "args": ["b2", "b1"], "negated": false}
  ],
  "goal": {
    "and": [
      {"pred": "on-table", "args": ["b1"], "negated": false},
      {"pred": "on", "args": ["b3", "b2"], "negated": false}
    ]
  },
  "constraints": {
    "sometime_before": [
      {"pred": "on-table", "args": ["b2"], "negated": false},
      {"pred": "on-table", "args": ["b1"], "negated": false}
    ]
  }
}
```

#### Problem Fields

| Field | Type | Description |
|-------|------|-------------|
| `type` | string | Always `"problem"` |
| `name` | string | Problem name |
| `domain` | string | Associated domain name |
| `objects` | object | Objects grouped by type |
| `init` | array | Initial state predicates |
| `goal` | object | Goal formula |
| `constraints` | object | PDDL3 trajectory constraints (optional) |

## Formula JSON Mapping

### Atomic Predicates

```
PDDL: (at bob shed)
JSON: {"pred": "at", "args": ["bob", "shed"], "negated": false}

PDDL: (not (holding block1))
JSON: {"pred": "holding", "args": ["block1"], "negated": true}
```

### Logical Operators

| PDDL | JSON |
|------|------|
| `(and P Q ...)` | `{"and": [{P}, {Q}, ...]}` |
| `(or P Q ...)` | `{"or": [{P}, {Q}, ...]}` |
| `(not P)` | `{"not": {P}}` or `{P, "negated": true}` |
| `(imply P Q)` | `{"imply": [{P}, {Q}]}` |

### Quantifiers

```
PDDL: (forall (?x - type) (pred ?x))
JSON: {
  "forall": {
    "vars": [{"var": "?x", "type": "type"}],
    "body": {"pred": "pred", "args": ["?x"], "negated": false}
  }
}

PDDL: (exists (?x - type) (pred ?x))
JSON: {
  "exists": {
    "vars": [{"var": "?x", "type": "type"}],
    "body": {"pred": "pred", "args": ["?x"], "negated": false}
  }
}
```

## PDDL3 Constraints Mapping

PDDL3 trajectory constraints are converted as follows:

| PDDL Constraint | JSON |
|-----------------|------|
| `(always P)` | `{"always": {P}}` |
| `(sometime P)` | `{"sometime": {P}}` |
| `(sometime-before P Q)` | `{"sometime_before": [{P}, {Q}]}` |
| `(sometime-after P Q)` | `{"sometime_after": [{P}, {Q}]}` |
| `(at-most-once P)` | `{"at_most_once": {P}}` |
| `(at-end P)` | `{"at_end": {P}}` |
| `(within n P)` | `{"within": [n, {P}]}` |
| `(hold-during t1 t2 P)` | `{"hold_during": [t1, t2, {P}]}` |
| `(hold-after t P)` | `{"hold_after": [t, {P}]}` |

### Example: Complex Constraint

```
PDDL:
(and
  (always (imply (not (tightened nut1)) (not (tightened nut2))))
  (forall (?m - man) (at-most-once (at ?m shed)))
)

JSON:
{
  "and": [
    {
      "always": {
        "imply": [
          {"pred": "tightened", "args": ["nut1"], "negated": true},
          {"pred": "tightened", "args": ["nut2"], "negated": true}
        ]
      }
    },
    {
      "forall": {
        "vars": [{"var": "?m", "type": "man"}],
        "body": {
          "at_most_once": {
            "pred": "at", "args": ["?m", "shed"], "negated": false
          }
        }
      }
    }
  ]
}
```

## Effect JSON (with conditional effects)

Effects in actions can include conditional effects using `when`:

```json
{
  "and": [
    {"pred": "holding", "args": ["?ob"], "negated": false},
    {"pred": "arm-empty", "args": [], "negated": true},
    {
      "when": {
        "condition": {"pred": "fragile", "args": ["?ob"], "negated": false},
        "effect": {"pred": "broken", "args": ["?ob"], "negated": false}
      }
    }
  ]
}
```

## CLI Usage Examples

### Convert Problem Files

```bash
# Convert all problems in a directory
python script/pddl_to_json.py --input pddl3/blocksworld/testing_problem50/

# Convert a single file
python script/pddl_to_json.py --input pddl3/blocksworld/testing_problem50/bw_ops3_n3_seed118.pddl

# Specify output directory
python script/pddl_to_json.py --input pddl3/blocksworld/testing_problem50/ \
    --output-dir custom/output/
```

### Convert Domain Files

```bash
# Convert domain file
python script/pddl_to_json.py --domain-file pddl3/blocksworld/domain3.pddl

# Convert problems and domain together
python script/pddl_to_json.py --input pddl3/blocksworld/testing_problem50/ --convert-domain
```

### Batch Conversion

```bash
# Convert all 5 domains
./shells/generate_json_all.sh testing_problem50
```

### CLI Options

| Option | Description |
|--------|-------------|
| `--input, -i` | Input file or directory |
| `--domain-file, -d` | Domain PDDL file to convert |
| `--output-dir, -o` | Output directory (default: `testing_problems_json/`) |
| `--recursive, -r` | Process subdirectories (default: True) |
| `--verbose, -v` | Enable verbose output |
| `--dry-run` | Parse without writing files |
| `--copy-pddl` | Copy original .pddl files (default: True) |
| `--copy-soln` | Copy solution files (default: True) |
| `--indent` | JSON indentation level (default: 2) |
| `--compact` | Output compact JSON without indentation |

## Integration with Evaluation Pipeline

The JSON files can be used with the evaluation pipeline:

```bash
# Evaluate model on JSON problems
./shells/evaluate_llm_all_batch_json.sh runs/grpo/<run_id> testing_problem50 8 8

# Evaluate with domain JSON mode
./shells/evaluate_llm_all_batch_json.sh runs/grpo/<run_id> testing_problem50 8 8 --domain-json-mode
```

The evaluation script uses `--json-mode` flag to enable JSON input parsing.

## Output Directory Structure

```
pddl3/blocksworld/
├── domain3.pddl                    # Original domain
├── domain3.json                    # Generated domain JSON
├── testing_problem50/
│   ├── bw_ops3_n3_seed118.pddl     # Original problem
│   ├── bw_ops3_n3_seed118.soln     # Ground truth solution
│   └── testing_problems_json/      # Generated JSON
│       ├── bw_ops3_n3_seed118.json # Problem JSON
│       ├── bw_ops3_n3_seed118.pddl # Copied for validation
│       └── bw_ops3_n3_seed118.soln # Copied for validation
```

## Supported Domains

The converter supports all 5 planning domains in the project:

| Domain | Constraint Types | Notes |
|--------|-----------------|-------|
| Blocksworld | `sometime-before` | Stack/unstack blocks |
| Ferry | `sometime-before` | Transport cars |
| Spanner | `always-imply`, `at-most-once` | Tighten nuts with spanners |
| Grippers | `always-not` | Transport balls with grippers |
| Delivery | `always-not` (compound) | Package delivery |

## Round-trip Notes

- The JSON format preserves all semantic information from the PDDL
- Variable names (e.g., `?x`) are preserved exactly
- Type information is preserved in the `types` field
- Constraint ordering is preserved
- Original PDDL files are copied alongside JSON for validation

## Comparison with NL Format

| Feature | JSON Format | NL Format |
|---------|-------------|-----------|
| Machine readable | Yes | Partially |
| Human readable | Limited | Yes |
| Preserves structure | Exact | Approximate |
| Output extension | `.json` | `.txt` |
| Output directory | `testing_problems_json/` | `testing_problems_nl/` |
