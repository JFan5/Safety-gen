#!/usr/bin/env python3
"""
Single Problem PDDL Plan Evaluator with Multiple Temperatures
测评单个问题，支持使用不同的 temperature 值进行多次测试。
输出结果保存为 JSON 与 .soln 计划文本。
"""
import os
import json
import shutil
import subprocess
import tempfile
from pathlib import Path
from unsloth import FastLanguageModel
import torch
from datetime import datetime
import re
from typing import List, Optional
from utils import _classify_result

# 配置参数
max_seq_length = 5000
MAX_NEW_TOKENS = 512
dtype = None

# 模型家族映射
MODEL_FAMILY_MAP = {
    'mistral': 'mistral',
    'llama': 'llama', 
    'phi': 'phi',
    'qwen': 'qwen',
    'gemma': 'gemma',
    'gpt': 'gpt'
}

def template_input(prompt, rich=False):
    """创建输入模板"""
    if rich:
        return [{"role": "user", "content": [{"type": "text", "text": prompt}]}]
    return [{"role": "user", "content": prompt}]

def extract_llm_output(output, family='mistral'):
    """从模型输出中提取LLM生成的部分"""
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

    # 处理ChatML格式
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

    # 移除特殊通道标记
    text = re.sub(r'<[|｜][^>]+[|｜]>', '', text)
    text = re.sub(r'<think>.*?</think>', '', text, flags=re.DOTALL | re.IGNORECASE)
    text = re.sub(r'</?think>', '', text, flags=re.IGNORECASE)
    text = text.strip()

    # 移除可能残留的通道前缀
    text = re.sub(r'^(assistant|final|assistant_final)\s*[:\-]*', '', text, flags=re.IGNORECASE).lstrip()
    text = re.sub(r'^\|>\s*', '', text)

    # 特殊处理 qwen 模型
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

def _resolve_validate_path():
    """Find a usable Validate binary."""
    candidates = [
        Path("/users/jfan5/VAL/build/bin/Validate"),
        Path.home() / "VAL/build/linux64/Release/bin/Validate",
        Path.home() / "VAL/build/linux64/debug/bin/Validate",
    ]
    for path in candidates:
        if path.exists():
            return str(path)
    found = shutil.which("Validate")
    if found:
        return found
    return "Validate"

def _looks_like_valid_plan(plan_text: str) -> bool:
    """判断文本是否符合纯计划输出格式。"""
    lines = [line.strip() for line in plan_text.splitlines() if line.strip()]
    if not lines:
        return False
    return all(line.startswith("(") and line.endswith(")") for line in lines)

def validate_solution(domain_file, problem_file, solution_text):
    """使用VAL验证器验证解决方案"""
    with tempfile.NamedTemporaryFile(mode='w', suffix='.soln', delete=False) as f:
        f.write(solution_text)
        solution_file = f.name
    
    try:
        val_path = _resolve_validate_path()
        cmd_list = [val_path, "-v", domain_file, problem_file, solution_file]
        cmd_str = ' '.join(cmd_list)
        result = subprocess.run(cmd_list, capture_output=True, text=True, timeout=30)
        
        if result.returncode == 0:
            output = result.stdout.lower()
            if "plan valid" in output or "successful plans" in output:
                return True, "Plan valid", result.stdout, result.stderr, cmd_str
            else:
                return False, f"Validation failed: {result.stdout[:500]}", result.stdout, result.stderr, cmd_str
        else:
            return False, f"Validation error: {result.stderr[:500]}", result.stdout, result.stderr, cmd_str
    
    except subprocess.TimeoutExpired:
        return False, "Validation timeout", "", "Validation timeout after 30 seconds", cmd_str
    except Exception as e:
        return False, f"Validation exception: {str(e)}", "", str(e), cmd_str
    finally:
        try:
            os.unlink(solution_file)
        except:
            pass

