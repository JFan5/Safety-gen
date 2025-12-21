#!/usr/bin/env python3
"""检查各场景的 testing_problems100 目录中的问题数"""
from pathlib import Path

base_dir = Path("/home/ubuntu/Safety-gen/pddl3")

scenarios = {
    "blocksworld": {
        "source": base_dir / "blocksworld" / "all_problems3" / "testing",
        "target": base_dir / "blocksworld" / "testing_problems100",
    },
    "delivery": {
        "source": base_dir / "delivery" / "all_problems3",
        "target": base_dir / "delivery" / "testing_problems100",
    },
    "ferry": {
        "source": base_dir / "ferry" / "all_problems3" / "testing",
        "target": base_dir / "ferry" / "testing_problems100",
    },
    "grippers": {
        "source": base_dir / "grippers" / "all_problems3" / "testing",
        "target": base_dir / "grippers" / "testing_problems100",
    },
    "spanner": {
        "source": base_dir / "spanner" / "all_problems3" / "testing",
        "target": base_dir / "spanner" / "testing_problems100",
    },
}

print("=" * 70)
print("检查各场景的 testing_problems100 目录")
print("=" * 70)

for scen_name, cfg in scenarios.items():
    source_dir = cfg["source"]
    target_dir = cfg["target"]
    
    print(f"\n【{scen_name}】")
    print(f"  源目录: {source_dir}")
    print(f"  目标目录: {target_dir}")
    
    # 检查源目录中有多少有解的问题
    if source_dir.exists():
        available_count = 0
        for pddl_file in source_dir.glob("*.pddl"):
            if pddl_file.with_suffix(".soln").exists():
                available_count += 1
        print(f"  源目录可用问题数（有soln）: {available_count}")
    else:
        print(f"  源目录不存在！")
        available_count = 0
    
    # 检查目标目录中有多少问题
    if target_dir.exists():
        target_count = len(list(target_dir.glob("*.pddl")))
        soln_count = len(list(target_dir.glob("*.soln")))
        print(f"  目标目录问题数: {target_count}")
        print(f"  目标目录解决方案数: {soln_count}")
        
        if target_count < 100:
            print(f"  ⚠️  问题数不足！需要 100 个，实际只有 {target_count} 个")
            if available_count >= 100:
                print(f"  ✓ 源目录有足够的问题（{available_count} 个），可以重新运行脚本生成")
            else:
                print(f"  ✗ 源目录问题也不足（只有 {available_count} 个），无法达到 100 个")
        elif target_count == 100:
            print(f"  ✓ 问题数正好 100 个")
        else:
            print(f"  ⚠️  问题数超过 100 个（{target_count} 个）")
    else:
        print(f"  目标目录不存在！")
        if available_count >= 100:
            print(f"  ✓ 源目录有足够的问题（{available_count} 个），可以运行脚本生成")
        else:
            print(f"  ✗ 源目录问题不足（只有 {available_count} 个），无法达到 100 个")

print("\n" + "=" * 70)
print("总结")
print("=" * 70)

# 统计总结
total_available = 0
total_target = 0
scenarios_ok = []
scenarios_insufficient_source = []
scenarios_not_generated = []

for scen_name, cfg in scenarios.items():
    source_dir = cfg["source"]
    target_dir = cfg["target"]
    
    if source_dir.exists():
        available_count = sum(1 for p in source_dir.glob("*.pddl") if p.with_suffix(".soln").exists())
        total_available += available_count
        
        if target_dir.exists():
            target_count = len(list(target_dir.glob("*.pddl")))
            total_target += target_count
            if target_count >= 100:
                scenarios_ok.append(scen_name)
            elif available_count >= 100:
                scenarios_not_generated.append(scen_name)
            else:
                scenarios_insufficient_source.append((scen_name, available_count))
        else:
            if available_count >= 100:
                scenarios_not_generated.append(scen_name)
            else:
                scenarios_insufficient_source.append((scen_name, available_count))

print(f"\n总可用问题数（所有场景源目录）: {total_available}")
print(f"总目标问题数（所有场景目标目录）: {total_target}")

if scenarios_ok:
    print(f"\n✓ 问题数足够的场景: {', '.join(scenarios_ok)}")

if scenarios_not_generated:
    print(f"\n⚠️  源目录问题足够但未生成的场景: {', '.join(scenarios_not_generated)}")
    print("   可以运行 create_testing_problems100.py 生成")

if scenarios_insufficient_source:
    print(f"\n✗ 源目录问题不足的场景:")
    for scen_name, count in scenarios_insufficient_source:
        print(f"   - {scen_name}: 只有 {count} 个可用问题（需要 100 个）")

