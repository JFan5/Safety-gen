# docs/ Wiki Guide

This directory contains human-readable documentation for the Safety-Gen project. Machine-readable experiment data lives in `runs/`.

## Directory Structure

```
docs/
├── README.md              # This file - how to use the Wiki
├── Home.md                # Entry point, daily landing page
├── Project-Overview.md    # Background, research goals
├── Datasets.md            # Dataset versions and logic
├── Experiment-Design.md   # Methodology, controlled variables
├── Leaderboard.md         # Current best results
├── Key-Findings.md        # Verified conclusions
├── Ablations.md           # Hyperparameter sensitivity
├── TODO-Roadmap.md        # Task tracking
├── Runs/
│   └── README.md          # How to reference runs
└── archive/               # Old documentation (preserved)
```

## Where to Put New Content

| Content Type | Location |
|--------------|----------|
| New verified conclusion | `Key-Findings.md` |
| New experimental result | `Leaderboard.md` (update table) |
| Hyperparameter observation | `Ablations.md` |
| New task / TODO | `TODO-Roadmap.md` |
| Dataset change | `Datasets.md` |
| Methodology update | `Experiment-Design.md` |
| Unstructured notes | `TODO-Roadmap.md` → "Unsorted Notes" |

## Content Guidelines

### Do

- Link to run IDs for reproducibility
- Use tables for comparisons
- Keep entries concise (bullet points)
- Update when experiments complete
- Mark conclusions as "preliminary" if not fully verified

### Don't

- Copy raw configs (reference `runs/<run_id>/config.json`)
- Hard-code file paths (they change between machines)
- Write lengthy prose (this is a Wiki, not a paper)
- Create new .md files without reason (use existing structure)

## Workflow

### After Training a New Model

1. Export to runs/: `python tools/wandb_runs_exporter.py`
2. Run evaluation
3. Update `Leaderboard.md` if result is notable
4. Add finding to `Key-Findings.md` if conclusion is new

### After Evaluation Run

1. Note result in `Leaderboard.md` or `Ablations.md`
2. Update `Key-Findings.md` if it changes a conclusion

### After Paper Discussion

1. Update `TODO-Roadmap.md` with new tasks
2. Update `Project-Overview.md` if scope changes

## Archived Documentation

Old documentation is preserved in `archive/`. Key files:

| File | Content |
|------|---------|
| `readme_en.md` | Original experiment results table |
| `FINAL_SUMMARY.md` | Randomization training guide |
| `domain_constraints.md` | PDDL3 constraint type analysis |
| `training_progress.md` | Early training status |

Reference archive files for historical context, but keep new content in main Wiki structure.

## Maintenance

- **Home.md**: Update "Current Focus" weekly
- **Leaderboard.md**: Regenerate from `leaderboard.csv` when runs change
- **TODO-Roadmap.md**: Review and clean up monthly

update leaderboard: 

---

*Questions? Check `Home.md` first, then ask.*
