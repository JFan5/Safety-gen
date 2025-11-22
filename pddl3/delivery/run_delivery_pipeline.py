#!/usr/bin/env python3
"""
Delivery end-to-end pipeline:
- Generate training_problems (1000) and testing_problems (100) with no duplicates between sets
- Solve all problems with OPTIC
- Validate solutions with VAL Validate

Usage:
  python3 run_delivery_pipeline.py

Requirements:
- Python delivery generator available (uses gen_unique_delivery.py)
- OPTIC available at ~/optic/release/optic/optic-clp
- Validate available at ~/VAL/build/linux64/debug/bin/Validate
"""

import os
import subprocess
import sys
from pathlib import Path
from typing import Iterable, List, Optional, Tuple

# Configuration
SCENARIO_DIR = Path(__file__).resolve().parent
DOMAIN_FILE = SCENARIO_DIR / "domain.pddl"
TRAIN_DIR = SCENARIO_DIR / "training_problems"
TEST_DIR = SCENARIO_DIR / "testing_problems"

GEN_UNIQUE = SCENARIO_DIR / "gen_unique_delivery.py"

OPTIC_PATH = Path.home() / "optic/release/optic/optic-clp"
VALIDATE_PATH = Path.home() / "VAL/build/linux64/debug/bin/Validate"

TARGET_TRAIN = 1000
TARGET_TEST = 100

# Timeouts (seconds)
SOLVE_TIMEOUT = 30
VALIDATE_TIMEOUT = 20


def fail(msg: str) -> None:
    print(f"\n✗ [delivery] {msg}")
    sys.exit(1)


def ok(msg: str) -> None:
    print(f"✓ [delivery] {msg}")


def info(msg: str) -> None:
    print(f"[delivery] {msg}")


def run(cmd: List[str], cwd: Optional[Path] = None, timeout: Optional[int] = None) -> subprocess.CompletedProcess:
    return subprocess.run(cmd, cwd=str(cwd) if cwd else None, capture_output=True, text=True, timeout=timeout)


def ensure_tools() -> None:
    if not DOMAIN_FILE.exists():
        fail(f"domain.pddl not found: {DOMAIN_FILE}")
    if not GEN_UNIQUE.exists():
        fail(f"gen_unique_delivery.py not found: {GEN_UNIQUE}")
    if not OPTIC_PATH.exists():
        fail(f"OPTIC not found at {OPTIC_PATH}")
    if not VALIDATE_PATH.exists():
        fail(f"Validate not found at {VALIDATE_PATH}")
    ok("Tools detected (domain, generator, OPTIC, Validate)")


def solve_problem(domain: Path, problem: Path, timeout: int) -> Optional[List[str]]:
    cmd = f"{OPTIC_PATH} -v0 -N {domain} {problem}"
    try:
        proc = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=timeout)
        if proc.returncode != 0:
            return None
        plan: List[str] = []
        for line in proc.stdout.splitlines():
            line = line.strip()
            if not line:
                continue
            # Parse lines like: 0.000: (ACTION ...) [dur]
            if ':' in line and '(' in line and ')' in line:
                left, right = line.split(':', 1)
                left = left.strip()
                if left.replace('.', '').replace('-', '').isdigit():
                    a = right.strip()
                    start = a.find('(')
                    end = a.find(')')
                    if start != -1 and end != -1 and end > start:
                        plan.append(a[start:end+1])
        return plan if plan else None
    except subprocess.TimeoutExpired:
        return None


def save_plan(problem: Path, actions: List[str]) -> Path:
    sol = problem.with_suffix('.soln')
    with open(sol, 'w') as f:
        for a in actions:
            f.write(f"{a}\n")
    return sol


def solve_all(problems_dir: Path, domain: Path, timeout: int) -> Tuple[int, int]:
    problems = sorted(problems_dir.glob("*.pddl"))
    ok(f"Solving {len(problems)} problems in {problems_dir.name} ...")
    success = 0
    failed = 0
    for i, p in enumerate(problems, 1):
        plan = solve_problem(domain, p, timeout)
        if plan:
            save_plan(p, plan)
            success += 1
        else:
            s = p.with_suffix('.soln')
            if s.exists():
                try:
                    s.unlink()
                except Exception:
                    pass
            failed += 1
        if i % 100 == 0 or i == len(problems):
            info(f"  Solve progress: {i}/{len(problems)} | success={success}")
    ok(f"Solving done: success={success}, failed={failed}")
    return success, failed


def validate_solution(domain: Path, problem: Path, soln: Path) -> bool:
    try:
        res = run([str(VALIDATE_PATH), str(domain), str(problem), str(soln)], timeout=VALIDATE_TIMEOUT)
        if res.returncode == 0:
            out = (res.stdout or "").lower()
            return ("plan valid" in out) or ("plan successfully executed" in out)
        return False
    except Exception:
        return False


