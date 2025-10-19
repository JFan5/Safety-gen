#!/usr/bin/env python3
"""
Generate unique Blocksworld training_problems (simple scenario)

- Focused on training set only
- Ensures uniqueness by content hash (skips duplicates)
- Uses the local generator binary: ./blocksworld <ops> <num_blocks> <seed>
- Defaults to the simplest setting: 3-ops, 3 blocks
- Allows specifying the number of problems to generate via --count

Examples:
  python3 generate_blocksworld_training_unique.py --count 200
  python3 generate_blocksworld_training_unique.py --count 50 --ops 3 --blocks 3 --seed-start 1
"""

import argparse
import hashlib
import subprocess
from pathlib import Path
from typing import Optional, Set


SCENARIO_DIR = Path(__file__).resolve().parent
GENERATOR_BIN = SCENARIO_DIR / "blocksworld"
TRAIN_DIR = SCENARIO_DIR / "training_problems"


def run(cmd: list, cwd: Optional[Path] = None, timeout: Optional[int] = None) -> subprocess.CompletedProcess:
	return subprocess.run(cmd, cwd=str(cwd) if cwd else None, capture_output=True, text=True, timeout=timeout)


def ensure_generator() -> None:
	if GENERATOR_BIN.exists():
		return
	res = run(["make"], cwd=SCENARIO_DIR)
	if res.returncode != 0 or not GENERATOR_BIN.exists():
		raise RuntimeError(
			f"Failed to build generator with make.\nSTDOUT:\n{res.stdout}\nSTDERR:\n{res.stderr}"
		)


def content_hash(data: bytes) -> str:
	return hashlib.sha256(data).hexdigest()


# (Exclusion of other directories removed per request)


def generate_instance(ops: int, blocks: int, seed: int) -> bytes:
	res = run([str(GENERATOR_BIN), str(ops), str(blocks), str(seed)], cwd=SCENARIO_DIR, timeout=10)
	if res.returncode != 0 or not (res.stdout or "").strip():
		raise RuntimeError(f"generator failed: ops={ops} blocks={blocks} seed={seed}: {res.stderr[:200]}")
	return res.stdout.encode()


def main() -> None:
	parser = argparse.ArgumentParser(description="Generate unique Blocksworld training_problems (simple scenario)")
	parser.add_argument("--count", type=int, default=100, help="number of training problems to generate (default: 100)")
	parser.add_argument("--ops", type=int, choices=[3, 4], default=3, help="operator variant (3 or 4), default: 3")
	parser.add_argument("--blocks", type=int, default=3, help="number of blocks (default: 3)")
	parser.add_argument("--seed-start", type=int, default=1, help="starting seed (default: 1)")
	parser.add_argument("--append", action="store_true", help="deprecated (no-op): directory is never cleared")
	parser.add_argument("--out-dir", type=str, default=str(TRAIN_DIR), help="output directory for generated problems (default: training_problems)")
	parser.add_argument("--seed-limit", type=int, default=0, help="if >0, map seeds into 1..seed-limit range")
	args = parser.parse_args()

	ensure_generator()

	# Resolve output directory (relative to scenario dir if not absolute)
	out_dir = Path(args.out_dir)
	if not out_dir.is_absolute():
		out_dir = (SCENARIO_DIR / out_dir).resolve()
	out_dir.mkdir(parents=True, exist_ok=True)

	# Exclusion against other directories removed; only ensure uniqueness within this run

	# Generate unique problems
	target = max(0, int(args.count))
	generated = 0
	seen: Set[str] = set()
	seed = int(args.seed_start)
	max_attempts = max(target * 50, 5000)
	attempts = 0

	while generated < target and attempts < max_attempts:
		attempts += 1
		cur_seed = seed
		# Optionally lower/unify seeds into a small range for generation and filenames
		if args.seed_limit and args.seed_limit > 0:
			eff_seed = ((cur_seed - 1) % args.seed_limit) + 1
		else:
			eff_seed = cur_seed
		try:
			content = generate_instance(args.ops, args.blocks, eff_seed)
			h = content_hash(content)
			if h in seen:
				seed += 1
				continue
			seen.add(h)
			generated += 1
			out_path = out_dir / f"bw_ops{args.ops}_n{args.blocks}_seed{eff_seed}.pddl"
			out_path.write_bytes(content)
			print(f"生成进度: {generated}/{target}", flush=True)
			seed += 1
		except Exception:
			seed += 1
			continue

	if generated < target:
		raise RuntimeError(f"Only generated {generated}/{target} unique training problems. Try increasing --seed-start or adjusting parameters.")

	print(f"Generated {generated} unique training problems in {out_dir}")


if __name__ == "__main__":
	main()






