#!/usr/bin/env python3
"""
Generic PDDL Plan Evaluator
通过命令行显式指定 domain 文件与 problems 目录，评测模型生成计划并用 VAL 验证。
输出结果保存为 JSON 与 .soln 计划文本。
"""
import os
import json
import random
import shutil
import subprocess
import tempfile
from pathlib import Path
from unsloth import FastLanguageModel
import torch
from datetime import datetime
import re
from typing import Optional
from utils import _classify_result, validate_solution
# 配置参数
# input and output length
max_seq_length = 5000
# output length
MAX_NEW_TOKENS = 512
dtype = None




# 模型家族映射
MODEL_FAMILY_MAP = {
    'mistral': 'mistral',
    'llama': 'llama', 
    'phi': 'phi',
    'qwen': 'qwen',
    'gemma': 'gemma',
    'gpt': 'gpt'  # GPT模型使用mistral格式
}

def template_input(prompt, rich=False):
    """创建输入模板"""
    if rich:
        return [{"role": "user", "content": [{"type": "text", "text": prompt}]}]
    return [{"role": "user", "content": prompt}]

def extract_llm_output(output, family='mistral'):
    """从模型输出中提取LLM生成的部分，不做action提取"""
    if output is None:
        return ""
    text = output.strip()

    # 处理Mistral格式的输出
    if '[/INST]' in text or family == 'mistral':
        parts = text.split('[/INST]')
        if len(parts) > 1:
            text = parts[-1].strip()
        else:
            text = text.strip()
        if text.endswith('</s>'):
            text = text[:-4].strip()

    # 处理ChatML格式（如部分GPT开源模型）
    if '<|im_start|>' in text:
        segments = text.split('<|im_start|>')
        for segment in reversed(segments):
            seg = segment.strip()
            if not seg:
                continue
            if seg.startswith('assistant'):
                seg = seg[len('assistant'):].lstrip(' :\n')
                if '<|im_end|>' in seg:
                    seg = seg.split('<|im_end|>', 1)[0]
                text = seg.strip()
                break
        else:
            if '<|im_end|>' in text:
                text = text.split('<|im_end|>', 1)[0].strip()

    # 处理包含 assistant 关键字的通用格式
    elif 'assistant' in text and not text.startswith('assistant'):
        parts = text.split('assistant')
        text = parts[-1].lstrip(':').strip()

    # 移除特殊通道标记（支持 ASCII 与全角竖线，例如 <|im_start|> 或 <｜User｜>）
    text = re.sub(r'<[|｜][^>]+[|｜]>', '', text)

    # 移除 DeepSeek 等模型输出中的思维链标签
    text = re.sub(r'<think>.*?</think>', '', text, flags=re.DOTALL | re.IGNORECASE)
    text = re.sub(r'</?think>', '', text, flags=re.IGNORECASE)

    text = text.strip()

    # 移除可能残留的通道前缀
    text = re.sub(r'^(assistant|final|assistant_final)\s*[:\-]*', '', text, flags=re.IGNORECASE).lstrip()

    # 移除Phi等模板遗留的管道分隔符（例如输出以 "|>" 开头）
    text = re.sub(r'^\|>\s*', '', text)

    # 特殊处理 qwen 模型：检测并移除 <think> 标签
    if family == 'qwen':
        text = re.sub(r'<think>.*?</think>', '', text, flags=re.DOTALL | re.IGNORECASE).strip()

    # 只保留末尾连续的计划行（形如 "(action obj1 obj2)"）
    plan_line_pattern = re.compile(r'^\([^\s()]+(?: [^\s()]+)*\)$')
    lines = [line.strip() for line in text.splitlines()]
    trailing_plan_lines = []
    for line in reversed(lines):
        if not line:
            if trailing_plan_lines:
                break
            continue
        if plan_line_pattern.match(line):
            trailing_plan_lines.append(line)
        elif trailing_plan_lines:
            break
    if trailing_plan_lines:
        text = "\n".join(reversed(trailing_plan_lines))
    else:
        text = "\n".join(line for line in lines if line)
    
    return text



def _looks_like_valid_plan(plan_text: str) -> bool:
    """判断文本是否符合纯计划输出格式。"""
    lines = [line.strip() for line in plan_text.splitlines() if line.strip()]
    if not lines:
        return False
    return all(line.startswith("(") and line.endswith(")") for line in lines)


