#!/usr/bin/env python3
"""
验证 all_problems3/training 中的问题是否都在 all_problems/training 中存在。
"""

import json
from pathlib import Path
from datetime import datetime
from collections import defaultdict


def check_scenario(scenario: str, base_dir: Path):
    """检查单个场景"""
    print(f"\n{'='*80}")
    print(f"检查场景: {scenario}")
    print(f"{'='*80}")
    
    pddl3_training_dir = base_dir / scenario / "all_problems3" / "training"
    old_training_dir = base_dir / scenario / "all_problems" / "training"
    
    if not pddl3_training_dir.exists():
        print(f"  错误: 找不到 all_problems3/training: {pddl3_training_dir}")
        return None
    
    if not old_training_dir.exists():
        print(f"  错误: 找不到 all_problems/training: {old_training_dir}")
        return None
    
    # 获取所有 PDDL3 问题
    pddl3_problems = sorted(pddl3_training_dir.glob("*.pddl"))
    total_pddl3 = len(pddl3_problems)
    
    # 获取所有旧问题
    old_problems = {f.name for f in old_training_dir.glob("*.pddl")}
    
    print(f"  PDDL3 问题目录: {pddl3_training_dir}")
    print(f"  旧问题目录: {old_training_dir}")
    print(f"  PDDL3 问题总数: {total_pddl3}")
    print(f"  旧问题总数: {len(old_problems)}")
    print()
    
    # 检查每个 PDDL3 问题是否在旧集中存在
    missing_problems = []
    existing_problems = []
    
    for pddl3_problem_file in pddl3_problems:
        problem_name = pddl3_problem_file.name
        if problem_name in old_problems:
            existing_problems.append(problem_name)
        else:
            missing_problems.append(problem_name)
    
    # 统计
    total_existing = len(existing_problems)
    total_missing = len(missing_problems)
    existing_rate = (total_existing / total_pddl3 * 100) if total_pddl3 > 0 else 0
    
    print(f"  结果:")
    print(f"    ✅ 存在: {total_existing} ({existing_rate:.2f}%)")
    print(f"    ❌ 缺失: {total_missing} ({100-existing_rate:.2f}%)")
    
    if total_missing > 0:
        print(f"\n  缺失的问题（前20个）:")
        for prob in sorted(missing_problems)[:20]:
            print(f"    - {prob}")
        if total_missing > 20:
            print(f"    ... 还有 {total_missing - 20} 个")
    
    # 保存结果
    result = {
        "scenario": scenario,
        "timestamp": datetime.now().isoformat(),
        "pddl3_training_dir": str(pddl3_training_dir),
        "old_training_dir": str(old_training_dir),
        "total_pddl3_problems": total_pddl3,
        "total_old_problems": len(old_problems),
        "existing_count": total_existing,
        "missing_count": total_missing,
        "existing_rate": existing_rate,
        "missing_problems": sorted(missing_problems),
        "existing_problems": sorted(existing_problems)
    }
    
    # 保存 JSON
    json_file = base_dir / f"{scenario}_problems_existence_check.json"
    with json_file.open('w', encoding='utf-8') as f:
        json.dump(result, f, indent=2, ensure_ascii=False)
    print(f"\n  结果已保存到: {json_file}")
    
    # 保存缺失问题列表
    if total_missing > 0:
        txt_file = base_dir / f"{scenario}_missing_in_old_training.txt"
        with txt_file.open('w', encoding='utf-8') as f:
            f.write(f"# {scenario} 场景中在 all_problems/training 中缺失的问题\n")
            f.write(f"# 总数: {total_missing}\n\n")
            for prob in sorted(missing_problems):
                f.write(f"{prob}\n")
        print(f"  缺失问题列表已保存到: {txt_file}")
    
    return result


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3")
    scenarios = ['blocksworld', 'ferry', 'spanner', 'grippers']
    
    all_results = {}
    
    for scenario in scenarios:
        result = check_scenario(scenario, base_dir)
        if result:
            all_results[scenario] = result
    
    # 生成汇总报告
    print(f"\n{'='*80}")
    print("所有场景汇总")
    print(f"{'='*80}")
    print()
    print("| 场景 | PDDL3问题数 | 旧问题数 | 存在 | 缺失 | 存在率 |")
    print("|------|------------|----------|------|------|--------|")
    
    for scenario in scenarios:
        if scenario not in all_results:
            continue
        r = all_results[scenario]
        print(f"| {scenario} | {r['total_pddl3_problems']} | {r['total_old_problems']} | "
              f"{r['existing_count']} | {r['missing_count']} | {r['existing_rate']:.2f}% |")
    
    print()
    print("=" * 80)
    print("结论")
    print("=" * 80)
    print()
    
    for scenario in scenarios:
        if scenario not in all_results:
            continue
        r = all_results[scenario]
        if r['missing_count'] == 0:
            print(f"✅ {scenario}: 所有 {r['total_pddl3_problems']} 个问题都在 all_problems/training 中存在")
        else:
            print(f"⚠️ {scenario}: {r['missing_count']} 个问题在 all_problems/training 中不存在 "
                  f"({r['existing_rate']:.2f}% 存在)")


if __name__ == "__main__":
    main()

