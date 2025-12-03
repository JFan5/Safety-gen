# LLM 结果保存位置说明

## 1. 计划文件（.plan文件）

LLM为每个问题生成的计划保存在：

```
{benchmark_dir}/{scenario}/llm_results/{problem_name}.plan
```

**示例：**
- `benchmark_problems/blocksworld/llm_results/bw_ops3_n10_seed10001.plan`
- `benchmark_problems/grippers/llm_results/grippers-n3-r52-o50-s50002.plan`
- `benchmark_problems/delivery/llm_results/delivery_size10_packages1_seed10001.plan`

**文件内容：**
- 包含LLM生成的计划（action序列）
- 格式：每行一个action，例如 `(pick-up a b)`

## 2. 汇总结果文件

### 2.1 solver_comparison.csv

位置：`{benchmark_dir}/solver_comparison.csv`

包含每个问题的详细对比结果，包括：
- `scenario`: 场景名称
- `problem`: 问题文件名
- `llm_status`: LLM状态（generated, invalid, empty, generation_error等）
- `llm_validation`: 验证结果（valid, invalid）
- `llm_elapsed`: 生成时间（秒）
- `llm_plan_path`: 计划文件路径
- `llm_notes`: 错误信息或验证信息

### 2.2 solver_summary.csv

位置：`{benchmark_dir}/solver_summary.csv`

包含按场景汇总的统计信息：
- `solver`: 求解器名称（llm）
- `scenario`: 场景名称
- `total_problems`: 总问题数
- `success_count`: 成功解决的问题数
- `success_rate_percent`: 成功率（百分比）
- `timeout_count`: 超时数量
- `failure_count`: 失败数量
- `avg_elapsed_seconds_success`: 成功问题的平均耗时

### 2.3 solver_summary.json

位置：`{benchmark_dir}/solver_summary.json`

包含详细的JSON格式结果，包括：
- `parameters`: 运行参数
- `scenarios`: 每个场景的详细结果
  - `problems`: 每个问题的详细信息
    - `problem`: 问题名称
    - `problem_path`: 问题文件路径
    - `parameter_value`: 参数值
    - `llm`: LLM结果
      - `status`: 状态
      - `validation`: 验证结果
      - `elapsed_seconds`: 耗时
      - `plan_path`: 计划文件路径
      - `log_path`: 日志文件路径（如果有）
      - `notes`: 备注信息
  - `llm_summary`: LLM汇总统计
- `llm_summary`: 全局LLM汇总统计

## 3. 目录结构示例

```
benchmark_problems/
├── blocksworld/
│   ├── bw_ops3_n10_seed10001.pddl
│   ├── bw_ops3_n10_seed10002.pddl
│   └── llm_results/
│       ├── bw_ops3_n10_seed10001.plan
│       └── bw_ops3_n10_seed10002.plan
├── grippers/
│   ├── grippers-n3-r52-o50-s50002.pddl
│   └── llm_results/
│       └── grippers-n3-r52-o50-s50002.plan
├── delivery/
│   ├── delivery_size10_packages1_seed10001.pddl
│   └── llm_results/
│       └── delivery_size10_packages1_seed10001.plan
├── solver_comparison.csv
├── solver_summary.csv
└── solver_summary.json
```

## 4. 查看结果

### 查看某个问题的计划：
```bash
cat benchmark_problems/blocksworld/llm_results/bw_ops3_n10_seed10001.plan
```

### 查看汇总统计：
```bash
cat benchmark_problems/solver_summary.csv
```

### 查看详细JSON结果：
```bash
cat benchmark_problems/solver_summary.json | jq '.llm_summary'
```

## 5. 默认benchmark目录

默认的benchmark目录是：`{PROJECT_ROOT}/benchmark_problems`

可以通过 `--benchmark-dir` 参数自定义：
```bash
python script/run_optic_benchmark.py \
    --skip-optic \
    --benchmark-dir /path/to/custom/dir
```

## 6. 结果文件分开保存

**重要：** OPTIC和LLM的结果会分开保存到不同的文件中！

### 6.1 文件命名规则

- **只运行OPTIC（--skip-llm）**：
  - CSV结果：`optic_results.csv`
  - JSON结果：`optic_summary.json`
  - 计划文件：`{scenario}/optic_results/*.plan`

- **只运行LLM（--skip-optic）**：
  - CSV结果：`llm_results.csv`
  - JSON结果：`llm_summary.json`
  - 计划文件：`{scenario}/llm_results/*.plan`

- **同时运行OPTIC和LLM**：
  - CSV结果：`solver_comparison.csv`（包含两者的对比）
  - JSON结果：`solver_summary.json`（包含两者的汇总）
  - 计划文件：分别保存在各自的目录

### 6.2 文件位置

所有结果文件都保存在 `{benchmark_dir}` 目录下：
- `optic_results.csv` - OPTIC详细结果
- `llm_results.csv` - LLM详细结果
- `solver_comparison.csv` - 两者对比结果（如果同时运行）
- `optic_summary.csv` / `llm_summary.csv` / `solver_summary.csv` - 汇总统计
- `optic_summary.json` / `llm_summary.json` / `solver_summary.json` - JSON格式汇总

### 6.3 使用示例

**只运行OPTIC：**
```bash
python script/run_optic_benchmark.py \
    --skip-llm \
    --problems-per-scenario 10
```
生成：`optic_results.csv` 和 `optic_summary.json`

**只运行LLM：**
```bash
python script/run_optic_benchmark.py \
    --skip-optic \
    --problems-per-scenario 10
```
生成：`llm_results.csv` 和 `llm_summary.json`

**同时运行两者：**
```bash
python script/run_optic_benchmark.py \
    --problems-per-scenario 10
```
生成：`solver_comparison.csv` 和 `solver_summary.json`

