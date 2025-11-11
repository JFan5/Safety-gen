#!/usr/bin/env python3
"""
Visualize solver runtimes from solver_summary.json style reports.

The script reads the JSON summaries produced by run_optic_benchmark.py (or its
derivatives) and creates runtime plots for each scenario.
"""

from __future__ import annotations

import argparse
import json
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, Iterable, List, Mapping, MutableMapping, Optional, Sequence, Tuple

import matplotlib

matplotlib.use("Agg")

import matplotlib.pyplot as plt  # noqa: E402
from matplotlib.lines import Line2D  # noqa: E402
import seaborn as sns  # noqa: E402


# --- Matplotlib / Seaborn global style -------------------------------------------------------------
# Configure matplotlib to use English fonts only (avoid Chinese font issues)
plt.rcParams['font.family'] = 'DejaVu Sans'
plt.rcParams['font.sans-serif'] = ['DejaVu Sans', 'Arial', 'Liberation Sans', 'sans-serif']
plt.rcParams['axes.unicode_minus'] = False  # Use ASCII minus sign
plt.rcParams['figure.facecolor'] = 'white'
plt.rcParams['axes.facecolor'] = 'white'
plt.rcParams['savefig.facecolor'] = 'white'
plt.rcParams['savefig.bbox'] = 'tight'

# Use modern seaborn style
sns.set_style("whitegrid", {
    'axes.spines.left': True,
    'axes.spines.bottom': True,
    'axes.spines.top': False,
    'axes.spines.right': False,
    'axes.grid': True,
    'axes.grid.alpha': 0.3,
    'grid.color': '#CCCCCC',
    'grid.linestyle': '--',
    'grid.linewidth': 0.8,
})
sns.set_context("paper", font_scale=1.2, rc={"lines.linewidth": 2.5})

# Modern color palette using seaborn
solver_palette = sns.color_palette("Set2", 2)
SOLVER_LABELS: Mapping[str, str] = {
    "optic": "OPTIC",
    "llm": "LLM",
}

# Use seaborn color palette - more vibrant and modern
SOLVER_COLORS: Mapping[str, str] = {
    "optic": "#2E86AB",  # Modern blue
    "llm": "#A23B72",    # Modern purple
}

# Alternative: Use seaborn palette directly
# solver_colors_list = sns.color_palette("husl", 2)
# SOLVER_COLORS = {
#     "optic": solver_colors_list[0],
#     "llm": solver_colors_list[1],
# }

STATUS_COLORS: Mapping[str, str] = {
    "valid": "#2ecc71",
    "timeout": "#f39c12",
    "invalid": "#e74c3c",
    "mixed": "#95a5a6",
}

STATUS_LABELS: Mapping[str, str] = {
    "valid": "All Valid",
    "timeout": "Timeout Occurred",
    "invalid": "Contains Invalid Plan",
    "mixed": "Mixed Status",
}

# Line styles for different scenarios (for combined plots)
SCENARIO_LINESTYLES: List[str] = ['-', '--', '-.', ':', '-', '--', '-.']
SCENARIO_MARKERS: List[str] = ['o', 's', '^', 'D', 'v', 'p', '*']


@dataclass
class SolverRecord:
    """Single problem result entry."""

    solver: str
    problem_name: str
    parameter_value: Optional[int]
    elapsed_seconds: float
    status: str
    validation: str
    order: int  # order within the scenario list (used when parameter is missing)


