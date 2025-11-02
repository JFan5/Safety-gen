#!/usr/bin/env python3
"""
Construct a DPO dataset from scored summaries.

Inputs:
- scored_summaries.json produced by score_solutions.py
- optional raw result JSON files to enrich prompts with PDDL problem/domain text

Outputs:
- JSONL with DPO pairs: each line has {prompt, chosen, rejected, meta}

Pairing strategy:
- For each problem, use entries with score 100 as chosen and lowest score as rejected
- Skip problems that don't have any 100-score entries
- Skip problems where all entries have score 100 (no valid rejection)
- Optionally: --all-pairs to generate pairs for all 100-score entries vs lowest score
"""

import argparse
import json
import os
from functools import lru_cache
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


REPO_ROOT = Path(__file__).resolve().parent.parent


def _load_scored(scored_path: str) -> Tuple[Dict[str, List[Dict[str, Any]]], Dict[str, Any]]:
    with open(scored_path, "r", encoding="utf-8") as f:
        payload = json.load(f)
    return payload.get("data", {}), payload


def _problem_key_split(key: str) -> Tuple[str, str]:
    # key format: "scenario/problem"
    if "/" in key:
        scenario, problem = key.split("/", 1)
    else:
        scenario, problem = "unknown", key
    return scenario, problem


def _read_text_file(path: str) -> str:
    try:
        with open(path, "r", encoding="utf-8") as f:
            return f.read()
    except Exception:
        return ""


def _candidate_problem_filenames(problem: str) -> List[str]:
    base = (problem or "").strip()
    variants = {base}
    stripped = base.lstrip("0") or (base if base else "")
    if stripped:
        variants.add(stripped)
    for width in (2, 3, 4, 5):
        if base:
            variants.add(base.zfill(width))
        if stripped:
            variants.add(stripped.zfill(width))
    filenames = [f"{v}.pddl" for v in variants if v]
    # 保守地加入常见前缀形式
    for v in list(variants):
        if v:
            filenames.append(f"p{v}.pddl")
            filenames.append(f"prob{v}.pddl")
    return list(dict.fromkeys(filenames))  # 去重同时保持顺序


@lru_cache(maxsize=None)
def _locate_domain_file(scenario: str) -> str:
    scenario_dir = REPO_ROOT / scenario
    if not scenario_dir.is_dir():
        return ""
    for candidate in ("domain.pddl", "domain3.pddl"):
        path = scenario_dir / candidate
        if path.exists():
            return str(path)
    matches = list(scenario_dir.rglob("domain*.pddl"))
    return str(matches[0]) if matches else ""


DEFAULT_PROBLEM_DIRS = (
    "testing_problems",
    "training_problems",
    "testing_problems3",
    "training_problems3",
    "problems",
)


@lru_cache(maxsize=None)
def _locate_problem_file(scenario: str, problem: str) -> str:
    scenario_dir = REPO_ROOT / scenario
    if not scenario_dir.is_dir():
        return ""
    filenames = _candidate_problem_filenames(problem)
    for rel in DEFAULT_PROBLEM_DIRS:
        root = scenario_dir / rel
        if not root.is_dir():
            continue
        for name in filenames:
            candidate = root / name
            if candidate.exists():
                return str(candidate)
    for path in scenario_dir.rglob("*.pddl"):
        if path.name in filenames:
            return str(path)
    return ""


def _resolve_pddl_paths(
    problem_key: str,
    index: Dict[str, Dict[str, str]],
) -> Tuple[str, str]:
    scenario, problem = _problem_key_split(problem_key)
    pf = ""
    df = ""
    if problem_key in index:
        pf = index[problem_key].get("problem_file") or ""
        df = index[problem_key].get("domain_file") or ""
        if pf and not os.path.exists(pf):
            pf = ""
        if df and not os.path.exists(df):
            df = ""

    if not pf:
        pf = _locate_problem_file(scenario, problem)

    if not df:
        df = _locate_domain_file(scenario)

    if not df and pf:
        # Try files adjacent to the problem file
        pf_path = Path(pf)
        for candidate in (
            pf_path.with_name("domain.pddl"),
            pf_path.parent.parent / "domain.pddl",
        ):
            if candidate.exists():
                df = str(candidate)
                break

    return df, pf


def _index_raw_results(raw_paths: List[str]) -> Dict[str, Dict[str, str]]:
    """
    Build mapping: problem_key -> {problem_file, domain_file}
    where problem_key == f"{scenario}/{problem_name}"
    """
    index: Dict[str, Dict[str, str]] = {}
    for p in raw_paths:
        if not p or not os.path.exists(p):
            continue
        try:
            with open(p, "r") as f:
                data = json.load(f)
        except Exception:
            continue
        for item in data.get("results", []) or []:
            scenario = (item.get("scenario") or "unknown").strip()
            problem = (item.get("problem_name") or "unknown").strip()
            key = f"{scenario}/{problem}"
            pf = item.get("problem_file") or ""
            df = item.get("domain_file") or ""
            if key not in index:
                index[key] = {"problem_file": pf, "domain_file": df}
    return index


