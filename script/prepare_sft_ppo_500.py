#!/usr/bin/env python3
"""
Prepare SFT/PPO problem sets from SFT variant JSONs.

Reads each pddl3_dataset.json under sft_data/*-variant-500 and copies the
referenced problems/solutions into two folders:
- sft_500/<scenario>/ : includes problem .pddl and solution .soln
- ppo_500/<scenario>/ : includes problem .pddl only

Sources for problems/solutions are the paths stored in the JSON (e.g.,
ferry/all_problems3/training/...).
"""
import json
import shutil
from pathlib import Path
from typing import Dict, Iterable, List, Tuple

REPO_ROOT = Path(__file__).resolve().parent.parent
SFT_DATA_ROOT = REPO_ROOT / "sft_data"
OUT_SFT = REPO_ROOT / "sft_500"
OUT_PPO = REPO_ROOT / "ppo_500"


def load_dataset(json_path: Path) -> List[Dict]:
    with json_path.open("r", encoding="utf-8") as f:
        return json.load(f)


def unique_files(entries: Iterable[Dict]) -> Tuple[List[Path], List[Path], str]:
    problems = []
    solutions = []
    scenario = None
    seen_p = set()
    seen_s = set()
    for item in entries:
        scenario = scenario or item["scenario"]
        prob = REPO_ROOT / item["problem_file"]
        sol = REPO_ROOT / item["solution_file"]
        if prob not in seen_p:
            problems.append(prob)
            seen_p.add(prob)
        if sol not in seen_s:
            solutions.append(sol)
            seen_s.add(sol)
    return problems, solutions, scenario or "unknown"


def copy_files(paths: List[Path], dest_dir: Path) -> None:
    dest_dir.mkdir(parents=True, exist_ok=True)
    for src in paths:
        if not src.exists():
            raise FileNotFoundError(f"Missing source file: {src}")
        shutil.copy2(src, dest_dir / src.name)


def process_json(json_path: Path) -> Tuple[int, int, str]:
    data = load_dataset(json_path)
    problems, solutions, scenario = unique_files(data)
    sft_dir = OUT_SFT / scenario
    ppo_dir = OUT_PPO / scenario
    copy_files(problems, sft_dir)
    copy_files(problems, ppo_dir)
    copy_files(solutions, sft_dir)
    return len(problems), len(solutions), scenario


def main():
    OUT_SFT.mkdir(exist_ok=True)
    OUT_PPO.mkdir(exist_ok=True)

    json_files = sorted(SFT_DATA_ROOT.glob("*-variant-500/pddl3_dataset.json"))
    if not json_files:
        raise FileNotFoundError("No pddl3_dataset.json found under sft_data/*-variant-500")

    for jp in json_files:
        probs, sols, scen = process_json(jp)
        print(f"[{scen}] problems: {probs}, solutions: {sols}, src: {jp.relative_to(REPO_ROOT)}")

    print(f"Done. Files written under {OUT_SFT} and {OUT_PPO}")


if __name__ == "__main__":
    main()
