#!/usr/bin/env python3
"""
测试不同 temperature 值对 PDDL 计划生成的影响
"""
import sys
from pathlib import Path
import torch
from unsloth import FastLanguageModel

# 导入原脚本中的关键函数
from evaluate_llm_solver import (
    template_input, extract_llm_output, validate_solution,
    _load_problems_from_dir, classify_result, _looks_like_valid_plan,
    MODEL_FAMILY_MAP, max_seq_length, MAX_NEW_TOKENS, dtype
)

def eval_pddl_accuracy(model, tokenizer, test_data, domain_file, temperature, family='mistral'):
    """
    评估模型在给定 temperature 下的准确率
    
    Returns:
        tuple: (success_count, total_count, accuracy)
    """
    success_count = 0
    total_count = len(test_data)
    
    for i, sample in enumerate(test_data, 1):
        print(f"  Testing problem {i}/{total_count}: {sample['problem_name']}")
        
        # 准备输入
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
        
        # 确保输入在正确的设备上
        if hasattr(model, 'device'):
            inputs = inputs.to(model.device)
        else:
            try:
                device = next(model.parameters()).device
                inputs = inputs.to(device)
            except:
                pass
        
        # 生成解决方案
        generation_error = None
        output = ""
        try:
            # 安全获取 pad_token_id
            pad_token_id = None
            if hasattr(tokenizer, 'eosf_token_id') and tokenizer.eosf_token_id is not None:
                pad_token_id = tokenizer.eosf_token_id
            elif hasattr(tokenizer, 'eos_token_id') and tokenizer.eos_token_id is not None:
                pad_token_id = tokenizer.eos_token_id
            elif hasattr(tokenizer, 'pad_token_id') and tokenizer.pad_token_id is not None:
                pad_token_id = tokenizer.pad_token_id
            
            with torch.no_grad():
                outputs = model.generate(
                    input_ids=inputs,
                    temperature=temperature,
                    top_p=0.9,
                    do_sample=True,
                    max_new_tokens=MAX_NEW_TOKENS,
                    pad_token_id=pad_token_id,
                )
            output = tokenizer.batch_decode(outputs, skip_special_tokens=False)[0]
        except Exception as e:
            generation_error = str(e)
            print(f"    Generation error: {generation_error}")
            continue
        
        # 提取计划
        raw_solution = extract_llm_output(output, family) if output else ""
        
        # 验证解决方案
        if generation_error or not raw_solution.strip():
            continue
        
        problem_file = sample.get('problem_file')
        if not problem_file or not Path(problem_file).exists():
            continue
        
        # 检查格式
        if not _looks_like_valid_plan(raw_solution):
            continue
        
        # 使用 VAL 验证
        valid, message, stdout, stderr, val_cmd = validate_solution(
            domain_file, problem_file, raw_solution
        )
        
        # 检查是否成功
        if valid:
            category = classify_result(stdout)
            if category == "success_plans":
                success_count += 1
    
    accuracy = (success_count / total_count * 100) if total_count > 0 else 0
    return success_count, total_count, accuracy


def main():
    import argparse
    
    parser = argparse.ArgumentParser(description="Test temperature impact on PDDL planning")
    parser.add_argument("--model", type=str, required=True, help="Path to model")
    parser.add_argument("--problems-dir", type=str, required=True, help="Problems directory")
    parser.add_argument("--domain-file", type=str, required=True, help="Domain PDDL file")
    parser.add_argument("--max-problems", type=int, default=10, help="Max problems to test (default: 10)")
    parser.add_argument("--family", choices=["mistral", "llama", "phi", "qwen", "gemma", "auto"], 
                       default="auto", help="Model family")
    parser.add_argument("--load-in-4bit", dest='load_in_4bit', action='store_true', default=True,
                       help="Load model in 4-bit quantization")
    parser.add_argument("--no-load-in-4bit", dest='load_in_4bit', action='store_false',
                       help="Disable 4-bit quantization")
    parser.add_argument("--temps", type=float, nargs='+', default=[0.1, 0.3, 0.5, 0.7],
                       help="Temperature values to test (default: 0.1 0.3 0.5 0.7)")
    
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
    
    # 加载测试数据
    print(f"Loading problems from: {args.problems_dir}")
    test_data = _load_problems_from_dir(args.problems_dir, args.domain_file)
    if args.max_problems > 0 and len(test_data) > args.max_problems:
        import random
        random.seed(42)
        test_data = random.sample(test_data, args.max_problems)
    
    if not test_data:
        print("No test data found!")
        return
    
    print(f"Loaded {len(test_data)} problems for testing")
    
    # 加载模型
    print("Loading model...")
    try:
        model, tokenizer = FastLanguageModel.from_pretrained(
            model_name=args.model,
            max_seq_length=max_seq_length,
            dtype=dtype,
            load_in_4bit=args.load_in_4bit,
        )
    except ValueError as e:
        if "GPU RAM" in str(e):
            print("GPU RAM insufficient, trying with CPU offload...")
            try:
                model, tokenizer = FastLanguageModel.from_pretrained(
                    model_name=args.model,
                    max_seq_length=max_seq_length,
                    dtype=dtype,
                    load_in_4bit=args.load_in_4bit,
                    llm_int8_enable_fp32_cpu_offload=True,
                    device_map="auto"
                )
            except Exception as e2:
                print("CPU offload failed, trying 8-bit quantization...")
                model, tokenizer = FastLanguageModel.from_pretrained(
                    model_name=args.model,
                    max_seq_length=max_seq_length,
                    dtype=dtype,
                    load_in_8bit=True,
                    device_map="auto"
                )
        else:
            raise e
    
    FastLanguageModel.for_inference(model)
    print("Model loaded successfully\n")
    
    # 测试不同 temperature 值
    print("="*60)
    print("Testing different temperature values")
    print("="*60)
    
    results = []
    temps = args.temps
    
    for T in temps:
        print(f"\nTemperature = {T}")
        print("-" * 60)
        
        success_count, total_count, accuracy = eval_pddl_accuracy(
            model, tokenizer, test_data, args.domain_file, T, family
        )
        
        results.append({
            'temperature': T,
            'success_count': success_count,
            'total_count': total_count,
            'accuracy': accuracy
        })
        
        print(f"T={T}: accuracy={accuracy:.2f}% ({success_count}/{total_count})")
    
    # 打印总结
    print("\n" + "="*60)
    print("SUMMARY")
    print("="*60)
    for result in results:
        print(f"T={result['temperature']:.1f}: accuracy={result['accuracy']:.2f}% "
              f"({result['success_count']}/{result['total_count']})")
    
    # 找出最佳 temperature
    best_result = max(results, key=lambda x: x['accuracy'])
    print(f"\nBest temperature: T={best_result['temperature']:.1f} "
          f"(accuracy={best_result['accuracy']:.2f}%)")


if __name__ == "__main__":
    main()

