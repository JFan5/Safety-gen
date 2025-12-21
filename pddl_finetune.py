#!/usr/bin/env python3
"""
PDDL Fine-tuning with Unsloth
基于unsloth对PDDL规划任务进行fine-tune
支持使用 collect_dataset.py 收集的 blocksworld/delivery/logistics 多场景数据集
"""
import unsloth
import os
import random
import re
import torch
import wandb
from pathlib import Path
from typing import List, Optional
from datasets import load_from_disk, Dataset
from transformers import TrainerCallback, TrainingArguments, EarlyStoppingCallback

# Import Unsloth components
from unsloth import FastLanguageModel
from trl import SFTTrainer
from unsloth import is_bfloat16_supported, FastLanguageModel

# 配置参数
max_seq_length = 4096  # 最大序列长度
use_bf16 = is_bfloat16_supported()  # A100: True

# 选方案 A：BF16 + LoRA
load_in_4bit = True    # 方案 A 用 False；若想走 QLoRA，设 True
max_new_tokens = 512  # 最大生成token数

def template(prompt, path, system_prompt=None):
    """创建对话模板

    Args:
        prompt: 用户输入
        path: 助手回复（解决方案）
        system_prompt: 可选的系统提示（用于 GPT-OSS reasoning effort 等）
    """
    messages = []
    if system_prompt:
        messages.append({"role": "system", "content": system_prompt})
    messages.append({"role": "user", "content": prompt})
    messages.append({"role": "assistant", "content": path})
    return messages

def template_input(prompt, system_prompt=None):
    """创建输入模板"""
    messages = []
    if system_prompt:
        messages.append({"role": "system", "content": system_prompt})
    messages.append({"role": "user", "content": prompt})
    return messages

def template_output(path):
    """创建输出模板"""
    return [{"role": "assistant", "content": path}]


def get_system_prompt_for_family(family: str, reasoning_effort: str = None) -> str:
    """根据模型家族获取系统提示

    Args:
        family: 模型家族 (mistral, llama, phi, qwen, gpt, gpt-oss)
        reasoning_effort: 推理努力程度 (low, medium, high)，仅用于 gpt-oss

    Returns:
        系统提示字符串，或 None（如果不需要系统提示）

    Note:
        对于 GPT-OSS/DeepSeek-R1 模型，reasoning_effort 控制推理深度。
        如果 user prompt 中已包含完整指令，可以：
        1. 只设置 reasoning effort（不重复角色设定）
        2. 或者完全不使用 system_prompt（传入 reasoning_effort=None）
    """
    if family == 'gpt-oss' and reasoning_effort:
        # 只设置 reasoning effort，不重复 "You are a planning expert"（因为 user prompt 已包含）
        return f"Reasoning: {reasoning_effort}"
    return None


def extract_llm_output(output: str, family: str = 'mistral') -> str:
    """提取模型生成的计划文本，兼容多种Chat模板"""
    if not output:
        return ""
    text = output.strip()

    # 处理Mistral/SFT模板
    if '[/INST]' in text or family == 'mistral':
        parts = text.split('[/INST]')
        text = parts[-1].strip()
        if text.endswith('</s>'):
            text = text[:-4].strip()

    # 处理ChatML
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

    # 处理 assistant 标记
    elif 'assistant' in text and not text.startswith('assistant'):
        parts = text.split('assistant')
        text = parts[-1].lstrip(':').strip()

    # 移除特殊通道标记
    text = re.sub(r'<\|[^>]+?\|>', '', text).strip()

    # 移除可能残留的通道前缀
    text = re.sub(r'^(assistant|final|assistant_final)\s*[:\-]*', '', text, flags=re.IGNORECASE).lstrip()

    # 移除Phi等模板遗留的管道符
    text = re.sub(r'^\|>\s*', '', text)

    # 移除Qwen的思考标签
    if family == 'qwen':
        text = re.sub(r'<think>.*?</think>', '', text, flags=re.DOTALL | re.IGNORECASE).strip()

    # 处理 GPT-OSS/DeepSeek-R1 输出格式
    if family == 'gpt-oss':
        # 移除 <think>...</think> 标签
        text = re.sub(r'<think>.*?</think>', '', text, flags=re.DOTALL | re.IGNORECASE).strip()
        # 提取 assistantfinal 之后的内容
        if 'assistantfinal' in text.lower():
            parts = re.split(r'assistantfinal', text, flags=re.IGNORECASE)
            if len(parts) > 1:
                text = parts[-1].strip()
        # 移除 GPT-OSS 特殊标记
        text = re.sub(r'<[｜|][^>]+[｜|]>', '', text).strip()

    return text

