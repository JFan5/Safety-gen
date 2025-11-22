#!/usr/bin/env python3
"""
Spanner end-to-end pipeline per generatepipeline.md request:
1) Generate unique problems (~5000) with adaptive tier weights into spanner/all_problems
2) Solve generated problems with OPTIC (domain.pddl)
3) Convert problems to PDDL3 using portfolio constraints into spanner/all_problems3
4) Validate: can old solutions (from all_problems/training) solve training_problems3 (if present)
5) Solve PDDL3 with OPTIC (domain3.pddl)
6) Validate and prune invalid (delete .pddl and .soln not passing)
7) Split 200 testing via script/split_problems.py into training/testing under all_problems3
8) Produce report markdown in spanner/GENERATED_README.md

Requirements:
- OPTIC at ~/optic/release/optic/optic-clp
- Validate at ~/VAL/build/linux64/debug/bin/Validate (used by external validate script)
"""

import os
import shutil
import subprocess
import sys
import time
from pathlib import Path


SCENARIO_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCENARIO_DIR.parent

DOMAIN2 = SCENARIO_DIR / "domain.pddl"
DOMAIN3 = SCENARIO_DIR / "domain3.pddl"

ALL_PROBLEMS = SCENARIO_DIR / "all_problems"
ALL_PROBLEMS3 = SCENARIO_DIR / "all_problems3"

REPORT_MD = SCENARIO_DIR / "GENERATED_README.md"

OPTIC = Path.home() / "optic/release/optic/optic-clp"
VALIDATE = Path.home() / "VAL/build/linux64/debug/bin/Validate"


def run(cmd: list[str], cwd: Path | None = None) -> int:
    return subprocess.run(cmd, cwd=str(cwd) if cwd else None).returncode


def check_tools() -> None:
    if not DOMAIN2.exists():
        sys.exit("domain.pddl missing")
    if not DOMAIN3.exists():
        sys.exit("domain3.pddl missing")
    if not OPTIC.exists():
        print("Warning: OPTIC not found at", OPTIC)
    if not VALIDATE.exists():
        print("Warning: Validate not found at", VALIDATE)


def solve_with_optic(problems_dir: Path, domain_file: Path, timeout_sec: int = 5) -> int:
    solver = PROJECT_ROOT / "script/solve_problems_optic.py"
    if not solver.exists():
        sys.exit("solve_problems_optic.py missing")
    return run([sys.executable, str(solver), str(problems_dir), str(domain_file), str(timeout_sec)])


def validate_with_script(domain_file: Path, problems_dir: Path, solutions_dir: Path, timeout: int = 30) -> int:
    val = PROJECT_ROOT / "script/validate_classical_solvers.py"
    if not val.exists():
        sys.exit("validate_classical_solvers.py missing")
    return run([
        sys.executable,
        str(val),
        "--domain", str(domain_file),
        "--problems_dir", str(problems_dir),
        "--solutions_dir", str(solutions_dir),
        "--timeout", str(timeout),
    ])


def convert_to_pddl3(input_dir: Path, output_dir: Path) -> int:
    conv = SCENARIO_DIR / "convert_pddl3.py"
    return run([sys.executable, str(conv), str(input_dir), str(output_dir)])


def prune_invalid_using_validate(domain_file: Path, problems_dir: Path) -> None:
    removed = 0
    kept = 0
    for p in sorted(problems_dir.glob("*.pddl")):
        s = p.with_suffix(".soln")
        if not s.exists():
            try:
                p.unlink()
            except Exception:
                pass
            continue
        try:
            res = subprocess.run([str(VALIDATE), str(domain_file), str(p), str(s)], capture_output=True, text=True, timeout=20)
            ok = res.returncode == 0 and ((res.stdout or "").lower().find("plan valid") != -1 or (res.stdout or "").lower().find("plan successfully executed") != -1)
        except Exception:
            ok = False
        if ok:
            kept += 1
        else:
            try:
                s.unlink()
            except Exception:
                pass
            try:
                p.unlink()
            except Exception:
                pass
            removed += 1
    print(f"Pruned invalid: removed={removed}, kept={kept}")


