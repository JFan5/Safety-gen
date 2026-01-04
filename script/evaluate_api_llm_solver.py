#!/usr/bin/env python3
"""
API-based PDDL Plan Evaluator
通过API调用（如OpenAI ChatGPT）评估模型生成计划并用VAL验证。
支持多个场景和多个LLM模型。
输出结果保存为JSON。
"""
import os
import sys
import json
import random
import time
from pathlib import Path
from datetime import datetime
import re
from typing import Optional
from concurrent.futures import ThreadPoolExecutor, as_completed
from threading import Lock
from collections import defaultdict
from utils import _classify_result, validate_solution
import argparse

try:
    from openai import OpenAI
except ImportError:
    print("Warning: openai package not found. Please install it with: pip install openai")
    OpenAI = None

# 配置参数
# 默认不限制 completion tokens，上限可通过环境变量 MAX_NEW_TOKENS 设置
# 注意：None 表示不传 max_tokens/max_completion_tokens，让服务端自行决定
_max_new_tokens_env = os.getenv("MAX_NEW_TOKENS")
MAX_NEW_TOKENS = int(_max_new_tokens_env) if _max_new_tokens_env else None
# OpenAI 请求超时（秒），可通过环境变量覆盖
# gpt-5 推理模型需要更长的超时时间
OPENAI_TIMEOUT = float(os.getenv("OPENAI_TIMEOUT", "300"))  # 增加到300秒（5分钟）
# 并发线程数（可通过环境变量覆盖）
MAX_WORKERS = int(os.getenv("MAX_WORKERS", "5"))  # 默认5个并发线程
# 生成失败重试次数（可通过环境变量覆盖）
MAX_RETRIES = int(os.getenv("MAX_RETRIES", "5"))  # 默认重试3次

# 模型家族映射
MODEL_FAMILY_MAP = {
    'mistral': 'mistral',
    'llama': 'llama', 
    'phi': 'phi',
    'qwen': 'qwen',
    'gemma': 'gemma',
    'gpt': 'gpt',
    'openai': 'gpt',
    'chatgpt': 'gpt',
    'claude': 'gpt',  # Claude使用类似GPT的格式
}

# API模型配置
API_MODEL_CONFIG = {
    'gpt-5': {
        'provider': 'openai',
        'model_name': 'gpt-5-mini-2025-08-07',
        'family': 'gpt',
        'use_responses_api': False,  # 使用传统的 chat.completions API
        'reasoning_effort': None
    },
    'gpt-5.1': {
        'provider': 'openai',
        'model_name': 'gpt-5.1',
        'family': 'gpt',
        'use_responses_api': True,  # 使用新的 responses API
        'reasoning_effort': 'high'  # high reasoning effort
    },
    'gpt-4': {
        'provider': 'openai',
        'model_name': 'gpt-4',
        'family': 'gpt',
        'use_responses_api': False,
        'reasoning_effort': None
    },
    'gpt-4-turbo': {
        'provider': 'openai',
        'model_name': 'gpt-4-turbo-preview',
        'family': 'gpt',
        'use_responses_api': False,
        'reasoning_effort': None
    },
    'gpt-3.5-turbo': {
        'provider': 'openai',
        'model_name': 'gpt-3.5-turbo',
        'family': 'gpt',
        'use_responses_api': False,
        'reasoning_effort': None
    },
    'chatgpt': {
        'provider': 'openai',
        'model_name': 'gpt-5-mini-2025-08-07',  # 默认使用gpt-5-mini-2025-08-07
        'family': 'gpt',
        'use_responses_api': False,
        'reasoning_effort': None
    },
}

