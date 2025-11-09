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
import shutil
from pathlib import Path
from collections import defaultdict
import argparse


def load_grpo_training_problems(grpo_training_dir, missing_problems_dir=None):
    """
    加载 grpo_training 目录下的所有问题文件名（不含扩展名）
    如果提供了 missing_problems_dir，也会从该目录加载问题
    """
    problems = set()
    grpo_dir = Path(grpo_training_dir)
    if not grpo_dir.exists():
        print(f"[Warn] Directory {grpo_training_dir} does not exist")
    else:
        for pddl_file in grpo_dir.glob("*.pddl"):
            if "domain" not in pddl_file.name.lower():
                problems.add(pddl_file.stem)
    
    # 如果提供了 missing_problems_dir，也从中加载问题
    if missing_problems_dir:
        missing_dir = Path(missing_problems_dir)
        if missing_dir.exists():
            missing_count = 0
            for pddl_file in missing_dir.glob("*.pddl"):
                if "domain" not in pddl_file.name.lower():
                    problems.add(pddl_file.stem)
                    missing_count += 1
            if missing_count > 0:
                print(f"[Info] Also found {missing_count} problems in {missing_problems_dir}")
    
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
    """
    加载已存在的 grpo.jsonl 文件，返回已处理的问题集合。
    支持两种格式：
    1. Candidates 格式：{problem_name, candidate, ...}
    2. GRPO pairs 格式：{prompt, chosen, rejected, meta: {problem_key, ...}}
    """
    existing_problems = set()
    if Path(grpo_jsonl_path).exists():
        with open(grpo_jsonl_path, 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if line:
                    try:
                        record = json.loads(line)
                        # 检查是否是 candidates 格式
                        problem_name = record.get('problem_name')
                        if problem_name:
                            existing_problems.add(problem_name)
                        else:
                            # 检查是否是 GRPO pairs 格式
                            meta = record.get('meta', {})
                            problem_key = meta.get('problem_key', '')
                            if problem_key:
                                # problem_key 格式: "scenario/problem_name"
                                # 提取 problem_name
                                if '/' in problem_key:
                                    _, problem_name_from_key = problem_key.split('/', 1)
                                    existing_problems.add(problem_name_from_key)
                                else:
                                    existing_problems.add(problem_key)
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


def _is_grpo_pairs_format(file_path: Path) -> bool:
    """检查文件是否是 GRPO pairs 格式（包含 chosen/rejected）而不是 candidates 格式"""
    if not file_path.exists():
        return False
    try:
        with file_path.open('r', encoding='utf-8') as f:
            first_line = f.readline().strip()
            if first_line:
                record = json.loads(first_line)
                # GRPO pairs 格式有 chosen 和 rejected，但没有 problem_name
                if 'chosen' in record and 'rejected' in record and 'problem_name' not in record:
                    return True
    except:
        pass
    return False


def process_scenario(scenario, dpo_base_dir, grpo_base_dir, grpo_training_dir, domain_file, 
                     model, temperatures, top_p, top_k, dry_run=False, skip_missing=False, list_missing=False):
    """处理单个场景"""
    print(f"\n=== Processing scenario: {scenario} ===")
    
    # 路径配置
    scored_jsonl = Path(dpo_base_dir) / scenario / "pddl3" / "scored.jsonl"
    grpo_jsonl = Path(grpo_base_dir) / scenario / "pddl3" / "grpo.jsonl"
    candidates_jsonl = Path(grpo_base_dir) / scenario / "pddl3" / "candidates.jsonl"
    
    # 始终使用 candidates.jsonl 作为输出文件
    # grpo.jsonl 应该保留为最终的 GRPO pairs 格式（由 construct_grpo_dataset.py 生成）
    output_jsonl = candidates_jsonl
    
    # 如果 grpo.jsonl 是 pairs 格式，这是正常的（它是最终输出）
    # 我们只需要确保使用 candidates.jsonl 作为 candidates 的输出
    if _is_grpo_pairs_format(grpo_jsonl):
        print(f"[Info] grpo.jsonl contains GRPO pairs format (this is expected for final output)")
        print(f"[Info] Will use candidates.jsonl for candidates output")
    elif grpo_jsonl.exists() and not _is_grpo_pairs_format(grpo_jsonl):
        # 如果 grpo.jsonl 是 candidates 格式，我们需要迁移到 candidates.jsonl
        print(f"[Info] grpo.jsonl contains candidates format, migrating to candidates.jsonl")
        if not dry_run and candidates_jsonl.exists():
            # 合并现有的 candidates.jsonl 和 grpo.jsonl
            print(f"[Info] Merging existing candidates from grpo.jsonl into candidates.jsonl")
            # 读取 grpo.jsonl 中的候选解并追加到 candidates.jsonl
            existing_in_grpo = set()
            with grpo_jsonl.open('r', encoding='utf-8') as f:
                for line in f:
                    line = line.strip()
                    if line:
                        try:
                            record = json.loads(line)
                            problem_name = record.get('problem_name')
                            if problem_name:
                                existing_in_grpo.add(problem_name)
                                # 检查是否已在 candidates.jsonl 中
                                found = False
                                if candidates_jsonl.exists():
                                    with candidates_jsonl.open('r', encoding='utf-8') as cf:
                                        for cline in cf:
                                            cline = cline.strip()
                                            if cline:
                                                try:
                                                    crecord = json.loads(cline)
                                                    if crecord.get('problem_name') == problem_name:
                                                        found = True
                                                        break
                                                except:
                                                    pass
                                # 如果不存在，追加到 candidates.jsonl
                                if not found:
                                    with candidates_jsonl.open('a', encoding='utf-8') as cf:
                                        cf.write(line + '\n')
                        except:
                            pass
            if existing_in_grpo:
                print(f"[Info] Migrated {len(existing_in_grpo)} candidates from grpo.jsonl to candidates.jsonl")
                # 备份旧的 grpo.jsonl（可以稍后删除或保留）
                backup_path = grpo_jsonl.with_suffix('.jsonl.candidates_backup')
                if not backup_path.exists():
                    shutil.copy2(grpo_jsonl, backup_path)
                    print(f"[Info] Backed up old grpo.jsonl to {backup_path}")
                # 删除旧的 candidates 格式的 grpo.jsonl，因为它应该只包含 pairs
                grpo_jsonl.unlink()
                print(f"[Info] Removed candidates format from grpo.jsonl (it should only contain pairs)")
    
    # 1. 加载 grpo_training 目录下的问题
    # 同时也检查 missing_problems 目录（如果存在），以便处理之前生成但未完成的问题
    missing_problems_dir = Path(grpo_base_dir) / scenario / "pddl3" / "missing_problems"
    grpo_problems = load_grpo_training_problems(grpo_training_dir, 
                                                 missing_problems_dir if missing_problems_dir.exists() else None)
    print(f"[Info] Found {len(grpo_problems)} problems in {grpo_training_dir}" + 
          (f" (including {missing_problems_dir})" if missing_problems_dir.exists() else ""))
    
    # 2. 检查已存在的记录（优先检查 candidates.jsonl，如果不存在则检查 grpo.jsonl）
    # 注意：这里检查的是所有问题的候选解，不仅仅是缺失问题的
    existing_problems = set()
    if candidates_jsonl.exists():
        existing_problems = load_existing_grpo_jsonl(str(candidates_jsonl))
        if existing_problems:
            print(f"[Info] Found {len(existing_problems)} existing problems in {candidates_jsonl}")
    if not existing_problems and grpo_jsonl.exists() and not _is_grpo_pairs_format(grpo_jsonl):
        existing_problems = load_existing_grpo_jsonl(str(grpo_jsonl))
        if existing_problems:
            print(f"[Info] Found {len(existing_problems)} existing problems in {grpo_jsonl}")
    
    # 更新 output_jsonl 对应的 existing_problems（用于后续检查）
    # 如果 output_jsonl 是 candidates_jsonl，existing_problems 已经包含了
    # 如果 output_jsonl 是其他文件，需要重新加载
    if output_jsonl != candidates_jsonl and output_jsonl.exists():
        output_existing = load_existing_grpo_jsonl(str(output_jsonl))
        if output_existing:
            existing_problems = existing_problems | output_existing
            print(f"[Info] Also found {len(output_existing)} problems in {output_jsonl}")
            print(f"[Info] Total existing problems: {len(existing_problems)}")
    
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
            
            # 确定问题文件的正确路径
            # 优先检查 missing_problems 目录，如果不存在则使用 grpo_training_dir
            problem_file_path = None
            missing_problem_file = missing_problems_dir / f"{problem_name}.pddl" if missing_problems_dir.exists() else None
            training_problem_file = Path(grpo_training_dir) / f"{problem_name}.pddl"
            
            if missing_problem_file and missing_problem_file.exists():
                problem_file_path = str(missing_problem_file)
            elif training_problem_file.exists():
                problem_file_path = str(training_problem_file)
            else:
                # 如果两个位置都不存在，使用 grpo_training_dir 路径（可能会在后续处理中创建）
                problem_file_path = str(training_problem_file)
            
            # 构建新的记录（格式与 generate_score_candidate.py 输出一致）
            new_record = {
                "timestamp": best_record.get("timestamp", ""),
                "problem_name": problem_name,
                "problem_file": problem_file_path,
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
            written = write_grpo_jsonl(merged_records, str(output_jsonl), existing_problems)
            existing_problems.update(r.get('problem_name') for r in merged_records if r.get('problem_name'))
            print(f"[Info] Wrote {written} records to {output_jsonl}")
        else:
            print(f"[Dry-run] Would write {len(merged_records)} records to {output_jsonl}")
    
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
        
        if not dry_run:
            # 创建一个永久目录，只包含缺失的问题
            # 保存在 grpo_base_dir/scenario/pddl3/missing_problems/ 目录下
            problems_dir = Path(grpo_base_dir) / scenario / "pddl3" / "missing_problems"
            problems_dir.mkdir(parents=True, exist_ok=True)
            print(f"[Info] Using problems directory: {problems_dir}")
            
            # 生成的 JSONL 文件保存路径（与 output_jsonl 相同）
            generated_jsonl = output_jsonl
            print(f"[Info] Generated candidates will be saved to: {generated_jsonl}")
            
            # 在生成之前，先检查 candidates.jsonl 中是否已经有缺失问题的候选解
            # 同时检查 missing_problems 目录下是否有之前生成的候选解文件需要合并
            print(f"[Info] Checking for existing candidates of missing problems...")
            existing_missing_problems = set()
            
            # 1. 检查 output_jsonl（candidates.jsonl）中是否已有缺失问题的候选解
            if output_jsonl.exists():
                try:
                    # 重新读取 output_jsonl，检查缺失问题的候选解
                    # 这样可以获取最新的候选解信息（即使 existing_problems 是之前读取的）
                    with output_jsonl.open('r', encoding='utf-8') as f:
                        for line in f:
                            line = line.strip()
                            if line:
                                try:
                                    record = json.loads(line)
                                    problem_name = record.get('problem_name')
                                    if problem_name and problem_name in missing_problems:
                                        existing_missing_problems.add(problem_name)
                                except:
                                    pass
                    
                    if existing_missing_problems:
                        print(f"[Info] Found {len(existing_missing_problems)} missing problems that already have candidates in {output_jsonl.name}")
                        if len(existing_missing_problems) <= 10:
                            print(f"[Info]   Problems with existing candidates: {sorted(list(existing_missing_problems))}")
                        else:
                            print(f"[Info]   Sample: {sorted(list(existing_missing_problems))[:5]} ... and {len(existing_missing_problems) - 5} more")
                except Exception as e:
                    print(f"[Warn] Failed to check {output_jsonl.name} for existing candidates: {e}")
            
            # 2. 检查 missing_problems 目录下是否有候选解文件需要合并
            # 可能的候选解文件位置：
            # - problems_dir 目录下的 JSONL 文件（如果之前单独生成过）
            # - problems_dir 的父目录下的候选解文件
            # - 其他可能的临时文件
            missing_candidates_files = []
            
            # 检查 problems_dir 目录下是否有 JSONL 文件
            if problems_dir.exists():
                for jsonl_file in problems_dir.glob("*.jsonl"):
                    if jsonl_file.is_file():
                        missing_candidates_files.append(jsonl_file)
                        print(f"[Info] Found candidate file in missing_problems directory: {jsonl_file.name}")
            
            # 检查 problems_dir 的父目录（pddl3目录）下是否有其他候选解文件
            pddl3_dir = problems_dir.parent
            if pddl3_dir.exists():
                # 检查是否有 generated_candidates.jsonl 或其他可能的候选解文件
                for pattern in ["generated_candidates.jsonl", "missing_*.jsonl", "temp_*.jsonl"]:
                    for jsonl_file in pddl3_dir.glob(pattern):
                        if jsonl_file.is_file() and jsonl_file != output_jsonl:
                            missing_candidates_files.append(jsonl_file)
                            print(f"[Info] Found candidate file in pddl3 directory: {jsonl_file.name}")
            
            # 3. 从找到的候选解文件中读取缺失问题的候选解
            if missing_candidates_files:
                print(f"[Info] Checking {len(missing_candidates_files)} candidate file(s) for missing problems...")
                candidates_to_merge = []
                problems_found_in_files = set()
                
                for candidates_file in missing_candidates_files:
                    try:
                        with open(candidates_file, 'r', encoding='utf-8') as f:
                            for line in f:
                                line = line.strip()
                                if line:
                                    try:
                                        record = json.loads(line)
                                        problem_name = record.get('problem_name')
                                        if problem_name and problem_name in missing_problems:
                                            # 只处理尚未有候选解的问题
                                            if problem_name not in existing_missing_problems:
                                                # 更新 problem_file 路径
                                                # 优先使用 missing_problems 目录中的文件，如果不存在则使用 grpo_training_dir
                                                missing_problem_file = problems_dir / f"{problem_name}.pddl"
                                                training_problem_file = Path(grpo_training_dir) / f"{problem_name}.pddl"
                                                
                                                if missing_problem_file.exists():
                                                    record['problem_file'] = str(missing_problem_file)
                                                elif training_problem_file.exists():
                                                    record['problem_file'] = str(training_problem_file)
                                                else:
                                                    record['problem_file'] = str(training_problem_file)
                                                
                                                candidates_to_merge.append(record)
                                                problems_found_in_files.add(problem_name)
                                    except json.JSONDecodeError:
                                        continue
                    except Exception as e:
                        print(f"[Warn] Failed to read candidate file {candidates_file}: {e}")
                
                # 4. 合并找到的候选解到 output_jsonl
                if candidates_to_merge:
                    print(f"[Info] Found {len(candidates_to_merge)} candidates for {len(problems_found_in_files)} missing problems in candidate file(s)")
                    print(f"[Info] Merging these candidates into {output_jsonl.name}...")
                    
                    # 按问题名称分组，每个问题选择最佳候选解
                    problem_records = defaultdict(list)
                    for record in candidates_to_merge:
                        problem_name = record.get('problem_name')
                        if problem_name:
                            problem_records[problem_name].append(record)
                    
                    # 对每个问题选择最佳候选解（与处理重合问题时相同的逻辑）
                    best_candidates = []
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
                            best_candidates.append(best_record)
                    
                    # 写入最佳候选解
                    if best_candidates:
                        written = write_grpo_jsonl(best_candidates, str(output_jsonl), existing_problems)
                        existing_missing_problems.update(problems_found_in_files)
                        existing_problems.update(problems_found_in_files)  # 更新 existing_problems，避免后续重复处理
                        print(f"[Info] Merged {written} candidates from candidate file(s) into {output_jsonl.name}")
                        print(f"[Info]   Each problem has one best candidate selected from available candidates")
                        if len(problems_found_in_files) > 0:
                            print(f"[Info]   Problems merged from candidate files: {len(problems_found_in_files)}")
                            if len(problems_found_in_files) <= 10:
                                print(f"[Info]   Merged problems: {sorted(list(problems_found_in_files))}")
                else:
                    print(f"[Info] No candidates found for missing problems in candidate file(s)")
            
            if not existing_missing_problems and not missing_candidates_files:
                print(f"[Info] No existing candidates found for missing problems")
            
            # 找出真正需要生成的问题（不在现有候选解中的）
            problems_to_generate = missing_problems - existing_missing_problems
            
            # 只复制需要生成的问题文件到永久目录
            # 优先从 missing_problems 目录查找，如果不存在则从 grpo_training_dir 复制
            if problems_to_generate:
                copied_count = 0
                already_exists_count = 0
                for problem_name in problems_to_generate:
                    # 首先检查 missing_problems 目录是否已有该文件
                    existing_file = problems_dir / f"{problem_name}.pddl"
                    if existing_file.exists():
                        already_exists_count += 1
                        continue
                    
                    # 如果 missing_problems 目录中没有，从 grpo_training_dir 复制
                    src_file = Path(grpo_training_dir) / f"{problem_name}.pddl"
                    if src_file.exists():
                        dst_file = problems_dir / f"{problem_name}.pddl"
                        shutil.copy2(src_file, dst_file)
                        copied_count += 1
                    else:
                        # 如果 grpo_training_dir 中也没有，检查是否在 missing_problems_dir 中（已经在加载时包含了）
                        # 这种情况下，文件可能已经在 missing_problems 目录中，但路径不同
                        # 这应该不会发生，因为我们已经检查了 existing_file
                        print(f"[Warn] Problem file not found in {grpo_training_dir} or {problems_dir}: {problem_name}.pddl")
                
                if copied_count > 0:
                    print(f"[Info] Copied {copied_count} problem files to {problems_dir}")
                if already_exists_count > 0:
                    print(f"[Info] {already_exists_count} problem files already exist in {problems_dir} (skipped copying)")
            else:
                print(f"[Info] No problem files to copy - all missing problems already have candidates")
            
            if problems_to_generate:
                print(f"[Info] Need to generate candidates for {len(problems_to_generate)} problems")
                print(f"[Info] Starting generation process...")
                print(f"[Info] Using temperatures: {temperatures}, top-p: {top_p}, top-k: {top_k}")
                
                # 只生成缺失问题的候选解
                # 注意：generate_score_candidate.py 会对 problems_dir 中的所有问题生成候选解
                # 所以我们需要确保 problems_dir 中只包含需要生成的问题
                # 但是，由于我们已经将所有缺失问题复制到了 problems_dir，这里可能会有一些重复
                # 不过没关系，generate_score_candidate.py 会处理所有问题，我们后续会过滤
                success = generate_missing_solutions(
                    scenario, domain_file, str(problems_dir), 
                    str(generated_jsonl), model, temperatures, top_p, top_k
                )
            else:
                print(f"[Info] All missing problems already have candidates in {output_jsonl}, skipping generation")
                success = True
            
            if success:
                # 读取生成的记录并追加到主文件
                generated_records = []
                problem_records = defaultdict(list)
                
                # 读取新生成的候选解（只处理真正需要生成的问题）
                if problems_to_generate and generated_jsonl.exists():
                    print(f"[Info] Reading newly generated solutions from {generated_jsonl}")
                    with open(generated_jsonl, 'r', encoding='utf-8') as f:
                        for line in f:
                            line = line.strip()
                            if line:
                                try:
                                    record = json.loads(line)
                                    problem_name = record.get('problem_name')
                                    # 只处理需要生成的问题，避免重复处理已有候选解的问题
                                    if problem_name and problem_name in problems_to_generate:
                                        # 更新 problem_file 路径
                                        # 优先使用 missing_problems 目录中的文件，如果不存在则使用 grpo_training_dir
                                        missing_problem_file = problems_dir / f"{problem_name}.pddl"
                                        training_problem_file = Path(grpo_training_dir) / f"{problem_name}.pddl"
                                        
                                        if missing_problem_file.exists():
                                            record['problem_file'] = str(missing_problem_file)
                                        elif training_problem_file.exists():
                                            record['problem_file'] = str(training_problem_file)
                                        else:
                                            # 如果都不存在，使用 grpo_training_dir 路径
                                            record['problem_file'] = str(training_problem_file)
                                        
                                        problem_records[problem_name].append(record)
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
                    written = write_grpo_jsonl(generated_records, str(output_jsonl), existing_problems)
                    print(f"[Info] Successfully appended {written} solutions to {output_jsonl}")
                    if existing_missing_problems:
                        print(f"[Info]   - {len(existing_missing_problems)} problems already had candidates (skipped)")
                    if problems_to_generate:
                        print(f"[Info]   - {len(generated_records)} problems from newly generated candidates")
                    print(f"[Info] Each problem has one best candidate selected from available candidates")
                    if generated_jsonl.exists() and generated_jsonl != output_jsonl:
                        print(f"[Info] All newly generated candidates (before selection) are saved in: {generated_jsonl}")
                elif not problems_to_generate:
                    print(f"[Info] No new candidates to add - all missing problems already have candidates")
                else:
                    print(f"[Warn] No valid records found in generated output")
            else:
                print(f"[Error] Generation failed or output file not found")
        else:
            # Dry-run mode: 计算需要生成的问题
            problems_dir = Path(grpo_base_dir) / scenario / "pddl3" / "missing_problems"
            generated_jsonl = output_jsonl
            
            # 在 dry-run 模式下也检查 candidates.jsonl 中是否有缺失问题的候选解
            print(f"[Dry-run] Checking {generated_jsonl.name} for existing candidates of missing problems...")
            existing_missing_problems = set()
            
            if generated_jsonl.exists():
                try:
                    # 检查 candidates.jsonl 中是否有缺失问题的候选解
                    with generated_jsonl.open('r', encoding='utf-8') as f:
                        for line in f:
                            line = line.strip()
                            if line:
                                try:
                                    record = json.loads(line)
                                    problem_name = record.get('problem_name')
                                    if problem_name and problem_name in missing_problems:
                                        existing_missing_problems.add(problem_name)
                                except:
                                    pass
                    
                    if existing_missing_problems:
                        print(f"[Dry-run] Found {len(existing_missing_problems)} missing problems that already have candidates in {generated_jsonl.name}")
                        print(f"[Dry-run]   These problems would be skipped (already have candidates)")
                        if len(existing_missing_problems) <= 10:
                            print(f"[Dry-run]   Problems with existing candidates: {sorted(list(existing_missing_problems))}")
                        else:
                            print(f"[Dry-run]   Sample: {sorted(list(existing_missing_problems))[:5]} ... and {len(existing_missing_problems) - 5} more")
                    else:
                        print(f"[Dry-run] No missing problems found with existing candidates in {generated_jsonl.name}")
                except Exception as e:
                    print(f"[Dry-run] Failed to check {generated_jsonl.name}: {e}")
                    # 如果检查失败，回退到使用 existing_problems
                    existing_missing_problems = missing_problems & existing_problems
            else:
                print(f"[Dry-run] {generated_jsonl.name} does not exist, would create new file")
            
            # 计算需要生成的问题
            problems_to_generate = missing_problems - existing_missing_problems
            
            print(f"\n[Dry-run] Summary:")
            print(f"[Dry-run]   Total missing problems: {len(missing_problems)}")
            print(f"[Dry-run]   Already have candidates: {len(existing_missing_problems)}")
            print(f"[Dry-run]   Need generation: {len(problems_to_generate)}")
            if problems_to_generate:
                print(f"[Dry-run]   Sample problems to generate: {sorted(list(problems_to_generate))[:5]}")
            print(f"[Dry-run] Problems directory would be: {problems_dir}")
            print(f"[Dry-run] Generated JSONL would be saved to: {generated_jsonl}")
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

