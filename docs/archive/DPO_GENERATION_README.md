# DPO Dataset Generation for PDDL Tasks

## Overview

This script generates Direct Preference Optimization (DPO) training data for PDDL planning tasks by creating preference pairs of different quality solutions.

## Quick Start

### Basic Usage

```bash
python generate_dpo_dataset.py --sft_model_path /path/to/your/sft/model
```

### Requirements

Install dependencies:
```bash
pip install vllm torch tqdm
```

## Data Quality Scores

The script generates solutions with 4 quality levels:

| Score | Description | Source |
|-------|-------------|--------|
| 100 | Perfect classical solution | Ground truth files (`.soln`) |
| 80 | Logic error (suboptimal) | SFT model sampling (temp=0.7) |
| 60 | Safety constraint violation | `all_problems` directory |
| 40 | Precondition violation | SFT model sampling (temp=1.0) |

## DPO Pair Priority

For each problem, the script generates pairs in this priority order:

1. **100 vs 80** (Most important - logic errors)
2. **100 vs 60** (Safety violations)
3. **100 vs 40** (Precondition errors)

## Directory Structure

### Input Structure

```
/home/ubuntu/Safety-gen/pddl3/
├── blocksworld/
│   ├── grpo_500/
│   │   ├── problem_001.pddl
│   │   ├── problem_001.soln    # 100-score solution
│   │   ├── problem_002.pddl
│   │   ├── problem_002.soln
│   │   └── ...
│   └── all_problems/           # Optional: 60-score solutions
│       ├── problem_001_unsafe.soln
│       └── ...
├── grippers/
├── spanner/
└── ferry/
```

### Output Structure

```
/jfan5/dpo_data-1206/
├── blocksworld_dpo.jsonl       # Per-scenario data
├── grippers_dpo.jsonl
├── spanner_dpo.jsonl
├── ferry_dpo.jsonl
├── all_scenarios_merged.jsonl  # Combined data
└── stats.json                  # Generation statistics
```

## Output Format

Each line in the JSONL files contains:

```json
{
  "prompt": "You are a PDDL planner...",
  "chosen": "action1\naction2\n...",
  "rejected": "wrong_action1\n...",
  "score_diff": "100-80",
  "scenario": "blocksworld",
  "problem_id": "problem_001"
}
```

## Customization Guide

### 1. Implementing the Verifier (CRITICAL)

The script includes a **placeholder verifier** at line ~90. You MUST replace it with your actual PDDL verification logic:

```python
def verify_plan(problem_text: str, plan_text: str) -> int:
    """
    TODO: Implement your PDDL verification logic here!

    Suggested implementation:
    1. Parse the PDDL problem
    2. Validate plan syntax
    3. Check preconditions for each action
    4. Check safety constraints
    5. Verify goal achievement
    6. Return appropriate score
    """
    # Your implementation here
    pass
```

**Recommended approach:**
- Use a PDDL parser (e.g., `pddl-parser`, `pyperplan`)
- Integrate a validator (e.g., VAL validator)
- Add safety constraint checker specific to your domain

### 2. Adjusting the Prompt Template

Modify `create_prompt_from_problem()` at line ~260 to match your SFT model's training format:

```python
def create_prompt_from_problem(problem_text: str) -> str:
    # Customize this based on your model's training
    prompt = f"""Your custom instruction format...
{problem_text}
Expected output format...
"""
    return prompt
```

### 3. Configuring Unsafe Solution Loading

Update `load_unsafe_solution()` at line ~220 to match your file naming convention:

```python
def load_unsafe_solution(problem: Problem) -> Optional[Solution]:
    # Update these paths and naming patterns
    all_problems_dir = problem.problem_path.parent.parent / "all_problems"

    # Add your specific naming patterns
    possible_names = [
        f"{problem.problem_id}_unsafe.soln",
        # Add more patterns based on your structure
    ]
    # ...
```

### 4. Tuning Sampling Parameters

Adjust sampling configuration at line ~31:

```python
SAMPLING_CONFIGS = {
    80: {'temperature': 0.7, 'max_retries': 5},  # Logic errors
    40: {'temperature': 1.0, 'max_retries': 5}   # Precondition violations
}
```

**Tips:**
- Higher temperature → more diverse/risky outputs (better for finding errors)
- Increase `max_retries` if success rate is too low
- Monitor success rates in logs and adjust accordingly

### 5. Adding More Scenarios

Edit the `SCENARIOS` list at line ~30:

```python
SCENARIOS = ['blocksworld', 'grippers', 'spanner', 'ferry', 'your_new_scenario']
```

## Monitoring Progress

The script provides detailed logging:

```
INFO - Processing scenario: blocksworld
INFO - Found 500 problem-solution pairs
INFO - Found 350 unsafe solutions (score-60)
INFO - Sampling solutions for score 80 with temperature 0.7
INFO - Score-80 sampling success rate: 78.00%
INFO - Generated 1200 DPO pairs for blocksworld
```

## Statistics Output

`stats.json` contains:

```json
{
  "blocksworld": {
    "total_pairs": 1200,
    "total_problems": 500,
    "pairs_100-80": 390,
    "pairs_100-60": 350,
    "pairs_100-40": 460
  },
  ...
}
```

## Performance Optimization

### For Large Datasets

1. **Batch Processing**: Modify `sample_solutions_with_vllm()` to process problems in batches
2. **Multi-GPU**: The script automatically uses all available GPUs
3. **Reduce Retries**: Lower `max_retries` if sampling takes too long

### Memory Management

If you encounter OOM errors:

```python
# In main(), when creating LLM:
llm = LLM(
    model=args.sft_model_path,
    tensor_parallel_size=torch.cuda.device_count(),
    max_num_batched_tokens=4096,  # Add this
    max_num_seqs=256,              # Add this
    trust_remote_code=True
)
```

## Troubleshooting

### Issue: Low Success Rate for Score-80/40

**Solution:** Adjust temperature or try different sampling strategies:
```python
sampling_params = SamplingParams(
    temperature=1.2,  # Increase for more errors
    top_k=50,         # Add diversity
    n=3               # Sample multiple at once
)
```

### Issue: No Unsafe Solutions Found

**Check:**
1. `all_problems` directory exists
2. File naming matches patterns in `load_unsafe_solution()`
3. Check logs for path issues

### Issue: Verifier Returns Wrong Scores

**Debug:**
```python
# Add logging in verify_plan()
logger.debug(f"Problem: {problem_text[:100]}...")
logger.debug(f"Plan: {plan_text}")
logger.debug(f"Computed score: {score}")
```

## Next Steps

1. **Implement the verifier** - This is the most critical step
2. **Run a small test** - Test on 10 problems first
3. **Validate output** - Manually check some generated pairs
4. **Full generation** - Run on all 500 problems per scenario
5. **Train DPO model** - Use the generated data for preference learning

## Example Workflow

```bash
# 1. Test on a single scenario first (modify script to use SCENARIOS = ['blocksworld'])
python generate_dpo_dataset.py --sft_model_path /path/to/model

# 2. Check output quality
head -n 1 /jfan5/dpo_data-1206/blocksworld_dpo.jsonl | jq

# 3. Review statistics
cat /jfan5/dpo_data-1206/stats.json

# 4. If satisfied, run full generation
python generate_dpo_dataset.py --sft_model_path /path/to/model
```

## Support

For issues or questions:
1. Check logs for error messages
2. Verify input/output paths
3. Test verifier independently
4. Review sampling success rates

## Citation

If you use this code, please ensure proper attribution to your project and any underlying PDDL libraries used.
