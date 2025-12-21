#!/usr/bin/env python3
"""
GPT-OSS PDDL Plan Evaluator
专门针对 gpt-oss-20b 等 GPT-OSS 系列模型的评估脚本。
支持 Reasoning Effort (low/medium/high) 配置。

使用示例:
python script/gpt-oss/evaluate_gpt_oss.py \
    --model unsloth/gpt-oss-20b-unsloth-bnb-4bit \
    --problems-dir pddl3/spanner/testing_problems3_hard \
    --domain-file pddl3/spanner/domain.pddl \
    --reasoning high \
    --max-problems 10
"""
import os
import sys
import json
import random
import shutil
import subprocess
import tempfile
from pathlib import Path
from unsloth import FastLanguageModel
import torch
from datetime import datetime
import time
import re
from typing import Optional
from collections import defaultdict

# 添加父目录到路径以导入 utils
sys.path.insert(0, str(Path(__file__).parent.parent))
from utils import _classify_result, validate_solution

# 配置参数
max_seq_length = 5000
MAX_NEW_TOKENS = 2048  # GPT-OSS 需要更多 tokens 用于推理
dtype = None


def extract_gpt_oss_output(output: str, extract_reasoning: bool = False) -> tuple:
    """
    从 GPT-OSS 模型输出中提取最终计划。

    GPT-OSS 输出格式:
    - 推理部分以 "analysis" 开头
    - 最终答案以 "assistantfinal" 标记

    Args:
        output: 模型的原始输出
        extract_reasoning: 是否同时返回推理过程

    Returns:
        如果 extract_reasoning=False: 返回计划文本
        如果 extract_reasoning=True: 返回 (计划文本, 推理过程)
    """
    if output is None:
        return ("", "") if extract_reasoning else ""

    text = output.strip()
    reasoning = ""
    plan_text = ""

    # 提取 assistantfinal 之后的内容作为最终答案
    if "assistantfinal" in text.lower():
        parts = re.split(r'assistantfinal', text, flags=re.IGNORECASE)
        if len(parts) > 1:
            plan_text = parts[-1].strip()
            # 推理部分是 assistantfinal 之前的内容
            reasoning = parts[0].strip()
            # 移除推理部分开头的 "analysis" 标记
            reasoning = re.sub(r'^analysis\s*', '', reasoning, flags=re.IGNORECASE).strip()
    else:
        # 如果没有 assistantfinal 标记，尝试其他方式提取
        plan_text = text

    # 清理 plan_text
    # 移除特殊标记
    plan_text = re.sub(r'<[|｜][^>]+[|｜]>', '', plan_text)
    plan_text = re.sub(r'</?think>', '', plan_text, flags=re.IGNORECASE)
    plan_text = re.sub(r'<think>.*?</think>', '', plan_text, flags=re.DOTALL | re.IGNORECASE)

    # 移除可能的前缀
    plan_text = re.sub(r'^(assistant|final|assistant_final)\s*[:\-]*', '', plan_text, flags=re.IGNORECASE).strip()

    # 只保留计划行（形如 "(action obj1 obj2)"）
    plan_line_pattern = re.compile(r'^\([^\s()]+(?: [^\s()]+)*\)$')
    lines = [line.strip() for line in plan_text.splitlines()]
    plan_lines = []
    for line in lines:
        if line and plan_line_pattern.match(line):
            plan_lines.append(line)

    if plan_lines:
        plan_text = "\n".join(plan_lines)
    else:
        # 如果没找到标准格式的计划行，保留所有非空行
        plan_text = "\n".join(line for line in lines if line)

    if extract_reasoning:
        return plan_text, reasoning
    return plan_text


def _looks_like_valid_plan(plan_text: str) -> bool:
    """判断文本是否符合纯计划输出格式。"""
    lines = [line.strip() for line in plan_text.splitlines() if line.strip()]
    if not lines:
        return False
    return all(line.startswith("(") and line.endswith(")") for line in lines)


