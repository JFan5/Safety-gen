#!/usr/bin/env python3
"""
检查每个场景的 sft_500 和 sft_500_new 中，能被 all_problems 中对应 solution 求解的比例。
"""

import subprocess
import json
import re
from pathlib import Path
from datetime import datetime
from typing import Tuple, Dict, List, Optional


def validate_solution(domain_file: str, problem_file: str, solution_file: str, timeout_sec: int = 30) -> Tuple[bool, str, Dict]:
    """Run Validate to check if solution is valid for the problem and domain."""
    execution_info = {
        "stdout": "",
        "stderr": "",
        "returncode": None,
        "timeout": False,
        "exception": None
    }
    
    try:
        cmd = f"Validate -v {domain_file} {problem_file} {solution_file}"
        execution_info["command"] = cmd
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=timeout_sec)
        
        execution_info["returncode"] = result.returncode
        execution_info["stdout"] = result.stdout if result.stdout else ""
        execution_info["stderr"] = result.stderr if result.stderr else ""
        
        if result.returncode == 0:
            output = result.stdout.lower()
            if "plan valid" in output or "plan successfully executed" in output:
                return True, "Plan valid", execution_info
            return False, (result.stdout if result.stdout else "Validation failed"), execution_info
        return False, (result.stderr if result.stderr else "Validation error"), execution_info
    except subprocess.TimeoutExpired:
        execution_info["timeout"] = True
        return False, "Validation timeout", execution_info
    except Exception as e:
        execution_info["exception"] = str(e)
        return False, f"Validation exception: {e}", execution_info


# PDDL3 约束检查的正则表达式
SOMETIME_BEFORE_RE = re.compile(r"\(\s*sometime-before\s*\(\s*at\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*\(\s*at\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*\)", re.IGNORECASE)
ALWAYS_NOT_AT_RE = re.compile(r"\(\s*always\s*\(\s*not\s*\(\s*at\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*\)\s*\)\s*\)", re.IGNORECASE)
DEBARK_RE = re.compile(r"^\(\s*debark\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*$", re.IGNORECASE)
BOARD_RE = re.compile(r"^\(\s*board\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*$", re.IGNORECASE)
SAIL_RE = re.compile(r"^\(\s*sail\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)\s*$", re.IGNORECASE)
INIT_AT_RE = re.compile(r"\(\s*at\s+([^\s\(\)]+)\s+([^\s\(\)]+)\s*\)", re.IGNORECASE)


def _extract_sometime_before(problem_text: str) -> List[Tuple[Tuple[str, str], Tuple[str, str]]]:
    constraints: List[Tuple[Tuple[str, str], Tuple[str, str]]] = []
    for m in SOMETIME_BEFORE_RE.finditer(problem_text):
        a_car, a_loc, b_car, b_loc = m.group(1), m.group(2), m.group(3), m.group(4)
        constraints.append(((a_car, a_loc), (b_car, b_loc)))
    return constraints


def _extract_always_not_at(problem_text: str) -> List[Tuple[str, str]]:
    forbids: List[Tuple[str, str]] = []
    for m in ALWAYS_NOT_AT_RE.finditer(problem_text):
        car, loc = m.group(1), m.group(2)
        forbids.append((car, loc))
    return forbids


def _extract_init_at(problem_text: str) -> Dict[str, Optional[str]]:
    """Extract initial at(car, loc) facts from the (:init ...) block."""
    lines = problem_text.splitlines()
    collecting = False
    depth = 0
    init_lines: List[str] = []
    for line in lines:
        if not collecting and "(:init" in line:
            collecting = True
            depth = 0
        if collecting:
            init_lines.append(line)
            depth += line.count("(") - line.count(")")
            if depth <= 0:
                break
    car_to_location: Dict[str, Optional[str]] = {}
    for l in init_lines:
        for m in INIT_AT_RE.finditer(l):
            car, loc = m.group(1), m.group(2)
            car_to_location[car] = loc
    return car_to_location