class PDDLTestCallback(TrainerCallback):
    """PDDL测试回调，用于在训练过程中测试模型性能"""

    def __init__(self, model, tokenizer, test_prompt, family='mistral', system_prompt=None):
        self.model = model
        self.tokenizer = tokenizer
        self.test_prompt = test_prompt
        self.family = family
        self.system_prompt = system_prompt

    def on_save(self, args, state, control, **kwargs):
        """在保存检查点时测试模型"""
        print("\n" + "="*50)
        print("Testing model performance...")
        print("="*50)

        FastLanguageModel.for_inference(self.model)

        inputs = self.tokenizer.apply_chat_template(
            template_input(self.test_prompt, system_prompt=self.system_prompt),
            tokenize=True,
            add_generation_prompt=True,
            return_tensors="pt",
            enable_thinking=False,
        ).to("cuda")

        output = self.tokenizer.batch_decode(
            self.model.generate(input_ids=inputs, max_new_tokens=max_new_tokens)
        )[0]

        # 提取生成的解决方案
        path_w_tag = extract_llm_output(output, self.family)

        print("Generated solution:")
        print(path_w_tag)
        print("="*50)

def sft_train_pddl(
    model_name,
    output_note,
    family='mistral',
    dataset_path="data/sft/pddl_dataset.hf",
    val_ratio=0.05,
    training_overrides=None,
    max_seq_length_override=None,
    load_in_4bit_override=None,
    lora_r: int = 32,
    lora_alpha: int = 64,
    lora_dropout: float = 0.05,
    lora_target_modules: Optional[List[str]] = None,
    reasoning_effort: str = None,
):
    """
    使用unsloth进行PDDL fine-tune训练（多场景）

    Args:
        model_name: 预训练模型名称
        output_note: 输出标识
        family: 模型家族 (mistral, llama, phi, qwen, gpt, gpt-oss)
        dataset_path: 数据集路径（collect_dataset.py 生成）
        val_ratio: 验证集占比（0-1）
        lora_r: LoRA rank (default 32)
        reasoning_effort: GPT-OSS 推理努力程度 (low, medium, high)，仅用于 gpt-oss family
        lora_alpha: LoRA alpha scaling factor (default 64)
        lora_dropout: LoRA dropout 概率 (default 0.05)
        lora_target_modules: 需要注入 LoRA 的模块列表
    """
    
    print("="*60)
    print(f"PDDL Fine-tuning with {model_name}")
    print("="*60)

    training_overrides = training_overrides or {}
    max_seq_length_local = max_seq_length_override or max_seq_length
    load_in_4bit_local = load_in_4bit if load_in_4bit_override is None else load_in_4bit_override


    
    # 检查GPU
    print(f"GPU count: {torch.cuda.device_count()}")
    for i in range(torch.cuda.device_count()):
        print(f"GPU {i}: {torch.cuda.get_device_properties(i).name}")
    
    # 加载模型和tokenizer
    print("\nLoading model and tokenizer...")
    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=model_name,
        max_seq_length=max_seq_length_local,
        dtype="bfloat16" if use_bf16 else None,
        load_in_4bit=load_in_4bit_local,
    )
    tokenizer.pad_token = tokenizer.eos_token
    model.config.pad_token_id = tokenizer.eos_token_id

    
    # 配置tokenizer
    if family == 'mistral':
        tokenizer.add_eos_token = False
        tokenizer.add_bos_token = False
        tokenizer.pad_token = tokenizer.eos_token     # 改这里
        model.config.pad_token_id = tokenizer.eos_token_id
    elif family == 'llama':
        tokenizer.add_eos_token = True
        tokenizer.add_bos_token = True
        tokenizer.pad_token = tokenizer.eos_token
        model.config.pad_token_id = tokenizer.eos_token_id
    
    # 配置LoRA
    print("Configuring LoRA...")
    if lora_target_modules is None:
        lora_target_modules = [
            "q_proj",
            "k_proj",
            "v_proj",
            "o_proj",
            "gate_proj",
            "up_proj",
            "down_proj",
        ]
    model = FastLanguageModel.get_peft_model(
        model,
        r=lora_r,
        target_modules=lora_target_modules,
        lora_alpha=lora_alpha,
        lora_dropout=lora_dropout,
        bias="none",
        use_gradient_checkpointing="unsloth",
        random_state=3407,
        max_seq_length=max_seq_length_local,
    )
    
    # 加载数据集
    print(f"\nLoading dataset from {dataset_path}...")
    if not Path(dataset_path).exists():
        print(f"Dataset not found: {dataset_path}")
        print("Please run collect_dataset.py first to create the dataset.")
        return
    
    # 支持JSON和HuggingFace格式
    if dataset_path.endswith('.json'):
        print("Loading JSON dataset...")
        import json
        with open(dataset_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        # 转换字段名以匹配期望的格式
        for entry in data:
            if 'completion' in entry:
                entry['path'] = entry['completion']
        dataset = Dataset.from_list(data)
        is_dataset_dict = False
    else:
        print("Loading HuggingFace dataset...")
        # 尝试加载，可能是 Dataset 或 DatasetDict
        from datasets import load_from_disk
        loaded = load_from_disk(dataset_path)

        # 检查是否是 DatasetDict
        if hasattr(loaded, 'keys') and 'train' in loaded:
            print("Detected DatasetDict with pre-split train/validation sets")
            is_dataset_dict = True
            train_ds = loaded['train']
            eval_ds = loaded.get('validation', loaded.get('test', None))
            dataset = train_ds  # 用于统计
        else:
            print("Detected single Dataset")
            is_dataset_dict = False
            dataset = loaded

    print(f"Dataset loaded with {len(dataset)} entries")

    # 统计场景分布
    if "scenario" in dataset.column_names:
        # 场景计数
        scen_counts = {}
        for s in dataset["scenario"]:
            scen_counts[s] = scen_counts.get(s, 0) + 1
        print("Scenario distribution:")
        for k, v in sorted(scen_counts.items()):
            print(f"  {k}: {v}")

    if len(dataset) == 0:
        print("Dataset is empty.")
        return

    # train/val 划分（仅在未预先分割的情况下）
    if not is_dataset_dict:
        val_ratio = max(0.0, min(0.5, float(val_ratio)))
        print(f"Validation ratio: {val_ratio}")
        if val_ratio > 0:
            split = dataset.train_test_split(test_size=val_ratio, seed=3407, shuffle=True)
            train_ds = split["train"]
            eval_ds = split["test"]
        else:
            train_ds = dataset
            eval_ds = None
    else:
        print(f"Using pre-split dataset: {len(train_ds)} train, {len(eval_ds) if eval_ds else 0} validation")
    
    # 获取系统提示（用于 GPT-OSS 等需要 reasoning effort 的模型）
    system_prompt = get_system_prompt_for_family(family, reasoning_effort)
    if system_prompt:
        print(f"Using system prompt: {system_prompt}")

    # 转换为 chat 模板文本
    print("Processing dataset format (chat template)...")
    train_ds = train_ds.map(lambda entry: {
        "text": tokenizer.apply_chat_template(
            template(entry['prompt'], entry['path'], system_prompt=system_prompt),
            tokenize=False,
            add_generation_prompt=False,
            enable_thinking=False,
        )
    })
    if eval_ds is not None:
        eval_ds = eval_ds.map(lambda entry: {
            "text": tokenizer.apply_chat_template(
                template(entry['prompt'], entry['path'], system_prompt=system_prompt),
                tokenize=False,
                add_generation_prompt=False,
                enable_thinking=False,
            )
        })
    
    # 选择一个样本用于周期性测试
    test_prompt = train_ds[0]['prompt'] if len(train_ds) > 0 else (dataset[0]['prompt'] if len(dataset) > 0 else "")
    
    # 测试模型初始性能
    print("\nTesting initial model performance...")
    FastLanguageModel.for_inference(model)
    if test_prompt:
        inputs = tokenizer.apply_chat_template(
            template_input(test_prompt, system_prompt=system_prompt),
            tokenize=True,
            add_generation_prompt=True,
            return_tensors="pt",
            enable_thinking=False,
        ).to("cuda")
        output = tokenizer.batch_decode(
            model.generate(input_ids=inputs, max_new_tokens=max_new_tokens)
        )[0]
        path_w_tag = extract_llm_output(output, family)
        print("Initial model output:")
        print(path_w_tag[:500] + "..." if len(path_w_tag) > 500 else path_w_tag)

    # 创建测试回调
    test_callback = PDDLTestCallback(model, tokenizer, test_prompt, family, system_prompt=system_prompt)
    
    # 规范化输出路径并确保目录存在（默认写入 sft_models 子目录）
    raw_output_path = Path(output_note).expanduser()
    if raw_output_path.is_absolute():
        output_path = raw_output_path
    else:
        if raw_output_path.parts and raw_output_path.parts[0] == "sft_models":
            output_path = Path(*raw_output_path.parts)
        else:
            output_path = Path("sft_models") / raw_output_path
    output_path.mkdir(parents=True, exist_ok=True)
    
    # 初始化wandb
    wandb_run_name = output_path.name or str(output_path)
    wandb.init(
        project="pddl-finetune",
        name=f"pddl_sft_{wandb_run_name}",
        config={
            "model_name": model_name,
            "family": family,
            "max_seq_length": max_seq_length_local,
            "load_in_4bit": load_in_4bit_local,
            "val_ratio": val_ratio,
            "output_dir": str(output_path),
            "dataset_size": len(dataset),
            "train_size": len(train_ds),
            "eval_size": len(eval_ds) if eval_ds else 0,
        }
    )

    base_training_args = {
        "num_train_epochs": 3,
        "per_device_train_batch_size": 4,      # A100 可尝试 8~16
        "gradient_accumulation_steps": 2,      # 全局 batch ≈ 16~32
        "learning_rate": 2e-5,
        "warmup_ratio": 0.1,
        "weight_decay": 0.05,
        "lr_scheduler_type": "cosine",
        "max_grad_norm": 1.0,
        "eval_strategy": "steps",
        "eval_steps": 50,
        "save_strategy": "steps",
        "load_best_model_at_end": True,
        "metric_for_best_model": "eval_loss",
        "greater_is_better": False,
        "logging_steps": 10,
        "report_to": "wandb",
        "save_total_limit": 1,
        "output_dir": str(output_path),
        "fp16": False,
        "bf16": use_bf16,
        "optim": "adamw_torch",
        "seed": 3407,
        "save_steps": 50,
    }

    if family in ('gpt', 'gpt-oss'):
        if "per_device_train_batch_size" not in training_overrides:
            base_training_args["per_device_train_batch_size"] = 4
        if "gradient_accumulation_steps" not in training_overrides:
            base_training_args["gradient_accumulation_steps"] = 4

    effective_training_args = {**base_training_args, **training_overrides}

    print("\nResolved training arguments:")
    for key in ["num_train_epochs", "per_device_train_batch_size", "gradient_accumulation_steps", "learning_rate", "warmup_ratio", "weight_decay"]:
        print(f"  {key}: {effective_training_args.get(key)}")
    print(f"  max_seq_length: {max_seq_length_local}")
    print(f"  load_in_4bit: {load_in_4bit_local}")

    training_args = TrainingArguments(**effective_training_args)
    early_stopping_callback = EarlyStoppingCallback(
            early_stopping_patience=2,     # 连续 2 次 eval 没有明显提升就停
            early_stopping_threshold=0.001 # 提升 < 0.001 视为“没有提升”
        )
    # 创建训练器
    print("\nCreating trainer...")
    trainer = SFTTrainer(
        model=model,
        tokenizer=tokenizer,
        train_dataset=train_ds,
        eval_dataset=eval_ds,
        dataset_text_field="text",
        max_seq_length=max_seq_length_local,
        dataset_num_proc=8,
        packing=True,
        args=training_args,
        callbacks=[test_callback,  early_stopping_callback]
    )
    
    # 开始训练
    print("\nStarting training...")
    trainer.train()
    
    # 保存模型到规范化后的输出目录
    save_dir = output_path
    print(f"\nSaving model to {save_dir} ...")
    model.save_pretrained(save_dir)
    tokenizer.save_pretrained(save_dir)

    # 结束wandb
    wandb.finish()
    
    print("Training completed!")

def test_pddl_model(model_path, test_prompt, n=5, family='mistral', dataset_path=None):
    """
    测试训练好的PDDL模型
    """
    print(f"Testing PDDL model: {model_path}")

    dtype = "bfloat16" if use_bf16 else None
    load_in_4bit_local = load_in_4bit
    max_seq_length_local = max_seq_length

    
    # 如果没有提供test_prompt，尝试从数据集加载一个真实的prompt
    if not test_prompt or test_prompt == "Generate a PDDL solution for a simple problem.":
        if dataset_path and Path(dataset_path).exists():
            print("No specific test prompt provided, loading a real prompt from dataset...")
            try:
                # 支持JSON和HuggingFace格式
                if dataset_path.endswith('.json'):
                    import json
                    with open(dataset_path, 'r', encoding='utf-8') as f:
                        data = json.load(f)
                    dataset = Dataset.from_list(data)
                else:
                    dataset = Dataset.load_from_disk(dataset_path)
                
                if len(dataset) > 0:
                    # 随机选择一个真实的prompt
                    import random
                    random.seed(42)  # 固定随机种子以便复现
                    sample = random.choice(dataset)
                    test_prompt = sample['prompt']
                    print(f"Using prompt from {sample['scenario']}/{sample['problem_name']}")
                else:
                    print("Dataset is empty, using default prompt")
            except Exception as e:
                print(f"Failed to load prompt from dataset: {e}")
                print("Using default prompt")
        else:
            print("No dataset path provided, using default prompt")
    
    # 加载模型
    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=model_path,
        max_seq_length=max_seq_length_local,
        dtype=dtype,
        load_in_4bit=load_in_4bit_local,
    )
    
    FastLanguageModel.for_inference(model)
    
    inputs = tokenizer.apply_chat_template(
        template_input(test_prompt), 
        tokenize=True, 
        add_generation_prompt=True, 
        return_tensors="pt",
        enable_thinking=False,
    ).to("cuda")
    
    print(f"Generating {n} solutions...")
    for i in range(n):
        print(f"\n--- Solution {i+1} ---")
        cfg = {
            'top_k': random.randint(8, 512),
            'top_p': random.random() * 0.8 + 0.2,
            'temperature': random.random() * 0.8 + 0.2,
            'do_sample': True,
            'penalty_alpha': random.random() * 0.8 + 0.2
        }
        output = tokenizer.batch_decode(
            model.generate(input_ids=inputs, max_new_tokens=max_new_tokens, **cfg)
        )[0]
        path_w_tag = extract_llm_output(output, family)
        print(path_w_tag)