@dataclass
class AggregatedPoint:
    """Aggregated statistics for a single parameter (or problem index)."""

    solver: str
    key: Tuple[str, int]
    x_value: float
    label: str
    times: List[float] = field(default_factory=list)
    statuses: List[str] = field(default_factory=list)
    validations: List[str] = field(default_factory=list)

    def add(self, record: SolverRecord) -> None:
        self.times.append(record.elapsed_seconds)
        self.statuses.append(record.status)
        self.validations.append(record.validation)

    @property
    def avg_time(self) -> float:
        return sum(self.times) / len(self.times)

    @property
    def min_time(self) -> float:
        return min(self.times)

    @property
    def max_time(self) -> float:
        return max(self.times)
    
    @property
    def std_time(self) -> float:
        """Calculate standard deviation of times."""
        if len(self.times) <= 1:
            return 0.0
        mean_time = self.avg_time
        variance = sum((t - mean_time) ** 2 for t in self.times) / len(self.times)
        return variance ** 0.5
    
    @property
    def std_lower(self) -> float:
        """Lower bound using standard deviation (avg - std)."""
        return max(0.0, self.avg_time - self.std_time)
    
    @property
    def std_upper(self) -> float:
        """Upper bound using standard deviation (avg + std)."""
        return self.avg_time + self.std_time

    @property
    def count(self) -> int:
        return len(self.times)

    def status_category(self) -> str:
        lowered_statuses = [status.lower() for status in self.statuses]
        lowered_validations = [
            validation.lower() for validation in self.validations if validation
        ]

        if any(status == "timeout" for status in lowered_statuses):
            return "timeout"

        if lowered_validations:
            if all(validation == "valid" for validation in lowered_validations):
                return "valid"
            if any(validation != "valid" for validation in lowered_validations):
                return "invalid"

        if any(
            status in {"invalid", "generation_error", "error"}
            for status in lowered_statuses
        ):
            return "invalid"

        if lowered_statuses and all(
            status in {"solved", "generated", "success"} for status in lowered_statuses
        ):
            return "valid"

        return "mixed"


# --- Data Processing --------------------------------------------------------------------------------
def load_summary(path: Path) -> Dict[str, object]:
    if not path.exists():
        raise FileNotFoundError(f"Summary file not found: {path}")
    with path.open("r", encoding="utf-8") as fh:
        return json.load(fh)


def merge_summaries(summaries: List[Dict[str, object]]) -> Dict[str, object]:
    """Merge multiple summary dictionaries into one."""
    if not summaries:
        raise ValueError("No summaries to merge")
    
    if len(summaries) == 1:
        return summaries[0]
    
    merged: Dict[str, object] = {"scenarios": {}}
    
    for summary in summaries:
        scenarios = summary.get("scenarios")
        if not isinstance(scenarios, Mapping):
            continue
        
        for scenario_name, scenario_data in scenarios.items():
            if not isinstance(scenario_data, Mapping):
                continue
            
            if scenario_name not in merged["scenarios"]:
                merged["scenarios"][scenario_name] = {"problems": []}
            
            problems = scenario_data.get("problems")
            if not isinstance(problems, Sequence):
                continue
            
            # Get existing problems for this scenario
            existing_problems = merged["scenarios"][scenario_name].get("problems", [])
            if not isinstance(existing_problems, List):
                existing_problems = []
            
            # Create a map of existing problems by problem name
            problem_map: Dict[str, Dict[str, object]] = {}
            for prob in existing_problems:
                if isinstance(prob, Mapping):
                    prob_name = str(prob.get("problem", ""))
                    if prob_name:
                        problem_map[prob_name] = prob.copy()
            
            # Merge new problems
            for prob in problems:
                if not isinstance(prob, Mapping):
                    continue
                prob_name = str(prob.get("problem", ""))
                if not prob_name:
                    continue
                
                if prob_name in problem_map:
                    # Merge solver data from this problem into existing problem
                    existing_prob = problem_map[prob_name]
                    for solver in ("optic", "llm"):
                        solver_data = prob.get(solver)
                        # Update if we have valid solver data (Mapping, not null)
                        if solver_data is not None and isinstance(solver_data, Mapping):
                            existing_prob[solver] = solver_data
                else:
                    # New problem, add it
                    problem_map[prob_name] = prob.copy()
            
            # Update merged scenario with merged problems
            merged["scenarios"][scenario_name]["problems"] = list(problem_map.values())
    
    return merged


def find_summary_files(base_path: Path) -> List[Path]:
    """Find summary files in a directory or return the path if it's a file."""
    if base_path.is_file():
        return [base_path]
    
    if base_path.is_dir():
        # Look for common summary file names (prioritize llm and optic)
        summary_files = []
        # First, try to find llm_summary.json and optic_summary.json
        for name in ["llm_summary.json", "optic_summary.json"]:
            file_path = base_path / name
            if file_path.exists():
                summary_files.append(file_path)
        
        # If we found llm and optic files, use only those
        if len(summary_files) >= 2:
            return sorted(summary_files)
        
        # Otherwise, try solver_summary.json as fallback
        solver_summary = base_path / "solver_summary.json"
        if solver_summary.exists():
            if summary_files:
                # If we have some files, include solver_summary too
                summary_files.append(solver_summary)
            else:
                # Only solver_summary exists
                return [solver_summary]
        
        if summary_files:
            return sorted(summary_files)
        else:
            raise FileNotFoundError(
                f"No summary files found in {base_path}. "
                f"Expected one of: llm_summary.json, optic_summary.json, solver_summary.json"
            )
    
    raise FileNotFoundError(f"Path not found: {base_path}")


