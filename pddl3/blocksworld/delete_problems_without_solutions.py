#!/usr/bin/env python3
"""
删除 all_problems3 下没有 solution 的 pddl 文件，包括 training 和 testing 中的。
"""

from pathlib import Path


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3/blocksworld")
    all_problems3 = base_dir / "all_problems3"
    
    if not all_problems3.exists():
        print(f"错误: all_problems3 目录不存在")
        return
    
    # 找出所有没有 solution 的 pddl 文件
    problems_without_solution = []
    for pddl_file in all_problems3.rglob("*.pddl"):
        soln_file = pddl_file.with_suffix(".soln")
        if not soln_file.exists():
            problems_without_solution.append(pddl_file)
    
    if not problems_without_solution:
        print("✅ 所有 pddl 文件都有对应的 solution")
        return
    
    # 按目录分类统计
    root_missing = []
    training_missing = []
    testing_missing = []
    
    for p in problems_without_solution:
        rel_path = p.relative_to(all_problems3)
        if str(rel_path).startswith("training/"):
            training_missing.append(p)
        elif str(rel_path).startswith("testing/"):
            testing_missing.append(p)
        else:
            root_missing.append(p)
    
    print("=" * 60)
    print("准备删除没有 solution 的文件")
    print("=" * 60)
    print(f"根目录: {len(root_missing)} 个文件")
    print(f"training: {len(training_missing)} 个文件")
    print(f"testing: {len(testing_missing)} 个文件")
    print(f"总计: {len(problems_without_solution)} 个文件")
    print()
    
    # 删除文件
    deleted_count = 0
    failed_count = 0
    
    for pddl_file in problems_without_solution:
        try:
            pddl_file.unlink()
            deleted_count += 1
            if deleted_count % 100 == 0:
                print(f"  已删除 {deleted_count}/{len(problems_without_solution)} 个文件...")
        except Exception as e:
            print(f"  错误: 删除 {pddl_file.relative_to(all_problems3)} 失败: {e}")
            failed_count += 1
    
    print()
    print("=" * 60)
    print("删除完成")
    print("=" * 60)
    print(f"成功删除: {deleted_count}")
    print(f"删除失败: {failed_count}")
    
    # 验证
    print()
    print("验证...")
    remaining_without_solution = []
    for pddl_file in all_problems3.rglob("*.pddl"):
        soln_file = pddl_file.with_suffix(".soln")
        if not soln_file.exists():
            remaining_without_solution.append(pddl_file)
    
    if remaining_without_solution:
        print(f"⚠️ 仍有 {len(remaining_without_solution)} 个文件没有 solution")
    else:
        print("✅ 所有剩余的 pddl 文件都有对应的 solution")
        
        # 统计最终文件数
        root_count = len(list((all_problems3).glob("*.pddl")))
        training_count = len(list((all_problems3 / "training").glob("*.pddl"))) if (all_problems3 / "training").exists() else 0
        testing_count = len(list((all_problems3 / "testing").glob("*.pddl"))) if (all_problems3 / "testing").exists() else 0
        
        print()
        print("最终文件统计:")
        print(f"  根目录: {root_count} 个文件")
        print(f"  training: {training_count} 个文件")
        print(f"  testing: {testing_count} 个文件")
        print(f"  总计: {root_count + training_count + testing_count} 个文件")


if __name__ == "__main__":
    main()

