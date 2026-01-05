# Shell Scripts 使用指南

## 📁 可用脚本

所有脚本位于 `/home/ubuntu/Safety-gen/`

| 脚本 | 用途 | 需要模型 |
|------|------|----------|
| `run_dpo_generation.sh` | 主流程脚本（完整管道） | 可选 |
| `quick_test.sh` | 快速测试（无需模型） | ❌ |
| `monitor_progress.sh` | 监控生成进度 | ❌ |
| `analyze_output.sh` | 分析生成结果 | ❌ |

---

## 🚀 快速开始

### 1. 快速测试（5分钟，无需模型）

```bash
cd /home/ubuntu/Safety-gen
./quick_test.sh
```

**测试内容：**
- ✓ 文件加载
- ✓ Unsafe solution 加载
- ✓ 提示生成
- ✓ 验证器

**输出示例：**
```
[1/4] Testing file loading...
Found 500 problem-solution pairs
✓ All quick tests completed!
```

---

### 2. 完整测试（需要模型）

```bash
# 设置模型路径
MODEL_PATH="/path/to/your/sft/model"

# 运行测试
./run_dpo_generation.sh --model $MODEL_PATH --test-only
```

**包含：**
- 所有基础测试
- 模型加载测试
- 不运行生成

---

### 3. 小规模测试（3个问题，约5分钟）

```bash
./run_dpo_generation.sh --model $MODEL_PATH --small-test
```

**输出：**
- 测试数据集：`/jfan5/dpo_data_test/blocksworld_test.jsonl`
- 验证模型采样是否正常工作

---

### 4. 完整生成（2000个问题，2-4小时）

```bash
# 交互模式（会询问确认）
./run_dpo_generation.sh --model $MODEL_PATH --full

# 自动模式（不询问）
./run_dpo_generation.sh --model $MODEL_PATH --full --yes
```

**输出：**
- 目录：`/jfan5/dpo_data-1206/`
- 日志：`dpo_generation_YYYYMMDD_HHMMSS.log`
- 报告：`dpo_generation_report_YYYYMMDD_HHMMSS.txt`

---

## 📊 监控和分析

### 监控进度（生成过程中）

```bash
# 查看当前状态
./monitor_progress.sh

# 实时监控（每10秒刷新）
watch -n 10 ./monitor_progress.sh

# 实时查看日志
tail -f dpo_generation_*.log
```

**显示内容：**
- 当前生成状态
- 已生成的文件和数量
- 资源使用情况
- 最近的日志条目

### 分析结果（生成完成后）

```bash
./analyze_output.sh
```

**分析内容：**
1. 文件摘要（大小、数量）
2. 场景统计
3. 分数分布（100-80, 100-60, 100-40）
4. 场景分布
5. 示例样本
6. 数据质量检查

---

## 📖 详细命令参考

### run_dpo_generation.sh

**语法：**
```bash
./run_dpo_generation.sh [OPTIONS]
```

**选项：**

| 选项 | 说明 |
|------|------|
| `-m, --model PATH` | SFT 模型路径（必需） |
| `-t, --test-only` | 仅运行测试 |
| `-s, --small-test` | 小规模测试（3个问题） |
| `-f, --full` | 完整生成（默认） |
| `-y, --yes` | 自动确认所有提示 |
| `-h, --help` | 显示帮助 |

**示例：**

```bash
# 查看帮助
./run_dpo_generation.sh --help

# 仅测试
./run_dpo_generation.sh --test-only

# 小规模测试
./run_dpo_generation.sh --model /path/to/model --small-test

# 完整生成（交互模式）
./run_dpo_generation.sh --model /path/to/model

# 完整生成（自动模式）
./run_dpo_generation.sh --model /path/to/model --yes

# 完整生成并指定输出
./run_dpo_generation.sh --model /path/to/model --full
```

---

## 🔄 典型工作流

### 场景 1：第一次运行

