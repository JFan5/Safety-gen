#!/usr/bin/env python3
"""
Compare multiple planning evaluation result directories (each containing per-scenario *.json)
and output clear tables (Markdown and/or CSV).

Example:
  python script/compare_planning_result_dirs.py \
    /home/ubuntu/Safety-gen/planning_results/dirA \
    /home/ubuntu/Safety-gen/planning_results/dirB \
    --format both --out-prefix planning_results_comparison
"""

from __future__ import annotations

import argparse
import csv
import json
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, Iterable, List, Optional, Tuple


DEFAULT_CATEGORY_ORDER = [
    "success_plans",
    "plan_format_error",
    "precondition_violation",
    "safety_constraints_violation",
    "goal_not_satisfied",
    "generation_error",
    "others",
]

DEFAULT_5_CATEGORIES = [
    "plan_format_error",
    "precondition_violation",
    "safety_constraints_violation",
    "goal_not_satisfied",
    "success_plans",
]

DEFAULT_SCENARIO_ORDER = ["blocksworld", "ferry", "grippers", "spanner", "delivery"]


def _infer_scenario_from_filename(p: Path) -> str:
    name = p.stem.lower()
    name = name.replace(" copy", "")
    name = re.sub(r"_test_results$", "", name)
    name = re.sub(r"_testing_results$", "", name)
    name = re.sub(r"_results$", "", name)
    if "_" in name:
        name = name.split("_", 1)[0]
    return name or "unknown"


def _safe_int(x: Any) -> Optional[int]:
    if x is None:
        return None
    if isinstance(x, bool):
        return int(x)
    if isinstance(x, int):
        return x
    if isinstance(x, float) and x.is_integer():
        return int(x)
    return None


def _safe_float(x: Any) -> Optional[float]:
    if x is None:
        return None
    if isinstance(x, (int, float)) and not isinstance(x, bool):
        return float(x)
    return None


@dataclass(frozen=True)
class ScenarioMetrics:
    scenario: str
    total: int
    success: int
    success_rate: float  # percent, 0-100
    category_counts: Dict[str, int]

    def count(self, category: str) -> int:
        return int(self.category_counts.get(category, 0))

    def rate(self, category: str) -> float:
        if self.total <= 0:
            return 0.0
        return (self.count(category) / self.total) * 100.0


def _load_json(p: Path) -> Dict[str, Any]:
    with p.open("r", encoding="utf-8") as f:
        return json.load(f)


def _extract_total(data: Dict[str, Any]) -> int:
    for key in ("total_tests", "total_count", "max_problems"):
        v = _safe_int(data.get(key))
        if v is not None and v > 0:
            return v
    results = data.get("results")
    if isinstance(results, list):
        return len(results)
    return 0


def _extract_category_counts(data: Dict[str, Any], total: int) -> Dict[str, int]:
    counts_raw = data.get("category_counts")
    if isinstance(counts_raw, dict):
        out: Dict[str, int] = {}
        for k, v in counts_raw.items():
            iv = _safe_int(v)
            if iv is None:
                continue
            out[str(k)] = iv
        return out

    results = data.get("results")
    if not isinstance(results, list):
        return {}

    out: Dict[str, int] = {}
    for r in results:
        if not isinstance(r, dict):
            continue
        cat = r.get("category")
        if not isinstance(cat, str) or not cat:
            cat = "others"
        out[cat] = out.get(cat, 0) + 1
    # If is_valid exists but category missing, above already bins into others; keep it simple.
    return out


def _extract_success(data: Dict[str, Any], counts: Dict[str, int]) -> int:
    for key in ("success_count",):
        v = _safe_int(data.get(key))
        if v is not None:
            return v
    if "success_plans" in counts:
        return counts.get("success_plans", 0)
    # fallback: sum of is_valid
    results = data.get("results")
    if isinstance(results, list):
        succ = 0
        for r in results:
            if isinstance(r, dict) and r.get("is_valid") is True:
                succ += 1
        return succ
    return 0


def _extract_success_rate(data: Dict[str, Any], total: int, success: int) -> float:
    for key in ("success_rate", "final_success_rate"):
        v = _safe_float(data.get(key))
        if v is not None:
            return v
    return (success / total * 100.0) if total > 0 else 0.0


