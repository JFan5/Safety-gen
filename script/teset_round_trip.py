from unsloth import FastLanguageModel
import torch
import os

base_model_path = "/jfan5/sft_models/mistral_variant-blocksworld"
max_seq_length = 4096
device = "cuda"

# 1. 加载模型（和 SFT / DPO 一致）
model, tokenizer = FastLanguageModel.from_pretrained(
    model_name=base_model_path,
    max_seq_length=max_seq_length,
    dtype=None,
    load_in_4bit=True,
    load_in_8bit=False,
)

FastLanguageModel.for_inference(model)   # 用于推理模式
model.to(device)

if tokenizer.pad_token is None:
    tokenizer.pad_token = tokenizer.eos_token

prompts = [
    "Please explain what is reinforcement learning in one paragraph.",
    "写一段关于深度强化学习安全性的简介。",
    "Given a sequence of states and actions, how to define the robustness of an STL formula?"
]

def generate_batch(model, tokenizer, prompts):
    inputs = tokenizer(prompts, return_tensors="pt", padding=True).to(device)
    with torch.no_grad():
        outputs = model.generate(
            **inputs,
            max_new_tokens=128,
            do_sample=False,   # 保证确定性
            temperature=1.0,
        )
    return tokenizer.batch_decode(outputs, skip_special_tokens=True)

print("=== A: 原始模型输出 ===")
texts_A = generate_batch(model, tokenizer, prompts)
for i, t in enumerate(texts_A):
    print(f"[Prompt {i}]")
    print(t)
    print("-" * 80)


# ==================================================================
# 🟩 关键改动：使用 merge_lora，而不是 save_pretrained_merged
# ==================================================================

print("Merging LoRA weights into the full model...")
FastLanguageModel.merge_lora(model)   # ⭐ 将 LoRA 合并到模型本体中

# 保存合并后的完整模型（像 SFT 一样）
save_dir = "/jfan5/test_sft_roundtrip"
os.makedirs(save_dir, exist_ok=True)

print(f"Saving merged full model to: {save_dir}")
model.save_pretrained(save_dir)
tokenizer.save_pretrained(save_dir)

print("模型保存完成（已是全模型，无需 _merged 目录）")


# ==================================================================
# 🟩 重新加载完整模型
# ==================================================================

reload_dir = save_dir
print(f"Reloading model from: {reload_dir}")

model_B, tokenizer_B = FastLanguageModel.from_pretrained(
    model_name=reload_dir,
    max_seq_length=max_seq_length,
    dtype=None,
    load_in_4bit=True,    # 根据你的实际需求，可改为 fp16 / bf16
    load_in_8bit=False,
)

FastLanguageModel.for_inference(model_B)
model_B.to(device)


print("=== B: 重新加载后的模型输出 ===")
texts_B = generate_batch(model_B, tokenizer_B, prompts)
for i, t in enumerate(texts_B):
    print(f"[Prompt {i}]")
    print(t)
    print("-" * 80)


# ==================================================================
# 🟩 对比差异
# ==================================================================
for i, (a, b) in enumerate(zip(texts_A, texts_B)):
    print(f"=== Prompt {i} 差异 ===")
    print("A:", a[:400])
    print("B:", b[:400])
    print()
