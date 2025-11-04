#!/usr/bin/env python3
"""
Build a scenario-grouped DPO candidate dataset directly from planning_results.

For every problem we merge solutions coming from different models/variants,
retain at most one entry per distinct score, and save the consolidated payload
under data/dpo500/<scenario>.json.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any, Dict, Iterable, List, Sequence, Tuple

DEFAULT_ROOT = Path("planning_results")
DEFAULT_OUTPUT_DIR = Path("data/dpo500")
DEFAULT_INCLUDE: List[str] = []  # no filtering by default
DEFAULT_EXCLUDE = ["aggregated_by_model", "aggregated_by_scenario"]

CATEGORY_SCORE: Dict[str, int] = {
    "success_plans": 100,
    "goal_not_satisfied": 80,
    "safety_constraints_violation": 60,
    "precondition_violation": 40,
    "plan_format_error": 20,
    "others": 10,
}
GENERATION_ERROR_SCORE = 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Collect planning_results/*/*/*_results.json files, group solutions by "
            "scenario/problem, keep one solution per distinct score, and emit "
            "scenario JSON payloads for DPO construction."
        )
    )
    parser.add_argument(
        "--root",
        type=Path,
        default=DEFAULT_ROOT,
        help="Root directory that holds planning_results (default: %(default)s)",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=DEFAULT_OUTPUT_DIR,
        help="Directory to store consolidated JSON files (default: %(default)s)",
    )
    parser.add_argument(
        "--include-pattern",
        action="append",
        help=(
            "Only keep result files whose relative path contains any of the supplied "
            "substrings. Provide an empty string to disable filtering. "
            f"Default filter: {DEFAULT_INCLUDE}"
        ),
    )
    parser.add_argument(
        "--exclude-pattern",
        action="append",
        help=(
            "Skip result files whose relative path contains any of the supplied substrings. "
            f"Default exclusions: {DEFAULT_EXCLUDE}"
        ),
    )
    parser.add_argument(
        "--min-solutions",
        type=int,
        default=1,
        help="Minimum number of unique-score solutions required per problem (default: %(default)s)",
    )
    parser.add_argument(
        "--max-per-problem",
        type=int,
        default=0,
        help="Optional cap on the number of solutions kept per problem (0 = unlimited).",
    )
    return parser.parse_args()


def iter_result_files(
    root: Path,
    include_patterns: Sequence[str],
    exclude_patterns: Sequence[str],
) -> Iterable[Path]:
    for path in sorted(root.rglob("*.json")):
        rel = path.relative_to(root)
        rel_str = str(rel)
        if include_patterns and not any(p in rel_str for p in include_patterns):
            continue
        if exclude_patterns and any(p in rel_str for p in exclude_patterns):
            continue
        yield path


def load_json(path: Path) -> Dict[str, Any]:
    with path.open("r", encoding="utf-8") as handle:
        return json.load(handle)


def looks_like_valid_plan(plan_text: str) -> bool:
    lines = [line.strip() for line in plan_text.splitlines() if line.strip()]
    if not lines:
        return False
    return all(line.startswith("(") and line.endswith(")") for line in lines)


def load_solution_text(entry: Dict[str, Any]) -> str:
    raw = entry.get("raw_solution")
    if isinstance(raw, str) and raw.strip():
        return raw.strip()
    sol_path = entry.get("solution_file")
    if not isinstance(sol_path, str) or not sol_path:
        return ""
    path = Path(sol_path)
    if not path.is_file():
        path = Path.cwd() / sol_path
    if not path.is_file():
        return ""
    try:
        return path.read_text(encoding="utf-8").strip()
    except OSError:
        return ""


def classify_entry(entry: Dict[str, Any], plan_text: str) -> str:
    is_valid = entry.get("is_valid")
    if is_valid is None:
        is_valid = entry.get("valid")
    if is_valid is None:
        status = entry.get("status")
        if isinstance(status, str):
            is_valid = status.lower() == "valid"
    if bool(is_valid):
        return "success_plans"

    if plan_text is not None and not looks_like_valid_plan(plan_text):
        return "plan_format_error"

    stdout = entry.get("validation_stdout") or entry.get("execution_info", {}).get("stdout") or ""
    stdout = stdout.lower()
    if not stdout:
        return "plan_format_error"
    if (
        "bad operator in plan" in stdout
        or "bad plan description!" in stdout
        or "no matching action defined" in stdout
        or "object with unknown type" in stdout
    ):
        return "plan_format_error"
    if "goal not satisfied" in stdout:
        return "goal_not_satisfied"
    if "plan failed to execute" in stdout and "unsatisfied precondition" in stdout:
        return "precondition_violation"
    if "plan failed to execute" in stdout and "unsatisfied precondition" not in stdout:
        return "safety_constraints_violation"
    return "others"


def score_entry(entry: Dict[str, Any], classification: str, plan_text: str) -> int:
    if entry.get("generation_error"):
        return GENERATION_ERROR_SCORE
    if not plan_text.strip():
        return GENERATION_ERROR_SCORE
    return CATEGORY_SCORE.get(classification, CATEGORY_SCORE["others"])


def parse_validation_paths(cmd: str) -> Tuple[str, str]:
    if not isinstance(cmd, str) or not cmd:
        return "", ""
    tokens = cmd.split()
    try:
        idx = tokens.index("-v")
    except ValueError:
        idx = None
    if idx is not None and idx + 2 < len(tokens):
        return tokens[idx + 1], tokens[idx + 2]
    if len(tokens) >= 3:
        return tokens[1], tokens[2]
    return "", ""


def select_unique_by_score(
    candidates: List[Dict[str, Any]],
    max_per_problem: int,
) -> Tuple[List[Dict[str, Any]], int]:
    seen_scores = set()
    selected: List[Dict[str, Any]] = []
    duplicates = 0
    sorted_candidates = sorted(
        candidates,
        key=lambda c: (c.get("score", 0), int(c.get("is_valid", False))),
        reverse=True,
    )
    for candidate in sorted_candidates:
        score = candidate.get("score", 0)
        if score in seen_scores:
            duplicates += 1
            continue
        seen_scores.add(score)
        selected.append(candidate)
        if max_per_problem and len(selected) >= max_per_problem:
            break
    return selected, duplicates


def collect_candidates(
    root: Path,
    include_patterns: Sequence[str],
    exclude_patterns: Sequence[str],
) -> Tuple[Dict[str, Dict[str, List[Dict[str, Any]]]], Counter]:
    scenarios: Dict[str, Dict[str, List[Dict[str, Any]]]] = defaultdict(lambda: defaultdict(list))
    stats: Counter = Counter()

    for result_path in iter_result_files(root, include_patterns, exclude_patterns):
        stats["result_files"] += 1
        rel_parts = result_path.relative_to(root).parts
        if len(rel_parts) < 2:
            stats["skipped_files_structure"] += 1
            continue

        if len(rel_parts) >= 3:
            model = rel_parts[0]
            scenario = rel_parts[1]
            if len(rel_parts) > 3:
                variant = "/".join(rel_parts[2:-1]) or rel_parts[-2]
            else:
                variant = rel_parts[2]
        else:
            model = rel_parts[0]
            scenario = rel_parts[0]
            variant = rel_parts[1] if len(rel_parts) == 2 else "unknown"

        try:
            payload = load_json(result_path)
        except json.JSONDecodeError:
            stats["skipped_json_error"] += 1
            continue
        except OSError:
            stats["skipped_io_error"] += 1
            continue

        if not isinstance(payload, dict):
            stats["skipped_non_dict_payload"] += 1
            continue

        results = payload.get("results")
        if not isinstance(results, list):
            stats["skipped_no_results"] += 1
            continue

        for entry in results:
            if not isinstance(entry, dict):
                stats["skipped_malformed_entries"] += 1
                continue
            problem_id = entry.get("problem_name") or Path(entry.get("problem_file") or "").stem
            if not problem_id:
                stats["skipped_no_problem_name"] += 1
                continue

            plan_text = load_solution_text(entry)
            classification = classify_entry(entry, plan_text)
            score = score_entry(entry, classification, plan_text)
            domain_file, problem_file_from_cmd = parse_validation_paths(entry.get("validation_cmd", ""))

            candidate = {
                "model": model,
                "variant": variant,
                "score": score,
                "classification": classification,
                "is_valid": bool(entry.get("is_valid")),
                "result_source": str(result_path.relative_to(root)),
                "solution_steps": [ln.strip() for ln in plan_text.splitlines() if ln.strip()],
                "raw_solution": plan_text,
                "solution_file": entry.get("solution_file") or "",
                "problem_file": entry.get("problem_file") or problem_file_from_cmd,
                "domain_file": entry.get("domain_file") or domain_file,
            }

            if entry.get("generation_error"):
                candidate["generation_error"] = entry["generation_error"]
            if entry.get("validation_message"):
                candidate["validation_message"] = entry["validation_message"][:200]

            scenarios[scenario][problem_id].append(candidate)
            stats["candidates_collected"] += 1

    return scenarios, stats


def write_scenario_payloads(
    scenarios: Dict[str, Dict[str, List[Dict[str, Any]]]],
    output_dir: Path,
    root: Path,
    min_solutions: int,
    max_per_problem: int,
) -> Counter:
    summary: Counter = Counter()
    output_dir.mkdir(parents=True, exist_ok=True)

    for scenario_name in sorted(scenarios.keys()):
        problems = scenarios[scenario_name]
        scenario_payload: Dict[str, List[Dict[str, Any]]] = {}
        models: set[str] = set()
        variants: set[str] = set()
        scenario_stats: Counter = Counter()

        for problem_id, candidates in problems.items():
            selected, duplicates = select_unique_by_score(candidates, max_per_problem)
            scenario_stats["duplicates_skipped"] += duplicates
            if len(selected) < min_solutions:
                scenario_stats["problems_discarded"] += 1
                continue
            scenario_payload[problem_id] = selected
            scenario_stats["problems_kept"] += 1
            scenario_stats["solutions_kept"] += len(selected)
            models.update(cand["model"] for cand in selected)
            variants.update(cand["variant"] for cand in selected)

        if not scenario_payload:
            continue

        out_path = output_dir / f"{scenario_name}.json"
        metadata = {
            "models": sorted(models),
            "variants": sorted(variants),
            "duplicates_skipped": scenario_stats["duplicates_skipped"],
            "problems_discarded": scenario_stats["problems_discarded"],
        }
        payload = {
            "scenario": scenario_name,
            "source_root": str(root),
            "problem_count": scenario_stats["problems_kept"],
            "score_scale": "0-100",
            "metadata": metadata,
            "problems": scenario_payload,
        }
        with out_path.open("w", encoding="utf-8") as handle:
            json.dump(payload, handle, ensure_ascii=False, indent=2)

        print(
            f"[write] {scenario_name}: kept {scenario_stats['problems_kept']} "
            f"problems / {scenario_stats['solutions_kept']} solutions -> {out_path}"
        )

        summary["scenarios_written"] += 1
        summary["problems_kept"] += scenario_stats["problems_kept"]
        summary["solutions_kept"] += scenario_stats["solutions_kept"]

    return summary


def main() -> None:
    args = parse_args()
    root = args.root
    output_dir = args.output_dir

    include = args.include_pattern
    if include is None:
        include = DEFAULT_INCLUDE.copy()
    include = [p for p in include if p]
    exclude: List[str] = DEFAULT_EXCLUDE.copy()
    if args.exclude_pattern:
        for item in args.exclude_pattern:
            if item == "":
                exclude = []
            else:
                exclude.append(item)

    scenarios, stats = collect_candidates(root, include, exclude)
    print(
        f"[info] scanned {stats['result_files']} result files, collected "
        f"{stats['candidates_collected']} candidate solutions"
    )
    for key in sorted(k for k in stats if k.startswith("skipped_")):
        print(f"[warn] {key}: {stats[key]}")

    summary = write_scenario_payloads(
        scenarios=scenarios,
        output_dir=output_dir,
        root=root,
        min_solutions=args.min_solutions,
        max_per_problem=args.max_per_problem,
    )

    if summary["scenarios_written"]:
        print(
            f"[done] wrote {summary['scenarios_written']} scenario files "
            f"covering {summary['problems_kept']} problems and "
            f"{summary['solutions_kept']} solutions"
        )
    else:
        print("[done] no scenario produced enough diverse solutions; nothing written.")


if __name__ == "__main__":
    main()
