#!/usr/bin/env python3
"""
Grippers end-to-end pipeline:
- Generate training_problems3 (1000) and testing_problems3 (100) with no duplicates between sets
- Solve all problems with OPTIC
- Validate solutions with VAL Validate
- Stop on errors and report

Usage:
  python3 run_grippers_pipeline.py

Requirements:
- Generator built by running `make` in this directory (produces ./grippers)
- gen_unique_grippers.py present in this directory
- OPTIC available at ~/optic/release/optic/optic-clp
- Validate available at ~/VAL/build/linux64/debug/bin/Validate
"""

import os
import shutil
import subprocess
import sys
from pathlib import Path
from typing import Iterable, List, Optional, Tuple

# Configuration
SCENARIO_DIR = Path(__file__).resolve().parent
DOMAIN_FILE = SCENARIO_DIR / "domain3.pddl"
GENERATOR_BIN = SCENARIO_DIR / "grippers"
UNIQUE_GEN_PY = SCENARIO_DIR / "gen_unique_grippers.py"
TRAIN_DIR = SCENARIO_DIR / "training_problems3"
TEST_DIR = SCENARIO_DIR / "testing_problems3"

OPTIC_PATH = Path.home() / "optic/release/optic/optic-clp"
VALIDATE_PATH = Path.home() / "VAL/build/linux64/debug/bin/Validate"

TARGET_TRAIN = 1000
TARGET_TEST = 100

# Timeouts (seconds)
SOLVE_TIMEOUT = 30
VALIDATE_TIMEOUT = 20


def fail(msg: str) -> None:
	print(f"\n✗ [grippers] {msg}")
	sys.exit(1)


def ok(msg: str) -> None:
	print(f"✓ [grippers] {msg}")


def info(msg: str) -> None:
	print(f"[grippers] {msg}")


def run(cmd: List[str], cwd: Optional[Path] = None, timeout: Optional[int] = None) -> subprocess.CompletedProcess:
	return subprocess.run(cmd, cwd=str(cwd) if cwd else None, capture_output=True, text=True, timeout=timeout)


def ensure_tools() -> None:
	if not DOMAIN_FILE.exists():
		fail(f"domain3.pddl not found: {DOMAIN_FILE}")
	if not UNIQUE_GEN_PY.exists():
		fail(f"gen_unique_grippers.py not found: {UNIQUE_GEN_PY}")
	if not OPTIC_PATH.exists():
		fail(f"OPTIC not found at {OPTIC_PATH}")
	if not VALIDATE_PATH.exists():
		fail(f"Validate not found at {VALIDATE_PATH}")
	ok("Tools detected (domain, generator, OPTIC, Validate)")


def compile_generator() -> None:
	if GENERATOR_BIN.exists():
		ok("Generator binary present")
		return
	info("Compiling generator via make ...")
	res = run(["make"], cwd=SCENARIO_DIR)
	if res.returncode != 0:
		fail(f"make failed:\nSTDOUT:\n{res.stdout}\nSTDERR:\n{res.stderr}")
	if not GENERATOR_BIN.exists():
		fail("Generator binary missing after make")
	ok("Generator compiled")


def call_unique_generator(out_dir: Path, count: int, robots: int, rooms: int, objects: int, seed: int, uniqueness: str) -> int:
	cmd = [
		sys.executable,
		str(UNIQUE_GEN_PY),
		"--count", str(count),
		"--target-dir", str(out_dir),
		"--robots", str(robots),
		"--rooms", str(rooms),
		"--objects", str(objects),
		"--seed", str(seed),
		"--uniqueness", uniqueness,
	]
	res = run(cmd, cwd=SCENARIO_DIR)
	if res.returncode != 0:
		raise RuntimeError(f"unique gen failed (n={robots} r={rooms} o={objects}): {res.stderr[:200]}")
	# Count files generated
	return len(list(out_dir.glob("*.pddl")))


def clean_dir(p: Path) -> None:
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


def generate_sets() -> None:
	# Start clean and regenerate unique sets with multiple batches
	TRAIN_DIR.mkdir(parents=True, exist_ok=True)
	TEST_DIR.mkdir(parents=True, exist_ok=True)
	clean_dir(TRAIN_DIR)
	clean_dir(TEST_DIR)

	# Training batches: prioritize small instances, mix uniqueness criteria
	info("Generating training set ...")
	generated_before = len(list(TRAIN_DIR.glob("*.pddl")))
	batches: List[Tuple[int,int,int,int,int,str]] = [
		# (count, robots, rooms, objects, seed, uniqueness)
		(200, 2, 3, 2, 10001, "isomorphic"),
		(300, 1, 3, 3, 10001, "isomorphic"),
		(400, 1, 4, 3, 10001, "isomorphic"),
		(400, 2, 3, 3, 10001, "isomorphic"),
		(400, 2, 4, 4, 10001, "text"),
		(400, 2, 4, 3, 10001, "text"),
	]
	for i, (count, n, r, o, seed, uniq) in enumerate(batches, 1):
		info(f"  [batch {i}] n={n} r={r} o={o} count={count} uniq={uniq}")
		try:
			call_unique_generator(TRAIN_DIR, count, n, r, o, seed, uniq)
		except Exception as e:
			fail(str(e))
		info(f"  Progress: {len(list(TRAIN_DIR.glob('*.pddl')))} so far")

	train_total = len(list(TRAIN_DIR.glob("*.pddl")))
	if train_total < TARGET_TRAIN:
		fail(f"Only generated {train_total}/{TARGET_TRAIN} training problems")
	ok(f"Generated training set: {train_total} problems")

	# Testing batches: smaller instances to ease solving; ensure disjoint filenames via fresh dir
	info("Generating testing set ...")
	test_batches: List[Tuple[int,int,int,int,int,str]] = [
		(100, 1, 3, 3, 20001, "isomorphic"),
		(50, 1, 3, 2, 20002, "isomorphic"),
	]
	for i, (count, n, r, o, seed, uniq) in enumerate(test_batches, 1):
		info(f"  [batch {i}] n={n} r={r} o={o} count={count} uniq={uniq}")
		try:
			call_unique_generator(TEST_DIR, count, n, r, o, seed, uniq)
		except Exception as e:
			fail(str(e))
		info(f"  Progress: {len(list(TEST_DIR.glob('*.pddl')))} so far")


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
			# cleanup any stale soln
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


def main() -> None:
	print("=" * 80)
	print("Grippers Pipeline - Generate, Solve, Validate")
	print("=" * 80)

	ensure_tools()
	compile_generator()

	# Generate sets
	generate_sets()

	# Solve all
	solve_train_ok, _ = solve_all(TRAIN_DIR, DOMAIN_FILE, SOLVE_TIMEOUT)
	solve_test_ok, _ = solve_all(TEST_DIR, DOMAIN_FILE, SOLVE_TIMEOUT)

	# Validate all
	valid_train, _ = validate_all(TRAIN_DIR, DOMAIN_FILE)
	valid_test, _ = validate_all(TEST_DIR, DOMAIN_FILE)

	# Enforce targets
	if valid_train < TARGET_TRAIN:
		fail(f"Valid training solutions insufficient: {valid_train}/{TARGET_TRAIN}")
	if valid_test < TARGET_TEST:
		fail(f"Valid testing solutions insufficient: {valid_test}/{TARGET_TEST}")

	ok("All targets met for Grippers: training=1000 valid, testing=100 valid")


if __name__ == "__main__":
	main()
