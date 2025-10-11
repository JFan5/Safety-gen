#!/usr/bin/env python3
"""Convert Rovers PDDL2 problems into PDDL3 problems with randomized safety constraints."""

from __future__ import annotations

import argparse
import hashlib
import random
import re
import shutil
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Sequence, Tuple


STATIC_PREDS: Dict[str, int] = {
    "visible": 2,
    "visible_from": 2,
    "can_traverse": 3,
    "equipped_for_soil_analysis": 1,
    "equipped_for_rock_analysis": 1,
    "equipped_for_imaging": 1,
    "at_lander": 2,
    "supports": 2,
    "calibration_target": 2,
    "on_board": 2,
    "store_of": 2,
}

SUPPORT_PREDS: Dict[str, int] = {
    "at_soil_sample": 1,
    "at_rock_sample": 1,
}


def _extract_block(text: str, key: str) -> Optional[str]:
    """Return the full (:key ...) block including parentheses."""
    pattern = rf"\(\s*:{re.escape(key)}\b"
    match = re.search(pattern, text, flags=re.IGNORECASE)
    if not match:
        return None
    start = match.start()
    depth = 0
    for idx in range(start, len(text)):
        char = text[idx]
        if char == "(":
            depth += 1
        elif char == ")":
            depth -= 1
            if depth == 0:
                return text[start : idx + 1]
    return None


def _atoms(block: Optional[str], pred: str, arity: int) -> List[Tuple[str, ...]]:
    """Collect predicate instances from a block using a simple regex."""
    if not block:
        return []
    pattern = r"\(\s*" + re.escape(pred) + "".join([r"\s+([^\s()]+)"] * arity) + r"\s*\)"
    return [tuple(match.groups()) for match in re.finditer(pattern, block, flags=re.IGNORECASE)]


def _parse_typed_objects(objects_block: Optional[str]) -> Dict[str, List[str]]:
    """Parse (:objects ...) into a mapping of lower-case type -> object list."""
    if not objects_block:
        return {}
    tokens = re.findall(r"[^\s()]+", objects_block)
    if tokens and tokens[0].lower() == ":objects":
        tokens = tokens[1:]
    result: Dict[str, List[str]] = {}
    buffer: List[str] = []
    i = 0
    while i < len(tokens):
        tok = tokens[i]
        if tok == "-":
            if i + 1 >= len(tokens):
                break
            typ = tokens[i + 1].lower()
            if buffer:
                result.setdefault(typ, []).extend(buffer)
            buffer = []
            i += 2
        else:
            buffer.append(tok)
            i += 1
    return result


def _format_atom(pred: str, args: Sequence[str]) -> str:
    """Return canonical atom string."""
    if args:
        return f"({pred} {' '.join(args)})"
    return f"({pred})"


def _derive_seed(base_seed: int, problem_path: Path) -> int:
    """Derive a deterministic per-problem seed."""
    h = hashlib.sha256()
    h.update(str(base_seed).encode("utf-8"))
    h.update(str(problem_path).encode("utf-8"))
    return int.from_bytes(h.digest()[:8], "big") & 0xFFFFFFFF


def _add_fact_constraints(candidates: set[str], pred: str, atoms: Iterable[Tuple[str, ...]]) -> None:
    for atom in atoms:
        candidates.add(f"(always {_format_atom(pred, atom)})")