def extract_llm_output(output, family='gpt'):
    """从模型输出中提取LLM生成的部分，不做action提取"""
    def _to_text_fragment(obj):
        """尽量从多种结构中提取文本"""
        if obj is None:
            return ""
        if isinstance(obj, str):
            return obj
        if isinstance(obj, dict):
            if 'text' in obj:
                return str(obj['text'])
            if 'content' in obj:
                return _to_text_fragment(obj['content'])
            return str(obj)
        # 对象可能有 text 或 content 属性
        if hasattr(obj, "text"):
            try:
                return str(obj.text)
            except Exception:
                pass
        if hasattr(obj, "content"):
            try:
                content_val = obj.content
                if isinstance(content_val, list):
                    return "\n".join(
                        frag for frag in (_to_text_fragment(c) for c in content_val) if frag
                    )
                return _to_text_fragment(content_val)
            except Exception:
                pass
        return str(obj)

    if output is None:
        return ""
    # 兼容部分SDK返回列表/对象（如content block）
    if isinstance(output, list):
        parts = []
        for item in output:
            frag = _to_text_fragment(item)
            if frag:
                parts.append(frag)
        output = "\n".join(parts)
    elif not isinstance(output, str):
        output = _to_text_fragment(output)
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
        print(f"Problems directory not found: {problems_dir}", flush=True)
        return []

    # 读取 domain 内容
    print(f"Reading domain file: {domain_file}...", flush=True)
    domain_content = ""
    if domain_file and Path(domain_file).exists():
        try:
            with open(domain_file, 'r', encoding='utf-8') as f:
                domain_content = f.read()
            print(f"Domain file loaded successfully", flush=True)
        except Exception as e:
            print(f"Error reading domain file {domain_file}: {e}", flush=True)
    else:
        print(f"Warning: Domain file not found: {domain_file}", flush=True)

    test_data = []
    print(f"Scanning for problem files in {problems_dir}...", flush=True)
    pddl_files = sorted(problems_path.glob('*.pddl'))
    # 过滤掉 domain 文件
    pddl_files = [f for f in pddl_files if 'domain' not in f.name.lower()]

    if not pddl_files:
        print(f"No problem files found in {problems_dir}", flush=True)
        return []
    
    print(f"Found {len(pddl_files)} problem files", flush=True)

    # 加载 prompt 模板
    prompt_template_file = 'prompt_oneshot.txt' if one_shot else 'prompt.txt'
    print(f"Loading prompt template: {prompt_template_file}...", flush=True)
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
        print(f"Prompt template loaded successfully", flush=True)
    except Exception as e:
        print(f"Error reading {prompt_template_file}: {e}", flush=True)
        prompt_template = "{problem_content}"

    # 如果使用 one-shot 模式，加载 example
    example_content = None
    if one_shot:
        scenario = _infer_scenario_name(problems_dir, domain_file)
        if scenario:
            print(f"Inferred scenario: {scenario}", flush=True)
            example_content = _load_one_shot_example(scenario)
            if example_content:
                print(f"Loaded one-shot example for scenario: {scenario}", flush=True)
            else:
                print(f"Warning: Failed to load one-shot example for scenario: {scenario}", flush=True)
        else:
            print(f"Warning: Could not infer scenario name from paths, one-shot example will not be included", flush=True)

    print(f"Processing {len(pddl_files)} problem files...", flush=True)
    for idx, pddl_file in enumerate(pddl_files, 1):
        if idx % 10 == 0 or idx == len(pddl_files) or idx == 1:
            print(f"  Processing file {idx}/{len(pddl_files)}: {pddl_file.name}", flush=True)
        problem_name = pddl_file.stem
        try:
            with open(pddl_file, 'r', encoding='utf-8') as f:
                problem_content = f.read()
            if idx == 1:
                print(f"  ✓ Successfully read first file (size: {len(problem_content)} chars)", flush=True)
            if idx == len(pddl_files):
                print(f"  ✓ Successfully read last file (size: {len(problem_content)} chars)", flush=True)
        except Exception as e:
            print(f"  ✗ Error reading {pddl_file}: {e}", flush=True)
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
    print(f"All {len(test_data)} problems loaded and processed", flush=True)
    return test_data


