#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
合并 DPO 的 scored.jsonl 到 GRPO 的 grpo.jsonl
- 读取 /home/ubuntu/data/dpo/gpt_multi_pddl3_500 下各场景的 scored.jsonl
- 检查问题是否在对应的 grpo_training 目录下
- 对于重合的问题，从 scored.jsonl 中提取 solution 写入 grpo.jsonl
- 对于不重合的问题，使用 generate_score_candidate.py 生成新的候选解
"""

import json
import os
import subprocess
import tempfile
import shutil
from pathlib import Path
from collections import defaultdict
import argparse


def load_grpo_training_problems(grpo_training_dir):
    """加载 grpo_training 目录下的所有问题文件名（不含扩展名）"""
    problems = set()
    grpo_dir = Path(grpo_training_dir)
    if not grpo_dir.exists():
        print(f"[Warn] Directory {grpo_training_dir} does not exist")
        return problems
    
    for pddl_file in grpo_dir.glob("*.pddl"):
        if "domain" not in pddl_file.name.lower():
            problems.add(pddl_file.stem)
    return problems


def load_scored_jsonl(scored_jsonl_path):
    """加载 scored.jsonl 文件，按 problem_name 组织数据"""
    problem_data = defaultdict(list)
    
    if not Path(scored_jsonl_path).exists():
        print(f"[Warn] File {scored_jsonl_path} does not exist")
        return problem_data
    
    with open(scored_jsonl_path, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            try:
                record = json.loads(line)
                problem_name = record.get('problem_name')
                if problem_name:
                    problem_data[problem_name].append(record)
            except json.JSONDecodeError as e:
                print(f"[Warn] Failed to parse line in {scored_jsonl_path}: {e}")
                continue
    
    return problem_data


def extract_solution_from_candidate(candidate_text):
    """从 candidate 文本中提取解决方案（清理格式）"""
    # 移除可能的标记符号
    candidate_text = candidate_text.strip()
    
    # 移除 <|message|> 和 <|return|> 等标记
    if '<|message|>' in candidate_text:
        candidate_text = candidate_text.split('<|message|>')[-1]
    if '<|return|>' in candidate_text:
        candidate_text = candidate_text.split('<|return|>')[0]
    
    # 移除其他可能的标记
    candidate_text = candidate_text.strip()
    
    return candidate_text


def load_existing_grpo_jsonl(grpo_jsonl_path):
    """加载已存在的 grpo.jsonl 文件，返回已处理的问题集合"""
    existing_problems = set()
    if Path(grpo_jsonl_path).exists():
        with open(grpo_jsonl_path, 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if line:
                    try:
                        record = json.loads(line)
                        problem_name = record.get('problem_name')
                        if problem_name:
                            existing_problems.add(problem_name)
                    except json.JSONDecodeError:
                        continue
    return existing_problems


def write_grpo_jsonl(records, output_path, existing_problems=None):
    """将记录写入 grpo.jsonl 文件"""
    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    if existing_problems is None:
        existing_problems = load_existing_grpo_jsonl(str(output_path))
    
    # 过滤出新记录
    new_records = []
    for record in records:
        problem_name = record.get('problem_name')
        if problem_name and problem_name not in existing_problems:
            new_records.append(record)
            existing_problems.add(problem_name)
    
    # 写入文件（追加模式）
    if new_records:
        mode = 'a' if output_path.exists() else 'w'
        with open(output_path, mode, encoding='utf-8') as f:
            for record in new_records:
                f.write(json.dumps(record, ensure_ascii=False) + '\n')
    
    return len(new_records)


def generate_missing_solutions(scenario, domain_file, problems_dir, output_jsonl, model, temperatures, top_p, top_k):
    """对于缺失的问题，使用 generate_score_candidate.py 生成新的候选解"""
    script_path = Path(__file__).parent / "generate_score_candidate.py"
    
    if not script_path.exists():
        print(f"[Error] Script not found: {script_path}")
        return False
    
    cmd = [
        "python3", str(script_path),
        "--model", model,
        "--domain-file", domain_file,
        "--problems-dir", problems_dir,
        "--out", output_jsonl,
        "--temperatures"] + [str(t) for t in temperatures] + [
        "--top-p", str(top_p),
        "--top-k", str(top_k),
    ]
    
    print(f"[Info] Executing: python3 {script_path.name}")
    print(f"[Info]   --model {model}")
    print(f"[Info]   --domain-file {domain_file}")
    print(f"[Info]   --problems-dir {problems_dir}")
    print(f"[Info]   --out {output_jsonl}")
    print(f"[Info]   --temperatures {' '.join(str(t) for t in temperatures)}")
    print(f"[Info]   --top-p {top_p} --top-k {top_k}")
    
    try:
        # 实时输出进度
        process = subprocess.Popen(
            cmd, 
            stdout=subprocess.PIPE, 
            stderr=subprocess.STDOUT,
            text=True,
            bufsize=1,
            universal_newlines=True
        )
        
        # 实时打印输出
        for line in process.stdout:
            print(line.rstrip())
        
        process.wait()
        
        if process.returncode == 0:
            print(f"[Info] Generation completed successfully for {scenario}")
            return True
        else:
            print(f"[Error] Generation failed with return code {process.returncode}")
            return False
            
    except Exception as e:
        print(f"[Error] Failed to generate solutions for {scenario}: {e}")
        return False


def process_scenario(scenario, dpo_base_dir, grpo_base_dir, grpo_training_dir, domain_file, 
                     model, temperatures, top_p, top_k, dry_run=False, skip_missing=False, list_missing=False):
    """处理单个场景"""
    print(f"\n=== Processing scenario: {scenario} ===")
    
    # 路径配置
    scored_jsonl = Path(dpo_base_dir) / scenario / "pddl3" / "scored.jsonl"
    grpo_jsonl = Path(grpo_base_dir) / scenario / "pddl3" / "grpo.jsonl"
    
    # 1. 加载 grpo_training 目录下的问题
    grpo_problems = load_grpo_training_problems(grpo_training_dir)
    print(f"[Info] Found {len(grpo_problems)} problems in {grpo_training_dir}")
    
    # 2. 检查已存在的 grpo.jsonl 记录
    existing_problems = load_existing_grpo_jsonl(str(grpo_jsonl))
    if existing_problems:
        print(f"[Info] Found {len(existing_problems)} existing problems in {grpo_jsonl}")
    
    # 3. 加载 scored.jsonl
    scored_data = load_scored_jsonl(str(scored_jsonl))
    print(f"[Info] Found {len(scored_data)} unique problems in {scored_jsonl}")
    
    # 4. 找出需要处理的问题（排除已存在的）
    remaining_problems = grpo_problems - existing_problems
    overlapping_problems = remaining_problems & set(scored_data.keys())
    missing_problems = remaining_problems - set(scored_data.keys())
    
    print(f"[Info] Problems to process: {len(remaining_problems)}")
    print(f"[Info] Overlapping problems (from DPO): {len(overlapping_problems)}")
    print(f"[Info] Missing problems (need generation): {len(missing_problems)}")
    
    # 5. 处理重合的问题：从 scored.jsonl 中提取 solution
    merged_records = []
    for problem_name in overlapping_problems:
        records = scored_data[problem_name]
        
        # 选择最好的记录（优先选择 is_valid=True 且 score 最高的）
        best_record = None
        best_score = -1
        best_is_valid = False
        
        for record in records:
            score = record.get('score', 0)
            is_valid = record.get('is_valid', False)
            
            # 优先选择有效的解决方案
            # 如果当前记录有效且之前的记录无效，或者两者都有效/都无效但当前分数更高
            if is_valid and not best_is_valid:
                # 当前有效，之前无效，选择当前的
                best_record = record
                best_score = score
                best_is_valid = True
            elif is_valid == best_is_valid and score > best_score:
                # 有效性相同，选择分数更高的
                best_record = record
                best_score = score
                best_is_valid = is_valid
            elif not best_record:
                # 还没有选择任何记录，先选择这个
                best_record = record
                best_score = score
                best_is_valid = is_valid
        
        if best_record:
            # 提取并清理 candidate
            candidate = extract_solution_from_candidate(best_record.get('candidate', ''))
            
            # 构建新的记录（格式与 generate_score_candidate.py 输出一致）
            new_record = {
                "timestamp": best_record.get("timestamp", ""),
                "problem_name": problem_name,
                "problem_file": str(Path(grpo_training_dir) / f"{problem_name}.pddl"),
                "domain_file": domain_file,
                "prompt": best_record.get("prompt", ""),
                "candidate": candidate,
                "score": best_record.get("score", 0),
                "tag": best_record.get("tag", ""),
                "is_valid": best_record.get("is_valid", False),
                "val_message": best_record.get("val_message", ""),
                "val_stdout": best_record.get("val_stdout", "")[:2000],
                "val_stderr": best_record.get("val_stderr", "")[:2000],
                "val_cmd": best_record.get("val_cmd", ""),
                "sampling": best_record.get("sampling", {}),
                "model": best_record.get("model", model),
                "family": best_record.get("family", "gpt"),
            }
            merged_records.append(new_record)
    
    # 6. 写入重合问题的记录
    if merged_records:
        if not dry_run:
            written = write_grpo_jsonl(merged_records, str(grpo_jsonl), existing_problems)
            existing_problems.update(r.get('problem_name') for r in merged_records if r.get('problem_name'))
            print(f"[Info] Wrote {written} records to {grpo_jsonl}")
        else:
            print(f"[Dry-run] Would write {len(merged_records)} records to {grpo_jsonl}")
    
    # 7. 处理不重合的问题：生成新的候选解
    if missing_problems:
        print(f"\n[Info] ===== Found {len(missing_problems)} missing problems =====")
        
        # 列出所有缺失的问题
        missing_list = sorted(list(missing_problems))
        if list_missing:
            print(f"\n[Info] List of missing problems ({len(missing_list)} total):")
            for i, problem_name in enumerate(missing_list, 1):
                print(f"  {i}. {problem_name}")
            print(f"\n[Info] Use the following command to generate solutions for these problems:")
            script_name = Path(__file__).name
            print(f"  python3 script/{script_name} --scenario {scenario}")
            return len(overlapping_problems), len(missing_problems)
        
        if skip_missing:
            print(f"[Info] Skipping generation of missing problems (--skip-missing flag set)")
            print(f"[Info] Missing problems: {missing_list[:10]}")
            if len(missing_list) > 10:
                print(f"[Info] ... and {len(missing_list) - 10} more problems")
            print(f"[Info] To generate solutions for missing problems, run without --skip-missing flag")
            return len(overlapping_problems), len(missing_problems)
        
        print(f"[Info] Missing problems will be generated using generate_score_candidate.py")
        print(f"[Info] This may take a long time depending on the number of problems and model speed")
        
        # 显示一些缺失问题的示例
        sample_missing = missing_list[:5]
        print(f"[Info] Sample missing problems: {sample_missing}")
        if len(missing_problems) > 5:
            print(f"[Info] ... and {len(missing_problems) - 5} more problems")
        
        # 创建一个临时目录，只包含缺失的问题
        temp_problems_dir = Path(tempfile.mkdtemp(prefix=f"grpo_missing_{scenario}_"))
        print(f"[Info] Created temporary directory: {temp_problems_dir}")
        
        try:
            # 复制缺失的问题文件到临时目录
            copied_count = 0
            for problem_name in missing_problems:
                src_file = Path(grpo_training_dir) / f"{problem_name}.pddl"
                if src_file.exists():
                    shutil.copy2(src_file, temp_problems_dir / f"{problem_name}.pddl")
                    copied_count += 1
                else:
                    print(f"[Warn] Problem file not found: {src_file}")
            
            print(f"[Info] Copied {copied_count} problem files to temporary directory")
            
            if not dry_run:
                # 生成新的候选解（追加到现有文件）
                temp_output = temp_problems_dir / "temp_grpo.jsonl"
                print(f"[Info] Starting generation process...")
                print(f"[Info] This will generate candidates for {copied_count} problems")
                print(f"[Info] Using temperatures: {temperatures}, top-p: {top_p}, top-k: {top_k}")
                
                success = generate_missing_solutions(
                    scenario, domain_file, str(temp_problems_dir), 
                    str(temp_output), model, temperatures, top_p, top_k
                )
                
                if success and temp_output.exists():
                    # 读取生成的记录并追加到主文件
                    generated_records = []
                    problem_records = defaultdict(list)
                    
                    print(f"[Info] Reading generated solutions from {temp_output}")
                    with open(temp_output, 'r', encoding='utf-8') as f:
                        for line in f:
                            line = line.strip()
                            if line:
                                try:
                                    record = json.loads(line)
                                    # 更新 problem_file 路径
                                    record['problem_file'] = str(Path(grpo_training_dir) / f"{record['problem_name']}.pddl")
                                    problem_records[record['problem_name']].append(record)
                                except json.JSONDecodeError:
                                    continue
                    
                    # 对于每个问题，选择最佳候选（与处理重合问题时相同的逻辑）
                    for problem_name, records in problem_records.items():
                        best_record = None
                        best_score = -1
                        best_is_valid = False
                        
                        for record in records:
                            score = record.get('score', 0)
                            is_valid = record.get('is_valid', False)
                            
                            if is_valid and not best_is_valid:
                                best_record = record
                                best_score = score
                                best_is_valid = True
                            elif is_valid == best_is_valid and score > best_score:
                                best_record = record
                                best_score = score
                                best_is_valid = is_valid
                            elif not best_record:
                                best_record = record
                                best_score = score
                                best_is_valid = is_valid
                        
                        if best_record:
                            generated_records.append(best_record)
                    
                    # 写入记录（使用 write_grpo_jsonl 避免重复）
                    if generated_records:
                        written = write_grpo_jsonl(generated_records, str(grpo_jsonl), existing_problems)
                        print(f"[Info] Successfully appended {written} generated solutions to {grpo_jsonl}")
                        print(f"[Info] Each problem has one best candidate selected from generated candidates")
                    else:
                        print(f"[Warn] No valid records found in generated output")
                else:
                    print(f"[Error] Generation failed or output file not found")
            else:
                print(f"[Dry-run] Would generate solutions for {len(missing_problems)} problems")
                print(f"[Dry-run] Temporary directory would be: {temp_problems_dir}")
        finally:
            # 清理临时目录
            if temp_problems_dir.exists():
                print(f"[Info] Cleaning up temporary directory: {temp_problems_dir}")
                shutil.rmtree(temp_problems_dir)
    else:
        print(f"[Info] No missing problems, all solutions are from DPO data")
    
    return len(overlapping_problems), len(missing_problems)


def main():
    parser = argparse.ArgumentParser(description="合并 DPO scored.jsonl 到 GRPO grpo.jsonl")
    parser.add_argument("--scenario", default="blocksworld", 
                       choices=["blocksworld", "grippers", "ferry", "spanner", "delivery"],
                       help="要处理的场景")
    parser.add_argument("--dpo-base-dir", default="/home/ubuntu/data/dpo/gpt_multi_pddl3_500",
                       help="DPO 数据基础目录")
    parser.add_argument("--grpo-base-dir", default="/home/ubuntu/data/grpo/gpt_multi_pddl3_500",
                       help="GRPO 数据基础目录")
    parser.add_argument("--grpo-training-dir", 
                       default="/home/ubuntu/Safety-gen/blocksworld/grpo_training",
                       help="GRPO training 目录")
    parser.add_argument("--domain-file", 
                       default="/home/ubuntu/Safety-gen/blocksworld/domain3.pddl",
                       help="Domain 文件路径")
    parser.add_argument("--model", default="/home/ubuntu/sft_models/gpt_multi_pddl3_500",
                       help="模型路径")
    parser.add_argument("--temperatures", type=float, nargs="+", default=[0.6, 0.9],
                       help="采样温度列表")
    parser.add_argument("--top-p", type=float, default=0.9, help="top_p 参数")
    parser.add_argument("--top-k", type=int, default=50, help="top_k 参数")
    parser.add_argument("--dry-run", action="store_true",
                       help="干运行模式，不实际写入文件")
    parser.add_argument("--skip-missing", action="store_true",
                       help="跳过生成缺失问题的解，只处理重合的问题")
    parser.add_argument("--list-missing", action="store_true",
                       help="只列出缺失的问题，不进行处理")
    
    args = parser.parse_args()
    
    # 场景特定的路径映射
    scenario_paths = {
        "blocksworld": {
            "grpo_training_dir": "/home/ubuntu/Safety-gen/blocksworld/grpo_training",
            "domain_file": "/home/ubuntu/Safety-gen/blocksworld/domain3.pddl",
        },
        "grippers": {
            "grpo_training_dir": "/home/ubuntu/Safety-gen/grippers/grpo_training",
            "domain_file": "/home/ubuntu/Safety-gen/grippers/domain3.pddl",
        },
        "ferry": {
            "grpo_training_dir": "/home/ubuntu/Safety-gen/ferry/grpo_training",
            "domain_file": "/home/ubuntu/Safety-gen/ferry/domain3.pddl",
        },
        "spanner": {
            "grpo_training_dir": "/home/ubuntu/Safety-gen/spanner/grpo_training",
            "domain_file": "/home/ubuntu/Safety-gen/spanner/domain3.pddl",
        },
        "delivery": {
            "grpo_training_dir": "/home/ubuntu/Safety-gen/delivery/grpo_training",
            "domain_file": "/home/ubuntu/Safety-gen/delivery/domain3.pddl",
        },
    }
    
    # 使用场景特定的路径
    if args.scenario in scenario_paths:
        grpo_training_dir = scenario_paths[args.scenario]["grpo_training_dir"]
        domain_file = scenario_paths[args.scenario]["domain_file"]
    else:
        grpo_training_dir = args.grpo_training_dir
        domain_file = args.domain_file
    
    # 处理场景
    overlapping, missing = process_scenario(
        args.scenario,
        args.dpo_base_dir,
        args.grpo_base_dir,
        grpo_training_dir,
        domain_file,
        args.model,
        args.temperatures,
        args.top_p,
        args.top_k,
        args.dry_run,
        args.skip_missing,
        args.list_missing
    )
    
    print(f"\n=== Summary ===")
    print(f"Overlapping problems: {overlapping}")
    print(f"Missing problems: {missing}")
    print("Done!")


if __name__ == "__main__":
    main()

