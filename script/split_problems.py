#!/usr/bin/env python3
import argparse
import fnmatch
import random
import shutil
from pathlib import Path
from typing import List


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Split problem files into training and testing folders by a specified test count."
        )
    )

    parser.add_argument(
        "--input-dir",
        required=True,
        type=Path,
        help="Directory containing problem files to split",
    )

    parser.add_argument(
        "--output-dir",
        type=Path,
        default=None,
        help=(
            "Directory where 'training' and 'testing' folders are created. "
            "Defaults to --input-dir."
        ),
    )

    parser.add_argument(
        "--num-testing",
        required=True,
        type=int,
        help="Number of files to place into testing",
    )

    parser.add_argument(
        "--pattern",
        default="*.pddl",
        help=(
            "Glob pattern to select files (default: '*.pddl'). "
            "For all PDDL problems, you can use '*.pddl'."
        ),
    )

    parser.add_argument(
        "--recursive",
        action="store_true",
        help="Search recursively under --input-dir",
    )

    parser.add_argument(
        "--move",
        action="store_true",
        help="Move files instead of copying",
    )

    parser.add_argument(
        "--seed",
        type=int,
        default=42,
        help="Random seed for shuffling (default: 42)",
    )

    parser.add_argument(
        "--force",
        action="store_true",
        help="If destination folders exist, clear and overwrite",
    )

    parser.add_argument(
        "--soln-ext",
        type=str,
        default=".soln",
        help="Solution file extension to co-split with problems (default: .soln)",
    )

    args = parser.parse_args()
    if args.output_dir is None:
        args.output_dir = args.input_dir
    return args


def collect_files(root: Path, pattern: str, recursive: bool) -> List[Path]:
    if not root.exists() or not root.is_dir():
        raise FileNotFoundError(f"Input directory not found or not a directory: {root}")

    matched_files: List[Path] = []
    if recursive:
        for path in root.rglob("*"):
            if path.is_file() and fnmatch.fnmatch(path.name, pattern):
                matched_files.append(path)
    else:
        for path in root.glob("*"):
            if path.is_file() and fnmatch.fnmatch(path.name, pattern):
                matched_files.append(path)
    return matched_files


def ensure_clean_dir(path: Path, force: bool) -> None:
    if path.exists():
        if not force:
            raise FileExistsError(
                f"Destination exists: {path}. Use --force to overwrite it."
            )
        if path.is_dir():
            shutil.rmtree(path)
        else:
            path.unlink()
    path.mkdir(parents=True, exist_ok=True)


def copy_or_move(src: Path, dst: Path, move: bool) -> None:
    dst.parent.mkdir(parents=True, exist_ok=True)
    if move:
        shutil.move(str(src), str(dst))
    else:
        shutil.copy2(src, dst)


def copy_or_move_with_solution(src_problem: Path, dst_problem: Path, move: bool, soln_ext: str) -> None:
    """Copy/move the problem file and, if present, its matching solution file.

    The solution file is expected to share the same stem as the problem filename,
    with extension given by soln_ext (e.g., .soln). If the solution file exists
    next to the problem, it will be co-copied/moved to the destination folder.
    """
    copy_or_move(src_problem, dst_problem, move)
    src_soln = src_problem.with_suffix(soln_ext)
    if src_soln.exists() and src_soln.is_file():
        dst_soln = dst_problem.with_suffix(soln_ext)
        copy_or_move(src_soln, dst_soln, move)


def main() -> None:
    args = parse_args()

    files = collect_files(args.input_dir, args.pattern, args.recursive)

    if not files:
        raise SystemExit(
            f"No files matched pattern '{args.pattern}' in {args.input_dir}"
        )

    unique_basenames = {p.name for p in files}
    if len(unique_basenames) != len(files) and args.recursive:
        print(
            "Warning: Duplicate basenames detected with --recursive. "
            "Files will be flattened into training/testing with basenames; "
            "later files may overwrite earlier ones. Consider disabling --recursive "
            "or pre-deduplicating filenames."
        )

    if args.num_testing < 0:
        raise ValueError("--num-testing must be >= 0")
    if args.num_testing > len(files):
        raise ValueError(
            f"Requested {args.num_testing} testing files but only {len(files)} available"
        )

    files_sorted = sorted(files, key=lambda p: p.as_posix())
    random.Random(args.seed).shuffle(files_sorted)

    testing_files = files_sorted[: args.num_testing]
    training_files = files_sorted[args.num_testing :]

    training_dir = args.output_dir / "training"
    testing_dir = args.output_dir / "testing"

    ensure_clean_dir(training_dir, args.force)
    ensure_clean_dir(testing_dir, args.force)

    operation = "Moving" if args.move else "Copying"
    print(
        f"{operation} {len(training_files)} training and {len(testing_files)} testing files..."
    )

    for src in training_files:
        dst = training_dir / src.name
        copy_or_move_with_solution(src, dst, args.move, args.soln_ext)

    for src in testing_files:
        dst = testing_dir / src.name
        copy_or_move_with_solution(src, dst, args.move, args.soln_ext)

    print("Done.")
    print(f"Training: {training_dir}")
    print(f"Testing:  {testing_dir}")


if __name__ == "__main__":
    main()


