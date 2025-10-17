#!/usr/bin/env python3
# trucks_checkpoint_injector.py
import os
import re
import argparse
from typing import Dict, List, Tuple, Set, Optional

# ---------- Regexes ----------
PROBLEM_HEADER_RE = re.compile(r"^\(define\s*\(problem\s+([^)]+)\)", re.IGNORECASE)
OBJECTS_SECTION_RE = re.compile(r"\(\s*:objects(.*?)\)\s*\(\s*:\w+", re.DOTALL | re.IGNORECASE)
INIT_SECTION_RE    = re.compile(r"\(\s*:init(.*?)\)\s*\(\s*:\w+", re.DOTALL | re.IGNORECASE)
GOAL_SECTION_RE    = re.compile(r"\(\s*:goal(.*?)\)\s*\)\s*$", re.DOTALL | re.IGNORECASE)

# Predicates
AT_RE              = re.compile(r"\(\s*at\s+([^\s()]+)\s+([^\s()]+)\s*\)", re.IGNORECASE)
ATDEST_RE          = re.compile(r"\(\s*at-destination\s+([^\s()]+)\s+([^\s()]+)\s*\)", re.IGNORECASE)
IN_RE              = re.compile(r"\(\s*in\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s*\)", re.IGNORECASE)
LOC_DECL_RE        = re.compile(r"\(\s*location\s+([^\s()]+)\s*\)", re.IGNORECASE)
TRUCK_DECL_RE      = re.compile(r"\(\s*truck\s+([^\s()]+)\s*\)", re.IGNORECASE)
PKG_DECL_RE        = re.compile(r"\(\s*package\s+([^\s()]+)\s*\)", re.IGNORECASE)

# Plan lines
MOVE_RE    = re.compile(r"^\(\s*drive\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s+[^\s()]+\s+[^\s()]+\s*\)\s*$", re.IGNORECASE)
LOAD_RE    = re.compile(r"^\(\s*load\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s*\)\s*$", re.IGNORECASE)   # p t a l
UNLOAD_RE  = re.compile(r"^\(\s*unload\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s*\)\s*$", re.IGNORECASE) # p t a l
DELIVER_RE = re.compile(r"^\(\s*deliver\s+([^\s()]+)\s+([^\s()]+)\s+[^\s()]+\s+[^\s()]+\s*\)\s*$", re.IGNORECASE)     # p l t1 t2

# ---------- IO ----------
def read_text(fp: str) -> str:
    with open(fp, "r", encoding="utf-8") as f:
        return f.read()

def write_text(fp: str, s: str) -> None:
    with open(fp, "w", encoding="utf-8") as f:
        f.write(s)

# ---------- Sections ----------
def extract_sections(problem_text: str) -> Tuple[str, str, str]:
    m_obj = OBJECTS_SECTION_RE.search(problem_text)
    m_init = INIT_SECTION_RE.search(problem_text)
    m_goal = GOAL_SECTION_RE.search(problem_text)
    objs = m_obj.group(1) if m_obj else ""
    if not m_init or not m_goal:
        raise ValueError("Cannot find :init or :goal in problem.")
    return objs, m_init.group(1), m_goal.group(1)

# ---------- Parse objects/atoms ----------
def parse_objects(objs_text: str, init_text: str) -> Tuple[Set[str], Set[str], Set[str]]:
    trucks = set(TRUCK_DECL_RE.findall(objs_text)) | set(TRUCK_DECL_RE.findall(init_text))
    pkgs   = set(PKG_DECL_RE.findall(objs_text))   | set(PKG_DECL_RE.findall(init_text))
    locs   = set(LOC_DECL_RE.findall(init_text))
    # also include any location ids that appear in at/at-destination (robust)
    for _, l in AT_RE.findall(init_text):
        locs.add(l)
    return trucks, pkgs, locs

def parse_init_locations(init_text: str, pkgs: Set[str]) -> Dict[str, str]:
    init_loc: Dict[str, str] = {}
    for x, l in AT_RE.findall(init_text):
        if x in pkgs:
            init_loc[x] = l
    return init_loc

def parse_goal_destinations(goal_text: str, pkgs: Set[str]) -> Dict[str, str]:
    goal_loc: Dict[str, str] = {}
    # prefer at-destination if present
    for p, l in ATDEST_RE.findall(goal_text):
        if p in pkgs:
            goal_loc[p] = l
    # fallback: sometimes goals use (at p l)
    if not goal_loc:
        for p, l in AT_RE.findall(goal_text):
            if p in pkgs:
                goal_loc[p] = l
    return goal_loc

# ---------- Plan analysis (optional) ----------
def parse_plan(plan_text: str) -> Dict[str, str]:
    """
    Return a mapping pkg->truck that actually handled this pkg in the plan
    (by LOAD/UNLOAD). If none seen, leave unmapped.
    """
    pkg_truck: Dict[str, str] = {}
    for line in plan_text.splitlines():
        line = line.strip()
        m = LOAD_RE.match(line) or UNLOAD_RE.match(line)
        if m:
            p, t = m.group(1), m.group(2)
            pkg_truck[p] = t
    return pkg_truck

def truck_visited_locations(plan_text: str) -> Dict[str, Set[str]]:
    """
    For each truck, collect the set of locations it visits in plan (from DRIVE and UNLOAD/LOAD locations).
    """
    visits: Dict[str, Set[str]] = {}
    for line in plan_text.splitlines():
        line = line.strip()
        m = MOVE_RE.match(line)
        if m:
            t, frm, to = m.group(1), m.group(2), m.group(3)
            visits.setdefault(t, set()).update([frm, to])
            continue
        m = LOAD_RE.match(line)
        if m:
            p, t, a, l = m.group(1), m.group(2), m.group(3), m.group(4)
            visits.setdefault(t, set()).add(l)
            continue
        m = UNLOAD_RE.match(line)
        if m:
            p, t, a, l = m.group(1), m.group(2), m.group(3), m.group(4)
            visits.setdefault(t, set()).add(l)
            continue
    return visits

