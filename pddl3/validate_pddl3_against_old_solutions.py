#!/usr/bin/env python3
"""
以 all_problems3/training 中的问题为核心，验证 all_problems/training 中的 solution 是否能求解这些 PDDL3 问题。

对于每个 all_problems3/training 中的问题：
1. 检查 all_problems/training 中是否有对应的 .soln 文件
2. 如果有，验证这个旧解是否能求解 PDDL3 问题
3. 如果没有，记录为缺失
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


def validate_scenario(scenario: str, base_dir: Path, timeout_sec: int = 30):
    """验证单个场景"""
    print(f"\n{'='*80}")
    print(f"验证场景: {scenario}")
    print(f"{'='*80}")
    
    # 路径设置
    domain3_file = base_dir / scenario / "domain3.pddl"
    pddl3_training_dir = base_dir / scenario / "all_problems3" / "training"
    old_training_dir = base_dir / scenario / "all_problems" / "training"
    
    if not domain3_file.exists():
        print(f"  错误: 找不到 domain3.pddl: {domain3_file}")
        return None
    
    if not pddl3_training_dir.exists():
        print(f"  错误: 找不到 all_problems3/training: {pddl3_training_dir}")
        return None
    
    if not old_training_dir.exists():
        print(f"  错误: 找不到 all_problems/training: {old_training_dir}")
        return None
    
    # 获取所有 PDDL3 问题
    pddl3_problems = sorted(pddl3_training_dir.glob("*.pddl"))
    total_problems = len(pddl3_problems)
    
    print(f"  Domain3: {domain3_file}")
    print(f"  PDDL3 问题目录: {pddl3_training_dir}")
    print(f"  旧解目录: {old_training_dir}")
    print(f"  找到 {total_problems} 个 PDDL3 问题")
    print()
    
    # 统计
    valid_count = 0  # 能被旧解求解
    invalid_count = 0  # 不能被旧解求解
    missing_solution_count = 0  # 旧解文件不存在
    missing_problem_count = 0  # PDDL3 问题在 all_problems 中不存在
    
    results = []
    
    for i, pddl3_problem_file in enumerate(pddl3_problems, 1):
        problem_name = pddl3_problem_file.name
        problem_stem = pddl3_problem_file.stem
        
        # 检查旧解文件是否存在
        old_solution_file = old_training_dir / f"{problem_stem}.soln"
        old_problem_file = old_training_dir / f"{problem_name}"
        
        result_entry = {
            "problem_name": problem_name,
            "problem_path": str(pddl3_problem_file),
            "old_solution_path": str(old_solution_file) if old_solution_file.exists() else None,
            "old_problem_path": str(old_problem_file) if old_problem_file.exists() else None,
        }
        
        if not old_solution_file.exists():
            # 检查是否是因为问题文件也不存在
            if not old_problem_file.exists():
                missing_problem_count += 1
                result_entry["status"] = "missing_problem_in_old"
                result_entry["message"] = f"问题在 all_problems/training 中不存在"
                results.append(result_entry)
                if i % 100 == 0:
                    print(f"  [{i}/{total_problems}] {problem_name}: 问题在 all_problems 中不存在")
            else:
                missing_solution_count += 1
                result_entry["status"] = "missing_solution"
                result_entry["message"] = f"旧解文件不存在"
                results.append(result_entry)
                if i % 100 == 0:
                    print(f"  [{i}/{total_problems}] {problem_name}: 旧解文件不存在")
            continue
        
        # 验证旧解是否能求解 PDDL3 问题
        ok, msg, execution_info = validate_solution(
            str(domain3_file),
            str(pddl3_problem_file),
            str(old_solution_file),
            timeout_sec=timeout_sec
        )
        
        # 额外检查 PDDL3 约束
        try:
            with open(pddl3_problem_file, 'r', encoding='utf-8') as pf:
                problem_text = pf.read()
            pddl3_ok, pddl3_msg = enforce_pddl3_constraints_if_present(problem_text, str(old_solution_file))
            if ok and not pddl3_ok:
                ok = False
                msg = pddl3_msg or "PDDL3 constraints violated"
        except Exception as _e:
            pass
        
        result_entry["valid"] = ok
        result_entry["message"] = msg
        result_entry["execution_info"] = execution_info
        
        if ok:
            valid_count += 1
            result_entry["status"] = "valid"
            if i % 100 == 0:
                print(f"  [{i}/{total_problems}] {problem_name}: ✓ 能被旧解求解")
        else:
            invalid_count += 1
            result_entry["status"] = "invalid"
            if i % 100 == 0:
                print(f"  [{i}/{total_problems}] {problem_name}: ✗ 不能被旧解求解")
        
        results.append(result_entry)
    
    # 汇总
    print()
    print(f"{'='*80}")
    print(f"验证结果汇总 ({scenario})")
    print(f"{'='*80}")
    print(f"总问题数 (all_problems3/training): {total_problems}")
    print(f"能被旧解求解: {valid_count}")
    print(f"不能被旧解求解: {invalid_count}")
    print(f"旧解文件不存在: {missing_solution_count}")
    print(f"问题在 all_problems 中不存在: {missing_problem_count}")
    if total_problems > 0:
        valid_rate = (valid_count / total_problems) * 100
        print(f"能被旧解求解的比例: {valid_rate:.2f}%")
    
    # 保存结果
    output_file = base_dir / f"{scenario}_pddl3_vs_old_solutions.json"
    validation_results = {
        "metadata": {
            "timestamp": datetime.now().isoformat(),
            "scenario": scenario,
            "domain3_file": str(domain3_file),
            "pddl3_training_dir": str(pddl3_training_dir),
            "old_training_dir": str(old_training_dir),
            "total_problems": total_problems,
            "timeout_seconds": timeout_sec
        },
        "summary": {
            "total_problems": total_problems,
            "valid": valid_count,
            "invalid": invalid_count,
            "missing_solution": missing_solution_count,
            "missing_problem_in_old": missing_problem_count,
            "valid_rate": (valid_count / total_problems * 100) if total_problems > 0 else 0.0
        },
        "results": results
    }
    
    with output_file.open('w', encoding='utf-8') as f:
        json.dump(validation_results, f, indent=2, ensure_ascii=False)
    
    print(f"\n结果已保存到: {output_file}")
    
    return validation_results


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3")
    scenarios = ['blocksworld', 'ferry', 'spanner', 'grippers']
    
    all_results = {}
    
    for scenario in scenarios:
        result = validate_scenario(scenario, base_dir, timeout_sec=30)
        if result:
            all_results[scenario] = result
    
    # 生成汇总报告
    print(f"\n{'='*80}")
    print("所有场景汇总")
    print(f"{'='*80}")
    print()
    print("| 场景 | 总问题数 | 能被旧解求解 | 不能被旧解求解 | 旧解不存在 | 问题在旧集中不存在 | 能被旧解求解比例 |")
    print("|------|----------|--------------|----------------|------------|-------------------|------------------|")
    
    for scenario in scenarios:
        if scenario not in all_results:
            continue
        summary = all_results[scenario]["summary"]
        print(f"| {scenario} | {summary['total_problems']} | {summary['valid']} | "
              f"{summary['invalid']} | {summary['missing_solution']} | "
              f"{summary['missing_problem_in_old']} | {summary['valid_rate']:.2f}% |")
    
    print()
    print("=" * 80)
    print("缺失问题报告")
    print("=" * 80)
    print()
    
    for scenario in scenarios:
        if scenario not in all_results:
            continue
        results = all_results[scenario]["results"]
        missing_problems = [r for r in results if r.get("status") == "missing_problem_in_old"]
        if missing_problems:
            print(f"\n{scenario}: {len(missing_problems)} 个问题在 all_problems/training 中不存在")
            print("  前10个缺失的问题:")
            for r in missing_problems[:10]:
                print(f"    - {r['problem_name']}")
            if len(missing_problems) > 10:
                print(f"    ... 还有 {len(missing_problems) - 10} 个")
        else:
            print(f"\n{scenario}: ✅ 所有问题都在 all_problems/training 中存在")


if __name__ == "__main__":
    main()

