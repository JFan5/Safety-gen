# SafePilot - Local Model Integration

SafePilot 是一个基于本地 LLM 的 PDDL3 规划系统，支持迭代式计划生成与验证。通过 VAL 验证器提供反馈，实现自动化的计划修正循环。

## 概述

SafePilot 将 OpenAI API 调用替换为本地模型推理，支持：
- 4 个规划域：BlocksWorld、Ferry、Grippers、Spanner
- 基于 VAL 的计划验证
- 迭代式反馈修正（最多 N 次重试）
- 完整的运行记录和结果输出

## 快速开始

### 基本用法

```bash
python SafePilot/src/safepilot/run_safepilot.py \
    --model runs/grpo/grpo_qwen3-14b-curriculum_v2-all-0111-stl_20260111_015253_seed3407/model \
    --domain blocksworld \
    --max-retries 5
```

### 完整参数

```bash
python SafePilot/src/safepilot/run_safepilot.py \
    --model <model_path> \
    --domain {blocksworld,ferry,grippers,spanner,delivery} \
    --max-retries 5 \
    --max-problems 10 \
    --family qwen \
    --temperature 0.6 \
    --max-new-tokens 512 \
    --output-dir runs/safepilot \
    --load-in-4bit
```

## CLI 参数说明

### 模型参数

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `--model` | str | 必填 | 本地模型路径（HuggingFace 或本地 LoRA adapter） |
| `--family` | str | qwen | 模型家族：`qwen`, `mistral`, `llama` |
| `--load-in-4bit` | flag | True | 使用 4-bit 量化加载模型 |
| `--no-load-in-4bit` | flag | - | 禁用 4-bit 量化 |

### 域参数

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `--domain` | str | 必填 | 规划域名称 |
| `--domain-file` | str | - | 自定义域文件路径（覆盖 --domain） |
| `--problems-dir` | str | - | 自定义问题目录（覆盖 --domain） |

### 执行参数

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `--max-retries` | int | 5 | 每个问题最大重试次数 |
| `--max-problems` | int | 0 | 最大评估问题数（0 为全部） |
| `--temperature` | float | 0.6 | 生成温度 |
| `--max-new-tokens` | int | 512 | 每次生成的最大 token 数 |

### 输出参数

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `--output-dir` | str | runs/safepilot | 结果输出目录 |

## 支持的规划域

| 域名 | 约束类型 | 难度 |
|------|----------|------|
| blocksworld | `sometime-before` | 中等 |
| ferry | `sometime-before` | 中等 |
| grippers | `always-not` | 中等 |
| spanner | `always-imply`, `at-most-once` | 困难 |
| delivery | `always-not` (复合) | 非常困难 |

## 输出结构

运行完成后，结果保存在以下目录结构中：

```
runs/safepilot/
└── safepilot_{domain}_{timestamp}/
    ├── config.yaml      # 运行配置快照
    ├── run.json         # 元数据和汇总统计
    └── results.json     # 每个问题的详细结果
```

### run.json 结构

```json
{
  "run_id": "safepilot_blocksworld_20260123_143526",
  "timestamp": "2026-01-23T14:35:26",
  "model_path": "/path/to/model",
  "domain": "blocksworld",
  "config": {
    "max_retries": 5,
    "temperature": 0.6,
    "family": "qwen"
  },
  "summary": {
    "total_problems": 50,
    "success_count": 42,
    "success_rate": 84.0,
    "avg_retries": 1.3,
    "category_counts": {
      "success_plans": 42,
      "precondition_violation": 3,
      "safety_constraints_violation": 2,
      "goal_not_satisfied": 1,
      "plan_format_error": 2
    },
    "category_rates": {
      "success_plans": 84.0,
      "precondition_violation": 6.0,
      "safety_constraints_violation": 4.0,
      "goal_not_satisfied": 2.0,
      "plan_format_error": 4.0
    }
  }
}
```

### results.json 结构

```json
{
  "problems": [
    {
      "problem_name": "bw_ops3_n3_seed118",
      "problem_file": "/path/to/problem.pddl",
      "success": true,
      "final_plan": "(unstack b3 b2)\n(putdown b3)\n...",
      "actual_retries": 2,
      "max_retries": 5,
      "category": "success_plans",
      "attempts": [
        {
          "attempt": 1,
          "plan": "...",
          "is_valid": false,
          "category": "precondition_violation",
          "message": "Precondition violation: ...",
          "validation_stdout": "..."
        },
        {
          "attempt": 2,
          "plan": "...",
          "is_valid": true,
          "category": "success_plans",
          "message": "Plan valid",
          "validation_stdout": "..."
        }
      ]
    }
  ]
}
```

## 核心模块 API

### LocalLlm

本地模型推理封装类。

```python
from SafePilot.src.safepilot.local_llm import LocalLlm

# 初始化
llm = LocalLlm(
    model_path="runs/grpo/.../model",
    family="qwen",           # qwen, mistral, llama
    max_seq_length=5000,
    load_in_4bit=True
)

# 生成计划
plan, history = llm.call(
    prompt="...",
    temperature=0.6,
    max_new_tokens=512
)

# 重置对话历史
llm.reset_conversation()
```

