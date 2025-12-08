# Quick Start Guide: DPO Dataset Generation

## 5-Minute Setup

### Step 1: Install Dependencies

```bash
cd /home/ubuntu/Safety-gen
pip install vllm torch tqdm
```

### Step 2: Run Tests (Without Model)

Test the file loading and data pipeline:

```bash
python test_dpo_generation.py --test file
```

Expected output:
```
TEST 1: File Loading
Scenario: blocksworld
Found 500 problem-solution pairs
✓ File loading test completed
```

### Step 3: Verify Your Data Structure

Check that your files are organized correctly:

```bash
# Should show your PDDL problems
ls /home/ubuntu/Safety-gen/pddl3/blocksworld/grpo_500/*.pddl | head -5

# Should show corresponding solutions
ls /home/ubuntu/Safety-gen/pddl3/blocksworld/grpo_500/*.soln | head -5

# Check for unsafe solutions (optional)
ls /home/ubuntu/Safety-gen/pddl3/blocksworld/all_problems/ 2>/dev/null
```

### Step 4: Implement the Verifier (CRITICAL)

Edit `generate_dpo_dataset.py` and replace the `verify_plan()` function (around line 90).

**Quick option** - Copy from example:
```bash
# Review the example implementations
cat pddl_verifier_example.py
```

**Recommended approach:**
1. Start with VAL validator (most reliable)
2. Customize safety constraint checking for your domain
3. Test with sample problems

Example minimal implementation:
```python
def verify_plan(problem_text: str, plan_text: str) -> int:
    # TODO: Replace with your actual verifier

    # 1. Check if plan is empty or malformed
    if not plan_text.strip():
        return 40

    # 2. Run VAL validator or custom checker
    # is_valid = run_val_validator(problem_text, plan_text)
    # if not is_valid:
    #     return 40

    # 3. Check safety constraints
    # if violates_safety(plan_text):
    #     return 60

    # 4. Check optimality
    # if is_suboptimal(plan_text):
    #     return 80

    return 100  # Default: assume valid
```

### Step 5: Test with Model (Optional)

If you have a model ready:

```bash
python test_dpo_generation.py \
    --sft_model_path /path/to/your/model \
    --test model
```

This will:
- Load the model
- Test generation on a sample prompt
- Verify vLLM is working correctly

### Step 6: Small-Scale Test Run

Test on 3 problems before running on all 500:

```bash
python test_dpo_generation.py \
    --sft_model_path /path/to/your/model \
    --test generation
```

Check output:
```bash
cat /jfan5/dpo_data_test/blocksworld_test.jsonl | head -1 | jq
```

### Step 7: Full Generation

Once tests pass, run on all data:

```bash
# Run with logging
python generate_dpo_dataset.py \
    --sft_model_path /path/to/your/model \
    2>&1 | tee dpo_generation.log
```

Monitor progress:
```bash
# In another terminal
tail -f dpo_generation.log
```

### Step 8: Verify Output

Check the results:

```bash
# Count generated pairs
wc -l /jfan5/dpo_data-1206/*.jsonl

# View statistics
cat /jfan5/dpo_data-1206/stats.json | jq

# Sample a random pair
shuf -n 1 /jfan5/dpo_data-1206/blocksworld_dpo.jsonl | jq
```

---

## Common Issues & Solutions

### Issue 1: "No problem-solution pairs found"

**Cause:** File naming doesn't match expected pattern (.pddl + .soln)

**Solution:**
```bash
# Check your file naming
ls /home/ubuntu/Safety-gen/pddl3/blocksworld/grpo_500/ | head -10

# If files have different extensions, update find_problem_files() in generate_dpo_dataset.py
```

### Issue 2: "Model path not found"

**Cause:** Incorrect model path

**Solution:**
```bash
# Verify model exists
ls /path/to/your/model/

# Should contain config.json, pytorch_model.bin, etc.
```

### Issue 3: "VAL validator not found"

**Cause:** VAL not installed or not in PATH

**Solution:**
```bash
# Install VAL
git clone https://github.com/KCL-Planning/VAL.git
cd VAL
make
sudo cp bin/validate /usr/local/bin/

# Or update VAL_PATH in pddl_verifier_example.py
```