def _extract_size_key(problem_name: str, scenario: Optional[str] = None) -> Optional[str]:
    """从问题名称中提取规模标识"""
    name = problem_name.lower()

    if scenario == "delivery":
        m = re.search(r"size(\d+)[-_]?packages?(\d+)", name)
        if m:
            return f"s{int(m.group(1))}-p{int(m.group(2))}"
        m = re.search(r"s(\d+)[-_]?p(\d+)", name)
        if m:
            return f"s{m.group(1)}-p{m.group(2)}"

    if scenario == "blocksworld":
        m = re.search(r"ops(\d+).*n0*([0-9]+)", name)
        if m:
            return f"ops{int(m.group(1))}-n{int(m.group(2))}"

    if scenario == "ferry":
        m = re.search(r"l0*([0-9]+).*c0*([0-9]+)", name)
        if m:
            return f"l{int(m.group(1))}-c{int(m.group(2))}"

    if scenario == "spanner":
        m = re.search(r"s0*([0-9]+).*n0*([0-9]+).*l0*([0-9]+)", name)
        if m:
            return f"s{int(m.group(1))}-n{int(m.group(2))}-l{int(m.group(3))}"

    if scenario == "grippers":
        m = re.search(r"n0*([0-9]+).*r0*([0-9]+).*o0*([0-9]+)", name)
        if m:
            return f"n{int(m.group(1))}-r{int(m.group(2))}-o{int(m.group(3))}"

    # 通用兜底
    match = re.search(r"s(\d+)[_-]?p(\d+)", name, flags=re.IGNORECASE)
    if match:
        return f"s{match.group(1)}-p{match.group(2)}"
    return None


def _infer_scenario_name(problems_dir: str, domain_file: str) -> Optional[str]:
    """从路径推断 scenario 名称"""
    path_str = (problems_dir + " " + domain_file).lower()
    scenarios = ["blocksworld", "spanner", "ferry", "grippers", "grid", "delivery", "logistics", "rovers", "miconic"]
    for scenario in scenarios:
        if scenario in path_str:
            return scenario
    return None


def _load_problems_from_dir(problems_dir: str, domain_file: str) -> list:
    """从指定目录加载所有 problem PDDL 文件"""
    problems_path = Path(problems_dir)
    if not problems_path.exists():
        print(f"Problems directory not found: {problems_dir}")
        return []

    # 读取 domain 内容
    domain_content = ""
    if domain_file and Path(domain_file).exists():
        try:
            with open(domain_file, 'r', encoding='utf-8') as f:
                domain_content = f.read()
        except Exception as e:
            print(f"Error reading domain file {domain_file}: {e}")

    test_data = []
    pddl_files = sorted(problems_path.glob('*.pddl'))
    pddl_files = [f for f in pddl_files if 'domain' not in f.name.lower()]

    if not pddl_files:
        print(f"No problem files found in {problems_dir}")
        return []

    # 加载 prompt 模板
    prompt_template_file = Path(__file__).parent.parent.parent / 'prompt.txt'
    try:
        with open(prompt_template_file, 'r', encoding='utf-8') as f:
            prompt_template = f.read()
        if prompt_template.startswith('prompt = f"""'):
            prompt_template = prompt_template.replace('prompt = f"""', '', 1)
            if prompt_template.endswith('"""'):
                prompt_template = prompt_template[:-3]
            prompt_template = prompt_template.strip()
    except Exception as e:
        print(f"Error reading prompt.txt: {e}")
        prompt_template = "{problem_content}"

    for pddl_file in pddl_files:
        problem_name = pddl_file.stem
        try:
            with open(pddl_file, 'r', encoding='utf-8') as f:
                problem_content = f.read()
        except Exception as e:
            print(f"Error reading {pddl_file}: {e}")
            continue

        prompt = prompt_template.format(domain_content=domain_content, problem_content=problem_content)

        test_data.append({
            'problem_name': problem_name,
            'problem_file': str(pddl_file),
            'prompt': prompt,
            'problem_content': problem_content
        })
    return test_data


