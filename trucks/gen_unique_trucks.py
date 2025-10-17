#!/usr/bin/env python3
import argparse
import os
import subprocess
import sys
from pathlib import Path
from typing import Set, Tuple, Dict
import re
import random

# Helper: balanced section extraction to avoid fragile regex
def extract_section_body(text: str, header: str) -> str:
    """Return the inner text of the top-level section (:header ...).
    Uses balanced parentheses scanning; header should be lowercase like 'init' or 'goal'.
    Raises ValueError if not found or unbalanced.
    """
    needle = f"(:{header}"
    # case-insensitive search
    lower_text = text.lower()
    start = lower_text.find(needle)
    if start == -1:
        raise ValueError(f"section :{header} not found")
    # Scan to matching closing paren of the opening '('
    depth = 0
    end = None
    for idx in range(start, len(text)):
        ch = text[idx]
        if ch == '(':
            depth += 1
        elif ch == ')':
            depth -= 1
            if depth == 0:
                end = idx
                break
    if end is None:
        raise ValueError(f"section :{header} unbalanced")
    # Extract full section, then strip the leading '(:header' and trailing ')'
    section = text[start:end + 1]
    # section starts with '(:header'
    head_len = len(needle)
    body = section[head_len:-1]
    return body

CONNECTED_RE   = re.compile(r"\(\s*connected\s+(l\d+)\s+(l\d+)\s*\)", re.IGNORECASE)
FREE_RE        = re.compile(r"\(\s*free\s+(a\d+)\s+(truck\d+)\s*\)", re.IGNORECASE)
CLOSER_RE      = re.compile(r"\(\s*closer\s+(a\d+)\s+(a\d+)\s*\)", re.IGNORECASE)
TIME_OBJ_RE    = re.compile(r"\b(t\d+)\b", re.IGNORECASE)
NEXT_RE        = re.compile(r"\(\s*next\s+(t\d+)\s+(t\d+)\s*\)", re.IGNORECASE)
TIME_NOW_RE    = re.compile(r"\(\s*time-now\s+(t\d+)\s*\)", re.IGNORECASE)
LE_RE          = re.compile(r"\(\s*le\s+(t\d+)\s+(t\d+)\s*\)", re.IGNORECASE)

# Init atoms
AT_TRUCK_RE = re.compile(r"\(\s*at\s+(truck\d+)\s+(l\d+)\s*\)", re.IGNORECASE)
AT_PACKAGE_RE = re.compile(r"\(\s*at\s+(package\d+)\s+(l\d+)\s*\)", re.IGNORECASE)

# Goal atoms
GOAL_AT_DEST_RE = re.compile(r"\(\s*at-destination\s+(package\d+)\s+(l\d+)\s*\)", re.IGNORECASE)
GOAL_DELIVERED_RE = re.compile(r"\(\s*delivered\s+(package\d+)\s+(l\d+)(?:\s+t\d+)?\s*\)", re.IGNORECASE)


def ensure_built(trucks_dir: Path) -> Path:
    """Ensure the trucks generator binary exists by running make if needed."""
    binary = trucks_dir / "trucks"
    if binary.exists() and os.access(binary, os.X_OK):
        return binary
    print("Building trucks generator with make...")
    subprocess.run(["make"], cwd=str(trucks_dir), check=True)
    if not binary.exists():
        raise RuntimeError("Failed to build trucks generator")
    return binary


def run_trucks(binary: Path, trucks: int, locations: int, packages: int, areas: int, seed: int) -> str:
    cmd = [
        str(binary),
        "-t", str(trucks),
        "-l", str(locations),
        "-p", str(packages),
        "-a", str(areas),
        "-n", "1",             # 关键：固定为 1，避免多问题拼接
        "-seed", str(seed),
    ]
    result = subprocess.run(cmd, cwd=str(binary.parent), check=True, capture_output=True, text=True)
    return result.stdout

import hashlib

def signature_text(problem_text: str) -> Tuple[str]:
    """最宽松：全文哈希（包含命名/方向/时间名差异）"""
    h = hashlib.sha256(problem_text.encode('utf-8')).hexdigest()
    return (f"text:{h}",)