def load_scenario_metrics(json_path: Path) -> ScenarioMetrics:
    data = _load_json(json_path)
    scenario = data.get("scenario")
    if not isinstance(scenario, str) or not scenario:
        scenario = _infer_scenario_from_filename(json_path)
    scenario = scenario.strip().lower()
    total = _extract_total(data)
    counts = _extract_category_counts(data, total)
    success = _extract_success(data, counts)
    success_rate = _extract_success_rate(data, total, success)
    return ScenarioMetrics(
        scenario=scenario,
        total=total,
        success=success,
        success_rate=success_rate,
        category_counts=counts,
    )


def iter_result_jsons(result_dir: Path) -> List[Path]:
    return sorted([p for p in result_dir.glob("*.json") if p.is_file()])


def aggregate_overall(metrics: Iterable[ScenarioMetrics]) -> ScenarioMetrics:
    metrics_list = list(metrics)
    total = sum(m.total for m in metrics_list)
    success = sum(m.success for m in metrics_list)
    counts: Dict[str, int] = {}
    for m in metrics_list:
        for k, v in m.category_counts.items():
            counts[k] = counts.get(k, 0) + int(v)
    rate = (success / total * 100.0) if total > 0 else 0.0
    return ScenarioMetrics(
        scenario="overall",
        total=total,
        success=success,
        success_rate=rate,
        category_counts=counts,
    )


def _fmt_rate(x: float) -> str:
    return f"{x:.1f}%"

def _fmt_rate_bold(x: float) -> str:
    return f"**{_fmt_rate(x)}**"


def _fmt_count_rate(count: int, total: int) -> str:
    if total <= 0:
        return f"{count} (0.0%)"
    return f"{count} ({(count/total*100.0):.1f}%)"


def render_markdown_summary(
    model_rows: List[Tuple[str, ScenarioMetrics]],
    categories: List[str],
) -> str:
    headers = ["Model", "Total", "Success", "Success%"] + [c for c in categories if c != "success_plans"]
    lines = ["| " + " | ".join(headers) + " |", "| " + " | ".join(["---"] * len(headers)) + " |"]
    for model_name, overall in model_rows:
        row = [
            model_name,
            str(overall.total),
            str(overall.success),
            _fmt_rate_bold(overall.success_rate),
        ]
        for c in categories:
            if c == "success_plans":
                continue
            row.append(_fmt_count_rate(overall.count(c), overall.total))
        lines.append("| " + " | ".join(row) + " |")
    return "\n".join(lines)


def render_markdown_by_scenario(
    model_to_scenario: Dict[str, Dict[str, ScenarioMetrics]],
    scenario_order: List[str],
) -> str:
    scenarios = []
    seen = set()
    for s in scenario_order:
        if any(s in m for m in model_to_scenario.values()):
            scenarios.append(s)
            seen.add(s)
    # Add any extra scenarios not in default order
    extra = sorted({s for m in model_to_scenario.values() for s in m.keys()} - seen - {"overall"})
    scenarios.extend(extra)

    headers = ["Model"] + [s for s in scenarios] + ["overall"]
    lines = ["| " + " | ".join(headers) + " |", "| " + " | ".join(["---"] * len(headers)) + " |"]
    for model_name in sorted(model_to_scenario.keys()):
        m = model_to_scenario[model_name]
        overall = aggregate_overall(m.values())
        row = [model_name]
        for s in scenarios:
            if s in m:
                row.append(_fmt_rate_bold(m[s].success_rate))
            else:
                row.append("-")
        row.append(_fmt_rate_bold(overall.success_rate))
        lines.append("| " + " | ".join(row) + " |")
    return "\n".join(lines)


