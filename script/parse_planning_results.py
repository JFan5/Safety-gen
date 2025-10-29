#!/usr/bin/env python3
"""聚合 planning_results 下 baseline/pddl2/pddl3 方案验证结果的工具脚本。"""

import argparse
import json
from pathlib import Path
from typing import Dict, Iterable, Optional


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


VALID_VARIANTS: tuple[str, ...] = ("baseline", "pddl2", "pddl3")


def _load_json(path: Path) -> Optional[dict]:
    if not path.exists():
        return None
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def _find_json_file(variant_dir: Path, scenario: str, variant: str) -> Optional[Path]:
    """在 variant 目录下定位主要的 JSON 结果文件。"""
    preferred_names = [
        f"{scenario}_all_testing_{'baseline' if variant == 'baseline' else variant}.json",
        f"{scenario}_testing_results_{variant}.json",
        f"{scenario}_test_results_{variant}.json",
        f"{scenario}_testing_results.json",
        f"{scenario}_test_results.json",
        f"{scenario}_{variant}.json",
    ]

    for name in preferred_names:
        candidate = variant_dir / name
        if candidate.exists():
            return candidate

    json_files = sorted(variant_dir.glob("*.json"))
    if json_files:
        return json_files[0]
    return None


def _summarize_variant(
    model: str,
    scenario: str,
    variant: str,
    variant_dir: Path,
) -> Dict[str, object]:
    json_path = _find_json_file(variant_dir, scenario, variant)

    if json_path is None:
        return {"summary": {"total": 0}, "error": f"未找到JSON结果文件 (目录: {variant_dir})"}

    try:
        raw = _load_json(json_path)
    except json.JSONDecodeError as exc:
        return {"summary": {"total": 0}, "error": f"JSON解析失败: {exc}"}
    except Exception as exc:
        return {"summary": {"total": 0}, "error": str(exc)}

    if raw is None:
        return {"summary": {"total": 0}, "error": f"结果文件缺失: {json_path.name}"}

    items = raw.get("results") or []
    summarized = _summarize_results(items)
    metadata = raw.get("metadata") or {}
    metadata.update({
        "model": metadata.get("model_path") or model,
        "scenario": metadata.get("scenario_name") or scenario,
        "variant": variant,
        "results_directory": metadata.get("results_directory") or str(variant_dir),
        "source_file": json_path.name,
    })
    summarized["metadata"] = metadata
    return summarized


def aggregate_planning_results(
    planning_results_dir: str,
    models: Optional[Iterable[str]] = None,
    scenarios: Optional[Iterable[str]] = None,
    variants: Optional[Iterable[str]] = None,
) -> Dict[str, Dict[str, Dict[str, dict]]]:
    planning_root = Path(planning_results_dir)
    if not planning_root.exists():
        raise FileNotFoundError(f"planning_results目录不存在: {planning_root}")

    model_filter = set(models) if models else None
    scenario_filter = set(scenarios) if scenarios else None
    chosen_variants = list(variants) if variants else list(VALID_VARIANTS)

    for variant in chosen_variants:
        if variant not in VALID_VARIANTS:
            raise ValueError(f"未知variant: {variant}")

    aggregated: Dict[str, Dict[str, Dict[str, dict]]] = {}

    for model_dir in sorted(planning_root.iterdir()):
        if not model_dir.is_dir():
            continue
        model_name = model_dir.name
        if model_filter and model_name not in model_filter:
            continue

        model_result: Dict[str, Dict[str, dict]] = {}

        for scenario_dir in sorted(model_dir.iterdir()):
            if not scenario_dir.is_dir():
                continue
            scenario_name = scenario_dir.name
            if scenario_filter and scenario_name not in scenario_filter:
                continue

            scenario_result: Dict[str, dict] = {}
            for variant in chosen_variants:
                variant_dir = scenario_dir / variant
                if not variant_dir.exists():
                    continue
                scenario_result[variant] = _summarize_variant(
                    model=model_name,
                    scenario=scenario_name,
                    variant=variant,
                    variant_dir=variant_dir,
                )

            if scenario_result:
                model_result[scenario_name] = scenario_result

        if model_result:
            aggregated[model_name] = model_result

    if not aggregated:
        raise ValueError("未在指定条件下找到任何规划结果。")

    return aggregated

def main():
    """主函数 - 仅支持聚合已有planning结果"""
    parser = argparse.ArgumentParser(description="聚合 planning_results/<model>/<scenario>/<variant> 结构下的JSON结果并分类统计")
    parser.add_argument("--planning-results-dir", default="planning_results",
                       help="planning结果所在目录，默认 planning_results")
    parser.add_argument("--aggregate-output", default=None,
                       help="聚合输出JSON文件路径（默认 ./planning_results_aggregated.json）")
    parser.add_argument("--scenarios", nargs="+", default=None,
                       help="指定一个或多个场景名称，默认解析全部场景")
    parser.add_argument("--models", nargs="+", default=None,
                       help="指定一个或多个模型名称，默认解析全部模型")
    parser.add_argument("--variants", nargs="+", choices=list(VALID_VARIANTS), default=None,
                       help="指定需要聚合的结果类型（默认 baseline/pddl2/pddl3 全部处理）")
    parser.add_argument("--categories", nargs="+", choices=list(VALID_VARIANTS), dest="variants", help=argparse.SUPPRESS)
    
    args = parser.parse_args()
    
    # 执行聚合
    data = aggregate_planning_results(
        planning_results_dir=args.planning_results_dir,
        models=args.models,
        scenarios=args.scenarios,
        variants=args.variants,
    )
    out_path = args.aggregate_output or "planning_results_aggregated.json"
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f"聚合结果已保存: {out_path}")

if __name__ == "__main__":
    main()
