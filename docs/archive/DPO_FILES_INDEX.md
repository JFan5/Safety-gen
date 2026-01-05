# DPO Dataset Generation - File Index

## 📁 Generated Files Overview

All files have been created in `/home/ubuntu/Safety-gen/`. Below is a guide to each file and when to use it.

---

## 🚀 Start Here

### 1. **DPO_QUICKSTART.md** (7.1 KB)
   - **Purpose:** Step-by-step quick start guide
   - **When to use:** First time setup, want to get running quickly
   - **Contains:**
     - 5-minute setup instructions
     - Common issues and solutions
     - Runtime estimates
     - Output verification checklist

### 2. **test_dpo_generation.py** (12 KB) ⭐
   - **Purpose:** Test suite for validating setup before full run
   - **When to use:** Before running full generation, debugging issues
   - **Commands:**
     ```bash
     # Run all tests without model
     python test_dpo_generation.py

     # Test with your model
     python test_dpo_generation.py --sft_model_path /path/to/model

     # Run specific test
     python test_dpo_generation.py --test verifier
     ```
   - **What it tests:**
     - File loading from pddl3 directories
     - Unsafe solution loading
     - Prompt creation
     - Verifier functionality
     - Model loading (if path provided)
     - Small-scale generation (3 problems)

---

## 🔧 Main Tools

### 3. **generate_dpo_dataset.py** (18 KB) ⭐⭐⭐
   - **Purpose:** Main DPO dataset generation script
   - **When to use:** After testing, ready for full generation
   - **Command:**
     ```bash
     python generate_dpo_dataset.py --sft_model_path /path/to/your/model
     ```
   - **What it does:**
     - Processes all 500 problems per scenario
     - Loads classical solutions (100-score)
     - Loads unsafe solutions (60-score) from all_problems
     - Samples logic errors (80-score) from model
     - Samples precondition violations (40-score) from model
     - Generates DPO pairs with priority: 100 vs 80 > 100 vs 60 > 100 vs 40
     - Saves per-scenario JSONL files
     - Creates merged dataset
     - Generates statistics
   - **Output location:** `/jfan5/dpo_data-1206/`
   - **Key sections to customize:**
     - Line ~90: `verify_plan()` function ⚠️ MUST IMPLEMENT
     - Line ~220: `load_unsafe_solution()` file matching
     - Line ~260: `create_prompt_from_problem()` format
     - Line ~31: `SAMPLING_CONFIGS` temperature/retries

### 4. **pddl_verifier_example.py** (16 KB)
   - **Purpose:** Example implementations of PDDL plan verifier
   - **When to use:** Implementing `verify_plan()` in main script
   - **Contains 3 approaches:**
     1. **VAL validator** (recommended) - Lines 30-90
        - Uses external VAL tool
        - Most reliable for correctness checking
     2. **Custom Python** - Lines 100-160
        - Pure Python implementation
        - More flexible but requires PDDL semantics
     3. **Planner comparison** - Lines 170-220
        - Compares against optimal plan from Fast-Downward
   - **Helper functions:**
     - `has_safety_violation()` - Domain-specific safety checks
     - `parse_plan()` - Parse plan text to actions
     - `check_preconditions()` - Validate action preconditions
     - And more...
   - **How to use:**
     1. Choose an approach that fits your setup
     2. Copy the relevant functions
     3. Paste into `generate_dpo_dataset.py` replacing placeholder
     4. Customize for your PDDL domain

---

## 📚 Documentation

### 5. **DPO_GENERATION_README.md** (7.3 KB)
   - **Purpose:** Comprehensive documentation
   - **When to use:** Need detailed information, customization guide
   - **Contains:**
     - Data quality score definitions (100/80/60/40)
     - DPO pair priority explanation
     - Input/output directory structures
     - Detailed customization guide
     - Performance optimization tips
     - Troubleshooting section

---

## 📊 File Relationships

```
┌─────────────────────────┐
│  DPO_QUICKSTART.md      │  ← Start here
│  (Quick reference)       │
└───────────┬─────────────┘
            │
            ▼
┌─────────────────────────┐
│ test_dpo_generation.py  │  ← Run tests first
│ (Validate setup)         │
└───────────┬─────────────┘
            │
            ▼
┌─────────────────────────┐
│ pddl_verifier_example.py│  ← Implement verifier
│ (Copy code from here)    │
└───────────┬─────────────┘
            │
            ▼
┌─────────────────────────┐
│ generate_dpo_dataset.py │  ← Run full generation
│ (Main script)            │
└───────────┬─────────────┘
            │
            ▼
┌─────────────────────────┐
│ DPO_GENERATION_README.md│  ← Reference for details
│ (Full documentation)     │
└─────────────────────────┘
```

