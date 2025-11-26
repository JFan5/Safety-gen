#!/usr/bin/env python3
"""
修复 jobs 目录下所有 .job 文件中的常见问题：
1. 替换 "size" 和 "name" 占位符
2. 修复双引号错误（""model"" -> "model"）
3. 写死常见变量
"""

import re
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
JOBS_DIR = REPO_ROOT / "jobs"


def fix_common_issues(content: str, file_path: Path) -> str:
    """修复常见问题"""
    lines = content.split('\n')
    new_lines = []
    
    for i, line in enumerate(lines):
        # 修复占位符
        if '#$ -pe smp size' in line:
            # 根据文件类型推断合适的 smp 值
            if 'dpo' in str(file_path) or 'grpo' in str(file_path):
                new_lines.append('#$ -pe smp 28')
            elif 'fine_tune' in str(file_path):
                new_lines.append('#$ -pe smp 8')
            else:
                new_lines.append('#$ -pe smp 8')
        elif '#$ -N name' in line:
            # 从文件路径生成作业名称
            parts = file_path.parts
            if 'mistral_7b' in parts:
                model = 'mistral'
            elif 'gpt_oss_20b' in parts:
                model = 'gpt_oss_20b'
            elif 'qwen3' in parts:
                model = 'qwen3'
            else:
                model = 'model'
            
            # 提取场景和类型
            scenario = 'multi' if 'multi' in str(file_path) else file_path.stem
            job_type = 'fine_tune' if 'fine_tune' in str(file_path) else 'evaluate' if 'evaluate' in str(file_path) else 'dpo' if 'dpo' in str(file_path) else 'grpo' if 'grpo' in str(file_path) else 'job'
            
            job_name = f"{job_type}_{model}_{scenario}".replace('-', '_').replace('.', '_')
            new_lines.append(f'#$ -N {job_name}')
        elif '""unsloth/' in line or '""unsloth/' in line:
            # 修复双引号错误
            line = line.replace('""unsloth/', '"unsloth/').replace('""', '"')
            new_lines.append(line)
        elif re.search(r'\$\{?OUTPUT_NAME\}?', line) and 'fine_tune' in str(file_path):
            # 写死 OUTPUT_NAME 变量
            if 'blocksworld' in str(file_path):
                output_val = 'mistral_7b/blocksworld/pddl3' if 'pddl3' in str(file_path) else 'mistral_7b/blocksworld/pddl2'
            elif 'delivery' in str(file_path):
                output_val = 'mistral_7b/delivery/pddl3' if 'pddl3' in str(file_path) else 'mistral_7b/delivery/pddl2'
            elif 'spanner' in str(file_path):
                output_val = '/groups/fkong/jfan5/sft_models/mistral_7b-spanner-variant-500'
            elif 'multi' in str(file_path):
                output_val = 'mistral_7b/multi_scenarios/pddl3' if 'pddl3' in str(file_path) else 'mistral_7b/multi_scenarios/pddl2'
            else:
                output_val = line.split('=')[-1].strip().strip('"') if '=' in line else 'mistral_7b/output'
            
            line = re.sub(r'\$\{?OUTPUT_NAME\}?', f'"{output_val}"', line)
            new_lines.append(line)
        elif re.search(r'\$\{?DATASET_PATH\}?', line):
            # 写死 DATASET_PATH 变量（保留原值，只替换变量引用）
            dataset_val = line.split('=')[-1].strip().strip('"') if '=' in line and 'DATASET_PATH' in line else None
            if dataset_val:
                line = re.sub(r'\$\{?DATASET_PATH\}?', f'"{dataset_val}"', line)
            new_lines.append(line)
        elif re.search(r'\$\{?MODEL_NAME\}?', line):
            # 写死 MODEL_NAME 变量
            if 'gpt' in str(file_path).lower():
                model_val = '"unsloth/gpt-oss-20b-unsloth-bnb-4bit"'
            else:
                model_val = '"unsloth/mistral-7b-instruct-v0.3-bnb-4bit"'
            line = re.sub(r'\$\{?MODEL_NAME\}?', model_val, line)
            new_lines.append(line)
        elif re.search(r'\$\{?BASE_MODEL\}?', line) and 'dpo' in str(file_path):
            # DPO 中的 BASE_MODEL 需要从上下文推断
            # 这里简化处理，保留原逻辑
            pass
            new_lines.append(line)
        else:
            new_lines.append(line)
    
    return '\n'.join(new_lines)


def process_file(file_path: Path) -> bool:
    """处理单个文件"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 修复常见问题
        new_content = fix_common_issues(content, file_path)
        
        # 如果内容有变化，写回文件
        if new_content != content:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(new_content)
            return True
        return False
    except Exception as e:
        print(f"Error processing {file_path}: {e}", file=sys.stderr)
        return False


def main():
    """主函数"""
    import sys
    
    job_files = list(JOBS_DIR.rglob("*.job"))
    
    print(f"Found {len(job_files)} job files")
    print("Fixing common issues (placeholders, double quotes, variables)...\n")
    
    fixed = 0
    for job_file in sorted(job_files):
        if process_file(job_file):
            print(f"Fixed: {job_file.relative_to(REPO_ROOT)}")
            fixed += 1
    
    print(f"\nFixed {fixed}/{len(job_files)} files")
    print("\nNote: Some files may still need manual review, especially those with task arrays.")


if __name__ == "__main__":
    main()

