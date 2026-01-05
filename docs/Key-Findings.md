# Key Findings

Verified conclusions from experiments. Each finding links to supporting run(s).

## Core Findings

### 1. Fine-tuning dramatically outperforms API models on constrained planning

- **Evidence**: GRPO achieves 88% on blocksworld vs 28% for GPT-5.1
- **Why**: API models struggle with safety constraints (68-72% safety violations)
- **Runs**: `20251208_..._grpo...blocksworld-1208-500`

### 2. GRPO is most effective for reducing safety constraint violations

- **Evidence**: Safety violations drop from 22% (SFT) → 12% (DPO) → **4% (GRPO)**
- **Why**: GRPO directly optimizes for constraint satisfaction via reward signal
- **Runs**: Blocksworld comparison (SFT vs DPO vs GRPO)

### 3. API models fail primarily on safety constraints, not preconditions

| Model | Success | Safety Violations | Precondition Errors |
|-------|---------|-------------------|---------------------|
| GPT-5-nano | 18% | **68%** | 6% |
| GPT-5.1 | 28% | **72%** | 0% |
| Fine-tuned GRPO | 88% | 4% | 4% |

- **Conclusion**: LLMs can follow action preconditions but don't track global constraints over plan trajectory

### 4. Symbolization helps cross-domain generalization

- **Evidence**: Models trained on symbolized data transfer better to unseen domains
- **Why**: Forces learning of planning logic, not domain-specific patterns
- **Status**: Preliminary - more experiments needed

### 5. Delivery domain remains unsolved

- **Evidence**: Best result is 2% (Qwen3-14B SFT)
- **Hypothesis**: Complex state constraint combinations (`always-not` on state pairs) are difficult to learn
- **Runs**: All cross-domain experiments

## Method-Specific Findings

### SFT Findings

- Simple and stable training
- Good baseline, ~40-50% cross-domain average
- Struggles with complex constraint combinations
- Better with larger models (Qwen3-14B > Mistral-7B on some domains)

### DPO Findings

- Marginal improvement over SFT in most cases
- Qwen3-14B + DPO achieves 94% on spanner (best single result)
- Requires quality chosen/rejected pairs - garbage in, garbage out
- **Run**: `paper_results_iccps2025/qwen3-14b/dpo/spanner_test_results.json`

### GRPO Findings

- Best single-domain results (88% blocksworld)
- More training steps generally help
- Can be unstable - needs careful hyperparameter tuning
- STL (dense) reward signal slightly worse than sparse reward
- **Runs**: `pddl-grpo-mistral7b` project runs

## Domain-Specific Findings

### Blocksworld (`sometime-before`)

- GRPO excels at learning ordering constraints
- Success scales with problem size (100% at 3 blocks → 75-82% at 5-6 blocks)

### Spanner (`always-imply`, `at-most-once`)

- Implication constraints well-learned by DPO
- `at-most-once` with `forall` is challenging

### Grippers/Grid (`always-not`)

- "Forbidden state" constraints are learnable
- API models fail because they don't track global state

### Ferry (`sometime-before`)

- Similar to blocksworld
- Ordering constraints need explicit reasoning

### Delivery (`always-not` compound)

- Compound state constraints are hard
- May need specialized training approach

## Negative Results

1. **Phi-4-mini fails to fine-tune**: TorchDynamo data-dependent branching error
2. **10x augmentation not always better**: Diminishing returns past 5x
3. **One-shot prompting doesn't help**: Fine-tuned models perform similarly with/without examples

## Open Questions

- [ ] Does cross-domain GRPO training help delivery?
- [ ] What's the minimum training data for good performance?
- [ ] Can we combine SFT+GRPO (SFT warmup, then GRPO)?

---

*Each finding should be reproducible from linked runs. If you can't reproduce, please update this document.*
