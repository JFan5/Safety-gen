#!/usr/bin/env python3

import os
import re
import argparse
from typing import List, Tuple


PROBLEM_HEADER_RE = re.compile(r"^\(define \(problem\s+([^\)]+)\)")
OBJECTS_START_RE = re.compile(r"^\s*\(:objects\b")


def read_file(path: str) -> str:
    with open(path, "r") as f:
        return f.read()


def write_file(path: str, content: str) -> None:
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w") as f:
        f.write(content)


def extract_problem_name(pddl: str) -> str:
    for line in pddl.splitlines():
        line = line.strip()
        if line.startswith("(define (problem"):
            # (define (problem NAME)
            return line[len("(define (problem"):].strip().rstrip(")").strip()
    return "unknown"


def extract_nuts(pddl: str) -> List[str]:
    nuts: List[str] = []
    in_objects = False
    for line in pddl.splitlines():
        ls = line.strip()
        if ls.startswith("(:objects"):
            in_objects = True
            # continue to parse following lines
        if in_objects:
            # find segment that declares nuts: "... nut1 nut2 - nut"
            if "- nut" in ls:
                # take tokens up to '-'
                tokens = ls.split("- nut")[0].split()
                for tok in tokens:
                    if tok.lower().startswith("nut"):
                        nuts.append(tok)
        if in_objects and ls.endswith(")"):
            in_objects = False
    # Fallback: also scan :init for (loose nutX)
    if not nuts:
        for line in pddl.splitlines():
            m = re.search(r"\(loose\s+(nut\w+)\)", line)
            if m:
                nuts.append(m.group(1))
    # deduplicate preserving order
    seen = set()
    ordered: List[str] = []
    for n in nuts:
        if n not in seen:
            seen.add(n)
            ordered.append(n)
    return ordered


def inject_constraints(pddl: str, ordering: List[Tuple[str, str]], safety: List[str]) -> str:
    # Insert a PDDL3 :constraints section before the final ")" of the problem
    # We assume the file ends with "))" on its own line like examples
    lines = pddl.strip().splitlines()
    if not lines:
        return pddl

    # Find index of the line that closes the goal "))"; append constraints before that
    # Robust approach: append just before the last ')' of the file
    insert_index = len(lines)

    constraints_lines: List[str] = []
    constraints_lines.append(" (:constraints")
    if ordering or safety:
        constraints_lines.append("  (and")
        # Ordering constraints using sometime-before over achievements of tightened nuts
        for a, b in ordering:
            constraints_lines.append(f"   (sometime-before (tightened {a}) (tightened {b}))")
        # Safety constraints passed through as raw PDDL3 constraint atoms/temporal formulas
        for c in safety:
            constraints_lines.append(f"   {c}")
        constraints_lines.append("  )")
    else:
        # Empty constraints allowed but include something benign
        constraints_lines.append("  (and)")
    constraints_lines.append(")")

    # Insert before final closing parenthesis of the problem definition
    # Detect trailing ")" lines; place constraints before the last line
    if lines[-1].strip() == ")":
        insert_index = len(lines) - 1
    new_lines = lines[:insert_index] + constraints_lines + lines[insert_index:]
    return "\n".join(new_lines) + ("\n" if pddl.endswith("\n") else "")


def build_default_ordering(nuts: List[str]) -> List[Tuple[str, str]]:
    # Default: order by numeric suffix if present, lower number has higher priority
    def key(n: str) -> Tuple[int, str]:
        m = re.search(r"(\d+)$", n)
        return (int(m.group(1)) if m else 1_000_000, n)
    ordered = sorted(nuts, key=key)
    ordering: List[Tuple[str, str]] = []
    for i in range(len(ordered) - 1):
        # earlier must be tightened before later
        ordering.append((ordered[i], ordered[i + 1]))
    return ordering


def build_safety_constraints() -> List[str]:
    # Examples of safety constraints for spanner
    # - Once leaving shed, never return: globally-not at bob shed after first walk
    # - Do not tighten a nut unless carrying some spanner: holds because of domain, but we can assert always (or).
    safety: List[str] = []
    # Weak safety example using PDDL3 syntax:
    # never return to shed after leaving: if at bob shed becomes false at some point, it never becomes true again
    # This is approximated as: (sometime (not (at bob shed))) -> (always (not (at bob shed)))
    # PDDL3 usually encodes implication with or; we encode as (or (always (at bob shed)) (always (not (at bob shed)))) which is too strong.
    # Keep a simple, non-conflicting safety: avoid visiting shed while any nut remains loose (to bias ordering)
    safety.append("(always (imply (exists (?n - nut) (loose ?n)) (not (at bob shed))))")
    return safety


def convert_directory(input_dir: str, output_dir: str, pairwise: bool, custom_order: List[Tuple[str, str]]) -> int:
    count = 0
    for filename in os.listdir(input_dir):
        if not filename.endswith(".pddl"):
            continue
        src = os.path.join(input_dir, filename)
        dst = os.path.join(output_dir, filename)
        pddl = read_file(src)
        nuts = extract_nuts(pddl)
        ordering: List[Tuple[str, str]] = []
        if custom_order:
            ordering = [pair for pair in custom_order if pair[0] in nuts and pair[1] in nuts]
        elif pairwise:
            ordering = build_default_ordering(nuts)
        safety = build_safety_constraints()
        converted = inject_constraints(pddl, ordering, safety)
        write_file(dst, converted)
        count += 1
    return count


def parse_pairs(pairs: List[str]) -> List[Tuple[str, str]]:
    result: List[Tuple[str, str]] = []
    for p in pairs:
        if ":" in p:
            a, b = p.split(":", 1)
        elif "," in p:
            a, b = p.split(",", 1)
        else:
            parts = p.strip().split()
            if len(parts) != 2:
                raise ValueError(f"Invalid pair format: {p}")
            a, b = parts
        result.append((a.strip(), b.strip()))
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description="Convert Spanner training problems to PDDL3 with constraints")
    parser.add_argument("--input", default="training_problems", help="Input directory containing PDDL problems")
    parser.add_argument("--output", default="training_problems_pddl3", help="Output directory for converted PDDL3 problems")
    parser.add_argument("--pairwise-order", action="store_true", help="Add pairwise sometime-before based on nut numeric order")
    parser.add_argument("--order", nargs="*", default=[], help="Explicit ordering pairs like nut1:nut2 nut2:nut3 (a before b)")
    args = parser.parse_args()

    custom_order = parse_pairs(args.order) if args.order else []
    converted = convert_directory(args.input, args.output, args.pairwise_order, custom_order)
    print(f"Converted {converted} problems from {args.input} to {args.output}")


if __name__ == "__main__":
    main()




