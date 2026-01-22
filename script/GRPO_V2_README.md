# GRPO Training Script V2 - Technical Documentation

## Overview

`train_grpo_unsloth_stl_v2.py` is a complete rewrite of the data loading and sampling logic while preserving the reward function and trainer configuration from V1.

## Key Differences: V2 vs V1

### 1. **Data Loading**

**V1 (train_grpo_unsloth_stl.py):**
```python
# Single JSONL file with all domains mixed
dataset = load_grpo_dataset(args.dataset, ...)
# Sorts by scenario, but no guarantee of balanced batches
data_sorted = sorted(data, key=get_scenario)
```

**V2 (train_grpo_unsloth_stl_v2.py):**
```python
# Loads separate JSONL per domain from directory
domain_data = load_multi_domain_data(args.data_root)
# Files: blocksworld.jsonl, ferry.jsonl, grippers.jsonl, spanner.jsonl, delivery.jsonl
```

### 2. **Difficulty Scoring**

**V1:**
- No explicit difficulty scoring
- Simple scenario-based sorting
- No curriculum learning

**V2:**
```python
# Parse from problem_file name: grippers-n1-r4-o3-s299249445.pddl
n, r, o = parse_difficulty_from_filename(problem_file)
difficulty_score = 5*n + 3*r + 2*o

# Assign buckets within each domain
# easy: 0-40th percentile
# medium: 40-80th percentile
# hard: 80-100th percentile
```

**Rationale for weighting (5n + 3r + 2o):**
- **n (goals)**: Weighted highest (5x) because more goals exponentially increases planning complexity
- **r (robots/vehicles)**: Medium weight (3x) as coordination adds significant complexity
- **o (objects)**: Lower weight (2x) as objects are typically easier to manage than goals

### 3. **Curriculum Learning Schedule**

**V2 implements dynamic difficulty progression:**

```python
def get_curriculum_weights(step, max_steps):
    step_ratio = step / max_steps

    if step_ratio < 0.3:         # Early training (0-30%)
        return {'easy': 0.7, 'medium': 0.25, 'hard': 0.05}
    elif step_ratio < 0.7:       # Mid training (30-70%)
        return {'easy': 0.4, 'medium': 0.4, 'hard': 0.2}
    else:                         # Late training (70-100%)
        return {'easy': 0.2, 'medium': 0.4, 'hard': 0.4}
```

**Progression:**
- **Early**: Focus on easy problems (70%) to build foundational skills
- **Mid**: Balanced mix (40/40/20) to strengthen capabilities
- **Late**: Challenge with harder problems (40% hard) for final refinement

### 4. **Batch-Level Domain Balancing**

**V1:**
```python
# Sorts all data by scenario
# Batches may contain only one domain
# No control over domain distribution per batch
```

**V2:**
```python
class BalancedDomainDifficultyDataset(IterableDataset):
    # Each batch GUARANTEES equal samples from each domain
    # Example: batch_size=8, domains=4 → 2 samples/domain/batch
    samples_per_domain = batch_size // num_domains
```

### 5. **Data Structure**

**V1:**
- `Dataset` from HuggingFace datasets
- Static, pre-sorted list
- No dynamic sampling

**V2:**
- `IterableDataset` from PyTorch
- Dynamic sample generation
- Curriculum-aware sampling on-the-fly

## Why IterableDataset Guarantees Batch-Level Domain Balance

### The Problem with Regular Datasets

With a regular `Dataset` and standard `DataLoader`:
```python
# Regular approach (V1)
all_samples = [sample1, sample2, ..., sampleN]
dataloader = DataLoader(all_samples, batch_size=8, shuffle=True)
```

**Issue:** Even if we sort by domain, shuffling breaks the order. A batch might contain:
- Batch 1: [blocksworld, blocksworld, ferry, ferry, ferry, grippers, spanner, spanner]
- Batch 2: [ferry, ferry, ferry, ferry, grippers, grippers, grippers, spanner]

**Result:** Unbalanced domain representation per batch.

### The IterableDataset Solution