### Issue 4: Low sampling success rate (< 50%)

**Cause:** Model not generating target quality scores

**Solution:**
1. Adjust temperature in `SAMPLING_CONFIGS`
2. Increase `max_retries`
3. Check if verifier is working correctly
4. Review model's training data

### Issue 5: Out of Memory (OOM)

**Cause:** Model too large for available GPU

**Solution:**
```python
# In generate_dpo_dataset.py, add to LLM initialization:
llm = LLM(
    model=args.sft_model_path,
    tensor_parallel_size=2,  # Increase if you have multiple GPUs
    max_num_batched_tokens=2048,  # Reduce batch size
    max_num_seqs=128,  # Reduce concurrent sequences
    trust_remote_code=True
)
```

---

## Expected Runtime

**Assumptions:**
- 500 problems per scenario
- 4 scenarios = 2000 problems total
- 5 retries per quality score
- ~2 seconds per sample

**Estimates:**
- Single scenario: 30-60 minutes
- All scenarios: 2-4 hours

**Optimization tips:**
- Use multiple GPUs (tensor_parallel_size)
- Reduce max_retries if sampling is slow
- Process scenarios in parallel (run 4 instances)

---

## Output Checklist

After generation completes, verify:

- [ ] All scenario files exist: `ls /jfan5/dpo_data-1206/*_dpo.jsonl`
- [ ] Merged file exists: `ls /jfan5/dpo_data-1206/all_scenarios_merged.jsonl`
- [ ] Stats file exists: `cat /jfan5/dpo_data-1206/stats.json`
- [ ] Reasonable pair counts: Check stats.json shows > 0 pairs per scenario
- [ ] Valid JSON format: `head -1 /jfan5/dpo_data-1206/blocksworld_dpo.jsonl | jq`
- [ ] Prompt field exists: `jq .prompt /jfan5/dpo_data-1206/blocksworld_dpo.jsonl | head -1`
- [ ] Chosen/rejected different: Manually verify a few pairs

---

## Next Steps After Generation

1. **Data Quality Check:**
   ```bash
   # Sample and manually review 10 random pairs
   shuf -n 10 /jfan5/dpo_data-1206/all_scenarios_merged.jsonl > sample_pairs.jsonl
   ```

2. **Convert for DPO Training:**
   ```python
   # Your DPO training script might need specific format
   # Adjust field names if needed (e.g., "prompt" -> "question")
   ```

3. **Split Train/Val:**
   ```bash
   # 90/10 split
   total=$(wc -l < /jfan5/dpo_data-1206/all_scenarios_merged.jsonl)
   train=$((total * 9 / 10))

   head -n $train /jfan5/dpo_data-1206/all_scenarios_merged.jsonl > train.jsonl
   tail -n +$((train + 1)) /jfan5/dpo_data-1206/all_scenarios_merged.jsonl > val.jsonl
   ```

4. **Train DPO Model:**
   ```bash
   # Use your preferred DPO training framework (e.g., TRL, AlpacaFarm)
   python train_dpo.py --train_file train.jsonl --val_file val.jsonl
   ```

---

## Customization Checklist

Before running on full dataset, customize:

- [ ] `verify_plan()` - Implement PDDL verification
- [ ] `load_unsafe_solution()` - Update file matching logic
- [ ] `create_prompt_from_problem()` - Match your model's training format
- [ ] `SAMPLING_CONFIGS` - Tune temperature/retries
- [ ] `has_safety_violation()` - Add domain-specific safety checks

---

## Support Files

- `generate_dpo_dataset.py` - Main generation script
- `pddl_verifier_example.py` - Example verifier implementations
- `test_dpo_generation.py` - Testing utilities
- `DPO_GENERATION_README.md` - Detailed documentation
- `DPO_QUICKSTART.md` - This file

---

## Need Help?

1. Run tests: `python test_dpo_generation.py`
2. Check logs for error messages
3. Review `DPO_GENERATION_README.md` for detailed info
4. Verify verifier with: `python test_dpo_generation.py --test verifier`
