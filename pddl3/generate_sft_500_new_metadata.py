#!/usr/bin/env python3
"""
为各个 Scenario 的 sft_500_new 目录生成难度分布的元数据 JSON。

使用与 generate_testing50_metadata.py 相同的解析和统计逻辑。
"""

import json
import re
from collections import defaultdict
from pathlib import Path
from typing import Dict, List, Optional


def parse_blocksworld(filename: str) -> Optional[Dict]:
    """解析 blocksworld 文件名: bw_ops{3|4}_n{number}_seed{number}.pddl"""
    m = re.match(r"bw_ops(\d+)_n(\d+)_seed\d+\.pddl$", filename)
    if not m:
        return None
    return {"ops": int(m.group(1)), "n": int(m.group(2))}


def parse_ferry(filename: str) -> Optional[Dict]:
    """解析 ferry 文件名: ferry-l{number}-c{number}-s{number}.pddl"""
    m = re.match(r"ferry-l(\d+)-c(\d+)-s\d+\.pddl$", filename)
    if not m:
        return None
    return {"l": int(m.group(1)), "c": int(m.group(2))}


def parse_spanner(filename: str) -> Optional[Dict]:
    """解析 spanner 文件名: spanner-s{number}-n{number}-l{number}-s{number}.pddl"""
    m = re.match(r"spanner-s(\d+)-n(\d+)-l(\d+)-s\d+\.pddl$", filename)
    if not m:
        return None
    return {"s": int(m.group(1)), "n": int(m.group(2)), "l": int(m.group(3))}


def parse_grippers(filename: str) -> Optional[Dict]:
    """解析 grippers 文件名: grippers-n{number}-r{number}-o{number}-s{number}.pddl"""
    m = re.match(r"grippers-n(\d+)-r(\d+)-o(\d+)-s\d+\.pddl$", filename)
    if not m:
        return None
    return {"n": int(m.group(1)), "r": int(m.group(2)), "o": int(m.group(3))}


def make_blocksworld_stats(stats: Dict) -> Dict:
    out: Dict = {"total": stats["total"]}
    by_ops = defaultdict(int)
    by_n = defaultdict(int)
    by_config = defaultdict(int)

    for f in stats["files"]:
        ops = f["ops"]
        n = f["n"]
        by_ops[str(ops)] += 1
        by_n[str(n)] += 1
        by_config[(ops, n)] += 1

    out["by_ops"] = dict(sorted(by_ops.items()))
    out["by_n"] = dict(sorted(by_n.items()))
    out["by_config"] = {
        f"ops={ops},n={n}": count
        for (ops, n), count in sorted(by_config.items(), key=lambda x: (-x[1], x[0]))
    }
    return out


def make_ferry_stats(stats: Dict) -> Dict:
    out: Dict = {"total": stats["total"]}
    by_l = defaultdict(int)
    by_c = defaultdict(int)
    by_config = defaultdict(int)

    for f in stats["files"]:
        l = f["l"]
        c = f["c"]
        by_l[str(l)] += 1
        by_c[str(c)] += 1
        by_config[(l, c)] += 1

    out["by_l"] = dict(sorted(by_l.items()))
    out["by_c"] = dict(sorted(by_c.items()))
    out["by_config"] = {
        f"l={l},c={c}": count
        for (l, c), count in sorted(by_config.items(), key=lambda x: (-x[1], x[0]))
    }
    return out


def make_spanner_stats(stats: Dict) -> Dict:
    out: Dict = {"total": stats["total"]}
    by_s = defaultdict(int)
    by_n = defaultdict(int)
    by_l = defaultdict(int)
    by_config = defaultdict(int)

    for f in stats["files"]:
        s = f["s"]
        n = f["n"]
        l = f["l"]
        by_s[str(s)] += 1
        by_n[str(n)] += 1
        by_l[str(l)] += 1
        by_config[(s, n, l)] += 1

    out["by_s"] = dict(sorted(by_s.items()))
    out["by_n"] = dict(sorted(by_n.items()))
    out["by_l"] = dict(sorted(by_l.items()))
    out["by_config"] = {
        f"s={s},n={n},l={l}": count
        for (s, n, l), count in sorted(by_config.items(), key=lambda x: (-x[1], x[0]))
    }
    return out


def make_grippers_stats(stats: Dict) -> Dict:
    out: Dict = {"total": stats["total"]}
    by_n = defaultdict(int)
    by_r = defaultdict(int)
    by_o = defaultdict(int)
    by_config = defaultdict(int)

    for f in stats["files"]:
        n = f["n"]
        r = f["r"]
        o = f["o"]
        by_n[str(n)] += 1
        by_r[str(r)] += 1
        by_o[str(o)] += 1
        by_config[(n, r, o)] += 1

    out["by_n"] = dict(sorted(by_n.items()))
    out["by_r"] = dict(sorted(by_r.items()))
    out["by_o"] = dict(sorted(by_o.items()))
    out["by_config"] = {
        f"n={n},r={r},o={o}": count
        for (n, r, o), count in sorted(by_config.items(), key=lambda x: (-x[1], x[0]))
    }
    return out


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3")

    scenarios = {
        "blocksworld": {
            "parser": parse_blocksworld,
            "stats_maker": make_blocksworld_stats,
        },
        "ferry": {
            "parser": parse_ferry,
            "stats_maker": make_ferry_stats,
        },
        "spanner": {
            "parser": parse_spanner,
            "stats_maker": make_spanner_stats,
        },
        "grippers": {
            "parser": parse_grippers,
            "stats_maker": make_grippers_stats,
        },
    }

    for scen, cfg in scenarios.items():
        scen_dir = base_dir / scen
        sft_dir = scen_dir / "sft_500_new"
        if not sft_dir.exists():
            print(f"[{scen}] 跳过: 未找到 {sft_dir}")
            continue

        print(f"[{scen}] 分析 {sft_dir} ...")
        
        # 收集文件
        stats = {
            "total": 0,
            "files": [],
        }

        for pddl_file in sorted(sft_dir.glob("*.pddl")):
            params = cfg["parser"](pddl_file.name)
            if not params:
                continue
            stats["total"] += 1
            entry = dict(params)
            entry["filename"] = pddl_file.name
            stats["files"].append(entry)

        if stats["total"] == 0:
            print(f"[{scen}] 无有效 PDDL 文件，跳过")
            continue

        difficulty_stats = cfg["stats_maker"](stats)
        problems: List[str] = sorted([f["filename"] for f in stats["files"]])

        meta = {
            "scenario": scen,
            "split": "sft_500_new",
            "total_problems": stats["total"],
            "difficulty_stats": difficulty_stats,
            "problems": problems,
        }

        out_path = sft_dir / "metadata_sft_500_new.json"
        with out_path.open("w", encoding="utf-8") as f:
            json.dump(meta, f, indent=2, ensure_ascii=False)

        print(f"[{scen}] 已写入元数据: {out_path}")


if __name__ == "__main__":
    main()