def signature_syntactic(problem_text: str):
    """中等严格：保留有向 connected、原始时间名；不做无向和时间归一"""
    init_text = extract_section_body(problem_text, "init")
    goal_text = extract_section_body(problem_text, "goal")

    init_trucks   = tuple(sorted(AT_TRUCK_RE.findall(init_text)))
    init_packages = tuple(sorted(AT_PACKAGE_RE.findall(init_text)))

    goals = []
    goals.extend(("at-destination", pkg, loc) for pkg, loc in GOAL_AT_DEST_RE.findall(goal_text))
    goals.extend(("delivered", pkg, loc) for pkg, loc in GOAL_DELIVERED_RE.findall(goal_text))
    goal_pairs = tuple(sorted(goals))

    directed_edges = tuple(sorted(CONNECTED_RE.findall(problem_text)))  # 不再无向化
    free_sig   = tuple(sorted(FREE_RE.findall(problem_text)))
    closer_sig = tuple(sorted(CLOSER_RE.findall(problem_text)))

    # 时间：直接记录出现次序上的原始 next/now/le（包含名字）
    time_objs  = tuple(sorted(set(TIME_OBJ_RE.findall(problem_text))))
    next_edges = tuple(sorted(NEXT_RE.findall(problem_text)))
    now_list   = tuple(sorted(TIME_NOW_RE.findall(problem_text)))
    le_edges   = tuple(sorted(LE_RE.findall(problem_text)))

    time_summary = (time_objs, next_edges, now_list, le_edges)

    return (
        ("syn",),
        init_trucks, init_packages, goal_pairs,
        directed_edges, free_sig, closer_sig, time_summary
    )

def signature_isomorphic(problem_text: str):
    init_text = extract_section_body(problem_text, "init")
    goal_text = extract_section_body(problem_text, "goal")

    # 位置类
    init_trucks   = tuple(sorted(AT_TRUCK_RE.findall(init_text)))      # (truck, loc)
    init_packages = tuple(sorted(AT_PACKAGE_RE.findall(init_text)))    # (package, loc)

    # 目标类（忽略 delivered 的时间参数）
    goals = []
    goals.extend(("at-destination", pkg, loc) for pkg, loc in GOAL_AT_DEST_RE.findall(goal_text))
    goals.extend(("delivered", pkg, loc) for pkg, loc in GOAL_DELIVERED_RE.findall(goal_text))
    goal_pairs = tuple(sorted(goals))

    # 结构类：connected 规范化成无向边（min,max）
    undirected_edges = set()
    for x, y in CONNECTED_RE.findall(problem_text):
        undirected_edges.add(tuple(sorted((x, y))))
    connected_sig = tuple(sorted(undirected_edges))  # e.g., (("l0","l1"),("l1","l2"),...)

    # 车位结构
    free_sig   = tuple(sorted(FREE_RE.findall(problem_text)))          # (area, truck)
    closer_sig = tuple(sorted(CLOSER_RE.findall(problem_text)))        # (area1, area2)

    # 时间骨架（轻量摘要）
    time_objs = sorted(set(TIME_OBJ_RE.findall(problem_text)))
    time_index = {name: idx for idx, name in enumerate(time_objs)}

    raw_next_edges = NEXT_RE.findall(problem_text)                     # list of (t_i, t_j)
    normalized_next = tuple(
        sorted(
            (time_index[a], time_index[b])
            for a, b in raw_next_edges
            if a in time_index and b in time_index
        )
    )
    next_graph = {}
    for src_idx, dst_idx in normalized_next:
        next_graph.setdefault(src_idx, set()).add(dst_idx)

    raw_start_now = TIME_NOW_RE.findall(problem_text)
    normalized_start_now = tuple(sorted(time_index.get(t) for t in raw_start_now if t in time_index))

    def longest_chain(start: int, stack: Set[int], memo: Dict[int, int]) -> int:
        if start in memo:
            return memo[start]
        if start in stack:
            # Cycle detected; fall back to total time objects for stability.
            memo[start] = len(time_objs) or 0
            return memo[start]
        stack.add(start)
        successors = next_graph.get(start, ())
        if not successors:
            length = 1
        else:
            length = 1 + max(longest_chain(nxt, stack, memo) for nxt in successors)
        stack.remove(start)
        memo[start] = length
        return length

    memo: Dict[int, int] = {}
    longest_paths = []
    if normalized_start_now:
        for start in normalized_start_now:
            longest_paths.append(longest_chain(start, set(), memo))
    else:
        for node in time_index.values():
            longest_paths.append(longest_chain(node, set(), memo))
    longest_path = max(longest_paths, default=0)

    raw_le_edges = LE_RE.findall(problem_text)
    normalized_le = tuple(
        sorted(
            (time_index[a], time_index[b])
            for a, b in raw_le_edges
            if a in time_index and b in time_index
        )
    )

    time_summary = (
        len(time_objs),
        len(raw_next_edges),
        longest_path,
        tuple(x for x in normalized_start_now),
        normalized_next,
        normalized_le,
    )

    return (
        init_trucks,
        init_packages,
        goal_pairs,
        connected_sig,
        free_sig,
        closer_sig,
        time_summary,
    )

def make_signature(problem_text: str, mode: str):
    if mode == "text":
        return signature_text(problem_text)
    if mode == "syntactic":
        return signature_syntactic(problem_text)
    # 默认最严格
    return signature_isomorphic(problem_text)


