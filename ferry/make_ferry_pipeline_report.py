#!/usr/bin/env python3
import json
import sys
from pathlib import Path


def load_summary(json_path: Path):
    if not json_path.exists():
        return None
    try:
        return json.loads(json_path.read_text(encoding="utf-8"))
    except Exception:
        return None


def main() -> int:
    out_md = Path("generatepipeline.md")

    old_vs_new = load_summary(Path("ferry_old_vs_new_validation_results.json"))
    all3 = load_summary(Path("ferry_all_problems3_validation_results.json"))

    all2_dir = Path("all_problems")
    all3_dir = Path("all_problems3")
    n_all2 = len(list(all2_dir.glob("*.pddl"))) if all2_dir.exists() else 0
    n_all3 = len(list(all3_dir.glob("*.pddl"))) if all3_dir.exists() else 0
    n_all3_solved = len(list(all3_dir.glob("*.soln"))) if all3_dir.exists() else 0

    lines = []
    lines.append("## Ferry Pipeline 运行报告")
    lines.append("")
    lines.append("- 生成时间: 自动流水线本次运行")
    lines.append("- 场景: ferry")
    lines.append("")
    lines.append("### 1) 生成 unique problems")
    lines.append("- 使用脚本: `generate_ferry_training_batch.sh`")
    lines.append("- 目标: 5000 个")
    lines.append(f"- 实际生成: all_problems 中 {n_all2} 个 `.pddl`")
    lines.append("")
    lines.append("### 2) 求解 PDDL2")
    lines.append("- 命令: `python ../script/solve_problems_optic.py all_problems domain.pddl 10`")
    lines.append("- 结果: 为 all_problems 下问题生成 `.soln`")
    lines.append("")
    lines.append("### 3) 转换为 PDDL3")
    lines.append("- 命令: `python convert_pddl3.py all_problems all_problems3`")
    lines.append(f"- 输出: all_problems3 共 {n_all3} 个问题")
    lines.append("")
    lines.append("### 4) 旧解验证新问题 (PDDL3)")
    lines.append("- 命令: `python ../script/validate_classical_solvers.py --domain domain3.pddl --problems_dir all_problems3 --solutions_dir all_problems`")
    if old_vs_new and old_vs_new.get("summary"):
        s = old_vs_new["summary"]
        lines.append(f"- 统计: Total={s.get('total_solutions', 0)}, Valid={s.get('valid', 0)}, Invalid={s.get('invalid', 0)}, Missing={s.get('missing_problems', 0)}, Success={s.get('success_rate', 0):.1f}%")
        lines.append("- 结果文件: `ferry_old_vs_new_validation_results.json`")
    lines.append("")
    lines.append("### 5) 求解 PDDL3")
    lines.append("- 命令: `python ../script/solve_problems_optic.py all_problems3 domain3.pddl 10`")
    lines.append(f"- 统计: 总 {n_all3}，生成解 {n_all3_solved}")
    lines.append("")
    lines.append("### 6) 验证并清理 (PDDL3)")
    lines.append("- 命令: `python ../script/validate_classical_solvers.py --domain domain3.pddl --problems_dir all_problems3 --solutions_dir all_problems3`")
    if all3 and all3.get("summary"):
        s = all3["summary"]
        lines.append(f"- 统计: Total solutions={s.get('total_solutions', 0)}, Valid={s.get('valid', 0)}, Invalid={s.get('invalid', 0)}, Missing={s.get('missing_problems', 0)}, Success={s.get('success_rate', 0):.1f}%")
        lines.append("- 结果文件: `ferry_all_problems3_validation_results.json`")
    lines.append("")
    lines.append("### 7) 数据分割")
    lines.append("- 命令: `python3 ../script/split_problems.py --input-dir all_problems3 --num-testing 200 --force`")
    lines.append("- 结果: 训练/测试目录见 `all_problems3/training`, `all_problems3/testing`")
    lines.append("")
    lines.append("### 汇总")
    lines.append(f"- PDDL2 生成: {n_all2} 问题")
    lines.append(f"- PDDL3 转换: {n_all3} 问题")
    lines.append(f"- PDDL3 求解: 生成解 {n_all3_solved}")
    lines.append("")
    out_md.write_text("\n".join(lines), encoding="utf-8")
    print(f"Report written to {out_md}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())


