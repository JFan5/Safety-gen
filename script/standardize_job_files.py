#!/usr/bin/env python3
"""
标准化 jobs 目录下的所有 .job 文件：
1. 统一格式
2. 将参数写死（移除环境变量）
3. 添加统一的头部和注释
4. 确保使用绝对路径或相对于项目根目录的路径
"""

import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
JOBS_DIR = REPO_ROOT / "jobs"


def standardize_header(content: str) -> str:
    """标准化 SGE 头部"""
    lines = content.split('\n')
    header_end = 0
    
    # 找到头部结束位置（第一个非注释、非空行）
    for i, line in enumerate(lines):
        if line.strip() and not line.strip().startswith('#') and not line.strip().startswith('#!/'):
            header_end = i
            break
    
    # 提取头部
    header_lines = lines[:header_end]
    
    # 标准化头部
    standardized_header = [
        "#!/bin/bash",
        "",
        "#$ -M jfan5@nd.edu",
        "#$ -m abe",
        "#$ -q gpu",
        "#$ -l gpu_card=1",
    ]
    
    # 提取输出路径和作业名称
    output_path = None
    job_name = None
    pe_smp = "8"
    task_array = None
    
    for line in header_lines:
        if '#$ -o' in line or '#$ -O' in line:
            output_path = line.split()[-1] if len(line.split()) > 2 else None
        elif '#$ -N' in line:
            job_name = line.split()[-1] if len(line.split()) > 2 else None
        elif '#$ -pe smp' in line:
            pe_smp = line.split()[-1] if len(line.split()) > 3 else "8"
        elif '#$ -t' in line:
            task_array = line.split()[-1] if len(line.split()) > 2 else None
    
    if output_path:
        standardized_header.append(f"#$ -o {output_path}")
    standardized_header.append(f"#$ -pe smp {pe_smp}")
    if job_name:
        standardized_header.append(f"#$ -N {job_name}")
    if task_array:
        standardized_header.append(f"#$ -t {task_array}")
    
    standardized_header.append("")
    standardized_header.append("set -euo pipefail")
    standardized_header.append("")
    standardized_header.append("# Ensure we are at the repo root so relative paths below work")
    standardized_header.append("cd /home/ubuntu/Safety-gen")
    standardized_header.append("")
    
    return '\n'.join(standardized_header)


def replace_variables(content: str) -> str:
    """替换环境变量为写死的值"""
    # 常见的变量模式
    patterns = [
        (r'\$\{BASE_MODEL\}', '"unsloth/mistral-7b-instruct-v0.3-bnb-4bit"'),
        (r'\$\{MODEL_NAME\}', '"unsloth/mistral-7b-instruct-v0.3-bnb-4bit"'),
        (r'\$\{OUTPUT_NAME\}', None),  # 需要从上下文推断
        (r'\$\{DATASET_PATH\}', None),  # 需要从上下文推断
        (r'\$\{PROBLEMS_DIR\}', None),  # 需要从上下文推断
        (r'\$\{DOMAIN_FILE\}', None),  # 需要从上下文推断
        (r'\$\{RESULTS_DIR\}', None),  # 需要从上下文推断
        (r'\$\{OUTPUT_NAME\}', None),  # 需要从上下文推断
    ]
    
    # 简单的变量替换（带引号的）
    content = re.sub(r'\$\{([^}]+)\}', r'\1', content)
    content = re.sub(r'\$([A-Z_]+)', r'\1', content)
    
    return content


def standardize_job_file(file_path: Path) -> bool:
    """标准化单个 job 文件"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 如果已经包含 set -euo pipefail 和 cd 命令，可能已经标准化过
        if 'set -euo pipefail' in content and 'cd /home/ubuntu/Safety-gen' in content:
            # 只检查是否需要替换变量
            if '${' in content or '$' in content and not content.count('$') == content.count('#$'):
                # 还有变量需要替换
                pass
            else:
                return False  # 已经标准化
        
        # 标准化头部
        new_content = standardize_header(content)
        
        # 提取主体部分（去掉旧头部）
        lines = content.split('\n')
        body_start = 0
        for i, line in enumerate(lines):
            if line.strip() and not line.strip().startswith('#') and not line.strip().startswith('#!/'):
                body_start = i
                break
        
        body = '\n'.join(lines[body_start:])
        
        # 替换变量（简单处理，保留原有的变量值）
        # 这里需要更智能的处理，暂时保留原有逻辑
        body = body.replace('${BASE_MODEL}', '"unsloth/mistral-7b-instruct-v0.3-bnb-4bit"')
        body = body.replace('${MODEL_NAME}', '"unsloth/mistral-7b-instruct-v0.3-bnb-4bit"')
        
        # 确保 conda activate 存在
        if 'conda activate' not in body:
            new_content += "conda activate llmstl\n\n"
        
        new_content += body
        
        # 确保文件以换行符结尾
        if not new_content.endswith('\n'):
            new_content += '\n'
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        
        return True
    except Exception as e:
        print(f"Error processing {file_path}: {e}", file=sys.stderr)
        return False


def main():
    """主函数：批量处理所有 job 文件"""
    job_files = list(JOBS_DIR.rglob("*.job"))
    
    print(f"Found {len(job_files)} job files to process")
    
    processed = 0
    for job_file in job_files:
        if standardize_job_file(job_file):
            print(f"Processed: {job_file.relative_to(REPO_ROOT)}")
            processed += 1
    
    print(f"\nProcessed {processed} files")


if __name__ == "__main__":
    main()

