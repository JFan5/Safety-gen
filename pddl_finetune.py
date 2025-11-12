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
from datasets import load_from_disk, Dataset
from transformers import TrainerCallback, TrainingArguments

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

def template(prompt, path):
    """创建对话模板"""
    return [{"role": "user", "content": prompt}, {"role": "assistant", "content": path}]

def template_input(prompt):
    """创建输入模板"""
    return [{"role": "user", "content": prompt}]

def template_output(path):
    """创建输出模板"""
    return [{"role": "assistant", "content": path}]


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

    return text

class PDDLTestCallback(TrainerCallback):
    """PDDL测试回调，用于在训练过程中测试模型性能"""
    
    def __init__(self, model, tokenizer, test_prompt, family='mistral'):
        self.model = model
        self.tokenizer = tokenizer
        self.test_prompt = test_prompt
        self.family = family
    
    def on_save(self, args, state, control, **kwargs):
        """在保存检查点时测试模型"""
        print("\n" + "="*50)
        print("Testing model performance...")
        print("="*50)
        
        FastLanguageModel.for_inference(self.model)
        
        inputs = self.tokenizer.apply_chat_template(
            template_input(self.test_prompt), 
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
):
    """
    使用unsloth进行PDDL fine-tune训练（多场景）
    
    Args:
        model_name: 预训练模型名称
        output_note: 输出标识
        family: 模型家族 (mistral, llama, phi)
        dataset_path: 数据集路径（collect_dataset.py 生成）
        val_ratio: 验证集占比（0-1）
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
    model = FastLanguageModel.get_peft_model(
        model,
        r=32,
        target_modules=["q_proj", "k_proj", "v_proj", "o_proj",
                       "gate_proj", "up_proj", "down_proj"],
        lora_alpha=64,
        lora_dropout=0.05,
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
    else:
        print("Loading HuggingFace dataset...")
        dataset = Dataset.load_from_disk(dataset_path)
    
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
    
    # train/val 划分
    val_ratio = max(0.0, min(0.5, float(val_ratio)))
    print(f"Validation ratio: {val_ratio}")
    if val_ratio > 0:
        split = dataset.train_test_split(test_size=val_ratio, seed=3407, shuffle=True)
        train_ds = split["train"]
        eval_ds = split["test"]
    else:
        train_ds = dataset
        eval_ds = None
    
    # 转换为 chat 模板文本
    print("Processing dataset format (chat template)...")
    train_ds = train_ds.map(lambda entry: {
        "text": tokenizer.apply_chat_template(
            template(entry['prompt'], entry['path']), 
            tokenize=False, 
            add_generation_prompt=False,
            enable_thinking=False,
        )
    })
    if eval_ds is not None:
        eval_ds = eval_ds.map(lambda entry: {
            "text": tokenizer.apply_chat_template(
                template(entry['prompt'], entry['path']), 
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
            template_input(test_prompt), 
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
    test_callback = PDDLTestCallback(model, tokenizer, test_prompt, family)
    
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
        "eval_strategy": "epoch",
        "eval_steps": 100,
        "save_strategy": "epoch",
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
    }

    if family == 'gpt':
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
    
    # 创建训练器
    print("\nCreating trainer...")
    trainer = SFTTrainer(
        model=model,
        tokenizer=tokenizer,
        train_dataset=train_ds,
        eval_dataset=eval_ds,
        dataset_text_field="text",
        max_seq_length=max_seq_length_local,
        dataset_num_proc=2,
        packing=True,
        args=training_args,
        callbacks=[test_callback]
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
    parser.add_argument("--family", choices=["mistral", "llama", "phi", "qwen", "gpt"], 
                       default="mistral", help="Model family")
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
    parser.add_argument("--max-seq-length", type=int, default=None,
                       help="Override maximum sequence length (default 4096).")
    parser.add_argument("--load-in-4bit", dest="load_in_4bit", action="store_true",
                       help="Force 4-bit loading even for smaller models.")
    parser.add_argument("--no-load-in-4bit", dest="load_in_4bit", action="store_false",
                       help="Disable 4-bit loading even for large GPT models.")
    parser.set_defaults(load_in_4bit=None)
    
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

        sft_train_pddl(
            args.model,
            args.output,
            args.family,
            args.dataset,
            args.val_ratio,
            training_overrides=training_overrides,
            max_seq_length_override=args.max_seq_length,
            load_in_4bit_override=args.load_in_4bit,
        )
    elif args.mode == "test":
        test_pddl_model(args.model, args.test_prompt, args.test_count, args.family, args.dataset)

if __name__ == "__main__":
    main()
