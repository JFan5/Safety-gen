#!/usr/bin/env python3
"""
Generic PDDL Plan Evaluator with Batch Processing
通过批处理和多线程优化，充分利用 GPU 内存。
支持批量生成计划并并行验证。

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
import time
from pathlib import Path
from unsloth import FastLanguageModel
import torch
from datetime import datetime
import re
from typing import Optional, List, Dict, Tuple
from collections import defaultdict
from utils import (
    classify_result,
    validate_solution,
)
from concurrent.futures import ThreadPoolExecutor, as_completed
from tqdm import tqdm

# Import run registry utilities
try:
    from utils.run_registry import (
        get_eval_output_dir,
        generate_eval_id,
        update_run_evals,
        resolve_model_path_from_run,
        find_latest_checkpoint,
    )
    from utils.eval_aggregator import (
        aggregate_and_write_metrics,
        print_metrics_summary,
    )
    RUNS_INTEGRATION_AVAILABLE = True
except ImportError:
    RUNS_INTEGRATION_AVAILABLE = False

# 配置参数
max_seq_length = 2048
MAX_NEW_TOKENS = 512
dtype = None

# 批处理参数
DEFAULT_BATCH_SIZE = 4  # 默认批次大小，可根据 GPU 内存调整
DEFAULT_NUM_WORKERS = 4  # 验证的并行线程数

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
        # 移除 </s> 及其后面的所有内容（包括 padding tokens）
        if '</s>' in text:
            text = text.split('</s>')[0].strip()
        elif text.endswith('</s>'):
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

    elif 'assistant' in text and not text.startswith('assistant'):
        parts = text.split('assistant')
        text = parts[-1].lstrip(':').strip()

    text = re.sub(r'<[|｜][^>]+[|｜]>', '', text)
    text = re.sub(r'<think>.*?</think>', '', text, flags=re.DOTALL | re.IGNORECASE)
    text = re.sub(r'</?think>', '', text, flags=re.IGNORECASE)
    text = text.strip()
    text = re.sub(r'^(assistant|final|assistant_final)\s*[:\-]*', '', text, flags=re.IGNORECASE).lstrip()
    text = re.sub(r'^\|>\s*', '', text)

    if family == 'qwen':
        text = re.sub(r'<think>.*?</think>', '', text, flags=re.DOTALL | re.IGNORECASE).strip()

    # 只保留末尾连续的计划行
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
    """从问题名称中提取规模标识"""
    name = problem_name.lower()

    if scenario == "delivery":
        m = re.search(r"size(\d+)[-_]?packages?(\d+)", name)
        if m:
            size_part, pkg_part = m.groups()
            return f"s{int(size_part)}-p{int(pkg_part)}"
        m = re.search(r"s(\d+)[-_]?p(\d+)", name)
        if m:
            return f"s{m.group(1)}-p{m.group(2)}"

    if scenario == "logistics":
        m = re.search(r"c(\d+)[-_]?s(\d+)[-_]?p(\d+)", name)
        if m:
            c_part, s_part, p_part = m.groups()
            return f"c{int(c_part)}-s{int(s_part)}-p{int(p_part)}"
        m = re.search(r"s(\d+)[-_]?p(\d+)", name)
        if m:
            return f"s{m.group(1)}-p{m.group(2)}"

    if scenario == "grid":
        m = re.search(r"x(\d+).*y(\d+).*sh(\d+).*k(\d+).*l(\d+)", name)
        if m:
            x, y, sh, k, l_val = m.groups()
            return f"x{x}-y{y}-sh{sh}-k{k}-l{l_val}"

    if scenario == "blocksworld":
        m = re.search(r"ops(\d+).*n0*([0-9]+)", name)
        if m:
            ops_part, n_part = m.groups()
            return f"ops{int(ops_part)}-n{int(n_part)}"

    if scenario == "ferry":
        m = re.search(r"l0*([0-9]+).*c0*([0-9]+)", name)
        if m:
            l_part, c_part = m.groups()
            return f"l{int(l_part)}-c{int(c_part)}"

    if scenario == "spanner":
        m = re.search(r"s0*([0-9]+).*n0*([0-9]+).*l0*([0-9]+)", name)
        if m:
            s_part, n_part, l_part = m.groups()
            return f"s{int(s_part)}-n{int(n_part)}-l{int(l_part)}"

    if scenario == "grippers":
        m = re.search(r"n0*([0-9]+).*r0*([0-9]+).*o0*([0-9]+)", name)
        if m:
            n_part, r_part, o_part = m.groups()
            return f"n{int(n_part)}-r{int(r_part)}-o{int(o_part)}"

    if scenario == "rovers":
        m = re.search(
            r"rover0*([0-9]+).*waypoint0*([0-9]+).*objective0*([0-9]+).*camera0*([0-9]+).*goal0*([0-9]+)",
            name,
        )
        if m:
            r_part, wp_part, obj_part, cam_part, goal_part = m.groups()
            return f"r{int(r_part)}-wp{int(wp_part)}-obj{int(obj_part)}-cam{int(cam_part)}-goal{int(goal_part)}"

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


def _load_problems_from_dir(problems_dir: str, domain_file: str, one_shot: bool = False,
                           nl_mode: bool = False, domain_nl_mode: bool = False,
                           json_mode: bool = False, domain_json_mode: bool = False,
                           prompt_template_path: str = None) -> list:
    """从指定目录加载所有 problem 文件

    Args:
        problems_dir: Directory containing problem files
        domain_file: Path to domain PDDL file
        one_shot: Whether to use one-shot mode
        nl_mode: If True, load .txt files for NL prompting (requires .pddl files for validation)
        domain_nl_mode: If True, use domain NL file instead of PDDL domain (requires nl_mode)
        json_mode: If True, load .json files for JSON prompting (requires .pddl files for validation)
        domain_json_mode: If True, use domain JSON file instead of PDDL domain (requires json_mode)
        prompt_template_path: If provided, override the default prompt template file
    """
    problems_path = Path(problems_dir)
    if not problems_path.exists():
        print(f"Problems directory not found: {problems_dir}")
        return []

    domain_content = ""
    domain_path = Path(domain_file) if domain_file else None

    # Handle domain JSON mode
    if domain_json_mode and domain_path:
        # Look for domain JSON file (e.g., domain3.json)
        domain_json_path = domain_path.parent / f"{domain_path.stem}.json"
        if domain_json_path.exists():
            try:
                with open(domain_json_path, 'r', encoding='utf-8') as f:
                    domain_content = f.read()
                print(f"Using domain JSON file: {domain_json_path}")
            except Exception as e:
                print(f"Error reading domain JSON file {domain_json_path}: {e}")
                print(f"Falling back to PDDL domain file")
                domain_json_mode = False
        else:
            print(f"Warning: Domain JSON file not found: {domain_json_path}")
            print(f"Falling back to PDDL domain file")
            domain_json_mode = False

    # Handle domain NL mode
    if domain_nl_mode and domain_path and not domain_content:
        # Look for domain NL file (e.g., domain3_nl.txt)
        domain_nl_path = domain_path.parent / f"{domain_path.stem}_nl.txt"
        if domain_nl_path.exists():
            try:
                with open(domain_nl_path, 'r', encoding='utf-8') as f:
                    domain_content = f.read()
                print(f"Using domain NL file: {domain_nl_path}")
            except Exception as e:
                print(f"Error reading domain NL file {domain_nl_path}: {e}")
                print(f"Falling back to PDDL domain file")
                domain_nl_mode = False
        else:
            print(f"Warning: Domain NL file not found: {domain_nl_path}")
            print(f"Falling back to PDDL domain file")
            domain_nl_mode = False

    # Fall back to PDDL domain if not using domain NL mode
    if not domain_content and domain_path and domain_path.exists():
        try:
            with open(domain_path, 'r', encoding='utf-8') as f:
                domain_content = f.read()
        except Exception as e:
            print(f"Error reading domain file {domain_file}: {e}")

    test_data = []

    if json_mode:
        # JSON mode: load .json files for prompting, use .pddl files for validation
        problem_files = sorted(problems_path.glob('*.json'))
        prompt_template_file = 'prompt_json.txt' if Path('prompt_json.txt').exists() else 'prompt_nl.txt'
        print(f"JSON mode enabled: loading {len(problem_files)} .json files")
    elif nl_mode:
        # NL mode: load .txt files for prompting, use .pddl files for validation
        problem_files = sorted(problems_path.glob('*.txt'))
        prompt_template_file = 'prompt_nl.txt'
        print(f"NL mode enabled: loading {len(problem_files)} .txt files")
    else:
        # Standard mode: load .pddl files
        problem_files = sorted(problems_path.glob('*.pddl'))
        problem_files = [f for f in problem_files if 'domain' not in f.name.lower()]
        prompt_template_file = 'prompt_oneshot.txt' if one_shot else 'prompt.txt'

    # Override with user-specified prompt template if provided
    if prompt_template_path:
        prompt_template_file = prompt_template_path
        print(f"Using custom prompt template: {prompt_template_file}")

    if not problem_files:
        file_type = ".json" if json_mode else (".txt" if nl_mode else ".pddl")
        print(f"No {file_type} problem files found in {problems_dir}")
        return []

    try:
        with open(prompt_template_file, 'r', encoding='utf-8') as f:
            prompt_template = f.read()
        if prompt_template.startswith('prompt = f"""'):
            prompt_template = prompt_template.replace('prompt = f"""', '', 1)
            # Strip whitespace first, then check for trailing triple quotes
            prompt_template = prompt_template.strip()
            if prompt_template.endswith('"""'):
                prompt_template = prompt_template[:-3]
            prompt_template = prompt_template.strip()
    except Exception as e:
        print(f"Error reading {prompt_template_file}: {e}")
        prompt_template = "{problem_content}"

    example_content = None
    if one_shot and not nl_mode:
        scenario = _infer_scenario_name(problems_dir, domain_file)
        if scenario:
            print(f"Inferred scenario: {scenario}")
            example_content = _load_one_shot_example(scenario)
            if example_content:
                print(f"Loaded one-shot example for scenario: {scenario}")
            else:
                print(f"Warning: Failed to load one-shot example for scenario: {scenario}")
        else:
            print(f"Warning: Could not infer scenario name from paths")

    for problem_file in problem_files:
        problem_name = problem_file.stem
        try:
            with open(problem_file, 'r', encoding='utf-8') as f:
                problem_content = f.read()
        except Exception as e:
            print(f"Error reading {problem_file}: {e}")
            continue

        # For NL/JSON mode, locate the corresponding .pddl file for validation
        if nl_mode or json_mode:
            pddl_file = problems_path / f"{problem_name}.pddl"
            if not pddl_file.exists():
                print(f"Warning: No .pddl file for validation: {problem_name}, skipping...")
                continue
            validation_file = str(pddl_file)
        else:
            validation_file = str(problem_file)

        if one_shot and example_content and not nl_mode:
            example_text = f"""
DOMAIN:
{example_content['domain']}

PROBLEM:
{example_content['problem']}

### Plan:
{example_content['solution']}
"""
            prompt = prompt_template.format(
                domain_content=domain_content,
                problem_content=problem_content,
                example_content=example_text
            )
        else:
            prompt = prompt_template.format(domain_content=domain_content, problem_content=problem_content)

        test_data.append({
            'problem_name': problem_name,
            'problem_file': validation_file,  # PDDL file for validation
            'prompt': prompt,
            'problem_content': problem_content
        })
    return test_data


