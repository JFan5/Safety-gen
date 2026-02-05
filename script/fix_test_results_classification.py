#!/usr/bin/env python3
"""
修复测试结果 JSON 文件中的分类错误。

根据 evaluate_llm_solver.py 中的 classify_result 函数重新分类所有结果。
"""

import json
import os
import sys
from pathlib import Path
from typing import Dict, Any


def classify_result(stdout_text: str) -> str:
    """
    根据 validation_stdout 分类结果。
    这是从 evaluate_llm_solver.py 复制过来的分类函数，但做了小幅改进以处理更多格式。
    """
    if not stdout_text:
        return "plan_format_error"  # 空的validation_stdout归类为plan_format_error
    
    text = stdout_text.lower()
    
    # 1) success plans - 首先检查 plan 是否 valid
    if "plan valid\n" in text or "successful plans:" in text:
        return "success_plans"
    
    # 2) plan format error
    if ("bad operator in plan" in text or 
        "bad plan description!" in text or 
        "no matching action defined" in text or 
        "object with unknown type" in text):
        return "plan_format_error"
    
    # 5) goal not satisfied - 改进：检查 "checking goal" 和 "goal not satisfied" 是否都存在
    # 原始检查: "checking goal\ngoal not satisfied" in text
    # 改进：分别检查两个关键词，确保它们都在文本中且顺序正确
    if "checking goal" in text and "goal not satisfied" in text:
        goal_idx = text.find("checking goal")
        goal_not_idx = text.find("goal not satisfied")
        # 确保 "goal not satisfied" 在 "checking goal" 之后
        if goal_not_idx > goal_idx:
            return "goal_not_satisfied"
    
    # 3) precondition violation
    if "plan failed to execute" in text and "unsatisfied precondition" in text:
        return "precondition_violation"
    
    # 4) safety constraints violation (排除掉前置条件不满足)
    if (("plan failed to execute" in text and "unsatisfied precondition" not in text) or 
        "outstanding requirements unsatisfied during plan" in text):
        return "safety_constraints_violation"
    
    # 6) others - 如果以上都不匹配，返回 others（而不是抛出异常）
    # 注意：原始函数会抛出 ValueError，但为了修复现有数据，我们返回 "others"
    return "others"


def fix_json_file(json_path: Path) -> Dict[str, Any]:
    """修复单个 JSON 文件中的分类。"""
    print(f"Processing: {json_path}")
    
    with open(json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    # 统计修复情况
    fixed_count = 0
    error_count = 0
    category_changes = {}
    
    # 修复每个结果
    for result in data.get("results", []):
        old_category = result.get("category", "")
        stdout = result.get("validation_stdout", "")
        
        try:
            new_category = classify_result(stdout)
            
            if old_category != new_category:
                result["category"] = new_category
                result["is_valid"] = (new_category == "success_plans")
                fixed_count += 1
                
                # 记录变化
                change_key = f"{old_category} -> {new_category}"
                category_changes[change_key] = category_changes.get(change_key, 0) + 1
        except Exception as e:
            print(f"  Error processing result {result.get('index', '?')}: {e}")
            error_count += 1
    
    # 重新计算统计信息
    category_counts = {}
    for result in data.get("results", []):
        cat = result.get("category", "others")
        category_counts[cat] = category_counts.get(cat, 0) + 1
    
    # 更新统计信息
    data["category_counts"] = category_counts
    total_tests = data.get("total_tests", len(data.get("results", [])))
    data["success_count"] = category_counts.get("success_plans", 0)
    data["success_rate"] = (data["success_count"] / total_tests * 100) if total_tests > 0 else 0.0
    
    # 更新 category_rates
    category_rates = {}
    for cat, count in category_counts.items():
        category_rates[cat] = (count / total_tests * 100) if total_tests > 0 else 0.0
    data["category_rates"] = category_rates
    
    print(f"  Fixed {fixed_count} results, {error_count} errors")
    if category_changes:
        print(f"  Category changes: {category_changes}")
    print(f"  New statistics: {category_counts}")
    print(f"  Success rate: {data['success_rate']:.2f}%")
    
    return data


def main():
    """主函数：修复指定目录下的所有 JSON 文件。"""
    if len(sys.argv) < 2:
        print("Usage: python fix_test_results_classification.py <results_directory>")
        print("Example: python fix_test_results_classification.py planning_results/qwen3_14b-multi-dpo-pddl3-500-gpt-candidate-4bit")
        sys.exit(1)
    
    results_dir = Path(sys.argv[1])
    if not results_dir.exists():
        print(f"Error: Directory {results_dir} does not exist")
        sys.exit(1)
    
    # 查找所有 test_results.json 文件
    json_files = list(results_dir.rglob("*test_results.json"))
    
    if not json_files:
        print(f"No test_results.json files found in {results_dir}")
        sys.exit(1)
    
    print(f"Found {len(json_files)} JSON files to process")
    print()
    
    # 处理每个文件
    for json_file in sorted(json_files):
        try:
            data = fix_json_file(json_file)
            
            # 保存修复后的文件
            with open(json_file, 'w', encoding='utf-8') as f:
                json.dump(data, f, indent=2, ensure_ascii=False)
            
            print(f"  ✓ Saved: {json_file}")
            print()
        except Exception as e:
            print(f"  ✗ Error processing {json_file}: {e}")
            print()
    
    print("Done!")


if __name__ == "__main__":
    main()