def render_markdown_scenario_breakdown(
    model_to_scenario: Dict[str, Dict[str, ScenarioMetrics]],
    scenario_order: List[str],
    categories: List[str],
) -> str:
    scenarios = []
    seen = set()
    for s in scenario_order:
        if any(s in m for m in model_to_scenario.values()):
            scenarios.append(s)
            seen.add(s)
    extra = sorted({s for m in model_to_scenario.values() for s in m.keys()} - seen - {"overall"})
    scenarios.extend(extra)

    cat_cols = [c for c in categories if c != "success_plans"]
    headers = ["Scenario", "Model", "Total", "Success", "Success%"] + cat_cols
    lines = ["| " + " | ".join(headers) + " |", "| " + " | ".join(["---"] * len(headers)) + " |"]

    for scenario in scenarios:
        for model_name in sorted(model_to_scenario.keys()):
            sm = model_to_scenario[model_name].get(scenario)
            if sm is None:
                continue
            row = [
                scenario,
                model_name,
                str(sm.total),
                str(sm.success),
                _fmt_rate_bold(sm.success_rate),
            ]
            for c in cat_cols:
                row.append(_fmt_count_rate(sm.count(c), sm.total))
            lines.append("| " + " | ".join(row) + " |")
    return "\n".join(lines)


def render_markdown_scenario_breakdown_wide(
    model_to_scenario: Dict[str, Dict[str, ScenarioMetrics]],
    scenario_order: List[str],
    categories: List[str],
) -> str:
    # Columns are scenarios (5 domains), rows are models.
    scenarios: List[str] = []
    for s in scenario_order:
        if any(s in m for m in model_to_scenario.values()):
            scenarios.append(s)

    models = sorted(model_to_scenario.keys())
    # For the wide table, drop generation_error and others, and don't repeat success_plans as a separate category.
    cat_cols = [c for c in categories if c not in ("success_plans", "generation_error", "others")]

    headers = ["Model"] + scenarios
    lines = ["| " + " | ".join(headers) + " |", "| " + " | ".join(["---"] * len(headers)) + " |"]

    def cell(m: ScenarioMetrics) -> str:
        parts = [
            f"Total {m.total}",
            f"Success {m.success}",
            f"Success% <b>{_fmt_rate(m.success_rate)}</b>",
        ]
        for c in cat_cols:
            parts.append(f"{c} {_fmt_count_rate(m.count(c), m.total)}")
        return "<br>".join(parts)

    for model in models:
        row = [model]
        for scenario in scenarios:
            sm = model_to_scenario[model].get(scenario)
            row.append(cell(sm) if sm else "-")
        lines.append("| " + " | ".join(row) + " |")
    return "\n".join(lines)


def write_csv_scenario_breakdown(
    path: Path,
    model_to_scenario: Dict[str, Dict[str, ScenarioMetrics]],
    categories: List[str],
) -> None:
    cat_cols = [c for c in categories if c != "success_plans"]
    fields = ["scenario", "model", "total", "success", "success_rate"] + cat_cols
    with path.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for scenario in sorted({s for m in model_to_scenario.values() for s in m.keys()}):
            for model_name in sorted(model_to_scenario.keys()):
                sm = model_to_scenario[model_name].get(scenario)
                if sm is None:
                    continue
                row: Dict[str, Any] = {
                    "scenario": scenario,
                    "model": model_name,
                    "total": sm.total,
                    "success": sm.success,
                    "success_rate": round(sm.success_rate, 3),
                }
                for c in cat_cols:
                    row[c] = sm.count(c)
                w.writerow(row)


def write_csv_summary(path: Path, model_rows: List[Tuple[str, ScenarioMetrics]], categories: List[str]) -> None:
    fields = ["model", "total", "success", "success_rate"] + [c for c in categories if c != "success_plans"]
    with path.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for model_name, overall in model_rows:
            row: Dict[str, Any] = {
                "model": model_name,
                "total": overall.total,
                "success": overall.success,
                "success_rate": round(overall.success_rate, 3),
            }
            for c in categories:
                if c == "success_plans":
                    continue
                row[c] = overall.count(c)
            w.writerow(row)


def write_csv_by_scenario(path: Path, model_to_scenario: Dict[str, Dict[str, ScenarioMetrics]]) -> None:
    scenarios = sorted({s for m in model_to_scenario.values() for s in m.keys()})
    fields = ["model"] + scenarios
    with path.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for model_name in sorted(model_to_scenario.keys()):
            row: Dict[str, Any] = {"model": model_name}
            for s in scenarios:
                row[s] = round(model_to_scenario[model_name][s].success_rate, 3)
            w.writerow(row)


