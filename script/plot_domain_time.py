#!/usr/bin/env python3
"""
Plot solver runtimes across multiple planning domains with distinct colors.

This script is a domain-focused variant of `plot_time_benchmark.py`. It allows
choosing a single solver (e.g., OPTIC or LLM) and visualizes how its runtime
varies across multiple domains on a single figure, coloring each domain line
distinctly.
"""

from __future__ import annotations

import argparse
from pathlib import Path
from typing import Dict, Iterable, Mapping, Optional, Sequence

import matplotlib

matplotlib.use("Agg")

import matplotlib.pyplot as plt  # noqa: E402
import seaborn as sns  # noqa: E402

from plot_time_benchmark import (  # noqa: E402
    AggregatedPoint,
    SOLVER_LABELS,
    aggregate_records,
    find_summary_files,
    load_summary,
    merge_summaries,
    parse_records,
)


# --- Matplotlib / Seaborn configuration -------------------------------------------------------------
plt.rcParams["font.family"] = "DejaVu Sans"
plt.rcParams["font.sans-serif"] = ["DejaVu Sans", "Arial", "Liberation Sans", "sans-serif"]
plt.rcParams["axes.unicode_minus"] = False
plt.rcParams["figure.facecolor"] = "white"
plt.rcParams["axes.facecolor"] = "white"
plt.rcParams["savefig.facecolor"] = "white"
plt.rcParams["savefig.bbox"] = "tight"

sns.set_style(
    "whitegrid",
    {
        "axes.spines.left": True,
        "axes.spines.bottom": True,
        "axes.spines.top": False,
        "axes.spines.right": False,
        "axes.grid": True,
        "axes.grid.alpha": 0.3,
        "grid.color": "#CCCCCC",
        "grid.linestyle": "--",
        "grid.linewidth": 0.8,
    },
)
sns.set_context("paper", font_scale=1.2, rc={"lines.linewidth": 2.5})


def build_domain_series(
    summary: Mapping[str, object],
    domains: Optional[Iterable[str]],
    solver: str,
) -> Dict[str, Sequence[AggregatedPoint]]:
    """Collect aggregated runtime points for the selected solver across domains."""
    parsed = parse_records(summary, domains, [solver])
    domain_series: Dict[str, Sequence[AggregatedPoint]] = {}

    for domain, solver_records in parsed.items():
        records = solver_records.get(solver)
        if not records:
            continue

        aggregated = aggregate_records(records)
        if aggregated:
            domain_series[domain] = aggregated

    if not domain_series:
        raise ValueError(
            "No data found for the requested domains/solver. "
            "Ensure the summary contains runtime entries matching your filters."
        )

    return domain_series


