#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import re
import argparse
import hashlib
import random
import shutil
from typing import List, Tuple, Dict, Optional

# ---------- Basic IO ----------
def read_file(path: str) -> str:
    with open(path, "r", encoding="utf-8") as f:
        return f.read()

def write_file(path: str, content: str) -> None:
    os.makedirs(os.path.dirname(path) or ".", exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

# ---------- Regex ----------
OBJECTS_BLOCK_RE = re.compile(r"\(\s*:objects\b(.*?)\)\s*\(\s*:\w+", re.DOTALL | re.IGNORECASE)
INIT_BLOCK_RE    = re.compile(r"\(\s*:init\b(.*?)\)\s*\(\s*:\w+", re.DOTALL | re.IGNORECASE)
GOAL_BLOCK_RE    = re.compile(r"\(\s*:goal\b(.*?)\)\s*\)\s*$", re.DOTALL | re.IGNORECASE)

NUT_DECL_LINE_RE = re.compile(r"-\s+nut\b", re.IGNORECASE)
SP_DECL_LINE_RE  = re.compile(r"-\s+spanner\b", re.IGNORECASE)
MAN_DECL_LINE_RE = re.compile(r"-\s+man\b", re.IGNORECASE)
LOC_DECL_LINE_RE = re.compile(r"-\s+location\b", re.IGNORECASE)

SEED_HINT_RE     = re.compile(r"--seed\s+(\d+)")
PROBLEM_NAME_RE  = re.compile(r"\(\s*define\s*\(\s*problem\s+([^)]+)\)", re.IGNORECASE)

# plan lines
PICKUP_RE   = re.compile(r"^\(\s*pickup_spanner\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s*\)\s*$", re.IGNORECASE) # l s m
TIGHTEN_RE  = re.compile(r"^\(\s*tighten_nut\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s*\)\s*$", re.IGNORECASE) # l s m n
WALK_RE     = re.compile(r"^\(\s*walk\s+([^\s()]+)\s+([^\s()]+)\s+([^\s()]+)\s*\)\s*$", re.IGNORECASE) # start end m

# ---------- Parsing helpers ----------
def extract_block(pddl: str, regex: re.Pattern) -> str:
    m = regex.search(pddl)
    return m.group(1) if m else ""

def extract_typed_list(pddl: str, line_re: re.Pattern, type_name: str) -> List[str]:
    items: List[str] = []
    obj = extract_block(pddl, OBJECTS_BLOCK_RE)
    if obj:
        for line in obj.splitlines():
            if line_re.search(line):
                prefix = line.split("-")[0]
                for tok in prefix.split():
                    if tok not in ("-", ""):
                        items.append(tok)
    # 去重保序
    seen = set()
    ordered = []
    for x in items:
        if x not in seen:
            seen.add(x)
            ordered.append(x)
    return ordered

def extract_nuts(pddl: str) -> List[str]:
    nuts = extract_typed_list(pddl, NUT_DECL_LINE_RE, "nut")
    if not nuts:
        # fallback from init
        init_m = INIT_BLOCK_RE.search(pddl)
        if init_m:
            for m in re.finditer(r"\(\s*loose\s+([^\s()]+)\s*\)", init_m.group(1), re.IGNORECASE):
                nuts.append(m.group(1))
    return nuts

def extract_spanners(pddl: str) -> List[str]:
    return extract_typed_list(pddl, SP_DECL_LINE_RE, "spanner")

def extract_men(pddl: str) -> List[str]:
    return extract_typed_list(pddl, MAN_DECL_LINE_RE, "man")

def extract_locations(pddl: str) -> List[str]:
    return extract_typed_list(pddl, LOC_DECL_LINE_RE, "location")

def extract_nut_tighten_order_from_plan(plan_text: str) -> List[str]:
    """返回 plan 中第一次出现 tighten 的螺母顺序，如 ['nut3', 'nut2', 'nut1']。"""
    order = []
    seen = set()
    for name, args in parse_plan_events(plan_text):
        if name == "tighten_nut":
            _l, _sp, _man, nut = args
            if nut not in seen:
                seen.add(nut)
                order.append(nut)
    return order

def build_order_inversion_constraints(
    problem_text: str,
    plan_text: Optional[str],
    max_pairs: int = 1
) -> List[str]:
    """
    若 nuts > 2 且存在 plan，则选取若干 (A, B)，使得 plan 中 B 在 A 之前，
    注入 (sometime-before (tightened A) (tightened B)) 以违反旧 plan。
    优先选择间隔更远的 pair，提升失效稳定性。
    """
    nuts = extract_nuts(problem_text)
    if plan_text is None or len(nuts) <= 2:
        return []

    order = extract_nut_tighten_order_from_plan(plan_text)
    # 仅考虑确实在 plan 中出现 tighten 的螺母，且数量>1
    if len(order) <= 1:
        return []

    # 生成所有 “逆序” pair：在 plan 中 indexB < indexA，则要求 A 在 B 之前
    idx = {n: i for i, n in enumerate(order)}
    pairs = []
    for i in range(len(order)):
        for j in range(len(order)):
            if i <= j:
                continue
            A = order[i]
            B = order[j]
            # plan: ... B ... A ...
            gap = i - j  # 越大越远
            pairs.append((gap, A, B))
    # 按 gap 从大到小排序，选前 max_pairs 个
    pairs.sort(reverse=True)
    chosen = pairs[:max_pairs]

    cons = [f"(sometime-before (tightened {B}) (tightened {A}))" for _gap, A, B in chosen]
    return cons

def parse_plan_events(plan_text: str) -> List[Tuple[str, Tuple[str, ...]]]:
    events: List[Tuple[str, Tuple[str, ...]]] = []
    for line in plan_text.splitlines():
        s = line.strip()
        if not s:
            continue
        mp = PICKUP_RE.match(s)
        if mp:
            l, sp, man = mp.groups()
            events.append(("pickup_spanner", (l, sp, man)))
            continue
        mt = TIGHTEN_RE.match(s)
        if mt:
            l, sp, man, nut = mt.groups()
            events.append(("tighten_nut", (l, sp, man, nut)))
            continue
        mw = WALK_RE.match(s)
        if mw:
            start, end, man = mw.groups()
            events.append(("walk", (start, end, man)))
            continue
    return events

def compute_pickup_to_tighten_gaps(events: List[Tuple[str, Tuple[str, ...]]]) -> Dict[Tuple[str, str, str], int]:
    first_pick_index: Dict[Tuple[str, str], int] = {}
    gaps: Dict[Tuple[str, str, str], int] = {}
    for idx, (name, args) in enumerate(events):
        if name == "pickup_spanner":
            l, sp, man = args
            first_pick_index.setdefault((man, sp), idx)
        elif name == "tighten_nut":
            l, sp, man, nut = args
            key_ms = (man, sp)
            if key_ms in first_pick_index:
                gap = idx - first_pick_index[key_ms]
                key = (man, sp, nut)
                gaps.setdefault(key, gap)
    return gaps

def plan_violates_capacity(
    events: List[Tuple[str, Tuple[str, ...]]],
    assume_drop_after_tighten: bool = True
) -> bool:
    carrying: Dict[str, set] = {}
    for name, args in events:
        if name == "pickup_spanner":
            l, sp, man = args
            s = carrying.setdefault(man, set()); s.add(sp)
            if len(s) >= 2: return True
        elif name == "tighten_nut":
            l, sp, man, nut = args
            if assume_drop_after_tighten:
                s = carrying.setdefault(man, set()); s.discard(sp)
    return False

# ---------- Constraint builders ----------
def cap_forall() -> str:
    return (
        "(always\n"
        "  (forall (?m - man ?s1 - spanner ?s2 - spanner)\n"
        "    (imply (and (carrying ?m ?s1)\n"
        "                (carrying ?m ?s2)\n"
        "                (not (= ?s1 ?s2)))\n"
        "           false)))"
    )

def no_return_shed() -> str:
    return "(forall (?m - man) (at-most-once (at ?m shed)))"

def leave_with_at_least_one() -> str:
    return (
        "(forall (?m - man)\n"
        "  (always (imply (not (at ?m shed))\n"
        "                 (exists (?s - spanner) (carrying ?m ?s)))))"
    )

def order_nuts(nuts: List[str]) -> List[str]:
    cons: List[str] = []
    if len(nuts) <= 1: return cons
    sorted_n = sorted(nuts)
    for i in range(len(sorted_n) - 1):
        a, b = sorted_n[i], sorted_n[i+1]
        cons.append(f"(sometime-before (tightened {a}) (tightened {b}))")
    return cons

def aw_within(man: str, sp: str, nut: str, k: int) -> str:
    return f"(always-within {k} (carrying {man} {sp}) (tightened {nut}))"

# ---------- Portfolio ----------
class SafetyPortfolio:
    def __init__(self, difficulty: str, seed: int):
        self.difficulty = difficulty  # easy/med/hard
        self.rng = random.Random(seed)

    def pick_aw_k(self, gap: Optional[int]) -> int:
        # 参数随难度变化；若提供 gap（来自 plan），在 med/hard 可“卡边缘”
        if self.difficulty == "easy":
            base = 6
        elif self.difficulty == "hard":
            base = 2
        else:
            base = 4
        if gap is not None:
            # 让 K 介于 gap-1 到 gap+1 内随机，hard 更靠近 gap-1
            lo = max(1, gap - (2 if self.difficulty == "hard" else 1))
            hi = gap + (0 if self.difficulty == "hard" else 1)
            return max(1, self.rng.randint(lo, max(lo, hi)))
        return base

    def select(self,
               prob_text: str,
               plan_text: Optional[str],
               portfolio_size: int,
               assume_drop_after_tighten: bool) -> List[str]:
        nuts = extract_nuts(prob_text)
        spanners = extract_spanners(prob_text)
        men = extract_men(prob_text) or ["bob"]

        # 1) 固定模板候选（与实例无关）
        pool: List[Tuple[str, str]] = []
        # pool.append(("cap", cap_forall()))
        pool.append(("no-return", no_return_shed()))
        pool.append(("leave-with-one", leave_with_at_least_one()))
        # 2) 与实例相关的“顺序”模板
        for c in order_nuts(nuts):
            pool.append(("order", c))

        # 3) plan-aware 的 always-within
        if plan_text:
            events = parse_plan_events(plan_text)
            gaps = compute_pickup_to_tighten_gaps(events)
            # 若计划已有容量违规，容量约束优先且无需 AW
            has_cap_violation = plan_violates_capacity(events, assume_drop_after_tighten)
            for (man, sp, nut), gap in sorted(gaps.items()):
                k = self.pick_aw_k(gap if not has_cap_violation else None)
                pool.append(("aw", aw_within(man, sp, nut, k)))
        else:
            # 没有 plan 时，保守地挑少量 AW（随机挑一个 sp 和一个 nut）
            if spanners and nuts:
                m = men[0]
                s = self.rng.choice(spanners)
                n = self.rng.choice(nuts)
                k = self.pick_aw_k(None)
                pool.append(("aw", aw_within(m, s, n, k)))

        # 去重（按文本）
        seen = set()
        uniq = []
        for tag, c in pool:
            if c not in seen:
                seen.add(c); uniq.append((tag, c))

        # 根据难度给不同权重（简单：顺序>容量>不回棚>出棚拿一把>AW）
        weights = {
            "order": 3 if self.difficulty != "hard" else 2,
            "cap": 3,
            "no-return": 2,
            "leave-with-one": 2,
            "aw": 2 if self.difficulty != "easy" else 1,
        }

        # 随机抽样但尽量覆盖不同 tag
        by_tag: Dict[str, List[str]] = {}
        for tag, c in uniq:
            by_tag.setdefault(tag, []).append(c)

        chosen: List[str] = []
        # 先尽量每类取一个
        tags_order = ["cap", "order", "no-return", "leave-with-one", "aw"]
        for t in tags_order:
            if len(chosen) >= portfolio_size: break
            if t in by_tag and by_tag[t]:
                chosen.append(self.rng.choice(by_tag[t]))

        # 不够就按权重从全池补齐
        rest = []
        for tag, c in uniq:
            rest.append((c, weights.get(tag, 1)))
        while len(chosen) < portfolio_size and rest:
            c, _w = self.rng.choices(rest, weights=[w for _, w in rest], k=1)[0]
            if c not in chosen:
                chosen.append(c)

        return chosen[:portfolio_size]

# ---------- Insert :constraints ----------
def insert_constraints_block(problem_text: str, constraints: List[str], footer_meta: Optional[str]=None) -> str:
    if not constraints:
        return problem_text
    block_lines: List[str] = []
    if len(constraints) == 1:
        block_lines.append("(:constraints")
        block_lines.append(f"  {constraints[0]}")
        block_lines.append(")")
    else:
        block_lines.append("(:constraints")
        block_lines.append("  (and")
        for c in constraints:
            block_lines.append(f"    {c}")
        block_lines.append("  )")
        block_lines.append(")")
    # if footer_meta:
    #     block_lines.append(f"; SAFETY_SIGNATURE: {footer_meta}")

    block_text = "\n".join(block_lines)

    # Insert just before the final closing paren of the problem definition
    trimmed_len = len(problem_text.rstrip())
    if trimmed_len == 0:
        return block_text + ("\n" if problem_text.endswith("\n") else "")
    last_paren_idx = problem_text.rfind(")", 0, trimmed_len)
    if last_paren_idx != -1:
        prefix = problem_text[:last_paren_idx]
        suffix = problem_text[last_paren_idx:]
        if not prefix.endswith("\n"):
            prefix += "\n"
        out = prefix + block_text + "\n" + suffix
        return out
    # Fallback: append at end
    joiner = "" if problem_text.endswith("\n") else "\n"
    return problem_text + joiner + block_text + "\n"

# ---------- Plan path resolver ----------
def find_plan_for_problem(problem_path: str) -> Optional[str]:
    base, _ = os.path.splitext(problem_path)
    for ext in (".soln", ".plan", ".solution", ".txt"):
        cand = base + ext
        if os.path.exists(cand):
            return cand
    return None

# ---------- Seed resolver ----------
def resolve_seed(problem_text: str, problem_path: str, seed_arg: Optional[int]) -> int:
    if seed_arg is not None:
        return int(seed_arg)
    # try problem header
    m = SEED_HINT_RE.search(problem_text)
    if m:
        return int(m.group(1))
    # try problem name
    n = PROBLEM_NAME_RE.search(problem_text)
    name = n.group(1) if n else os.path.basename(problem_path)
    h = hashlib.md5(name.encode("utf-8")).hexdigest()
    return int(h[:8], 16)

# ---------- Always-within (legacy) ----------
def build_carry_time_constraints_legacy(
    problem_text: str,
    plan_text: Optional[str],
    default_k: int,
    invalidate: bool
) -> List[str]:
    cons: List[str] = []
    if plan_text:
        events = parse_plan_events(plan_text)
        gaps = compute_pickup_to_tighten_gaps(events)
        for (man, sp, nut), gap in sorted(gaps.items()):
            k = default_k
            if invalidate:
                k = max(1, gap - 1)
            cons.append(aw_within(man, sp, nut, k))
    return cons

# ---------- Convert one ----------
def convert_one(
    problem_path: str,
    output_path: str,
    add_aw_legacy: bool,
    default_k: int,
    invalidate_aw: bool,
    inject_capacity: str,
    capacity_scope_unused: str,  # kept for compatibility
    man_name_unused: Optional[str],
    assume_drop_after_tighten: bool,
    safety_mode: str,
    portfolio_size: int,
    difficulty: str,
    seed_arg: Optional[int],
     invert_order_from_plan: bool,
    invert_count: int,
) -> bool:
    try:
        prob = read_file(problem_path)
        plan_path = find_plan_for_problem(problem_path)
        plan = read_file(plan_path) if plan_path else None

        constraints: List[str] = []

        # 0) portfolio
        if safety_mode == "portfolio":
            seed = resolve_seed(prob, problem_path, seed_arg)
            sp = SafetyPortfolio(difficulty=difficulty, seed=seed)
            picked = sp.select(prob, plan, portfolio_size, assume_drop_after_tighten)
            if picked:
                sig = hashlib.md5(("\n".join(sorted(picked))).encode("utf-8")).hexdigest()[:12]
                constraints.extend(picked)
                out = insert_constraints_block(prob, constraints, footer_meta=f"{difficulty}:{portfolio_size}:{sig}")
                write_file(output_path, out)
                return True
        # NEW: 基于 plan 的“反转顺序”约束（仅当开启开关且 nuts>2）
        if invert_order_from_plan:
            cons_inv = build_order_inversion_constraints(prob, plan, invert_count)
            constraints.extend(cons_inv)

        # 1) legacy AW（可选）
        if add_aw_legacy:
            cons_aw = build_carry_time_constraints_legacy(prob, plan, default_k, invalidate_aw)
            constraints.extend(cons_aw)

        # 2) 容量（保留原注入开关）
        inject = False
        if inject_capacity == "always":
            inject = True
        elif inject_capacity == "auto":
            if plan:
                events = parse_plan_events(plan)
                if plan_violates_capacity(events, assume_drop_after_tighten=assume_drop_after_tighten):
                    inject = True
        elif inject_capacity == "never":
            inject = False
        else:
            raise ValueError(f"unknown inject-capacity mode: {inject_capacity}")
        if inject:
            constraints.append(cap_forall())

        out = insert_constraints_block(prob, constraints) if constraints else prob
        write_file(output_path, out)
        return True
    except Exception as e:
        print(f"[ERROR] convert failed for {problem_path}: {e}")
        return False

# ---------- Batch convert ----------
def convert_dir(
    input_dir: str,
    output_dir: str,
    add_aw_legacy: bool,
    default_k: int,
    invalidate_aw: bool,
    inject_capacity: str,
    capacity_scope_unused: str,
    man_name_unused: Optional[str],
    assume_drop_after_tighten: bool,
    safety_mode: str,
    portfolio_size: int,
    difficulty: str,
    seed_arg: Optional[int],
    invert_order_from_plan: bool,
    invert_count: int,
) -> Tuple[int, int]:
    ok = 0
    fail = 0
    if os.path.exists(output_dir):
        if os.path.isdir(output_dir):
            shutil.rmtree(output_dir)
        else:
            os.remove(output_dir)
    os.makedirs(output_dir, exist_ok=True)
    for name in os.listdir(input_dir):
        if not name.lower().endswith(".pddl"):
            continue
        src = os.path.join(input_dir, name)
        dst = os.path.join(output_dir, name)
        if convert_one(src, dst, add_aw_legacy, default_k, invalidate_aw,
                       inject_capacity, capacity_scope_unused, man_name_unused,
                       assume_drop_after_tighten, safety_mode, portfolio_size,
                       difficulty, seed_arg,invert_order_from_plan,invert_count):
            ok += 1
        else:
            fail += 1
    return ok, fail

# ---------- CLI ----------
def main():
    ap = argparse.ArgumentParser(
        description="Convert PDDL2 problems to PDDL3 by injecting diversified safety constraints."
    )
    ap.add_argument("--input", required=True, help="Input PDDL file or directory")
    ap.add_argument("--output", required=True, help="Output PDDL3 file or directory")

    # legacy AW
    ap.add_argument("--add-aw", action="store_true", help="Add always-within constraints from plan (legacy feature)")
    ap.add_argument("--k", type=int, default=3, help="Default K for always-within if no invalidate/plan")
    ap.add_argument("--invalidate", dest="invalidate_aw", action="store_true",
                    help="If set with plan, pick K = gap-1 to invalidate the plan")

    # capacity (kept for compatibility; portfolio 会自动包含一个容量候选)
    ap.add_argument("--inject-capacity", choices=["auto", "always", "never"], default="never")

    # portfolio
    ap.add_argument("--safety-mode", choices=["none", "portfolio"], default="none",
                    help="Use diversified safety portfolio per problem (default: portfolio)")
    ap.add_argument("--portfolio-size", type=int, default=2,
                    help="How many safety constraints to inject per problem (default: 2)")
    ap.add_argument("--difficulty", choices=["easy", "med", "hard"], default="med",
                    help="Affects time windows and selection weights")
    ap.add_argument("--seed", type=int, default=None,
                    help="Seed for deterministic selection (default: auto from problem header/name)")
    ap.add_argument("--assume-drop-after-tighten", dest="assume_drop", action="store_true")
    ap.set_defaults(assume_drop=True)
    ap.add_argument("--no-assume-drop", dest="assume_drop", action="store_false")
    ap.add_argument("--invert-order-from-plan", action="store_true",
                    help="If nuts>2 and plan exists, inject order constraints that invert the plan's tightening order to violate the previous plan.")
    ap.add_argument("--invert-count", type=int, default=1,
                    help="How many inverted order constraints to add (default: 1)")

    args = ap.parse_args()

    inp = args.input
    outp = args.output

    if os.path.isdir(inp):
        if os.path.isfile(outp):
            raise SystemExit("If --input is a directory, --output must be a directory.")
        ok, fail = convert_dir(inp, outp, args.add_aw, args.k, args.invalidate_aw,
                               args.inject_capacity, "", None, args.assume_drop,
                               args.safety_mode, args.portfolio_size, args.difficulty, args.seed,args.invert_order_from_plan,args.invert_count)
        print(f"Converted: ok={ok}, fail={fail} -> {outp}")
    else:
        is_dir = os.path.isdir(outp) or (not os.path.exists(outp) and not outp.lower().endswith(".pddl"))
        if is_dir:
            if os.path.exists(outp):
                if os.path.isdir(outp):
                    shutil.rmtree(outp)
                else:
                    os.remove(outp)
            os.makedirs(outp, exist_ok=True)
            dst = os.path.join(outp, os.path.basename(inp))
        else:
            os.makedirs(os.path.dirname(outp) or ".", exist_ok=True)
            dst = outp
        ok = convert_one(inp, dst, args.add_aw, args.k, args.invalidate_aw,
                         args.inject_capacity, "", None, args.assume_drop,
                         args.safety_mode, args.portfolio_size, args.difficulty, args.seed,args.invert_order_from_plan,args.invert_count)
        print(f"Converted: {inp} -> {dst} ({'ok' if ok else 'fail'})")

if __name__ == "__main__":
    main()
