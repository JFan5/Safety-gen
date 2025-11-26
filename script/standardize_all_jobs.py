#!/usr/bin/env python3
"""
批量标准化 jobs 目录下的所有 .job 文件：
1. 统一格式和头部
2. 将环境变量写死
3. 添加统一的错误处理和路径设置
"""

import re
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
JOBS_DIR = REPO_ROOT / "jobs"


def extract_sge_params(content: str) -> dict:
    """提取 SGE 参数"""
    params = {
        'output': None,
        'job_name': None,
        'pe_smp': '8',
        'task_array': None,
        'gpu_card': '1',
    }
    
    for line in content.split('\n'):
        line = line.strip()
        if '#$ -o' in line or '#$ -O' in line:
            parts = line.split()
            if len(parts) >= 3:
                params['output'] = parts[-1]
        elif '#$ -N' in line:
            parts = line.split()
            if len(parts) >= 3:
                params['job_name'] = parts[-1]
        elif '#$ -pe smp' in line:
            parts = line.split()
            if len(parts) >= 4:
                params['pe_smp'] = parts[-1]
        elif '#$ -t' in line:
            parts = line.split()
            if len(parts) >= 3:
                params['task_array'] = parts[-1]
        elif '#$ -l gpu_card' in line:
            parts = line.split('=')
            if len(parts) >= 2:
                params['gpu_card'] = parts[-1].strip()
    
    return params


def standardize_header(params: dict) -> str:
    """生成标准化的头部"""
    header = [
        "#!/bin/bash",
        "",
        "#$ -M jfan5@nd.edu",
        "#$ -m abe",
        "#$ -q gpu",
        f"#$ -l gpu_card={params['gpu_card']}",
    ]
    
    if params['output']:
        header.append(f"#$ -o {params['output']}")
    header.append(f"#$ -pe smp {params['pe_smp']}")
    if params['job_name']:
        header.append(f"#$ -N {params['job_name']}")
    if params['task_array']:
        header.append(f"#$ -t {params['task_array']}")
    
    header.extend([
        "",
        "set -euo pipefail",
        "",
        "# Ensure we are at the repo root so relative paths below work",
        "cd /home/ubuntu/Safety-gen",
        "",
    ])
    
    return '\n'.join(header)


def replace_variables_in_body(body: str) -> str:
    """替换 body 中的环境变量"""
    # 常见的变量替换模式
    replacements = {
        r'\$\{BASE_MODEL\}': '"unsloth/mistral-7b-instruct-v0.3-bnb-4bit"',
        r'\$\{MODEL_NAME\}': '"unsloth/mistral-7b-instruct-v0.3-bnb-4bit"',
        r'\$BASE_MODEL': '"unsloth/mistral-7b-instruct-v0.3-bnb-4bit"',
        r'\$MODEL_NAME': '"unsloth/mistral-7b-instruct-v0.3-bnb-4bit"',
    }
    
    for pattern, replacement in replacements.items():
        body = re.sub(pattern, replacement, body)
    
    # 处理其他变量（保留引号中的值）
    # 匹配 $VAR 或 ${VAR} 模式，但保留在引号中的值
    def replace_var(match):
        var_name = match.group(1) if match.group(1) else match.group(2)
        # 如果变量名在常见列表中，使用默认值
        if var_name in ['BASE_MODEL', 'MODEL_NAME']:
            return '"unsloth/mistral-7b-instruct-v0.3-bnb-4bit"'
        # 否则尝试从上下文中提取（这里简化处理，保留原值）
        return match.group(0)
    
    # 更智能的替换：只替换不在引号中的变量
    # 这里简化处理，直接替换已知变量
    return body


def extract_body(content: str) -> str:
    """提取脚本主体部分"""
    lines = content.split('\n')
    body_start = 0
    
    # 找到第一个非注释、非空、非 shebang 的行
    for i, line in enumerate(lines):
        stripped = line.strip()
        if stripped and not stripped.startswith('#') and not stripped.startswith('#!/'):
            body_start = i
            break
    
    body_lines = lines[body_start:]
    
    # 移除已有的 set -euo pipefail 和 cd 命令（如果存在）
    filtered_lines = []
    skip_next = False
    for i, line in enumerate(body_lines):
        if skip_next:
            skip_next = False
            continue
        if 'set -euo pipefail' in line or 'set -e' in line:
            continue
        if 'cd /home/ubuntu/Safety-gen' in line or 'cd /users/jfan5' in line:
            continue
        if 'Ensure we are at the repo root' in line:
            continue
        filtered_lines.append(line)
    
    return '\n'.join(filtered_lines).strip()


def standardize_job_file(file_path: Path) -> bool:
    """标准化单个 job 文件"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 提取参数
        params = extract_sge_params(content)
        
        # 生成标准化头部
        new_header = standardize_header(params)
        
        # 提取主体
        body = extract_body(content)
        
        # 替换变量
        body = replace_variables_in_body(body)
        
        # 确保有 conda activate
        if 'conda activate' not in body:
            body = "conda activate llmstl\n\n" + body
        
        # 组合新内容
        new_content = new_header + body
        
        # 确保以换行符结尾
        if not new_content.endswith('\n'):
            new_content += '\n'
        
        # 写回文件
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        
        return True
    except Exception as e:
        print(f"Error processing {file_path}: {e}", file=sys.stderr)
        return False


def main():
    """主函数"""
    import sys
    
    job_files = list(JOBS_DIR.rglob("*.job"))
    
    print(f"Found {len(job_files)} job files to process")
    print("This script will standardize headers and replace common variables.")
    print("Note: Some variables may need manual review.\n")
    
    processed = 0
    for job_file in sorted(job_files):
        if standardize_job_file(job_file):
            print(f"✓ {job_file.relative_to(REPO_ROOT)}")
            processed += 1
    
    print(f"\nProcessed {processed}/{len(job_files)} files")
    print("\nPlease review the files and manually fix any remaining variables.")


if __name__ == "__main__":
    main()

