#!/usr/bin/env python3
"""聚合 planning_results 下 baseline/pddl2/pddl3 方案验证结果的工具脚本。"""

import argparse
import json
from pathlib import Path
from typing import Dict, Iterable, List, Optional


def _classify_result(item: dict) -> str:
    """根据 is_valid 和 validation_stdout 分类结果。"""
    # 首先检查 is_valid 字段
    is_valid = item.get("is_valid")
    if is_valid is None:
        is_valid = item.get("valid")

    if is_valid is None:
        status = item.get("status")
        is_valid = isinstance(status, str) and status.lower() == "valid"

    if bool(is_valid):
        return "success_plans"
    
    # 如果 is_valid 为 False，再根据 validation_stdout / execution_info stdout 分类失败原因
    stdout_text = item.get("validation_stdout", "")
    if not stdout_text:
        stdout_text = item.get("execution_info", {}).get("stdout", "")
    if not stdout_text:
        return "plan_format_error"  # 空的validation_stdout归类为plan_format_error
    
    text = stdout_text.lower()

    # 2) plan format error
    if "bad operator in plan" in text or "bad plan description!" in text or "no matching action defined" in text or "object with unknown type" in text:
        return "plan_format_error"

    # 5) goal not satisfied
    if "goal not satisfied" in text:
        return "goal_not_satisfied"

    # 3) precondition violation
    if "plan failed to execute" in text and "unsatisfied precondition" in text:
        return "precondition_violation"

    # 4) safety constraints violation (排除掉前置条件不满足)
    if "plan failed to execute" in text and "unsatisfied precondition" not in text:
        return "safety_constraints_violation"

    # 6) others
    return "others"


def _summarize_results(items):
    """对单个目录内的 results 进行分类汇总。"""
    categories = {
        "success_plans": [],
        "plan_format_error": [],
        "precondition_violation": [],
        "safety_constraints_violation": [],
        "goal_not_satisfied": [],
        "others": []
    }

    others_details = []  # 存储others分类的详细信息

    for it in items:
        name = it.get("problem_name") or it.get("solution_file") or "unknown"
        cat = _classify_result(it)
        categories[cat].append(name)
        
        # 如果是others分类，记录详细信息
        if cat == "others":
            others_details.append({
                "name": name,
                "is_valid": it.get("is_valid"),
                "validation_stdout_preview": it.get("validation_stdout", "")[:200] + "..." if len(it.get("validation_stdout", "")) > 200 else it.get("validation_stdout", "")
            })

    summary = {k: len(v) for k, v in categories.items()}
    summary["total"] = sum(summary.values())
    
    result = {
        "summary": summary,
        "problems_by_category": categories,
    }
    
    # 如果有others分类，添加详细信息
    if others_details:
        result["others_details"] = others_details
        print(f"⚠️  发现 {len(others_details)} 个 'others' 分类的结果:")
        for detail in others_details:
            print(f"  - {detail['name']}: is_valid={detail['is_valid']}")
            print(f"    validation_stdout: {detail['validation_stdout_preview']}")
            print()
    
    return result


def _iter_available_scenarios(planning_results_dir: Path) -> List[str]:
    """扫描 planning_results 目录，推断可用的场景名称。"""
    scenarios = set()
    for child in planning_results_dir.iterdir():
        if not child.is_dir():
            continue
        name = child.name
        if name.endswith("_baseline_all_testing"):
            scenarios.add(name[:-len("_baseline_all_testing")])
        elif name.endswith("_pddl2_all_testing"):
            scenarios.add(name[:-len("_pddl2_all_testing")])
        elif name.endswith("_pddl3_all_testing"):
            scenarios.add(name[:-len("_pddl3_all_testing")])
    return sorted(scenarios)


CATEGORY_SUFFIXES = {
    "baseline": "_baseline_all_testing",
    "pddl2": "_pddl2_all_testing",
    "pddl3": "_pddl3_all_testing",
}