def test_gpt_oss_model(
    model_path: str,
    output_file: str = "test_results.json",
    max_problems: int = 0,
    problems_dir: str = None,
    domain_file: str = None,
    load_in_4bit: bool = True,
    temperature: float = 0.6,
    reasoning_effort: str = "high",
    no_timestamp: bool = False,
):
    """
    在 testing 数据上测试 GPT-OSS 模型并计算成功率

    Args:
        model_path: 模型路径 (如 unsloth/gpt-oss-20b-unsloth-bnb-4bit)
        output_file: 输出 JSON 文件路径
        max_problems: 最大问题数量
        problems_dir: 问题文件目录
        domain_file: domain 文件路径
        load_in_4bit: 是否使用 4bit 量化
        temperature: 温度参数
        reasoning_effort: 推理努力程度 ("low", "medium", "high")
        no_timestamp: 是否禁用时间戳后缀
    """
    print(f"="*60)
    print(f"GPT-OSS Model Evaluation")
    print(f"="*60)
    print(f"Model: {model_path}")
    print(f"Reasoning effort: {reasoning_effort}")
    print(f"Problems dir: {problems_dir}")
    print(f"Domain file: {domain_file}")
    print(f"Max problems: {max_problems}")
    print(f"Temperature: {temperature}")
    print(f"Load in 4bit: {load_in_4bit}")
    print(f"="*60)

    scenario_name = _infer_scenario_name(problems_dir, domain_file)
    if scenario_name:
        print(f"Detected scenario: {scenario_name}")
    else:
        print("Detected scenario: Unknown")

    # 加载测试数据
    if not problems_dir or not domain_file:
        print("--problems-dir 和 --domain-file 都是必需参数。")
        return

    test_data = _load_problems_from_dir(problems_dir, domain_file)
    if max_problems and max_problems > 0 and len(test_data) > max_problems:
        random.seed(42)
        test_data = random.sample(test_data, max_problems)

    if not test_data:
        print("No testing data found!")
        return

    print(f"Loaded {len(test_data)} problems for testing")

    # 开始计时
    total_start_time = time.time()

    # 加载模型
    print("\nLoading model...")
    model_load_start = time.time()

    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=model_path,
        max_seq_length=max_seq_length,
        dtype=dtype,
        load_in_4bit=load_in_4bit,
    )

    FastLanguageModel.for_inference(model)
    model_load_time = time.time() - model_load_start
    print(f"Model loaded in {model_load_time:.2f} seconds")

    # 构建带 reasoning effort 的系统提示
    system_prompt = f"You are a planning expert. Reasoning: {reasoning_effort}"
    print(f"System prompt: {system_prompt}")

    # 测试结果
    results = []
    total_count = len(test_data)
    category_counts = defaultdict(int)
    for k in ["success_plans", "plan_format_error", "precondition_violation",
              "safety_constraints_violation", "goal_not_satisfied", "generation_error", "others"]:
        category_counts[k] = 0
    size_stats = defaultdict(lambda: {"total": 0, "success": 0})

    total_generation_time = 0.0
    total_validation_time = 0.0
    inference_start_time = time.time()

    for i, sample in enumerate(test_data, 1):
        print(f"\n{'='*60}")
        print(f"Test {i}/{total_count} - Problem: {sample['problem_name']}")
        print(f"{'='*60}")
        size_key = _extract_size_key(sample['problem_name'], scenario_name)

        # 构建消息 (GPT-OSS 需要 system + user 格式)
        messages = [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": sample['prompt']},
        ]

        generation_error = None
        output = ""
        reasoning_text = ""
        gen_start = time.time()

        try:
            # 使用 chat template
            inputs = tokenizer.apply_chat_template(
                messages,
                tokenize=True,
                add_generation_prompt=True,
                return_tensors="pt"
            ).to(model.device)

            print(f"Input tokens: {inputs.shape[1]}")

            pad_token_id = getattr(tokenizer, "pad_token_id", None)
            if pad_token_id is None:
                pad_token_id = getattr(tokenizer, "eos_token_id", None)

            with torch.no_grad():
                outputs = model.generate(
                    input_ids=inputs,
                    max_new_tokens=MAX_NEW_TOKENS,
                    temperature=temperature,
                    do_sample=True if temperature > 0 else False,
                    top_p=0.9,
                    pad_token_id=pad_token_id,
                    use_cache=True,
                )

            # 只解码生成的部分
            generated_tokens = outputs[0][inputs.shape[1]:]
            output = tokenizer.decode(generated_tokens, skip_special_tokens=True)
            print(f"Generated tokens: {len(generated_tokens)}")

        except torch.cuda.OutOfMemoryError as e:
            generation_error = f"CUDA Out of Memory: {str(e)}"
            print(generation_error)
            torch.cuda.empty_cache()
        except Exception as e:
            generation_error = f"Generation Error: {str(e)}"
            print(generation_error)

        gen_time = time.time() - gen_start
        total_generation_time += gen_time
        print(f"Generation time: {gen_time:.2f}s")

        # 提取计划和推理过程
        raw_solution, reasoning_text = extract_gpt_oss_output(output, extract_reasoning=True)

        # 打印输出
        print(f"\n{'-'*40}")
        print("LLM OUTPUT:")
        print(f"{'-'*40}")
        if reasoning_text:
            print(f"[REASONING] {reasoning_text[:500]}..." if len(reasoning_text) > 500 else f"[REASONING] {reasoning_text}")
        print(f"\n[PLAN]\n{raw_solution}")
        print(f"{'-'*40}")

        # 验证解决方案
        problem_file = sample.get('problem_file')
        validation_message = ""
        validation_stdout = ""
        validation_stderr = ""
        category = ""
        val_start = time.time()

        if generation_error:
            category = "generation_error"
            validation_message = f"Generation failed: {generation_error}"
            val_cmd = ""
        elif problem_file and Path(problem_file).exists():
            if raw_solution.strip():
                valid, message, stdout, stderr, val_cmd = validate_solution(domain_file, problem_file, raw_solution)
                validation_message = message
                validation_stdout = stdout
                validation_stderr = stderr

                if not _looks_like_valid_plan(raw_solution):
                    category = "plan_format_error"
                else:
                    category = _classify_result(stdout)
            else:
                category = "plan_format_error"
                validation_message = "Empty solution generated"
                val_cmd = ""
        else:
            category = "others"
            validation_message = f"Problem file not found: {problem_file}"
            val_cmd = ""

        val_time = time.time() - val_start
        total_validation_time += val_time

        # 更新统计
        category_counts[category] += 1
        if size_key:
            size_stats[size_key]["total"] += 1
            if category == "success_plans":
                size_stats[size_key]["success"] += 1

        is_valid = (category == "success_plans")

        # 记录结果
        result = {
            'index': i,
            'problem_name': sample['problem_name'],
            'size_key': size_key,
            'scenario': scenario_name,
            'problem_file': problem_file,
            'is_valid': is_valid,
            'category': category,
            'validation_message': validation_message,
            'validation_stdout': validation_stdout,
            'validation_stderr': validation_stderr,
            'validation_cmd': val_cmd,
            'raw_solution': raw_solution,
            'reasoning': reasoning_text,
            'generation_error': generation_error,
        }

        results.append(result)

        # 打印结果
        category_display = {
            "success_plans": "✓ Success",
            "plan_format_error": "✗ Plan Format Error",
            "precondition_violation": "✗ Precondition Violation",
            "safety_constraints_violation": "✗ Safety Constraints Violation",
            "goal_not_satisfied": "✗ Goal Not Satisfied",
            "generation_error": "✗ Generation Error",
            "others": "✗ Others",
        }
        print(f"\nResult: {category_display.get(category, '✗ Unknown')}")

        success_count = category_counts["success_plans"]
        current_success_rate = (success_count / i) * 100
        print(f"Current success rate: {current_success_rate:.1f}% ({success_count}/{i})")

    # 计算最终结果
    success_count = category_counts["success_plans"]
    final_success_rate = (success_count / total_count) * 100 if total_count > 0 else 0
    size_success_rates = {}
    for key, stats in size_stats.items():
        total = stats["total"]
        succ = stats["success"]
        size_success_rates[key] = {
            "total": total,
            "success": succ,
            "success_rate": (succ / total * 100) if total > 0 else 0
        }

    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    timestamp_iso = datetime.now().isoformat()

    # 处理输出文件名
    output_file_path = Path(output_file)
    if not no_timestamp:
        if output_file == "test_results.json":
            model_name_clean = model_path.replace('/', '_').replace('\\', '_')
            output_file_path = Path(f"gpt_oss_eval_{model_name_clean}_{reasoning_effort}_{timestamp}.json")
        else:
            parent_dir = output_file_path.parent
            stem = output_file_path.stem
            suffix = output_file_path.suffix if output_file_path.suffix else ".json"
            if parent_dir and str(parent_dir) != ".":
                output_file_path = parent_dir / f"{stem}_{reasoning_effort}_{timestamp}{suffix}"
            else:
                output_file_path = Path(f"{stem}_{reasoning_effort}_{timestamp}{suffix}")

    # 时间统计
    inference_time = time.time() - inference_start_time
    total_time = time.time() - total_start_time
    avg_generation_time = total_generation_time / total_count if total_count > 0 else 0
    avg_validation_time = total_validation_time / total_count if total_count > 0 else 0

    output_data = {
        'timestamp': timestamp_iso,
        'model_path': model_path,
        'model_type': 'gpt-oss',
        'reasoning_effort': reasoning_effort,
        'scenario': scenario_name,
        'problems_dir': str(problems_dir),
        'domain_file': str(domain_file),
        'max_problems': max_problems,
        'load_in_4bit': load_in_4bit,
        'temperature': temperature,
        'max_new_tokens': MAX_NEW_TOKENS,
        'total_tests': total_count,
        'success_count': success_count,
        'success_rate': final_success_rate,
        'category_counts': dict(category_counts),
        'category_rates': {k: (v / total_count * 100) if total_count > 0 else 0
                          for k, v in category_counts.items()},
        'size_success_rates': size_success_rates,
        'timing': {
            'total_time_seconds': round(total_time, 2),
            'model_load_time_seconds': round(model_load_time, 2),
            'inference_time_seconds': round(inference_time, 2),
            'total_generation_time_seconds': round(total_generation_time, 2),
            'total_validation_time_seconds': round(total_validation_time, 2),
            'avg_generation_time_seconds': round(avg_generation_time, 2),
            'avg_validation_time_seconds': round(avg_validation_time, 2),
        },
        'results': results
    }

    # 确保目录存在
    try:
        output_file_path.parent.mkdir(parents=True, exist_ok=True)
    except Exception:
        pass

    with open(output_file_path, 'w', encoding='utf-8') as f:
        json.dump(output_data, f, indent=2, ensure_ascii=False)

    # 打印最终结果
    print(f"\n{'='*60}")
    print(f"FINAL RESULTS")
    print(f"{'='*60}")
    print(f"Model: {model_path}")
    print(f"Reasoning effort: {reasoning_effort}")
    print(f"Total tests: {total_count}")
    print(f"Success plans: {success_count}")
    print(f"Success rate: {final_success_rate:.1f}%")
    print(f"\nCategory Breakdown:")
    for category, count in category_counts.items():
        if count > 0:
            rate = (count / total_count * 100) if total_count > 0 else 0
            print(f"  {category}: {count} ({rate:.1f}%)")
    if size_success_rates:
        print(f"\nSuccess by Problem Size:")
        for size_key in sorted(size_success_rates.keys()):
            stats = size_success_rates[size_key]
            print(f"  {size_key}: {stats['success']}/{stats['total']} ({stats['success_rate']:.1f}%)")
    print(f"\nTiming:")
    print(f"  Total time: {total_time:.2f}s")
    print(f"  Avg generation time: {avg_generation_time:.2f}s")
    print(f"\nResults saved to: {output_file_path}")
    print(f"{'='*60}")


