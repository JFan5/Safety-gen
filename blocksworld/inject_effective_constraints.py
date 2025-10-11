#!/usr/bin/env python3
import argparse
import os
import re
import shutil
import subprocess
from pathlib import Path
from typing import List, Optional, Tuple, Set


def read_text(path: Path) -> str:
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


def write_text(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(text)


def parse_plan_actions(soln_text: str) -> List[str]:
    actions: List[str] = []
    for line in soln_text.splitlines():
        line = line.strip()
        if not line:
            continue
        if line.startswith("(") and line.endswith(")"):
            actions.append(line[1:-1].strip())
    return actions


def extract_block(problem_text: str, key: str) -> Optional[str]:
    m = re.search(rf"\(\s*:{re.escape(key)}\b", problem_text, flags=re.IGNORECASE)
    if not m:
        return None
    start = m.start()
    depth = 0
    for i in range(start, len(problem_text)):
        c = problem_text[i]
        if c == "(":
            depth += 1
        elif c == ")":
            depth -= 1
            if depth == 0:
                return problem_text[start : i + 1]
    return None


def extract_objects(objects_block: str) -> List[str]:
    if not objects_block:
        return []
    inner = re.sub(r"^\(\s*:objects", "", objects_block, flags=re.IGNORECASE).rstrip(")")
    toks = re.findall(r"[^\s()]+", inner)
    # remove type annotations if present: a b - block
    result: List[str] = []
    for tok in toks:
        if tok == "-":
            break
        result.append(tok)
    return result or toks


def extract_on_pairs(block_text: str) -> Set[Tuple[str, str]]:
    pairs: Set[Tuple[str, str]] = set()
    if not block_text:
        return pairs
    for m in re.finditer(r"\(\s*on\s+([^\s()]+)\s+([^\s()]+)\s*\)", block_text, flags=re.IGNORECASE):
        pairs.add((m.group(1), m.group(2)))
    return pairs


def derive_effective_constraint(problem_text: str, plan_actions: List[str]) -> Optional[str]:
    """
    Return a single PDDL3 trajectory constraint that blocks at least one action
    in the given classical plan, while staying compatible with init/goal.

    Strategy (safe and effective):
    - If plan contains any "stack x y", add (always (not (on x y)))
      This blocks that step but is consistent with typical goals that don't require on x y.
    - Else if plan contains any "pickup x", add (always (not (on-table x)))
      This forbids picking up that block from table.
    Fallback to a generic safety constraint if nothing matches.
    """
    init_block = extract_block(problem_text, "init")
    goal_block = extract_block(problem_text, "goal")
    init_on = extract_on_pairs(init_block or "")
    goal_on = extract_on_pairs(goal_block or "")

    # 0) Prefer a permissive requirement the old plan violates: require that some block is held sometime
    #    Pick a block that never appears as the first argument of any action in the plan
    objects_block = extract_block(problem_text, "objects") or ""
    all_objs = extract_objects(objects_block)
    first_args_in_plan: Set[str] = set()
    for act in plan_actions:
        parts = re.findall(r"[^\s()]+", act)
        if not parts:
            continue
        if len(parts) >= 2:
            first_args_in_plan.add(parts[1])
    candidate_objs = [o for o in all_objs if o not in first_args_in_plan]
    if candidate_objs:
        z = candidate_objs[0]
        # This invalidates the old plan (which never holds z) but should remain solvable
        return f"(sometime (holding {z}))"

    # 1) Fallback: block a specific on relation used by a stack step that is not a goal or init literal
    for act in plan_actions:
        # normalize spacing
        parts = re.findall(r"[^\s()]+", act)
        if not parts:
            continue
        name = parts[0].lower()
        args = parts[1:]
        if name == "stack" and len(args) >= 2:
            x, y = args[0], args[1]
            # avoid contradicting goal or init directly
            if (x, y) not in init_on and (x, y) not in goal_on:
                return f"(always (not (on {x} {y})))"

    # 2) Block a pickup by forbidding on-table for that object if not required by goal and not true in init
    goal_text = goal_block or ""
    for act in plan_actions:
        parts = re.findall(r"[^\s()]+", act)
        if not parts:
            continue
        name = parts[0].lower()
        args = parts[1:]
        if name == "pickup" and len(args) >= 1:
            x = args[0]
            # avoid if goal explicitly needs on-table x
            if re.search(rf"\(\s*on-table\s+{re.escape(x)}\s*\)", goal_text, flags=re.IGNORECASE):
                continue
            # avoid contradiction if init already has on-table x
            if re.search(rf"\(\s*on-table\s+{re.escape(x)}\s*\)", init_block or "", flags=re.IGNORECASE):
                continue
            return f"(always (not (on-table {x})))"

    # 3) Generic safety: forbid any reverse of a goal on to avoid cycles
    for (x, y) in goal_on:
        rev = (y, x)
        if rev not in init_on:
            return f"(always (not (on {rev[0]} {rev[1]})))"

    return None


def inject_constraints(problem_text: str, constraint_expr: str) -> str:
    if re.search(r"\(\s*:constraints\b", problem_text, flags=re.IGNORECASE):
        return problem_text
    # estimate indentation from last line
    last_newline = problem_text.rfind("\n")
    indent = ""
    if last_newline != -1:
        tail = problem_text[last_newline + 1 :]
        m = re.match(r"(\s*)", tail)
        indent = m.group(1) if m else ""
    if not indent:
        indent = "  "
    block = f"\n{indent}(:constraints\n{indent}  {constraint_expr}\n{indent})\n"
    last_paren = problem_text.rfind(")")
    if last_paren == -1:
        raise ValueError("Problem missing closing paren")
    return problem_text[:last_paren] + block + problem_text[last_paren:]


def run_validate(domain_file: Path, problem_file: Path, soln_file: Path, timeout: int = 20) -> bool:
    cmd = f"Validate {domain_file} {problem_file} {soln_file}"
    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=timeout)
        if result.returncode != 0:
            return False
        out = (result.stdout or "").lower()
        return ("plan valid" in out) or ("plan successfully executed" in out)
    except Exception:
        return False


