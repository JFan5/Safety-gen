#!/bin/bash

# Merge per-scenario PDDL3 DPO datasets into a single multi-scenario split.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${REPO_ROOT}"

SCENARIOS=(blocksworld ferry grid grippers rovers spanner)
INPUT_ROOT="data/dpo/datasets"
OUTPUT_PATH="local_data/dpo/multi_scenarios/pddl3_dpo.jsonl"

echo "Collecting multi-scenario DPO data -> ${OUTPUT_PATH}"

python3 - <<'PY' "$(IFS=,; echo "${SCENARIOS[*]}")" "${INPUT_ROOT}" "${OUTPUT_PATH}"
import json
import sys
from pathlib import Path

scenarios = sys.argv[1].split(",")
input_root = Path(sys.argv[2])
output_path = Path(sys.argv[3])

missing = []
inputs = []
for scenario in scenarios:
    path = input_root / scenario / "pddl3_dpo.jsonl"
    if not path.exists():
        missing.append(str(path))
    else:
        inputs.append(path)

if missing:
    raise SystemExit(f"Missing scenario DPO files: {', '.join(missing)}")

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
            key = (
                obj.get("scenario"),
                obj.get("problem_name"),
                obj.get("chosen"),
                obj.get("rejected"),
            )
            if key in seen:
                continue
            seen.add(key)
            obj.setdefault("dataset", "multi_scenarios_pddl3")
            records.append(obj)

with output_path.open("w", encoding="utf-8") as out:
    for obj in records:
        out.write(json.dumps(obj, ensure_ascii=False) + "\n")

print(f"Merged {len(records)} pairs from {len(inputs)} scenarios into {output_path}")
PY

echo "Done."
