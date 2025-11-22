#!/usr/bin/env python3
"""
Generic PDDL Plan Evaluator
通过命令行显式指定 domain 文件与 problems 目录，评测模型生成计划并用 VAL 验证。
输出结果保存为 JSON 与 .soln 计划文本。
"""

import argparse
import json
import random
import re
from datetime import datetime
from pathlib import Path
from typing import Optional, Tuple

import torch
from transformers import (
    AutoModelForCausalLM,
    AutoTokenizer,
    BitsAndBytesConfig,
    GenerationConfig,
)

from utils import _classify_result, validate_solution

MAX_NEW_TOKENS = 2048

MODEL_FAMILY_MAP = {
    "mistral": "mistral",
    "llama": "llama",
    "phi": "phi",
    "qwen": "qwen",
    "gemma": "gemma",
    "gpt": "mistral",  # GPT-style chat templates often mirror Mistral
}


def template_input(prompt: str, rich: bool = False):
    if rich:
        return [{"role": "user", "content": [{"type": "text", "text": prompt}]}]
    return [{"role": "user", "content": prompt}]


def extract_llm_output(output: str, family: str = "mistral") -> str:
    if output is None:
        return ""
    text = output.strip()

    if "[/INST]" in text or family == "mistral":
        parts = text.split("[/INST]")
        text = (parts[-1] if len(parts) > 1 else text).strip()
        if text.endswith("</s>"):
            text = text[:-4].strip()

    if "<|im_start|>" in text:
        segments = text.split("<|im_start|>")
        for segment in reversed(segments):
            seg = segment.strip()
            if not seg:
                continue
            if seg.startswith("assistant"):
                seg = seg[len("assistant") :].lstrip(" :\n")
                if "<|im_end|>" in seg:
                    seg = seg.split("<|im_end|>", 1)[0]
                text = seg.strip()
                break
        else:
            if "<|im_end|>" in text:
                text = text.split("<|im_end|>", 1)[0].strip()

    elif "assistant" in text and not text.startswith("assistant"):
        parts = text.split("assistant")
        text = parts[-1].lstrip(":").strip()

    text = re.sub(r"<[|｜][^>]+[|｜]>", "", text)
    text = re.sub(r"<think>.*?</think>", "", text, flags=re.DOTALL | re.IGNORECASE)
    text = re.sub(r"</?think>", "", text, flags=re.IGNORECASE)
    text = text.strip()
    text = re.sub(
        r"^(assistant|final|assistant_final)\s*[:\-]*", "", text, flags=re.IGNORECASE
    ).lstrip()
    text = re.sub(r"^\|>\s*", "", text)

    if family == "qwen":
        text = re.sub(r"<think>.*?</think>", "", text, flags=re.DOTALL | re.IGNORECASE).strip()

    plan_line_pattern = re.compile(r"^\([^\s()]+(?: [^\s()]+)*\)$")
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
    lines = [line.strip() for line in plan_text.splitlines() if line.strip()]
    return bool(lines) and all(line.startswith("(") and line.endswith(")") for line in lines)


def _load_problems_from_dir(problems_dir: str, domain_file: str) -> list:
    problems_path = Path(problems_dir)
    if not problems_path.exists():
        print(f"Problems directory not found: {problems_dir}")
        return []

    domain_content = ""
    if domain_file and Path(domain_file).exists():
        try:
            domain_content = Path(domain_file).read_text(encoding="utf-8")
        except Exception as e:
            print(f"Error reading domain file {domain_file}: {e}")

    try:
        prompt_template = Path("prompt.txt").read_text(encoding="utf-8")
    except Exception as e:
        print(f"Error reading prompt.txt: {e}")
        prompt_template = "{problem_content}"

    test_data = []
    pddl_files = [f for f in sorted(problems_path.glob("*.pddl")) if "domain" not in f.name.lower()]
    if not pddl_files:
        print(f"No problem files found in {problems_dir}")
        return []

    for pddl_file in pddl_files:
        problem_name = pddl_file.stem
        try:
            problem_content = pddl_file.read_text(encoding="utf-8")
        except Exception as e:
            print(f"Error reading {pddl_file}: {e}")
            continue
        prompt = prompt_template.format(domain_content=domain_content, problem_content=problem_content)
        test_data.append(
            {
                "problem_name": problem_name,
                "problem_file": str(pddl_file),
                "prompt": prompt,
                "problem_content": problem_content,
            }
        )
    return test_data