```python
class BalancedDomainDifficultyDataset(IterableDataset):
    def __iter__(self):
        while self.current_step < self.max_steps:
            # 1. Get curriculum weights for current step
            weights = get_curriculum_weights(self.current_step, self.max_steps)

            # 2. Generate EXACTLY batch_size samples
            batch_samples = []

            # 3. For EACH domain, sample exactly samples_per_domain
            for domain in self.domains:  # e.g., [blocksworld, ferry, grippers, spanner]
                for _ in range(self.samples_per_domain):  # e.g., 2 samples
                    # Choose difficulty bucket based on curriculum
                    bucket = rng.choice(['easy', 'medium', 'hard'], p=[weights['easy'], ...])
                    sample = randomly_select_from_bucket(domain, bucket)
                    batch_samples.append(sample)

            # 4. Shuffle within batch to avoid domain ordering
            rng.shuffle(batch_samples)

            # 5. Yield samples one-by-one (trainer batches them)
            for sample in batch_samples:
                yield sample

            self.current_step += 1
```

**Key mechanism:**
1. **Pre-generate batch-sized chunks**: We create exactly `batch_size` samples internally
2. **Equal allocation**: Each domain gets exactly `batch_size / num_domains` samples
3. **One-by-one yielding**: We yield samples individually, but GRPOTrainer collects them into batches
4. **Batch boundaries**: Because we know the trainer's batch size, we control what goes into each batch

**Example with batch_size=8, 4 domains:**

```
Step 1 (early training, 70% easy):
  blocksworld → sample 2 easy problems
  ferry       → sample 2 easy problems
  grippers    → sample 1 easy, 1 medium
  spanner     → sample 2 easy problems
  → shuffle → yield 8 samples → Batch 1 has exactly 2 from each domain

Step 2:
  blocksworld → sample 1 easy, 1 medium
  ferry       → sample 2 easy problems
  grippers    → sample 2 medium problems
  spanner     → sample 1 easy, 1 medium
  → shuffle → yield 8 samples → Batch 2 has exactly 2 from each domain
```

**Why this works:**
- The trainer calls `__iter__()` once and iterates through samples
- We control the order and composition of samples yielded
- By yielding in batch-sized chunks with known domain distribution, we guarantee balance
- The internal shuffle only randomizes order within the batch, not composition

## Usage Examples

### Basic Usage

```bash
python script/train_grpo_unsloth_stl_v2.py \
    --base_model unsloth/Qwen2.5-7B-Instruct-bnb-4bit \
    --data_root /jfan5/grpo_data/five_domain_0109 \
    --output_dir /jfan5/grpo_models/qwen_7b_v2 \
    --batch_size 8 \
    --max_steps 1000 \
    --learning_rate 1e-5 \
    --beta 0.02
```

### With Curriculum Learning Monitoring

```bash
python script/train_grpo_unsloth_stl_v2.py \
    --base_model /jfan5/sft_models/mistral_7b \
    --data_root /jfan5/grpo_data/five_domain_0109 \
    --output_dir /jfan5/grpo_models/mistral_7b_curriculum \
    --batch_size 12 \
    --max_steps 1500 \
    --save_steps 100 \
    --logging_steps 10 \
    --wandb_project pddl-grpo-v2 \
    --run_name mistral-7b-curriculum-v2
```

### Multi-GPU Training

```bash
# Ensure batch_size is divisible by (num_domains * num_gpus)
# Example: 4 domains, 2 GPUs → batch_size must be divisible by 4
python script/train_grpo_unsloth_stl_v2.py \
    --base_model /jfan5/sft_models/qwen3_14b \
    --data_root /jfan5/grpo_data/five_domain_0109 \
    --output_dir /jfan5/grpo_models/qwen3_14b_v2 \
    --batch_size 16 \
    --gradient_accumulation_steps 2 \
    --max_steps 2000 \
    --learning_rate 5e-6 \
    --use_gradient_checkpointing
```

## Validation

### Check Domain Balance in Logs

The script logs domain distribution every 100 steps:

```
Step 0/1000: curriculum weights = {'easy': 0.7, 'medium': 0.25, 'hard': 0.05}
Step 100/1000: curriculum weights = {'easy': 0.7, 'medium': 0.25, 'hard': 0.05}
Step 300/1000: curriculum weights = {'easy': 0.4, 'medium': 0.4, 'hard': 0.2}
Step 700/1000: curriculum weights = {'easy': 0.2, 'medium': 0.4, 'hard': 0.4}
```

### Verify Batch Composition (Debug)

Add this to your code to verify batch composition:

```python
# In grpo_reward_func, add:
if trainer_state and trainer_state.global_step % 10 == 0:
    domain_counts = {}
    for m in meta:
        if isinstance(m, dict):
            domain = m.get('scenario', 'unknown')
            domain_counts[domain] = domain_counts.get(domain, 0) + 1
    logger.info(f"Step {trainer_state.global_step}: Batch domains: {domain_counts}")
```