def _infer_scenario_name(problems_dir: str, domain_file: str) -> Optional[str]:
    """从路径推断 scenario 名称"""
    path_str = (problems_dir + " " + domain_file).lower()
    scenarios = ["blocksworld", "spanner", "ferry", "grippers", "grid", "delivery", "logistics", "rovers", "miconic"]
    for scenario in scenarios:
        if scenario in path_str:
            return scenario
    return None


def _load_one_shot_example(scenario: str, repo_root: Path = None) -> Optional[dict]:
    """加载 one-shot example 文件"""
    if repo_root is None:
        repo_root = Path(__file__).parent.parent
    
    example_dir = repo_root / "one_shot_example" / scenario
    if not example_dir.exists():
        print(f"Warning: One-shot example directory not found: {example_dir}")
        return None
    
    example_files = {
        'domain': example_dir / "domain.pddl",
        'problem': example_dir / "problem.pddl",
        'solution': example_dir / "solution.soln"
    }
    
    example_content = {}
    for key, file_path in example_files.items():
        if not file_path.exists():
            print(f"Warning: One-shot example file not found: {file_path}")
            return None
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                example_content[key] = f.read()
        except Exception as e:
            print(f"Error reading one-shot example file {file_path}: {e}")
            return None
    
    return example_content





# 场景相关逻辑已移除

def _load_problems_from_dir(problems_dir: str, domain_file: str, one_shot: bool = False) -> list:
    """
    从指定目录加载所有 problem PDDL 文件，并使用提供的 domain 文件构建测试样本。
    会跳过名称包含 "domain" 的文件。
    
    Args:
        problems_dir: 包含 problem 文件的目录
        domain_file: domain 文件路径
        one_shot: 是否使用 one-shot 模式
    """
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
    # 过滤掉 domain 文件
    pddl_files = [f for f in pddl_files if 'domain' not in f.name.lower()]

    if not pddl_files:
        print(f"No problem files found in {problems_dir}")
        return []

    # 加载 prompt 模板
    prompt_template_file = 'prompt_oneshot.txt' if one_shot else 'prompt.txt'
    try:
        with open(prompt_template_file, 'r', encoding='utf-8') as f:
            prompt_template = f.read()
        # 如果文件是 Python f-string 格式（以 prompt = f""" 开头），需要提取模板内容
        if prompt_template.startswith('prompt = f"""'):
            # 移除开头的 prompt = f""" 和结尾的 """
            prompt_template = prompt_template.replace('prompt = f"""', '', 1)
            if prompt_template.endswith('"""'):
                prompt_template = prompt_template[:-3]
            prompt_template = prompt_template.strip()
    except Exception as e:
        print(f"Error reading {prompt_template_file}: {e}")
        prompt_template = "{problem_content}"

    # 如果使用 one-shot 模式，加载 example
    example_content = None
    if one_shot:
        scenario = _infer_scenario_name(problems_dir, domain_file)
        if scenario:
            print(f"Inferred scenario: {scenario}")
            example_content = _load_one_shot_example(scenario)
            if example_content:
                print(f"Loaded one-shot example for scenario: {scenario}")
            else:
                print(f"Warning: Failed to load one-shot example for scenario: {scenario}")
        else:
            print(f"Warning: Could not infer scenario name from paths, one-shot example will not be included")

    for pddl_file in pddl_files:
        problem_name = pddl_file.stem
        try:
            with open(pddl_file, 'r', encoding='utf-8') as f:
                problem_content = f.read()
        except Exception as e:
            print(f"Error reading {pddl_file}: {e}")
            continue
        
        # 构建 prompt
        if one_shot and example_content:
            # 构建包含 example 的 prompt
            example_text = f"""
DOMAIN:
{example_content['domain']}

PROBLEM:
{example_content['problem']}

### Plan:
{example_content['solution']}
"""
            # 使用 format 替换 {example_content}, {domain_content} 和 {problem_content}
            prompt = prompt_template.format(
                domain_content=domain_content,
                problem_content=problem_content,
                example_content=example_text
            )
        else:
            # 普通模式
            prompt = prompt_template.format(domain_content=domain_content, problem_content=problem_content)
        
        test_data.append({
            'problem_name': problem_name,
            'problem_file': str(pddl_file),
            'prompt': prompt,
            'problem_content': problem_content
        })
    return test_data