```bash
# 步骤 1：快速测试
./quick_test.sh

# 步骤 2：实现验证器
# 编辑 generate_dpo_dataset.py 第 ~95 行

# 步骤 3：安装依赖
pip install vllm torch tqdm

# 步骤 4：小规模测试
./run_dpo_generation.sh --model /path/to/model --small-test

# 步骤 5：检查测试输出
./analyze_output.sh  # 会分析测试输出

# 步骤 6：完整生成
./run_dpo_generation.sh --model /path/to/model --full --yes
```

### 场景 2：已有模型，直接生成

```bash
# 一条命令完成所有
./run_dpo_generation.sh --model /path/to/model --yes
```

### 场景 3：监控长时间运行的生成

```bash
# 终端 1：启动生成
./run_dpo_generation.sh --model /path/to/model --yes

# 终端 2：监控进度
watch -n 10 ./monitor_progress.sh

# 终端 3：查看日志
tail -f dpo_generation_*.log
```

### 场景 4：分析已生成的数据

```bash
# 详细分析
./analyze_output.sh

# 检查特定文件
cd /jfan5/dpo_data-1206
ls -lh *.jsonl

# 查看统计
cat stats.json | jq

# 随机抽样检查
shuf -n 5 all_scenarios_merged.jsonl | jq
```

---

## 🎯 脚本功能详解

### run_dpo_generation.sh - 主流程脚本

**自动化流程：**

1. **环境检查**
   - 检查 Python 版本
   - 验证依赖安装

2. **依赖安装**（可选）
   - 安装 torch, tqdm, vllm
   - 安装可选包（pddl-parser）

3. **文件结构验证**
   - 检查所有场景目录
   - 统计 .pddl 和 .soln 文件

4. **基础测试**
   - 文件加载
   - Unsafe solution 加载
   - 提示创建
   - 验证器测试

5. **模型测试**（如果提供模型）
   - 模型加载
   - 生成测试

6. **小规模测试**（如果请求）
   - 3个问题测试
   - 验证输出

7. **完整生成**（如果请求）
   - 2000个问题生成
   - 显示进度

8. **输出验证**
   - 检查所有输出文件
   - 验证 JSON 格式
   - 统计信息

9. **后处理**
   - 创建 train/val 分割
   - 生成样本用于审查
   - 生成摘要报告

**日志文件：**
- 自动生成：`dpo_generation_YYYYMMDD_HHMMSS.log`
- 包含所有步骤的详细输出

**报告文件：**
- 自动生成：`dpo_generation_report_YYYYMMDD_HHMMSS.txt`
- 包含：文件摘要、统计、样本

---

### quick_test.sh - 快速测试

**特点：**
- 无需模型
- 运行时间：< 1分钟
- 验证基础设置

**测试项：**
1. 文件加载（必须通过）
2. Unsafe solution（可以失败）
3. 提示生成（必须通过）
4. 验证器（警告如果是占位符）

---

### monitor_progress.sh - 进度监控

**显示信息：**
- 最新日志文件位置
- 输出目录状态
- 已生成文件数量
- 当前进程状态
- 资源使用（CPU、内存）
- 最近日志条目

**实时监控：**
```bash
# 每10秒刷新一次
watch -n 10 ./monitor_progress.sh
```

---

### analyze_output.sh - 结果分析

**分析内容：**

1. **文件摘要**
   - 每个文件的大小和数量
   - 总计统计

2. **场景统计**
   - 每个场景的详细信息
   - 各类型 pair 数量

3. **分数分布**
   - 100-80, 100-60, 100-40 的比例
   - 百分比显示

4. **场景分布**
   - blocksworld, grippers, spanner, ferry
   - 每个场景的 pair 数量

5. **样本展示**
   - 每种分数差异的示例
   - JSON 格式化显示

6. **质量检查**
   - 检查必需字段
   - 验证 JSON 格式
   - 检查重复数据

---

## 💡 高级用法

### 并行处理多个场景

如果你想加速生成，可以并行处理：

