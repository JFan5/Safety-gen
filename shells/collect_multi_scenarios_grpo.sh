#!/bin/bash

# Merge per-scenario PDDL3 GRPO datasets into a single multi-scenario split.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${REPO_ROOT}"

SCENARIOS=(blocksworld ferry grippers spanner delivery)
INPUT_ROOT="data/grpo/gpt_multi_pddl3_500"
OUTPUT_PATH="data/grpo/gpt_multi_pddl3_500/multi_scenarios/pddl3_grpo.jsonl"
CONSTRUCT_SCRIPT="${REPO_ROOT}/script/construct_grpo_dataset.py"

echo "Collecting multi-scenario GRPO data -> ${OUTPUT_PATH}"

python3 - <<'PY' "$(IFS=,; echo "${SCENARIOS[*]}")" "${INPUT_ROOT}" "${OUTPUT_PATH}" "${CONSTRUCT_SCRIPT}"
import json
import sys
import subprocess
from pathlib import Path

scenarios = sys.argv[1].split(",")
input_root = Path(sys.argv[2])
output_path = Path(sys.argv[3])
construct_script = Path(sys.argv[4])

missing = []
inputs = []
generated = []

# First, check for existing GRPO pairs files, or generate them from grpo_summaries.json
for scenario in scenarios:
    # Try multiple possible paths for GRPO pairs
    possible_grpo_paths = [
        input_root / scenario / "pddl3" / "grpo.jsonl",
        input_root / scenario / "pddl3_grpo.jsonl",
        input_root / scenario / "grpo.jsonl",
    ]
    
    grpo_path = None
    for p in possible_grpo_paths:
        if p.exists():
            # Check if it's a valid GRPO pairs file (has chosen, rejected, meta)
            try:
                with p.open("r", encoding="utf-8") as f:
                    first_line = f.readline().strip()
                    if first_line:
                        obj = json.loads(first_line)
                        if "chosen" in obj and "rejected" in obj and "meta" in obj:
                            grpo_path = p
                            break
            except:
                continue
    
    # If no valid GRPO pairs file found, try to generate from grpo_summaries.json
    if grpo_path is None:
        summaries_paths = [
            input_root / scenario / "pddl3" / "grpo_summaries.json",
            input_root / scenario / "grpo_summaries.json",
        ]
        
        summaries_path = None
        for p in summaries_paths:
            if p.exists():
                summaries_path = p
                break
        
        if summaries_path and construct_script.exists():
            # Generate GRPO pairs from grpo_summaries.json
            temp_grpo_path = input_root / scenario / "pddl3" / "grpo.jsonl"
            temp_grpo_path.parent.mkdir(parents=True, exist_ok=True)
            
            print(f"Generating GRPO pairs for {scenario} from {summaries_path}...", file=sys.stderr)
            try:
                result = subprocess.run(
                    [sys.executable, str(construct_script), str(summaries_path),
                     "--output", str(temp_grpo_path), "--include-pddl", "--all-pairs"],
                    capture_output=True,
                    text=True,
                    timeout=300
                )
                if result.returncode == 0 and temp_grpo_path.exists():
                    grpo_path = temp_grpo_path
                    generated.append(scenario)
                    print(f"  Generated {temp_grpo_path}", file=sys.stderr)
                else:
                    print(f"  Failed to generate: {result.stderr}", file=sys.stderr)
            except Exception as e:
                print(f"  Error generating: {e}", file=sys.stderr)
    
    if grpo_path is None:
        missing.append(scenario)
    else:
        inputs.append(grpo_path)

if missing:
    print(f"Warning: Missing scenario GRPO files: {', '.join(missing)}", file=sys.stderr)
    if not inputs:
        raise SystemExit("No valid input files found!")

if generated:
    print(f"Generated GRPO pairs for: {', '.join(generated)}", file=sys.stderr)

output_path.parent.mkdir(parents=True, exist_ok=True)

seen = set()
records = []

for path in inputs:
    with path.open("r", encoding="utf-8") as fh:
        for line in fh:
            line = line.strip()
            if not line:
                continue
            try:
                obj = json.loads(line)
            except json.JSONDecodeError:
                continue
            
            # GRPO format: {prompt, chosen, rejected, meta: {problem_key, ...}}
            # Extract problem_key from meta
            meta = obj.get("meta", {})
            problem_key = meta.get("problem_key", "")
            
            # Create unique key: (problem_key, chosen, rejected)
            chosen = obj.get("chosen", "")
            rejected = obj.get("rejected", "")
            key = (problem_key, chosen, rejected)
            
            if key in seen:
                continue
            seen.add(key)
            
            # Add dataset metadata if not present
            if "dataset" not in obj:
                obj["dataset"] = "multi_scenarios_pddl3"
            
            records.append(obj)

with output_path.open("w", encoding="utf-8") as out:
    for obj in records:
        out.write(json.dumps(obj, ensure_ascii=False) + "\n")

print(f"Merged {len(records)} pairs from {len(inputs)} scenarios into {output_path}")
PY

echo "Done."