def _simulate_at_holds(problem_text: str, soln_path: str) -> Tuple[Dict[Tuple[str, str], int], Dict[Tuple[str, str], int]]:
    """Simulate plan to compute when at(car, loc) holds across state indices."""
    car_to_location = _extract_init_at(problem_text)
    cars_seen: set = set(car_to_location.keys())

    earliest: Dict[Tuple[str, str], int] = {}
    latest: Dict[Tuple[str, str], int] = {}

    def record_state(state_index: int):
        for car, loc in car_to_location.items():
            if loc is None:
                continue
            key = (car, loc)
            if key not in earliest:
                earliest[key] = state_index
            latest[key] = state_index

    current_index = 0
    record_state(current_index)

    try:
        with open(soln_path, "r", encoding="utf-8") as f:
            for raw_line in f:
                line = raw_line.strip()
                if not line:
                    continue
                m = BOARD_RE.match(line)
                if m:
                    car, _loc = m.group(1), m.group(2)
                    cars_seen.add(car)
                    if car in car_to_location:
                        car_to_location[car] = None
                    else:
                        car_to_location[car] = None
                    current_index += 1
                    record_state(current_index)
                    continue
                m = DEBARK_RE.match(line)
                if m:
                    car, loc = m.group(1), m.group(2)
                    cars_seen.add(car)
                    car_to_location[car] = loc
                    current_index += 1
                    record_state(current_index)
                    continue
                if SAIL_RE.match(line):
                    current_index += 1
                    record_state(current_index)
                    continue
                current_index += 1
                record_state(current_index)
    except FileNotFoundError:
        pass

    return earliest, latest


def _violates_sometime_before_intervals(earliest: Dict[Tuple[str, str], int], latest: Dict[Tuple[str, str], int], constraints: List[Tuple[Tuple[str, str], Tuple[str, str]]]) -> bool:
    """Check sometime-before using non-strict interval semantics."""
    for (a, b) in constraints:
        a_key = (a[0], a[1])
        b_key = (b[0], b[1])
        if b_key not in earliest:
            continue
        if a_key not in earliest:
            return True
        if latest.get(b_key, -1) < earliest[a_key]:
            return True
    return False


def _violates_always_not_at_intervals(earliest: Dict[Tuple[str, str], int], forbids: List[Tuple[str, str]]) -> bool:
    """Check always-not using simulated holdings: forbidden at(car, loc) must never hold."""
    if not forbids:
        return False
    for pair in forbids:
        if pair in earliest:
            return True
    return False


def enforce_pddl3_constraints_if_present(problem_text: str, soln_path: str) -> Tuple[bool, Optional[str]]:
    """Enforce PDDL3 constraints if present in the problem."""
    if "(:constraints" not in problem_text:
        return True, None
    earliest, latest = _simulate_at_holds(problem_text, soln_path)
    sb = _extract_sometime_before(problem_text)
    forbids = _extract_always_not_at(problem_text)

    if _violates_sometime_before_intervals(earliest, latest, sb):
        return False, "Violates PDDL3 sometime-before constraint"
    if _violates_always_not_at_intervals(earliest, forbids):
        return False, "Violates PDDL3 always-not positional constraint"
    return True, None


