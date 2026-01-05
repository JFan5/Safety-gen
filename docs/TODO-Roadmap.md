# TODO & Roadmap

## Short-term (1-2 weeks)

### High Priority

- [ ] **Complete Qwen3-14B GRPO training** - In progress, check W&B
- [ ] **Evaluate cross-domain GRPO models** on all 6 domains
- [ ] **Fix delivery domain** - Try domain-specific training or different constraint encoding
- [ ] **Run Llama3.1-8B evaluation** - Training completed, need eval results

### Medium Priority

- [ ] Aggregate all evaluation results into `planning_results_aggregated.json`
- [ ] Regenerate missing trainer metrics (Mistral spanner PDDL3)
- [ ] Verify symbolization improves cross-domain transfer (controlled experiment)

### Low Priority

- [ ] Clean up `planning_results/` directory naming
- [ ] Add grid domain to standard evaluation suite
- [ ] Document one-shot prompting results

## Mid-term (One Milestone)

### Paper Experiments

- [ ] **Main comparison table**: SFT vs DPO vs GRPO across all domains
- [ ] **Error analysis**: Detailed breakdown of failure modes per method
- [ ] **Scaling analysis**: How does performance scale with training data?
- [ ] **Baseline comparison**: Full comparison with GPT-5.1, Gemini-3-Pro

### Engineering

- [ ] Automate evaluation pipeline (single script for all domains)
- [ ] Add confidence intervals to success rate reports
- [ ] Create visualization for constraint violation types

### Documentation

- [ ] Write paper Methods section
- [ ] Create supplementary materials with hyperparameters
- [ ] Prepare model release (HuggingFace)

## Long-term (Paper/Submission)

### Target Venue

- **Primary**: [Conference TBD]
- **Backup**: [Workshop/Journal TBD]

### Paper Structure

1. Introduction: LLMs for safe planning
2. Background: PDDL3, fine-tuning methods
3. Method: SFT/DPO/GRPO for constraint learning
4. Experiments: 6 domains, 3 methods, error analysis
5. Results: GRPO achieves 88%, reduces safety violations
6. Discussion: Why does GRPO work? What fails?
7. Conclusion: Fine-tuning > API for constrained planning

### Pre-submission Checklist

- [ ] All claimed results reproducible
- [ ] Ablations complete
- [ ] Error bars / significance tests
- [ ] Code cleaned for release
- [ ] Benchmark datasets prepared

## Unsorted Notes

*(Move unstructured notes here temporarily)*

From old docs:
- Consider trying phi-4 with TorchDynamo disabled
- Investigate why grid PDDL2 shows 0/179 successes
- Confirm VAL validator path on current environment

Ideas to explore:
- Chain-of-thought prompting for constraint reasoning
- Multi-turn interaction for plan repair
- Combining symbolic solver with LLM

---

*Update this regularly. Move completed items to Key-Findings or archive.*