# ---------- Checkpoint picking ----------
def pick_checkpoint(all_locs: Set[str], init_l: Optional[str], goal_l: Optional[str],
                    avoid: Optional[Set[str]] = None) -> Optional[str]:
    """
    Choose a checkpoint Lchk:
      - Not equal to init or goal of that package
      - Prefer a location not in 'avoid' (e.g., truck's originally visited set)
    """
    candidates = [l for l in sorted(all_locs) if l not in {init_l, goal_l}]
    if avoid:
        pref = [l for l in candidates if l not in avoid]
        if pref:
            return pref[0]
    return candidates[0] if candidates else None

# ---------- Constraint building ----------
def build_constraints(problem_text: str, plan_text: Optional[str]) -> List[str]:
    objs_text, init_text, goal_text = extract_sections(problem_text)
    trucks, pkgs, all_locs = parse_objects(objs_text, init_text)
    init_map = parse_init_locations(init_text, pkgs)
    goal_map = parse_goal_destinations(goal_text, pkgs)

    # Which packages actually need to move?
    movable = [p for p in sorted(pkgs) if goal_map.get(p) and init_map.get(p) and goal_map[p] != init_map[p]]
    if not movable:
        return []

    # Plan-informed truck choice and visited sets
    pkg_truck: Dict[str, str] = {}
    truck_visits: Dict[str, Set[str]] = {}
    if plan_text:
        pkg_truck = parse_plan(plan_text)
        truck_visits = truck_visited_locations(plan_text)

    constraints: List[str] = []

    for p in movable:
        g = goal_map[p]
        i = init_map[p]
        chosen_truck: Optional[str] = None
        if p in pkg_truck and pkg_truck[p] in trucks:
            chosen_truck = pkg_truck[p]
        elif len(trucks) == 1:
            chosen_truck = next(iter(trucks))
        else:
            # No plan or ambiguous: we will require ALL trucks to visit the checkpoint (safe fallback)
            chosen_truck = None

        # Choose checkpoint with preference: not init/goal, and not visited by chosen truck in the given plan.
        avoid = truck_visits.get(chosen_truck, set()) if chosen_truck else None
        chk = pick_checkpoint(all_locs, i, g, avoid)
        if not chk or chk == g:
            # No reasonable checkpoint for this package; skip to avoid vacuous issues
            continue

        if chosen_truck:
            constraints.append(f"(sometime-before (at {chosen_truck} {chk}) (at-destination {p} {g}))")
        else:
            # Conservative: enforce for all trucks (still solvable; trucks can go checkpoint first)
            for t in sorted(trucks):
                constraints.append(f"(sometime-before (at {t} {chk}) (at-destination {p} {g}))")

    # Dedup while preserving order
    seen: Set[str] = set()
    dedup: List[str] = []
    for c in constraints:
        if c not in seen:
            seen.add(c)
            dedup.append(c)
    return dedup

# ---------- Insert constraints ----------
def insert_constraints(problem_text: str, constraints: List[str]) -> str:
    if not constraints:
        return problem_text
    if len(constraints) == 1:
        block = f"\n(:constraints\n  {constraints[0]}\n)\n"
    else:
        inner = "\n    ".join(constraints)
        block = f"\n(:constraints\n  (and\n    {inner}\n  )\n)\n"
    # place before final ')'
    return re.sub(r"\)\s*$", block + ")", problem_text, count=1)

# ---------- Public API ----------
def process_file(in_path: str, out_path: str, plan_path: Optional[str]) -> None:
    prob = read_text(in_path)
    plan = read_text(plan_path) if (plan_path and os.path.exists(plan_path)) else None
    cons = build_constraints(prob, plan)
    out = insert_constraints(prob, cons)
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    write_text(out_path, out)

def process_dir(in_dir: str, out_dir: str) -> None:
    os.makedirs(out_dir, exist_ok=True)
    for name in os.listdir(in_dir):
        if not name.lower().endswith(".pddl"):
            continue
        src = os.path.join(in_dir, name)
        dst = os.path.join(out_dir, name)
        # try locate a sibling .soln
        base, _ = os.path.splitext(src)
        plan = base + ".soln"
        plan_path = plan if os.path.exists(plan) else None
        process_file(src, dst, plan_path)

# ---------- CLI ----------
def main():
    ap = argparse.ArgumentParser(description="Inject checkpoint-first PDDL3 constraints into Trucks problems.")
    ap.add_argument("input", help="Input .pddl file or directory")
    ap.add_argument("output", help="Output .pddl file or directory")
    ap.add_argument("--plan", help="Optional plan (.soln) for the input .pddl file", default=None)
    args = ap.parse_args()

    if os.path.isdir(args.input):
        if os.path.isfile(args.output):
            raise SystemExit("If input is a directory, output must be a directory.")
        process_dir(args.input, args.output)
    else:
        out_is_dir = os.path.isdir(args.output) or (not os.path.exists(args.output) and not args.output.lower().endswith(".pddl"))
        if out_is_dir:
            os.makedirs(args.output, exist_ok=True)
            out_path = os.path.join(args.output, os.path.basename(args.input))
        else:
            out_path = args.output
        plan_path = args.plan
        process_file(args.input, out_path, plan_path)

if __name__ == "__main__":
    main()
