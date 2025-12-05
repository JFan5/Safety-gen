#!/usr/bin/env python3
"""
API-based PDDL Plan Evaluator
通过API调用（如OpenAI ChatGPT）评估模型生成计划并用VAL验证。
支持多个场景和多个LLM模型。
输出结果保存为JSON。
"""
import os
import json
import random
from pathlib import Path
from datetime import datetime
import re
from typing import Optional
from utils import _classify_result, validate_solution

try:
    from openai import OpenAI
except ImportError:
    print("Warning: openai package not found. Please install it with: pip install openai")
    OpenAI = None

# 配置参数
MAX_NEW_TOKENS = 512

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
    'gpt-4': {
        'provider': 'openai',
        'model_name': 'gpt-4',
        'family': 'gpt'
    },
    'gpt-4-turbo': {
        'provider': 'openai',
        'model_name': 'gpt-4-turbo-preview',
        'family': 'gpt'
    },
    'gpt-3.5-turbo': {
        'provider': 'openai',
        'model_name': 'gpt-3.5-turbo',
        'family': 'gpt'
    },
    'chatgpt': {
        'provider': 'openai',
        'model_name': 'gpt-4',  # 默认使用gpt-4
        'family': 'gpt'
    },
}

def extract_llm_output(output, family='gpt'):
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


def _call_openai_api(client, model_name: str, prompt: str, temperature: float = 0.6, max_tokens: int = MAX_NEW_TOKENS) -> str:
    """调用OpenAI API"""
    try:
        response = client.chat.completions.create(
            model=model_name,
            messages=[
                {"role": "user", "content": prompt}
            ],
            temperature=temperature,
            max_tokens=max_tokens
        )
        return response.choices[0].message.content
    except Exception as e:
        print(f"API call error: {e}")
        return ""


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
    provider: str = 'openai'
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
    print(f"Testing API model: {model_name}")
    print(f"Provider: {provider}")
    print(f"Problems dir: {problems_dir}")
    print(f"Domain file: {domain_file}")
    print(f"Max problems: {max_problems}")
    print(f"Output: {output_file}")
    
    # 自动检测模型家族
    if family == 'auto':
        model_name_lower = model_name.lower()
        for model_type, model_family in MODEL_FAMILY_MAP.items():
            if model_type in model_name_lower:
                family = model_family
                break
        else:
            family = 'gpt'  # 默认使用gpt格式
        print(f"Auto-detected model family: {family}")
    
    # 加载测试数据
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
    
    # 初始化API客户端
    if provider == 'openai':
        if OpenAI is None:
            print("Error: openai package not installed. Please install it with: pip install openai")
            return
        
        if api_key is None:
            api_key = os.getenv('OPENAI_API_KEY')
            if not api_key:
                print("Error: OpenAI API key not provided. Set OPENAI_API_KEY environment variable or use --api-key")
                return
        
        client = OpenAI(api_key=api_key)
    else:
        print(f"Error: Unsupported provider: {provider}")
        return
    
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
        
        # 调用API生成解决方案
        generation_error = None
        output = ""
        raw_solution = ""
        
        try:
            if provider == 'openai':
                output = _call_openai_api(client, model_name, sample['prompt'], temperature, MAX_NEW_TOKENS)
            else:
                generation_error = f"Unsupported provider: {provider}"
            
            if output:
                raw_solution = extract_llm_output(output, family)
            else:
                generation_error = "Empty response from API"
        except Exception as e:
            generation_error = f"API Error: {str(e)}"
            print(generation_error)
        
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
                _, message, stdout, stderr, val_cmd = validate_solution(domain_file, problem_file, raw_solution)
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
            if "others" not in category_counts:
                category_counts["others"] = 0
            category_counts["others"] += 1
        
        is_valid = (category == "success_plans")

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
            'generation_error': generation_error
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
        success_count = category_counts.get("success_plans", 0)
        current_success_rate = (success_count / i) * 100
        print(f"Current success rate: {current_success_rate:.1f}% ({success_count}/{i})")
        print(f"Category breakdown: {dict(category_counts)}")
    
    # 计算最终成功率
    success_count = category_counts.get("success_plans", 0)
    final_success_rate = (success_count / total_count) * 100 if total_count > 0 else 0
    
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
    
    parser = argparse.ArgumentParser(description="Evaluate API-based LLM model (e.g., ChatGPT) with explicit domain and problems directory")
    parser.add_argument("--model", type=str, required=True,
                       help="API model name (e.g., 'gpt-4', 'gpt-3.5-turbo', 'chatgpt')")
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
    
    args = parser.parse_args()
    
    # 检查模型配置
    model_name = args.model.lower()
    if model_name in API_MODEL_CONFIG:
        config = API_MODEL_CONFIG[model_name]
        actual_model_name = config['model_name']
        if args.family == 'auto':
            args.family = config['family']
        if args.provider == 'openai':
            args.provider = config['provider']
    else:
        actual_model_name = args.model
    
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
        provider=args.provider
    )


if __name__ == "__main__":
    main()

