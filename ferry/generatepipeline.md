## Ferry Pipeline 运行报告

- 生成时间: 自动流水线本次运行
- 场景: ferry

### 1) 生成 unique problems
- 使用脚本: `generate_ferry_training_batch.sh`
- 目标: 5000 个
- 实际生成: all_problems 中 5000 个 `.pddl`

### 2) 求解 PDDL2
- 命令: `python ../script/solve_problems_optic.py all_problems domain.pddl 10`
- 结果: 为 all_problems 下问题生成 `.soln`

### 3) 转换为 PDDL3
- 命令: `python convert_pddl3.py all_problems all_problems3`
- 输出: all_problems3 共 5000 个问题

### 4) 旧解验证新问题 (PDDL3)
- 命令: `python ../script/validate_classical_solvers.py --domain domain3.pddl --problems_dir all_problems3 --solutions_dir all_problems`
- 统计: Total=5000, Valid=390, Invalid=4610, Missing=0, Success=7.8%
- 结果文件: `ferry_old_vs_new_validation_results.json`

### 5) 求解 PDDL3
- 命令: `python ../script/solve_problems_optic.py all_problems3 domain3.pddl 10`
- 统计: 总 5000，生成解 5000

### 6) 验证并清理 (PDDL3)
- 命令: `python ../script/validate_classical_solvers.py --domain domain3.pddl --problems_dir all_problems3 --solutions_dir all_problems3`
- 统计: Total solutions=5000, Valid=5000, Invalid=0, Missing=0, Success=100.0%
- 结果文件: `ferry_all_problems3_validation_results.json`

### 7) 数据分割
- 命令: `python3 ../script/split_problems.py --input-dir all_problems3 --num-testing 200 --force`
- 结果: 训练/测试目录见 `all_problems3/training`, `all_problems3/testing`

### 汇总
- PDDL2 生成: 5000 问题
- PDDL3 转换: 5000 问题
- PDDL3 求解: 生成解 5000
