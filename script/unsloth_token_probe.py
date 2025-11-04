#!/usr/bin/env python3
"""
Measure prompt token lengths using the same chat template flow as the Unsloth
evaluation script. For each discovered scenario we pick the largest problem
file (by byte size) and report the resulting input token count.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Sequence, Tuple


def template_input(prompt: str, rich: bool = False) -> List[Dict[str, object]]:
    if rich:
        return [{"role": "user", "content": [{"type": "text", "text": prompt}]}]
    return [{"role": "user", "content": prompt}]


def read_text(path: Path) -> str:
    try:
        return path.read_text(encoding="utf-8")
    except Exception as exc:  # pragma: no cover - defensive I/O
        raise RuntimeError(f"Failed to read {path}: {exc}") from exc


def load_prompt_template(path: Path) -> str:
    if path.exists():
        return read_text(path)
    return "{domain_content}\n\n{problem_content}"


def normalize_versions(raw: Optional[Sequence[str]]) -> List[str]:
    if not raw:
        return ["PDDL3"]
    return sorted({item.upper() for item in raw})


def _domain_candidates(root: Path, version: str) -> Iterable[Path]:
    if version == "PDDL3":
        yield root / "domain3.pddl"
        yield root / "domain.pddl"
        yield root / "training_problems3" / "domain3.pddl"
        yield root / "all_problems3" / "domain3.pddl"
    else:
        yield root / "domain.pddl"
        yield root / "training_problems" / "domain.pddl"
        yield root / "all_problems" / "domain.pddl"


def _problem_dir_candidates(root: Path, version: str, subset: str) -> Iterable[Path]:
    subset = subset.lower()
    if version == "PDDL3":
        yield root / "all_problems3" / subset
        yield root / f"{subset}_problems3"
        yield root / "all_problems3" / "training"
        yield root / "training_problems3"
        yield root / "all_problems3"
    else:
        yield root / "all_problems" / subset
        yield root / f"{subset}_problems"
        yield root / "all_problems" / "training"
        yield root / "training_problems"
        yield root / "all_problems"


def find_domain_file(root: Path, version: str) -> Optional[Path]:
    for candidate in _domain_candidates(root, version):
        if candidate.exists():
            return candidate
    return None


def find_problem_dir(root: Path, version: str, subset: str) -> Optional[Path]:
    for candidate in _problem_dir_candidates(root, version, subset):
        if candidate.exists() and candidate.is_dir():
            return candidate
    return None


def find_longest_problem(problems_dir: Path) -> Optional[Path]:
    candidates = [
        path
        for path in problems_dir.glob("*.pddl")
        if "domain" not in path.name.lower()
    ]
    if not candidates:
        return None
    return max(candidates, key=lambda path: path.stat().st_size)


def discover_scenarios(
    search_roots: Sequence[Path],
    scenarios: Optional[Sequence[str]],
    versions: Sequence[str],
    subset: str,
) -> Dict[str, Dict[str, Dict[str, Path]]]:
    desired = set(scenarios) if scenarios else None
    discovered: Dict[str, Dict[str, Dict[str, Path]]] = {}

    for base in search_roots:
        if not base.exists():
            continue
        for entry in sorted(base.iterdir()):
            if not entry.is_dir():
                continue
            scenario_name = entry.name
            if desired and scenario_name not in desired:
                continue
            version_map = discovered.setdefault(scenario_name, {})
            for version in versions:
                if version in version_map:
                    continue
                domain = find_domain_file(entry, version)
                problems_dir = find_problem_dir(entry, version, subset)
                if not domain or not problems_dir:
                    continue
                problem_file = find_longest_problem(problems_dir)
                if not problem_file:
                    continue
                version_map[version] = {
                    "domain": domain,
                    "problems_dir": problems_dir,
                    "problem_file": problem_file,
                }

    return {name: info for name, info in discovered.items() if info}


def load_tokenizer(
    model_name: str,
    max_seq_length: int,
    backend: str,
) -> Tuple[object, str]:
    backend = backend.lower()
    last_error: Optional[Exception] = None

    if backend in {"auto", "unsloth"}:
        try:
            from unsloth import FastLanguageModel  # type: ignore

            model, tokenizer = FastLanguageModel.from_pretrained(
                model_name=model_name,
                max_seq_length=max_seq_length,
            )
            FastLanguageModel.for_inference(model)
            del model
            return tokenizer, "unsloth"
        except Exception as exc:  # pragma: no cover - GPU only path
            last_error = exc
            if backend == "unsloth":
                raise

    if backend in {"auto", "transformers"}:
        try:
            from transformers import AutoTokenizer  # type: ignore
        except Exception as exc:
            raise RuntimeError(
                "transformers is required but not installed."
            ) from exc
        tokenizer = AutoTokenizer.from_pretrained(model_name)
        return tokenizer, "transformers"

    if last_error:
        raise last_error
    raise RuntimeError(f"Unsupported tokenizer backend {backend}")


def tokenize_prompt(tokenizer: object, prompt: str) -> int:
    kwargs = dict(
        tokenize=True,
        add_generation_prompt=True,
        return_tensors="pt",
    )

    for rich in (False, True):
        messages = template_input(prompt, rich=rich)
        try:
            tensor = tokenizer.apply_chat_template(
                messages,
                enable_thinking=False,
                **kwargs,
            )
            return int(tensor.shape[-1])
        except TypeError:
            try:
                tensor = tokenizer.apply_chat_template(messages, **kwargs)
                return int(tensor.shape[-1])
            except TypeError:
                continue
    raise RuntimeError("tokenizer.apply_chat_template failed for both payload formats.")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Report Unsloth-style prompt token counts for the largest problem per scenario.",
    )
    parser.add_argument("--model", required=True, help="Model name or path used for tokenization.")
    parser.add_argument(
        "--scenarios",
        nargs="*",
        default=None,
        help="Limit to specific scenario names.",
    )
    parser.add_argument(
        "--pddl",
        nargs="*",
        default=None,
        help="PDDL versions to include (default: PDDL3).",
    )
    parser.add_argument(
        "--subset",
        default="testing",
        help="Preferred problem subset (default: testing).",
    )
    parser.add_argument(
        "--max-seq-length",
        type=int,
        default=1536,
        help="Maximum sequence length used when loading Unsloth models.",
    )
    parser.add_argument(
        "--tokenizer-backend",
        default="auto",
        choices=["auto", "unsloth", "transformers"],
        help="How to load the tokenizer (default: auto).",
    )
    parser.add_argument(
        "--prompt-template",
        default="prompt.txt",
        help="Prompt template path (default: prompt.txt).",
    )
    parser.add_argument(
        "--json-output",
        default=None,
        help="Optional path to save the collected statistics as JSON.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    repo_root = Path(__file__).resolve().parents[1]
    search_roots = [repo_root, repo_root / "scenarios"]

    versions = normalize_versions(args.pddl)
    prompt_template = load_prompt_template(Path(args.prompt_template))

    scenarios = discover_scenarios(
        search_roots=search_roots,
        scenarios=args.scenarios,
        versions=versions,
        subset=args.subset,
    )

    if not scenarios:
        raise SystemExit("No scenarios found that match the requested filters.")

    tokenizer, backend = load_tokenizer(
        args.model,
        args.max_seq_length,
        args.tokenizer_backend,
    )
    print(f"Tokenizer backend: {backend}")

    results: List[Dict[str, object]] = []

    for scenario_name in sorted(scenarios):
        for version in versions:
            payload = scenarios[scenario_name].get(version)
            if not payload:
                continue

            domain_file = payload["domain"]
            problem_file = payload["problem_file"]

            domain_text = read_text(domain_file)
            problem_text = read_text(problem_file)

            prompt = prompt_template.format(
                domain_content=domain_text,
                problem_content=problem_text,
            )
            tokens = tokenize_prompt(tokenizer, prompt)

            record = {
                "scenario": scenario_name,
                "pddl": version,
                "domain_file": str(domain_file),
                "problem_file": str(problem_file),
                "problem_bytes": problem_file.stat().st_size,
                "prompt_characters": len(prompt),
                "prompt_tokens": tokens,
            }
            results.append(record)

            print(
                f"[{scenario_name} | {version}] tokens={tokens} "
                f"problem={problem_file} ({record['problem_bytes']} bytes)"
            )

    if args.json_output:
        output_path = Path(args.json_output)
        output_path.write_text(json.dumps(results, indent=2), encoding="utf-8")
        print(f"Wrote JSON to {output_path}")


if __name__ == "__main__":
    main()