### PDDLVerifier

基于 VAL 的计划验证器。

```python
from SafePilot.src.safepilot.pddl_verifier import PDDLVerifier

# 初始化
verifier = PDDLVerifier(
    domain_file="pddl3/blocksworld/domain3.pddl",
    problem_file="pddl3/blocksworld/testing_problem50/problem1.pddl"
)

# 验证计划
is_valid, category, message, details = verifier.verify(plan_text)
# category: success_plans, precondition_violation, safety_constraints_violation,
#           goal_not_satisfied, plan_format_error

# 获取重试反馈
feedback = verifier.get_feedback(category, details["stdout"])
```

### Domain Configuration

域配置工具。

```python
from SafePilot.src.safepilot.domain_config import (
    DOMAINS,
    get_domain_config,
    resolve_domain_paths,
    list_domains
)

# 列出所有域
print(list_domains())  # ['blocksworld', 'ferry', 'grippers', 'spanner', 'delivery']

# 获取域配置
config = get_domain_config('blocksworld')
# {'domain': 'pddl3/blocksworld/domain3.pddl', 'problems': '...', 'description': '...'}

# 解析为绝对路径
paths = resolve_domain_paths('blocksworld')
# {'domain': Path(...), 'problems': Path(...), 'description': '...'}
```

## 迭代修正流程

SafePilot 使用以下迭代修正流程：

```
┌─────────────────────────────────────────────────────────┐
│  1. 构建初始 Prompt（域 + 问题）                          │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│  2. LLM 生成计划                                         │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│  3. VAL 验证计划                                         │
└─────────────────────────────────────────────────────────┘
                          │
              ┌───────────┴───────────┐
              │                       │
              ▼                       ▼
        ┌──────────┐           ┌──────────────┐
        │  有效    │           │    无效      │
        └──────────┘           └──────────────┘
              │                       │
              ▼                       ▼
        ┌──────────┐           ┌──────────────┐
        │  返回    │           │ 生成反馈     │
        │  成功    │           │ Prompt       │
        └──────────┘           └──────────────┘
                                      │
                                      ▼
                              ┌──────────────┐
                              │ 重试次数 <   │──否──▶ 返回失败
                              │ max_retries? │
                              └──────────────┘
                                      │是
                                      ▼
                                返回步骤 2
```

### 反馈类型

| 错误类型 | 反馈内容 |
|----------|----------|
| precondition_violation | 指出失败的动作和未满足的前置条件 |
| safety_constraints_violation | 提示检查 PDDL3 约束（always, always-not 等） |
| goal_not_satisfied | 提示计划未达到目标状态 |
| plan_format_error | 提示格式要求（每行一个动作，括号格式） |

## 与 evaluate_llm_solver.py 的对比

| 特性 | evaluate_llm_solver.py | run_safepilot.py |
|------|------------------------|------------------|
| 重试机制 | 无 | 有（最多 N 次） |
| 反馈生成 | 无 | 有（基于错误类型） |
| 对话历史 | 无 | 有（累积上下文） |
| 输出结构 | 单一 JSON | run.json + results.json |
| 主要用途 | 批量评估 | 迭代式规划 |

## 示例

### 示例 1：单域评估

```bash
python SafePilot/src/safepilot/run_safepilot.py \
    --model /jfan5/grpo_models/qwen3-14b-curriculum_v2-all-0111-stl-1000 \
    --domain blocksworld \
    --max-retries 5 \
    --max-problems 50
```

### 示例 2：自定义域文件

```bash
python SafePilot/src/safepilot/run_safepilot.py \
    --model /path/to/model \
    --domain blocksworld \
    --domain-file /custom/path/domain.pddl \
    --problems-dir /custom/path/problems/ \
    --max-retries 3
```

### 示例 3：使用 Mistral 模型

```bash
python SafePilot/src/safepilot/run_safepilot.py \
    --model runs/grpo/mistral-7b-model \
    --domain ferry \
    --family mistral \
    --temperature 0.7
```

## 依赖

- `unsloth`: 模型加载和推理
- `torch`: 深度学习框架
- `pyyaml`: 配置文件处理
- VAL: PDDL 验证器（需要预装并在 PATH 中）

## 文件结构

```
SafePilot/src/safepilot/
├── __init__.py          # 模块导出
├── local_llm.py         # 本地模型封装
├── pddl_verifier.py     # VAL 验证器封装
├── domain_config.py     # 域配置
├── run_safepilot.py     # 主 CLI 脚本
├── llm_api.py           # 原 OpenAI API（保留）
├── ltl_verifier.py      # LTL 验证器（保留）
└── fol_verifier.py      # FOL 验证器（保留）
```

## 注意事项

1. **模型路径**: 支持 HuggingFace 模型名称或本地 LoRA adapter 路径
2. **VAL 安装**: 确保 VAL 验证器已安装并可通过 `Validate` 命令访问
3. **GPU 内存**: 4-bit 量化模式下，14B 模型约需 12GB 显存
4. **重试次数**: 建议设置 3-5 次，过多重试可能导致模型陷入错误模式