def run_optic(domain_file: Path, problem_file: Path, timeout: int = 20) -> Tuple[bool, Optional[str]]:
    optic = Path.home() / "optic/release/optic/optic-clp"
    soln_path = problem_file.with_suffix(".soln")
    cmd = f"{optic} -v0 -N {domain_file} {problem_file} > {soln_path}"
    try:
        result = subprocess.run(cmd, shell=True, text=True, timeout=timeout)
        if result.returncode == 0 and soln_path.exists():
            # normalize to Validate plan format: keep only (action ...) lines
            content = read_text(soln_path)
            actions: List[str] = []
            for line in content.splitlines():
                line = line.strip()
                if line.startswith("(") and line.endswith(")"):
                    actions.append(line)
            if actions:
                write_text(soln_path, "\n".join(actions) + "\n")
            return True, str(soln_path)
        return False, None
    except subprocess.TimeoutExpired:
        if soln_path.exists():
            try:
                soln_path.unlink()
            except Exception:
                pass
        return False, None


def process_problem(domain_file: Path, problem_file: Path, soln_file: Path, out_dir: Path) -> Optional[Path]:
    problem_text = read_text(problem_file)
    plan_actions = parse_plan_actions(read_text(soln_file))
    if not plan_actions:
        return None
    constraint = derive_effective_constraint(problem_text, plan_actions)
    if not constraint:
        return None
    new_text = inject_constraints(problem_text, constraint)
    out_path = out_dir / problem_file.name
    write_text(out_path, new_text)

    # 1) Ensure PDDL2 plan is invalid now
    old_soln_copy = out_dir / soln_file.name
    shutil.copy2(soln_file, old_soln_copy)
    valid_old = run_validate(domain_file, out_path, old_soln_copy)
    if valid_old:
        # constraint ineffective, discard
        try:
            out_path.unlink()
        except Exception:
            pass
        try:
            old_soln_copy.unlink()
        except Exception:
            pass
        return None

    # 2) Ensure solvable by optic
    ok, new_soln = run_optic(domain_file, out_path)
    if not ok:
        # unsolved -> discard
        try:
            out_path.unlink()
        except Exception:
            pass
        try:
            old_soln_copy.unlink()
        except Exception:
            pass
        return None
    return out_path


def main():
    parser = argparse.ArgumentParser(description="Inject effective PDDL3 constraints into Blocksworld problems")
    parser.add_argument("--domain", default="domain3.pddl", help="Domain file supporting :constraints")
    parser.add_argument("--in_dir", required=True, help="Directory with PDDL2 problems and .soln plans")
    parser.add_argument("--out_dir", required=True, help="Output directory for constrained problems")
    parser.add_argument("--limit", type=int, default=50, help="Max number of problems to process")
    args = parser.parse_args()

    in_dir = Path(args.in_dir)
    out_dir = Path(args.out_dir)
    # rm the out_dir
    shutil.rmtree(out_dir, ignore_errors=True)
    out_dir.mkdir(parents=True, exist_ok=True)

    domain_path = Path(args.domain)
    if not domain_path.exists():
        print(f"Error: domain not found: {domain_path}")
        return

    problem_paths = sorted([p for p in in_dir.glob("*.pddl")])
    processed = 0
    kept = 0
    for p in problem_paths:
        if processed >= args.limit:
            break
        s = p.with_suffix(".soln")
        if not s.exists():
            continue
        processed += 1
        result = process_problem(domain_path, p, s, out_dir)
        if result is not None:
            kept += 1
            print(f"✓ Effective constraint: {p.name} -> {result.name}")
        else:
            print(f"– Skipped (ineffective or unsolved): {p.name}")

    print(f"Done. Kept {kept}/{processed} problems with effective constraints.")


if __name__ == "__main__":
    main()


