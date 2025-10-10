#!/usr/bin/env python3
"""
Blocksworld end-to-end pipeline:
- Generate training_problems (1000) and testing_problems (100) with no duplicates between sets
- Solve all problems with OPTIC
- Validate solutions with VAL Validate
- Stop on errors and report

Usage:
  python3 run_blocksworld_pipeline.py

Requirements:
- Generator binary built by running `make` in this directory (produces ./blocksworld)
- OPTIC available at ~/optic/release/optic/optic-clp
- Validate available at ~/VAL/build/linux64/debug/bin/Validate
"""

import hashlib
import os
import subprocess
import sys
import time
from pathlib import Path
from typing import Iterable, List, Optional, Tuple

# Configuration
SCENARIO_DIR = Path(__file__).resolve().parent
DOMAIN_FILE = SCENARIO_DIR / "domain.pddl"
GENERATOR_BIN = SCENARIO_DIR / "blocksworld"
TRAIN_DIR = SCENARIO_DIR / "training_problems"
TEST_DIR = SCENARIO_DIR / "testing_problems"

OPTIC_PATH = Path.home() / "optic/release/optic/optic-clp"
VALIDATE_PATH = Path.home() / "VAL/build/linux64/debug/bin/Validate"

TARGET_TRAIN = 1000
TARGET_TEST = 100

# Timeouts (seconds)
SOLVE_TIMEOUT = 30
VALIDATE_TIMEOUT = 20


def fail(msg: str) -> None:
	print(f"\n✗ [blocksworld] {msg}")
	sys.exit(1)


def ok(msg: str) -> None:
	print(f"✓ [blocksworld] {msg}")


def info(msg: str) -> None:
	print(f"[blocksworld] {msg}")


def run(cmd: List[str], cwd: Optional[Path] = None, timeout: Optional[int] = None) -> subprocess.CompletedProcess:
	return subprocess.run(cmd, cwd=str(cwd) if cwd else None, capture_output=True, text=True, timeout=timeout)


def ensure_tools() -> None:
	if not DOMAIN_FILE.exists():
		fail(f"domain.pddl not found: {DOMAIN_FILE}")
	if not OPTIC_PATH.exists():
		fail(f"OPTIC not found at {OPTIC_PATH}")
	if not VALIDATE_PATH.exists():
		fail(f"Validate not found at {VALIDATE_PATH}")
	ok("Tools detected (domain, OPTIC, Validate)")


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


def hash_bytes(data: bytes) -> str:
	return hashlib.sha256(data).hexdigest()


def generate_instance(ops: int, num_blocks: int, seed: int) -> bytes:
	# The blocksworld binary signature: ./blocksworld <ops> <num_blocks> <seed>
	res = run([str(GENERATOR_BIN), str(ops), str(num_blocks), str(seed)], cwd=SCENARIO_DIR, timeout=10)
	if res.returncode != 0 or not res.stdout.strip():
		raise RuntimeError(f"gen failed ops={ops} blocks={num_blocks} seed={seed}: {res.stderr[:200]}")
	return res.stdout.encode()


def param_stream(ops_list: List[int], blocks_list: List[int], start_seed: int) -> Iterable[Tuple[int, int, int]]:
	seed = start_seed
	# Cycle over ops and blocks to diversify, keep seed increasing for uniqueness
	while True:
		for ops in ops_list:
			for nb in blocks_list:
				yield (ops, nb, seed)
				seed += 1


def write_numbered(out_dir: Path, index: int, content: bytes, width: int) -> None:
	filename = out_dir / f"{index:0{width}d}.pddl"
	filename.write_bytes(content)


def generate_set(out_dir: Path, target: int, disallow_hashes: set, ops_list: List[int], blocks_list: List[int], seed_start: int, file_width: int) -> Tuple[int, set]:
	out_dir.mkdir(parents=True, exist_ok=True)
	# Clear existing .pddl to avoid stale files
	for p in out_dir.glob("*.pddl"):
		try:
			p.unlink()
		except Exception:
			pass

	unique_hashes: set = set()
	count = 0
	attempts = 0
	stream = param_stream(ops_list, blocks_list, seed_start)
	max_attempts = target * 50  # generous limit
	info(f"Generating {target} problems into {out_dir.name} ...")
	while count < target and attempts < max_attempts:
		ops, nb, seed = next(stream)
		attempts += 1
		try:
			content = generate_instance(ops, nb, seed)
			h = hash_bytes(content)
			if h in unique_hashes or h in disallow_hashes:
				continue
			count += 1
			unique_hashes.add(h)
			write_numbered(out_dir, count, content, file_width)
			if count % 100 == 0 or count == target:
				info(f"  Progress: {count}/{target}")
		except Exception:
			continue

	if count < target:
		fail(f"Only generated {count}/{target} unique problems for {out_dir.name}")
	ok(f"Generated {count} unique problems in {out_dir.name}")
	return count, unique_hashes


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
	print("Blocksworld Pipeline - Generate, Solve, Validate")
	print("=" * 80)

	ensure_tools()
	compile_generator()

	# Strategy: keep problems modest to ensure solvability and throughput
	# Training: mix 3/4 ops, blocks in [3,4,5,6,7,8,9,10], seeds starting 1
	# Testing: disjoint seeds, slightly smaller blocks to improve solve rate
	train_ops = [3, 4]
	test_ops = [3, 4]
	train_blocks = [3, 4, 5, 6, 7, 8, 9, 10]
	test_blocks = [3, 4, 5, 6]

	# Generate training
	train_hashes_disallow: set = set()
	cnt_train, train_hashes = generate_set(
		out_dir=TRAIN_DIR,
		target=TARGET_TRAIN,
		disallow_hashes=train_hashes_disallow,
		ops_list=train_ops,
		blocks_list=train_blocks,
		seed_start=1,
		file_width=4,
	)
	# Generate testing with disjoint seed range and hash filter against training
	cnt_test, test_hashes = generate_set(
		out_dir=TEST_DIR,
		target=TARGET_TEST,
		disallow_hashes=train_hashes,
		ops_list=test_ops,
		blocks_list=test_blocks,
		seed_start=100_001,
		file_width=3,
	)
	ok("Training/Testing sets generated and are mutually unique")

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

	ok("All targets met for Blocksworld: training=1000 valid, testing=100 valid")


if __name__ == "__main__":
	main()