---

## ⚡ Quick Reference Commands

### Initial Setup
```bash
# Install dependencies
pip install vllm torch tqdm

# Test file loading (no model needed)
python test_dpo_generation.py --test file

# Test verifier
python test_dpo_generation.py --test verifier
```

### With Model
```bash
# Test model loading
python test_dpo_generation.py --sft_model_path <model_path> --test model

# Small test run (3 problems)
python test_dpo_generation.py --sft_model_path <model_path> --test generation

# Full generation
python generate_dpo_dataset.py --sft_model_path <model_path> 2>&1 | tee dpo_generation.log
```

### After Generation
```bash
# Check output
ls -lh /jfan5/dpo_data-1206/

# View statistics
cat /jfan5/dpo_data-1206/stats.json | jq

# Sample random pair
shuf -n 1 /jfan5/dpo_data-1206/all_scenarios_merged.jsonl | jq
```

---

## 🎯 Critical Customization Points

Before running full generation, you MUST customize:

1. **Verifier (CRITICAL)** - `generate_dpo_dataset.py:90`
   - Currently a placeholder that uses plan length
   - MUST implement actual PDDL verification
   - See `pddl_verifier_example.py` for implementations

2. **Unsafe Solution Loading** - `generate_dpo_dataset.py:220`
   - Update file naming patterns to match your structure
   - Default looks for: `{problem_id}_unsafe.soln`

3. **Prompt Format** - `generate_dpo_dataset.py:260`
   - Adjust to match your SFT model's training format
   - Default is a simple template

4. **Sampling Config** - `generate_dpo_dataset.py:31`
   - Tune temperature and max_retries
   - Monitor success rates and adjust

---

## 📈 Expected Workflow

1. **Day 1: Setup & Testing**
   - Read `DPO_QUICKSTART.md`
   - Run `test_dpo_generation.py`
   - Implement verifier using `pddl_verifier_example.py`

2. **Day 2: Small Test Run**
   - Test on 3-10 problems
   - Verify output quality
   - Tune sampling parameters

3. **Day 3: Full Generation**
   - Run on all 500 problems × 4 scenarios
   - Monitor logs
   - Verify output statistics

4. **Day 4: Post-processing**
   - Quality check
   - Train/val split
   - Begin DPO training

---

## 🔍 File Sizes and Line Counts

| File | Size | Lines | Type |
|------|------|-------|------|
| generate_dpo_dataset.py | 18 KB | ~620 | Executable Python |
| test_dpo_generation.py | 12 KB | ~450 | Executable Python |
| pddl_verifier_example.py | 16 KB | ~550 | Python Module |
| DPO_GENERATION_README.md | 7.3 KB | ~350 | Markdown Doc |
| DPO_QUICKSTART.md | 7.1 KB | ~280 | Markdown Doc |

---

## 💡 Tips

- **Test incrementally:** Always test on small data before full run
- **Monitor logs:** Use `tail -f` to watch generation progress
- **Check success rates:** If sampling success < 50%, adjust temperature
- **Save checkpoints:** Script runs for hours - consider adding checkpointing
- **Verify verifier:** The quality of your dataset depends on accurate verification

---

## 🆘 Getting Help

If you encounter issues:

1. **Check test output:** `python test_dpo_generation.py`
2. **Review logs:** Look for error messages and warnings
3. **Verify verifier:** `python test_dpo_generation.py --test verifier`
4. **Check file structure:** Ensure .pddl and .soln files exist
5. **Consult docs:** `DPO_GENERATION_README.md` has detailed troubleshooting

---

## ✅ Pre-Flight Checklist

Before running full generation:

- [ ] Read `DPO_QUICKSTART.md`
- [ ] Run all tests in `test_dpo_generation.py`
- [ ] Implement `verify_plan()` function
- [ ] Test verifier on sample problems
- [ ] Verify file structure (pddl3/*/grpo_500/)
- [ ] Check model path is valid
- [ ] Create output directory: `/jfan5/dpo_data-1206/`
- [ ] Run small test (3 problems)
- [ ] Review test output quality
- [ ] Launch full generation

---

Generated on: 2025-12-07
Total files: 5
Total size: ~60 KB
Purpose: DPO dataset generation for PDDL planning tasks
