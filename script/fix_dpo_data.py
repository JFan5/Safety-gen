#!/usr/bin/env python3
"""
Utility to keep DPO training sets and scoring logs in sync.

Features
--------
1. Verify each {domain}/dpo_training directory still contains the expected number
   of problems (default: 500 .pddl files).
2. Check scored_{domain}.jsonl logs under data/dpo/new_four/ to ensure every
   problem from dpo_training has at least one scored candidate recorded.
3. For any missing problems, invoke script/generate_score_candidate.py using the
   sampling parameters provided in the reference command so new candidates can be
   generated (only for the missing subset).

Example
-------
    python3 script/fix_dpo_data.py
"""

from __future__ import annotations

import argparse
import json
import shutil
import subprocess
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, List, Sequence, Set


REPO_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_MODEL = Path("/home/ubuntu/sft_models/gpt_multi_pddl3_500")
GENERATOR_SCRIPT = REPO_ROOT / "script" / "generate_score_candidate.py"
TARGET_SCORE_ROOT = Path("/home/ubuntu/data/dpo/gpt_multi_pddl3_500")
NEW_FOUR_DIR = REPO_ROOT / "data" / "dpo" / "new_four"
EXPECTED_PROBLEMS = 500
DEFAULT_TEMPS = (0.6, 0.9)
DEFAULT_TOP_P = 0.9
DEFAULT_TOP_K = 50


@dataclass(frozen=True)
class DomainConfig:
    name: str
    domain_file: Path
    dpo_dir: Path
    scored_log: Path

    @property
    def target_out(self) -> Path:
        return TARGET_SCORE_ROOT / self.name / "pddl3" / "scored.jsonl"


DOMAINS: Sequence[DomainConfig] = (
    DomainConfig(
        name="blocksworld",
        domain_file=REPO_ROOT / "blocksworld" / "domain3.pddl",
        dpo_dir=REPO_ROOT / "blocksworld" / "dpo_training",
        scored_log=NEW_FOUR_DIR / "scored_blocksworld.jsonl",
    ),
    DomainConfig(
        name="ferry",
        domain_file=REPO_ROOT / "ferry" / "domain3.pddl",
        dpo_dir=REPO_ROOT / "ferry" / "dpo_training",
        scored_log=NEW_FOUR_DIR / "scored_ferry.jsonl",
    ),
    DomainConfig(
        name="grippers",
        domain_file=REPO_ROOT / "grippers" / "domain3.pddl",
        dpo_dir=REPO_ROOT / "grippers" / "dpo_training",
        scored_log=NEW_FOUR_DIR / "scored_grippers.jsonl",
    ),
    DomainConfig(
        name="spanner",
        domain_file=REPO_ROOT / "spanner" / "domain3.pddl",
        dpo_dir=REPO_ROOT / "spanner" / "dpo_training",
        scored_log=NEW_FOUR_DIR / "scored_spanner.jsonl",
    ),
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Validate DPO training sets and backfill missing scored candidates."
    )
    parser.add_argument(
        "--expected-count",
        type=int,
        default=EXPECTED_PROBLEMS,
        help="Expected number of .pddl problems per dpo_training directory (default: 500).",
    )
    parser.add_argument(
        "--model",
        type=Path,
        default=DEFAULT_MODEL,
        help="Unsloth SFT model path passed to generate_score_candidate.py.",
    )
    parser.add_argument(
        "--generator",
        type=Path,
        default=GENERATOR_SCRIPT,
        help="Path to script/generate_score_candidate.py (override only if necessary).",
    )
    parser.add_argument(
        "--temperatures",
        type=float,
        nargs="+",
        default=list(DEFAULT_TEMPS),
        help="Temperature list forwarded to the generator (default: 0.6 0.9).",
    )
    parser.add_argument(
        "--top-p",
        type=float,
        default=DEFAULT_TOP_P,
        help="top-p value forwarded to the generator (default: 0.9).",
    )
    parser.add_argument(
        "--top-k",
        type=int,
        default=DEFAULT_TOP_K,
        help="top-k value forwarded to the generator (default: 50).",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Only report status; do not call generate_score_candidate.py.",
    )
    parser.add_argument(
        "--extra-generator-args",
        nargs=argparse.REMAINDER,
        default=[],
        help="Additional args appended to the generator command (use '-- ...').",
    )
    return parser.parse_args()


def load_problem_names(dpo_dir: Path) -> List[str]:
    if not dpo_dir.is_dir():
        raise FileNotFoundError(f"DPO directory missing: {dpo_dir}")
    problems = sorted(
        p.stem for p in dpo_dir.glob("*.pddl") if "domain" not in p.name.lower()
    )
    return problems


def load_scored_names(scored_log: Path) -> Set[str]:
    names: Set[str] = set()
    if not scored_log.exists():
        return names
    with scored_log.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            try:
                record = json.loads(line)
            except json.JSONDecodeError:
                continue
            name = record.get("problem_name")
            if name:
                names.add(name)
    return names


def ensure_problem_count(domain: DomainConfig, problems: Sequence[str], expected: int) -> None:
    actual = len(problems)
    if actual != expected:
        raise ValueError(
            f"{domain.name}: expected {expected} problems but found {actual} in {domain.dpo_dir}"
        )


def run_generator_for_missing(
    domain: DomainConfig,
    missing: Sequence[str],
    args: argparse.Namespace,
) -> None:
    if not missing:
        return

    temp_dir = Path(tempfile.mkdtemp(prefix=f"{domain.name}_missing_"))
    try:
        for name in missing:
            src = domain.dpo_dir / f"{name}.pddl"
            if not src.exists():
                raise FileNotFoundError(f"Problem file not found: {src}")
            shutil.copy2(src, temp_dir / src.name)

        out_path = domain.target_out
        out_path.parent.mkdir(parents=True, exist_ok=True)

        cmd: List[str] = [
            "python3",
            str(args.generator),
            "--model",
            str(args.model),
            "--domain-file",
            str(domain.domain_file),
            "--problems-dir",
            str(temp_dir),
            "--out",
            str(out_path),
            "--temperatures",
        ]
        cmd.extend(str(t) for t in args.temperatures)
        cmd.extend(
            [
                "--top-p",
                str(args.top_p),
                "--top-k",
                str(args.top_k),
            ]
        )
        if args.extra_generator_args:
            cmd.extend(args.extra_generator_args)

        print(f"[{domain.name}] Running generator for {len(missing)} missing problems...")
        print("Command:", " ".join(cmd))
        if args.dry_run:
            print("[dry-run] Skipping actual generator execution.")
        else:
            subprocess.run(cmd, check=True)
    finally:
        shutil.rmtree(temp_dir, ignore_errors=True)


def main() -> None:
    args = parse_args()

    for domain in DOMAINS:
        problems = load_problem_names(domain.dpo_dir)
        ensure_problem_count(domain, problems, args.expected_count)
        scored = load_scored_names(domain.scored_log)
        missing = sorted(name for name in problems if name not in scored)

        print(f"[{domain.name}] {len(problems)} problems, {len(scored)} scored entries.")
        if missing:
            print(f"[{domain.name}] Missing {len(missing)} problems from scored log:")
            for name in missing:
                print(f"    - {name}")
            run_generator_for_missing(domain, missing, args)
        else:
            print(f"[{domain.name}] All problems have scored candidates.")


if __name__ == "__main__":
    main()