def _load_json(path: Path) -> Optional[dict]:
    if not path.exists():
        return None
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def _summarize_category(
    scenario: str,
    category: str,
    planning_results_dir: Path,
) -> Dict[str, object]:
    dir_suffix = CATEGORY_SUFFIXES[category]
    scenario_dir = planning_results_dir / f"{scenario}{dir_suffix}"
    json_file = scenario_dir / f"{scenario}_all_testing_{category}.json"

    if not scenario_dir.exists():
        return {"summary": {"total": 0}, "error": f"目录不存在: {scenario_dir}"}

    if not json_file.exists():
        available = list(scenario_dir.glob("*.json"))
        extra = f" 可用: {available[0].name}" if available else ""
        return {"summary": {"total": 0}, "error": f"未找到结果文件: {json_file.name}{extra}"}

    try:
        raw = _load_json(json_file)
    except json.JSONDecodeError as exc:
        return {"summary": {"total": 0}, "error": f"JSON解析失败: {exc}"}
    except Exception as exc:  # 记录其他IO异常
        return {"summary": {"total": 0}, "error": str(exc)}

    if raw is None:
        return {"summary": {"total": 0}, "error": f"结果文件缺失: {json_file.name}"}

    items = raw.get("results") or []
    summarized = _summarize_results(items)
    metadata = raw.get("metadata")
    if metadata:
        summarized["metadata"] = metadata
    return summarized


def aggregate_planning_results(
    planning_results_dir: str,
    scenarios: Optional[Iterable[str]] = None,
    categories: Optional[Iterable[str]] = None,
) -> Dict[str, Dict[str, dict]]:
    planning_root = Path(planning_results_dir)
    if not planning_root.exists():
        raise FileNotFoundError(f"planning_results目录不存在: {planning_root}")

    chosen_categories = list(categories) if categories else list(CATEGORY_SUFFIXES.keys())
    for cat in chosen_categories:
        if cat not in CATEGORY_SUFFIXES:
            raise ValueError(f"未知category: {cat}")

    if scenarios is None:
        scenario_list = _iter_available_scenarios(planning_root)
    else:
        scenario_list = list(scenarios)

    if not scenario_list:
        raise ValueError("未找到任何场景，请确认 planning_results 目录或 --scenarios 参数。")

    aggregated: Dict[str, Dict[str, dict]] = {}
    for scenario in scenario_list:
        scenario_result: Dict[str, dict] = {}
        available_dirs = [
            planning_root / f"{scenario}{CATEGORY_SUFFIXES[cat]}"
            for cat in chosen_categories
            if (planning_root / f"{scenario}{CATEGORY_SUFFIXES[cat]}").exists()
        ]
        if not available_dirs:
            raise FileNotFoundError(f"场景 {scenario} 在 {planning_root} 下未找到匹配的baseline/pddl2/pddl3目录")

        for category in chosen_categories:
            scenario_result[category] = _summarize_category(
                scenario=scenario,
                category=category,
                planning_results_dir=planning_root,
            )
        aggregated[scenario] = scenario_result

    return aggregated

def main():
    """主函数 - 仅支持聚合已有planning结果"""
    parser = argparse.ArgumentParser(description="聚合 planning_results 下 baseline/pddl2/pddl3 的JSON结果并分类统计")
    parser.add_argument("--planning-results-dir", default="planning_results",
                       help="planning结果所在目录，默认 planning_results")
    parser.add_argument("--aggregate-output", default=None,
                       help="聚合输出JSON文件路径（默认 ./planning_results_aggregated.json）")
    parser.add_argument("--scenarios", nargs="+", default=None,
                       help="指定一个或多个场景名称（不含后缀），默认解析目录下全部场景")
    parser.add_argument("--categories", nargs="+", choices=list(CATEGORY_SUFFIXES.keys()), default=None,
                       help="指定需要聚合的类别，默认 baseline/pddl2/pddl3 全部处理")
    
    args = parser.parse_args()
    
    # 执行聚合
    data = aggregate_planning_results(
        planning_results_dir=args.planning_results_dir,
        scenarios=args.scenarios,
        categories=args.categories,
    )
    out_path = args.aggregate_output or "planning_results_aggregated.json"
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f"聚合结果已保存: {out_path}")

if __name__ == "__main__":
    main()