def plot_domains(
    domain_series: Mapping[str, Sequence[AggregatedPoint]],
    solver: str,
    output_dir: Path,
    *,
    log_scale: bool,
    include_error_bar: bool,
) -> Path:
    """Create a single plot with one line per domain."""
    solver_label = SOLVER_LABELS.get(solver, solver.upper())

    fig, ax = plt.subplots(figsize=(16, 10))
    fig.patch.set_facecolor("white")

    domains = sorted(domain_series.keys())
    palette = sns.color_palette("husl", len(domains))
    markers = ["o", "s", "^", "D", "v", "p", "*"]

    handles = []
    for idx, domain in enumerate(domains):
        points = domain_series[domain]
        color = palette[idx % len(palette)]
        marker = markers[idx % len(markers)]

        x_values = [point.x_value for point in points]
        avg_times = [point.avg_time for point in points]

        if include_error_bar:
            lower_bounds = [point.std_lower for point in points]
            upper_bounds = [point.std_upper for point in points]
            ax.fill_between(
                x_values,
                lower_bounds,
                upper_bounds,
                color=color,
                alpha=0.15,
                edgecolor="none",
            )

        line = ax.plot(
            x_values,
            avg_times,
            color=color,
            marker=marker,
            linewidth=2.8,
            markersize=7,
            markeredgewidth=1.2,
            markeredgecolor="white",
            alpha=0.9,
            label=domain.title(),
            zorder=3,
        )[0]
        handles.append(line)

    ax.set_xlabel(
        "Parameter Value / Problem Index",
        fontsize=15,
        fontweight="bold",
        color="#333333",
        labelpad=12,
    )
    ax.set_ylabel(
        "Runtime (seconds)",
        fontsize=15,
        fontweight="bold",
        color="#333333",
        labelpad=12,
    )
    ax.set_title(
        f"{solver_label} Runtime Across Domains",
        fontsize=20,
        fontweight="bold",
        pad=25,
        color="#2c3e50",
    )

    if log_scale:
        ax.set_yscale("log")
        ax.set_ylabel(
            "Runtime (seconds, log scale)",
            fontsize=15,
            fontweight="bold",
            color="#333333",
            labelpad=12,
        )

    ax.grid(True, alpha=0.3, linestyle="--", linewidth=0.8, color="#CCCCCC")
    ax.set_axisbelow(True)
    ax.tick_params(axis="y", labelsize=12, colors="#555555")
    ax.tick_params(axis="x", labelsize=11, colors="#555555", rotation=45)
    ax.locator_params(axis="x", nbins=12)

    for spine in ax.spines.values():
        spine.set_edgecolor("#CCCCCC")
        spine.set_linewidth(0.8)

    legend = ax.legend(
        handles=handles,
        loc="upper left",
        frameon=True,
        framealpha=0.95,
        edgecolor="#CCCCCC",
        facecolor="white",
        title="Domain",
        title_fontsize=14,
        fontsize=11,
        shadow=True,
        fancybox=True,
    )
    legend.get_title().set_fontweight("bold")
    legend.get_title().set_color("#2c3e50")

    fig.tight_layout(rect=[0, 0, 1, 0.96])

    output_dir.mkdir(parents=True, exist_ok=True)
    output_path = output_dir / f"{solver}_domains_time.png"
    fig.savefig(output_path, dpi=300, bbox_inches="tight", facecolor="white", edgecolor="none")
    plt.close(fig)

    return output_path


def parse_args(argv: Optional[Sequence[str]] = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Plot solver runtimes across domains with unique colors per domain.",
    )
    parser.add_argument(
        "--summary",
        type=Path,
        default=Path("benchmark_problems"),
        help=(
            "Path to a solver summary JSON file or a directory containing summary files "
            "(default: benchmark_problems)."
        ),
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=Path("benchmark_plots") / "combined_time",
        help="Directory to write the combined runtime plot (default: benchmark_plots/combined_time).",
    )
    parser.add_argument(
        "--domains",
        nargs="*",
        help="Limit the plot to specific domains (case-insensitive). Provide multiple names separated by spaces.",
    )
    parser.add_argument(
        "--solver",
        type=str,
        choices=sorted(SOLVER_LABELS.keys()),
        default="optic",
        help="Solver to visualize (default: optic).",
    )
    parser.add_argument(
        "--log-y",
        action="store_true",
        help="Use a logarithmic y-axis.",
    )
    parser.add_argument(
        "--no-error-bar",
        action="store_true",
        help="Disable shaded standard-deviation bands around each domain curve.",
    )

    return parser.parse_args(argv)


def main(argv: Optional[Sequence[str]] = None) -> int:
    args = parse_args(argv)

    try:
        summary_files = find_summary_files(args.summary)
        summaries = [load_summary(path) for path in summary_files]
        merged_summary = merge_summaries(summaries)
        domain_series = build_domain_series(merged_summary, args.domains, args.solver)
        output_path = plot_domains(
            domain_series,
            args.solver,
            args.output_dir,
            log_scale=args.log_y,
            include_error_bar=not args.no_error_bar,
        )
    except Exception as exc:  # noqa: BLE001
        print(f"Error: {exc}")
        return 1

    print(f"Combined domain plot written to: {output_path.resolve()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())