def parse_records(
    summary: Mapping[str, object],
    selected_scenarios: Optional[Iterable[str]],
    selected_solvers: Optional[Sequence[str]],
) -> Dict[str, Dict[str, List[SolverRecord]]]:
    scenarios = summary.get("scenarios")
    if not isinstance(scenarios, Mapping):
        raise ValueError("Summary JSON missing 'scenarios' section or has invalid format")

    scenario_filter = {s.lower() for s in selected_scenarios} if selected_scenarios else None
    solver_filter = [s.lower() for s in selected_solvers] if selected_solvers else None

    parsed: Dict[str, Dict[str, List[SolverRecord]]] = {}

    for scenario_name, scenario_payload in scenarios.items():
        scenario_key = scenario_name.lower()
        if scenario_filter and scenario_key not in scenario_filter:
            continue

        if not isinstance(scenario_payload, Mapping):
            continue

        problems = scenario_payload.get("problems")
        if not isinstance(problems, Sequence):
            continue

        records_by_solver: Dict[str, List[SolverRecord]] = {}
        for idx, problem in enumerate(problems):
            if not isinstance(problem, Mapping):
                continue

            param_value = problem.get("parameter_value")
            parameter_value: Optional[int]
            if isinstance(param_value, (int, float)):
                parameter_value = int(param_value)
            else:
                parameter_value = None

            problem_name = str(problem.get("problem", f"problem_{idx+1}"))

            for solver in ("optic", "llm"):
                if solver_filter and solver not in solver_filter:
                    continue

                solver_entry = problem.get(solver)
                if not isinstance(solver_entry, Mapping):
                    continue

                elapsed = solver_entry.get("elapsed_seconds")
                if elapsed is None:
                    continue

                try:
                    elapsed_seconds = float(elapsed)
                except (TypeError, ValueError):
                    continue

                status = str(solver_entry.get("status", "unknown"))
                validation = str(solver_entry.get("validation", "") or "")

                record = SolverRecord(
                    solver=solver,
                    problem_name=problem_name,
                    parameter_value=parameter_value,
                    elapsed_seconds=elapsed_seconds,
                    status=status,
                    validation=validation,
                    order=idx,
                )
                records_by_solver.setdefault(solver, []).append(record)

        if records_by_solver:
            parsed[scenario_name] = records_by_solver

    if not parsed:
        raise ValueError("No plottable data could be parsed from the summary. Please verify the input file.")

    return parsed


