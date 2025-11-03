#!/usr/bin/env python3
"""
PDDL Fine-tuning with Unsloth
基于unsloth对PDDL规划任务进行fine-tune
支持使用 collect_dataset.py 收集的 blocksworld/delivery/logistics 多场景数据集
"""
import unsloth
import os
import random
import torch
import wandb
from pathlib import Path
from datasets import load_from_disk, Dataset
from transformers import TrainerCallback, TrainingArguments

# Import Unsloth with compatibility fixes
from unsloth_compat import safe_import_unsloth
unsloth, FastLanguageModel, SFTTrainer = safe_import_unsloth()

# 配置参数
max_seq_length = 8000  # 最大序列长度
dtype = None  # None for auto detection. Float16 for Tesla T4, V100, Bfloat16 for Ampere+
load_in_4bit = True  # 使用4bit量化减少内存使用

# 不同模型的分割标签
split_tag = {
    'mistral': '[/INST]',
    'llama': '<|end_header_id|>',
    'phi': '<|end|>'
}

def template(prompt, path):
    """创建对话模板"""
    return [{"role": "user", "content": prompt}, {"role": "assistant", "content": path}]

def template_input(prompt):
    """创建输入模板"""
    return [{"role": "user", "content": prompt}]

def template_output(path):
    """创建输出模板"""
    return [{"role": "assistant", "content": path}]

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
            self.model.generate(input_ids=inputs, max_new_tokens=2000)
        )[0]
        
        # 提取生成的解决方案
        if self.family in split_tag:
            path_w_tag = output.split(split_tag[self.family])[-1].strip()
        else:
            # 默认处理
            path_w_tag = output.split("Solution:")[-1].strip() if "Solution:" in output else output
        
        print("Generated solution:")
        print(path_w_tag)
        print("="*50)

def sft_train_pddl(model_name, output_note, family='mistral', dataset_path="data/sft/pddl_dataset.hf", scenarios=None, val_ratio=0.05):
    """
    使用unsloth进行PDDL fine-tune训练（多场景）
    
    Args:
        model_name: 预训练模型名称
        output_note: 输出标识
        family: 模型家族 (mistral, llama, phi)
        dataset_path: 数据集路径（collect_dataset.py 生成）
        scenarios: 训练使用的场景列表，如 ["blocksworld","delivery","logistics"]，None/[] 表示使用全部
        val_ratio: 验证集占比（0-1）
    """
    
    print("="*60)
    print(f"PDDL Fine-tuning with {model_name}")
    print("="*60)
    
    # 检查GPU
    print(f"GPU count: {torch.cuda.device_count()}")
    for i in range(torch.cuda.device_count()):
        print(f"GPU {i}: {torch.cuda.get_device_properties(i).name}")
    
    # 加载模型和tokenizer
    print("\nLoading model and tokenizer...")
    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=model_name,
        max_seq_length=max_seq_length,
        dtype=dtype,
        load_in_4bit=load_in_4bit,
    )
    
    # 配置tokenizer
    if family == 'mistral':
        tokenizer.add_eos_token = False
        tokenizer.add_bos_token = False
        tokenizer.pad_token = tokenizer.unk_token
    elif family == 'llama':
        tokenizer.add_eos_token = True
        tokenizer.add_bos_token = True
        tokenizer.pad_token = tokenizer.eos_token
    
    # 配置LoRA
    print("Configuring LoRA...")
    model = FastLanguageModel.get_peft_model(
        model,
        r=16,
        target_modules=["q_proj", "k_proj", "v_proj", "o_proj",
                       "gate_proj", "up_proj", "down_proj"],
        lora_alpha=16,
        lora_dropout=0,
        bias="none",
        use_gradient_checkpointing="unsloth",
        random_state=3407,
        max_seq_length=max_seq_length,
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
    
    # 统计并可选过滤场景
    if "scenario" in dataset.column_names:
        # 场景计数
        scen_counts = {}
        for s in dataset["scenario"]:
            scen_counts[s] = scen_counts.get(s, 0) + 1
        print("Scenario distribution:")
        for k, v in sorted(scen_counts.items()):
            print(f"  {k}: {v}")
        
        if scenarios:
            keep = set(scenarios)
            print(f"\nFiltering scenarios to: {sorted(keep)}")
            dataset = dataset.filter(lambda ex: ex.get("scenario") in keep)
            print(f"Filtered dataset size: {len(dataset)}")
    
    if len(dataset) == 0:
        print("Dataset empty after filtering.")
        return
    
    # train/val 划分
    val_ratio = max(0.0, min(0.5, float(val_ratio)))
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
            model.generate(input_ids=inputs, max_new_tokens=2000)
        )[0]
        if family in split_tag:
            path_w_tag = output.split(split_tag[family])[-1].strip()
        else:
            path_w_tag = output.split("Solution:")[-1].strip() if "Solution:" in output else output
        print("Initial model output:")
        print(path_w_tag[:500] + "..." if len(path_w_tag) > 500 else path_w_tag)
    
    # 创建测试回调
    test_callback = PDDLTestCallback(model, tokenizer, test_prompt, family)
    
    # 创建输出目录
    os.makedirs("sft_model", exist_ok=True)
    os.makedirs("sft_results", exist_ok=True)
    
    # 配置训练参数
    from unsloth import is_bfloat16_supported
    
    # 初始化wandb
    wandb.init(
        project="pddl-finetune",
        name=f"pddl_sft_{output_note}",
        config={
            "model_name": model_name,
            "family": family,
            "max_seq_length": max_seq_length,
            "scenarios": scenarios,
            "val_ratio": val_ratio,
            "dataset_size": len(dataset),
            "train_size": len(train_ds),
            "eval_size": len(eval_ds) if eval_ds else 0,
        }
    )

    training_args = TrainingArguments(
        per_device_train_batch_size=2,
        gradient_accumulation_steps=4,
        warmup_ratio=0.05,
        num_train_epochs=6,
        learning_rate=3e-4,
        fp16=not is_bfloat16_supported(),
        bf16=is_bfloat16_supported(),
        logging_steps=10,
        save_steps=200,
        save_total_limit=5,
        optim="adamw_8bit",
        seed=3407,
        output_dir=f"sft_results/pddl_sft_results_{output_note}",
        report_to="wandb",
    )
    
    # 创建训练器
    print("\nCreating trainer...")
    trainer = SFTTrainer(
        model=model,
        tokenizer=tokenizer,
        train_dataset=train_ds,
        eval_dataset=eval_ds,
        dataset_text_field="text",
        max_seq_length=max_seq_length,
        dataset_num_proc=2,
        packing=False,
        args=training_args,
        callbacks=[test_callback]
    )
    
    # 开始训练
    print("\nStarting training...")
    trainer.train()
    
    # 保存模型
    print(f"\nSaving model to sft_model/sft_model_pddl_{output_note}...")
    model.save_pretrained(f"sft_model/sft_model_pddl_{output_note}")
    tokenizer.save_pretrained(f"sft_model/sft_model_pddl_{output_note}")
    
    # 结束wandb
    wandb.finish()
    
    print("Training completed!")