def _quant_config(load_in_4bit: bool) -> Optional[BitsAndBytesConfig]:
    if not load_in_4bit:
        return None
    return BitsAndBytesConfig(
        load_in_4bit=True,
        bnb_4bit_use_double_quant=True,
        bnb_4bit_quant_type="nf4",
        bnb_4bit_compute_dtype=torch.bfloat16,
    )


def _load_model_and_tokenizer(
    model_path: str, load_in_4bit: bool
) -> Tuple[AutoModelForCausalLM, AutoTokenizer]:
    quant_config = _quant_config(load_in_4bit)
    tok = AutoTokenizer.from_pretrained(model_path, trust_remote_code=True)
    if tok.pad_token_id is None and tok.eos_token_id is not None:
        tok.pad_token_id = tok.eos_token_id

    attn_impl = "flash_attention_2" if torch.cuda.is_available() else None
    try:
        model = AutoModelForCausalLM.from_pretrained(
            model_path,
            torch_dtype=torch.bfloat16 if torch.cuda.is_available() else torch.float32,
            device_map="auto",
            trust_remote_code=True,
            attn_implementation=attn_impl,
            quantization_config=quant_config,
        )
    except Exception:
        # Retry without attention override or quantization if unsupported
        model = AutoModelForCausalLM.from_pretrained(
            model_path,
            torch_dtype=torch.bfloat16 if torch.cuda.is_available() else torch.float32,
            device_map="auto",
            trust_remote_code=True,
        )
    return model, tok