def render_markdown_domain_model_pivot(
    model_to_scenario: Dict[str, Dict[str, ScenarioMetrics]],
    scenario_order: List[str],
    categories_5: List[str],
) -> str:
    scenarios = []
    seen = set()
    for s in scenario_order:
        if any(s in m for m in model_to_scenario.values()):
            scenarios.append(s)
            seen.add(s)
    extra = sorted({s for m in model_to_scenario.values() for s in m.keys()} - seen - {"overall"})
    scenarios.extend(extra)

    models = sorted(model_to_scenario.keys())
    headers = ["Domain"] + models
    lines = ["| " + " | ".join(headers) + " |", "| " + " | ".join(["---"] * len(headers)) + " |"]

    # Use HTML <br> for readable multi-line cells in Markdown renderers.
    short = {
        "plan_format_error": "PF",
        "precondition_violation": "Pre",
        "safety_constraints_violation": "Safe",
        "goal_not_satisfied": "Goal",
        "success_plans": "Succ",
    }

    def cell(m: ScenarioMetrics) -> str:
        parts = []
        for c in categories_5:
            label = short.get(c, c)
            rate = _fmt_rate(m.rate(c))
            if c == "success_plans":
                # Use HTML so it renders inside HTML <br>-based cell reliably.
                rate = f"<b>{rate}</b>"
            parts.append(f"{label} {rate}")
        return "<br>".join(parts)

    for scenario in scenarios:
        row = [scenario]
        for model_name in models:
            sm = model_to_scenario[model_name].get(scenario)
            row.append(cell(sm) if sm else "-")
        lines.append("| " + " | ".join(row) + " |")
    return "\n".join(lines)


def write_csv_domain_model_pivot(
    path: Path,
    model_to_scenario: Dict[str, Dict[str, ScenarioMetrics]],
    categories_5: List[str],
) -> None:
    scenarios = sorted({s for m in model_to_scenario.values() for s in m.keys()} - {"overall"})
    models = sorted(model_to_scenario.keys())
    fields: List[str] = ["domain"]
    for model in models:
        for c in categories_5:
            fields.append(f"{model}:{c}:pct")

    with path.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for scenario in scenarios:
            row: Dict[str, Any] = {"domain": scenario}
            for model in models:
                sm = model_to_scenario[model].get(scenario)
                for c in categories_5:
                    row[f"{model}:{c}:pct"] = round(sm.rate(c), 3) if sm else ""
            w.writerow(row)


