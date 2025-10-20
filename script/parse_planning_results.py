#!/usr/bin/env python3
"""
Fine-tune前后模型对比评估脚本
支持多个scenario，专门针对mistral-7B模型
比较fine-tune前后的模型在testing_problems上的成功率
"""

import json
from pathlib import Path
from typing import Dict, Optional
import argparse


def _classify_validation_stdout(stdout_text: str) -> str:
    """根据 validation_stdout 文本分类结果。"""
    if not stdout_text:
        return "others"
    text = stdout_text.lower()

    # 1) success_plans
    if "plan valid" in text or "successful plans" in text:
        return "success_plans"

    # 2) plan format error
    if "bad operator in plan" in text:
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

    for it in items:
        name = it.get("problem_name") or it.get("solution_file") or "unknown"
        cat = _classify_validation_stdout(it.get("validation_stdout", ""))
        categories[cat].append(name)

    summary = {k: len(v) for k, v in categories.items()}
    summary["total"] = sum(summary.values())
    return {
        "summary": summary,
        "problems_by_category": categories,
    }


def _find_results_json(directory: Path) -> Optional[Path]:
    """在给定目录中寻找 *_test_results.json 文件。"""
    for p in directory.glob("*_test_results.json"):
        if p.is_file():
            print(f"Found results json: {p}")
            return p
    return None


def aggregate_existing_results(planning_results_dir: str, model_tag: str = "mistral") -> Dict[str, Dict[str, Dict[str, dict]]]:
    """扫描 planning_results 下的目录，读取并汇总分类：
    - 未finetune: {scenario}_mistral_planning_results
    - finetune:   {scenario}_mistral_sft_planning_results
    返回结构: {model_tag: {scenario: {unfinetuned: {...}, finetuned: {...}}}}
    """
    root = Path(planning_results_dir)
    if not root.exists():
        raise FileNotFoundError(f"planning_results目录不存在: {root}")

    result: Dict[str, Dict[str, Dict[str, dict]]] = {model_tag: {}}

    # 收集所有符合命名的目录
    for sub in root.iterdir():
        if not sub.is_dir():
            continue
        name = sub.name

        # 匹配未finetuned
        if name.endswith("_mistral_planning_results") and not name.endswith("_mistral_sft_planning_results"):
            scenario = name[:-len("_mistral_planning_results")]
            scenario_dict = result[model_tag].setdefault(scenario, {})
            json_path = _find_results_json(sub)
            if json_path and json_path.exists():
                try:
                    with open(json_path, "r", encoding="utf-8") as f:
                        data = json.load(f)
                    items = data.get("results") or []
                    scenario_dict["unfinetuned"] = _summarize_results(items)
                except Exception as e:
                    scenario_dict["unfinetuned"] = {"summary": {"total": 0}, "error": str(e)}

        # 匹配finetuned
        if name.endswith("_mistral_sft_planning_results"):
            print(f"Found finetuned results: {name}")
            scenario = name[:-len("_mistral_sft_planning_results")]
            scenario_dict = result[model_tag].setdefault(scenario, {})
            json_path = _find_results_json(sub)
            if json_path and json_path.exists():
                try:
                    with open(json_path, "r", encoding="utf-8") as f:
                        data = json.load(f)
                    items = data.get("results") or []
                    scenario_dict["finetuned"] = _summarize_results(items)
                except Exception as e:
                    scenario_dict["finetuned"] = {"summary": {"total": 0}, "error": str(e)}

    return result

def main():
    """主函数 - 仅支持聚合已有planning结果"""
    parser = argparse.ArgumentParser(description="聚合已有planning结果的JSON解析工具")
    parser.add_argument("--aggregate-existing", action="store_true", default=True,
                       help="聚合 planning_results 下的 *_test_results.json，分类统计并输出 JSON")
    parser.add_argument("--planning-results-dir", default="planning_results",
                       help="planning结果所在目录，默认 planning_results")
    parser.add_argument("--aggregate-output", default=None,
                       help="聚合输出JSON文件路径（默认 ./planning_results_aggregated_mistral.json）")
    
    args = parser.parse_args()
    
    # 执行聚合
    data = aggregate_existing_results(
        planning_results_dir=args.planning_results_dir,
        model_tag="mistral"
    )
    out_path = args.aggregate_output or "planning_results_aggregated_mistral.json"
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f"聚合结果已保存: {out_path}")

if __name__ == "__main__":
    main()