def validate_all(problems_dir: Path, domain: Path) -> Tuple[int, int]:
    problems = sorted(problems_dir.glob("*.pddl"))
    ok(f"Validating solutions in {problems_dir.name} ...")
    valid = 0
    invalid = 0
    for i, p in enumerate(problems, 1):
        s = p.with_suffix('.soln')
        if not s.exists():
            invalid += 1
            continue
        if validate_solution(domain, p, s):
            valid += 1
        else:
            invalid += 1
        if i % 100 == 0 or i == len(problems):
            info(f"  Validate progress: {i}/{len(problems)} | valid={valid}")
    ok(f"Validation done: valid={valid}, invalid={invalid}")
    return valid, invalid


def generate_unique(out_dir: Path, count: int, size: int, packages: int, seed: int) -> int:
    out_dir.mkdir(parents=True, exist_ok=True)
    cmd = [
        sys.executable,
        str(GEN_UNIQUE),
        "--count", str(count),
        "--target-dir", str(out_dir),
        "--size", str(size),
        "--packages", str(packages),
        "--seed", str(seed),
        "--domain", str(DOMAIN_FILE),
    ]
    res = run(cmd, cwd=SCENARIO_DIR, timeout=600)
    if res.returncode != 0:
        fail(f"generation failed:\nSTDOUT:\n{res.stdout}\nSTDERR:\n{res.stderr}")
    # Count files generated
    return len(list(out_dir.glob("*.pddl")))


def generate_sets() -> None:
    # Clean output dirs
    for d in (TRAIN_DIR, TEST_DIR):
        if d.exists():
            for p in d.glob("*.pddl"):
                try:
                    p.unlink()
                except Exception:
                    pass
        d.mkdir(parents=True, exist_ok=True)

    # Strategy similar to trucks script: tiered setups from simple to harder
    # Training target: 1000
    train_specs: List[Tuple[int, int, int]] = [
        (2, 1, 400),  # many simple
        (2, 2, 250),
        (3, 1, 200),
        (3, 2, 150),
    ]
    # Testing target: 100
    test_specs: List[Tuple[int, int, int]] = [
        (2, 2, 40),
        (3, 1, 30),
        (3, 2, 30),
    ]

    # Generate train with base seed A
    seed_base_train = 10001
    generated_train = 0
    for size, pkgs, cnt in train_specs:
        before = len(list(TRAIN_DIR.glob("*.pddl")))
        generate_unique(TRAIN_DIR, cnt, size, pkgs, seed_base_train + size * 100 + pkgs)
        after = len(list(TRAIN_DIR.glob("*.pddl")))
        generated_train += max(0, after - before)
        info(f"  Train tier size={size} packages={pkgs} total={generated_train}")

    if generated_train < TARGET_TRAIN:
        fail(f"Only generated {generated_train}/{TARGET_TRAIN} training problems")
    ok(f"Generated {generated_train} training problems")

    # Generate test with base seed B disjoint from train
    seed_base_test = 200001
    generated_test = 0
    for size, pkgs, cnt in test_specs:
        before = len(list(TEST_DIR.glob("*.pddl")))
        generate_unique(TEST_DIR, cnt, size, pkgs, seed_base_test + size * 100 + pkgs)
        after = len(list(TEST_DIR.glob("*.pddl")))
        generated_test += max(0, after - before)
        info(f"  Test tier size={size} packages={pkgs} total={generated_test}")

    if generated_test < TARGET_TEST:
        fail(f"Only generated {generated_test}/{TARGET_TEST} testing problems")
    ok(f"Generated {generated_test} testing problems")


def main() -> None:
    print("=" * 80)
    print("Delivery Pipeline - Generate, Solve, Validate")
    print("=" * 80)

    ensure_tools()

    generate_sets()

    # Solve all
    solve_all(TRAIN_DIR, DOMAIN_FILE, SOLVE_TIMEOUT)
    solve_all(TEST_DIR, DOMAIN_FILE, SOLVE_TIMEOUT)

    # Validate all
    valid_train, _ = validate_all(TRAIN_DIR, DOMAIN_FILE)
    valid_test, _ = validate_all(TEST_DIR, DOMAIN_FILE)

    if valid_train < TARGET_TRAIN:
        fail(f"Valid training solutions insufficient: {valid_train}/{TARGET_TRAIN}")
    if valid_test < TARGET_TEST:
        fail(f"Valid testing solutions insufficient: {valid_test}/{TARGET_TEST}")

    ok("All targets met for Delivery: training=1000 valid, testing=100 valid")


if __name__ == "__main__":
    main()



