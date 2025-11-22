#!/usr/bin/env python3
import argparse
import os
import subprocess
import sys
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser(description="Convert Spanner problems to PDDL3 with safety constraints.")
    parser.add_argument("input_dir", type=str, help="Input directory containing .pddl problems")
    parser.add_argument("output_dir", type=str, help="Output directory for converted PDDL3 problems")
    # Advanced flags are internally chosen for stable behavior; expose passthrough if needed later
    args = parser.parse_args()

    here = Path(__file__).resolve().parent
    tool = here / "convert_training_to_pddl3.py"
    if not tool.exists():
        print(f"Error: helper not found: {tool}")
        sys.exit(1)

    cmd = [
        sys.executable or "python3",
        str(tool),
        "--input", args.input_dir,
        "--output", args.output_dir,
        # Balanced, plan-aware safety mixture; keep deterministic defaults
        "--safety-mode", "portfolio",
        "--portfolio-size", "2",
        "--difficulty", "med",
        "--invert-order-from-plan",
        "--invert-count", "1",
        # Keep capacity auto-off by default; portfolio may already add constraints
        "--inject-capacity", "never",
    ]
    res = subprocess.run(cmd)
    sys.exit(res.returncode)


if __name__ == "__main__":
    main()