def list_dataset_scenarios(dataset_path):
    """列出数据集中的可用场景"""
    print(f"Loading dataset from {dataset_path}...")
    if not Path(dataset_path).exists():
        print(f"Dataset not found: {dataset_path}")
        return
    
    try:
        # 支持JSON和HuggingFace格式
        if dataset_path.endswith('.json'):
            import json
            with open(dataset_path, 'r', encoding='utf-8') as f:
                data = json.load(f)
            dataset = Dataset.from_list(data)
        else:
            dataset = Dataset.load_from_disk(dataset_path)
        
        if "scenario" in dataset.column_names:
            # 场景计数
            scen_counts = {}
            for s in dataset["scenario"]:
                scen_counts[s] = scen_counts.get(s, 0) + 1
            
            print(f"\nAvailable scenarios in dataset ({len(dataset)} total entries):")
            print("="*60)
            for k, v in sorted(scen_counts.items()):
                print(f"  {k}: {v} entries")
            print("="*60)
            print(f"Total scenarios: {len(scen_counts)}")
            print(f"Total entries: {len(dataset)}")
        else:
            print("Dataset does not contain 'scenario' field")
            print(f"Dataset columns: {dataset.column_names}")
            
    except Exception as e:
        print(f"Error loading dataset: {e}")

