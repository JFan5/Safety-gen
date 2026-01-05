# Safety-Gen Wiki

> **Fine-tuning LLMs for Safe AI Planning with PDDL3 Constraints**

## Current Research Stage

**Phase**: Cross-domain GRPO training with symbolized data
**Focus**: Improving generalization across planning domains while maintaining safety constraint compliance

## Quick Navigation

| Document | Description |
|----------|-------------|
| [Project Overview](Project-Overview.md) | Research background, goals, expected contributions |
| [Datasets](Datasets.md) | Dataset versions, generation logic, naming conventions |
| [Experiment Design](Experiment-Design.md) | SFT/DPO/GRPO comparison, controlled variables |
| [Leaderboard](Leaderboard.md) | Current best results, model comparison |
| [Key Findings](Key-Findings.md) | Verified conclusions with run references |
| [Ablations](Ablations.md) | Hyperparameter sensitivity, evaluation variations |
| [TODO & Roadmap](TODO-Roadmap.md) | Short/mid/long-term tasks |
| [Runs Guide](Runs/README.md) | How to reference experiment runs |

## Current Focus / Blockers

- [ ] **Cross-domain generalization**: GRPO models trained on symbolized data show strong single-domain performance (88% on blocksworld), but cross-domain transfer needs improvement
- [ ] **Delivery domain**: All methods struggle with delivery scenario (0-2% success rate)
- [ ] **Qwen3-14B GRPO**: Training in progress, expected to improve over SFT baseline

## Quick Stats

| Metric | Value |
|--------|-------|
| Total W&B Runs (finished) | 195 |
| Best Single-Domain (Blocksworld) | **88.0%** (GRPO) |
| Best Cross-Domain Average | ~47% (Mistral-7B SFT) |
| Main Evaluation Metric | Success Rate on test_problem50 |

## Recent Updates

- 2025-01-05: Created unified runs/ ledger from W&B
- 2025-12-22: Qwen3-14B GRPO training started
- 2025-12-21: Llama3.1-8B GRPO training completed

---

*Last updated: 2025-01-05*