def test_model_on_testing_data(
    model_path,
    output_file="test_results.json",
    family="mistral",
    max_problems: int = 0,
    results_dir=None,
    problems_dir: str = None,
    domain_file: str = None,
    load_in_4bit: bool = True,
    temperature: float = 0.1,
):
    print(f"Testing model: {model_path}")
    print(f"Problems dir: {problems_dir}")
    print(f"Domain file: {domain_file}")
    print(f"Max problems: {max_problems}")
    print(f"Output: {output_file}")

    if family == "auto":
        model_name_lower = model_path.lower()
        for model_type, model_family in MODEL_FAMILY_MAP.items():
            if model_type in model_name_lower:
                family = model_family
                break
        else:
            family = "mistral"
        print(f"Auto-detected model family: {family}")

    results_dir_path: Path
    if results_dir:
        results_dir_path = Path(results_dir)
    else:
        model_name = model_path.replace("/", "_")
        dir_tag = Path(problems_dir).name if problems_dir else "problems"
        results_dir_path = Path(f"{model_name}_planning_results_{dir_tag}")

    if results_dir_path.exists():
        import shutil

        shutil.rmtree(results_dir_path)
    results_dir_path.mkdir(parents=True, exist_ok=True)
    print(f"Planning results will be saved to: {results_dir_path}")

    if not problems_dir or not domain_file:
        print("--problems-dir 和 --domain-file 都是必需参数。")
        return
    test_data = _load_problems_from_dir(problems_dir, domain_file)
    if max_problems and max_problems > 0 and len(test_data) > max_problems:
        random.seed(42)
        test_data = random.sample(test_data, max_problems)
    if not test_data:
        print("No testing data found!")
        return
    print(f"Loaded {len(test_data)} problems for testing")

    print("Loading model...")
    model, tokenizer = _load_model_and_tokenizer(model_path, load_in_4bit)
    pad_token_id = tokenizer.pad_token_id or tokenizer.eos_token_id or 0

    gen_cfg = GenerationConfig(
        do_sample=True,
        temperature=temperature,
        top_p=0.9,
        max_new_tokens=MAX_NEW_TOKENS,
        pad_token_id=pad_token_id,
    )

    results = []
    total_count = len(test_data)
    category_counts = {
        "success_plans": 0,
        "plan_format_error": 0,
        "precondition_violation": 0,
        "safety_constraints_violation": 0,
        "goal_not_satisfied": 0,
        "others": 0,
        "generation_error": 0,
    }

    for i, sample in enumerate(test_data, 1):
        print(f"\n--- Test {i}/{total_count} ---")
        print(f"Problem: {sample['problem_name']}")

        messages = template_input(sample["prompt"])
        try:
            inputs = tokenizer.apply_chat_template(
                messages,
                tokenize=True,
                add_generation_prompt=True,
                return_tensors="pt",
                enable_thinking=False,
            )
        except TypeError:
            messages = template_input(sample["prompt"], rich=True)
            inputs = tokenizer.apply_chat_template(
                messages,
                tokenize=True,
                add_generation_prompt=True,
                return_tensors="pt",
                enable_thinking=False,
            )

        if hasattr(model, "device"):
            inputs = inputs.to(model.device)
        else:
            try:
                device = next(model.parameters()).device
                inputs = inputs.to(device)
            except Exception:
                pass

        generation_error = None
        output = ""
        try:
            with torch.no_grad():
                outputs = model.generate(input_ids=inputs, generation_config=gen_cfg)
            output = tokenizer.batch_decode(outputs, skip_special_tokens=False)[0]
        except torch.cuda.OutOfMemoryError as e:
            generation_error = f"CUDA Out of Memory: {str(e)}"
            print(generation_error)
            torch.cuda.empty_cache()
        except RuntimeError as e:
            if "out of memory" in str(e).lower():
                generation_error = f"Runtime Out of Memory: {str(e)}"
                print(generation_error)
                torch.cuda.empty_cache()
            else:
                generation_error = f"Runtime Error: {str(e)}"
                print(generation_error)
        except Exception as e:
            generation_error = f"Generation Error: {str(e)}"
            print(generation_error)

        raw_solution = extract_llm_output(output, family) if output else ""

        print(f"\n{'='*80}")
        print("LLM FULL OUTPUT:")
        print(f"{'='*80}")
        print(output)
        print(f"{'='*80}\n")

        if raw_solution:
            print("Parsed plan:")
            print(raw_solution)

        problem_file = sample.get("problem_file")
        solution_name = (
            Path(problem_file).with_suffix(".soln").name if problem_file else f"{sample['problem_name']}.soln"
        )
        solution_file = results_dir_path / solution_name

        validation_message = ""
        validation_stdout = ""
        validation_stderr = ""
        val_cmd = ""
        category = ""

        if generation_error:
            category = "generation_error"
            validation_message = f"Generation failed: {generation_error}"
        elif problem_file and Path(problem_file).exists():
            if raw_solution.strip():
                valid, message, stdout, stderr, val_cmd = validate_solution(
                    domain_file, problem_file, raw_solution
                )
                validation_message = message
                validation_stdout = stdout
                validation_stderr = stderr
                if not _looks_like_valid_plan(raw_solution):
                    category = "plan_format_error"
                else:
                    category = _classify_result(stdout)
            else:
                category = "plan_format_error"
                validation_message = "Empty solution generated"
        else:
            category = "others"
            validation_message = f"Problem file not found: {problem_file}"

        if category in category_counts:
            category_counts[category] += 1
        else:
            category_counts["others"] += 1

        is_valid = category == "success_plans"

        if val_cmd:
            try:
                temp_soln_path = val_cmd.split()[-1]
                if temp_soln_path:
                    validation_stdout = validation_stdout.replace(temp_soln_path, str(solution_file))
                    validation_stderr = validation_stderr.replace(temp_soln_path, str(solution_file))
                    val_cmd = val_cmd.replace(temp_soln_path, str(solution_file))
            except Exception:
                pass

        with open(solution_file, "w", encoding="utf-8") as f_sol:
            f_sol.write(raw_solution)

        if is_valid:
            print(f"✓ Valid solution saved to: {solution_file}")
        else:
            print(f"⚠ Invalid solution saved to: {solution_file}")

        results.append(
            {
                "index": i,
                "problem_name": sample["problem_name"],
                "problem_file": problem_file,
                "solution_file": str(solution_file),
                "is_valid": is_valid,
                "category": category,
                "validation_message": validation_message,
                "validation_stdout": validation_stdout,
                "validation_stderr": validation_stderr,
                "validation_cmd": val_cmd,
                "raw_solution": raw_solution,
                "generation_error": generation_error,
                "ground_truth": sample.get("path", ""),
            }
        )

        category_display = {
            "success_plans": "✓ Success",
            "plan_format_error": "✗ Plan Format Error",
            "precondition_violation": "✗ Precondition Violation",
            "safety_constraints_violation": "✗ Safety Constraints Violation",
            "goal_not_satisfied": "✗ Goal Not Satisfied",
            "others": "✗ Others",
            "generation_error": "✗ Generation Error",
        }
        print(f"{category_display.get(category, '✗ Unknown')}: {category}")
        success_count = category_counts["success_plans"]
        current_success_rate = (success_count / i) * 100
        print(f"Current success rate: {current_success_rate:.1f}% ({success_count}/{i})")
        print(f"Category breakdown: {dict(category_counts)}")

    success_count = category_counts["success_plans"]
    final_success_rate = (success_count / total_count * 100) if total_count > 0 else 0

    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    timestamp_iso = datetime.now().isoformat()
    if output_file == "test_results.json":
        model_name_clean = model_path.replace("/", "_").replace("\\", "_")
        output_file_path = results_dir_path / f"evaluation_summary_{model_name_clean}_{timestamp}.json"
    else:
        output_file_path = results_dir_path / output_file

    output_data = {
        "timestamp": timestamp_iso,
        "model_path": model_path,
        "problems_dir": str(problems_dir),
        "domain_file": str(domain_file),
        "max_problems": max_problems,
        "load_in_4bit": load_in_4bit,
        "results_directory": str(results_dir_path),
        "total_tests": total_count,
        "success_count": success_count,
        "success_rate": final_success_rate,
        "category_counts": category_counts,
        "category_rates": {k: (v / total_count * 100) if total_count > 0 else 0 for k, v in category_counts.items()},
        "results": results,
    }

    with open(output_file_path, "w", encoding="utf-8") as f_out:
        json.dump(output_data, f_out, indent=2, ensure_ascii=False)

    print("\n" + "=" * 60)
    print("FINAL RESULTS")
    print("=" * 60)
    print(f"Total tests: {total_count}")
    print(f"Success plans: {success_count}")
    print(f"Success rate: {final_success_rate:.1f}%")
    print("\nCategory Breakdown:")
    for category, count in category_counts.items():
        rate = (count / total_count * 100) if total_count > 0 else 0
        print(f"  {category}: {count} ({rate:.1f}%)")
    print(f"\nResults saved to: {output_file_path}")
    print(f"Planning results saved to: {results_dir_path}")
    saved_files = list(results_dir_path.glob("*.soln"))
    print(f"\nTotal planning results saved: {len(saved_files)} files")


