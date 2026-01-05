# Project Overview

## Research Background

Classical AI planning (PDDL) has well-defined semantics but requires specialized solvers. Large Language Models (LLMs) can generate plans in natural language but often violate domain constraints and safety requirements.

**PDDL3** extends classical PDDL with **trajectory constraints** (temporal logic over plan states), enabling specification of:
- Safety constraints (`always-not`: forbidden states)
- Ordering constraints (`sometime-before`: temporal ordering)
- Resource constraints (`at-most-once`: occurrence limits)
- Implication constraints (`always-imply`: conditional invariants)

## Research Problem

> Can we fine-tune LLMs to generate plans that satisfy both goal conditions AND safety constraints specified in PDDL3?

### Key Challenges

1. **Constraint Compliance**: LLMs must learn to respect temporal/safety constraints, not just reach goals
2. **Generalization**: Models should generalize across different planning domains
3. **Efficiency**: Fine-tuned 7B models should outperform API-based reasoning models (GPT-5.1) on constrained planning

## Research Goals

1. **Demonstrate** that fine-tuning (SFT/DPO/GRPO) significantly improves constraint compliance over baseline LLMs
2. **Compare** training methods: which is most effective for learning PDDL3 constraints?
3. **Analyze** failure modes: are errors due to precondition violations, safety violations, or goal failures?
4. **Evaluate** cross-domain transfer: do models generalize to unseen planning domains?

## Expected Contributions (Paper)

1. **Benchmark**: PDDL3 planning benchmark with 6 domains and safety constraints
2. **Method Comparison**: Systematic comparison of SFT, DPO, GRPO for constrained planning
3. **Key Finding**: GRPO achieves 88% success rate on blocksworld (vs 28% for GPT-5.1), primarily by reducing safety constraint violations
4. **Analysis**: Fine-tuned models reduce safety violations from 68-72% (API models) to 4-6% (GRPO)

## Planning Domains

| Domain | Main Constraint Type | Difficulty |
|--------|---------------------|------------|
| Blocksworld | `sometime-before` (ordering) | Medium |
| Ferry | `sometime-before` (ordering) | Medium |
| Spanner | `always-imply`, `at-most-once` | Hard |
| Grippers | `always-not` (forbidden states) | Medium |
| Delivery | `always-not` (state combinations) | Hard |
| Grid | `always-not` (forbidden positions) | Medium |

## Related Work

- LLM-based planning (SayCan, Code-as-Policies)
- PDDL3 specification (temporal constraints)
- RLHF/DPO for LLM alignment
- GRPO for reward-based optimization

---

*See [Experiment Design](Experiment-Design.md) for detailed methodology.*
