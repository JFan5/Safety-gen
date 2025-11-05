#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
第 1.1 步：从 SFT 模型批量采样候选、用 VAL 验证并生成 1~5 档评分日志（JSONL）
- 输入：domain.pddl + problems 目录 + 已训练的 SFT 模型
- 输出：scored.jsonl（每行一个候选，含 score/tag/验证信息/采样超参）
"""
import os
import json
import random
import subprocess
import tempfile
from pathlib import Path
from datetime import datetime
import argparse
import torch

# === 依赖：Unsloth 快速加载 ===
from unsloth import FastLanguageModel

# -----------------------
# 可调默认参数（可通过命令行覆盖）
# -----------------------
DEFAULT_MAX_SEQ_LEN = 3000
DEFAULT_MAX_NEW_TOKENS = 512
DEFAULT_TEMPERATURE = 0.7
DEFAULT_TOP_P = 0.9
DEFAULT_TOP_K = 50
DEFAULT_SEED = 42
DTYPE = None
LOAD_IN_4BIT = True

MODEL_FAMILY_MAP = {
    'mistral': 'mistral',
    'llama': 'llama',
    'phi': 'phi',
    'qwen': 'qwen',
    'gemma': 'gemma',
    'gpt': 'gpt',
}

# ========== 与你现有脚本对齐的工具函数 ==========

def template_input(prompt: str):
    return [{"role": "user", "content": prompt}]

def extract_llm_output(output: str, family='mistral') -> str:
    # 与你现有版本保持一致，做了最小安全处理
    if family == 'qwen':
        # 先按 qwen 的 think 标签裁掉
        if '<think>' in output and '</think>' in output:
            s = output.find('<think>')
            e = output.find('</think>')
            if s != -1 and e != -1:
                output = output[:s] + output[e+8:]
                output = output.strip()
    if family == 'mistral' or '[/INST]' in output:
        if '[/INST]' in output:
            parts = output.split('[/INST]')
            if len(parts) > 1:
                llm_output = parts[-1].strip()
                if llm_output.endswith('</s>'):
                    llm_output = llm_output[:-4].strip()
            else:
                llm_output = output.strip()
        else:
            llm_output = output.strip()
    elif 'assistant' in output:
        parts = output.split('assistant')
        if len(parts) > 1:
            llm_output = parts[-1].strip()
            if llm_output.startswith(':'):
                llm_output = llm_output[1:].strip()
        else:
            llm_output = output.strip()
    else:
        llm_output = output.strip()
    return llm_output

def validate_solution(domain_file: str, problem_file: str, solution_text: str):
    """使用 VAL 验证（与你已有函数一致）"""
    with tempfile.NamedTemporaryFile(mode='w', suffix='.soln', delete=False) as f:
        f.write(solution_text)
        solution_file = f.name
    try:
        cmd = f"~/VAL/build/bin/Validate  -v {domain_file} {problem_file} {solution_file}"
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=30)
        if result.returncode == 0:
            out = result.stdout.lower()
            if ("plan valid" in out) or ("successful plans" in out) or ("plan executed successfully" in out):
                return True, "Plan valid", result.stdout, result.stderr, cmd
            else:
                return False, f"Validation failed: {result.stdout[:500]}", result.stdout, result.stderr, cmd
        else:
            return False, f"Validation error: {result.stderr[:500]}", result.stdout, result.stderr, cmd
    except subprocess.TimeoutExpired:
        return False, "Validation timeout", "", "Validation timeout after 30 seconds", cmd
    except Exception as e:
        return False, f"Validation exception: {str(e)}", "", str(e), cmd
    finally:
        try:
            os.unlink(solution_file)
        except:
            pass

def classify_from_val(is_valid: bool, validation_stdout: str) -> str:
    """
    与你“解析输出结果”脚本的 _classify_result 逻辑保持一致，返回六类之一：
    success_plans / plan_format_error / precondition_violation /
    safety_constraints_violation / goal_not_satisfied / others
    """
    if is_valid:
        return "success_plans"
    text = (validation_stdout or "").lower()
    if not text:
        return "plan_format_error"
    if ("bad operator in plan" in text) or ("bad plan description!" in text) or \
       ("no matching action defined" in text) or ("object with unknown type" in text):
        return "plan_format_error"
    if "goal not satisfied" in text:
        return "goal_not_satisfied"
    if ("plan failed to execute" in text) and ("unsatisfied precondition" in text):
        return "precondition_violation"
    if ("plan failed to execute" in text) and ("unsatisfied precondition" not in text):
        return "safety_constraints_violation"
    return "others"

SCORE_MAP = {
    "plan_format_error": 1,
    "precondition_violation": 2,
    "safety_constraints_violation": 3,
    "goal_not_satisfied": 4,
    "success_plans": 5,
    "others": 1,  # 未知归 1 档，保守处理
}

# ========== 数据加载 ==========

def load_prompt_template(path: str) -> str:
    try:
        with open(path, 'r', encoding='utf-8') as f:
            return f.read()
    except Exception:
        # 兜底：只喂 problem
        return "{problem_content}"

def load_problems_from_dir(problems_dir: str, domain_file: str, prompt_template: str):
    problems_path = Path(problems_dir)
    domain_text = Path(domain_file).read_text(encoding='utf-8')
    items = []
    pddl_files = sorted(p for p in problems_path.glob("*.pddl") if "domain" not in p.name.lower())
    for p in pddl_files:
        problem_text = p.read_text(encoding='utf-8')
        prompt = prompt_template.format(domain_content=domain_text, problem_content=problem_text)
        items.append({
            "problem_name": p.stem,
            "problem_file": str(p),
            "problem_content": problem_text,
            "prompt": prompt,
        })
    return items

# ========== 主流程：采样→验证→打分→写 jsonl ==========

def main():
    ap = argparse.ArgumentParser(description="采样候选→VAL 验证→生成 1..5 档评分日志（JSONL）")
    ap.add_argument("--model", required=True, help="SFT 模型路径（Unsloth）")
    ap.add_argument("--family", choices=["mistral","llama","phi","qwen","gemma","auto"], default="auto")
    ap.add_argument("--domain-file", required=True, help="domain.pddl")
    ap.add_argument("--problems-dir", required=True, help="包含多个 problem.pddl 的目录")
    ap.add_argument("--prompt-template", default="prompt.txt", help="用于拼接 domain/problem 的 prompt 模板文件")
    ap.add_argument("--out", default="scored.jsonl", help="输出 JSONL 路径")
    ap.add_argument("--max-problems", type=int, default=0,
                    help="若 >0，则仅处理前 max_problems 个问题（可结合 --problem-sample-seed 打乱顺序）")
    ap.add_argument("--problem-sample-seed", type=int, default=None,
                    help="当 --max-problems 生效时，先用该种子随机打乱问题列表再截断")
    ap.add_argument("--start-index", type=int, default=0,
                    help="跳过前 start_index 个问题后再开始处理（默认从 0 开始）")
    ap.add_argument("--temperature", type=float, default=DEFAULT_TEMPERATURE, help="采样温度")
    ap.add_argument(
        "--temperatures",
        type=float,
        nargs="+",
        default=None,
        help="可选：为每个问题依次采样的温度列表（默认自动使用两个温度）",
    )
    ap.add_argument("--top-p", type=float, default=DEFAULT_TOP_P, help="top_p 截断")
    ap.add_argument("--top-k", type=int, default=DEFAULT_TOP_K, help="top_k 截断")
    ap.add_argument("--seed", type=int, default=DEFAULT_SEED, help="采样随机种子")
    ap.add_argument("--max-new-tokens", type=int, default=DEFAULT_MAX_NEW_TOKENS, help="生成的最大新 token 数")
    ap.add_argument("--max-seq-len", type=int, default=DEFAULT_MAX_SEQ_LEN, help="模型最大序列长度")
    ap.add_argument("--penalty-alpha", type=float, default=0.0, help="logits penalty alpha（默认关闭）")
    ap.add_argument("--deterministic", action="store_true",
                    help="关闭采样（do_sample=False），使用 greedy 生成")
    args = ap.parse_args()

    # family 自动识别
    family = args.family
    if family == "auto":
        lower = args.model.lower()
        for key, fam in MODEL_FAMILY_MAP.items():
            if key in lower:
                family = fam
                break
        else:
            family = "mistral"
    print(f"[Info] Model family = {family}")

    if args.deterministic:
        temperature_list = [None]
    else:
        if args.temperatures:
            raw_temps = args.temperatures
        else:
            base_temp = float(args.temperature)
            alt_temp = base_temp + 0.3
            if alt_temp > 1.5:
                alt_temp = max(base_temp - 0.3, 0.05)
            if alt_temp <= 0:
                alt_temp = 0.7 if base_temp <= 0 else max(base_temp * 1.5, 0.05)
            raw_temps = [base_temp, alt_temp]

        temperature_list = []
        for temp_val in raw_temps:
            try:
                temp_float = float(temp_val)
            except (TypeError, ValueError):
                continue
            if temp_float <= 0:
                continue
            if all(abs(temp_float - existing) >= 1e-6 for existing in temperature_list):
                temperature_list.append(temp_float)

        if not temperature_list:
            fallback = max(float(args.temperature), 0.05)
            temperature_list = [fallback]

        if len(temperature_list) == 1:
            base = temperature_list[0]
            fallback = base + 0.3
            if fallback > 1.5:
                fallback = max(base - 0.3, 0.05)
            fallback = min(max(fallback, 0.05), 1.5)
            if abs(fallback - base) < 1e-6:
                fallback = min(max(base * 1.2, 0.05), 1.5)
            if abs(fallback - base) < 1e-6:
                fallback = min(max(base + 0.1, 0.05), 1.5)
            if all(abs(fallback - existing) >= 1e-6 for existing in temperature_list):
                temperature_list.append(fallback)

        print(f"[Info] Sampling temperatures: {temperature_list}")

    prompt_template = load_prompt_template(args.prompt_template)
    problems = load_problems_from_dir(args.problems_dir, args.domain_file, prompt_template)
    print(f"[Info] Loaded {len(problems)} problems from {args.problems_dir}")

    start_index = max(0, args.start_index or 0)
    if start_index > 0:
        if start_index >= len(problems):
            print(f"[Warn] start_index={start_index} >= total problems ({len(problems)}). Nothing to do.")
            return
        problems = problems[start_index:]
        print(f"[Info] Skipped first {start_index} problems, remaining {len(problems)}")

    if args.max_problems and args.max_problems > 0 and len(problems) > args.max_problems:
        if args.problem_sample_seed is not None:
            rng = random.Random(args.problem_sample_seed)
            rng.shuffle(problems)
        problems = problems[:args.max_problems]
        print(f"[Info] Truncated to {len(problems)} problems (max_problems={args.max_problems})")

    # 加载模型
    print("[Info] Loading model ...")
    try:
        model, tokenizer = FastLanguageModel.from_pretrained(
            model_name=args.model,
            max_seq_length=args.max_seq_len,
            dtype=DTYPE,
            load_in_4bit=LOAD_IN_4BIT,
        )
    except ValueError as e:
        if "GPU RAM" in str(e):
            print("[Warn] GPU RAM insufficient, retry with CPU offload ...")
            model, tokenizer = FastLanguageModel.from_pretrained(
                model_name=args.model,
                max_seq_length=args.max_seq_len,
                dtype=DTYPE,
                load_in_4bit=LOAD_IN_4BIT,
                llm_int8_enable_fp32_cpu_offload=True,
                device_map="auto"
            )
        else:
            raise
    FastLanguageModel.for_inference(model)

    out_path = Path(args.out)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    n_written = 0

    with open(out_path, "w", encoding="utf-8") as fout:
        for idx, sample in enumerate(problems, 1):
            print(f"\n=== Problem {idx}/{len(problems)}: {sample['problem_name']} ===")
            # 构造输入
            input_ids = tokenizer.apply_chat_template(
                template_input(sample["prompt"]),
                tokenize=True,
                add_generation_prompt=True,
                return_tensors="pt",
                enable_thinking=False,
            )
            # 放到正确设备
            try:
                device = next(model.parameters()).device
                input_ids = input_ids.to(device)
            except:
                pass
            seen_candidates = set()

            for temp_idx, temp in enumerate(temperature_list):
                attempt_label = "greedy" if args.deterministic else f"T={temp}"
                print(f"  -> Attempt {temp_idx + 1}/{len(temperature_list)} using {attempt_label}")

                cfg = {
                    "do_sample": not args.deterministic,
                }
                if args.penalty_alpha > 0:
                    cfg["penalty_alpha"] = args.penalty_alpha
                if not args.deterministic:
                    cfg.update({
                        "temperature": temp,
                        "top_p": args.top_p,
                        "top_k": args.top_k,
                    })

                seed_base = args.seed + (idx - 1) * max(len(temperature_list), 1) + temp_idx
                random.seed(seed_base)
                torch.manual_seed(seed_base)
                if torch.cuda.is_available():
                    torch.cuda.manual_seed_all(seed_base)

                generation_error = None
                raw_output = ""
                try:
                    gen = model.generate(
                        input_ids=input_ids,
                        max_new_tokens=args.max_new_tokens,
                        **cfg,
                    )
                    raw_output = tokenizer.batch_decode(gen)[0]
                except torch.cuda.OutOfMemoryError as e:
                    generation_error = f"CUDA OOM: {e}"
                    torch.cuda.empty_cache()
                except RuntimeError as e:
                    if "out of memory" in str(e).lower():
                        generation_error = f"Runtime OOM: {e}"
                        torch.cuda.empty_cache()
                    else:
                        generation_error = f"RuntimeError: {e}"
                except Exception as e:
                    generation_error = f"GenerationError: {e}"

                llm_output = "" if generation_error else extract_llm_output(raw_output, family=family)
                dedup_key = (llm_output.strip(), generation_error or "")
                if dedup_key in seen_candidates:
                    print(f"    Skipping duplicate candidate for {attempt_label}.")
                    continue
                seen_candidates.add(dedup_key)

                is_valid, vmsg, v_stdout, v_stderr, v_cmd = (False, "", "", "", "")
                if generation_error:
                    vmsg = generation_error
                elif llm_output.strip():
                    is_valid, vmsg, v_stdout, v_stderr, v_cmd = validate_solution(
                        args.domain_file,
                        sample["problem_file"],
                        llm_output
                    )
                else:
                    vmsg = "Empty solution"

                tag = classify_from_val(is_valid, v_stdout)
                score = SCORE_MAP.get(tag, 1)

                record = {
                    "timestamp": datetime.utcnow().isoformat(),
                    "problem_name": sample["problem_name"],
                    "problem_file": sample["problem_file"],
                    "domain_file": args.domain_file,
                    "prompt": sample["prompt"],
                    "candidate": llm_output,
                    "score": score,
                    "tag": tag,
                    "is_valid": bool(is_valid),
                    "val_message": vmsg,
                    "val_stdout": v_stdout[:2000],
                    "val_stderr": v_stderr[:2000],
                    "val_cmd": v_cmd,
                    "sampling": {
                        "do_sample": not args.deterministic,
                        "temperature": None if args.deterministic else temp,
                        "top_p": None if args.deterministic else args.top_p,
                        "top_k": None if args.deterministic else args.top_k,
                        "seed": seed_base,
                        "penalty_alpha": args.penalty_alpha if args.penalty_alpha > 0 else 0.0,
                        "max_new_tokens": args.max_new_tokens,
                    },
                    "model": args.model,
                    "family": family,
                }
                fout.write(json.dumps(record, ensure_ascii=False) + "\n")
                n_written += 1

                top_p_repr = "N/A" if args.deterministic else args.top_p
                top_k_repr = "N/A" if args.deterministic else args.top_k
                print(f"    tag={tag} score={score} valid={is_valid}  "
                      f"{attempt_label} top_p={top_p_repr} top_k={top_k_repr} seed={seed_base}")

    print(f"\nDone. Wrote {n_written} scored candidates to: {out_path}")

if __name__ == "__main__":
    main()