def test_model_on_testing_data(model_path,
                              output_file="test_results.json", family='mistral', 
                              max_problems: int = 0, results_dir=None,
                              problems_dir: str = None, domain_file: str = None,
                              load_in_4bit: bool = True, temperature: float = 0.1,
                              one_shot: bool = False):
    """
    在testing数据上测试模型并计算成功率
    
    Args:
        model_path: 模型路径
        scenarios: 要测试的场景列表
        output_file: 输出JSON文件路径（会自动添加时间戳）
        family: 模型家族
        max_problems_per_scenario: 每个场景最大问题数量
        results_dir: 结果保存目录（已废弃，不再使用）
        temperature: 文本生成的温度参数（默认: 0.1）
    """
    print(f"Testing model: {model_path}")
    print(f"Problems dir: {problems_dir}")
    print(f"Domain file: {domain_file}")
    print(f"Max problems: {max_problems}")
    print(f"Output: {output_file}")
    
    # 自动检测模型家族
    if family == 'auto':
        model_name_lower = model_path.lower()
        for model_type, model_family in MODEL_FAMILY_MAP.items():
            if model_type in model_name_lower:
                family = model_family
                break
        else:
            family = 'mistral'  # 默认使用mistral格式
        print(f"Auto-detected model family: {family}")
    
    # 不再创建结果保存目录，直接保存JSON文件
    # 加载测试数据（需要显式提供 problems_dir 与 domain_file）
    if not problems_dir or not domain_file:
        print("--problems-dir 和 --domain-file 都是必需参数。")
        return
    
    if one_shot:
        print("Using one-shot mode with examples")
    
    test_data = _load_problems_from_dir(problems_dir, domain_file, one_shot=one_shot)
    if max_problems and max_problems > 0 and len(test_data) > max_problems:
        random.seed(42)
        test_data = random.sample(test_data, max_problems)
    
    if not test_data:
        print("No testing data found!")
        return
    
    print(f"Loaded {len(test_data)} problems for testing")
    
    # 加载模型
    print("Loading model...")
    try:
        model, tokenizer = FastLanguageModel.from_pretrained(
            model_name=model_path,
            max_seq_length=max_seq_length,
            dtype=dtype,
            load_in_4bit=load_in_4bit,
        )
    except ValueError as e:
        if "GPU RAM" in str(e):
            print("GPU RAM insufficient, trying with CPU offload...")
            try:
                model, tokenizer = FastLanguageModel.from_pretrained(
                    model_name=model_path,
                    max_seq_length=max_seq_length,
                    dtype=dtype,
                    load_in_4bit=load_in_4bit,
                    llm_int8_enable_fp32_cpu_offload=True,
                    device_map="auto"
                )
            except Exception as e2:
                print("CPU offload failed, trying 8-bit quantization...")
                model, tokenizer = FastLanguageModel.from_pretrained(
                    model_name=model_path,
                    max_seq_length=max_seq_length,
                    dtype=dtype,
                    load_in_8bit=True,
                    device_map="auto"
                )
        else:
            raise e
    
    FastLanguageModel.for_inference(model)
    
    # 测试结果
    results = []
    total_count = len(test_data)
    # 分类统计
    category_counts = {
        "success_plans": 0,
        "plan_format_error": 0,
        "precondition_violation": 0,
        "safety_constraints_violation": 0,
        "goal_not_satisfied": 0,
    }
    
    for i, sample in enumerate(test_data, 1):
        print(f"\n--- Test {i}/{total_count} ---")
        print(f"Problem: {sample['problem_name']}")
        
        # 生成解决方案
        messages = template_input(sample['prompt'])
        try:
            inputs = tokenizer.apply_chat_template(
                messages, 
                tokenize=True, 
                add_generation_prompt=True, 
                return_tensors="pt",
                enable_thinking=False,
            )
        except TypeError:
            messages = template_input(sample['prompt'], rich=True)
            inputs = tokenizer.apply_chat_template(
                messages,
                tokenize=True,
                add_generation_prompt=True,
                return_tensors="pt",
                enable_thinking=False,
            )
        
        # 确保输入张量在正确的设备上
        if hasattr(model, 'device'):
            inputs = inputs.to(model.device)
        else:
            # 如果模型没有device属性，尝试获取第一个参数的设备
            try:
                device = next(model.parameters()).device
                inputs = inputs.to(device)
            except StopIteration:
                pass  # 如果无法确定设备，保持原样
            except Exception:
                pass
        
        cfg = {
            'do_sample': True,
            'temperature': temperature,
            'top_p': 0.9,
        }
        
        generation_error = None
        output = ""
        try:
            pad_token_id = getattr(tokenizer, "eosf_token_id", None)
            if pad_token_id is None:
                pad_token_id = getattr(tokenizer, "eos_token_id", None)
            if pad_token_id is None:
                pad_token_id = getattr(tokenizer, "pad_token_id", None)

            with torch.no_grad():
                outputs = model.generate(
                    input_ids=inputs,
                    max_new_tokens=MAX_NEW_TOKENS,
                    pad_token_id=pad_token_id,
                    **cfg
                )
            output = tokenizer.batch_decode(outputs, skip_special_tokens=False)[0]
        except torch.cuda.OutOfMemoryError as e:
            generation_error = f"CUDA Out of Memory: {str(e)}"
            print(generation_error)
            torch.cuda.empty_cache()
        except RuntimeError as e:
            if "out of memory" in str(e).lower():
                generation_error = f"Runtime Out of Memory: {str(e)}"
                print(generation_error)
                torch.cuda.empty_cache()
            else:
                generation_error = f"Runtime Error: {str(e)}"
                print(generation_error)
        except Exception as e:
            generation_error = f"Generation Error: {str(e)}"
            print(generation_error)
        
        raw_solution = extract_llm_output(output, family) if output else ""
    
        # 在终端打印LLM的完整输出
        print(f"\n{'='*80}")
        print("LLM FULL OUTPUT:")
        print(f"{'='*80}")
        print(output)
        print(f"{'='*80}\n")
        
        if raw_solution:
            print("Parsed plan:")
            print(raw_solution)

        # 问题文件路径
        problem_file = sample.get('problem_file')
        
        # 验证解决方案（使用LLM输出）
        validation_message = ""
        validation_stdout = ""
        validation_stderr = ""
        category = ""
        
        if generation_error:
            # 如果生成时出现错误，跳过验证
            category = "generation_error"
            validation_message = f"Generation failed: {generation_error}"
            val_cmd = ""
        elif problem_file and Path(problem_file).exists():
            # 使用命令行提供的 domain_file 进行验证
            if raw_solution.strip():
                valid, message, stdout, stderr, val_cmd = validate_solution(domain_file, problem_file, raw_solution)
                validation_message = message
                validation_stdout = stdout
                validation_stderr = stderr
                
                # 检查 plan_text 格式
                if not _looks_like_valid_plan(raw_solution):
                    category = "plan_format_error"
                else:
                    # 根据 stdout 分类
                    category = _classify_result(stdout)
            else:
                category = "plan_format_error"
                validation_message = "Empty solution generated"
                val_cmd = ""
        else:
            category = "others"
            validation_message = f"Problem file not found: {problem_file}"
            val_cmd = ""
        
        # 更新分类统计
        if category in category_counts:
            category_counts[category] += 1
        else:
            category_counts["others"] += 1
        
        is_valid = (category == "success_plans")

        # 不再保存单独的solution文件
        
        # 记录结果
        result = {
            'index': i,
            'problem_name': sample['problem_name'],
            'problem_file': problem_file,
            'is_valid': is_valid,
            'category': category,
            'validation_message': validation_message,
            'validation_stdout': validation_stdout,
            'validation_stderr': validation_stderr,
            'validation_cmd': val_cmd,
            'raw_solution': raw_solution,
            'generation_error': generation_error,
            'ground_truth': sample.get('path', '')
        }
        
        results.append(result)
        
        # 打印分类结果
        category_display = {
            "success_plans": "✓ Success",
            "plan_format_error": "✗ Plan Format Error",
            "precondition_violation": "✗ Precondition Violation",
            "safety_constraints_violation": "✗ Safety Constraints Violation",
            "goal_not_satisfied": "✗ Goal Not Satisfied",
            "others": "✗ Others",

        }
        print(f"{category_display.get(category, '✗ Unknown')}: {category}")
        
        # 实时显示分类统计
        success_count = category_counts["success_plans"]
        current_success_rate = (success_count / i) * 100
        print(f"Current success rate: {current_success_rate:.1f}% ({success_count}/{i})")
        print(f"Category breakdown: {dict(category_counts)}")
    
    # 计算最终成功率
    success_count = category_counts["success_plans"]
    final_success_rate = (success_count / total_count) * 100 if total_count > 0 else 0
    
    # 自动生成输出文件名并加上时间戳
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    timestamp_iso = datetime.now().isoformat()
    
    # 处理输出文件名，添加时间戳和 oneshot 后缀（如果使用 one-shot 模式）
    output_file_path = Path(output_file)
    if output_file == "test_results.json":
        # 如果使用默认文件名，生成带时间戳的文件名
        model_name_clean = model_path.replace('/', '_').replace('\\', '_')
        suffix = "_oneshot" if one_shot else ""
        output_file_path = Path(f"evaluation_summary_{model_name_clean}{suffix}_{timestamp}.json")
    else:
        # 如果指定了自定义文件名，在文件名中插入时间戳和 oneshot 后缀
        # 保留原始路径（如果有）
        parent_dir = output_file_path.parent
        stem = output_file_path.stem
        suffix = output_file_path.suffix if output_file_path.suffix else ".json"
        oneshot_suffix = "_oneshot" if one_shot else ""
        if parent_dir and str(parent_dir) != ".":
            output_file_path = parent_dir / f"{stem}{oneshot_suffix}_{timestamp}{suffix}"
        else:
            output_file_path = Path(f"{stem}{oneshot_suffix}_{timestamp}{suffix}")
    
    output_data = {
        'timestamp': timestamp_iso,
        'model_path': model_path,
        'problems_dir': str(problems_dir),
        'domain_file': str(domain_file),
        'max_problems': max_problems,
        'load_in_4bit': load_in_4bit,
        'one_shot': one_shot,
        'total_tests': total_count,
        'success_count': success_count,
        'success_rate': final_success_rate,
        'category_counts': category_counts,
        'category_rates': {k: (v / total_count * 100) if total_count > 0 else 0 
                          for k, v in category_counts.items()},
        'results': results
    }
    
    with open(output_file_path, 'w', encoding='utf-8') as f:
        json.dump(output_data, f, indent=2, ensure_ascii=False)
    
    print(f"\n" + "="*60)
    print(f"FINAL RESULTS")
    print(f"="*60)
    print(f"Total tests: {total_count}")
    print(f"Success plans: {success_count}")
    print(f"Success rate: {final_success_rate:.1f}%")
    print(f"\nCategory Breakdown:")
    for category, count in category_counts.items():
        rate = (count / total_count * 100) if total_count > 0 else 0
        print(f"  {category}: {count} ({rate:.1f}%)")
    print(f"\nResults saved to: {output_file_path}")

