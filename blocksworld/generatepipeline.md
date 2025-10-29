## Blocksworld Pipeline 运行报告

- 生成时间: 自动流水线本次运行
- 场景: blocksworld

### 1) 生成 unique problems
- 使用脚本: `generate_blocksworld_unique_problems.sh`
- 目标: ~5000 个，按 (ops, blocks) 动态权重分配
- 实际生成: all_problems 中约 4973 个 `.pddl`

### 2) 求解 PDDL2
- 命令: `python ../script/solve_problems_optic.py all_problems domain.pddl 10`
- 结果: 为 all_problems 下问题生成 `.soln`（已有进度日志见终端）

### 3) 转换为 PDDL3
- 命令: `python convert_pddl3.py all_problems all_problems3`
- 输出: all_problems3 共 4005 个问题（无解时采用空计划回退插入约束）

### 4) 旧解验证新问题 (PDDL3)
- 命令: `python ../script/validate_classical_solvers.py --domain domain3.pddl --problems_dir all_problems3 --solutions_dir all_problems`
- 统计: 总 4973，Valid=1769，Invalid=2236，Missing=968，Success=35.6%
- 结果文件: `_domain3_validation_results.json`

### 5) 求解 PDDL3
- 命令: `python ../script/solve_problems_optic.py all_problems3 domain3.pddl 10`
- 统计: 总 4005，成功 3056，失败 949，成功率 76.3%

### 6) 验证并清理 (PDDL3)
- 命令: `python ../script/validate_classical_solvers.py --domain domain3.pddl --problems_dir all_problems3 --solutions_dir all_problems3`
- 统计: Total solutions=3056，Valid=3056，Invalid=0，Missing=0，Success=100.0%
- 注: 验证针对已生成解的 3056 个问题；失败/无解的 949 个问题未计入此统计。

### 7) 数据分割
- 命令: `python3 ../script/split_problems.py --input-dir all_problems3 --num-testing 200 --force`
- 结果: 训练集 3805，测试集 200（含对应 `.soln` 同步拷贝）

### 汇总
- PDDL2 生成: ~4973 问题
- PDDL3 转换: 4005 问题
- PDDL3 求解: 3056 成功（全部验证通过）
- 数据分割: training=3805，testing=200

产物位置:
- `blocksworld/all_problems` (PDDL2) 及其 `.soln`
- `blocksworld/all_problems3` (PDDL3) 及其 `.soln`
- `blocksworld/all_problems3/training`, `blocksworld/all_problems3/testing`
- 验证 JSON: `blocksworld/_domain3_validation_results.json`
