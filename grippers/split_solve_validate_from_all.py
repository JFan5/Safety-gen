#!/usr/bin/env python3
"""
Split 5000 generated grippers problems into train/test, then solve and validate.

- Input problems: grippers/all_problems/*.pddl
- Domain: grippers/domain3.pddl
- Output splits:
  - grippers/training_problems_all
  - grippers/testing_problems_all

Usage:
  python3 split_solve_validate_from_all.py
"""

import shutil
import subprocess
import sys
from pathlib import Path
from typing import List, Optional, Tuple

SCENARIO_DIR = Path(__file__).resolve().parent
ALL_DIR = SCENARIO_DIR / "all_problems"
DOMAIN_FILE = SCENARIO_DIR / "domain3.pddl"
TRAIN_DIR = SCENARIO_DIR / "training_problems_all"
TEST_DIR = SCENARIO_DIR / "testing_problems_all"

# Split sizes (adjustable)
TRAIN_SIZE = 4800
TEST_SIZE = 200

OPTIC_PATH = Path.home() / "optic/release/optic/optic-clp"
VALIDATE_PATH = Path.home() / "VAL/build/linux64/debug/bin/Validate"
SOLVE_TIMEOUT = 30
VALIDATE_TIMEOUT = 20


def fail(msg: str) -> None:
	print(f"\n✗ [split] {msg}")
	sys.exit(1)


def ok(msg: str) -> None:
	print(f"✓ [split] {msg}")


def info(msg: str) -> None:
	print(f"[split] {msg}")


def run(cmd: List[str], timeout: Optional[int] = None) -> subprocess.CompletedProcess:
	return subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)


def ensure_inputs() -> None:
	if not DOMAIN_FILE.exists():
		fail(f"Domain not found: {DOMAIN_FILE}")
	if not ALL_DIR.exists():
		fail(f"Source directory not found: {ALL_DIR}")
	all_files = sorted(ALL_DIR.glob("*.pddl"))
	if len(all_files) < TRAIN_SIZE + TEST_SIZE:
		fail(f"Not enough problems in {ALL_DIR}: have {len(all_files)}, need {TRAIN_SIZE + TEST_SIZE}")
	if not OPTIC_PATH.exists():
		fail(f"OPTIC not found: {OPTIC_PATH}")
	if not VALIDATE_PATH.exists():
		fail(f"Validate not found: {VALIDATE_PATH}")
	ok("Inputs detected (problems, domain, OPTIC, Validate)")


def reset_dir(p: Path) -> None:
	if p.exists():
		for f in p.glob("*"):
			try:
				if f.is_file():
					f.unlink()
				elif f.is_dir():
					shutil.rmtree(f)
			except Exception:
				pass
	else:
		p.mkdir(parents=True, exist_ok=True)


def split_train_test() -> Tuple[int, int]:
	problems = sorted(ALL_DIR.glob("*.pddl"))
	reset_dir(TRAIN_DIR)
	reset_dir(TEST_DIR)
	# Deterministic split by sorted order
	train_src = problems[:TRAIN_SIZE]
	test_src = problems[TRAIN_SIZE:TRAIN_SIZE + TEST_SIZE]
	for i, p in enumerate(train_src, 1):
		shutil.copy2(p, TRAIN_DIR / p.name)
		if i % 500 == 0 or i == len(train_src):
			info(f"  Train copy: {i}/{len(train_src)}")
	for i, p in enumerate(test_src, 1):
		shutil.copy2(p, TEST_DIR / p.name)
		if i % 100 == 0 or i == len(test_src):
			info(f"  Test copy: {i}/{len(test_src)}")
	ok(f"Split done: train={len(train_src)}, test={len(test_src)}")
	return len(train_src), len(test_src)


def parse_plan_lines(stdout: str) -> List[str]:
	plan: List[str] = []
	for line in stdout.splitlines():
		line = line.strip()
		if not line:
			continue
		if ':' in line and '(' in line and ')' in line:
			left, right = line.split(':', 1)
			left = left.strip()
			if left.replace('.', '').replace('-', '').isdigit():
				a = right.strip()
				start = a.find('(')
				end = a.find(')')
				if start != -1 and end != -1 and end > start:
					plan.append(a[start:end+1])
	return plan


def solve_problem(problem: Path) -> Optional[List[str]]:
	cmd = f"{OPTIC_PATH} -v0 -N {DOMAIN_FILE} {problem}"
	try:
		proc = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=SOLVE_TIMEOUT)
		if proc.returncode != 0:
			return None
		return parse_plan_lines(proc.stdout) or None
	except subprocess.TimeoutExpired:
		return None


def save_plan(problem: Path, actions: List[str]) -> None:
	s = problem.with_suffix('.soln')
	with open(s, 'w') as f:
		for a in actions:
			f.write(f"{a}\n")


def solve_all(problems_dir: Path) -> Tuple[int, int]:
	problems = sorted(problems_dir.glob("*.pddl"))
	ok(f"Solving {len(problems)} in {problems_dir.name} ...")
	success = 0
	failed = 0
	for i, p in enumerate(problems, 1):
		plan = solve_problem(p)
		if plan:
			save_plan(p, plan)
			success += 1
		else:
			failed += 1
		if i % 200 == 0 or i == len(problems):
			info(f"  progress {i}/{len(problems)} | success={success}")
	ok(f"Solved: success={success}, failed={failed}")
	return success, failed


def validate_solution(problem: Path) -> bool:
	soln = problem.with_suffix('.soln')
	if not soln.exists():
		return False
	res = run([str(VALIDATE_PATH), str(DOMAIN_FILE), str(problem), str(soln)], timeout=VALIDATE_TIMEOUT)
	if res.returncode != 0:
		return False
	out = (res.stdout or "").lower()
	return ("plan valid" in out) or ("plan successfully executed" in out)


def validate_all(problems_dir: Path) -> Tuple[int, int]:
	problems = sorted(problems_dir.glob("*.pddl"))
	ok(f"Validating {len(problems)} in {problems_dir.name} ...")
	valid = 0
	invalid = 0
	for i, p in enumerate(problems, 1):
		if validate_solution(p):
			valid += 1
		else:
			invalid += 1
		if i % 200 == 0 or i == len(problems):
			info(f"  progress {i}/{len(problems)} | valid={valid}")
	ok(f"Validated: valid={valid}, invalid={invalid}")
	return valid, invalid


def main() -> None:
	print("=" * 80)
	print("Split, Solve, Validate from all_problems")
	print("=" * 80)
	ensure_inputs()
	split_train_test()
	solve_all(TRAIN_DIR)
	solve_all(TEST_DIR)
	validate_all(TRAIN_DIR)
	validate_all(TEST_DIR)
	ok("Done: split, solve, validate")


if __name__ == "__main__":
	main()