def main():
    parser = argparse.ArgumentParser(
        description="Evaluate PDDL model with explicit domain and problems directory"
    )
    parser.add_argument("--model", type=str, required=True, help="Path to model on Hugging Face or local")
    parser.add_argument(
        "--family",
        choices=["mistral", "llama", "phi", "qwen", "gemma", "auto"],
        default="auto",
        help="Model family (auto for automatic detection)",
    )
    parser.add_argument("--max-problems", type=int, default=0, help="Maximum number of problems to test (0 for all)")
    parser.add_argument("--results-dir", help="结果保存目录（如果未指定则自动生成）")
    parser.add_argument("--problems-dir", type=str, required=True, help="包含多个 problem PDDL 的目录")
    parser.add_argument("--domain-file", type=str, required=True, help="对应的 domain PDDL 文件路径")
    parser.add_argument(
        "--load-in-4bit",
        dest="load_in_4bit",
        action="store_true",
        help="Load model in 4-bit quantization (default: True)",
    )
    parser.add_argument(
        "--no-load-in-4bit",
        dest="load_in_4bit",
        action="store_false",
        help="Disable 4-bit quantization",
    )
    parser.set_defaults(load_in_4bit=True)
    parser.add_argument("--temperature", type=float, default=0.1, help="Temperature for text generation (default: 0.1)")
    parser.add_argument(
        "--output", type=str, default="test_results.json", help="Output JSON file name (default: auto-named summary)"
    )
    args = parser.parse_args()

    test_model_on_testing_data(
        args.model,
        args.output,
        args.family,
        args.max_problems,
        args.results_dir,
        problems_dir=args.problems_dir,
        domain_file=args.domain_file,
        load_in_4bit=args.load_in_4bit,
        temperature=args.temperature,
    )


if __name__ == "__main__":
    main()
