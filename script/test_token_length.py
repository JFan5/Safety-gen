#!/usr/bin/env python3
"""
Test script to analyze token lengths in GRPO dataset using Unsloth.
Usage:
    python test_token_length.py --data_dir /jfan5/grpo_data-127 --model Qwen/Qwen2.5-14B-Instruct
"""

import argparse
import json
import statistics
from pathlib import Path
from typing import List, Dict, Any
from unsloth import FastLanguageModel


def analyze_token_lengths(
    data_path: str,
    tokenizer,
    prompt_field: str = "prompt",
    response_field: str = "response",
) -> Dict[str, Any]:
    """Analyze token lengths for a single JSONL file."""

    prompt_lengths: List[int] = []
    response_lengths: List[int] = []
    total_lengths: List[int] = []

    with open(data_path, "r", encoding="utf-8") as f:
        for line in f:
            if not line.strip():
                continue
            record = json.loads(line)

            prompt = record.get(prompt_field, "")
            response = record.get(response_field, "")

            if prompt:
                prompt_tokens = tokenizer.encode(prompt, add_special_tokens=False)
                prompt_len = len(prompt_tokens)
                prompt_lengths.append(prompt_len)
            else:
                prompt_len = 0

            if response:
                response_tokens = tokenizer.encode(response, add_special_tokens=False)
                response_len = len(response_tokens)
                response_lengths.append(response_len)
            else:
                response_len = 0

            total_lengths.append(prompt_len + response_len)

    stats = {
        "file": str(data_path),
        "num_samples": len(prompt_lengths),
        "prompt": {
            "max": max(prompt_lengths) if prompt_lengths else 0,
            "min": min(prompt_lengths) if prompt_lengths else 0,
            "mean": statistics.mean(prompt_lengths) if prompt_lengths else 0,
            "median": statistics.median(prompt_lengths) if prompt_lengths else 0,
            "p95": sorted(prompt_lengths)[int(len(prompt_lengths) * 0.95)] if prompt_lengths else 0,
            "p99": sorted(prompt_lengths)[int(len(prompt_lengths) * 0.99)] if prompt_lengths else 0,
        },
        "response": {
            "max": max(response_lengths) if response_lengths else 0,
            "min": min(response_lengths) if response_lengths else 0,
            "mean": statistics.mean(response_lengths) if response_lengths else 0,
            "median": statistics.median(response_lengths) if response_lengths else 0,
            "p95": sorted(response_lengths)[int(len(response_lengths) * 0.95)] if response_lengths else 0,
            "p99": sorted(response_lengths)[int(len(response_lengths) * 0.99)] if response_lengths else 0,
        },
        "total": {
            "max": max(total_lengths) if total_lengths else 0,
            "min": min(total_lengths) if total_lengths else 0,
            "mean": statistics.mean(total_lengths) if total_lengths else 0,
            "median": statistics.median(total_lengths) if total_lengths else 0,
            "p95": sorted(total_lengths)[int(len(total_lengths) * 0.95)] if total_lengths else 0,
            "p99": sorted(total_lengths)[int(len(total_lengths) * 0.99)] if total_lengths else 0,
        },
    }

    return stats


def print_stats(stats: Dict[str, Any]) -> None:
    """Pretty print token statistics."""
    print(f"\n{'='*70}")
    print(f"File: {stats['file']}")
    print(f"Number of samples: {stats['num_samples']}")
    print(f"{'='*70}")

    for field in ["prompt", "response", "total"]:
        s = stats[field]
        print(f"\n{field.upper()} tokens:")
        print(f"  Max:    {s['max']:>6}")
        print(f"  Min:    {s['min']:>6}")
        print(f"  Mean:   {s['mean']:>6.1f}")
        print(f"  Median: {s['median']:>6.1f}")
        print(f"  P95:    {s['p95']:>6}")
        print(f"  P99:    {s['p99']:>6}")


def main():
    parser = argparse.ArgumentParser(description="Analyze token lengths in GRPO dataset")
    parser.add_argument("--data_dir", type=str, default="/jfan5/grpo_data-127",
                        help="Directory containing JSONL files")
    parser.add_argument("--file", type=str, default=None,
                        help="Specific file to analyze (optional, analyzes all .jsonl if not specified)")
    parser.add_argument("--model", type=str, default="Qwen/Qwen2.5-14B-Instruct",
                        help="Model name/path for tokenizer")
    parser.add_argument("--prompt_field", type=str, default="prompt",
                        help="Field name for prompts")
    parser.add_argument("--response_field", type=str, default="response",
                        help="Field name for responses")

    args = parser.parse_args()

    print(f"Loading tokenizer from: {args.model}")
    # Try loading tokenizer only (faster, works with adapter models)
    from transformers import AutoTokenizer
    try:
        tokenizer = AutoTokenizer.from_pretrained(args.model, trust_remote_code=True)
        print(f"Tokenizer loaded (transformers). Vocab size: {tokenizer.vocab_size}")
    except Exception as e:
        print(f"Failed to load tokenizer directly, trying Unsloth: {e}")
        model, tokenizer = FastLanguageModel.from_pretrained(
            model_name=args.model,
            max_seq_length=4096,
            dtype=None,
            load_in_4bit=True,
        )
        print(f"Tokenizer loaded (Unsloth). Vocab size: {tokenizer.vocab_size}")

    data_dir = Path(args.data_dir)

    if args.file:
        files = [data_dir / args.file]
    else:
        files = sorted(data_dir.glob("*.jsonl"))

    print(f"\nAnalyzing {len(files)} file(s)...")

    all_stats = []
    for file_path in files:
        print(f"\nProcessing: {file_path.name}...")
        stats = analyze_token_lengths(
            str(file_path),
            tokenizer,
            args.prompt_field,
            args.response_field,
        )
        all_stats.append(stats)
        print_stats(stats)

    # Summary across all files
    if len(all_stats) > 1:
        print(f"\n{'='*70}")
        print("SUMMARY ACROSS ALL FILES")
        print(f"{'='*70}")

        total_samples = sum(s["num_samples"] for s in all_stats)
        max_prompt = max(s["prompt"]["max"] for s in all_stats)
        max_response = max(s["response"]["max"] for s in all_stats)
        max_total = max(s["total"]["max"] for s in all_stats)

        print(f"\nTotal samples: {total_samples}")
        print(f"\nMax prompt tokens:   {max_prompt}")
        print(f"Max response tokens: {max_response}")
        print(f"Max total tokens:    {max_total}")

        print(f"\n{'='*70}")
        print("RECOMMENDED SETTINGS")
        print(f"{'='*70}")
        print(f"--max_prompt_length {int(max_prompt * 1.1)}  (based on max_prompt={max_prompt})")
        print(f"--max_new_tokens    {int(max_response * 1.2)}  (based on max_response={max_response})")
        print(f"Total max_seq_length should be >= {int(max_total * 1.1)}")


if __name__ == "__main__":
    main()