def aggregate_records(records: Sequence[SolverRecord]) -> List[AggregatedPoint]:
    # First, group by parameter value or index
    initial_grouped: MutableMapping[Tuple[str, int], AggregatedPoint] = {}
    for record in records:
        if record.parameter_value is not None:
            key = ("param", record.parameter_value)
            x_value = float(record.parameter_value)
            label = str(record.parameter_value)
        else:
            key = ("index", record.order + 1)
            x_value = float(record.order + 1)
            label = f"#{record.order + 1}"

        point = initial_grouped.get(key)
        if point is None:
            point = AggregatedPoint(
                solver=record.solver,
                key=key,
                x_value=x_value,
                label=label,
            )
            initial_grouped[key] = point

        point.add(record)

    # Sort by x_value
    sorted_points = sorted(initial_grouped.values(), key=lambda item: (item.key[0], item.x_value))
    
    # Group every 3 consecutive parameter values and compute average
    if not sorted_points:
        return []
    
    # Check if we have parameter-based grouping
    has_params = sorted_points[0].key[0] == "param"
    
    if has_params:
        # Group by batches of 3 consecutive parameter values
        batched_points: List[AggregatedPoint] = []
        i = 0
        while i < len(sorted_points):
            batch = sorted_points[i:i+3]
            if not batch:
                break
            
            # Create a new aggregated point for this batch
            param_values = [p.x_value for p in batch]
            avg_param = sum(param_values) / len(param_values)
            min_param = min(param_values)
            max_param = max(param_values)
            
            # Create label showing the range
            if len(batch) == 3:
                label = f"{int(min_param)}-{int(max_param)}"
            else:
                label = f"{int(min_param)}-{int(max_param)}" if min_param != max_param else str(int(avg_param))
            
            # Merge all records from this batch
            batch_point = AggregatedPoint(
                solver=batch[0].solver,
                key=("param", int(avg_param)),
                x_value=avg_param,
                label=label,
            )
            
            # Add all times from the batch
            for point in batch:
                batch_point.times.extend(point.times)
                batch_point.statuses.extend(point.statuses)
                batch_point.validations.extend(point.validations)
            
            batched_points.append(batch_point)
            i += 3
        
        return batched_points
    else:
        # For index-based, also group by 3
        batched_points: List[AggregatedPoint] = []
        i = 0
        while i < len(sorted_points):
            batch = sorted_points[i:i+3]
            if not batch:
                break
            
            # Create a new aggregated point for this batch
            indices = [p.x_value for p in batch]
            avg_index = sum(indices) / len(indices)
            min_index = min(indices)
            max_index = max(indices)
            
            # Create label
            if len(batch) == 3:
                label = f"#{int(min_index)}-#{int(max_index)}"
            else:
                label = f"#{int(min_index)}-#{int(max_index)}" if min_index != max_index else f"#{int(avg_index)}"
            
            batch_point = AggregatedPoint(
                solver=batch[0].solver,
                key=("index", int(avg_index)),
                x_value=avg_index,
                label=label,
            )
            
            for point in batch:
                batch_point.times.extend(point.times)
                batch_point.statuses.extend(point.statuses)
                batch_point.validations.extend(point.validations)
            
            batched_points.append(batch_point)
            i += 3
        
        return batched_points


# --- Plotting --------------------------------------------------------------------------------------
def build_aggregated_solver_points(
    solver_data: Mapping[str, Sequence[SolverRecord]]
) -> Dict[str, List[AggregatedPoint]]:
    aggregated_by_solver: Dict[str, List[AggregatedPoint]] = {
        solver: aggregate_records(records)
        for solver, records in solver_data.items()
    }
    return {solver: points for solver, points in aggregated_by_solver.items() if points}


