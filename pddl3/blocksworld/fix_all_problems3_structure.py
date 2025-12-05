#!/usr/bin/env python3
"""
修复 blocksworld 的 all_problems3 结构，确保根目录包含 training 和 testing 中的所有文件。
"""

import shutil
from pathlib import Path


def main():
    base_dir = Path("/home/jfan5/Safety-gen/pddl3/blocksworld")
    all_problems3 = base_dir / "all_problems3"
    
    if not all_problems3.exists():
        print(f"错误: all_problems3 目录不存在")
        return
    
    # 获取根目录已有的文件
    root_files = {f.name for f in all_problems3.glob("*.pddl") if f.is_file()}
    print(f"根目录现有文件数: {len(root_files)}")
    
    # 获取 training 和 testing 中的文件
    training_dir = all_problems3 / "training"
    testing_dir = all_problems3 / "testing"
    
    training_files = {}
    if training_dir.exists():
        for f in training_dir.glob("*.pddl"):
            if f.is_file():
                training_files[f.name] = f
    
    testing_files = {}
    if testing_dir.exists():
        for f in testing_dir.glob("*.pddl"):
            if f.is_file():
                testing_files[f.name] = f
    
    print(f"training 文件数: {len(training_files)}")
    print(f"testing 文件数: {len(testing_files)}")
    
    # 找出需要复制的文件
    all_subdir_files = {**training_files, **testing_files}
    missing_from_root = {name: path for name, path in all_subdir_files.items() if name not in root_files}
    
    print(f"需要复制到根目录的文件数: {len(missing_from_root)}")
    
    if not missing_from_root:
        print("✅ 所有文件都已存在于根目录")
        return
    
    # 复制文件
    print("\n开始复制文件...")
    copied = 0
    failed = 0
    
    for name, source_path in sorted(missing_from_root.items()):
        dest_path = all_problems3 / name
        try:
            shutil.copy2(source_path, dest_path)
            copied += 1
            if copied % 100 == 0:
                print(f"  已复制 {copied}/{len(missing_from_root)} 个文件...")
        except Exception as e:
            print(f"  错误: 复制 {name} 失败: {e}")
            failed += 1
    
    print(f"\n复制完成:")
    print(f"  成功: {copied}")
    print(f"  失败: {failed}")
    
    # 验证
    print("\n验证...")
    root_files_after = {f.name for f in all_problems3.glob("*.pddl") if f.is_file()}
    still_missing = {name for name in all_subdir_files.keys() if name not in root_files_after}
    
    if still_missing:
        print(f"⚠️ 仍有 {len(still_missing)} 个文件缺失")
    else:
        print(f"✅ 所有 training 和 testing 中的文件都已存在于根目录")
        print(f"根目录总文件数: {len(root_files_after)}")


if __name__ == "__main__":
    main()