def _build_prompt(
    problem_key: str,
    index: Dict[str, Dict[str, str]],
    include_pddl: bool,
    resolved_paths: Optional[Tuple[str, str]] = None,
) -> str:
    # 使用与 SFT 相同的 prompt 模板（prompt.txt），插入 domain_content 和 problem_content
    df = pf = ""
    if include_pddl:
        if resolved_paths is None:
            resolved_paths = _resolve_pddl_paths(problem_key, index)
        df, pf = resolved_paths
    domain_content = _read_text_file(df)
    problem_content = _read_text_file(pf)

    try:
        with open("prompt.txt", "r", encoding="utf-8") as f:
            template = f.read()
    except Exception:
        # 回退：如果找不到模板，使用简易模板，仍保持占位符含义
        template = (
            "You are a PDDL planning expert.\n\nDOMAIN:\n{domain_content}\n\n"
            "PROBLEM:\n{problem_content}\n\n### Plan:\n"
        )
    return template.format(domain_content=domain_content, problem_content=problem_content)


def _seq_text(entry: Dict[str, Any]) -> str:
    seq: List[str] = entry.get("planning_sequence") or []
    if isinstance(seq, list):
        return "\n".join(seq)
    if isinstance(seq, str):
        return seq
    return ""


def _pairs_for_problem(entries: List[Dict[str, Any]], all_pairs: bool) -> List[Tuple[Dict[str, Any], Dict[str, Any]]]:
    if not entries or len(entries) < 2:
        return []
    
    # Find entries with score 100 (chosen) and lowest score (rejected)
    score_100_entries = [e for e in entries if int(e.get("score", 0)) == 100]
    
    # If no 100-score entries, skip this problem
    if not score_100_entries:
        return []
    
    # Find the entry with the lowest score
    min_score_entry = min(entries, key=lambda e: int(e.get("score", 0)))
    
    # If the lowest score is also 100, skip this problem (no valid rejection)
    if int(min_score_entry.get("score", 0)) == 100:
        return []
    
    pairs: List[Tuple[Dict[str, Any], Dict[str, Any]]] = []
    
    if all_pairs:
        # Generate all pairs: each 100-score entry vs lowest score entry
        for chosen in score_100_entries:
            pairs.append((chosen, min_score_entry))
    else:
        # Use the first 100-score entry as chosen
        chosen = score_100_entries[0]
        pairs.append((chosen, min_score_entry))
    
    return pairs


def construct_dpo(scored_path: str, output_path: str, raw_jsons: List[str], include_pddl: bool, all_pairs: bool) -> int:
    scored, _payload = _load_scored(scored_path)
    index = _index_raw_results(raw_jsons) if raw_jsons else {}
    written = 0
    with open(output_path, "w") as out:
        for problem_key, entries in scored.items():
            resolved_paths = _resolve_pddl_paths(problem_key, index) if include_pddl else ("", "")
            prompt = _build_prompt(problem_key, index, include_pddl, resolved_paths)
            for chosen, rejected in _pairs_for_problem(entries, all_pairs):
                chosen_text = _seq_text(chosen)
                rejected_text = _seq_text(rejected)
                if not chosen_text or not rejected_text:
                    continue
                record = {
                    "prompt": prompt,
                    "chosen": chosen_text,
                    "rejected": rejected_text,
                    "meta": {
                        "problem_key": problem_key,
                        "chosen_score": int(chosen.get("score", 0)),
                        "rejected_score": int(rejected.get("score", 0)),
                        "chosen_classification": chosen.get("classification"),
                        "rejected_classification": rejected.get("classification"),
                        "chosen_source": chosen.get("source_file"),
                        "rejected_source": rejected.get("source_file"),
                        "chosen_solution_file": chosen.get("solution_file"),
                        "rejected_solution_file": rejected.get("solution_file"),
                        "domain_file": resolved_paths[0] if include_pddl else "",
                        "problem_file": resolved_paths[1] if include_pddl else "",
                    },
                }
                out.write(json.dumps(record, ensure_ascii=False) + "\n")
                written += 1
    return written


def main():
    parser = argparse.ArgumentParser(description="Construct DPO dataset from scored summaries")
    parser.add_argument("scored_summaries", help="Path to scored_summaries.json produced by score_solutions.py")
    parser.add_argument("--output", "-o", default="dpo_dataset.jsonl", help="Output JSONL path")
    parser.add_argument("--raw-json", nargs="*", default=[], help="Optional raw results JSONs to enrich prompts with PDDL")
    pddl_group = parser.add_mutually_exclusive_group()
    pddl_group.add_argument("--include-pddl", dest="include_pddl", action="store_true", help="Include domain/problem PDDL text in prompt")
    pddl_group.add_argument("--no-pddl", dest="include_pddl", action="store_false", help="Skip inserting domain/problem PDDL text")
    parser.set_defaults(include_pddl=None)
    parser.add_argument("--all-pairs", action="store_true", help="Generate all higher-vs-lower pairs per problem")
    args = parser.parse_args()

    num = construct_dpo(
        scored_path=args.scored_summaries,
        output_path=args.output,
        raw_jsons=args.raw_json,
        include_pddl=True if args.include_pddl is None else args.include_pddl,
        all_pairs=args.all_pairs,
    )
    print(f"Wrote {num} DPO pairs to {args.output}")


if __name__ == "__main__":
    main()
