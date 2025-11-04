#!/usr/bin/env python3
"""
统计多个模型在各个 Scenario 数据集上的 token 分布，并以 Markdown 输出结果。

示例：
  python3 script/token_stats_markdown.py \
      --data-root data/sft \
      --tokenizer unsloth/Qwen3-4B-Instruct-2507:qwen3_4b_instruct \
      --tokenizer unsloth/gpt-oss-20b-unsloth-bnb-4bit:gpt_oss_20b_4bit \
      --tokenizer unsloth/DeepSeek-R1-Distill-Llama-8B:deepseek_r1_llama8b \
      --tokenizer unsloth/mistral-7b-instruct-v0.3-bnb-4bit:mistral_7b_instruct_4bit
"""

import argparse
import json
import math
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Tuple

from transformers import AutoTokenizer


def parse_tokenizer_spec(spec: str) -> Tuple[str, str]:
    """解析 tokenizer 规范，支持 repo:alias 形式。"""
    if ":" in spec:
        repo, alias = spec.split(":", 1)
    else:
        repo = spec
        alias = repo.split("/")[-1].replace("-", "_")
    return repo, alias


def iter_dataset_files(root: Path) -> Iterable[Path]:
    """遍历根目录下的 *_dataset.json 文件。"""
    for path in sorted(root.rglob("*_dataset.json")):
        if path.is_file():
            yield path


def load_dataset(path: Path) -> Optional[List[Dict]]:
    """读取数据集 JSON 文件。"""
    try:
        with open(path, "r", encoding="utf-8") as fh:
            data = json.load(fh)
        if isinstance(data, list):
            return [item for item in data if isinstance(item, dict)]
        print(f"Skipping {path}: expected a list of dict entries.")
        return None
    except Exception as exc:
        print(f"Failed to read {path}: {exc}")
        return None


def percentile(values: List[int], pct: float) -> float:
    """计算百分位数。"""
    if not values:
        return 0.0
    sorted_values = sorted(values)
    k = (len(sorted_values) - 1) * (pct / 100.0)
    low = math.floor(k)
    high = math.ceil(k)
    if low == high:
        return float(sorted_values[int(k)])
    low_val = sorted_values[low]
    high_val = sorted_values[high]
    return float(low_val + (high_val - low_val) * (k - low))


def summarize(tokens: List[int]) -> Dict[str, float]:
    """对 token 序列生成统计指标。"""
    if not tokens:
        return {
            "count": 0.0,
            "mean": 0.0,
            "min": 0.0,
            "max": 0.0,
            "p95": 0.0,
            "p99": 0.0,
        }
    count = len(tokens)
    mean = sum(tokens) / count
    return {
        "count": float(count),
        "mean": mean,
        "min": float(min(tokens)),
        "max": float(max(tokens)),
        "p95": percentile(tokens, 95),
        "p99": percentile(tokens, 99),
    }


def compute_stats(entries: List[Dict], tokenizer) -> Dict[str, Dict[str, float]]:
    """计算单个数据集的 token 统计信息（分别统计 prompt、completion、total）。"""
    prompt_lengths: List[int] = []
    completion_lengths: List[int] = []
    total_lengths: List[int] = []
    for entry in entries:
        prompt = entry.get("prompt", "") or ""
        completion = entry.get("path", "") or ""
        prompt_tokens = len(tokenizer.encode(prompt, add_special_tokens=False))
        completion_tokens = len(tokenizer.encode(completion, add_special_tokens=False))
        prompt_lengths.append(prompt_tokens)
        completion_lengths.append(completion_tokens)
        total_lengths.append(prompt_tokens + completion_tokens)
    return {
        "prompt": summarize(prompt_lengths),
        "completion": summarize(completion_lengths),
        "total": summarize(total_lengths),
    }