def load_single_problem(problem_file: str, domain_file: str) -> dict:
    """加载单个问题并构建 prompt"""
    problem_path = Path(problem_file)
    if not problem_path.exists():
        raise FileNotFoundError(f"Problem file not found: {problem_file}")
    
    domain_path = Path(domain_file)
    if not domain_path.exists():
        raise FileNotFoundError(f"Domain file not found: {domain_file}")
    
    # 读取 domain 内容
    with open(domain_path, 'r', encoding='utf-8') as f:
        domain_content = f.read()
    
    # 读取 problem 内容
    with open(problem_path, 'r', encoding='utf-8') as f:
        problem_content = f.read()
    
    # 加载 prompt 模板
    try:
        with open('prompt.txt', 'r', encoding='utf-8') as f:
            prompt_template = f.read()
    except Exception as e:
        print(f"Warning: Error reading prompt.txt: {e}, using default template")
        prompt_template = "{problem_content}"
    
    prompt = prompt_template.format(domain_content=domain_content, problem_content=problem_content)
    
    return {
        'problem_name': problem_path.stem,
        'problem_file': str(problem_path),
        'prompt': prompt,
        'problem_content': problem_content
    }

def evaluate_single_problem_with_temperature(
    model_path: str,
    problem_file: str,
    domain_file: str,
    temperature: float,
    family: str = 'mistral',
    load_in_4bit: bool = True,
    results_dir: Optional[Path] = None
) -> dict:
    """使用指定 temperature 评估单个问题"""
    
    # 加载问题
    problem_data = load_single_problem(problem_file, domain_file)
    
    # 生成解决方案
    messages = template_input(problem_data['prompt'])
    
    # 加载模型（如果还没有加载）
    if not hasattr(evaluate_single_problem_with_temperature, '_model_cache') or \
       evaluate_single_problem_with_temperature._model_cache.get('path') != model_path:
        print(f"Loading model: {model_path}")
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
        evaluate_single_problem_with_temperature._model_cache = {
            'path': model_path,
            'model': model,
            'tokenizer': tokenizer
        }
    
    model = evaluate_single_problem_with_temperature._model_cache['model']
    tokenizer = evaluate_single_problem_with_temperature._model_cache['tokenizer']
    
    # 应用 chat template
    try:
        inputs = tokenizer.apply_chat_template(
            messages, 
            tokenize=True, 
            add_generation_prompt=True, 
            return_tensors="pt",
            enable_thinking=False,
        )
    except TypeError:
        messages = template_input(problem_data['prompt'], rich=True)
        inputs = tokenizer.apply_chat_template(
            messages,
            tokenize=True,
            add_generation_prompt=True,
            return_tensors="pt",
            enable_thinking=False,
        )
    
    # 确保输入在正确的设备上
    if hasattr(model, 'device'):
        inputs = inputs.to(model.device)
    else:
        try:
            device = next(model.parameters()).device
            inputs = inputs.to(device)
        except (StopIteration, Exception):
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
    
    # 验证解决方案
    validation_message = ""
    validation_stdout = ""
    validation_stderr = ""
    category = ""
    is_valid = False
    val_cmd = ""
    
    if generation_error:
        category = "generation_error"
        validation_message = f"Generation failed: {generation_error}"
    elif raw_solution.strip():
        valid, message, stdout, stderr, val_cmd = validate_solution(domain_file, problem_file, raw_solution)
        validation_message = message
        validation_stdout = stdout
        validation_stderr = stderr
        
        if not _looks_like_valid_plan(raw_solution):
            category = "plan_format_error"
        else:
            category = _classify_result(stdout)
        
        is_valid = (category == "success_plans")
    else:
        category = "plan_format_error"
        validation_message = "Empty solution generated"
    
    # 保存解决方案文件
    solution_name = f"{problem_data['problem_name']}_temp{temperature:.2f}.soln"
    solution_file = results_dir / solution_name if results_dir else Path(solution_name)
    
    if results_dir:
        with open(solution_file, 'w', encoding='utf-8') as f:
            f.write(raw_solution)
    
    return {
        'temperature': temperature,
        'problem_name': problem_data['problem_name'],
        'problem_file': problem_file,
        'solution_file': str(solution_file),
        'is_valid': is_valid,
        'category': category,
        'validation_message': validation_message,
        'validation_stdout': validation_stdout,
        'validation_stderr': validation_stderr,
        'validation_cmd': val_cmd,
        'raw_solution': raw_solution,
        'raw_output': output,
        'generation_error': generation_error
    }

