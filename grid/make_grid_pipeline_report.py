#!/usr/bin/env python3
import json
from pathlib import Path
import sys


def load_summary(json_path: Path) -> dict:
    if not json_path.exists():
        return {}
    try:
        return json.loads(json_path.read_text(encoding="utf-8"))
    except Exception:
        return {}


def main() -> int:
    if len(sys.argv) < 2:
        print("Usage: make_grid_pipeline_report.py <output_md>")
        return 2

    out_md = Path(sys.argv[1])
    cwd = Path.cwd()

    # Potential validation reports
    old_vs_new = cwd / "grid_old_vs_new_validation_results.json"
    final_all = cwd / "grid_all_problems3_validation_results.json"

    s1 = load_summary(old_vs_new)
    s2 = load_summary(final_all)

    md = []
    md.append("## Grid Pipeline Results")
    md.append("")
    # Generation
    ap = cwd / "all_problems"
    ap3 = cwd / "all_problems3"
    ap_count = len(list(ap.glob("*.pddl"))) if ap.exists() else 0
    ap3_count = len(list(ap3.glob("*.pddl"))) if ap3.exists() else 0
    md.append(f"- **Generated (PDDL2)**: {ap_count} problems in `{ap}`")
    md.append(f"- **Converted (PDDL3)**: {ap3_count} problems in `{ap3}`")

    # Old vs New validation
    if s1:
        summ = s1.get("summary", {})
        md.append("")
        md.append("### Validate old solutions on new PDDL3 problems")
        md.append(f"- **Total**: {summ.get('total_solutions', 0)}")
        md.append(f"- **Valid**: {summ.get('valid', 0)}")
        md.append(f"- **Invalid**: {summ.get('invalid', 0)}")
        md.append(f"- **Success rate**: {summ.get('success_rate', 0):.1f}%")

    # Final validation
    if s2:
        summ = s2.get("summary", {})
        md.append("")
        md.append("### Final validation of PDDL3 solutions")
        md.append(f"- **Total**: {summ.get('total_solutions', 0)}")
        md.append(f"- **Valid**: {summ.get('valid', 0)}")
        md.append(f"- **Invalid**: {summ.get('invalid', 0)}")
        md.append(f"- **Success rate**: {summ.get('success_rate', 0):.1f}%")

    out_md.write_text("\n".join(md) + "\n", encoding="utf-8")
    print(f"Report written: {out_md}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())