def format_markdown_table(rows: List[Dict]) -> List[str]:
    """根据统计结果生成 Markdown 表格内容。"""
    lines = [
        "| Scenario | Dataset | Entries | Mean Solution Tokens | Max Solution Tokens | Mean Total Tokens | Max Total Tokens | Total P95 | Total P99 |",
        "| --- | --- | --- | --- | --- | --- | --- | --- | --- |",
    ]
    for row in rows:
        stats = row["stats"]
        completion_stats = stats["completion"]
        total_stats = stats["total"]
        lines.append(
            f"| {row['scenario']} | {row['dataset']} | {int(total_stats['count'])} | "
            f"{completion_stats['mean']:.1f} | {completion_stats['max']:.0f} | "
            f"{total_stats['mean']:.1f} | {total_stats['max']:.0f} | "
            f"{total_stats['p95']:.0f} | {total_stats['p99']:.0f} |"
        )
    return lines


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="输出多 tokenizer 的 token 统计 Markdown")
    parser.add_argument(
        "--data-root",
        default="data/sft",
        help="包含各个 Scenario 数据集的根目录（默认：data/sft）",
    )
    parser.add_argument(
        "--tokenizer",
        action="append",
        dest="tokenizers",
        required=True,
        help="HuggingFace tokenizer 规范，可重复，支持 repo 或 repo:alias 形式",
    )
    parser.add_argument(
        "--output",
        default="token_stats_summary.md",
        help="输出 Markdown 文件路径（默认：token_stats_summary.md）",
    )
    parser.add_argument(
        "--trust-remote-code",
        action="store_true",
        help="在加载 tokenizer 时传递 trust_remote_code=True",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    data_root = Path(args.data_root).expanduser().resolve()
    output_path = Path(args.output).expanduser().resolve()

    if not data_root.exists():
        print(f"Data root {data_root} does not exist.")
        return

    dataset_entries: List[Dict] = []
    for dataset_file in iter_dataset_files(data_root):
        entries = load_dataset(dataset_file)
        if not entries:
            continue
        dataset_entries.append(
            {
                "file": dataset_file,
                "scenario": dataset_file.parent.name,
                "dataset": dataset_file.name,
                "entries": entries,
            }
        )

    if not dataset_entries:
        print("No dataset files found.")
        return

    tokenizer_specs = [parse_tokenizer_spec(spec) for spec in args.tokenizers]

    markdown_lines: List[str] = []
    markdown_lines.append("# Token Statistics Summary")
    markdown_lines.append("")
    markdown_lines.append(f"- Data root: `{data_root}`")
    markdown_lines.append("")

    for repo, alias in tokenizer_specs:
        markdown_lines.append(f"## {alias}")
        markdown_lines.append("")
        markdown_lines.append(f"- Repository: `{repo}`")
        markdown_lines.append("")
        tokenizer = AutoTokenizer.from_pretrained(
            repo,
            trust_remote_code=args.trust_remote_code,
        )

        rows: List[Dict] = []
        max_total_row: Optional[Dict] = None
        max_completion_row: Optional[Dict] = None

        for dataset_info in dataset_entries:
            stats = compute_stats(dataset_info["entries"], tokenizer)
            row = {
                "scenario": dataset_info["scenario"],
                "dataset": dataset_info["dataset"],
                "stats": stats,
            }
            rows.append(row)
            if (
                max_total_row is None
                or stats["total"]["max"] > max_total_row["stats"]["total"]["max"]
            ):
                max_total_row = row
            if (
                max_completion_row is None
                or stats["completion"]["max"] > max_completion_row["stats"]["completion"]["max"]
            ):
                max_completion_row = row

        rows.sort(key=lambda r: (r["scenario"], r["dataset"]))
        markdown_lines.extend(format_markdown_table(rows))
        markdown_lines.append("")

        if max_completion_row:
            markdown_lines.append(
                f"- Max solution tokens: {max_completion_row['stats']['completion']['max']:.0f} "
                f"(dataset `{max_completion_row['dataset']}` / scenario `{max_completion_row['scenario']}`)"
            )
        if max_total_row:
            markdown_lines.append(
                f"- Max total tokens: {max_total_row['stats']['total']['max']:.0f} "
                f"(dataset `{max_total_row['dataset']}` / scenario `{max_total_row['scenario']}`)"
            )
            markdown_lines.append("")

    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as fh:
        fh.write("\n".join(markdown_lines))

    print(f"Markdown summary written to {output_path}")


if __name__ == "__main__":
    main()