def generate_rovers_constraints(
    problem_text: str,
    rng: random.Random,
    min_constraints: int = 2,
    max_constraints: int = 5,
) -> List[str]:
    """Generate randomized yet safe constraints for a single rovers problem."""
    objects_block = _extract_block(problem_text, "objects")
    init_block = _extract_block(problem_text, "init")
    if not init_block:
        raise ValueError("未找到 (:init ...) 块，无法生成约束")

    typed_objects = {k: v for k, v in _parse_typed_objects(objects_block).items()}
    rovers = typed_objects.get("rover", [])

    static_atoms: Dict[str, List[Tuple[str, ...]]] = {
        pred: _atoms(init_block, pred, arity) for pred, arity in STATIC_PREDS.items()
    }
    support_atoms: Dict[str, List[Tuple[str, ...]]] = {
        pred: _atoms(init_block, pred, arity) for pred, arity in SUPPORT_PREDS.items()
    }

    candidates: set[str] = set()

    # Direct invariants for static facts.
    for pred, atoms in static_atoms.items():
        _add_fact_constraints(candidates, pred, atoms)

    visible_pairs = static_atoms.get("visible", [])
    can_traverse_triples = static_atoms.get("can_traverse", [])
    store_pairs = static_atoms.get("store_of", [])
    on_board_pairs = static_atoms.get("on_board", [])
    supports_pairs = static_atoms.get("supports", [])
    calibration_pairs = static_atoms.get("calibration_target", [])
    visible_from_pairs = static_atoms.get("visible_from", [])

    # Rovers seeing what they should before acting.
    for rover in rovers:
        for wp1, wp2 in visible_pairs:
            candidates.add(
                f"(always (implies (at {rover} {wp1}) (visible {wp1} {wp2})))"
            )

    # Traversability invariants.
    for rover, wp_from, wp_to in can_traverse_triples:
        candidates.add(
            f"(always (implies (at {rover} {wp_from}) (can_traverse {rover} {wp_from} {wp_to})))"
        )

    # Store safety: whenever store status changes it still belongs to rover.
    for store, rover in store_pairs:
        candidates.add(
            f"(always (implies (full {store}) (store_of {store} {rover})))"
        )
        candidates.add(
            f"(always (implies (empty {store}) (store_of {store} {rover})))"
        )

    # Sampling safety: maintain equipped requirement.
    soil_waypoints = [wp for (wp,) in support_atoms.get("at_soil_sample", [])]
    rock_waypoints = [wp for (wp,) in support_atoms.get("at_rock_sample", [])]

    for rover, in static_atoms.get("equipped_for_soil_analysis", []):
        for wp in soil_waypoints:
            candidates.add(
                f"(always (implies (have_soil_analysis {rover} {wp}) (equipped_for_soil_analysis {rover})))"
            )

    for rover, in static_atoms.get("equipped_for_rock_analysis", []):
        for wp in rock_waypoints:
            candidates.add(
                f"(always (implies (have_rock_analysis {rover} {wp}) (equipped_for_rock_analysis {rover})))"
            )

    # Imaging safety.
    # Camera specific invariants.
    on_board_map: Dict[str, List[str]] = {}
    for camera, rover in on_board_pairs:
        on_board_map.setdefault(camera, []).append(rover)
        candidates.add(f"(always (on_board {camera} {rover}))")
        candidates.add(
            f"(always (implies (calibrated {camera} {rover}) (on_board {camera} {rover})))"
        )

    calibration_map: Dict[str, List[str]] = {}
    for camera, objective in calibration_pairs:
        calibration_map.setdefault(camera, []).append(objective)

    supports_map: Dict[str, List[str]] = {}
    for camera, mode in supports_pairs:
        supports_map.setdefault(camera, []).append(mode)

    visible_from_map: Dict[str, List[str]] = {}
    for objective, waypoint in visible_from_pairs:
        visible_from_map.setdefault(objective, []).append(waypoint)

    equipped_imaging = {rover for (rover,) in static_atoms.get("equipped_for_imaging", [])}

    for camera, rover in on_board_pairs:
        if rover in equipped_imaging:
            candidates.add(
                f"(always (implies (calibrated {camera} {rover}) (equipped_for_imaging {rover})))"
            )

    for camera, rover_list in on_board_map.items():
        for rover in rover_list:
            supported_modes = supports_map.get(camera, [])
            for objective in calibration_map.get(camera, []):
                for mode in supported_modes:
                    have_image_atom = f"(have_image {rover} {objective} {mode})"
                    candidates.add(
                        f"(always (implies {have_image_atom} (calibration_target {camera} {objective})))"
                    )
                    candidates.add(
                        f"(always (implies {have_image_atom} (supports {camera} {mode})))"
                    )
                    candidates.add(
                        f"(always (implies {have_image_atom} (on_board {camera} {rover})))"
                    )
                    for waypoint in visible_from_map.get(objective, []):
                        candidates.add(
                            f"(always (implies {have_image_atom} (visible_from {objective} {waypoint})))"
                        )

    candidate_list = sorted(candidates)
    if not candidate_list:
        raise ValueError("无法构造安全约束候选集")

    min_constraints = max(1, min(min_constraints, len(candidate_list)))
    max_constraints = max(min_constraints, min(max_constraints, len(candidate_list)))
    if len(candidate_list) <= min_constraints:
        return candidate_list[:min_constraints]
    count = rng.randint(min_constraints, max_constraints)
    if count >= len(candidate_list):
        return candidate_list
    return rng.sample(candidate_list, count)