def test_pddl_model(model_path, test_prompt, n=5, family='mistral', dataset_path=None):
    """
    测试训练好的PDDL模型
    """
    print(f"Testing PDDL model: {model_path}")
    
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
        max_seq_length=max_seq_length,
        dtype=dtype,
        load_in_4bit=load_in_4bit,
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
            model.generate(input_ids=inputs, max_new_tokens=2000, **cfg)
        )[0]
        if family in split_tag:
            path_w_tag = output.split(split_tag[family])[-1].strip()
        else:
            path_w_tag = output.split("Solution:")[-1].strip() if "Solution:" in output else output
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
    parser.add_argument("--output", type=str, default="pddl_v1",
                       help="Output note for training")
    parser.add_argument("--family", choices=["mistral", "llama", "phi"], 
                       default="mistral", help="Model family")
    parser.add_argument("--dataset", type=str, default="data/sft/pddl_dataset.hf",
                       help="Dataset path (from collect_dataset.py)")
    parser.add_argument("--scenarios", nargs="+", default=None,
                       help="Filter scenarios for training; use 'all' to include all scenarios, or specify specific scenarios. If not specified, uses all available scenarios.")
    parser.add_argument("--val_ratio", type=float, default=0.05,
                       help="Validation split ratio (0-0.5)")
    parser.add_argument("--test_prompt", type=str, 
                       default="Generate a PDDL solution for a simple problem.",
                       help="Test prompt for evaluation (test mode)")
    parser.add_argument("--test_count", type=int, default=3,
                       help="Number of test generations")
    parser.add_argument("--list-scenarios", action="store_true",
                       help="List available scenarios in the dataset and exit")
    
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
        # 处理scenarios参数
        if args.scenarios is None:
            # 默认使用所有场景
            use_scenarios = None
        elif args.scenarios == ["all"]:
            # 明确指定使用所有场景
            use_scenarios = None
        else:
            # 使用指定的场景
            use_scenarios = args.scenarios
        
        sft_train_pddl(args.model, args.output, args.family, args.dataset, use_scenarios, args.val_ratio)
    elif args.mode == "test":
        test_pddl_model(args.model, args.test_prompt, args.test_count, args.family, args.dataset)

if __name__ == "__main__":
    main()