def _call_openai_api(
    client,
    model_name: str,
    prompt: str,
    temperature: float = 0.6,
    max_tokens: int = MAX_NEW_TOKENS,
    timeout: float = OPENAI_TIMEOUT,
    use_responses_api: bool = False,
    reasoning_effort: Optional[str] = None,
) -> tuple[str, Optional[dict]]:
    """调用OpenAI API，兼容新旧参数名，并在需要时移除 temperature
    支持新的 responses API (用于 gpt-5.1 等模型)
    """
    # 如果使用新的 responses API
    if use_responses_api:
        kwargs = {
            "model": model_name,
            "input": prompt,
        }
        if reasoning_effort:
            kwargs["reasoning"] = {"effort": reasoning_effort}
        if timeout is not None:
            kwargs["timeout"] = timeout
        
        print(f"    [OpenAI] Making responses API request with reasoning_effort={reasoning_effort}, timeout={timeout}s...", flush=True)
        call_start = time.time()
        
        # 添加进度提示
        import threading
        progress_stop = threading.Event()
        def progress_indicator():
            elapsed = 0
            while not progress_stop.is_set() and elapsed < timeout:
                time.sleep(10)
                if not progress_stop.is_set():
                    elapsed = time.time() - call_start
                    print(f"    [OpenAI] Still waiting... ({elapsed:.1f}s elapsed)", flush=True)
        
        progress_thread = threading.Thread(target=progress_indicator, daemon=True)
        progress_thread.start()
        
        try:
            response = client.responses.create(**kwargs)
        finally:
            progress_stop.set()
        
        call_elapsed = time.time() - call_start
        print(f"    [OpenAI] Responses API request completed in {call_elapsed:.2f}s", flush=True)
        
        # 处理 responses API 的响应格式
        try:
            # responses API 的响应格式可能不同，需要根据实际API调整
            if hasattr(response, 'output') and response.output:
                content = response.output
            elif hasattr(response, 'text'):
                content = response.text
            elif hasattr(response, 'choices') and len(response.choices) > 0:
                content = response.choices[0].text if hasattr(response.choices[0], 'text') else str(response.choices[0])
            else:
                content = str(response)
            
            usage_info = None
            if hasattr(response, 'usage') and response.usage:
                usage = response.usage
                usage_info = {
                    "completion_tokens": getattr(usage, "completion_tokens", None),
                    "prompt_tokens": getattr(usage, "prompt_tokens", None),
                    "total_tokens": getattr(usage, "total_tokens", None),
                    "reasoning_tokens": getattr(usage, "reasoning_tokens", None) if hasattr(usage, "reasoning_tokens") else None
                }
                print(f"  [OpenAI] Usage - completion: {usage_info.get('completion_tokens')}, prompt: {usage_info.get('prompt_tokens')}, total: {usage_info.get('total_tokens')}", flush=True)
                if usage_info.get('reasoning_tokens'):
                    print(f"  [OpenAI] Reasoning tokens: {usage_info.get('reasoning_tokens')}", flush=True)
            
            print(f"  [OpenAI] Response length: {len(content)} chars", flush=True)
            if len(content) > 0:
                print(f"  [OpenAI] Response preview (first 200 chars): {content[:200]}", flush=True)
            else:
                print(f"  [OpenAI] ⚠️  WARNING: Empty response!", flush=True)
            
            return content, usage_info
        except Exception as e:
            print(f"  [OpenAI] ✗ Error processing responses API response: {e}", flush=True)
            import traceback
            print(f"  [OpenAI] Traceback: {traceback.format_exc()}", flush=True)
            return "", None
    
    # 传统的 chat.completions API
    def _make_call(max_tokens_key: str, include_temperature: bool):
        kwargs = {
            "model": model_name,
            "messages": [{"role": "user", "content": prompt}],
        }
        if include_temperature and temperature is not None:
            kwargs["temperature"] = temperature
        if max_tokens is not None:
            kwargs[max_tokens_key] = max_tokens
        if timeout is not None:
            kwargs["timeout"] = timeout
        print(f"    [OpenAI] Making API request with timeout={timeout}s...", flush=True)
        call_start = time.time()
        # 添加进度提示（每10秒输出一次）
        import threading
        progress_stop = threading.Event()
        def progress_indicator():
            elapsed = 0
            while not progress_stop.is_set() and elapsed < timeout:
                time.sleep(10)
                if not progress_stop.is_set():
                    elapsed = time.time() - call_start
                    print(f"    [OpenAI] Still waiting... ({elapsed:.1f}s elapsed)", flush=True)
        
        progress_thread = threading.Thread(target=progress_indicator, daemon=True)
        progress_thread.start()
        
        try:
            response = client.chat.completions.create(**kwargs)
        finally:
            progress_stop.set()
        
        call_elapsed = time.time() - call_start
        print(f"    [OpenAI] API request completed in {call_elapsed:.2f}s", flush=True)
        return response

    errors = []
    usage_info = None
    # 依次尝试新旧 tokens 参数，并在必要时去掉 temperature，以适配不同模型限制
    for attempt_idx, (max_key, include_temp) in enumerate([
        ("max_completion_tokens", True),
        ("max_completion_tokens", False),
        ("max_tokens", True),
        ("max_tokens", False),
    ], 1):
        try_desc = f"model={model_name}, tokens_key={max_key}, temp={'on' if include_temp else 'off'}, timeout={timeout}"
        print(f"  [OpenAI] Attempt {attempt_idx}/4: {try_desc}", flush=True)
        try:
            response = _make_call(max_key, include_temp)
            print(f"  [OpenAI] ✓ API call completed successfully", flush=True)
            
            # 检查响应对象详情
            choice = response.choices[0]
            print(f"  [OpenAI] Finish reason: {choice.finish_reason}", flush=True)
            if hasattr(response, 'usage') and response.usage:
                usage = response.usage
                print(f"  [OpenAI] Usage - completion: {usage.completion_tokens}, prompt: {usage.prompt_tokens}, total: {usage.total_tokens}", flush=True)
                if hasattr(usage, 'completion_tokens_details') and usage.completion_tokens_details:
                    details = usage.completion_tokens_details
                    if hasattr(details, 'reasoning_tokens'):
                        print(f"  [OpenAI] Reasoning tokens: {details.reasoning_tokens}", flush=True)
                    usage_info = {
                        "completion_tokens": getattr(usage, "completion_tokens", None),
                        "prompt_tokens": getattr(usage, "prompt_tokens", None),
                        "total_tokens": getattr(usage, "total_tokens", None),
                        "reasoning_tokens": getattr(details, "reasoning_tokens", None)
                    }
                else:
                    usage_info = {
                        "completion_tokens": getattr(usage, "completion_tokens", None),
                        "prompt_tokens": getattr(usage, "prompt_tokens", None),
                        "total_tokens": getattr(usage, "total_tokens", None),
                        "reasoning_tokens": None
                    }
            
            content = choice.message.content
            if content is None:
                print(f"  [OpenAI] ⚠️  Warning: Response content is None", flush=True)
                content = ""
            print(f"  [OpenAI] Response length: {len(content)} chars", flush=True)
            
            if len(content) == 0:
                print(f"  [OpenAI] ⚠️  WARNING: Empty response! This may be due to insufficient max_completion_tokens.", flush=True)
                print(f"  [OpenAI] Current max_completion_tokens: {max_tokens}, try increasing it.", flush=True)
            else:
                print(f"  [OpenAI] Response preview (first 200 chars): {content[:200]}", flush=True)
            
            return content, usage_info
        except Exception as e:
            error_msg = str(e)
            errors.append(error_msg)
            print(f"  [OpenAI] ✗ API call failed: {error_msg}", flush=True)
            # 如果是超时错误，直接返回，不再尝试
            if "timeout" in error_msg.lower() or "timed out" in error_msg.lower():
                print(f"  [OpenAI] Timeout error detected, stopping attempts", flush=True)
                break
            continue

    print(f"  [OpenAI] ✗ All API call attempts failed: {' | '.join(errors)}", flush=True)
    return "", usage_info


