#!/usr/bin/env python3

"""Summarize accept/reject score distributions for a JSONL DPO dataset."""

from __future__ import annotations

import argparse
import collections
import json
from pathlib import Path
from typing import Counter, Dict


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Compute accept (chosen) and reject (rejected) score distributions "
            "for a JSONL dataset with per-sample metadata."
        )
    )
    parser.add_argument(
        "jsonl_path",
        type=Path,
        help="Path to the JSONL file (one record per line).",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    jsonl_path: Path = args.jsonl_path

    if not jsonl_path.is_file():
        raise FileNotFoundError(f"JSONL file not found: {jsonl_path}")

    accept_counter: Counter[int] = collections.Counter()
    reject_counter: Counter[int] = collections.Counter()
    missing_accept = 0
    missing_reject = 0
    total_records = 0

    with jsonl_path.open("r", encoding="utf-8") as f:
        for line in f:
            stripped = line.strip()
            if not stripped:
                continue

            total_records += 1
            try:
                record = json.loads(stripped)
            except json.JSONDecodeError:
                raise ValueError(f"Line {total_records} is not valid JSON.")

            meta: Dict[str, int] = record.get("meta", {})

            accept_score = meta.get("chosen_score")
            if accept_score is None:
                missing_accept += 1
            else:
                accept_counter[int(accept_score)] += 1

            reject_score = meta.get("rejected_score")
            if reject_score is None:
                missing_reject += 1
            else:
                reject_counter[int(reject_score)] += 1

    print(f"File: {jsonl_path}")
    print(f"Total records: {total_records}")
    print()

    def print_distribution(label: str, counter: Counter[int], missing: int) -> None:
        print(f"{label} score distribution:")
        if counter:
            for score in sorted(counter):
                print(f"  score={score}: {counter[score]}")
        else:
            print("  (no scores found)")
        if missing:
            print(f"  missing scores: {missing}")
        print()

    print_distribution("Accept", accept_counter, missing_accept)
    print_distribution("Reject", reject_counter, missing_reject)


if __name__ == "__main__":
    main()
