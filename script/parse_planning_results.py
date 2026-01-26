#!/usr/bin/env python3
"""解析 baseline 目录下的 JSON 文件并生成 summary JSON，用于后续可视化。"""

import argparse
import json
import re
from pathlib import Path
from typing import Dict, Optional
from utils import (
    _classify_result,
)


def _extract_solution_text(item: dict) -> Optional[str]:
    """优先使用 raw_solution，若无则尝试读取 solution_file。"""
    raw_solution = item.get("raw_solution")
    if isinstance(raw_solution, str):
        return raw_solution

    solution_path = item.get("solution_file")
    if not isinstance(solution_path, str) or not solution_path:
        return None

    path = Path(solution_path).expanduser()
    if not path.is_file():
        # 尝试相对于当前工作目录解析相对路径
        path = Path.cwd() / solution_path
    if not path.is_file():
        return None

    try:
        return path.read_text(encoding="utf-8")
    except OSError:
        return None


def _looks_like_valid_plan(plan_text: str) -> bool:
    """判断文本是否符合纯计划输出格式。"""
    lines = [line.strip() for line in plan_text.splitlines() if line.strip()]
    if not lines:
        return False
    return all(line.startswith("(") and line.endswith(")") for line in lines)


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
        
        # 检查 plan_text 格式
        plan_text = _extract_solution_text(it)
        if plan_text is not None and not _looks_like_valid_plan(plan_text):
            cat = "plan_format_error"
        else:
            # 提取 stdout_text 并分类
            stdout_text = it.get("validation_stdout", "")
            if not stdout_text:
                stdout_text = it.get("execution_info", {}).get("stdout", "")
            cat = _classify_result(stdout_text)
        
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


def _load_json(path: Path) -> Optional[dict]:
    """加载 JSON 文件。"""
    if not path.exists():
        return None
    try:
        with open(path, "r", encoding="utf-8") as f:
            return json.load(f)
    except (json.JSONDecodeError, OSError) as exc:
        print(f"警告: 无法加载 {path}: {exc}")
        return None


def _extract_scenario_name(json_file: Path) -> Optional[str]:
    """从 JSON 文件名提取 scenario 名称。
    
    例如:
    - ferry_test_results.json -> ferry
    - spanner_test_results.json -> spanner
    - blocksworld_test_results.json -> blocksworld
    """
    name = json_file.stem  # 去掉 .json 后缀
    
    # 移除常见的后缀模式
    patterns = [
        r'_test_results$',
        r'_testing_results$',
        r'_all_testing.*$',
        r'_results$',
    ]
    
    for pattern in patterns:
        name = re.sub(pattern, '', name)
    
    return name if name else None


def _parse_baseline_json(json_path: Path) -> Optional[Dict[str, object]]:
    """解析单个 baseline JSON 文件并生成 summary。"""
    raw = _load_json(json_path)
    if raw is None:
        return None
    
    items = raw.get("results") or []
    if not items:
        print(f"警告: {json_path.name} 中没有 results 数据")
        return None
    
    summarized = _summarize_results(items)
    
    # 提取 metadata
    metadata = raw.get("metadata") or {}
    metadata.update({
        "model": raw.get("model_path") or metadata.get("model_path") or "unknown",
        "scenario": metadata.get("scenario_name") or _extract_scenario_name(json_path) or "unknown",
        "variant": "baseline",
        "results_directory": raw.get("results_directory") or metadata.get("results_directory") or str(json_path.parent),
        "source_file": json_path.name,
        "domain_file": raw.get("domain_file") or metadata.get("domain_file"),
        "problems_dir": raw.get("problems_dir") or metadata.get("problems_dir"),
        "total_tests": raw.get("total_tests") or len(items),
    })
    summarized["metadata"] = metadata
    
    return summarized


def parse_baseline_directory(baseline_dir: str) -> Dict[str, Dict[str, dict]]:
    """解析 baseline 目录下的所有 JSON 文件并生成汇总结果。
    
    返回格式: {scenario: {baseline: {summary: {...}, metadata: {...}}}}
    """
    baseline_path = Path(baseline_dir)
    if not baseline_path.exists():
        raise FileNotFoundError(f"baseline 目录不存在: {baseline_path}")
    
    if not baseline_path.is_dir():
        raise ValueError(f"路径不是目录: {baseline_path}")
    
    # 查找所有 JSON 文件
    json_files = sorted(baseline_path.glob("*.json"))
    if not json_files:
        raise ValueError(f"在 {baseline_path} 中未找到任何 JSON 文件")
    
    aggregated: Dict[str, Dict[str, dict]] = {}
    
    for json_file in json_files:
        scenario_name = _extract_scenario_name(json_file)
        if not scenario_name:
            print(f"警告: 无法从文件名提取 scenario 名称: {json_file.name}，跳过")
            continue
        
        print(f"正在解析: {json_file.name} (scenario: {scenario_name})")
        result = _parse_baseline_json(json_file)
        
        if result is None:
            print(f"警告: 解析 {json_file.name} 失败，跳过")
            continue
        
        # 使用提取的 scenario 名称（可能从 metadata 覆盖）
        final_scenario = result.get("metadata", {}).get("scenario") or scenario_name
        
        if final_scenario not in aggregated:
            aggregated[final_scenario] = {}
        
        aggregated[final_scenario]["baseline"] = result
    
    if not aggregated:
        raise ValueError("未成功解析任何 JSON 文件")
    
    return aggregated

def main():
    """主函数 - 解析 baseline 目录下的 JSON 文件并生成 summary JSON"""
    parser = argparse.ArgumentParser(
        description="解析 baseline 目录下的 JSON 文件并生成 summary JSON，用于后续可视化",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例:
  python parse_planning_results.py --dir paper_results/gpt-oss-multi/baseline
  python parse_planning_results.py --dir paper_results/gpt-oss-multi/baseline --output summary.json
        """
    )
    parser.add_argument(
        "--dir",
        required=True,
        help="目录路径，包含要解析的 JSON 文件"
    )
    parser.add_argument(
        "--output",
        default="planning_results_aggregated.json",
        help="输出 JSON 文件路径（默认: planning_results_aggregated.json）"
    )
    
    args = parser.parse_args()
    
    # 解析目录
    print(f"正在解析目录: {args.dir}")
    try:
        data = parse_baseline_directory(args.dir)
    except Exception as exc:
        print(f"错误: {exc}")
        return 1
    
    # 保存结果
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    
    print(f"\n✓ 成功解析 {len(data)} 个场景")
    print(f"✓ 结果已保存到: {output_path.resolve()}")
    print(f"\n生成的摘要结构: {{scenario: {{baseline: {{summary: {{...}}, metadata: {{...}}}}}}}}")
    print("\n可以使用以下命令生成可视化图表:")
    print(f"  python visualize_planning_results.py --input {output_path}")
    
    return 0

if __name__ == "__main__":
    main()
