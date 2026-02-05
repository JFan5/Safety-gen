#!/usr/bin/env python3
"""Sample a fixed number of DPO examples from each scenario and merge them."""

from __future__ import annotations

import argparse
import random
from pathlib import Path
from typing import Iterable, List, Tuple


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Pick a fixed number of PDDL3 DPO samples from each scenario directory "
            "and merge them into a single JSONL file."
        )
    )
    default_root = Path(__file__).resolve().parent / "data" / "dpo" / "datasets"

    parser.add_argument(
        "--datasets-dir",
        type=Path,
        default=default_root,
        help=f"Root directory that contains scenario subdirectories (default: {default_root})",
    )
    parser.add_argument(
        "--per-scenario",
        type=int,
        required=True,
        help="Number of samples to draw from each scenario.",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=None,
        help=(
            "Output JSONL file. If omitted, defaults to "
            "`<datasets-dir>/all_dpo-<per-scenario>.jsonl`."
        ),
    )
    parser.add_argument(
        "--seed",
        type=int,
        default=0,
        help="Random seed used for sampling (default: 0).",
    )
    parser.add_argument(
        "--scenarios",
        nargs="*",
        default=None,
        help=(
            "Optional list of scenario directory names to include. "
            "If omitted, all scenarios with `pddl3_dpo.jsonl` are used."
        ),
    )
    parser.add_argument(
        "--allow-fewer",
        action="store_true",
        help=(
            "Allow scenarios with fewer than the requested samples. "
            "If set, all available samples are used instead of raising an error."
        ),
    )
    return parser.parse_args()


def find_scenarios(root: Path, targets: Iterable[str] | None = None) -> List[Tuple[str, Path]]:
    """Find scenario directories containing a `pddl3_dpo.jsonl` file."""
    if targets is not None:
        target_set = {t.strip() for t in targets if t.strip()}
    else:
        target_set = None

    scenarios: List[Tuple[str, Path]] = []
    for entry in sorted(root.iterdir()):
        if not entry.is_dir():
            continue
        name = entry.name
        if target_set is not None and name not in target_set:
            continue
        candidate = entry / "pddl3_dpo.jsonl"
        if candidate.is_file():
            scenarios.append((name, candidate))
    return scenarios


def reservoir_sample(path: Path, k: int, rng: random.Random) -> Tuple[List[str], int]:
    """Reservoir sampling so memory use stays reasonable for large files."""
    reservoir: List[str] = []
    total = 0
    with path.open("r", encoding="utf-8") as fh:
        for line in fh:
            stripped = line.rstrip("\n")
            if not stripped:
                continue
            total += 1
            if k <= 0:
                continue
            if len(reservoir) < k:
                reservoir.append(stripped)
            else:
                idx = rng.randint(0, total - 1)
                if idx < k:
                    reservoir[idx] = stripped
    return reservoir, total


def main() -> None:
    args = parse_args()
    datasets_dir: Path = args.datasets_dir
    per_scenario: int = args.per_scenario
    output_path: Path
    if args.output is None:
        output_path = datasets_dir / f"all_dpo-{per_scenario}.jsonl"
    else:
        output_path = args.output

    scenarios = find_scenarios(datasets_dir, args.scenarios)
    if not scenarios:
        raise SystemExit(f"No scenarios with pddl3_dpo.jsonl found under {datasets_dir}")

    rng = random.Random(args.seed)
    merged: List[str] = []

    for scenario_name, jsonl_path in scenarios:
        reservoir, total = reservoir_sample(jsonl_path, per_scenario, rng)
        if total < per_scenario and not args.allow_fewer:
            raise SystemExit(
                f"Scenario '{scenario_name}' has only {total} samples in {jsonl_path}, "
                f"which is fewer than the requested {per_scenario}. "
                "Use --allow-fewer to keep the available samples."
            )
        if total == 0:
            print(f"[WARN] Scenario '{scenario_name}' has no samples, skipping.")
            continue
        merged.extend(reservoir)
        print(
            f"[INFO] Scenario '{scenario_name}': selected {len(reservoir)} "
            f"of {total} available samples."
        )

    if not merged:
        raise SystemExit("No samples collected; nothing to write.")

    output_path.parent.mkdir(parents=True, exist_ok=True)
    with output_path.open("w", encoding="utf-8") as out_f:
        for record in merged:
            out_f.write(record)
            out_f.write("\n")

    print(f"[DONE] Wrote {len(merged)} samples to {output_path}")


if __name__ == "__main__":
    main()