```bash
# 为每个场景启动一个实例（需修改脚本）
# 注意：需要足够的 GPU 内存

# 场景 1
SCENARIOS="blocksworld" ./run_dpo_generation.sh --model /path/to/model &

# 场景 2
SCENARIOS="grippers" ./run_dpo_generation.sh --model /path/to/model &

# 等待所有完成
wait
```

### 自定义输出目录

```bash
# 在脚本中修改 OUTPUT_DIR 变量
# 或使用符号链接
ln -s /custom/path /jfan5/dpo_data-1206
```

### 使用后台运行

```bash
# 使用 nohup 后台运行
nohup ./run_dpo_generation.sh --model /path/to/model --yes > generation.out 2>&1 &

# 查看进程
ps aux | grep run_dpo_generation

# 查看输出
tail -f generation.out
```

### 使用 screen 或 tmux

```bash
# 使用 screen
screen -S dpo_gen
./run_dpo_generation.sh --model /path/to/model --yes
# Ctrl+A, D 退出

# 恢复 session
screen -r dpo_gen

# 使用 tmux
tmux new -s dpo_gen
./run_dpo_generation.sh --model /path/to/model --yes
# Ctrl+B, D 退出

# 恢复 session
tmux attach -t dpo_gen
```

---

## 🔧 故障排查

### 脚本无法执行

```bash
# 确保有执行权限
chmod +x *.sh
ls -l *.sh
```

### 找不到命令

```bash
# 确保在正确目录
cd /home/ubuntu/Safety-gen

# 使用完整路径
/home/ubuntu/Safety-gen/run_dpo_generation.sh --help
```

### Python 模块未找到

```bash
# 检查 Python 环境
which python3
python3 --version

# 重新安装依赖
pip install --upgrade torch tqdm vllm
```

### 生成中断

```bash
# 查找进程
ps aux | grep generate_dpo_dataset

# 检查日志
ls -lt dpo_generation_*.log | head -1
tail -100 <latest_log_file>

# 检查部分输出
./analyze_output.sh
```

---

## 📝 日志和输出

### 日志文件位置

```
/home/ubuntu/Safety-gen/
├── dpo_generation_20251207_120000.log
├── dpo_generation_20251207_140000.log
└── ...
```

### 输出文件位置

```
/jfan5/dpo_data-1206/
├── blocksworld_dpo.jsonl
├── grippers_dpo.jsonl
├── spanner_dpo.jsonl
├── ferry_dpo.jsonl
├── all_scenarios_merged.jsonl
├── stats.json
├── train.jsonl
├── val.jsonl
└── sample_pairs.jsonl
```

### 报告文件位置

```
/home/ubuntu/Safety-gen/
├── dpo_generation_report_20251207_120000.txt
└── ...
```

---

## ✅ 检查清单

使用脚本前：
- [ ] 已实现 `verify_plan()` 函数
- [ ] 已安装依赖（vllm, torch, tqdm）
- [ ] 已运行快速测试
- [ ] 模型路径正确
- [ ] 有足够的磁盘空间（~100 MB）
- [ ] 有足够的 GPU 内存（模型大小相关）

运行期间：
- [ ] 监控进度
- [ ] 检查日志错误
- [ ] 验证输出文件

完成后：
- [ ] 运行分析脚本
- [ ] 检查统计信息
- [ ] 人工审查样本
- [ ] 验证数据质量

---

## 🎉 快速命令备忘单

```bash
# 快速测试（无需模型）
./quick_test.sh

# 完整流程（需要模型）
./run_dpo_generation.sh --model /path/to/model --yes

# 监控进度
./monitor_progress.sh

# 分析结果
./analyze_output.sh

# 查看日志
tail -f dpo_generation_*.log

# 检查输出
ls -lh /jfan5/dpo_data-1206/

# 查看统计
cat /jfan5/dpo_data-1206/stats.json | jq
```

---

**享受自动化！** 🚀
