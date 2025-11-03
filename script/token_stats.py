#!/usr/bin/env python3
"""
统计各个 Scenario 数据集的 token 分布。

示例：
  python3 script/token_stats.py --data-root data/sft --tokenizer meta-llama/Llama-3-8B-Instruct

如果未提供 --tokenizer，将退化为简单的空白分词统计。
"""

import argparse
import json
import math
from pathlib import Path
from typing import Callable, Dict, Iterable, List, Optional, Tuple

try:
    from transformers import AutoTokenizer  # type: ignore
except Exception:  # pragma: no cover - transformers 未安装时兜底
    AutoTokenizer = None  # type: ignore


TokenCounter = Callable[[str], int]


def load_tokenizer(name_or_path: Optional[str]) -> TokenCounter:
    """根据名称加载 HuggingFace tokenizer，失败则退化为空白分词。"""
    if not name_or_path:
        return lambda text: len(text.split())

    if AutoTokenizer is None:
        print("Warning: transformers not available, falling back to whitespace token count.")
        return lambda text: len(text.split())

    try:
        tokenizer = AutoTokenizer.from_pretrained(name_or_path)
    except Exception as exc:  # pragma: no cover - 网络/权限失败时兜底
        print(f"Warning: failed to load tokenizer {name_or_path}: {exc}")
        print("Falling back to whitespace token count.")
        return lambda text: len(text.split())

    def count_tokens(text: str) -> int:
        return len(tokenizer.encode(text, add_special_tokens=False))

    return count_tokens


def iter_dataset_files(root: Path) -> Iterable[Path]:
    """遍历根目录下的 *_dataset.json 文件。"""
    for path in sorted(root.rglob("*_dataset.json")):
        if path.is_file():
            yield path


def percentile(values: List[int], pct: float) -> float:
    """计算给定列表的百分位数。"""
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


def summarize_tokens(tokens: List[int]) -> Dict[str, float]:
    """生成常用统计指标。"""
    if not tokens:
        return {
            "count": 0,
            "mean": 0.0,
            "min": 0.0,
            "max": 0.0,
            "p95": 0.0,
            "p99": 0.0,
        }

    count = len(tokens)
    mean = sum(tokens) / count
    min_val = min(tokens)
    max_val = max(tokens)
    p95 = percentile(tokens, 95)
    p99 = percentile(tokens, 99)

    return {
        "count": float(count),
        "mean": mean,
        "min": float(min_val),
        "max": float(max_val),
        "p95": p95,
        "p99": p99,
    }


def process_dataset(path: Path, token_counter: TokenCounter) -> Optional[Dict]:
    """读取单个数据集文件并统计 token。"""
    try:
        with open(path, "r", encoding="utf-8") as fh:
            data = json.load(fh)
    except Exception as exc:
        print(f"Failed to read {path}: {exc}")
        return None

    if not isinstance(data, list):
        print(f"Skipping {path}: expected a list of entries.")
        return None

    prompt_tokens: List[int] = []
    completion_tokens: List[int] = []
    total_tokens: List[int] = []

    for entry in data:
        if not isinstance(entry, dict):
            continue
        prompt = entry.get("prompt", "") or ""
        completion = entry.get("path", "") or ""
        p_tokens = token_counter(prompt)
        c_tokens = token_counter(completion)
        prompt_tokens.append(p_tokens)
        completion_tokens.append(c_tokens)
        total_tokens.append(p_tokens + c_tokens)

    summary = {
        "file": str(path),
        "scenario": path.parent.name,
        "dataset_name": path.name,
        "entries": len(total_tokens),
        "prompt": summarize_tokens(prompt_tokens),
        "completion": summarize_tokens(completion_tokens),
        "total": summarize_tokens(total_tokens),
    }
    return summary


def format_summary(summary: Dict) -> str:
    """格式化单个数据集的统计输出。"""
    total = summary["total"]
    prompt = summary["prompt"]
    completion = summary["completion"]
    lines = [
        f"- File: {summary['file']}",
        f"  Entries: {summary['entries']}",
        (
            "  Prompt tokens -> "
            f"mean: {prompt['mean']:.1f}, max: {prompt['max']:.0f}, "
            f"p95: {prompt['p95']:.0f}, p99: {prompt['p99']:.0f}"
        ),
        (
            "  Completion tokens -> "
            f"mean: {completion['mean']:.1f}, max: {completion['max']:.0f}, "
            f"p95: {completion['p95']:.0f}, p99: {completion['p99']:.0f}"
        ),
        (
            "  Total tokens -> "
            f"mean: {total['mean']:.1f}, max: {total['max']:.0f}, "
            f"p95: {total['p95']:.0f}, p99: {total['p99']:.0f}"
        ),
    ]
    return "\n".join(lines)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="统计 Scenario 数据集的 token 分布")
    parser.add_argument(
        "--data-root",
        default="data/sft",
        help="包含各个 Scenario 数据集的根目录（默认：data/sft）",
    )
    parser.add_argument(
        "--tokenizer",
        default=None,
        help="HuggingFace tokenizer 名称或本地路径，未指定时使用空白分词统计。",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    data_root = Path(args.data_root).expanduser().resolve()

    if not data_root.exists():
        print(f"Data root {data_root} does not exist.")
        return

    token_counter = load_tokenizer(args.tokenizer)

    summaries: List[Dict] = []
    for dataset_file in iter_dataset_files(data_root):
        summary = process_dataset(dataset_file, token_counter)
        if summary:
            summaries.append(summary)

    if not summaries:
        print("No dataset summaries generated.")
        return

    print("=" * 60)
    print("Token statistics per dataset")
    print("=" * 60)
    for summary in summaries:
        print(format_summary(summary))
        print("-" * 60)

    # 查找总 token 最大的数据集
    max_summary = max(summaries, key=lambda s: s["total"]["max"])
    total_max = max_summary["total"]["max"]
    print("Highest total token count:")
    print(f"- File: {max_summary['file']}")
    print(f"- Max total tokens: {total_max:.0f}")
    print("=" * 60)


if __name__ == "__main__":
    main()