def main() -> int:
    ap = argparse.ArgumentParser(description="Compare multiple planning result directories and print tables.")
    ap.add_argument("dirs", nargs="+", type=Path, help="Result directories (each contains per-scenario *.json).")
    ap.add_argument(
        "--labels",
        nargs="*",
        default=None,
        help="Optional labels for each dir (same count as dirs). Default: directory basename.",
    )
    ap.add_argument(
        "--format",
        choices=["md", "csv", "both"],
        default="md",
        help="Output format (default: md).",
    )
    ap.add_argument(
        "--out-prefix",
        type=Path,
        default=None,
        help="If set, write files: <prefix>_summary.(md|csv), <prefix>_by_scenario.(md|csv).",
    )
    ap.add_argument(
        "--categories",
        nargs="*",
        default=DEFAULT_CATEGORY_ORDER,
        help="Categories to include in summary table (default common categories).",
    )
    ap.add_argument(
        "--scenario-order",
        nargs="*",
        default=DEFAULT_SCENARIO_ORDER,
        help="Preferred scenario column order (default common scenarios).",
    )
    ap.add_argument(
        "--pivot5-categories",
        nargs="*",
        default=DEFAULT_5_CATEGORIES,
        help="5 categories to show in the domain×model pivot table (default: PF/Pre/Safe/Goal/Succ).",
    )
    args = ap.parse_args()

    if args.labels is not None and len(args.labels) not in (0, len(args.dirs)):
        raise SystemExit("--labels must be omitted or have the same number of entries as dirs.")

    labels: List[str] = []
    for i, d in enumerate(args.dirs):
        if args.labels and len(args.labels) == len(args.dirs):
            labels.append(args.labels[i])
        else:
            labels.append(d.name)

    model_to_scenario: Dict[str, Dict[str, ScenarioMetrics]] = {}
    for label, d in zip(labels, args.dirs):
        if not d.exists() or not d.is_dir():
            raise SystemExit(f"Not a directory: {d}")
        scenario_map: Dict[str, ScenarioMetrics] = {}
        jsons = iter_result_jsons(d)
        if not jsons:
            raise SystemExit(f"No *.json found in: {d}")
        for jp in jsons:
            m = load_scenario_metrics(jp)
            scenario_map[m.scenario] = m
        model_to_scenario[label] = scenario_map

    model_rows: List[Tuple[str, ScenarioMetrics]] = []
    for model_name, scenario_map in model_to_scenario.items():
        model_rows.append((model_name, aggregate_overall(scenario_map.values())))

    md_summary = render_markdown_summary(model_rows, categories=list(args.categories))
    md_by_scenario = render_markdown_by_scenario(model_to_scenario, scenario_order=list(args.scenario_order))
    md_scenario_breakdown = render_markdown_scenario_breakdown(
        model_to_scenario, scenario_order=list(args.scenario_order), categories=list(args.categories)
    )
    md_scenario_breakdown_wide = render_markdown_scenario_breakdown_wide(
        model_to_scenario, scenario_order=list(args.scenario_order), categories=list(args.categories)
    )
    md_domain_model = render_markdown_domain_model_pivot(
        model_to_scenario,
        scenario_order=list(args.scenario_order),
        categories_5=list(args.pivot5_categories),
    )

    out_text = []
    out_text.append("## Summary (overall)")
    out_text.append(md_summary)
    out_text.append("")
    out_text.append("## Success rate by scenario")
    out_text.append(md_by_scenario)
    out_text.append("")
    out_text.append("## Scenario breakdown (counts + rates)")
    out_text.append(md_scenario_breakdown)
    out_text.append("")
    out_text.append("## Scenario breakdown wide (counts + rates)")
    out_text.append(md_scenario_breakdown_wide)
    out_text.append("")
    out_text.append("## Domain × Model (5-category rates)")
    out_text.append(md_domain_model)
    output_md = "\n".join(out_text).strip() + "\n"

    if args.format in ("md", "both"):
        print(output_md)

    if args.out_prefix is not None:
        prefix = args.out_prefix
        if args.format in ("md", "both"):
            (Path(str(prefix) + "_summary.md")).write_text("## Summary (overall)\n" + md_summary + "\n", encoding="utf-8")
            (Path(str(prefix) + "_by_scenario.md")).write_text("## Success rate by scenario\n" + md_by_scenario + "\n", encoding="utf-8")
            (Path(str(prefix) + "_scenario_breakdown.md")).write_text(
                "## Scenario breakdown (counts + rates)\n" + md_scenario_breakdown + "\n", encoding="utf-8"
            )
            (Path(str(prefix) + "_scenario_breakdown_wide.md")).write_text(
                "## Scenario breakdown wide (counts + rates)\n" + md_scenario_breakdown_wide + "\n", encoding="utf-8"
            )
            (Path(str(prefix) + "_domain_model_5cat.md")).write_text(
                "## Domain × Model (5-category rates)\n" + md_domain_model + "\n", encoding="utf-8"
            )
        if args.format in ("csv", "both"):
            write_csv_summary(Path(str(prefix) + "_summary.csv"), model_rows, categories=list(args.categories))
            write_csv_by_scenario(Path(str(prefix) + "_by_scenario.csv"), model_to_scenario)
            write_csv_scenario_breakdown(
                Path(str(prefix) + "_scenario_breakdown.csv"),
                model_to_scenario,
                categories=list(args.categories),
            )
            write_csv_domain_model_pivot(
                Path(str(prefix) + "_domain_model_5cat.csv"),
                model_to_scenario,
                categories_5=list(args.pivot5_categories),
            )

    if args.format in ("csv", "both") and args.out_prefix is None:
        raise SystemExit("--format csv/both requires --out-prefix to write CSV files.")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