def split_testing(input_dir: Path, num_testing: int) -> int:
    splitter = PROJECT_ROOT / "script/split_problems.py"
    return run([
        sys.executable,
        str(splitter),
        "--input-dir", str(input_dir),
        "--num-testing", str(num_testing),
        "--force",
    ])


def write_report(md_path: Path, stats: dict) -> None:
    lines: list[str] = []
    lines.append("### Spanner Pipeline Report")
    lines.append("")
    lines.append(f"- **generated_total**: {stats.get('generated_total', 'n/a')}")
    lines.append(f"- **pddl3_total**: {stats.get('pddl3_total', 'n/a')}")
    lines.append(f"- **solve2_success**: {stats.get('solve2_success', 'n/a')}")
    lines.append(f"- **solve3_success**: {stats.get('solve3_success', 'n/a')}")
    lines.append(f"- **validated_kept_after_step6**: {stats.get('validated_kept', 'n/a')}")
    lines.append(f"- **training_count**: {stats.get('training_count', 'n/a')}")
    lines.append(f"- **testing_count**: {stats.get('testing_count', 'n/a')}")
    md_path.write_text("\n".join(lines))


def count_files(dir_path: Path, ext: str) -> int:
    return len(list(dir_path.glob(f"*{ext}"))) if dir_path.exists() else 0


def main() -> None:
    t0 = time.time()
    check_tools()

    # 1) Generate
    gen_sh = SCENARIO_DIR / "generate_spanner_training_unique.sh"
    if ALL_PROBLEMS.exists():
        shutil.rmtree(ALL_PROBLEMS)
    if run([str(gen_sh)]) != 0:
        sys.exit(1)
    gen_total = count_files(ALL_PROBLEMS, ".pddl")

    # 2) Solve problems (domain2)
    solve2_rc = solve_with_optic(ALL_PROBLEMS, DOMAIN2, timeout_sec=5)

    # 3) Convert to PDDL3
    if ALL_PROBLEMS3.exists():
        shutil.rmtree(ALL_PROBLEMS3)
    if convert_to_pddl3(ALL_PROBLEMS, ALL_PROBLEMS3) != 0:
        sys.exit(1)
    pddl3_total = count_files(ALL_PROBLEMS3, ".pddl")

    # 4) Validate old solutions on new training if layout exists; otherwise skip
    training3 = SCENARIO_DIR / "training_problems3"
    if training3.exists():
        validate_with_script(DOMAIN3, training3, ALL_PROBLEMS / "training")

    # 5) Solve PDDL3 (domain3)
    solve3_rc = solve_with_optic(ALL_PROBLEMS3, DOMAIN3, timeout_sec=5)

    # 6) Validate and prune invalid in all_problems3
    prune_invalid_using_validate(DOMAIN3, ALL_PROBLEMS3)

    # 7) Split 200 testing under all_problems3
    if split_testing(ALL_PROBLEMS3, 200) != 0:
        sys.exit(1)

    # Gather stats
    training_dir = ALL_PROBLEMS3 / "training"
    testing_dir = ALL_PROBLEMS3 / "testing"
    stats = {
        "generated_total": gen_total,
        "pddl3_total": pddl3_total,
        "solve2_success": "see console",
        "solve3_success": "see console",
        "validated_kept": count_files(ALL_PROBLEMS3, ".pddl"),
        "training_count": count_files(training_dir, ".pddl"),
        "testing_count": count_files(testing_dir, ".pddl"),
        "elapsed_sec": int(time.time() - t0),
    }

    write_report(REPORT_MD, stats)
    print("Done. Report:", REPORT_MD)


if __name__ == "__main__":
    main()


