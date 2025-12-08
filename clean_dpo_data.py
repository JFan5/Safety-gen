#!/usr/bin/env python3
"""
Clean DPO dataset by fixing common issues in model-generated solutions.
"""

import json
import re
from pathlib import Path
import argparse


def clean_plan_text(text: str) -> str:
    """
    Clean plan text by removing common artifacts from model generation.

    Args:
        text: Raw plan text

    Returns:
        Cleaned plan text
    """
    if not text or not isinstance(text, str):
        return text

    # Remove leading non-paren characters (like "O ", "` ", etc.)
    # Find the first occurrence of "("
    first_paren = text.find('(')
    if first_paren > 0:
        text = text[first_paren:]

    # Remove common model artifacts
    text = text.replace('```', '')  # Remove markdown code blocks
    text = text.replace('Plan:', '')  # Remove "Plan:" prefix

    # Fix common action name variations
    text = re.sub(r'\(put-down\s', '(putdown ', text)  # put-down -> putdown
    text = re.sub(r'\(pick-up\s', '(pickup ', text)    # pick-up -> pickup

    # Remove trailing markdown or explanations
    # Plans should only contain action lines
    lines = text.strip().split('\n')
    clean_lines = []
    for line in lines:
        line = line.strip()
        # Keep only lines that look like PDDL actions
        if line.startswith('(') and line.endswith(')'):
            clean_lines.append(line)

    return '\n'.join(clean_lines) + '\n' if clean_lines else text


def clean_dpo_dataset(input_path: str, output_path: str):
    """
    Clean a DPO dataset by fixing common issues.

    Args:
        input_path: Path to input JSONL file
        output_path: Path to output cleaned JSONL file
    """
    input_file = Path(input_path)
    output_file = Path(output_path)

    if not input_file.exists():
        raise FileNotFoundError(f"Input file not found: {input_path}")

    print(f"Cleaning DPO dataset: {input_path}")
    print(f"Output will be saved to: {output_path}")
    print()

    cleaned_count = 0
    total_count = 0

    with open(input_file, 'r', encoding='utf-8') as fin, \
         open(output_file, 'w', encoding='utf-8') as fout:

        for line_num, line in enumerate(fin, 1):
            if not line.strip():
                continue

            try:
                data = json.loads(line)
                total_count += 1

                # Clean the rejected field (model-generated solutions)
                original_rejected = data.get('rejected', '')
                cleaned_rejected = clean_plan_text(original_rejected)

                if cleaned_rejected != original_rejected:
                    cleaned_count += 1
                    if line_num <= 5:  # Show first 5 cleanings as examples
                        print(f"Line {line_num} - Cleaned rejected field:")
                        print(f"  Original: {repr(original_rejected[:100])}")
                        print(f"  Cleaned:  {repr(cleaned_rejected[:100])}")
                        print()

                data['rejected'] = cleaned_rejected

                # Also clean chosen field (should be cleaner already)
                original_chosen = data.get('chosen', '')
                cleaned_chosen = clean_plan_text(original_chosen)
                data['chosen'] = cleaned_chosen

                # Write cleaned record
                fout.write(json.dumps(data, ensure_ascii=False) + '\n')

            except json.JSONDecodeError as e:
                print(f"Warning: Line {line_num} has JSON error: {e}, skipping")
                continue

    print(f"\nCleaning complete:")
    print(f"  Total records: {total_count}")
    print(f"  Records with cleaned rejected field: {cleaned_count}")
    print(f"  Output saved to: {output_path}")


def main():
    parser = argparse.ArgumentParser(description='Clean DPO dataset')
    parser.add_argument(
        '--input',
        type=str,
        required=True,
        help='Input JSONL file'
    )
    parser.add_argument(
        '--output',
        type=str,
        required=True,
        help='Output cleaned JSONL file'
    )

    args = parser.parse_args()
    clean_dpo_dataset(args.input, args.output)


if __name__ == "__main__":
    main()
