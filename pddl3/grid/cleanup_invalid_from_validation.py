#!/usr/bin/env python3
import json
import os
import sys
from pathlib import Path


def main() -> int:
    if len(sys.argv) < 2:
        print("Usage: cleanup_invalid_from_validation.py <validation_json>")
        return 2

    report_path = Path(sys.argv[1])
    if not report_path.exists():
        print(f"Error: JSON report not found: {report_path}")
        return 2

    try:
        data = json.loads(report_path.read_text(encoding="utf-8"))
    except Exception as e:
        print(f"Error reading JSON: {e}")
        return 2

    results = data.get("results", [])
    removed_count = 0

    for entry in results:
        status = entry.get("status")
        if status != "invalid":
            continue
        sol = entry.get("solution_path")
        prob = entry.get("problem_path")
        # Paths in JSON are strings; ensure absolute
        if prob and not os.path.isabs(prob):
            # Resolve relative to CWD where validator was run (assumed current)
            prob = str(Path(prob).resolve())
        if sol and not os.path.isabs(sol):
            sol = str(Path(sol).resolve())

        for p in [sol, prob]:
            if not p:
                continue
            try:
                if os.path.exists(p):
                    os.remove(p)
                    removed_count += 1
            except Exception:
                # best-effort cleanup
                pass

    print(f"Removed {removed_count} files corresponding to invalid validations from {report_path.name}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())