def validate_solution_wrapper(args):
    """验证解决方案的包装函数，用于并行处理"""
    domain_file, problem_file, raw_solution, scenario_name, problem_name = args

    category = ""
    validation_message = ""
    validation_stdout = ""
    validation_stderr = ""
    val_cmd = ""

    if raw_solution.strip():
        if not _looks_like_valid_plan(raw_solution):
            category = "plan_format_error"
            validation_message = "Invalid plan format"
        else:
            valid, message, stdout, stderr, val_cmd = validate_solution(domain_file, problem_file, raw_solution)
            validation_message = message
            validation_stdout = stdout
            validation_stderr = stderr
            category = classify_result(stdout)
    else:
        category = "plan_format_error"
        validation_message = "Empty solution generated"

    size_key = _extract_size_key(problem_name, scenario_name)

    return {
        'category': category,
        'validation_message': validation_message,
        'validation_stdout': validation_stdout,
        'validation_stderr': validation_stderr,
        'validation_cmd': val_cmd,
        'size_key': size_key
    }


def batch_generate_solutions(model, tokenizer, batch_samples: List[Dict],
                            family: str, temperature: float, device) -> List[Tuple[str, str]]:
    """批量生成解决方案

    Returns:
        List of (output, raw_solution) tuples
    """
    # 保存原始 padding_side 并设置为左侧（decoder-only 模型必须左侧 padding）
    original_padding_side = tokenizer.padding_side
    tokenizer.padding_side = "left"

    # 确保有 pad_token
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token
        tokenizer.pad_token_id = tokenizer.eos_token_id

    # 准备批量输入
    batch_messages = []
    for sample in batch_samples:
        messages = template_input(sample['prompt'])
        batch_messages.append(messages)

    # 批量 tokenize
    try:
        inputs = tokenizer.apply_chat_template(
            batch_messages,
            tokenize=True,
            add_generation_prompt=True,
            return_tensors="pt",
            padding=True,
            enable_thinking=False,
        )
        # apply_chat_template 可能返回 tensor 或 dict
        if isinstance(inputs, torch.Tensor):
            input_ids = inputs
            # 手动创建 attention_mask
            attention_mask = (input_ids != tokenizer.pad_token_id).long()
        else:
            input_ids = inputs["input_ids"]
            attention_mask = inputs.get("attention_mask", (input_ids != tokenizer.pad_token_id).long())
    except (TypeError, ValueError) as e:
        # 如果 chat_template 不可用，直接使用 tokenizer 编码
        if "chat_template" in str(e).lower() or "template" in str(e).lower():
            # 没有 chat_template，直接编码 prompt 文本
            batch_texts = [sample['prompt'] for sample in batch_samples]
            inputs = tokenizer(
                batch_texts,
                return_tensors="pt",
                padding=True,
                truncation=True,
                max_length=max_seq_length,
            )
            input_ids = inputs["input_ids"]
            attention_mask = inputs.get("attention_mask", (input_ids != tokenizer.pad_token_id).long())
        else:
            # 如果失败，尝试 rich 格式
            batch_messages = [template_input(sample['prompt'], rich=True) for sample in batch_samples]
            try:
                inputs = tokenizer.apply_chat_template(
                    batch_messages,
                    tokenize=True,
                    add_generation_prompt=True,
                    return_tensors="pt",
                    padding=True,
                    enable_thinking=False,
                )
                if isinstance(inputs, torch.Tensor):
                    input_ids = inputs
                    attention_mask = (input_ids != tokenizer.pad_token_id).long()
                else:
                    input_ids = inputs["input_ids"]
                    attention_mask = inputs.get("attention_mask", (input_ids != tokenizer.pad_token_id).long())
            except (TypeError, ValueError):
                # 最后的后备方案：直接编码
                batch_texts = [sample['prompt'] for sample in batch_samples]
                inputs = tokenizer(
                    batch_texts,
                    return_tensors="pt",
                    padding=True,
                    truncation=True,
                    max_length=max_seq_length,
                )
                input_ids = inputs["input_ids"]
                attention_mask = inputs.get("attention_mask", (input_ids != tokenizer.pad_token_id).long())

    # 恢复原始 padding_side
    tokenizer.padding_side = original_padding_side

    input_ids = input_ids.to(device)
    attention_mask = attention_mask.to(device)

    cfg = {
        'do_sample': True,
        'temperature': temperature,
        'top_p': 0.9,
    }

    # 批量生成
    pad_token_id = tokenizer.pad_token_id
    eos_token_id = tokenizer.eos_token_id

    with torch.no_grad():
        outputs = model.generate(
            input_ids=input_ids,
            attention_mask=attention_mask,
            max_new_tokens=MAX_NEW_TOKENS,
            pad_token_id=pad_token_id,
            eos_token_id=eos_token_id,
            **cfg
        )

    # 批量解码
    decoded_outputs = tokenizer.batch_decode(outputs, skip_special_tokens=False)

    # 提取解决方案
    results = []
    for output in decoded_outputs:
        raw_solution = extract_llm_output(output, family)
        results.append((output, raw_solution))

    return results