def main():
    """主函数"""
    import argparse
    
    parser = argparse.ArgumentParser(description="PDDL Fine-tuning with Unsloth (multi-scenario)")
    parser.add_argument("--wandb_project", type=str, default="pddl-finetune",
                       help="Weights & Biases project name")
    parser.add_argument("--wandb_entity", type=str, default=None,
                       help="Weights & Biases entity/username")
    parser.add_argument("--disable_wandb", action="store_true",
                       help="Disable Weights & Biases logging")
    parser.add_argument("--mode", choices=["train", "test"], default="train", 
                       help="Mode: train or test")
    parser.add_argument("--model", type=str, 
                       default="unsloth/mistral-7b-instruct-v0.3-bnb-4bit",
                       help="Model name for training or model path for testing")
    parser.add_argument("--output", type=str, default="default_run",
                       help="Run name or path for saving the fine-tuned model (default stored under sft_models/)")
    parser.add_argument("--family", choices=["mistral", "llama", "phi", "qwen", "gpt", "gpt-oss"],
                       default="mistral", help="Model family (use 'gpt-oss' for GPT-OSS/DeepSeek-R1 models)")
    parser.add_argument("--reasoning", type=str, default=None,
                       choices=["low", "medium", "high"],
                       help="Reasoning effort level for GPT-OSS models (default: high when using gpt-oss family)")
    parser.add_argument("--dataset", type=str, default="data/sft/pddl_dataset.hf",
                       help="Dataset path (from collect_dataset.py)")
    parser.add_argument("--val_ratio", type=float, default=0.05,
                       help="Validation split ratio (0-0.5)")
    parser.add_argument("--test_prompt", type=str, 
                       default="Generate a PDDL solution for a simple problem.",
                       help="Test prompt for evaluation (test mode)")
    parser.add_argument("--test_count", type=int, default=3,
                       help="Number of test generations")
    parser.add_argument("--list-scenarios", action="store_true",
                       help="List available scenarios in the dataset and exit")
    parser.add_argument("--num-train-epochs", type=float, default=None,
                       help="Number of training epochs (default 3; adjustable).")
    parser.add_argument("--per-device-train-batch-size", type=int, default=None,
                       help="Per-device batch size (default 4; GPT family defaults lower).")
    parser.add_argument("--gradient-accumulation-steps", type=int, default=None,
                       help="Gradient accumulation steps (default 2).")
    parser.add_argument("--learning-rate", type=float, default=None,
                       help="Learning rate (default 2e-5).")
    parser.add_argument("--warmup-ratio", type=float, default=None,
                       help="Warmup ratio (default 0.1).")
    parser.add_argument("--weight-decay", type=float, default=None,
                       help="Weight decay (default 0.05).")
    parser.add_argument("--lr-scheduler-type", type=str, default=None,
                       help="LR scheduler type (default cosine).")
    parser.add_argument("--max-grad-norm", type=float, default=None,
                       help="Max gradient norm (default 1.0).")
    parser.add_argument("--eval-steps", type=int, default=None,
                       help="Evaluation frequency in steps (default 100).")
    parser.add_argument("--logging-steps", type=int, default=None,
                       help="Logging frequency in steps (default 10).")
    parser.add_argument("--save-total-limit", type=int, default=None,
                       help="Limit of checkpoints to keep (default 1).")
    parser.add_argument("--eval-strategy", type=str, choices=["no", "steps", "epoch"], default=None,
                       help="Evaluation strategy (default epoch).")
    parser.add_argument("--save-strategy", type=str, choices=["no", "steps", "epoch"], default=None,
                       help="Checkpoint save strategy (default epoch).")
    parser.add_argument("--save-steps", type=int, default=None,
                       help="Checkpoint save frequency in steps (default 30).")
    parser.add_argument("--max-seq-length", type=int, default=None,
                       help="Override maximum sequence length (default 4096).")
    parser.add_argument("--load-in-4bit", dest="load_in_4bit", action="store_true",
                       help="Force 4-bit loading even for smaller models.")
    parser.add_argument("--no-load-in-4bit", dest="load_in_4bit", action="store_false",
                       help="Disable 4-bit loading even for large GPT models.")
    parser.set_defaults(load_in_4bit=None)
    parser.add_argument("--lora-r", type=int, default=32, help="LoRA rank (default 32).")
    parser.add_argument("--lora-alpha", type=int, default=64, help="LoRA alpha scaling factor (default 64).")
    parser.add_argument("--lora-dropout", type=float, default=0.05, help="LoRA dropout probability (default 0.05).")
    parser.add_argument(
        "--lora-target-modules",
        type=str,
        default="q_proj,k_proj,v_proj,o_proj,gate_proj,up_proj,down_proj",
        help="Comma-separated list of LoRA target modules.",
    )
    
    args = parser.parse_args()
    
    # 如果只是列出场景，则显示并退出
    if args.list_scenarios:
        list_dataset_scenarios(args.dataset)
        return
    
    # 配置wandb
    if not args.disable_wandb:
        wandb.login()
        os.environ["WANDB_PROJECT"] = args.wandb_project
        if args.wandb_entity:
            os.environ["WANDB_ENTITY"] = args.wandb_entity
    else:
        os.environ["WANDB_DISABLED"] = "true"
    
    if args.mode == "train":
        training_overrides = {
            key: getattr(args, key)
            for key in [
                "num_train_epochs",
                "per_device_train_batch_size",
                "gradient_accumulation_steps",
                "learning_rate",
                "warmup_ratio",
                "weight_decay",
                "lr_scheduler_type",
                "max_grad_norm",
                "eval_steps",
                "logging_steps",
                "save_total_limit",
                "eval_strategy",
                "save_strategy",
            ]
            if getattr(args, key) is not None
        }

        lora_target_modules = [
            module.strip()
            for module in args.lora_target_modules.split(",")
            if module.strip()
        ] or None

        sft_train_pddl(
            args.model,
            args.output,
            args.family,
            args.dataset,
            args.val_ratio,
            training_overrides=training_overrides,
            max_seq_length_override=args.max_seq_length,
            load_in_4bit_override=args.load_in_4bit,
            lora_r=args.lora_r,
            lora_alpha=args.lora_alpha,
            lora_dropout=args.lora_dropout,
            lora_target_modules=lora_target_modules,
            reasoning_effort=args.reasoning,
        )
    elif args.mode == "test":
        test_pddl_model(args.model, args.test_prompt, args.test_count, args.family, args.dataset)

if __name__ == "__main__":
    main()
