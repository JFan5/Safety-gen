#!/usr/bin/env python3
"""
Generate Blocksworld training_problems (default 1000) and testing_problems (default 100)
- Ensures problems are unique by content hash within each set and across sets
- Problem filenames encode generation parameters: bw_ops<ops>_n<blocks>_seed<seed>.pddl
- Will build the generator with `make` if needed

Usage:
  python3 generate_blocksworld_sets.py            # generate 1000/100
  python3 generate_blocksworld_sets.py --train 500 --test 50
  python3 generate_blocksworld_sets.py --clean   # remove previously generated .pddl files
"""

import argparse
import hashlib
import os
import subprocess
from pathlib import Path
from typing import Iterable, List, Optional, Tuple

SCENARIO_DIR = Path(__file__).resolve().parent
DOMAIN_FILE = SCENARIO_DIR / "domain.pddl"
GENERATOR_BIN = SCENARIO_DIR / "blocksworld"
TRAIN_DIR = SCENARIO_DIR / "training_problems"
TEST_DIR = SCENARIO_DIR / "testing_problems"

DEFAULT_TRAIN = 1000
DEFAULT_TEST = 100

# Generation parameter pools
TRAIN_OPS = [3, 4]
TRAIN_BLOCKS = [3, 4, 5, 6, 7, 8, 9, 10]
TEST_OPS = [3, 4]
TEST_BLOCKS = [3, 4, 5, 6]

# Seed ranges to reduce overlap, still protected by content-hash filters
TRAIN_SEED_START = 1
TEST_SEED_START = 100_001


def run(cmd: list, cwd: Optional[Path] = None, timeout: Optional[int] = None) -> subprocess.CompletedProcess:
	return subprocess.run(cmd, cwd=str(cwd) if cwd else None, capture_output=True, text=True, timeout=timeout)


def compile_generator() -> None:
	if GENERATOR_BIN.exists():
		return
	res = run(["make"], cwd=SCENARIO_DIR)
	if res.returncode != 0:
		raise RuntimeError(f"make failed:\nSTDOUT:\n{res.stdout}\nSTDERR:\n{res.stderr}")
	if not GENERATOR_BIN.exists():
		raise RuntimeError("generator missing after make")


def content_hash(data: bytes) -> str:
	return hashlib.sha256(data).hexdigest()


def filename_for(ops: int, blocks: int, seed: int) -> str:
	return f"bw_ops{ops}_n{blocks}_seed{seed}.pddl"


def generate_instance(ops: int, blocks: int, seed: int) -> bytes:
	res = run([str(GENERATOR_BIN), str(ops), str(blocks), str(seed)], cwd=SCENARIO_DIR, timeout=10)
	if res.returncode != 0 or not res.stdout:
		raise RuntimeError(f"gen failed ops={ops} n={blocks} seed={seed}: {res.stderr[:200]}")
	return res.stdout.encode()


def param_stream(ops_list: List[int], blocks_list: List[int], seed_start: int) -> Iterable[Tuple[int, int, int]]:
	seed = seed_start
	while True:
		for ops in ops_list:
			for n in blocks_list:
				yield (ops, n, seed)
				seed += 1


def ensure_dir(d: Path) -> None:
	d.mkdir(parents=True, exist_ok=True)


def clean_outputs() -> None:
	for d in [TRAIN_DIR, TEST_DIR]:
		if not d.exists():
			continue
		for p in d.glob("*.pddl"):
			try:
				p.unlink()
			except Exception:
				pass


def existing_hashes(d: Path) -> set:
	hashes = set()
	if not d.exists():
		return hashes
	for p in d.glob("*.pddl"):
		try:
			data = p.read_bytes()
			hashes.add(content_hash(data))
		except Exception:
			continue
	return hashes


def generate_set(out_dir: Path, target: int, disallow: set, ops_list: List[int], blocks_list: List[int], seed_start: int) -> Tuple[int, set]:
	ensure_dir(out_dir)
	# collect existing to support append mode
	existing = existing_hashes(out_dir)
	seen = set(existing)
	count = len(existing)
	attempts = 0
	max_attempts = max(target * 50, 5000)
	stream = param_stream(ops_list, blocks_list, seed_start)
	print(f"开始生成 {out_dir.name}，目标 {target} 个", flush=True)
	while count < target and attempts < max_attempts:
		ops, n, seed = next(stream)
		attempts += 1
		# periodic attempts log
		if attempts % 500 == 0:
			print(f"  尝试 {attempts} 次，已生成 {count}/{target}", flush=True)
		# skip if file with exact name already exists to avoid clashes
		path = out_dir / filename_for(ops, n, seed)
		if path.exists():
			continue
		try:
			data = generate_instance(ops, n, seed)
			h = content_hash(data)
			if h in seen or h in disallow:
				continue
			# write
			path.write_bytes(data)
			print(f"生成了 {path.name}", flush=True)
			seen.add(h)
			count += 1
			if count % 100 == 0 or count == target:
				print(f"  {out_dir.name}: {count}/{target}", flush=True)
		except Exception:
			continue
	return count, seen


def main():
	parser = argparse.ArgumentParser(description="Generate unique Blocksworld training/testing sets with param-based filenames")
	parser.add_argument("--train", type=int, default=DEFAULT_TRAIN, help="number of training problems to ensure present (default 1000)")
	parser.add_argument("--test", type=int, default=DEFAULT_TEST, help="number of testing problems to ensure present (default 100)")
	parser.add_argument("--clean", action="store_true", help="remove existing generated .pddl before generating")
	args = parser.parse_args()

	compile_generator()
	if args.clean:
		clean_outputs()

	# Generate training set
	print("Generating training_problems ...", flush=True)
	train_count, train_seen = generate_set(
		TRAIN_DIR, args.train, set(), TRAIN_OPS, TRAIN_BLOCKS, TRAIN_SEED_START
	)
	if train_count < args.train:
		raise RuntimeError(f"Only generated {train_count}/{args.train} training problems")
	print("Training set done.", flush=True)

	# Generate testing set (unique w.r.t. training by hash)
	print("Generating testing_problems ...", flush=True)
	test_count, _ = generate_set(
		TEST_DIR, args.test, train_seen, TEST_OPS, TEST_BLOCKS, TEST_SEED_START
	)
	if test_count < args.test:
		raise RuntimeError(f"Only generated {test_count}/{args.test} testing problems")
	print("Testing set done.", flush=True)

	print("\nSummary:", flush=True)
	print(f"  training_problems: {train_count}", flush=True)
	print(f"  testing_problems:  {test_count}", flush=True)
	print("  filenames: bw_ops<ops>_n<blocks>_seed<seed>.pddl", flush=True)

if __name__ == "__main__":
	main()
