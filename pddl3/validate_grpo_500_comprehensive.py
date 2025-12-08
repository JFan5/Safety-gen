#!/usr/bin/env python3
"""
检查每个场景的 grpo_500 数据集是否满足以下特征：
1. 每个问题都有solution，且solution有效
2. 能在all_problems下找到对应的pddl2_solution，且该solution无法求解grpo_500下的问题(validate验证)
3. grpo_500的solution，和testing_problem50不重复
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


def normalize_solution(solution_text: str) -> str:
    """Normalize solution text for comparison (remove whitespace, normalize line endings)."""
    lines = [line.strip() for line in solution_text.strip().splitlines() if line.strip()]
    return "\n".join(sorted(lines))


def compare_solutions(soln1_path: str, soln2_path: str) -> bool:
    """Compare two solution files to see if they are the same."""
    try:
        with open(soln1_path, 'r', encoding='utf-8') as f1:
            soln1 = normalize_solution(f1.read())
        with open(soln2_path, 'r', encoding='utf-8') as f2:
            soln2 = normalize_solution(f2.read())
        return soln1 == soln2
    except Exception:
        return False


def validate_grpo_500_dataset(scenario: str, grpo_dir: Path, domain3_file: Path, all_problems_dir: Path, testing_problem50_dir: Path, sft_500_dir: Path, timeout_sec: int = 30):
    """验证 grpo_500 数据集"""
    if not grpo_dir.exists():
        return None
    
    problems = sorted(grpo_dir.glob("*.pddl"))
    if not problems:
        return None
    
    total = len(problems)
    
    # 特征1: 每个问题都有solution，且solution有效
    missing_solution_count = 0
    invalid_solution_count = 0
    valid_solution_count = 0
    
    # 特征2: all_problems中的pddl2_solution无法求解grpo_500问题
    missing_pddl2_solution_count = 0
    pddl2_solution_valid_count = 0  # 不应该有效
    pddl2_solution_invalid_count = 0  # 应该无效
    
    # 特征3: grpo_500的solution和testing_problem50不重复
    overlap_with_testing_count = 0
    
    # 特征4: grpo_500的solution和sft_500不重复
    overlap_with_sft_500_count = 0
    
    results = []
    
    # 获取testing_problem50中的所有solution文件
    testing_solutions = {}
    if testing_problem50_dir.exists():
        for prob_file in testing_problem50_dir.glob("*.pddl"):
            prob_stem = prob_file.stem
            soln_file = testing_problem50_dir / f"{prob_stem}.soln"
            if soln_file.exists():
                testing_solutions[prob_stem] = soln_file
    
    # 获取sft_500中的所有solution文件
    sft_500_solutions = {}
    if sft_500_dir.exists():
        for prob_file in sft_500_dir.glob("*.pddl"):
            prob_stem = prob_file.stem
            soln_file = sft_500_dir / f"{prob_stem}.soln"
            if soln_file.exists():
                sft_500_solutions[prob_stem] = soln_file
    
    for i, problem_file in enumerate(problems, 1):
        problem_name = problem_file.name
        problem_stem = problem_file.stem
        
        result = {
            "problem_name": problem_name,
            "problem_stem": problem_stem
        }
        
        # 特征1: 检查grpo_500中的solution是否存在且有效
        grpo_solution_file = grpo_dir / f"{problem_stem}.soln"
        if not grpo_solution_file.exists():
            missing_solution_count += 1
            result["feature1"] = {
                "has_solution": False,
                "solution_valid": False,
                "error": "Solution file not found"
            }
        else:
            # 验证grpo_500的solution是否有效
            ok, msg, execution_info = validate_solution(
                str(domain3_file),
                str(problem_file),
                str(grpo_solution_file),
                timeout_sec=timeout_sec
            )
            
            # 额外检查 PDDL3 约束
            try:
                with open(problem_file, 'r', encoding='utf-8') as pf:
                    problem_text = pf.read()
                pddl3_ok, pddl3_msg = enforce_pddl3_constraints_if_present(problem_text, str(grpo_solution_file))
                if ok and not pddl3_ok:
                    ok = False
                    msg = pddl3_msg or "PDDL3 constraints violated"
            except Exception as _e:
                pass
            
            if ok:
                valid_solution_count += 1
                result["feature1"] = {
                    "has_solution": True,
                    "solution_valid": True,
                    "message": "Valid"
                }
            else:
                invalid_solution_count += 1
                result["feature1"] = {
                    "has_solution": True,
                    "solution_valid": False,
                    "error": msg[:200] if msg else "Validation failed"
                }
        
        # 特征2: 检查all_problems中的pddl2_solution是否能求解grpo_500问题
        old_solution_file = all_problems_dir / f"{problem_stem}.soln"
        if not old_solution_file.exists():
            missing_pddl2_solution_count += 1
            result["feature2"] = {
                "pddl2_solution_exists": False,
                "pddl2_solution_valid": None,
                "error": "PDDL2 solution not found in all_problems"
            }
        else:
            # 验证pddl2_solution是否能求解PDDL3问题
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
                pddl2_solution_valid_count += 1
                result["feature2"] = {
                    "pddl2_solution_exists": True,
                    "pddl2_solution_valid": True,
                    "error": "PDDL2 solution can solve PDDL3 problem (should be invalid)"
                }
            else:
                pddl2_solution_invalid_count += 1
                result["feature2"] = {
                    "pddl2_solution_exists": True,
                    "pddl2_solution_valid": False,
                    "message": "PDDL2 solution cannot solve PDDL3 problem (as expected)"
                }
        
        # 特征3: 检查grpo_500的solution是否和testing_problem50重复
        if grpo_solution_file.exists() and problem_stem in testing_solutions:
            testing_soln_file = testing_solutions[problem_stem]
            if compare_solutions(str(grpo_solution_file), str(testing_soln_file)):
                overlap_with_testing_count += 1
                result["feature3"] = {
                    "overlaps_with_testing": True,
                    "error": "Solution is identical to testing_problem50 solution"
                }
            else:
                result["feature3"] = {
                    "overlaps_with_testing": False,
                    "message": "Solution differs from testing_problem50"
                }
        else:
            if not grpo_solution_file.exists():
                result["feature3"] = {
                    "overlaps_with_testing": None,
                    "error": "grpo_500 solution not found"
                }
            elif problem_stem not in testing_solutions:
                result["feature3"] = {
                    "overlaps_with_testing": False,
                    "message": "No corresponding problem in testing_problem50"
                }
            else:
                result["feature3"] = {
                    "overlaps_with_testing": False,
                    "message": "No solution in testing_problem50"
                }
        
        # 特征4: 检查grpo_500的solution是否和sft_500重复
        if grpo_solution_file.exists() and problem_stem in sft_500_solutions:
            sft_500_soln_file = sft_500_solutions[problem_stem]
            if compare_solutions(str(grpo_solution_file), str(sft_500_soln_file)):
                overlap_with_sft_500_count += 1
                result["feature4"] = {
                    "overlaps_with_sft_500": True,
                    "error": "Solution is identical to sft_500 solution"
                }
            else:
                result["feature4"] = {
                    "overlaps_with_sft_500": False,
                    "message": "Solution differs from sft_500"
                }
        else:
            if not grpo_solution_file.exists():
                result["feature4"] = {
                    "overlaps_with_sft_500": None,
                    "error": "grpo_500 solution not found"
                }
            elif problem_stem not in sft_500_solutions:
                result["feature4"] = {
                    "overlaps_with_sft_500": False,
                    "message": "No corresponding problem in sft_500"
                }
            else:
                result["feature4"] = {
                    "overlaps_with_sft_500": False,
                    "message": "No solution in sft_500"
                }
        
        results.append(result)
        
        if i % 50 == 0:
            print(f"  处理进度: {i}/{total} ({i/total*100:.1f}%)")
    
    return {
        "total": total,
        "feature1": {
            "missing_solution": missing_solution_count,
            "invalid_solution": invalid_solution_count,
            "valid_solution": valid_solution_count,
            "all_valid": (missing_solution_count == 0 and invalid_solution_count == 0),
            "valid_rate": (valid_solution_count / total * 100) if total > 0 else 0.0
        },
        "feature2": {
            "missing_pddl2_solution": missing_pddl2_solution_count,
            "pddl2_solution_valid": pddl2_solution_valid_count,  # 不应该有效
            "pddl2_solution_invalid": pddl2_solution_invalid_count,  # 应该无效
            "all_invalid": (pddl2_solution_valid_count == 0),
            "invalid_rate": (pddl2_solution_invalid_count / (pddl2_solution_valid_count + pddl2_solution_invalid_count) * 100) if (pddl2_solution_valid_count + pddl2_solution_invalid_count) > 0 else 0.0
        },
        "feature3": {
            "overlap_with_testing": overlap_with_testing_count,
            "no_overlap": total - overlap_with_testing_count,
            "all_unique": (overlap_with_testing_count == 0),
            "overlap_rate": (overlap_with_testing_count / total * 100) if total > 0 else 0.0
        },
        "feature4": {
            "overlap_with_sft_500": overlap_with_sft_500_count,
            "no_overlap": total - overlap_with_sft_500_count,
            "all_unique": (overlap_with_sft_500_count == 0),
            "overlap_rate": (overlap_with_sft_500_count / total * 100) if total > 0 else 0.0
        },
        "results": results
    }


def main():
    base_dir = Path("/home/ubuntu/Safety-gen/pddl3")
    scenarios = ['blocksworld', 'spanner', 'grippers', 'ferry']
    
    all_results = {}
    
    print("=" * 80)
    print("验证 grpo_500 数据集")
    print("=" * 80)
    print()
    
    for scenario in scenarios:
        print(f"\n{'='*80}")
        print(f"处理场景: {scenario}")
        print(f"{'='*80}\n")
        
        scenario_dir = base_dir / scenario
        domain3_file = scenario_dir / "domain3.pddl"
        grpo_dir = scenario_dir / "grpo_500"
        all_problems_dir = scenario_dir / "all_problems"
        testing_problem50_dir = scenario_dir / "testing_problem50"
        sft_500_dir = scenario_dir / "sft_500"
        
        if not domain3_file.exists():
            print(f"  ⚠️  跳过: domain3.pddl 不存在")
            continue
        
        if not grpo_dir.exists():
            print(f"  ⚠️  跳过: grpo_500 目录不存在")
            continue
        
        print(f"  验证 grpo_500 数据集...")
        result = validate_grpo_500_dataset(
            scenario,
            grpo_dir,
            domain3_file,
            all_problems_dir,
            testing_problem50_dir,
            sft_500_dir
        )
        
        if result:
            all_results[scenario] = result
            
            print(f"\n  特征1: 每个问题都有solution，且solution有效")
            print(f"    总问题数: {result['total']}")
            print(f"    缺失solution: {result['feature1']['missing_solution']}")
            print(f"    无效solution: {result['feature1']['invalid_solution']}")
            print(f"    有效solution: {result['feature1']['valid_solution']} ({result['feature1']['valid_rate']:.2f}%)")
            print(f"    状态: {'✅ 通过' if result['feature1']['all_valid'] else '❌ 未通过'}")
            
            print(f"\n  特征2: all_problems中的pddl2_solution无法求解grpo_500问题")
            print(f"    缺失pddl2_solution: {result['feature2']['missing_pddl2_solution']}")
            print(f"    pddl2_solution有效(不应该): {result['feature2']['pddl2_solution_valid']}")
            print(f"    pddl2_solution无效(应该): {result['feature2']['pddl2_solution_invalid']} ({result['feature2']['invalid_rate']:.2f}%)")
            print(f"    状态: {'✅ 通过' if result['feature2']['all_invalid'] else '❌ 未通过'}")
            
            print(f"\n  特征3: grpo_500的solution和testing_problem50不重复")
            print(f"    与testing_problem50重复: {result['feature3']['overlap_with_testing']}")
            print(f"    不重复: {result['feature3']['no_overlap']}")
            print(f"    重复率: {result['feature3']['overlap_rate']:.2f}%")
            print(f"    状态: {'✅ 通过' if result['feature3']['all_unique'] else '❌ 未通过'}")
            
            print(f"\n  特征4: grpo_500的solution和sft_500不重复")
            print(f"    与sft_500重复: {result['feature4']['overlap_with_sft_500']}")
            print(f"    不重复: {result['feature4']['no_overlap']}")
            print(f"    重复率: {result['feature4']['overlap_rate']:.2f}%")
            print(f"    状态: {'✅ 通过' if result['feature4']['all_unique'] else '❌ 未通过'}")
        else:
            print(f"  ⚠️  无法验证: 数据集为空或不存在")
    
    # 保存详细结果到 JSON
    json_file = base_dir / "grpo_500_comprehensive_validation.json"
    with json_file.open('w', encoding='utf-8') as f:
        json.dump(all_results, f, indent=2, ensure_ascii=False)
    
    # 生成汇总报告
    print(f"\n{'='*80}")
    print("汇总报告")
    print(f"{'='*80}\n")
    
    print("| 场景 | 总问题数 | 特征1(有效solution) | 特征2(pddl2无效) | 特征3(与testing不重复) | 特征4(与sft_500不重复) | 全部通过 |")
    print("|------|----------|---------------------|-----------------|----------------------|---------------------|----------|")
    
    for scenario in scenarios:
        if scenario not in all_results:
            continue
        
        r = all_results[scenario]
        f1_pass = "✅" if r['feature1']['all_valid'] else "❌"
        f2_pass = "✅" if r['feature2']['all_invalid'] else "❌"
        f3_pass = "✅" if r['feature3']['all_unique'] else "❌"
        f4_pass = "✅" if r['feature4']['all_unique'] else "❌"
        all_pass = "✅" if (r['feature1']['all_valid'] and r['feature2']['all_invalid'] and r['feature3']['all_unique'] and r['feature4']['all_unique']) else "❌"
        
        print(f"| {scenario} | {r['total']} | {f1_pass} ({r['feature1']['valid_solution']}/{r['total']}) | "
              f"{f2_pass} ({r['feature2']['pddl2_solution_invalid']}/{r['feature2']['pddl2_solution_valid'] + r['feature2']['pddl2_solution_invalid']}) | "
              f"{f3_pass} ({r['feature3']['no_overlap']}/{r['total']}) | "
              f"{f4_pass} ({r['feature4']['no_overlap']}/{r['total']}) | {all_pass} |")
    
    print(f"\n详细结果已保存到: {json_file}")
    
    # 检查是否有问题
    print(f"\n{'='*80}")
    print("问题检查")
    print(f"{'='*80}\n")
    
    has_issues = False
    for scenario in scenarios:
        if scenario not in all_results:
            continue
        
        r = all_results[scenario]
        
        if not r['feature1']['all_valid']:
            print(f"⚠️  {scenario}: 特征1未通过 - {r['feature1']['missing_solution']}个缺失solution, {r['feature1']['invalid_solution']}个无效solution")
            has_issues = True
        
        if not r['feature2']['all_invalid']:
            print(f"⚠️  {scenario}: 特征2未通过 - {r['feature2']['pddl2_solution_valid']}个pddl2_solution可以求解PDDL3问题")
            has_issues = True
        
        if not r['feature3']['all_unique']:
            print(f"⚠️  {scenario}: 特征3未通过 - {r['feature3']['overlap_with_testing']}个solution与testing_problem50重复")
            has_issues = True
        
        if not r['feature4']['all_unique']:
            print(f"⚠️  {scenario}: 特征4未通过 - {r['feature4']['overlap_with_sft_500']}个solution与sft_500重复")
            has_issues = True
    
    if not has_issues:
        print("✅ 所有场景的 grpo_500 数据集都满足所有特征要求")
    
    return all_results


if __name__ == "__main__":
    main()

