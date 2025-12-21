#!/usr/bin/env python3
"""
简单测试脚本：测试 gpt-oss-20b 模型 (unsloth 4bit 版本)
支持 high reasoning 模式
"""
import torch
from unsloth import FastLanguageModel

def test_gpt_oss_20b(
    model_name: str = "unsloth/gpt-oss-20b-unsloth-bnb-4bit",
    reasoning_effort: str = "high",  # "low", "medium", "high"
    max_seq_length: int = 4096,
    max_new_tokens: int = 512,
    temperature: float = 0.6,
):
    """
    测试 gpt-oss-20b 模型

    Args:
        model_name: 模型名称 (HuggingFace 路径)
        reasoning_effort: 推理努力程度 ("low", "medium", "high")
        max_seq_length: 最大序列长度
        max_new_tokens: 最大生成 token 数
        temperature: 温度参数
    """
    print(f"="*60)
    print(f"Testing model: {model_name}")
    print(f"Reasoning effort: {reasoning_effort}")
    print(f"Max seq length: {max_seq_length}")
    print(f"Max new tokens: {max_new_tokens}")
    print(f"Temperature: {temperature}")
    print(f"="*60)

    # 加载模型
    print("\nLoading model...")
    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=model_name,
        max_seq_length=max_seq_length,
        dtype=None,  # 自动检测
        load_in_4bit=True,
    )

    # 准备推理模式
    FastLanguageModel.for_inference(model)
    print("Model loaded successfully!")

    # 构建带 reasoning effort 的系统提示
    system_prompt = f"""You are a helpful AI assistant. Reasoning: {reasoning_effort}"""

    # 简单测试 prompt
    user_prompt = """Solve this simple blocksworld problem:

Initial state: Block A is on the table. Block B is on top of A.
Goal: Block A is on top of Block B.

Actions available:
- (pick-up ?x) - pick up block from table
- (put-down ?x) - put block on table
- (stack ?x ?y) - stack x on y
- (unstack ?x ?y) - unstack x from y

Output ONLY the plan steps in format: (action param1 param2 ...)"""

    # 构建消息
    messages = [
        {"role": "system", "content": system_prompt},
        {"role": "user", "content": user_prompt},
    ]

    print(f"\n{'='*40}")
    print("Input messages:")
    print(f"System: {system_prompt}")
    print(f"User: {user_prompt[:100]}...")
    print(f"{'='*40}")

    # 使用 tokenizer 的 chat template
    inputs = tokenizer.apply_chat_template(
        messages,
        tokenize=True,
        add_generation_prompt=True,
        return_tensors="pt"
    ).to(model.device)

    print(f"\nInput tokens: {inputs.shape[1]}")
    print("Generating response...")

    # 生成
    with torch.no_grad():
        outputs = model.generate(
            input_ids=inputs,
            max_new_tokens=max_new_tokens,
            temperature=temperature,
            do_sample=True if temperature > 0 else False,
            use_cache=True,
            pad_token_id=tokenizer.eos_token_id,
        )

    # 解码输出（只取生成的部分）
    generated_tokens = outputs[0][inputs.shape[1]:]
    response = tokenizer.decode(generated_tokens, skip_special_tokens=True)

    print(f"\n{'='*40}")
    print("Response:")
    print(f"{'='*40}")
    print(response)
    print(f"\n{'='*40}")
    print(f"Generated tokens: {len(generated_tokens)}")

    return response


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Test gpt-oss-20b with high reasoning")
    parser.add_argument("--model", type=str, default="unsloth/gpt-oss-20b-unsloth-bnb-4bit",
                       help="Model name (default: unsloth/gpt-oss-20b-unsloth-bnb-4bit)")
    parser.add_argument("--reasoning", type=str, default="high",
                       choices=["low", "medium", "high"],
                       help="Reasoning effort level (default: high)")
    parser.add_argument("--max-tokens", type=int, default=512,
                       help="Max new tokens to generate (default: 512)")
    parser.add_argument("--temperature", type=float, default=0.6,
                       help="Temperature (default: 0.6)")

    args = parser.parse_args()

    test_gpt_oss_20b(
        model_name=args.model,
        reasoning_effort=args.reasoning,
        max_new_tokens=args.max_tokens,
        temperature=args.temperature,
    )
