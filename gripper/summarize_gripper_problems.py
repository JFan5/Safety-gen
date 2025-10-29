#!/usr/bin/env python3
"""
Summarize gripper problems in a directory and write a Markdown report.

The script reads PDDL files, infers key stats (balls, rooms, capacity,
goal distribution), and aggregates counts. It outputs a compact Markdown file
with a header, overall stats, and a small per-file sample if requested.
"""

from __future__ import annotations

import argparse
import re
from collections import Counter, defaultdict
from pathlib import Path


ROOM_RE = re.compile(r"\(room\s+(\S+)\)")
BALL_RE = re.compile(r"\(ball\s+(\S+)\)")
GRIPPER_RE = re.compile(r"\(gripper\s+(left|right)\)")
GOAL_BLOCK_RE = re.compile(r"\(:goal\s*\(and([\s\S]*?)\)\s*\)", re.IGNORECASE)
AT_RE = re.compile(r"\(at\s+(ball\d+)\s+(\S+)\)")


def parse_problem_stats(text: str) -> dict:
    rooms = set(ROOM_RE.findall(text))
    balls = set(BALL_RE.findall(text))
    grippers = set(GRIPPER_RE.findall(text))
    capacity = 0
    if 'left' in grippers:
        capacity += 1
    if 'right' in grippers:
        capacity += 1

    goal_match = GOAL_BLOCK_RE.search(text)
    goal_counts: Counter[str] = Counter()
    if goal_match:
        goal_body = goal_match.group(1)
        for b, r in AT_RE.findall(goal_body):
            goal_counts[r] += 1

    # Normalize room names for classic first two
    def canonical_room(r: str) -> str:
        return r

    goal_tuple = tuple(sorted((canonical_room(r), c) for r, c in goal_counts.items()))
    return {
        'num_rooms': len(rooms),
        'num_balls': len(balls),
        'capacity': capacity,
        'goal_counts': goal_tuple,
    }


def summarize_dir(in_dir: Path, max_samples: int | None = None) -> tuple[str, dict]:
    files = sorted(p for p in in_dir.glob('*.pddl'))
    stats_agg = Counter()
    cap_counter = Counter()
    rooms_counter = Counter()
    balls_counter = Counter()
    goal_patterns = Counter()
    per_file_samples = []

    for idx, p in enumerate(files):
        text = p.read_text(encoding='utf-8', errors='ignore')
        s = parse_problem_stats(text)
        rooms_counter[s['num_rooms']] += 1
        balls_counter[s['num_balls']] += 1
        cap_counter[s['capacity']] += 1
        goal_patterns[s['goal_counts']] += 1

        if max_samples and len(per_file_samples) < max_samples:
            per_file_samples.append((p.name, s))

    stats_agg['total_files'] = len(files)

    md_lines = []
    md_lines.append(f"# Gripper Problems Report\n")
    md_lines.append(f"- Total files: {stats_agg['total_files']}\n")
    if stats_agg['total_files'] == 0:
        return '\n'.join(md_lines), {
            'total_files': 0,
        }

    md_lines.append("\n## Distribution\n")
    md_lines.append("- Rooms:\n")
    for k in sorted(rooms_counter):
        md_lines.append(f"  - {k}: {rooms_counter[k]}\n")
    md_lines.append("- Balls:\n")
    for k in sorted(balls_counter):
        md_lines.append(f"  - {k}: {balls_counter[k]}\n")
    md_lines.append("- Capacity:\n")
    for k in sorted(cap_counter):
        md_lines.append(f"  - {k}: {cap_counter[k]}\n")

    md_lines.append("\n## Goal patterns (top 10)\n")
    for (pattern, cnt) in goal_patterns.most_common(10):
        human = ", ".join([f"{r}:{c}" for (r, c) in pattern]) if pattern else "(none)"
        md_lines.append(f"- {cnt} × [ {human} ]\n")

    if per_file_samples:
        md_lines.append("\n## Samples\n")
        for name, s in per_file_samples:
            human_goal = ", ".join([f"{r}:{c}" for (r, c) in s['goal_counts']])
            md_lines.append(f"- {name}: rooms={s['num_rooms']}, balls={s['num_balls']}, cap={s['capacity']}, goal=[{human_goal}]\n")

    summary = {
        'total_files': stats_agg['total_files'],
        'rooms': dict(rooms_counter),
        'balls': dict(balls_counter),
        'capacity': dict(cap_counter),
        'goal_patterns_top10': [
            {
                'pattern': list(pattern),
                'count': cnt,
            }
            for (pattern, cnt) in goal_patterns.most_common(10)
        ],
    }

    return '\n'.join(md_lines), summary


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description='Summarize gripper problems and write Markdown report')
    ap.add_argument('-i', '--in-dir', type=Path, required=True, help='directory containing .pddl files')
    ap.add_argument('-o', '--out', type=Path, required=True, help='output Markdown file')
    ap.add_argument('--samples', type=int, default=10, help='number of per-file samples to include')
    args = ap.parse_args(argv)

    md, _ = summarize_dir(args.in_dir, max_samples=args.samples)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(md, encoding='utf-8')
    print(f"Wrote {args.out}")
    return 0


if __name__ == '__main__':
    import sys
    raise SystemExit(main(sys.argv[1:]))