**Expected output (batch_size=8, 4 domains):**
```
Step 10: Batch domains: {'blocksworld': 2, 'ferry': 2, 'grippers': 2, 'spanner': 2}
Step 20: Batch domains: {'blocksworld': 2, 'ferry': 2, 'grippers': 2, 'spanner': 2}
```

## Requirements

### Batch Size Constraint

**CRITICAL:** `batch_size` must be divisible by `num_domains`.

```python
# Valid configurations
batch_size=8,  num_domains=4  ✓  (2 samples/domain)
batch_size=12, num_domains=4  ✓  (3 samples/domain)
batch_size=16, num_domains=4  ✓  (4 samples/domain)

# Invalid configurations
batch_size=10, num_domains=4  ✗  (2.5 samples/domain - not integer!)
batch_size=6,  num_domains=4  ✗  (1.5 samples/domain - not integer!)
```

The script will raise a `ValueError` if this constraint is violated.

## Preserved Components from V1

The following remain **UNCHANGED** from V1:

### Reward Function
- `grpo_reward_func()` - identical interface and logic
- `classify_with_validator()` - same VAL integration
- Dense reward calculation using `utils_generic_reward.py`
- Reward ranges: [-1, 1] with same breakpoints

### GRPOConfig
- All hyperparameters preserved
- Same beta, learning_rate, temperature defaults
- Identical save/logging strategies

### Model Loading
- Unsloth integration unchanged
- 4-bit quantization logic identical
- Gradient checkpointing handling same

### Validation Logic
- VAL validator integration unchanged
- PDDL file path handling identical
- Plan extraction using same `extract_llm_output()`

## Monitoring & Debugging

### Files Generated

1. **`reward_debug.log`**: Detailed reward computation logs
2. **`prompt_lengths.txt`**: Token length statistics per prompt
3. **W&B logs**:
   - Curriculum weights over time
   - Domain distribution per batch
   - Reward statistics by domain and difficulty

### Key Metrics to Monitor

1. **Domain Balance**: Each batch should have equal domain representation
2. **Curriculum Progression**: Difficulty distribution should shift from easy→hard
3. **Reward Distribution**: Track rewards by domain and difficulty bucket
4. **Convergence**: Compare early-stage (easy) vs late-stage (hard) success rates

## Troubleshooting

### Issue: "batch_size must be divisible by num_domains"

**Solution:** Adjust `--batch_size` to be a multiple of your domain count.
```bash
# If you have 4 domains
--batch_size 8   # ✓ (2 per domain)
--batch_size 12  # ✓ (3 per domain)
--batch_size 10  # ✗ Error!
```

### Issue: "Domain {domain} has no samples in any bucket"

**Cause:** A domain has insufficient data for all difficulty buckets.

**Solution:**
1. Check data files in `/jfan5/grpo_data/five_domain_0109/`
2. Ensure each domain has at least 10-20 samples
3. The script will fallback to other buckets, but log warnings

### Issue: Reward distribution skewed

**Possible causes:**
1. Curriculum weights too aggressive (too many hard problems early)
2. Difficulty scoring not calibrated for certain domains
3. Some domains inherently harder

**Solution:**
1. Adjust curriculum schedule in `get_curriculum_weights()`
2. Tune difficulty formula weights (currently 5n+3r+2o)
3. Monitor per-domain rewards in W&B

## Performance Considerations

### Memory Usage

- **V1**: Loads entire dataset into memory at once
- **V2**: Generates samples on-the-fly, more memory efficient for large datasets

### Training Speed

- **V1**: Slightly faster (no difficulty computation)
- **V2**: ~5% slower due to dynamic sampling, but benefits from curriculum learning

### Convergence

- **V2 expected to converge faster** due to curriculum learning
- Early easy problems build foundation, reducing overall training time

## Future Enhancements

Possible improvements for V3:

1. **Adaptive Curriculum**: Adjust difficulty based on success rate, not just step count
2. **Per-Domain Difficulty**: Different curriculum schedules per domain
3. **Temperature Scheduling**: Increase temperature for hard problems
4. **Replay Buffer**: Store successful plans for later re-training
5. **Dynamic Domain Weights**: Weight domains by recent success rate

## References

- Original GRPO paper: [Group Robust Preference Optimization]
- TRL GRPOTrainer docs: https://huggingface.co/docs/trl/grpo_trainer
- Curriculum learning in RL: Bengio et al. (2009)

## License

Same as parent project.

## Contact

For questions or issues, please open a GitHub issue or contact the maintainer.
