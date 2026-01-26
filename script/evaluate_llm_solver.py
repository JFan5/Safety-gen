#!/usr/bin/env python3
"""
Generic PDDL Plan Evaluator
通过命令行显式指定 domain 文件与 problems 目录，评测模型生成计划并用 VAL 验证。
输出结果保存为 JSON 与 .soln 计划文本。

Supports automatic output to runs/<run_id>/eval/<eval_id>/ structure with:
- scenarios/<scenario>.json: Per-scenario evaluation results
- metrics.json: Aggregated cross-scenario metrics
- eval_config.yaml: Evaluation parameters snapshot
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
import time
import re
from typing import Optional
from collections import defaultdict
from utils import (
    _classify_result,
    validate_solution,
)

# Import run registry utilities
try:
    from utils.run_registry import (
        get_eval_output_dir,
        generate_eval_id,
        update_run_evals,
    )
    from utils.eval_aggregator import (
        aggregate_and_write_metrics,
        print_metrics_summary,
    )
    RUNS_INTEGRATION_AVAILABLE = True
except ImportError:
    RUNS_INTEGRATION_AVAILABLE = False
# 配置参数
# input and output length
max_seq_length = 5000
# output length
MAX_NEW_TOKENS = 1024
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

    # 处理 Llama-3 格式的输出 (支持 Llama-3.1, Llama-3.2 等)
    if '<|start_header_id|>' in text or family == 'llama':
        # 提取 assistant 部分的内容
        if '<|start_header_id|>assistant<|end_header_id|>' in text:
            parts = text.split('<|start_header_id|>assistant<|end_header_id|>')
            if len(parts) > 1:
                text = parts[-1].strip()
        # 移除结束标记
        if '<|eot_id|>' in text:
            text = text.split('<|eot_id|>')[0].strip()
        # 移除其他 Llama-3 特殊标记
        text = re.sub(r'<\|begin_of_text\|>', '', text)
        text = re.sub(r'<\|end_of_text\|>', '', text)
        text = re.sub(r'<\|start_header_id\|>[^<]*<\|end_header_id\|>', '', text)
        text = text.strip()

    # 处理Mistral格式的输出
    if '[/INST]' in text or (family == 'mistral' and '<|start_header_id|>' not in output):
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


def _extract_size_key(problem_name: str, scenario: Optional[str] = None) -> Optional[str]:
    """
    从问题名称中提取规模标识，按场景解析关键参数。
    例如：delivery_size10_packages1 -> s10-p1；c2_s3_p4 -> c2-s3-p4。
    如无法解析则返回 None。
    """
    name = problem_name.lower()

    # Delivery: sizeX packagesY
    if scenario == "delivery":
        m = re.search(r"size(\d+)[-_]?packages?(\d+)", name)
        if m:
            size_part, pkg_part = m.groups()
            return f"s{int(size_part)}-p{int(pkg_part)}"
        m = re.search(r"s(\d+)[-_]?p(\d+)", name)
        if m:
            return f"s{m.group(1)}-p{m.group(2)}"

    # Logistics: cX_sY_pZ
    if scenario == "logistics":
        m = re.search(r"c(\d+)[-_]?s(\d+)[-_]?p(\d+)", name)
        if m:
            c_part, s_part, p_part = m.groups()
            return f"c{int(c_part)}-s{int(s_part)}-p{int(p_part)}"
        m = re.search(r"s(\d+)[-_]?p(\d+)", name)
        if m:
            return f"s{m.group(1)}-p{m.group(2)}"

    # Grid: xY_yZ_shK_kM_lN
    if scenario == "grid":
        m = re.search(r"x(\d+).*y(\d+).*sh(\d+).*k(\d+).*l(\d+)", name)
        if m:
            x, y, sh, k, l_val = m.groups()
            return f"x{x}-y{y}-sh{sh}-k{k}-l{l_val}"

    # Blocksworld: opsX_nY
    if scenario == "blocksworld":
        m = re.search(r"ops(\d+).*n0*([0-9]+)", name)
        if m:
            ops_part, n_part = m.groups()
            return f"ops{int(ops_part)}-n{int(n_part)}"

    # Ferry: lX-cY
    if scenario == "ferry":
        m = re.search(r"l0*([0-9]+).*c0*([0-9]+)", name)
        if m:
            l_part, c_part = m.groups()
            return f"l{int(l_part)}-c{int(c_part)}"

    # Spanner: sX-nY-lZ
    if scenario == "spanner":
        m = re.search(r"s0*([0-9]+).*n0*([0-9]+).*l0*([0-9]+)", name)
        if m:
            s_part, n_part, l_part = m.groups()
            return f"s{int(s_part)}-n{int(n_part)}-l{int(l_part)}"

    # Grippers: nX-rY-oZ
    if scenario == "grippers":
        m = re.search(r"n0*([0-9]+).*r0*([0-9]+).*o0*([0-9]+)", name)
        if m:
            n_part, r_part, o_part = m.groups()
            return f"n{int(n_part)}-r{int(r_part)}-o{int(o_part)}"

    # Rovers: roverX_waypointY_objectiveZ_cameraK_goalG
    if scenario == "rovers":
        m = re.search(
            r"rover0*([0-9]+).*waypoint0*([0-9]+).*objective0*([0-9]+).*camera0*([0-9]+).*goal0*([0-9]+)",
            name,
        )
        if m:
            r_part, wp_part, obj_part, cam_part, goal_part = m.groups()
            return f"r{int(r_part)}-wp{int(wp_part)}-obj{int(obj_part)}-cam{int(cam_part)}-goal{int(goal_part)}"

    # 通用 sX-pY 兜底
    match = re.search(r"s(\d+)[_-]?p(\d+)", name, flags=re.IGNORECASE)
    if match:
        size_part, prob_part = match.groups()
        return f"s{size_part}-p{prob_part}"
    return None


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
                              load_in_4bit: bool = True, temperature: float = 0.6,
                              one_shot: bool = False,
                              no_timestamp: bool = False,
                              runs_dir: str = None,
                              use_runs_structure: bool = False):
    """
    在testing数据上测试模型并计算成功率

    Args:
        model_path: 模型路径
        output_file: 输出JSON文件路径（会自动添加时间戳）
        family: 模型家族
        max_problems: 每个场景最大问题数量
        results_dir: 结果保存目录（已废弃，不再使用）
        problems_dir: 包含 problem 文件的目录
        domain_file: domain 文件路径
        load_in_4bit: 是否使用 4-bit 量化
        temperature: 文本生成的温度参数（默认: 0.6）
        one_shot: 是否使用 one-shot 模式
        no_timestamp: 是否不添加时间戳到输出文件名
        runs_dir: runs 目录路径（用于自动写入 runs 结构）
        use_runs_structure: 是否使用 runs/<run_id>/eval/<eval_id>/ 结构输出
    """
    print(f"Testing model: {model_path}")
    print(f"Problems dir: {problems_dir}")
    print(f"Domain file: {domain_file}")
    print(f"Max problems: {max_problems}")
    print(f"Output: {output_file}")
    scenario_name = _infer_scenario_name(problems_dir, domain_file)
    if scenario_name:
        print(f"Detected scenario: {scenario_name}")
    else:
        print("Detected scenario: Unknown (size stats will use generic parser)")
    
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

    # 开始计时
    total_start_time = time.time()

    # 加载模型
    print("Loading model...")
    model_load_start = time.time()
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
    model_load_time = time.time() - model_load_start
    print(f"Model loaded in {model_load_time:.2f} seconds")

    # 测试结果
    results = []
    total_count = len(test_data)
    # 分类统计（允许出现未知分类，避免 KeyError）
    category_counts = defaultdict(int)
    for k in [
        "success_plans",
        "plan_format_error",
        "precondition_violation",
        "safety_constraints_violation",
        "goal_not_satisfied",
        "generation_error",
        "others",
    ]:
        category_counts[k] = 0
    size_stats = defaultdict(lambda: {"total": 0, "success": 0})

    # 时间统计
    total_generation_time = 0.0
    total_validation_time = 0.0

    inference_start_time = time.time()

    for i, sample in enumerate(test_data, 1):
        print(f"\n--- Test {i}/{total_count} ---")
        print(f"Problem: {sample['problem_name']}")
        size_key = _extract_size_key(sample['problem_name'], scenario_name)
        
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
        except (TypeError, ValueError) as e:
            # 如果 chat_template 不可用，直接使用 tokenizer 编码
            if "chat_template" in str(e).lower() or "template" in str(e).lower():
                # 没有 chat_template，直接编码 prompt 文本
                inputs = tokenizer(
                    sample['prompt'],
                    return_tensors="pt",
                    truncation=True,
                    max_length=max_seq_length,
                )
            else:
                # 尝试 rich 格式
                try:
                    messages = template_input(sample['prompt'], rich=True)
                    inputs = tokenizer.apply_chat_template(
                        messages,
                        tokenize=True,
                        add_generation_prompt=True,
                        return_tensors="pt",
                        enable_thinking=False,
                    )
                except (TypeError, ValueError):
                    # 最后的后备方案：直接编码
                    inputs = tokenizer(
                        sample['prompt'],
                        return_tensors="pt",
                        truncation=True,
                        max_length=max_seq_length,
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
        gen_start = time.time()
        try:
            pad_token_id = getattr(tokenizer, "pad_token_id", None)
            if pad_token_id is None:
                pad_token_id = getattr(tokenizer, "eos_token_id", None)

            # inputs 可能是 Tensor（apply_chat_template 返回）或 BatchEncoding/dict（tokenizer(...) 返回）
            if isinstance(inputs, torch.Tensor):
                gen_input_ids = inputs
                gen_attention_mask = None
            else:
                gen_input_ids = inputs["input_ids"]
                gen_attention_mask = inputs.get("attention_mask", None)

            with torch.no_grad():
                outputs = model.generate(
                    input_ids=gen_input_ids,
                    attention_mask=gen_attention_mask,
                    max_new_tokens=MAX_NEW_TOKENS,
                    pad_token_id=pad_token_id,
                    **cfg,
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
        
        gen_time = time.time() - gen_start
        total_generation_time += gen_time

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
        val_start = time.time()

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

        val_time = time.time() - val_start
        total_validation_time += val_time

        # 更新分类统计（defaultdict 自动兜底）
        category_counts[category] += 1
        if size_key:
            size_stats[size_key]["total"] += 1
            if category == "success_plans":
                size_stats[size_key]["success"] += 1
        
        is_valid = (category == "success_plans")

        # 不再保存单独的solution文件
        
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
            'generation_error': generation_error,
            'ground_truth': sample.get('path', ''),
            'prompt': sample['prompt']
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

    # 处理输出文件名：默认会插入 timestamp；如指定 --no-timestamp 则严格保留文件名
    output_file_path = Path(output_file)
    if no_timestamp:
        # Only keep optional oneshot suffix (but still no timestamp)
        if one_shot:
            parent_dir = output_file_path.parent
            stem = output_file_path.stem
            suffix = output_file_path.suffix if output_file_path.suffix else ".json"
            oneshot_suffix = "_oneshot"
            if parent_dir and str(parent_dir) != ".":
                output_file_path = parent_dir / f"{stem}{oneshot_suffix}{suffix}"
            else:
                output_file_path = Path(f"{stem}{oneshot_suffix}{suffix}")
        # else: keep as-is
    else:
        if output_file == "test_results.json":
            # 如果使用默认文件名，生成带时间戳的文件名
            model_name_clean = model_path.replace('/', '_').replace('\\', '_')
            suffix = "_oneshot" if one_shot else ""
            output_file_path = Path(f"evaluation_summary_{model_name_clean}{suffix}_{timestamp}.json")
        else:
            # 如果指定了自定义文件名，在文件名中插入时间戳和 oneshot 后缀
            parent_dir = output_file_path.parent
            stem = output_file_path.stem
            suffix = output_file_path.suffix if output_file_path.suffix else ".json"
            oneshot_suffix = "_oneshot" if one_shot else ""
            if parent_dir and str(parent_dir) != ".":
                output_file_path = parent_dir / f"{stem}{oneshot_suffix}_{timestamp}{suffix}"
            else:
                output_file_path = Path(f"{stem}{oneshot_suffix}_{timestamp}{suffix}")
    
    # 计算时间统计
    inference_time = time.time() - inference_start_time
    total_time = time.time() - total_start_time
    avg_generation_time = total_generation_time / total_count if total_count > 0 else 0
    avg_validation_time = total_validation_time / total_count if total_count > 0 else 0

    output_data = {
        'timestamp': timestamp_iso,
        'model_path': model_path,
        'scenario': scenario_name,
        'problems_dir': str(problems_dir),
        'domain_file': str(domain_file),
        'max_problems': max_problems,
        'load_in_4bit': load_in_4bit,
        'one_shot': one_shot,
        'temperature': temperature,
        'max_new_tokens': MAX_NEW_TOKENS,
        'total_tests': total_count,
        'success_count': success_count,
        'success_rate': final_success_rate,
        'category_counts': category_counts,
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
            'problems_per_second': round(total_count / inference_time, 3) if inference_time > 0 else 0,
        },
        'results': results
    }
    
    # Write to output file only if NOT using runs structure
    # (runs structure will write to its own location)
    if not (use_runs_structure and RUNS_INTEGRATION_AVAILABLE):
        # Ensure parent directory exists
        try:
            output_file_path.parent.mkdir(parents=True, exist_ok=True)
        except Exception:
            pass

        with open(output_file_path, 'w', encoding='utf-8') as f:
            json.dump(output_data, f, indent=2, ensure_ascii=False)

    # === Runs structure integration ===
    runs_output_path = None
    if use_runs_structure and RUNS_INTEGRATION_AVAILABLE:
        print("\n[Runs Integration] Writing to runs structure...")

        # Generate eval_id
        eval_id = generate_eval_id(
            eval_type="solver",
            temperature=temperature,
            max_new_tokens=MAX_NEW_TOKENS,
            extra_params={"oneshot": 1} if one_shot else None
        )

        # Get eval output directory
        runs_dir_path = Path(runs_dir) if runs_dir else None
        eval_output_dir, run_id = get_eval_output_dir(
            model_path=model_path,
            eval_id=eval_id,
            runs_dir=runs_dir_path,
            create=True
        )

        if eval_output_dir:
            print(f"[Runs Integration] run_id: {run_id}")
            print(f"[Runs Integration] eval_id: {eval_id}")
            print(f"[Runs Integration] Output dir: {eval_output_dir}")

            # Write scenario result to scenarios/<scenario>.json
            scenario_filename = f"{scenario_name or 'unknown'}.json"
            scenario_output_path = eval_output_dir / "scenarios" / scenario_filename

            with open(scenario_output_path, 'w', encoding='utf-8') as f:
                json.dump(output_data, f, indent=2, ensure_ascii=False)
            print(f"[Runs Integration] Scenario result: {scenario_output_path}")

            # Prepare eval config
            eval_config = {
                "eval_id": eval_id,
                "eval_type": "solver",
                "model_path": model_path,
                "temperature": temperature,
                "max_new_tokens": MAX_NEW_TOKENS,
                "load_in_4bit": load_in_4bit,
                "one_shot": one_shot,
                "max_problems": max_problems,
                "timestamp": timestamp_iso,
            }

            # Aggregate and write metrics.json
            metrics = aggregate_and_write_metrics(
                eval_output_dir=eval_output_dir,
                eval_id=eval_id,
                model_path=model_path,
                eval_config=eval_config
            )

            if metrics:
                print_metrics_summary(metrics)

                # Update run.json with eval record
                run_dir = eval_output_dir.parent.parent
                update_run_evals(
                    run_dir=run_dir,
                    eval_id=eval_id,
                    main_metric=metrics.get("overall", {}).get("success_rate", 0),
                    eval_path=f"eval/{eval_id}"
                )

            runs_output_path = eval_output_dir
        else:
            print(f"[Runs Integration] Warning: Could not find run for model_path: {model_path}")
            print("[Runs Integration] Results written to default location only.")

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
    if size_success_rates:
        print(f"\nSuccess by Problem Size:")
        for size_key in sorted(size_success_rates.keys()):
            stats = size_success_rates[size_key]
            print(f"  {size_key}: {stats['success']}/{stats['total']} ({stats['success_rate']:.1f}%)")
    print(f"\nTiming Statistics:")
    print(f"  Total time: {total_time:.2f}s")
    print(f"  Model load time: {model_load_time:.2f}s")
    print(f"  Inference time: {inference_time:.2f}s")
    print(f"  Total generation time: {total_generation_time:.2f}s")
    print(f"  Total validation time: {total_validation_time:.2f}s")
    print(f"  Avg generation time per problem: {avg_generation_time:.2f}s")
    print(f"  Avg validation time per problem: {avg_validation_time:.2f}s")
    print(f"  Throughput: {total_count / inference_time:.3f} problems/sec" if inference_time > 0 else "  Throughput: N/A")
    if runs_output_path:
        print(f"\nResults saved to: {runs_output_path}")
    else:
        print(f"\nResults saved to: {output_file_path}")

def main():
    """主函数"""
    import argparse

    parser = argparse.ArgumentParser(description="Evaluate PDDL model with explicit domain and problems directory")
    parser.add_argument("--model", type=str, default=None,
                       help="Path to model (e.g., unsloth fine-tuned)")
    parser.add_argument("--run-path", type=str, default=None,
                       help="Path to run directory (will extract model_path from run.json)")
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
    parser.add_argument("--temperature", type=float, default=0.6,
                       help="Temperature for text generation (default: 0.6)")
    parser.add_argument("--one-shot", dest='one_shot', action='store_true',
                       help="Use one-shot mode with examples from one_shot_example folder (default: False)")
    parser.add_argument("--no-one-shot", dest='one_shot', action='store_false',
                       help="Disable one-shot mode (default)")
    parser.set_defaults(one_shot=False)
    parser.add_argument(
        "--no-timestamp",
        action="store_true",
        help="Do not append timestamp to output filename (keep exactly --output).",
    )
    # Runs structure integration
    parser.add_argument(
        "--runs-dir",
        type=str,
        default=None,
        help="Path to runs directory for automatic output to runs/<run_id>/eval/<eval_id>/",
    )
    parser.add_argument(
        "--use-runs-structure",
        action="store_true",
        help="Enable automatic output to runs structure (requires --runs-dir or default runs/)",
    )

    args = parser.parse_args()

    # Handle --run-path: extract model_path from run.json
    model_path = args.model
    if args.run_path:
        run_json_path = Path(args.run_path) / "run.json"
        if not run_json_path.exists():
            raise ValueError(f"run.json not found at {run_json_path}")
        with open(run_json_path, 'r') as f:
            run_data = json.load(f)
        model_path = run_data.get("artifacts", {}).get("model_path")
        if not model_path:
            # Try model_dir symlink
            model_dir_link = Path(args.run_path) / "model_dir"
            if model_dir_link.exists() and model_dir_link.is_symlink():
                model_path = str(model_dir_link.resolve())
            else:
                raise ValueError(f"Cannot find model_path in run.json or model_dir symlink")
        print(f"Using model from run: {model_path}")
        # Auto-enable runs structure output
        if not args.use_runs_structure:
            args.use_runs_structure = True
            args.runs_dir = str(Path(args.run_path).parent.parent)  # runs/<method>/../ = runs/

    if not model_path:
        raise ValueError("Must provide either --model or --run-path")

    test_model_on_testing_data(
        model_path,
        args.output,
        args.family,
        args.max_problems,
        args.results_dir,
        problems_dir=args.problems_dir,
        domain_file=args.domain_file,
        load_in_4bit=args.load_in_4bit,
        temperature=args.temperature,
        one_shot=args.one_shot,
        no_timestamp=args.no_timestamp,
        runs_dir=args.runs_dir,
        use_runs_structure=args.use_runs_structure,
    )

if __name__ == "__main__":
    main()