def write_problem(out_dir: Path, text: str, trucks: int, locations: int, packages: int, areas: int, seed: int, index: int) -> Path:
    name = f"trucks-t{trucks}-l{locations}-p{packages}-a{areas}-s{seed}.pddl"
    out_path = out_dir / name
    if out_path.exists():
        out_path = out_dir / f"trucks-t{trucks}-l{locations}-p{packages}-a{areas}-{index:06d}.pddl"
    out_path.write_text(text)
    return out_path


def seed_signatures_from_dir(out_dir: Path, mode: str) -> Set[Tuple]:
    seen: Set[Tuple] = set()
    if not out_dir.exists():
        return seen
    for p in out_dir.glob("*.pddl"):
        try:
            text = p.read_text()
            sig = make_signature(text, mode)
            seen.add(sig)
        except Exception:
            continue
    return seen

def generate_unique(
    binary: Path,
    out_dir: Path,
    count: int,
    trucks: int,
    locations: int,
    packages: int,
    areas: int,
    base_seed: int,
    max_attempts: int = 200000,
    mode: str = "isomorphic",   # 新增
) -> int:
    rng = random.Random(base_seed)
    seen = seed_signatures_from_dir(out_dir, mode)
    bad_parse = 0
    dup_hits = 0
    generated = 0
    attempts = 0
    out_dir.mkdir(parents=True, exist_ok=True)

    plateau_window = 10000
    prev_seen_count = len(seen)

    while generated < count and attempts < max_attempts:
        attempts += 1
        seed = rng.randint(1, 2**31 - 1)
        text = run_trucks(binary, trucks, locations, packages, areas, seed)
        try:
            sig = make_signature(text, mode)
        except Exception:
            bad_parse += 1
            if bad_parse % 1000 == 1:
                print(f"[warn] parse failed #{bad_parse} (seed={seed})", file=sys.stderr)
            continue
        if sig in seen:
            dup_hits += 1
            if dup_hits % 2000 == 1:
                print(f"[info] duplicate hit #{dup_hits} (seed={seed})", file=sys.stderr)
            # 饱和检测：窗口内几乎没有新实例
            if attempts % plateau_window == 0:
                growth = len(seen) - prev_seen_count
                if growth < max(1, plateau_window // 1000):
                    print("[note] Likely saturated unique space for this parameter set "
                          f"under uniqueness='{mode}'. Generated {generated}, unique={len(seen)}. "
                          "Consider switching --uniqueness to 'syntactic' or 'text', "
                          "or increase --locations/--packages/--areas.", file=sys.stderr)
                    break
                prev_seen_count = len(seen)
            continue

        seen.add(sig)
        write_problem(out_dir, text, trucks, locations, packages, areas, seed, generated + 1)
        generated += 1
        if generated % 50 == 0 or generated == count:
            print(f"Generated {generated}/{count} unique problems...")
    return generated


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate simple unique trucks problems")
    parser.add_argument("--count", type=int, default=100, help="Number of unique problems to generate")
    parser.add_argument("--target-dir", type=str, default="all_problems", help="Output directory (relative to trucks dir or absolute)")
    parser.add_argument("--trucks", type=int, default=1, help="Number of trucks (keep small for simplicity)")
    parser.add_argument("--locations", type=int, default=2, help="Number of locations (keep small for simplicity)")
    parser.add_argument("--packages", type=int, default=1, help="Number of packages (keep small for simplicity)")
    parser.add_argument("--areas", type=int, default=1, help="Number of truck areas (keep small for simplicity)")
    parser.add_argument("--seed", type=int, default=20250101, help="Base seed for sampling unique instances")
    parser.add_argument("--uniqueness", choices=["isomorphic", "syntactic", "text"],
                    default="isomorphic",
                    help="Uniqueness criterion: 'isomorphic' (strict), 'syntactic' (medium), or 'text' (loose).")
    args = parser.parse_args()

    trucks_dir = Path(__file__).resolve().parent
    out_dir = Path(args.target_dir)
    if not out_dir.is_absolute():
        out_dir = trucks_dir / out_dir

    try:
        binary = ensure_built(trucks_dir)
    except Exception as e:
        print(f"ERROR: build failed: {e}")
        sys.exit(1)

    try:
        total = generate_unique(
            binary,
            out_dir,
            args.count,
            args.trucks,
            args.locations,
            args.packages,
            args.areas,
            args.seed,
            mode=args.uniqueness,
        )
    except Exception as e:
        print(f"ERROR: generation failed: {e}")
        sys.exit(1)

    print(f"Done. Generated {total} unique problems in {out_dir}")


if __name__ == "__main__":
    main()