def main():
    """主函数"""
    import argparse

    parser = argparse.ArgumentParser(
        description="Evaluate GPT-OSS model on PDDL planning tasks",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Test with high reasoning effort
  python evaluate_gpt_oss.py \\
      --model unsloth/gpt-oss-20b-unsloth-bnb-4bit \\
      --problems-dir ../../pddl3/spanner/testing_problems3_hard \\
      --domain-file ../../pddl3/spanner/domain.pddl \\
      --reasoning high \\
      --max-problems 10

  # Test with medium reasoning effort
  python evaluate_gpt_oss.py \\
      --model unsloth/gpt-oss-20b-unsloth-bnb-4bit \\
      --problems-dir ../../pddl3/blocksworld/testing_problems3 \\
      --domain-file ../../pddl3/blocksworld/domain.pddl \\
      --reasoning medium
        """
    )

    parser.add_argument("--model", type=str,
                       default="unsloth/gpt-oss-20b-unsloth-bnb-4bit",
                       help="Model path (default: unsloth/gpt-oss-20b-unsloth-bnb-4bit)")
    parser.add_argument("--output", type=str, default="test_results.json",
                       help="Output JSON file name")
    parser.add_argument("--max-problems", type=int, default=0,
                       help="Maximum number of problems to test (0 for all)")
    parser.add_argument("--problems-dir", type=str, required=True,
                       help="Directory containing problem PDDL files")
    parser.add_argument("--domain-file", type=str, required=True,
                       help="Path to domain PDDL file")
    parser.add_argument("--load-in-4bit", dest='load_in_4bit', action='store_true',
                       help="Load model in 4-bit quantization (default: True)")
    parser.add_argument("--no-load-in-4bit", dest='load_in_4bit', action='store_false',
                       help="Disable 4-bit quantization")
    parser.set_defaults(load_in_4bit=True)
    parser.add_argument("--temperature", type=float, default=0.6,
                       help="Temperature for generation (default: 0.6)")
    parser.add_argument("--reasoning", type=str, default="high",
                       choices=["low", "medium", "high"],
                       help="Reasoning effort level (default: high)")
    parser.add_argument("--no-timestamp", action="store_true",
                       help="Do not append timestamp to output filename")

    args = parser.parse_args()

    test_gpt_oss_model(
        model_path=args.model,
        output_file=args.output,
        max_problems=args.max_problems,
        problems_dir=args.problems_dir,
        domain_file=args.domain_file,
        load_in_4bit=args.load_in_4bit,
        temperature=args.temperature,
        reasoning_effort=args.reasoning,
        no_timestamp=args.no_timestamp,
    )


if __name__ == "__main__":
    main()