def test_model_on_testing_data(model_path,
                              output_file="test_results.json", family='mistral',
                              max_problems: int = 0, results_dir=None,
                              problems_dir: str = None, domain_file: str = None,
                              load_in_4bit: bool = True, temperature: float = 0.6,
                              one_shot: bool = False, batch_size: int = DEFAULT_BATCH_SIZE,
                              num_workers: int = DEFAULT_NUM_WORKERS,
                              no_timestamp: bool = False,
                              runs_dir: str = None,
                              use_runs_structure: bool = False,
                              eval_id: str = None,
                              nl_mode: bool = False,
                              domain_nl_mode: bool = False,
                              json_mode: bool = False,
                              domain_json_mode: bool = False,
                              run_dir: Path = None,
                              prompt_template_path: str = None):
    """
    在testing数据上测试模型并计算成功率（批处理版本）

    Args:
        model_path: 模型路径
        output_file: 输出JSON文件路径
        family: 模型家族
        max_problems: 最大问题数量
        results_dir: 结果保存目录（已废弃）
        problems_dir: 包含 problem 文件的目录
        domain_file: domain 文件路径
        load_in_4bit: 是否使用 4-bit 量化
        temperature: 文本生成的温度参数
        one_shot: 是否使用 one-shot 模式
        batch_size: 批处理大小，控制一次生成多少个解决方案
        num_workers: 验证的并行线程数
        no_timestamp: 是否不添加时间戳到输出文件名
        runs_dir: runs 目录路径（用于自动写入 runs 结构）
        use_runs_structure: 是否使用 runs/<run_id>/eval/<eval_id>/ 结构输出
        nl_mode: 是否使用自然语言 (.txt) 文件进行提示
        domain_nl_mode: 是否使用自然语言域文件代替 PDDL 域文件
        json_mode: 是否使用 JSON (.json) 文件进行提示
        domain_json_mode: 是否使用 JSON 域文件代替 PDDL 域文件
        prompt_template_path: 自定义 prompt 模板文件路径（默认自动选择）
    """
    print(f"Testing model: {model_path}")
    print(f"Problems dir: {problems_dir}")
    print(f"Domain file: {domain_file}")
    print(f"Max problems: {max_problems}")
    print(f"Batch size: {batch_size}")
    print(f"Validation workers: {num_workers}")
    print(f"Output: {output_file}")

    scenario_name = _infer_scenario_name(problems_dir, domain_file)
    if scenario_name:
        print(f"Detected scenario: {scenario_name}")
    else:
        print("Detected scenario: Unknown")

    # 自动检测模型家族
    if family == 'auto':
        model_name_lower = model_path.lower()
        for model_type, model_family in MODEL_FAMILY_MAP.items():
            if model_type in model_name_lower:
                family = model_family
                break
        else:
            family = 'mistral'
        print(f"Auto-detected model family: {family}")

    if not problems_dir or not domain_file:
        print("--problems-dir 和 --domain-file 都是必需参数。")
        return

    if one_shot:
        print("Using one-shot mode with examples")

    if json_mode:
        print("Using JSON mode: loading .json files for prompting")
    if domain_json_mode:
        print("Using domain JSON mode: loading domain JSON file for prompting")
    if nl_mode:
        print("Using NL mode: loading .txt files for prompting")
    if domain_nl_mode:
        print("Using domain NL mode: loading domain NL file for prompting")

    # 加载测试数据
    test_data = _load_problems_from_dir(problems_dir, domain_file, one_shot=one_shot,
                                         nl_mode=nl_mode, domain_nl_mode=domain_nl_mode,
                                         json_mode=json_mode, domain_json_mode=domain_json_mode,
                                         prompt_template_path=prompt_template_path)
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

    # 获取设备
    device = next(model.parameters()).device
    print(f"Model loaded on device: {device}")

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

    # 批量处理
    print(f"\nProcessing {total_count} problems in batches of {batch_size}...")

    for batch_start in tqdm(range(0, total_count, batch_size), desc="Generating solutions"):
        batch_end = min(batch_start + batch_size, total_count)
        batch_samples = test_data[batch_start:batch_end]

        # 批量生成
        gen_start = time.time()
        try:
            batch_results = batch_generate_solutions(
                model, tokenizer, batch_samples, family, temperature, device
            )
        except torch.cuda.OutOfMemoryError as e:
            print(f"\nCUDA Out of Memory in batch {batch_start//batch_size + 1}")
            print(f"Try reducing batch size (current: {batch_size})")
            torch.cuda.empty_cache()
            # 降级为逐个处理
            batch_results = []
            for sample in batch_samples:
                try:
                    single_result = batch_generate_solutions(
                        model, tokenizer, [sample], family, temperature, device
                    )
                    batch_results.append(single_result[0])
                except Exception as e:
                    print(f"Error processing {sample['problem_name']}: {e}")
                    batch_results.append(("", ""))

        gen_time = time.time() - gen_start
        total_generation_time += gen_time

        # 准备验证任务
        val_start = time.time()
        validation_tasks = []
        for sample, (output, raw_solution) in zip(batch_samples, batch_results):
            validation_tasks.append((
                domain_file,
                sample['problem_file'],
                raw_solution,
                scenario_name,
                sample['problem_name']
            ))

        # 并行验证
        with ThreadPoolExecutor(max_workers=num_workers) as executor:
            validation_futures = {
                executor.submit(validate_solution_wrapper, task): idx
                for idx, task in enumerate(validation_tasks)
            }

            validation_results = [None] * len(validation_tasks)
            for future in as_completed(validation_futures):
                idx = validation_futures[future]
                try:
                    validation_results[idx] = future.result()
                except Exception as e:
                    print(f"Validation error: {e}")
                    validation_results[idx] = {
                        'category': 'others',
                        'validation_message': str(e),
                        'validation_stdout': '',
                        'validation_stderr': '',
                        'validation_cmd': '',
                        'size_key': None
                    }

        val_time = time.time() - val_start
        total_validation_time += val_time

        # 记录结果
        for idx, (sample, (output, raw_solution), val_result) in enumerate(
            zip(batch_samples, batch_results, validation_results)
        ):
            global_idx = batch_start + idx + 1
            category = val_result['category']
            size_key = val_result['size_key']

            # 更新统计（defaultdict 自动兜底）
            category_counts[category] += 1

            if size_key:
                size_stats[size_key]["total"] += 1
                if category == "success_plans":
                    size_stats[size_key]["success"] += 1

            is_valid = (category == "success_plans")

            result = {
                'index': global_idx,
                'problem_name': sample['problem_name'],
                'size_key': size_key,
                'scenario': scenario_name,
                'problem_file': sample['problem_file'],
                'is_valid': is_valid,
                'category': category,
                'validation_message': val_result['validation_message'],
                'validation_stdout': val_result['validation_stdout'],
                'validation_stderr': val_result['validation_stderr'],
                'validation_cmd': val_result['validation_cmd'],
                'raw_solution': raw_solution,
                'generation_error': None,
                'ground_truth': sample.get('path', ''),
                'prompt': sample['prompt']
            }

            results.append(result)

    # 计算最终统计
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

    # 计算时间统计
    inference_time = time.time() - inference_start_time
    total_time = time.time() - total_start_time
    avg_generation_time = total_generation_time / total_count if total_count > 0 else 0
    avg_validation_time = total_validation_time / total_count if total_count > 0 else 0

    # 生成输出文件名
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    timestamp_iso = datetime.now().isoformat()

    output_file_path = Path(output_file)
    if no_timestamp:
        # Keep exactly --output (optional oneshot suffix, but no timestamp)
        if one_shot:
            parent_dir = output_file_path.parent
            stem = output_file_path.stem
            suffix = output_file_path.suffix if output_file_path.suffix else ".json"
            oneshot_suffix = "_oneshot"
            if parent_dir and str(parent_dir) != ".":
                output_file_path = parent_dir / f"{stem}{oneshot_suffix}{suffix}"
            else:
                output_file_path = Path(f"{stem}{oneshot_suffix}{suffix}")
    else:
        if output_file == "test_results.json":
            model_name_clean = model_path.replace('/', '_').replace('\\', '_')
            suffix = "_oneshot" if one_shot else ""
            output_file_path = Path(f"evaluation_summary_{model_name_clean}{suffix}_{timestamp}.json")
        else:
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
        'scenario': scenario_name,
        'problems_dir': str(problems_dir),
        'domain_file': str(domain_file),
        'max_problems': max_problems,
        'load_in_4bit': load_in_4bit,
        'one_shot': one_shot,
        'temperature': temperature,
        'max_new_tokens': MAX_NEW_TOKENS,
        'batch_size': batch_size,
        'num_workers': num_workers,
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

        # Use provided eval_id or generate one (include batch_size for batch version)
        if eval_id is None:
            eval_id = generate_eval_id(
                eval_type="solver_batch",
                temperature=temperature,
                max_new_tokens=MAX_NEW_TOKENS,
                batch_size=batch_size,
                extra_params={"oneshot": 1} if one_shot else None
            )

        # Get eval output directory
        runs_dir_path = Path(runs_dir) if runs_dir else None
        if run_dir:
            # Directly use the known run_dir (avoids re-lookup when model_path not in index)
            run_id = run_dir.name
            eval_output_dir = run_dir / "eval" / eval_id
            eval_output_dir.mkdir(parents=True, exist_ok=True)
            (eval_output_dir / "scenarios").mkdir(exist_ok=True)
        else:
            # Fall back to looking up run by model path
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
                "eval_type": "solver_batch",
                "model_path": model_path,
                "temperature": temperature,
                "max_new_tokens": MAX_NEW_TOKENS,
                "load_in_4bit": load_in_4bit,
                "one_shot": one_shot,
                "batch_size": batch_size,
                "num_workers": num_workers,
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

    parser = argparse.ArgumentParser(description="Evaluate PDDL model with batch processing")
    parser.add_argument("--model", type=str, default=None,
                       help="Path to model")
    parser.add_argument("--run-path", type=str, default=None,
                       help="Path to run directory (will extract model_path from run.json)")
    parser.add_argument("--output", type=str, default="test_results.json",
                       help="Output JSON file name")
    parser.add_argument("--family", choices=["mistral", "llama", "phi", "qwen", "gemma", "gpt", "auto"],
                       default="auto", help="Model family")
    parser.add_argument("--max-problems", type=int, default=0,
                       help="Maximum number of problems to test (0 for all)")
    parser.add_argument("--results-dir", help="已废弃")
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
                       help="Use one-shot mode")
    parser.add_argument("--no-one-shot", dest='one_shot', action='store_false',
                       help="Disable one-shot mode (default)")
    parser.set_defaults(one_shot=False)
    parser.add_argument("--batch-size", type=int, default=DEFAULT_BATCH_SIZE,
                       help=f"Batch size for generation (default: {DEFAULT_BATCH_SIZE})")
    parser.add_argument("--num-workers", type=int, default=DEFAULT_NUM_WORKERS,
                       help=f"Number of parallel validation workers (default: {DEFAULT_NUM_WORKERS})")
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
    parser.add_argument(
        "--eval-id",
        type=str,
        default=None,
        help="Shared eval_id for multiple scenarios (avoids creating separate folders per scenario)",
    )
    parser.add_argument(
        "--nl-mode",
        action="store_true",
        help="Use natural language (.txt) files for prompting instead of PDDL files",
    )
    parser.add_argument(
        "--domain-nl-mode",
        action="store_true",
        help="Use domain NL file (domain3_nl.txt) instead of PDDL domain file (requires --nl-mode)",
    )
    parser.add_argument(
        "--json-mode",
        action="store_true",
        help="Use JSON (.json) files for prompting instead of PDDL files",
    )
    parser.add_argument(
        "--domain-json-mode",
        action="store_true",
        help="Use domain JSON file (domain3.json) instead of PDDL domain file (requires --json-mode)",
    )
    parser.add_argument(
        "--prompt-template",
        type=str,
        default=None,
        help="Path to prompt template file (default: auto-select based on mode, e.g. prompt.txt)",
    )

    args = parser.parse_args()

    # Handle --run-path: extract model_path from run.json with fallback to latest checkpoint
    model_path = args.model
    run_dir_for_eval = None  # Track the run directory for eval output

    if args.run_path:
        if not RUNS_INTEGRATION_AVAILABLE:
            raise RuntimeError(
                "--run-path requires run registry utilities. "
                "Please ensure utils/run_registry.py is available."
            )

        print("\n" + "="*60)
        print("MODEL PATH RESOLUTION")
        print("="*60)

        try:
            model_path, run_dir_for_eval = resolve_model_path_from_run(
                args.run_path,
                verbose=True
            )
        except ValueError as e:
            print(f"\n[ERROR] {e}")
            raise

        print(f"\n[Model Resolution] ✓ Final model path: {model_path}")
        print("="*60 + "\n")

        # Auto-enable runs structure output
        if not args.use_runs_structure and run_dir_for_eval:
            args.use_runs_structure = True
            args.runs_dir = str(run_dir_for_eval.parent.parent)  # runs/<method>/../ = runs/

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
        batch_size=args.batch_size,
        num_workers=args.num_workers,
        no_timestamp=args.no_timestamp,
        runs_dir=args.runs_dir,
        use_runs_structure=args.use_runs_structure,
        eval_id=args.eval_id,
        nl_mode=args.nl_mode,
        domain_nl_mode=args.domain_nl_mode,
        json_mode=args.json_mode,
        domain_json_mode=args.domain_json_mode,
        run_dir=run_dir_for_eval,
        prompt_template_path=args.prompt_template,
    )

if __name__ == "__main__":
    main()