def validate_dataset(scenario: str, dataset_dir: Path, domain3_file: Path, all_problems_dir: Path, timeout_sec: int = 30):
    """验证单个数据集"""
    if not dataset_dir.exists():
        return None
    
    problems = sorted(dataset_dir.glob("*.pddl"))
    if not problems:
        return None
    
    total = len(problems)
    valid_count = 0
    invalid_count = 0
    missing_solution_count = 0
    
    results = []
    
    for i, problem_file in enumerate(problems, 1):
        problem_name = problem_file.name
        problem_stem = problem_file.stem
        
        # 检查 all_problems 中是否有对应的解
        old_solution_file = all_problems_dir / f"{problem_stem}.soln"
        
        if not old_solution_file.exists():
            missing_solution_count += 1
            results.append({
                "problem_name": problem_name,
                "status": "missing_solution",
                "valid": False
            })
            continue
        
        # 验证旧解是否能求解 PDDL3 问题
        ok, msg, execution_info = validate_solution(
            str(domain3_file),
            str(problem_file),
            str(old_solution_file),
            timeout_sec=timeout_sec
        )
        
        # 额外检查 PDDL3 约束
        try:
            with open(problem_file, 'r', encoding='utf-8') as pf:
                problem_text = pf.read()
            pddl3_ok, pddl3_msg = enforce_pddl3_constraints_if_present(problem_text, str(old_solution_file))
            if ok and not pddl3_ok:
                ok = False
                msg = pddl3_msg or "PDDL3 constraints violated"
        except Exception as _e:
            pass
        
        if ok:
            valid_count += 1
            status = "valid"
        else:
            invalid_count += 1
            status = "invalid"
        
        results.append({
            "problem_name": problem_name,
            "status": status,
            "valid": ok,
            "message": msg
        })
    
    return {
        "total": total,
        "valid": valid_count,
        "invalid": invalid_count,
        "missing_solution": missing_solution_count,
        "valid_rate": (valid_count / total * 100) if total > 0 else 0.0,
        "results": results
    }


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3")
    scenarios = ['blocksworld', 'ferry', 'spanner', 'grippers']
    
    all_results = {}
    
    for scenario in scenarios:
        print(f"\n{'='*80}")
        print(f"验证场景: {scenario}")
        print(f"{'='*80}")
        
        domain3_file = base_dir / scenario / "domain3.pddl"
        all_problems_dir = base_dir / scenario / "all_problems"
        
        if not domain3_file.exists() or not all_problems_dir.exists():
            print(f"  跳过: 缺少必要文件")
            continue
        
        # 验证 sft_500
        sft_500_dir = base_dir / scenario / "sft_500"
        print(f"\n  验证 sft_500...")
        sft_500_result = validate_dataset(scenario, sft_500_dir, domain3_file, all_problems_dir)
        
        # 验证 sft_500_new
        sft_500_new_dir = base_dir / scenario / "sft_500_new"
        print(f"  验证 sft_500_new...")
        sft_500_new_result = validate_dataset(scenario, sft_500_new_dir, domain3_file, all_problems_dir)
        
        if sft_500_result:
            print(f"  sft_500: 总问题数={sft_500_result['total']}, "
                  f"能被求解={sft_500_result['valid']} ({sft_500_result['valid_rate']:.2f}%), "
                  f"不能求解={sft_500_result['invalid']}, "
                  f"解不存在={sft_500_result['missing_solution']}")
        
        if sft_500_new_result:
            print(f"  sft_500_new: 总问题数={sft_500_new_result['total']}, "
                  f"能被求解={sft_500_new_result['valid']} ({sft_500_new_result['valid_rate']:.2f}%), "
                  f"不能求解={sft_500_new_result['invalid']}, "
                  f"解不存在={sft_500_new_result['missing_solution']}")
        
        all_results[scenario] = {
            "sft_500": sft_500_result,
            "sft_500_new": sft_500_new_result
        }
    
    # 生成汇总报告
    print(f"\n{'='*80}")
    print("所有场景汇总")
    print(f"{'='*80}")
    print()
    print("| 场景 | 数据集 | 总问题数 | 能被求解 | 不能求解 | 解不存在 | 能被求解比例 |")
    print("|------|--------|----------|----------|----------|----------|--------------|")
    
    for scenario in scenarios:
        if scenario not in all_results:
            continue
        
        r = all_results[scenario]
        
        if r['sft_500']:
            sft_500 = r['sft_500']
            print(f"| {scenario} | sft_500 | {sft_500['total']} | {sft_500['valid']} | "
                  f"{sft_500['invalid']} | {sft_500['missing_solution']} | {sft_500['valid_rate']:.2f}% |")
        
        if r['sft_500_new']:
            sft_500_new = r['sft_500_new']
            print(f"| {scenario} | sft_500_new | {sft_500_new['total']} | {sft_500_new['valid']} | "
                  f"{sft_500_new['invalid']} | {sft_500_new['missing_solution']} | {sft_500_new['valid_rate']:.2f}% |")


if __name__ == "__main__":
    main()