def insert_constraints(problem_text: str, constraints: Sequence[str]) -> str:
    """Insert a (:constraints ...) block before the final right parenthesis."""
    if re.search(r"\(\s*:constraints\b", problem_text, flags=re.IGNORECASE):
        return problem_text
    if not constraints:
        return problem_text

    indent = "  "
    if len(constraints) == 1:
        inner = f"{indent}  {constraints[0]}"
    else:
        inner_lines = "\n".join(f"{indent}    {c}" for c in constraints)
        inner = f"{indent}  (and\n{inner_lines}\n{indent}  )"
    block = f"\n{indent}(:constraints\n{inner}\n{indent})\n"

    last_paren = problem_text.rfind(")")
    if last_paren == -1:
        raise ValueError("问题文件缺少结尾括号")
    return problem_text[:last_paren] + block + problem_text[last_paren:]


def convert_problem_to_pddl3(
    problem_path: Path,
    output_path: Path,
    base_seed: int,
    min_constraints: int,
    max_constraints: int,
) -> bool:
    """Convert a single problem file."""
    try:
        text = problem_path.read_text(encoding="utf-8")
        rng = random.Random(_derive_seed(base_seed, problem_path))
        constraints = generate_rovers_constraints(text, rng, min_constraints, max_constraints)
        converted = insert_constraints(text, constraints)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(converted, encoding="utf-8")
        return True
    except Exception as exc:  # noqa: BLE001
        print(f"转换失败 {problem_path}: {exc}")
        return False


def _copy_solution_files(input_dir: Path, output_dir: Path) -> None:
    for soln_path in input_dir.glob("*.soln"):
        target = output_dir / soln_path.name
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(soln_path, target)


def convert_directory(
    input_dir: Path,
    output_dir: Path,
    base_seed: int,
    min_constraints: int,
    max_constraints: int,
    pattern: str = "*.pddl",
    copy_solutions: bool = True,
    clean_output: bool = True,
) -> None:
    """Convert every *.pddl under input_dir into output_dir."""
    if not input_dir.exists():
        raise FileNotFoundError(f"输入目录不存在: {input_dir}")
    if clean_output and output_dir.exists():
        shutil.rmtree(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    files = sorted(Path(input_dir).glob(pattern))
    if not files:
        print(f"在 {input_dir} 下未找到匹配 {pattern} 的问题文件")
        return

    total = len(files)
    success = 0
    for idx, path in enumerate(files, 1):
        rel = path.name
        print(f"[{idx}/{total}] 转换 {rel} ... ", end="")
        ok = convert_problem_to_pddl3(
            path,
            output_dir / rel,
            base_seed,
            min_constraints,
            max_constraints,
        )
        if ok:
            success += 1
            print("✓")
        else:
            print("✗")
    print(f"完成：成功 {success}/{total}")
    if copy_solutions:
        _copy_solution_files(input_dir, output_dir)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="将 rovers 问题扩展为带随机安全约束的 PDDL3 版本。"
    )
    parser.add_argument("input", help="输入 problem 文件或目录")
    parser.add_argument(
        "output",
        nargs="?",
        help="输出文件或目录（省略则对文件追加 .pddl3，对目录追加 _pddl3）",
    )
    parser.add_argument("--seed", type=int, default=0, help="全局随机种子（默认0）")
    parser.add_argument("--min", type=int, default=2, dest="min_constraints", help="每个问题最少约束条数")
    parser.add_argument("--max", type=int, default=5, dest="max_constraints", help="每个问题最多约束条数")
    parser.add_argument("--pattern", default="*.pddl", help="目录转换时匹配的文件模式")
    parser.add_argument(
        "--no-copy-solutions",
        action="store_true",
        help="目录转换时不额外拷贝 .soln 文件",
    )
    parser.add_argument(
        "--no-clean",
        action="store_true",
        help="保留已存在的输出目录内容",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    input_path = Path(args.input)
    output_arg = Path(args.output) if args.output else None
    min_constraints = args.min_constraints
    max_constraints = max(args.max_constraints, min_constraints)

    if input_path.is_file():
        if output_arg:
            output_path = output_arg
        else:
            output_path = input_path.with_suffix(".pddl3")
        convert_problem_to_pddl3(
            input_path,
            output_path,
            args.seed,
            min_constraints,
            max_constraints,
        )
        print(f"已生成 {output_path}")
    else:
        if not input_path.exists():
            raise FileNotFoundError(f"输入路径不存在: {input_path}")
        if output_arg:
            output_dir = output_arg
        else:
            output_dir = input_path.parent / f"{input_path.name}_pddl3"
        convert_directory(
            input_path,
            output_dir,
            args.seed,
            min_constraints,
            max_constraints,
            pattern=args.pattern,
            copy_solutions=not args.no_copy_solutions,
            clean_output=not args.no_clean,
        )


if __name__ == "__main__":
    main()