def draw_scenario_plot(
    ax: plt.Axes,
    scenario: str,
    aggregated_by_solver: Mapping[str, Sequence[AggregatedPoint]],
    *,
    log_scale: bool,
    include_error_bar: bool,
    show_legends: bool,
) -> Tuple[List[Line2D], List[Line2D]]:
    tick_labels: Dict[float, str] = {}
    
    # Use seaborn markers for better visibility
    markers = ['o', 's', '^', 'D', 'v']
    marker_idx = 0

    for solver, points in aggregated_by_solver.items():
        base_color = SOLVER_COLORS.get(solver, "#34495e")
        label = SOLVER_LABELS.get(solver, solver.upper())
        marker = markers[marker_idx % len(markers)]
        marker_idx += 1

        x_values = [point.x_value for point in points]
        avg_times = [point.avg_time for point in points]

        # Plot filled area for error range using standard deviation (smaller than min/max)
        if include_error_bar:
            lower_bounds = [point.std_lower for point in points]
            upper_bounds = [point.std_upper for point in points]
            ax.fill_between(
                x_values,
                lower_bounds,
                upper_bounds,
                color=base_color,
                alpha=0.15,
                edgecolor='none',
            )
        
        # Plot main line with markers
        ax.plot(
            x_values,
            avg_times,
            color=base_color,
            linewidth=3.0,
            marker=marker,
            markersize=8,
            markeredgewidth=1.5,
            markeredgecolor='white',
            alpha=0.9,
            label=label,
            zorder=3,
        )

        # Collect tick labels
        for point, x_val in zip(points, x_values):
            tick_labels[x_val] = point.label

    # Set x-axis ticks and labels (show fewer labels to shorten x-axis)
    sorted_ticks = sorted(tick_labels.items(), key=lambda item: item[0])
    tick_positions = [item[0] for item in sorted_ticks]
    tick_labels_list = [item[1] for item in sorted_ticks]
    
    # Show fewer labels to shorten x-axis (about 8-12 labels max)
    if len(tick_positions) > 12:
        step = max(1, len(tick_positions) // 10)
        ax.set_xticks(tick_positions[::step])
        ax.set_xticklabels(tick_labels_list[::step], fontsize=11, rotation=45, ha='right')
    else:
        # If we have few points, show all labels
        ax.set_xticks(tick_positions)
        ax.set_xticklabels(tick_labels_list, fontsize=11, rotation=45, ha='right')

    # Beautiful labels and title
    ax.set_xlabel("Parameter Value / Problem Index", 
                  fontsize=14, fontweight="bold", color='#333333', labelpad=10)
    ax.set_ylabel("Runtime (seconds)", 
                  fontsize=14, fontweight="bold", color='#333333', labelpad=10)
    ax.set_title(
        f"{scenario.title()} - Solver Runtime Comparison",
        fontsize=18,
        fontweight="bold",
        pad=20,
        color='#2c3e50',
    )

    if log_scale:
        ax.set_yscale("log")
        ax.set_ylabel("Runtime (seconds, log scale)", 
                      fontsize=14, fontweight="bold", color='#333333', labelpad=10)

    # Improved grid
    ax.grid(True, alpha=0.3, linestyle='--', linewidth=0.8, color='#CCCCCC')
    ax.set_axisbelow(True)

    # Create beautiful legend
    solver_handles = []
    marker_idx = 0
    for solver in aggregated_by_solver.keys():
        marker = markers[marker_idx % len(markers)]
        marker_idx += 1
        solver_handles.append(
            Line2D(
                [0],
                [0],
                color=SOLVER_COLORS.get(solver, "#34495e"),
                marker=marker,
                markersize=10,
                markeredgewidth=1.5,
                markeredgecolor='white',
                lw=3.0,
                label=SOLVER_LABELS.get(solver, solver.upper()),
            )
        )

    if show_legends:
        solver_legend = ax.legend(
            handles=solver_handles,
            loc="upper left",
            frameon=True,
            framealpha=0.95,
            edgecolor='#CCCCCC',
            facecolor='white',
            title="Solver",
            title_fontsize=13,
            fontsize=12,
            shadow=True,
            fancybox=True,
        )
        solver_legend.get_title().set_fontweight('bold')
        solver_legend.get_title().set_color('#2c3e50')

    # Improved tick parameters
    ax.tick_params(axis="y", labelsize=12, colors='#555555')
    ax.tick_params(axis="x", labelsize=11, colors='#555555')
    
    # Set spine colors
    for spine in ax.spines.values():
        spine.set_edgecolor('#CCCCCC')
        spine.set_linewidth(0.8)

    return solver_handles, []


def plot_scenario_time(
    scenario: str,
    solver_data: Mapping[str, Sequence[SolverRecord]],
    output_dir: Path,
    log_scale: bool = False,
    include_error_bar: bool = True,
) -> Optional[Path]:
    aggregated_by_solver = build_aggregated_solver_points(solver_data)
    if not aggregated_by_solver:
        return None

    # Larger figure for better visibility
    fig, ax = plt.subplots(figsize=(14, 8))
    fig.patch.set_facecolor('white')

    draw_scenario_plot(
        ax,
        scenario,
        aggregated_by_solver,
        log_scale=log_scale,
        include_error_bar=include_error_bar,
        show_legends=True,
    )

    fig.tight_layout(rect=[0, 0, 1, 0.96])

    output_dir.mkdir(parents=True, exist_ok=True)
    output_path = output_dir / f"{scenario}_time.png"
    fig.savefig(output_path, dpi=300, bbox_inches="tight", facecolor="white", edgecolor='none')
    plt.close(fig)

    return output_path


def plot_combined_time(
    scenarios_data: Mapping[str, Mapping[str, Sequence[SolverRecord]]],
    output_dir: Path,
    log_scale: bool = False,
    include_error_bar: bool = True,
) -> Optional[Path]:
    aggregated_per_scenario = {
        scenario: build_aggregated_solver_points(solver_data)
        for scenario, solver_data in scenarios_data.items()
    }
    aggregated_per_scenario = {
        scenario: aggregated
        for scenario, aggregated in aggregated_per_scenario.items()
        if aggregated
    }

    if not aggregated_per_scenario:
        return None

    scenario_items = sorted(aggregated_per_scenario.items())
    
    # Larger figure for combined plot
    fig, ax = plt.subplots(figsize=(16, 10))
    fig.patch.set_facecolor('white')
    
    # Plot each scenario-solver combination
    legend_handles: List[Line2D] = []
    
    for scenario_idx, (scenario, aggregated) in enumerate(scenario_items):
        linestyle = SCENARIO_LINESTYLES[scenario_idx % len(SCENARIO_LINESTYLES)]
        marker = SCENARIO_MARKERS[scenario_idx % len(SCENARIO_MARKERS)]
        
        for solver, points in aggregated.items():
            base_color = SOLVER_COLORS.get(solver, "#34495e")
            solver_label = SOLVER_LABELS.get(solver, solver.upper())
            
            x_values = [point.x_value for point in points]
            avg_times = [point.avg_time for point in points]
            
            # Create label: "Scenario - Solver"
            label = f"{scenario.title()} - {solver_label}"
            
            # Plot filled area for error range using standard deviation (smaller than min/max)
            if include_error_bar:
                lower_bounds = [point.std_lower for point in points]
                upper_bounds = [point.std_upper for point in points]
                ax.fill_between(
                    x_values,
                    lower_bounds,
                    upper_bounds,
                    color=base_color,
                    alpha=0.12,
                    edgecolor='none',
                )
            
            # Plot line with markers
            line = ax.plot(
                x_values,
                avg_times,
                color=base_color,
                linestyle=linestyle,
                marker=marker,
                linewidth=2.8,
                markersize=7,
                markeredgewidth=1.2,
                markeredgecolor='white',
                alpha=0.9,
                label=label,
                zorder=3,
            )[0]
            
            # Add to legend handles
            legend_handles.append(line)
    
    # Beautiful labels and title
    ax.set_xlabel("Parameter Value / Problem Index", 
                  fontsize=15, fontweight="bold", color='#333333', labelpad=12)
    ax.set_ylabel("Runtime (seconds)", 
                  fontsize=15, fontweight="bold", color='#333333', labelpad=12)
    ax.set_title(
        "Solver Runtime Comparison Across All Scenarios",
        fontsize=20,
        fontweight="bold",
        pad=25,
        color='#2c3e50',
    )
    
    if log_scale:
        ax.set_yscale("log")
        ax.set_ylabel("Runtime (seconds, log scale)", 
                      fontsize=15, fontweight="bold", color='#333333', labelpad=12)
    
    # Improved grid
    ax.grid(True, alpha=0.3, linestyle='--', linewidth=0.8, color='#CCCCCC')
    ax.set_axisbelow(True)
    
    # Create beautiful legend
    scenario_solver_legend = ax.legend(
        handles=legend_handles,
        loc="upper left",
        frameon=True,
        framealpha=0.95,
        edgecolor='#CCCCCC',
        facecolor='white',
        title="Scenario - Solver",
        title_fontsize=14,
        fontsize=11,
        shadow=True,
        fancybox=True,
        ncol=1,
    )
    scenario_solver_legend.get_title().set_fontweight('bold')
    scenario_solver_legend.get_title().set_color('#2c3e50')
    
    # Improved tick parameters
    ax.tick_params(axis="y", labelsize=12, colors='#555555')
    ax.tick_params(axis="x", labelsize=11, colors='#555555', rotation=45)
    
    # Set spine colors
    for spine in ax.spines.values():
        spine.set_edgecolor('#CCCCCC')
        spine.set_linewidth(0.8)
    
    # Automatically adjust x-axis ticks to show fewer labels
    ax.locator_params(axis='x', nbins=12)
    
    fig.tight_layout(rect=[0, 0, 1, 0.96])
    
    output_dir.mkdir(parents=True, exist_ok=True)
    output_path = output_dir / "combined_time.png"
    fig.savefig(output_path, dpi=300, bbox_inches="tight", facecolor="white", edgecolor='none')
    plt.close(fig)
    
    return output_path


# --- CLI ------------------------------------------------------------------------------------------
def parse_args(argv: Optional[Sequence[str]] = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Plot solver runtime curves from solver_summary-style JSON reports.",
    )
    parser.add_argument(
        "--summary",
        type=Path,
        default=Path("benchmark_problems"),
        help="Path to the summary JSON file or directory containing summary files. "
             "If directory, will automatically find llm_summary.json and optic_summary.json "
             "(default: benchmark_problems).",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=Path("benchmark_plots") / "time_benchmark",
        help="Directory to write plots into (default: benchmark_plots/time_benchmark).",
    )
    parser.add_argument(
        "--scenarios",
        nargs="*",
        help="Limit to specific scenarios (case-insensitive). Provide multiple names separated by spaces.",
    )
    parser.add_argument(
        "--solvers",
        nargs="*",
        choices=sorted(SOLVER_LABELS.keys()),
        help="Limit to specific solvers (default: plot all available solvers).",
    )
    parser.add_argument(
        "--log-y",
        action="store_true",
        help="Use a logarithmic y-axis (helpful when runtimes vary widely).",
    )
    parser.add_argument(
        "--no-error-bar",
        action="store_true",
        help="Disable error bars (min/max range is shown by default).",
    )
    parser.add_argument(
        "--combine",
        action="store_true",
        help="Create a single figure with all scenario curves overlaid on one plot.",
    )
    parser.add_argument(
        "--combined-only",
        action="store_true",
        help="Only generate the combined figure (implies --combine).",
    )

    return parser.parse_args(argv)


def main(argv: Optional[Sequence[str]] = None) -> int:
    args = parse_args(argv)

    if args.combined_only and not args.combine:
        print("--combined-only requires --combine.", file=sys.stderr)
        return 1

    try:
        # Find all summary files (supports directory or file)
        summary_files = find_summary_files(args.summary)
        print(f"Found {len(summary_files)} summary file(s):")
        for sf in summary_files:
            print(f"  - {sf}")
        
        # Load and merge all summaries
        summaries = [load_summary(sf) for sf in summary_files]
        merged_summary = merge_summaries(summaries)
        
        # Check which scenarios have which solvers
        scenarios_data = merged_summary.get("scenarios", {})
        solver_availability: Dict[str, Dict[str, bool]] = {}
        for scenario_name, scenario_data in scenarios_data.items():
            if not isinstance(scenario_data, Mapping):
                continue
            problems = scenario_data.get("problems", [])
            if not isinstance(problems, Sequence):
                continue
            
            has_optic = False
            has_llm = False
            
            for problem in problems:
                if not isinstance(problem, Mapping):
                    continue
                optic_data = problem.get("optic")
                llm_data = problem.get("llm")
                
                if isinstance(optic_data, Mapping) and optic_data.get("elapsed_seconds") is not None:
                    has_optic = True
                if isinstance(llm_data, Mapping) and llm_data.get("elapsed_seconds") is not None:
                    has_llm = True
                
                if has_optic and has_llm:
                    break
            
            solver_availability[scenario_name] = {
                "optic": has_optic,
                "llm": has_llm,
            }
        
        # Print warnings for missing solver data
        for scenario_name, availability in sorted(solver_availability.items()):
            missing_solvers = []
            if not availability.get("optic"):
                missing_solvers.append("OPTIC")
            if not availability.get("llm"):
                missing_solvers.append("LLM")
            
            if missing_solvers:
                print(f"Warning: Scenario '{scenario_name}' is missing data for: {', '.join(missing_solvers)}", file=sys.stderr)
        
        # Parse records (if no solvers specified, show all available)
        parsed_records = parse_records(merged_summary, args.scenarios, args.solvers)
    except Exception as exc:  # noqa: BLE001
        print(f"Error: {exc}", file=sys.stderr)
        return 1

    generated_plots: List[Tuple[str, Path]] = []
    combined_plot: Optional[Path] = None

    if not args.combined_only:
        for scenario, solver_records in parsed_records.items():
            output_path = plot_scenario_time(
                scenario,
                solver_records,
                args.output_dir,
                log_scale=args.log_y,
                include_error_bar=not args.no_error_bar,
            )
            if output_path:
                generated_plots.append((scenario, output_path))

    if args.combine:
        combined_plot = plot_combined_time(
            parsed_records,
            args.output_dir,
            log_scale=args.log_y,
            include_error_bar=not args.no_error_bar,
        )

    if not generated_plots and not combined_plot:
        print("No plots were generated. Please review the input parameters.")
        return 0

    if generated_plots:
        print("Generated per-scenario plots:")
        for scenario, path in generated_plots:
            print(f"  - {scenario}: {path.resolve()}")

    if combined_plot:
        print(f"Combined plot: {combined_plot.resolve()}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())