def test_api_model_on_testing_data(
    model_name: str,
    api_key: str = None,
    output_file="test_results.json",
    family='gpt',
    max_problems: int = 0,
    problems_dir: str = None,
    domain_file: str = None,
    temperature: float = 0.6,
    one_shot: bool = False,
    provider: str = 'openai',
    max_workers: int = None,
    use_responses_api: bool = False,
    reasoning_effort: Optional[str] = None
):
    """
    在testing数据上测试API模型并计算成功率
    
    Args:
        model_name: API模型名称（如 'gpt-4', 'gpt-3.5-turbo'）
        api_key: API密钥（如果为None，从环境变量获取）
        output_file: 输出JSON文件路径（会自动添加时间戳）
        family: 模型家族
        max_problems: 最大问题数量
        problems_dir: 问题文件目录
        domain_file: domain文件路径
        temperature: 文本生成的温度参数（默认: 0.6）
        one_shot: 是否使用one-shot模式
        provider: API提供商（'openai'等）
    """
    print(f"Testing API model: {model_name}", flush=True)
    print(f"Provider: {provider}", flush=True)
    print(f"Problems dir: {problems_dir}", flush=True)
    print(f"Domain file: {domain_file}", flush=True)
    print(f"Max problems: {max_problems}", flush=True)
    print(f"Output: {output_file}", flush=True)
    scenario_name = _infer_scenario_name(problems_dir, domain_file)
    if scenario_name:
        print(f"Detected scenario: {scenario_name}", flush=True)
    else:
        print(f"Detected scenario: Unknown (size统计将使用通用规则)", flush=True)
    
    # 自动检测模型家族
    if family == 'auto':
        model_name_lower = model_name.lower()
        for model_type, model_family in MODEL_FAMILY_MAP.items():
            if model_type in model_name_lower:
                family = model_family
                break
        else:
            family = 'gpt'  # 默认使用gpt格式
        print(f"Auto-detected model family: {family}", flush=True)
    
    # 加载测试数据
    if not problems_dir or not domain_file:
        print("--problems-dir 和 --domain-file 都是必需参数。", flush=True)
        return
    
    if one_shot:
        print("Using one-shot mode with examples", flush=True)
    
    print(f"[Stage 1/4] Loading problems from directory...", flush=True)
    print(f"  Problems directory: {problems_dir}", flush=True)
    print(f"  Domain file: {domain_file}", flush=True)
    test_data = _load_problems_from_dir(problems_dir, domain_file, one_shot=one_shot)
    print(f"[Stage 1/4] Loaded {len(test_data)} problems", flush=True)
    
    if max_problems and max_problems > 0 and len(test_data) > max_problems:
        print(f"[Stage 1/4] Sampling {max_problems} problems from {len(test_data)} total problems...", flush=True)
        random.seed(42)
        test_data = random.sample(test_data, max_problems)
        print(f"[Stage 1/4] Sampled {len(test_data)} problems", flush=True)
    
    if not test_data:
        print("[Stage 1/4] ERROR: No testing data found!", flush=True)
        return
    
    print(f"[Stage 1/4] ✓ Completed: {len(test_data)} problems ready for testing", flush=True)
    print(f"\n{'='*80}", flush=True)
    print(f"Starting evaluation: {len(test_data)} problems to test", flush=True)
    print(f"{'='*80}\n", flush=True)
    
    # 初始化API客户端
    print(f"[Stage 2/4] Initializing API client...", flush=True)
    print(f"  Provider: {provider}", flush=True)
    print(f"  Model: {model_name}", flush=True)
    print(f"  Family: {family}", flush=True)
    if provider == 'openai':
        if OpenAI is None:
            print("Error: openai package not installed. Please install it with: pip install openai", flush=True)
            return
        
        if api_key is None:
            # 优先使用 OPENAI_API_KEY，其次兼容本地 CPSL_OPENAI_KEY
            api_key = os.getenv('OPENAI_API_KEY') or os.getenv('CPSL_OPENAI_KEY')
            if not api_key:
                print("Error: OpenAI API key not provided. Set OPENAI_API_KEY or CPSL_OPENAI_KEY environment variable, or use --api-key", flush=True)
                return
        
        client = OpenAI(api_key=api_key)
        print(f"[Stage 2/4] ✓ API client initialized successfully", flush=True)
    else:
        print(f"[Stage 2/4] ERROR: Unsupported provider: {provider}", flush=True)
        return
    
    # 测试结果
    print(f"[Stage 3/4] Starting evaluation loop...", flush=True)
    print(f"  Total problems to evaluate: {len(test_data)}", flush=True)
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
    # 规模统计：按 sX-pY 记录成功/总数
    size_stats = defaultdict(lambda: {"total": 0, "success": 0})
    
    # 线程安全的锁和计数器
    print_lock = Lock()
    results_lock = Lock()
    completed_count = [0]  # 使用列表以便在闭包中修改
    
    def process_single_problem(sample, index):
        """处理单个问题的函数，用于多线程执行"""
        problem_name = sample['problem_name']
        problem_file = sample.get('problem_file')
        size_key = _extract_size_key(problem_name, scenario_name)

        # 调用API生成解决方案（带重试逻辑）
        generation_error = None
        output = ""
        usage_info = None
        raw_solution = ""
        retry_count = 0

        with print_lock:
            print(f"\n{'='*80}", flush=True)
            print(f"Test {index}/{total_count} - Problem: {problem_name}", flush=True)
            print(f"{'='*80}", flush=True)
            print(f"[Step 1/3] Calling API to generate solution...", flush=True)
            print(f"  Model: {model_name}, Temperature: {temperature}, Max tokens: {MAX_NEW_TOKENS}", flush=True)

        # 重试循环
        for attempt in range(MAX_RETRIES + 1):
            generation_error = None
            output = ""

            if attempt > 0:
                with print_lock:
                    print(f"  [Retry {attempt}/{MAX_RETRIES}] Retrying API call for {problem_name}...", flush=True)
                # 重试前等待一小段时间，避免过于频繁的请求
                time.sleep(2 * attempt)

            api_start_time = time.time()
            try:
                if provider == 'openai':
                    with print_lock:
                        print(f"  [Thread] Making API request for {problem_name}...", flush=True)
                    output, usage_info = _call_openai_api(
                        client,
                        model_name,
                        sample['prompt'],
                        temperature,
                        MAX_NEW_TOKENS,
                        OPENAI_TIMEOUT,
                        use_responses_api=use_responses_api,
                        reasoning_effort=reasoning_effort,
                    )
                    api_elapsed = time.time() - api_start_time
                    with print_lock:
                        print(f"  [Thread] ✓ API call completed for {problem_name} in {api_elapsed:.2f} seconds", flush=True)
                else:
                    generation_error = f"Unsupported provider: {provider}"
                    break  # 不支持的 provider 不需要重试

                if output:
                    with print_lock:
                        print(f"[Step 2/3] Extracting solution from API response for {problem_name}...", flush=True)
                        print(f"  Response length: {len(output)} chars", flush=True)
                    raw_solution = extract_llm_output(output, family)
                    with print_lock:
                        print(f"  ✓ Solution extracted for {problem_name} (length: {len(raw_solution)} chars)", flush=True)
                    # 成功获取响应，跳出重试循环
                    break
                else:
                    generation_error = "Empty response from API"
                    retry_count = attempt + 1
                    with print_lock:
                        print(f"[Step 2/3] ✗ Warning: Empty response from API for {problem_name} (attempt {attempt + 1}/{MAX_RETRIES + 1})", flush=True)
                    # 继续重试
            except Exception as e:
                generation_error = f"API Error: {str(e)}"
                retry_count = attempt + 1
                with print_lock:
                    print(f"[Step 1/3] ✗ Error for {problem_name}: {generation_error} (attempt {attempt + 1}/{MAX_RETRIES + 1})", flush=True)
                    import traceback
                    print(f"  Traceback: {traceback.format_exc()}", flush=True)
                # 继续重试

        # 如果所有重试都失败，记录最终的重试次数
        if generation_error and retry_count > 0:
            with print_lock:
                print(f"  [Thread] ✗ All {retry_count} attempts failed for {problem_name}", flush=True)
        
        # 验证解决方案
        validation_message = ""
        validation_stdout = ""
        validation_stderr = ""
        category = ""
        
        with print_lock:
            print(f"[Step 3/3] Validating solution for {problem_name}...", flush=True)
        
        if generation_error:
            category = "generation_error"
            validation_message = f"Generation failed: {generation_error}"
            val_cmd = ""
            with print_lock:
                print(f"[Step 3/3] Skipping validation for {problem_name} due to generation error", flush=True)
        elif problem_file and Path(problem_file).exists():
            if raw_solution.strip():
                _, message, stdout, stderr, val_cmd = validate_solution(domain_file, problem_file, raw_solution)
                validation_message = message
                validation_stdout = stdout
                validation_stderr = stderr
                
                if not _looks_like_valid_plan(raw_solution):
                    category = "plan_format_error"
                    with print_lock:
                        print(f"[Step 3/3] Validation result for {problem_name}: Plan format error", flush=True)
                else:
                    category = _classify_result(stdout)
                    with print_lock:
                        print(f"[Step 3/3] Validation result for {problem_name}: {category}", flush=True)
            else:
                category = "plan_format_error"
                validation_message = "Empty solution generated"
                val_cmd = ""
                with print_lock:
                    print(f"[Step 3/3] Validation result for {problem_name}: Empty solution", flush=True)
        else:
            category = "others"
            validation_message = f"Problem file not found: {problem_file}"
            val_cmd = ""
            with print_lock:
                print(f"[Step 3/3] Validation result for {problem_name}: Problem file not found", flush=True)
        
        is_valid = (category == "success_plans")
        
        # 记录结果
        result = {
            'index': index,
            'problem_name': problem_name,
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
            'retry_count': retry_count,
            'usage': usage_info
        }
        
        # 更新统计（线程安全）
        with results_lock:
            if category in category_counts:
                category_counts[category] += 1
            else:
                if "others" not in category_counts:
                    category_counts["others"] = 0
                category_counts["others"] += 1
            
            completed_count[0] += 1
            current_completed = completed_count[0]
            success_count = category_counts.get("success_plans", 0)
            current_success_rate = (success_count / current_completed) * 100 if current_completed > 0 else 0
            
            category_display = {
                "success_plans": "✓ Success",
                "plan_format_error": "✗ Plan Format Error",
                "precondition_violation": "✗ Precondition Violation",
                "safety_constraints_violation": "✗ Safety Constraints Violation",
                "goal_not_satisfied": "✗ Goal Not Satisfied",
                "others": "✗ Others",
            }
            
            print(f"\n[Thread] Result for {problem_name}: {category_display.get(category, '✗ Unknown')} ({category})", flush=True)
            print(f"[Thread] Progress: {current_completed}/{total_count} ({current_completed/total_count*100:.1f}%)", flush=True)
            print(f"[Thread] Current success rate: {current_success_rate:.1f}% ({success_count}/{current_completed})", flush=True)
            print(f"[Thread] Category breakdown: {dict(category_counts)}", flush=True)
            
            # 更新规模统计
            if size_key:
                size_stats[size_key]["total"] += 1
                if is_valid:
                    size_stats[size_key]["success"] += 1
            print(f"{'='*80}\n", flush=True)
        
        return result
    
    # 确定使用的并发数
    workers = max_workers if max_workers is not None else MAX_WORKERS
    # 使用线程池并行处理
    print(f"[Stage 3/4] Starting parallel evaluation with {workers} workers...", flush=True)
    print(f"  Total problems to evaluate: {total_count}", flush=True)
    print(f"  Concurrent threads: {workers}", flush=True)
    
    # 为每个问题创建任务
    futures = {}
    with ThreadPoolExecutor(max_workers=workers) as executor:
        for i, sample in enumerate(test_data, 1):
            future = executor.submit(process_single_problem, sample, i)
            futures[future] = (i, sample['problem_name'])
        
        # 收集结果（按完成顺序）
        for future in as_completed(futures):
            index, problem_name = futures[future]
            try:
                result = future.result()
                results.append(result)
            except Exception as e:
                with print_lock:
                    print(f"✗ Error processing {problem_name}: {e}", flush=True)
                import traceback
                with print_lock:
                    print(f"  Traceback: {traceback.format_exc()}", flush=True)
                # 创建错误结果
                results.append({
                    'index': index,
                    'problem_name': problem_name,
                    'problem_file': None,
                    'is_valid': False,
                    'category': 'others',
                    'validation_message': f"Processing error: {str(e)}",
                    'validation_stdout': '',
                    'validation_stderr': '',
                    'validation_cmd': '',
                    'raw_solution': '',
                    'generation_error': f"Processing error: {str(e)}"
                })
    
    # 按索引排序结果
    results.sort(key=lambda x: x['index'])
    
    # 计算最终成功率
    success_count = category_counts.get("success_plans", 0)
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
    
    print(f"\n{'='*80}", flush=True)
    print(f"[Stage 4/4] Evaluation completed, preparing to save results...", flush=True)
    print(f"  Success rate: {final_success_rate:.2f}% ({success_count}/{total_count})", flush=True)
    print(f"  Total tests: {total_count}", flush=True)
    print(f"{'='*80}\n", flush=True)
    
    # 自动生成输出文件名并加上时间戳
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    timestamp_iso = datetime.now().isoformat()
    
    # 处理输出文件名，添加时间戳和 oneshot 后缀（如果使用 one-shot 模式）
    output_file_path = Path(output_file)
    if output_file == "test_results.json":
        # 如果使用默认文件名，生成带时间戳的文件名
        model_name_clean = model_name.replace('/', '_').replace('\\', '_')
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
    
    output_data = {
        'timestamp': timestamp_iso,
        'model_name': model_name,
        'provider': provider,
        'scenario': scenario_name,
        'problems_dir': str(problems_dir),
        'domain_file': str(domain_file),
        'max_problems': max_problems,
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
        'results': results
    }
    
    print(f"\n{'='*80}", flush=True)
    print(f"Saving results to file...", flush=True)
    with open(output_file_path, 'w', encoding='utf-8') as f:
        json.dump(output_data, f, indent=2, ensure_ascii=False)
    print(f"Results saved successfully!", flush=True)
    
    print(f"\n" + "="*60, flush=True)
    print(f"FINAL RESULTS", flush=True)
    print(f"="*60, flush=True)
    print(f"Total tests: {total_count}", flush=True)
    print(f"Success plans: {success_count}", flush=True)
    print(f"Success rate: {final_success_rate:.1f}%", flush=True)
    print(f"\nCategory Breakdown:", flush=True)
    for category, count in category_counts.items():
        rate = (count / total_count * 100) if total_count > 0 else 0
        print(f"  {category}: {count} ({rate:.1f}%)", flush=True)
    if size_success_rates:
        print(f"\nSuccess by Problem Size:", flush=True)
        for size_key in sorted(size_success_rates.keys()):
            stats = size_success_rates[size_key]
            print(f"  {size_key}: {stats['success']}/{stats['total']} ({stats['success_rate']:.1f}%)", flush=True)
    print(f"\nResults saved to: {output_file_path}", flush=True)
    print(f"{'='*60}\n", flush=True)