def main():
    """主函数"""
    import argparse
    
    parser = argparse.ArgumentParser(description="Evaluate PDDL model with explicit domain and problems directory")
    parser.add_argument("--model", type=str, required=True,
                       help="Path to model (e.g., unsloth fine-tuned)")
    parser.add_argument("--output", type=str, default="test_results.json",
                       help="Output JSON file name (saved in results directory)")
    parser.add_argument("--family", choices=["mistral", "llama", "phi", "qwen", "gemma", "gpt", "auto"], 
                       default="auto", help="Model family (auto for automatic detection)")
    parser.add_argument("--max-problems", type=int, default=0,
                       help="Maximum number of problems to test (0 for all)")
    parser.add_argument("--results-dir", help="结果保存目录（已废弃，不再使用）")
    parser.add_argument("--problems-dir", type=str, required=True,
                       help="包含多个 problem PDDL 的目录")
    parser.add_argument("--domain-file", type=str, required=True,
                       help="对应的 domain PDDL 文件路径")
    parser.add_argument("--load-in-4bit", dest='load_in_4bit', action='store_true',
                       help="Load model in 4-bit quantization (default: True)")
    parser.add_argument("--no-load-in-4bit", dest='load_in_4bit', action='store_false',
                       help="Disable 4-bit quantization")
    parser.set_defaults(load_in_4bit=True)
    parser.add_argument("--temperature", type=float, default=0.1,
                       help="Temperature for text generation (default: 0.1)")
    parser.add_argument("--one-shot", dest='one_shot', action='store_true',
                       help="Use one-shot mode with examples from one_shot_example folder (default: False)")
    parser.add_argument("--no-one-shot", dest='one_shot', action='store_false',
                       help="Disable one-shot mode (default)")
    parser.set_defaults(one_shot=False)
    
    args = parser.parse_args()
    
    test_model_on_testing_data(
        args.model, 
        args.output, 
        args.family, 
        args.max_problems,
        args.results_dir,
        problems_dir=args.problems_dir,
        domain_file=args.domain_file,
        load_in_4bit=args.load_in_4bit,
        temperature=args.temperature,
        one_shot=args.one_shot
    )

if __name__ == "__main__":
    main()
