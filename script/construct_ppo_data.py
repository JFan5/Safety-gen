#!/usr/bin/env python3
"""
Construct PPO prompt-only dataset from problems already copied into ppo_500/.

Flow:
- For each scenario directory under ppo_500/<scenario>/, gather .pddl problems (non-domain files).
- Resolve domain file from the scenario root (domain3.pddl preferred, else domain.pddl, else first domain*.pddl).
- Render prompt variants via prompt_variants.build_prompt_multi.
- Write prompt-only JSONL to /groups/fkong/jfan5/ppo_data/<scenario>.jsonl (output dir configurable).

Records contain:
{
  "prompt": "...",
  "meta": {
    "scenario": "<scenario>",
    "domain_file": "<relative path>",
    "problem_file": "<relative path>",
    "prompt_variant_index": <int>,
    "pddl_version": "PDDL3" | "PDDL"
  }
}
"""
import argparse
import json
from pathlib import Path
from typing import Dict, List, Sequence, Tuple

from prompt_variants import build_prompt_multi

REPO_ROOT = Path(__file__).resolve().parent.parent
PPO_500_ROOT = REPO_ROOT / "ppo_500"
DEFAULT_OUTPUT_DIR = Path("/groups/fkong/jfan5/ppo_data")


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def detect_domain_file(scenario: str) -> Tuple[Path, str]:
    """Pick domain3.pddl if available, else domain.pddl, else first domain*.pddl under scenario root."""
    domain_dir = REPO_ROOT / scenario
    for name in ("domain3.pddl", "domain.pddl"):
        candidate = domain_dir / name
        if candidate.exists():
            version = "PDDL3" if "3" in candidate.name else "PDDL"
            return candidate, version
    matches = sorted(domain_dir.glob("domain*.pddl"))
    if not matches:
        raise FileNotFoundError(f"No domain file found in {domain_dir}")
    version = "PDDL3" if "3" in matches[0].name else "PDDL"
    return matches[0], version


def collect_problem_files_from_ppo(scenario_dir: Path, limit: int | None) -> List[Path]:
    files = [p for p in sorted(scenario_dir.glob("*.pddl")) if "domain" not in p.name.lower()]
    if limit is not None:
        files = files[:limit]
    if not files:
        raise FileNotFoundError(f"No problem files found under {scenario_dir}")
    return files


def build_prompts_for_problem(
    domain_text: str,
    problem_text: str,
    pddl_version: str,
    prompt_variants: int,
) -> List[Tuple[str, int]]:
    prompts: List[Tuple[str, int]] = []
    for variant_idx in range(1, prompt_variants + 1):
        prompt = build_prompt_multi(
            domain_content=domain_text,
            problem_content=problem_text,
            pddl_version=pddl_version,
            variant=variant_idx,
        )
        prompts.append((prompt, variant_idx))
    return prompts


def process_scenario(
    scenario: str,
    problems_per_domain: int | None,
    prompt_variants: int,
) -> List[Dict]:
    scenario_dir = PPO_500_ROOT / scenario
    if not scenario_dir.exists():
        raise FileNotFoundError(f"Scenario directory not found: {scenario_dir}")

    domain_file, pddl_version = detect_domain_file(scenario)
    domain_text = read_text(domain_file)
    problem_files = collect_problem_files_from_ppo(scenario_dir, problems_per_domain)

    records: List[Dict] = []
    for prob_path in problem_files:
        problem_text = read_text(prob_path)
        for prompt, variant_idx in build_prompts_for_problem(domain_text, problem_text, pddl_version, prompt_variants):
            records.append(
                {
                    "prompt": prompt,
                    "meta": {
                        "scenario": scenario,
                        "domain_file": str(domain_file.relative_to(REPO_ROOT)),
                        "problem_file": str(prob_path.relative_to(REPO_ROOT)),
                        "prompt_variant_index": variant_idx,
                        "pddl_version": pddl_version,
                    },
                }
            )
    return records


def main():
    parser = argparse.ArgumentParser(description="Construct PPO prompt-only dataset from ppo_500 problems.")
    parser.add_argument("--output-dir", "-o", default=str(DEFAULT_OUTPUT_DIR), help="Output directory for PPO JSONL files")
    parser.add_argument(
        "--domains",
        nargs="+",
        default=None,
        help="Scenario directories to include (default: all subdirs under ppo_500)",
    )
    parser.add_argument(
        "--problems-per-domain",
        type=int,
        default=None,
        help="Max number of problems per domain (default: use all in ppo_500/<scenario>)",
    )
    parser.add_argument(
        "--prompt-variants",
        type=int,
        default=5,
        help="Number of prompt variants per problem (default 5)",
    )
    args = parser.parse_args()

    if args.prompt_variants <= 0:
        raise ValueError("--prompt-variants must be positive.")
    if args.problems_per_domain is not None and args.problems_per_domain <= 0:
        raise ValueError("--problems-per-domain must be positive when provided.")

    if args.domains is None:
        scenarios = [p.name for p in sorted(PPO_500_ROOT.iterdir()) if p.is_dir()]
    else:
        scenarios = args.domains

    out_dir = Path(args.output_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    for scenario in scenarios:
        print(f"[+] Building prompts for scenario: {scenario}")
        records = process_scenario(
            scenario=scenario,
            problems_per_domain=args.problems_per_domain,
            prompt_variants=args.prompt_variants,
        )
        out_path = out_dir / f"{scenario}.jsonl"
        with out_path.open("w", encoding="utf-8") as f:
            for rec in records:
                f.write(json.dumps(rec, ensure_ascii=False) + "\n")
        print(f"    prompts generated: {len(records)} -> {out_path}")

    print("Done.")


if __name__ == "__main__":
    main()