def main():
    """主函数"""
    import argparse
    
    parser = argparse.ArgumentParser(
        description="Evaluate single PDDL problem with multiple temperatures"
    )
    parser.add_argument("--model", type=str, required=True,
                       help="Path to model (e.g., unsloth fine-tuned)")
    parser.add_argument("--problem-file", type=str, required=True,
                       help="Path to single problem PDDL file")
    parser.add_argument("--domain-file", type=str, required=True,
                       help="Path to domain PDDL file")
    parser.add_argument("--temperatures", type=float, nargs='+', required=True,
                       help="Temperature values to test (e.g., 0.1 0.5 1.0)")
    parser.add_argument("--family", choices=["mistral", "llama", "phi", "qwen", "gemma", "auto"], 
                       default="auto", help="Model family (auto for automatic detection)")
    parser.add_argument("--output", type=str, default="single_problem_results.json",
                       help="Output JSON file name")
    parser.add_argument("--results-dir", type=str, default=None,
                       help="Directory to save solution files (default: auto-generated)")
    parser.add_argument("--load-in-4bit", dest='load_in_4bit', action='store_true',
                       help="Load model in 4-bit quantization (default: True)")
    parser.add_argument("--no-load-in-4bit", dest='load_in_4bit', action='store_false',
                       help="Disable 4-bit quantization")
    parser.set_defaults(load_in_4bit=True)
    
    args = parser.parse_args()
    
    # 自动检测模型家族
    family = args.family
    if family == 'auto':
        model_name_lower = args.model.lower()
        for model_type, model_family in MODEL_FAMILY_MAP.items():
            if model_type in model_name_lower:
                family = model_family
                break
        else:
            family = 'mistral'
        print(f"Auto-detected model family: {family}")
    
    # 创建结果目录
    if args.results_dir:
        results_dir = Path(args.results_dir)
    else:
        problem_name = Path(args.problem_file).stem
        model_name = args.model.replace('/', '_').replace('\\', '_')
        results_dir = Path(f"{model_name}_single_problem_{problem_name}_results")
    
    if results_dir.exists():
        shutil.rmtree(results_dir)
    results_dir.mkdir(parents=True, exist_ok=True)
    print(f"Results will be saved to: {results_dir}")
    
    # 测试每个 temperature
    all_results = []
    print(f"\nTesting {len(args.temperatures)} temperature(s): {args.temperatures}")
    print("="*80)
    
    for i, temp in enumerate(args.temperatures, 1):
        print(f"\n[{i}/{len(args.temperatures)}] Testing with temperature={temp:.2f}")
        print("-"*80)
        
        result = evaluate_single_problem_with_temperature(
            model_path=args.model,
            problem_file=args.problem_file,
            domain_file=args.domain_file,
            temperature=temp,
            family=family,
            load_in_4bit=args.load_in_4bit,
            results_dir=results_dir
        )
        
        all_results.append(result)
        
        # 打印结果
        category_display = {
            "success_plans": "✓ Success",
            "plan_format_error": "✗ Plan Format Error",
            "precondition_violation": "✗ Precondition Violation",
            "safety_constraints_violation": "✗ Safety Constraints Violation",
            "goal_not_satisfied": "✗ Goal Not Satisfied",
            "others": "✗ Others",
            "generation_error": "✗ Generation Error"
        }
        print(f"Result: {category_display.get(result['category'], '✗ Unknown')}")
        print(f"Valid: {result['is_valid']}")
        if result['raw_solution']:
            print(f"Plan length: {len(result['raw_solution'].splitlines())} actions")
            print(f"Plan preview:\n{result['raw_solution'][:200]}...")
    
    # 保存结果
    timestamp = datetime.now().isoformat()
    output_file = results_dir / args.output
    
    output_data = {
        'timestamp': timestamp,
        'model_path': args.model,
        'problem_file': args.problem_file,
        'domain_file': args.domain_file,
        'temperatures_tested': args.temperatures,
        'family': family,
        'load_in_4bit': args.load_in_4bit,
        'results_directory': str(results_dir),
        'total_runs': len(all_results),
        'success_count': sum(1 for r in all_results if r['is_valid']),
        'results': all_results
    }
    
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(output_data, f, indent=2, ensure_ascii=False)
    
    # 打印总结
    print("\n" + "="*80)
    print("SUMMARY")
    print("="*80)
    print(f"Total runs: {len(all_results)}")
    print(f"Success count: {sum(1 for r in all_results if r['is_valid'])}")
    print(f"Success rate: {sum(1 for r in all_results if r['is_valid'])/len(all_results)*100:.1f}%")
    print("\nResults by temperature:")
    for result in all_results:
        status = "✓" if result['is_valid'] else "✗"
        print(f"  Temperature {result['temperature']:.2f}: {status} {result['category']}")
    print(f"\nResults saved to: {output_file}")
    print(f"Solution files saved to: {results_dir}")

if __name__ == "__main__":
    main()

