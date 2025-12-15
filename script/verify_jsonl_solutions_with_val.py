#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Verify that each JSONL entry's solution (plan) is VAL-valid.

Designed for datasets like:
  /jfan5/sft_data/pddl3_symbolized_four_scenarios_v3/grid.jsonl

Each line is a JSON object with:
  - meta.domain_file / meta.problem_file: paths (usually repo-relative)
  - path: solution text (plan)

This script streams the JSONL, runs VAL Validate, and reports pass/fail stats.
"""

from __future__ import annotations

import argparse
import concurrent.futures as cf
import json
import os
import re
import subprocess
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, Iterable, List, Optional, Tuple


SUCCESS_MARKERS = (
    "plan valid",
    "successful plans",
    "plan executed successfully",
)


@dataclass(frozen=True)
class Job:
    idx: int
    raw: Dict[str, Any]


@dataclass(frozen=True)
class Result:
    idx: int
    scenario: str
    problem_name: str
    entry_type: str
    domain_file: str
    problem_file: str
    is_valid: bool
    val_returncode: int
    val_cmd: List[str]
    val_stdout_head: str
    val_stderr_head: str
    error: str


def _resolve_validate_bin(explicit: Optional[str]) -> str:
    if explicit:
        p = os.path.expanduser(explicit)
        if Path(p).exists():
            return p
        raise FileNotFoundError(f"Validate binary not found: {explicit}")

    candidates = [
        os.path.expanduser("~/VAL/build/linux64/Release/bin/Validate"),
        os.path.expanduser("~/VAL/build/bin/Validate"),
        "/home/ubuntu/VAL/build/linux64/Release/bin/Validate",
        "/home/ubuntu/VAL/build/bin/Validate",
    ]
    for c in candidates:
        if Path(c).exists():
            return c

    # Fall back to PATH lookup
    return "Validate"


def _is_val_success(stdout: str, returncode: int) -> bool:
    if returncode != 0:
        return False
    out = (stdout or "").lower()
    return any(m in out for m in SUCCESS_MARKERS)


def _truncate(s: str, n: int) -> str:
    s = s or ""
    if len(s) <= n:
        return s
    return s[:n] + "\n...<truncated>...\n"


_PROMPT_RE = re.compile(r"\n\nDomain:\n(?P<domain>[\s\S]*?)\n\nProblem:\n(?P<problem>[\s\S]*)\Z")


def _extract_domain_problem_from_prompt(prompt: str) -> Tuple[str, str]:
    """
    Extract domain/problem PDDL from the entry's prompt.

    Expected format (as produced by pddl3/pddl_symbolized_v3.py):
        <instruction>\n\nDomain:\n<domain_pddl>\n\nProblem:\n<problem_pddl>
    """
    if not isinstance(prompt, str) or not prompt:
        raise ValueError("Missing or empty prompt")
    m = _PROMPT_RE.search(prompt)
    if not m:
        raise ValueError("Prompt does not match expected 'Domain/Problem' template")
    def _strip_leading_comments(text: str) -> str:
        # PDDL comments often start with ';' and may appear before (define ...)
        lines = text.splitlines()
        i = 0
        while i < len(lines):
            s = lines[i].lstrip()
            if not s:
                i += 1
                continue
            if s.startswith(";"):
                i += 1
                continue
            break
        return "\n".join(lines[i:]).strip()

    domain = _strip_leading_comments(m.group("domain"))
    problem = _strip_leading_comments(m.group("problem"))
    if not domain.startswith("(define"):
        raise ValueError("Extracted domain does not look like PDDL")
    if not problem.startswith("(define"):
        raise ValueError("Extracted problem does not look like PDDL (maybe missing '(define' after comments)")
    return domain + "\n", problem + "\n"


def _validate_one(
    *,
    validate_bin: str,
    repo_root: Path,
    idx: int,
    entry: Dict[str, Any],
    timeout_s: int,
    stdout_head: int,
    stderr_head: int,
    use_prompt_pddl: bool,
) -> Result:
    scenario = str(entry.get("scenario", ""))
    problem_name = str(entry.get("problem_name", ""))
    entry_type = str(entry.get("type", ""))

    meta = entry.get("meta") or {}
    domain_file = str(meta.get("domain_file", ""))
    problem_file = str(meta.get("problem_file", ""))

    solution_text = entry.get("path")
    if not isinstance(solution_text, str):
        solution_text = "" if solution_text is None else str(solution_text)

    prompt = entry.get("prompt", "")
    if not isinstance(prompt, str):
        prompt = "" if prompt is None else str(prompt)

    tmp_domain_path: Optional[str] = None
    tmp_problem_path: Optional[str] = None

    if use_prompt_pddl:
        try:
            domain_text, problem_text = _extract_domain_problem_from_prompt(prompt)
        except Exception as e:
            return Result(
                idx=idx,
                scenario=scenario,
                problem_name=problem_name,
                entry_type=entry_type,
                domain_file=domain_file,
                problem_file=problem_file,
                is_valid=False,
                val_returncode=-12,
                val_cmd=[],
                val_stdout_head="",
                val_stderr_head="",
                error=f"Prompt parse error: {e}",
            )
        try:
            with tempfile.NamedTemporaryFile(mode="w", suffix=".pddl", delete=False, encoding="utf-8") as df:
                tmp_domain_path = df.name
                df.write(domain_text)
            with tempfile.NamedTemporaryFile(mode="w", suffix=".pddl", delete=False, encoding="utf-8") as pf:
                tmp_problem_path = pf.name
                pf.write(problem_text)
            domain_path = Path(tmp_domain_path)
            problem_path = Path(tmp_problem_path)
        except Exception as e:
            return Result(
                idx=idx,
                scenario=scenario,
                problem_name=problem_name,
                entry_type=entry_type,
                domain_file=domain_file,
                problem_file=problem_file,
                is_valid=False,
                val_returncode=-13,
                val_cmd=[],
                val_stdout_head="",
                val_stderr_head="",
                error=f"Failed to materialize prompt PDDL: {e}",
            )
    else:
        if not domain_file or not problem_file:
            return Result(
                idx=idx,
                scenario=scenario,
                problem_name=problem_name,
                entry_type=entry_type,
                domain_file=domain_file,
                problem_file=problem_file,
                is_valid=False,
                val_returncode=-1,
                val_cmd=[],
                val_stdout_head="",
                val_stderr_head="",
                error="Missing meta.domain_file or meta.problem_file",
            )
        domain_path = (repo_root / domain_file).resolve() if not os.path.isabs(domain_file) else Path(domain_file)
        problem_path = (repo_root / problem_file).resolve() if not os.path.isabs(problem_file) else Path(problem_file)

    if not domain_path.exists():
        return Result(
            idx=idx,
            scenario=scenario,
            problem_name=problem_name,
            entry_type=entry_type,
            domain_file=str(domain_path),
            problem_file=str(problem_path),
            is_valid=False,
            val_returncode=-1,
            val_cmd=[],
            val_stdout_head="",
            val_stderr_head="",
            error=f"Domain file not found: {domain_path}",
        )

    if not problem_path.exists():
        return Result(
            idx=idx,
            scenario=scenario,
            problem_name=problem_name,
            entry_type=entry_type,
            domain_file=str(domain_path),
            problem_file=str(problem_path),
            is_valid=False,
            val_returncode=-1,
            val_cmd=[],
            val_stdout_head="",
            val_stderr_head="",
            error=f"Problem file not found: {problem_path}",
        )

    if not solution_text.strip():
        return Result(
            idx=idx,
            scenario=scenario,
            problem_name=problem_name,
            entry_type=entry_type,
            domain_file=str(domain_path),
            problem_file=str(problem_path),
            is_valid=False,
            val_returncode=-1,
            val_cmd=[],
            val_stdout_head="",
            val_stderr_head="",
            error="Empty solution text",
        )

    # Write plan to a temporary .soln file
    tmp_path = None
    try:
        with tempfile.NamedTemporaryFile(mode="w", suffix=".soln", delete=False, encoding="utf-8") as f:
            tmp_path = f.name
            if solution_text and not solution_text.endswith("\n"):
                f.write(solution_text + "\n")
            else:
                f.write(solution_text)

        cmd = [validate_bin, "-v", str(domain_path), str(problem_path), str(tmp_path)]
        proc = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=timeout_s,
        )
        ok = _is_val_success(proc.stdout, proc.returncode)
        err = "" if ok else "VAL reported invalid plan"
        return Result(
            idx=idx,
            scenario=scenario,
            problem_name=problem_name,
            entry_type=entry_type,
            domain_file=str(domain_path),
            problem_file=str(problem_path),
            is_valid=bool(ok),
            val_returncode=int(proc.returncode),
            val_cmd=cmd,
            val_stdout_head=_truncate(proc.stdout, stdout_head),
            val_stderr_head=_truncate(proc.stderr, stderr_head),
            error=err,
        )
    except subprocess.TimeoutExpired:
        return Result(
            idx=idx,
            scenario=scenario,
            problem_name=problem_name,
            entry_type=entry_type,
            domain_file=str(domain_path),
            problem_file=str(problem_path),
            is_valid=False,
            val_returncode=-2,
            val_cmd=[validate_bin, "-v", str(domain_path), str(problem_path), "<tmp.soln>"],
            val_stdout_head="",
            val_stderr_head="",
            error=f"Timeout after {timeout_s}s",
        )
    except Exception as e:
        return Result(
            idx=idx,
            scenario=scenario,
            problem_name=problem_name,
            entry_type=entry_type,
            domain_file=str(domain_path),
            problem_file=str(problem_path),
            is_valid=False,
            val_returncode=-3,
            val_cmd=[],
            val_stdout_head="",
            val_stderr_head="",
            error=f"Exception: {e}",
        )
    finally:
        if tmp_path:
            try:
                os.unlink(tmp_path)
            except OSError:
                pass
        if tmp_domain_path:
            try:
                os.unlink(tmp_domain_path)
            except OSError:
                pass
        if tmp_problem_path:
            try:
                os.unlink(tmp_problem_path)
            except OSError:
                pass


def _iter_jobs(jsonl_path: Path, limit: int) -> Iterable[Job]:
    with jsonl_path.open("r", encoding="utf-8") as f:
        for i, line in enumerate(f, 1):
            if limit and i > limit:
                break
            line = line.strip()
            if not line:
                continue
            try:
                obj = json.loads(line)
            except Exception as e:
                yield Job(idx=i, raw={"_parse_error": str(e), "_raw_line": line[:2000]})
                continue
            yield Job(idx=i, raw=obj)


def main() -> None:
    ap = argparse.ArgumentParser(description="Verify JSONL solutions using VAL Validate")
    ap.add_argument("jsonl", help="Path to JSONL (one JSON object per line)")
    ap.add_argument("--repo-root", default="/home/ubuntu/Safety-gen", help="Repo root for resolving relative meta paths")
    ap.add_argument("--validate-bin", default=None, help="Path to VAL Validate binary (optional)")
    ap.add_argument(
        "--use-prompt-pddl",
        action="store_true",
        help="Validate against domain/problem embedded in 'prompt' (recommended for symbolized datasets).",
    )
    ap.add_argument("--workers", type=int, default=8, help="Parallel workers (processes/threads)")
    ap.add_argument("--timeout", type=int, default=30, help="VAL timeout per instance (seconds)")
    ap.add_argument("--limit", type=int, default=0, help="If >0, only check first N lines")
    ap.add_argument("--out", default=None, help="Write failures to this JSON file")
    ap.add_argument("--print-failures", type=int, default=20, help="Print first K failures")
    ap.add_argument("--stdout-head", type=int, default=2000, help="Keep first N chars of VAL stdout")
    ap.add_argument("--stderr-head", type=int, default=2000, help="Keep first N chars of VAL stderr")
    ap.add_argument("--progress-every", type=int, default=50, help="Print progress every N items")
    args = ap.parse_args()

    jsonl_path = Path(args.jsonl)
    if not jsonl_path.exists():
        raise FileNotFoundError(f"JSONL not found: {jsonl_path}")

    repo_root = Path(args.repo_root)
    validate_bin = _resolve_validate_bin(args.validate_bin)

    # Load jobs (stream, but we need a list to count / parallelize)
    jobs = list(_iter_jobs(jsonl_path, args.limit))
    total = len(jobs)

    print(f"[Info] JSONL: {jsonl_path}")
    print(f"[Info] Repo root: {repo_root}")
    print(f"[Info] Validate bin: {validate_bin}")
    print(f"[Info] Total jobs: {total} (limit={args.limit or 'all'})")

    n_ok = 0
    n_fail = 0
    failures: List[Dict[str, Any]] = []

    def submit(executor: cf.Executor, job: Job):
        # Special-case parse error records
        if "_parse_error" in job.raw:
            r = Result(
                idx=job.idx,
                scenario="",
                problem_name="",
                entry_type="",
                domain_file="",
                problem_file="",
                is_valid=False,
                val_returncode=-10,
                val_cmd=[],
                val_stdout_head="",
                val_stderr_head="",
                error=f"JSON parse error: {job.raw.get('_parse_error')}",
            )
            fut: cf.Future = cf.Future()
            fut.set_result(r)
            return fut

        return executor.submit(
            _validate_one,
            validate_bin=validate_bin,
            repo_root=repo_root,
            idx=job.idx,
            entry=job.raw,
            timeout_s=args.timeout,
            stdout_head=args.stdout_head,
            stderr_head=args.stderr_head,
            use_prompt_pddl=bool(args.use_prompt_pddl),
        )

    # Threads are fine: we mostly spawn subprocesses
    with cf.ThreadPoolExecutor(max_workers=max(1, args.workers)) as ex:
        futs = [submit(ex, j) for j in jobs]

        for done_i, fut in enumerate(cf.as_completed(futs), 1):
            r: Result = fut.result()
            if r.is_valid:
                n_ok += 1
            else:
                n_fail += 1
                failures.append(
                    {
                        "idx": r.idx,
                        "scenario": r.scenario,
                        "problem_name": r.problem_name,
                        "type": r.entry_type,
                        "domain_file": r.domain_file,
                        "problem_file": r.problem_file,
                        "val_returncode": r.val_returncode,
                        "val_cmd": r.val_cmd,
                        "error": r.error,
                        "val_stdout_head": r.val_stdout_head,
                        "val_stderr_head": r.val_stderr_head,
                    }
                )

            if args.progress_every and done_i % args.progress_every == 0:
                print(f"[Progress] {done_i}/{total} done | ok={n_ok} fail={n_fail}")

    print("\n=== Summary ===")
    print(f"checked: {total}")
    print(f"valid:   {n_ok}")
    print(f"invalid: {n_fail}")
    if total:
        print(f"valid_rate: {n_ok/total:.4f}")

    if failures and args.print_failures:
        print("\n=== First failures ===")
        for f in sorted(failures, key=lambda x: x.get("idx", 0))[: args.print_failures]:
            print(f"- line={f['idx']} scenario={f.get('scenario')} problem={f.get('problem_name')} type={f.get('type')} rc={f.get('val_returncode')} err={f.get('error')}")

    if args.out:
        out_path = Path(args.out)
        out_path.parent.mkdir(parents=True, exist_ok=True)
        payload = {
            "jsonl": str(jsonl_path),
            "repo_root": str(repo_root),
            "validate_bin": validate_bin,
            "checked": total,
            "valid": n_ok,
            "invalid": n_fail,
            "failures": failures,
        }
        out_path.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")
        print(f"\n[Info] Wrote failure report: {out_path}")


if __name__ == "__main__":
    main()
