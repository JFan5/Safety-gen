#!/usr/bin/env python3
"""快速检查各场景的问题数"""
from pathlib import Path

base = Path('/home/ubuntu/Safety-gen/pddl3')
scenarios = {
    'blocksworld': (base / 'blocksworld' / 'all_problems3' / 'testing', base / 'blocksworld' / 'testing_problems100'),
    'delivery': (base / 'delivery' / 'all_problems3', base / 'delivery' / 'testing_problems100'),
    'ferry': (base / 'ferry' / 'all_problems3' / 'testing', base / 'ferry' / 'testing_problems100'),
    'grippers': (base / 'grippers' / 'all_problems3' / 'testing', base / 'grippers' / 'testing_problems100'),
    'spanner': (base / 'spanner' / 'all_problems3' / 'testing', base / 'spanner' / 'testing_problems100'),
}

print("=" * 70)
for name, (source, target) in scenarios.items():
    if source.exists():
        available = sum(1 for p in source.glob('*.pddl') if p.with_suffix('.soln').exists())
        print(f"{name:12s} 源目录可用: {available:4d} 个", end="")
    else:
        print(f"{name:12s} 源目录不存在", end="")
        available = 0
    
    if target.exists():
        count = len(list(target.glob('*.pddl')))
        status = "✓" if count >= 100 else "⚠"
        print(f"  | 目标目录: {count:3d} 个 {status}")
    else:
        print(f"  | 目标目录: 不存在")
        if available >= 100:
            print(f"    → 可以生成")

print("=" * 70)


