# run_optic_benchmark.py 运行示例

## 1. 快速测试（只运行OPTIC，每个场景10个问题）
```bash
python script/run_optic_benchmark.py \
    --skip-llm \
    --problems-per-scenario 10 \
    --instances-per-parameter 2 \
    --time-limit 100
```

**结果文件：** `optic_results.csv` 和 `optic_summary.json`

## 2. 完整运行（所有问题，只运行OPTIC）
```bash
python script/run_optic_benchmark.py \
    --skip-llm \
    --problems-per-scenario 0 \
    --instances-per-parameter 2
```

## 3. 运行OPTIC + LLM对比
```bash
# 使用默认的 gpt-oss-20b 模型
python script/run_optic_benchmark.py \
    --problems-per-scenario 20 \
    --instances-per-parameter 2 \
    --time-limit 100

# 使用自定义模型
python script/run_optic_benchmark.py \
    --llm-model /path/to/your/model \
    --llm-family qwen \
    --problems-per-scenario 20 \
    --instances-per-parameter 2 \
    --time-limit 100
```

## 4. 只测试LLM（跳过OPTIC）
```bash
# 使用默认的 gpt-oss-20b 模型，只测试LLM
python script/run_optic_benchmark.py \
    --skip-optic \
    --problems-per-scenario 10 \
    --instances-per-parameter 2

# 使用自定义模型，只测试LLM
python script/run_optic_benchmark.py \
    --skip-optic \
    --llm-model /path/to/your/model \
    --llm-family qwen \
    --problems-per-scenario 20
```

**结果文件：** `llm_results.csv` 和 `llm_summary.json`

## 5. 只测试最困难的问题（LLM，跳过OPTIC）
```bash
python script/run_optic_benchmark.py \
    --skip-optic \
    --llm-hardest-only \
    --problems-per-scenario 0
```

## 6. 每个参数值只运行一个问题
```bash
# 即使生成了多个实例（--instances-per-parameter 2），每个参数值只运行一个问题
python script/run_optic_benchmark.py \
    --skip-optic \
    --one-per-parameter \
    --problems-per-scenario 0 \
    --instances-per-parameter 2
```

**说明：**
- 默认情况下，如果 `--instances-per-parameter 2`，每个参数值会生成2个问题，都会运行
- 使用 `--one-per-parameter` 后，每个参数值只会运行第一个问题
- 例如：参数值3-50，每个参数2个实例，总共96个问题；使用 `--one-per-parameter` 后，只运行48个问题（每个参数值1个）

## 7. 跳过问题生成，使用已有问题
```bash
# 第一次运行：生成问题并运行测试
python script/run_optic_benchmark.py \
    --skip-llm \
    --problems-per-scenario 10

# 后续运行：跳过生成，直接使用已有问题（更快）
python script/run_optic_benchmark.py \
    --skip-llm \
    --skip-generation

# 限制每个参数值的实例数量（从已有问题中选择）
python script/run_optic_benchmark.py \
    --skip-llm \
    --skip-generation \
    --instances-per-parameter 1

# 也可以只运行LLM测试，使用已有问题
python script/run_optic_benchmark.py \
    --skip-optic \
    --skip-generation
```

**说明：**
- `--skip-generation` 会跳过问题生成，直接从 `--benchmark-dir` 目录加载已有的 `.pddl` 文件
- 如果目录中没有问题文件，会报错提示
- 适用于：已经生成过问题，只想重新运行测试的情况
- `--instances-per-parameter` 在使用 `--skip-generation` 时也有效，会限制每个参数值加载的问题数量
- 可以与其他选项组合使用，如 `--one-per-parameter`、`--skip-optic` 等
- 如果同时使用 `--instances-per-parameter 1` 和 `--one-per-parameter`，效果相同（每个参数值只运行1个问题）

## 8. 使用缓存跳过已解问题
```bash
# 第一次运行：正常求解，生成缓存
python script/run_optic_benchmark.py \
    --skip-llm \
    --problems-per-scenario 10

# 后续运行：跳过已成功求解的问题
python script/run_optic_benchmark.py \
    --skip-llm \
    --skip-solved

# 结合已有问题与缓存（最快速的复现方式）
python script/run_optic_benchmark.py \
    --skip-llm \
    --skip-generation \
    --skip-solved
```

## 9. 自定义输出目录
```bash
python script/run_optic_benchmark.py \
    --skip-llm \
    --benchmark-dir /path/to/output \
    --problems-per-scenario 50
```

## 输出文件

运行后会在 `--benchmark-dir` 目录下生成：
- `solver_comparison.csv`: 详细结果对比
- `solver_summary.csv`: 汇总统计
- `solver_summary.json`: JSON格式的详细结果
- 各场景的问题文件和结果目录

## 注意事项

1. **前提条件**：
   - OPTIC 二进制文件需要在：`../../optic/release/optic/optic-clp`（仅当不使用 `--skip-optic` 时）
   - Validate 二进制文件需要在：`/home/ubuntu/VAL/build/linux64/Release/bin/Validate`（仅当运行LLM时）
   - 各场景的生成器需要已编译（脚本会自动编译）
   - 如果只运行LLM（`--skip-optic`），不需要OPTIC二进制文件

2. **问题规模**：
   - 参数范围：3-50（每个场景）
   - 默认每个参数值生成2个实例（通过 `--instances-per-parameter` 控制）
   - 如果 `--problems-per-scenario 0`，会生成所有参数级别的问题
   - 使用 `--one-per-parameter` 可以让每个参数值只运行一个问题（即使生成了多个实例）
   - 使用 `--skip-generation` 可以跳过问题生成，直接使用已有的问题文件

3. **运行时间**：
   - 每个问题OPTIC最多运行100秒（默认）
   - 如果问题很多，总运行时间可能很长
   - 建议先用小规模测试

4. **LLM模型**：
   - 默认使用 `unsloth/gpt-oss-20b-unsloth-bnb-4bit` 模型
   - 默认模型家族为 `gpt`
   - 需要安装 `evaluate_llm_solver` 模块和 unsloth
   - 需要足够的GPU内存
   - 可以使用 `--skip-llm` 跳过LLM部分
   - 可以使用 `--skip-optic` 只测试LLM
   - 支持最长32768 tokens的序列长度
5. **缓存文件**：使用 `--skip-solved` 会在 `--benchmark-dir` 下维护 `solver_cache.json`，记录已验证通过的问题结果