def main():
    """主函数"""
    import argparse
    
    # 固定使用gpt-5模型（可以通过修改这里来测试不同模型，如 "gpt-5.1"）
    DEFAULT_MODEL = "gpt-5.1"  # 测试 gpt-5.1 的 medium reason
    
    parser = argparse.ArgumentParser(description="Evaluate API-based LLM model (GPT-5) with explicit domain and problems directory")
    parser.add_argument("--api-key", type=str, default=None,
                       help="API key (if not provided, will use OPENAI_API_KEY environment variable)")
    parser.add_argument("--provider", type=str, default="openai",
                       choices=["openai"],
                       help="API provider (default: openai)")
    parser.add_argument("--output", type=str, default="test_results.json",
                       help="Output JSON file name")
    parser.add_argument("--family", choices=["mistral", "llama", "phi", "qwen", "gemma", "gpt", "auto"], 
                       default="auto", help="Model family (auto for automatic detection)")
    parser.add_argument("--max-problems", type=int, default=0,
                       help="Maximum number of problems to test (0 for all)")
    parser.add_argument("--problems-dir", type=str, required=True,
                       help="包含多个 problem PDDL 的目录")
    parser.add_argument("--domain-file", type=str, required=True,
                       help="对应的 domain PDDL 文件路径")
    parser.add_argument("--temperature", type=float, default=0.6,
                       help="Temperature for text generation (default: 0.6)")
    parser.add_argument("--one-shot", dest='one_shot', action='store_true',
                       help="Use one-shot mode with examples from one_shot_example folder (default: False)")
    parser.add_argument("--no-one-shot", dest='one_shot', action='store_false',
                       help="Disable one-shot mode (default)")
    parser.set_defaults(one_shot=False)
    parser.add_argument("--max-workers", type=int, default=None,
                       help=f"Maximum number of concurrent threads (default: {MAX_WORKERS}, or set MAX_WORKERS env var)")
    
    args = parser.parse_args()
    
    # 使用固定的gpt-5模型配置
    model_name = DEFAULT_MODEL.lower()
    use_responses_api = False
    reasoning_effort = None
    
    if model_name in API_MODEL_CONFIG:
        config = API_MODEL_CONFIG[model_name]
        actual_model_name = config['model_name']
        if args.family == 'auto':
            args.family = config['family']
        if args.provider == 'openai':
            args.provider = config['provider']
        # 获取 responses API 相关配置
        use_responses_api = config.get('use_responses_api', False)
        reasoning_effort = config.get('reasoning_effort', None)
    else:
        actual_model_name = DEFAULT_MODEL
    
    # 某些 OpenAI 模型（如 gpt-5-nano, gpt-5-mini）只支持默认 temperature=1
    if args.provider == "openai" and ("gpt-5-nano" in actual_model_name or "gpt-5-mini" in actual_model_name):
        args.temperature = 1.0
    
    # 打印模型配置信息
    if use_responses_api:
        print(f"Using responses API with reasoning_effort={reasoning_effort}", flush=True)
    
    test_api_model_on_testing_data(
        actual_model_name,
        args.api_key,
        args.output,
        args.family,
        args.max_problems,
        problems_dir=args.problems_dir,
        domain_file=args.domain_file,
        temperature=args.temperature,
        one_shot=args.one_shot,
        provider=args.provider,
        max_workers=args.max_workers,
        use_responses_api=use_responses_api,
        reasoning_effort=reasoning_effort
    )


if __name__ == "__main__":
    main()
